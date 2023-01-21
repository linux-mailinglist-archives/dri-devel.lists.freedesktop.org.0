Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BB4676520
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 09:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315C410E183;
	Sat, 21 Jan 2023 08:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A103410E16C
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 08:42:05 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id p25so7965958ljn.12
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rtcfHZAR7Ysq5XNRm/jCy3LiiJsqdTUfh0gGDYHtMjI=;
 b=ttPttT4fXeRLAIGUhnlOd/e1nfyPSbx1mjkJhmM+Nxee/NpQkGX06mVqwSY0Hh9Xkn
 DrQQ7z8exjG3ZzZdRqG/CdbF1QxliQh0pkb/uPp3kWuhNSeAKoSrTsHAagWkTgvUd68V
 WnPtqsXV9LNksxGoISAYyl3siHpFd0QjyDmyc2dkHHxhBGAlo3KBv4xRSEfcqS13p9CZ
 MayPk2HmayTK9apWRtZ6KDk+4MnVGtEM4xWbFePfLOWOlufpHsGV4xKWClSrrM27RrH3
 EDdFDFd5s5N4miDsmrQNlVNM5Aj8WCnr2ecetSq0XSRdv4cOWzh93aT3+cLJfbo4kNdW
 kBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rtcfHZAR7Ysq5XNRm/jCy3LiiJsqdTUfh0gGDYHtMjI=;
 b=qqD6lnInEmlJmrfLUjK7jdUSD44xoX+FrSYAY86GyLFM9VeW0HpujDlxD9HT7P2s3b
 b+FuRW+H3eSnwA7nvwZolKvWKoGaf1Zrp7tG/T85izdY0WOE5BNBQAXfRu9oDU96SP+X
 t48IkQsB3S0E2gLUdTDRS1lc7qokI+FG9lcEQ91/Dv5bcHwrDC9AtltwX91oyBYPTpNi
 IfnBtNgn76mthCL3/0o8L0HiukI6N1MpMlUNI1whZ+vU6RkRKqy4U0F+UfOGwnpKgHpM
 +setL+kdKYE0+JQ44QcmXAyzu0uCYyigE1IhrTwLnPRloNlGguyRjGUDmPOQ3gaic9UH
 D60w==
X-Gm-Message-State: AFqh2kooJ3gqtPbwqy6lcxAV7PJOBxQrfxmkokOp0M14AKN9tvxkvamM
 mH8yhdVReAjSHXB0sXV8jKV8ww==
X-Google-Smtp-Source: AMrXdXsbtbF+q/skX2lYOVrY6nCebNMS9fJNREzP8Yx1fO97MiS2zdHfmNzBb36aUjgFxzyI/n2Y8A==
X-Received: by 2002:a05:651c:81:b0:27f:d5c6:f4f with SMTP id
 1-20020a05651c008100b0027fd5c60f4fmr4446567ljq.29.1674290523906; 
 Sat, 21 Jan 2023 00:42:03 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a2ea269000000b0027fc14cdfa5sm2553634ljm.42.2023.01.21.00.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 00:42:03 -0800 (PST)
Message-ID: <f665b62f-d5c7-d02a-d775-434c4445ad86@linaro.org>
Date: Sat, 21 Jan 2023 10:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/8] drm/msm/dsi: Allow 2 CTRLs on v2.5.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Loic Poulain <loic.poulain@linaro.org>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2023 23:00, Konrad Dybcio wrote:
> v2.5.0 support was originally added for SC7280, but this hw is also
> present on SM8350, which has one more DSI host. Bump up the dsi count
> and fill in the register of the secondary host to allow it to probe.
> 
> This should not have any adverse effects on SC7280, as the secondary
> CTRL will only be touched if it's defined, anyway.
> 
> Fixes: 65c391b31994 ("drm/msm/dsi: Add DSI support for SC7280")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

