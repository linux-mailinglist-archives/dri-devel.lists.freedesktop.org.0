Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5106840969
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 16:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF9210F75F;
	Mon, 29 Jan 2024 15:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E580C10F75F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 15:12:36 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dc22597dbfeso3594502276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 07:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706541096; x=1707145896; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bzxGAI3uTZ4t8Yu0tkeNdDJhjt+ClUZzfi+ZIweVgvk=;
 b=kpBoY+oBxYkcBTr81l6uQprNsD01+9s0NX/puVlolDDKp62rtnA/sTtmoqGfII5L4F
 LHPay4SkifcTL/xM5CG+P+Esvq9BAqN6yLlA/ea6DksbfGXbVWcaTwOlkJTMEY3T8grq
 RXNFeUTNmORmT5P1EOtiQh5yzNQ3GiCsQgnA37PZd//BRe2RYnHB9e1FmK9tbYWqQEQr
 GKKP6OFiozu3nbz+aublPr49z5M7aUgMYXPbYP/4C9cRnuZNx1Lkr34Us2Eq9CCkQZb0
 2TQDLsjX2SfLtgUCCfbu7OBhud0jPMJPioE51EfeYXQclqCqZDHG7tKCa/7osJh6ve6I
 NfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706541096; x=1707145896;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bzxGAI3uTZ4t8Yu0tkeNdDJhjt+ClUZzfi+ZIweVgvk=;
 b=fl1jfCP9x0yLi9shPS6tQUARprDNB7qqALaJcQn3J+zZpBARYWoDBEKiBg7taa03iu
 1ZPe0sm6g4sdAwsypRiC4z0WpFbme5QmVn6q78Goxk6B0tkmPvh3RLvoyA0Uwmh85zqR
 0PexoxViuwMNjez87FHRdLSZiiceQEeT4xX1rMykw4MTOZds0CpyacZE4MB1K5mYutfH
 hWcaWw+MY9vHJ9w9/ejOXskqCml0Q1L0e0i6bdQuW01uusyVx0/WYMHV/aaKwV7IY2My
 Ce+U+JEcLKNP4DdW+pB2SUeNfRNH/FpdtcLOKW7Jtf5YXD4zwCtjO494/Ej3r+0ZjHrz
 KdIw==
X-Gm-Message-State: AOJu0YxVFL5UKkKANuYHvYEp8W5vHmrlSH8ZgGzMuN3Y6LLIma5tXOPZ
 pILDK/L2qCD6MYIyPQ1wXw6l+g8zX49ihvgw4/2RaHFzIiCxyLRifQzznC+/MDN2L8ssGmlpwXf
 7n75XFqARQiIJdgF3BN758AoHg52fLUTE3GZ5YQ==
X-Google-Smtp-Source: AGHT+IGTMQ/BAh4UMgioJdLPcXsz/GX4p8hJbTGo1lQCHr2AEV10T3HvflCpK8wmeYx9XsAaaWkgqAghpN7LLUDOvks=
X-Received: by 2002:a05:6902:2808:b0:dbd:ac60:bcd4 with SMTP id
 ed8-20020a056902280800b00dbdac60bcd4mr4890852ybb.75.1706541096178; Mon, 29
 Jan 2024 07:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-3-0d9eb8254df0@linaro.org>
In-Reply-To: <20240129-x1e80100-display-v1-3-0d9eb8254df0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 17:11:25 +0200
Message-ID: <CAA8EJponbo2vvuj2ftCQuxtrZp0w7JQqJ_ADF80Wd2y1V74BzA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add X1E80100 support
To: Abel Vesa <abel.vesa@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add support for MDSS on X1E80100.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 455b2e3a0cdd..eddf7fdbb60a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -564,6 +564,15 @@ static const struct msm_mdss_data sdm670_data = {
>         .highest_bank_bit = 1,
>  };
>
> +static const struct msm_mdss_data x1e80100_data = {
> +       .ubwc_enc_version = UBWC_4_0,
> +       .ubwc_dec_version = UBWC_4_3,
> +       .ubwc_swizzle = 6,
> +       .ubwc_static = 1,
> +       .highest_bank_bit = 2,
> +       .macrotile_mode = 1,

Missing .reg_bus_bw, LGTM otherwise

> +};
> +
>  static const struct msm_mdss_data sdm845_data = {
>         .ubwc_enc_version = UBWC_2_0,
>         .ubwc_dec_version = UBWC_2_0,
> @@ -655,6 +664,7 @@ static const struct of_device_id mdss_dt_match[] = {
>         { .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
>         { .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
>         { .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
> +       { .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
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
