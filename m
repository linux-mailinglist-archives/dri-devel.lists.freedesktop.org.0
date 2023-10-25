Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8CB7D63FC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB2E10E57A;
	Wed, 25 Oct 2023 07:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E94910E57B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:49:50 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5a87ac9d245so54025217b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698220189; x=1698824989; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1mPZL+BmecJLI1raShNlD/spbj5/yWrHF1o5a2NHN48=;
 b=xrHlVU7hILNxbjkjUC3xx48SlcmPxAe++TggqSHI6t+1u3zbu8NSIwrzYEFKhC5gSL
 w/jRUchlxnFldgzsYdRGSwbF8ttyOhQ3mzVewJ+yaNtkUjLtO46PwAeN58GTjqzQ6E/R
 XAIhEFj+6t7l2vlbu18yIDD+1rZovXkbomDfnjEHH6ZCMAElQ4a/OpTU3iGvsaXCCRHe
 NC1Y8KdrjFDbgKH2Mr1S9B/VQW8YtuoddifD4YQl8xsp7LoG4n4mSUSw9xbz/5MxxAgv
 eJNwo+rFmD2444zs6bmWaw5xqa+JHhKj4THuzaeQilLlDb2l3dVivgVNcu0u/YEUbUy0
 mVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698220189; x=1698824989;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1mPZL+BmecJLI1raShNlD/spbj5/yWrHF1o5a2NHN48=;
 b=m019w3a1M1qmyMOfcb2aLoYuV5NkpHByQ0XOklth5Ezt4HdRi4HICOcwUre/FyqhSM
 SiPHOEcQcr5omr4LFZmtQ6ocVl21y/uXVKDozkYeKvJNQ7yV/J8CyM+eby+ukSfvMRvA
 Ckvr+2KlAVd/EasqRBbOVDZD9CZxHlU0BZJ1zFnPngFL2AN5rIuVJmWHO7yPwx3T06g0
 4n0cMAbtDTAamW94v/Sc9T6n6b9k6rL7RjKzuCF8I9bqRBcmuZTwcZ9WcMKeBcb8EZk1
 vLbW5po1SPvmrG1aMEKctkSLeo7yeuQAJ4PZHEBydDwKvfbFGTZGSu2xtoAGxJS1IfLC
 n0Pg==
X-Gm-Message-State: AOJu0YxEQszmK2nQ9bGZW1LxC+adhA+Bct7KeD3t7Q9S+dCcgNYEXwtk
 pA5Bgh1yM9lqqGO9q9dcUAviUYwA93+eUPKS24l5EQ==
X-Google-Smtp-Source: AGHT+IFkibsCTPletgNIKgRFCG8zEbKtKhuMRGWu9dJ/Z2gpcZTNPiloV3NsJSBSfNWJPl9BX6pmshk2fW6iQLs8Y18=
X-Received: by 2002:a25:dc04:0:b0:da0:4576:3689 with SMTP id
 y4-20020a25dc04000000b00da045763689mr3713196ybe.25.1698220189116; Wed, 25 Oct
 2023 00:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
 <20231025-topic-sm8650-upstream-mdss-v1-6-bb219b8c7a51@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-mdss-v1-6-bb219b8c7a51@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Oct 2023 10:49:38 +0300
Message-ID: <CAA8EJpqSuX=BL3x7p3SUaRQ8JLtVOQNM4Cf6LojYKV66OyOJqA@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/msm: mdss: add support for SM8650
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Oct 2023 at 10:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add Mobile Display Subsystem (MDSS) support for the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 6865db1e3ce8..33947a2e313c 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -621,6 +621,7 @@ static const struct of_device_id mdss_dt_match[] = {
>         { .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
>         { .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
>         { .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
> +       { .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, mdss_dt_match);
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
