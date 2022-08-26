Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F24395A25A2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 12:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E8410E841;
	Fri, 26 Aug 2022 10:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EEE10E847
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 10:14:55 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id n15so1398287lfe.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 03:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=nBDls8p7zWKgMsdae7qsDU8nms79A1faHjvYu7tARvE=;
 b=piJ7BEpevaGNdTfb+iohBsjVd8y6wP7fyx2scpDUXdludX6+pLspOYMOnspr5RJUmE
 OIh1n/nMbN506hH3wRUECtpn215qzlyev8PAdv9fkUrfkWN8RbOIkAAv7iCnj/GpRewr
 6b8p81mVhXkt+JAB6KBcurlZ+unI6qZhm+lUuSOQ1aVLUbncBRWCYQHGm7l3rhjuEEDJ
 RjWZPIryyeV1a9Ua7OflgMFcrcgLy0YL1gskTh695mZRAbIF7D/CS172snBeNCYvtNLW
 KiLBOlEow99lBrYt00L0fYGxGF8kqOX5BJxf2PcQjnNJbHR8CkNz3o+2HAoT3HYzO0fA
 RAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=nBDls8p7zWKgMsdae7qsDU8nms79A1faHjvYu7tARvE=;
 b=yD8qiH70hqGK3XWn7cVzyrdEtDUzdyIw48ndPPUwppTEMPJi1XVR+LNpGuDNQ5S7cT
 aw0d4IG6al0eKm9Si5Y986dJWAXSnSszXB5Lcl38+vB3BwqYizHL2LXBjDpGf65mH3Bc
 g5mocHhzsMm9sZyFEKnNqLyJTs/jL39YLOIIfD4XlALyGiO61lDFH6yfpWPr4Rg02oZg
 hbqFleYYQTPVEVhfOUJKVlPB/D2KpqmFA5h5W6KGTPFO/YwViRjYPfsy+fBzgRnjO93y
 VkzoXqMTlGfPBz9Vl/TjmjAuOxTqI8iaP9sXQmvjGUyiFFSQhtCNWyXdfz+93K0XTgTG
 EnUQ==
X-Gm-Message-State: ACgBeo2LiMqgGAMH8qmtyi2bUNBqWPkTQ9hw5R8EeIU9+GGT9T+Xq0+0
 nLTl20J+7Th6J/q+NgQPQw13ZQ==
X-Google-Smtp-Source: AA6agR7caUbLwyQSa715SFZUEGY9QFvmhTYs0wWUx3epIqtDxGXY7MC1nfcBGHa9KKFMrtkkLdDXyw==
X-Received: by 2002:a19:915c:0:b0:492:f06d:b3b1 with SMTP id
 y28-20020a19915c000000b00492f06db3b1mr2554374lfj.1.1661508894364; 
 Fri, 26 Aug 2022 03:14:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05651c106700b0025e42f8e771sm414675ljm.34.2022.08.26.03.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 03:14:53 -0700 (PDT)
Message-ID: <ad2db009-8660-db05-60d9-fea61a5cde26@linaro.org>
Date: Fri, 26 Aug 2022 13:14:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3] drm/msm/dp: correct 1.62G link rate at
 dp_catalog_ctrl_config_msa()
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1661372150-3764-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1661372150-3764-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/08/2022 23:15, Kuogee Hsieh wrote:
> At current implementation there is an extra 0 at 1.62G link rate which cause
> no correct pixel_div selected for 1.62G link rate to calculate mvid and nvid.
> This patch delete the extra 0 to have mvid and nvid be calculated correctly.
> 
> Changes in v2:
> -- fix Fixes tag's text
> 
> Changes in v3:
> -- fix misspelling of "Reviewed-by"
> 
> Fixes: 937f941ca06f  ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 

No extra empty lines between the tags please. I'll correct this manually 
while applying.

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 7257515..676279d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -431,7 +431,7 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>   
>   	if (rate == link_rate_hbr3)
>   		pixel_div = 6;
> -	else if (rate == 1620000 || rate == 270000)
> +	else if (rate == 162000 || rate == 270000)
>   		pixel_div = 2;
>   	else if (rate == link_rate_hbr2)
>   		pixel_div = 4;

-- 
With best wishes
Dmitry

