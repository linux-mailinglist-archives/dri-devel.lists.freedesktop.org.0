Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A3D52D1AC
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803ED11A5A3;
	Thu, 19 May 2022 11:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B260111A5B3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:43:05 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id l13so1974394lfp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 04:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=esfd+BsJwj1XPX4rLyeq0jZt7uj97kgKS5l+MuRHnb8=;
 b=qDk0VyWazyxkVxCnkxs20+VR22g9KFvkEbu0DV9aCjSlKkCiBm5ELbMkmtWE1Tr0MD
 KePBe/XGGNgPLpVa9QxA2soGmOYoQ8ZhbT3YSyWcljBY4GtaklAwsaezB9jKUh5ZEmNi
 vO3dRi5sDVGlwtJNhTh6hEYlAlLZyqhqAWnJJTCcRDSFCzgH2gQGSVppc9wXWrP55s1G
 kK/X2eSKgA8AtOT4tt1tr4HpbcJRn+PZoM0Xf6t5NFEiMtbOGAzLTRukKtZKwLZ6AwHE
 90dG0n0anWiGfx7i5Sa3yE4Ty+Azzub/JzkIiYPAshOkzJNkM3BEZ6QUsrWjwxnKyndz
 bSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=esfd+BsJwj1XPX4rLyeq0jZt7uj97kgKS5l+MuRHnb8=;
 b=S8GD2QaKOwQOIJiCfkR0OfaLiFb3Gp5rYJ5bxDcYgGODCEgm5IG167PEE+vbxKlp+F
 zKVWe9knFmSpLHimqkU33Zw90Q8oUUd1bVEns9RrYgdFmZwqEJwGWghPZ+dnG9QWKb0N
 p1Qm8Z7GhlH9gCVJaoL3+2fM+lOIJWVi24yIQYS4PFrT9jfPfPkR9Vz5M5XXmP1Y3Fj5
 gQqDgzb7kviYZ0dtrzux9/5Vc0+qYRCBxpB0C/V1J5GCygflAdDzobSURu2PZhkBbu50
 /dBTGBFn+A50lGth0IqK8tyM2Es45kgfxK58Rvfq8WDgWPoOivZF0uyxuCAj5wPGCw7k
 sXEw==
X-Gm-Message-State: AOAM533YjKTdxfRg26b+ZmjmyiZFzuveDlleagciPt4A7fUtad+OIttc
 RwrBPnZh152qKIcAiP5Ro5DW/Q==
X-Google-Smtp-Source: ABdhPJyJytkSIoSbNQhljkxfmFm5gdfD/C5ymFbsBDlg2mfq6yly5Ue0oSfd6H8vFjRiIMDAv5MglA==
X-Received: by 2002:ac2:596a:0:b0:477:c166:5b60 with SMTP id
 h10-20020ac2596a000000b00477c1665b60mr3145034lfp.280.1652960583881; 
 Thu, 19 May 2022 04:43:03 -0700 (PDT)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id
 o6-20020ac24346000000b00477a8c6b08dsm264733lfl.100.2022.05.19.04.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 04:43:03 -0700 (PDT)
Message-ID: <1951f060-bcd8-2182-9950-c86b88e12d45@linaro.org>
Date: Thu, 19 May 2022 14:43:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 10/11] drm/bridge: msm: Convert to drm_of_get_data_lanes
Content-Language: en-GB
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20220519112657.62283-1-marex@denx.de>
 <20220519112657.62283-10-marex@denx.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220519112657.62283-10-marex@denx.de>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2022 14:26, Marek Vasut wrote:
> Convert driver to use this new helper to standardize
> OF "data-lanes" parsing.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit, if you resend this series for any reason: could you please 
follow the usual subject prefix for the msm driver: 'drm/msm: ....'

> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sean Paul <sean@poorly.run>
> To: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.c | 6 ++----
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +++----
>   2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 8f9fed9fdafc4..6ef919cda0f5c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -102,11 +102,9 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   static int dp_parser_misc(struct dp_parser *parser)
>   {
>   	struct device_node *of_node = parser->pdev->dev.of_node;
> -	int len = 0;
> -	const char *data_lane_property = "data-lanes";
> +	int len;
>   
> -	len = of_property_count_elems_of_size(of_node,
> -			 data_lane_property, sizeof(u32));
> +	len = drm_of_get_data_lanes(of_node, 1, DP_MAX_NUM_DP_LANES);
>   	if (len < 0) {
>   		DRM_WARN("Invalid property %s, default max DP lanes = %d\n",
>   				data_lane_property, DP_MAX_NUM_DP_LANES);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index a95d5df52653c..a0c7d23cd4939 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1779,11 +1779,10 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
>   		return 0;
>   	}
>   
> -	num_lanes = len / sizeof(u32);
> -
> -	if (num_lanes < 1 || num_lanes > 4) {
> +	num_lanes = drm_of_get_data_lanes(ep, 1, 4);
> +	if (num_lanes < 0) {
>   		DRM_DEV_ERROR(dev, "bad number of data lanes\n");
> -		return -EINVAL;
> +		return num_lanes;
>   	}
>   
>   	msm_host->num_data_lanes = num_lanes;


-- 
With best wishes
Dmitry
