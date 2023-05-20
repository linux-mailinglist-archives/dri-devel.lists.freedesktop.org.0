Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0604470A43F
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 03:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C0810E113;
	Sat, 20 May 2023 01:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3A210E113
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 01:20:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f13ef4ad91so4528076e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684545622; x=1687137622;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=idK09QRjerUdfw38jS+Z9wofhw3ghWuoa33jJg2Grso=;
 b=j62wmiGYB5+RTNZP8dPGY4Ftn8ajKo7rpU14vlNP2hpxkBgonPXVcFDdV7f/ENe2lD
 XpYMZ0kWLRQPALaERnSCB9ZkzkgrgSbJae870CB+yJOLRvBwPK+pvzezL6y9F/uqnOc0
 qh6F2vHdsqtdPEvYNZTtuVF+Qq1RfrE5tl/rfJ7z3oRjK+jjAUSPTH93EdvDNeUnwUn/
 6EQDRn4DvDvjETY38td42GZmCkfvywf2w8TBtIMuNsL91dPXKg+5trf1Uk0f89FfvXj3
 fHEtytd+0UJ+Ueaakj8osZjuYFAx+3IbetLKZD+Sz4lw7cl4wgcyI1uD09PjeR1B1wL1
 O5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684545622; x=1687137622;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=idK09QRjerUdfw38jS+Z9wofhw3ghWuoa33jJg2Grso=;
 b=eJmRVzTPuXVgTqffDv+c8LUyQMin6wW6yPXT9MDWX3UC4r/KLC3pOwGqTQzByxf+Nw
 GhNEqt4l7T3L02mfc9+gnOLveFc6iQsME+1O2bBC/qGE4CVNwez5WBq9/uciHLm4q9WM
 M642rW2JRxq/EXlakq25DzZ/p0DNe8gnupuLO1/GgSHu0ylnpJxdm120cokzcyM0x7L8
 QiumDYbHXQHhIUxBbuqDSvVy9qgr+YEiaROeN9L4kL89NhRk5rGPranS8DV0A+yd5ZhN
 ZjMNjVciSUOVteK19u+nebhIptsjoJ3tDL3B/cr9yXoO3wUYDSY+A1l01cwM+es11RDd
 S9QQ==
X-Gm-Message-State: AC+VfDz0m8kOCJIYjgOD0IcBlMPuRLG+IBUW9cEZoOlpWwtyANmR7Zoz
 l+Ym2+nSjxA9+8fokK05bUBWvA==
X-Google-Smtp-Source: ACHHUZ5L+B0tUaPEfiUGR6rIXgmZMGCZz4FNtMpNh0ki7IuMWCV31ETphalEaTCPmegXwNF0b+UiAg==
X-Received: by 2002:a05:6512:403:b0:4f3:a446:8236 with SMTP id
 u3-20020a056512040300b004f3a4468236mr1409771lfk.11.1684545621691; 
 Fri, 19 May 2023 18:20:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v3-20020ac25603000000b004f387d97dafsm85058lfd.147.2023.05.19.18.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 18:20:21 -0700 (PDT)
Message-ID: <3a5d2a34-bdc3-ac64-f69a-c7d99ff2f275@linaro.org>
Date: Sat, 20 May 2023 04:20:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] drm/msm/dp: Clean up logs dp_power module
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20230515030256.300104-1-quic_bjorande@quicinc.com>
 <20230515030256.300104-2-quic_bjorande@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230515030256.300104-2-quic_bjorande@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2023 06:02, Bjorn Andersson wrote:
> The clk_bulk API already provides error messages indicating which
> specific clock in the request for which the operation failed, further
> more these errors are associated with the specific DisplayPort
> controller (rather than the shared drm_device). The additional error
> messages int he dp_power module does thereby not provide any benefit.
> 
> While at it, none of the dp_power handles passed to these functions are
> dynamic in nature, so there should not be any need for runtime checking
> them. Drop these as well.

It might have been slightly better to have this split into two patches, 
but as this is a debug/logs only, it's fine with me.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_power.c | 62 +++++--------------------------
>   1 file changed, 9 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index c0aaabb03389..031d2eefef07 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -35,25 +35,16 @@ static int dp_power_clk_init(struct dp_power_private *power)
>   	stream = &power->parser->mp[DP_STREAM_PM];
>   
>   	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
> -	if (rc) {
> -		DRM_ERROR("failed to get %s clk. err=%d\n",
> -			dp_parser_pm_name(DP_CORE_PM), rc);
> +	if (rc)
>   		return rc;
> -	}
>   
>   	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
> -	if (rc) {
> -		DRM_ERROR("failed to get %s clk. err=%d\n",
> -			dp_parser_pm_name(DP_CTRL_PM), rc);
> +	if (rc)
>   		return -ENODEV;
> -	}
>   
>   	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
> -	if (rc) {
> -		DRM_ERROR("failed to get %s clk. err=%d\n",
> -			dp_parser_pm_name(DP_CTRL_PM), rc);
> +	if (rc)
>   		return -ENODEV;
> -	}
>   
>   	return 0;
>   }
> @@ -121,11 +112,9 @@ int dp_power_clk_enable(struct dp_power *dp_power,
>   			mp = &power->parser->mp[DP_CORE_PM];
>   
>   			rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
> -			if (rc) {
> -				DRM_ERROR("fail to enable clks: %s. err=%d\n",
> -					dp_parser_pm_name(DP_CORE_PM), rc);
> +			if (rc)
>   				return rc;
> -			}
> +
>   			dp_power->core_clks_on = true;
>   		}
>   	}
> @@ -133,10 +122,8 @@ int dp_power_clk_enable(struct dp_power *dp_power,
>   	mp = &power->parser->mp[pm_type];
>   	if (enable) {
>   		rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
> -		if (rc) {
> -			DRM_ERROR("failed to enable clks, err: %d\n", rc);
> +		if (rc)
>   			return rc;
> -		}
>   	} else {
>   		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
>   	}
> @@ -162,34 +149,19 @@ int dp_power_clk_enable(struct dp_power *dp_power,
>   
>   int dp_power_client_init(struct dp_power *dp_power)
>   {
> -	int rc = 0;
>   	struct dp_power_private *power;
>   
> -	if (!dp_power) {
> -		DRM_ERROR("invalid power data\n");
> -		return -EINVAL;
> -	}
> -
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>   
>   	pm_runtime_enable(&power->pdev->dev);
>   
> -	rc = dp_power_clk_init(power);
> -	if (rc)
> -		DRM_ERROR("failed to init clocks %d\n", rc);
> -
> -	return rc;
> +	return dp_power_clk_init(power);
>   }
>   
>   void dp_power_client_deinit(struct dp_power *dp_power)
>   {
>   	struct dp_power_private *power;
>   
> -	if (!dp_power) {
> -		DRM_ERROR("invalid power data\n");
> -		return;
> -	}
> -
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>   
>   	pm_runtime_disable(&power->pdev->dev);
> @@ -200,25 +172,14 @@ int dp_power_init(struct dp_power *dp_power, bool flip)
>   	int rc = 0;
>   	struct dp_power_private *power = NULL;
>   
> -	if (!dp_power) {
> -		DRM_ERROR("invalid power data\n");
> -		return -EINVAL;
> -	}
> -
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>   
>   	pm_runtime_get_sync(&power->pdev->dev);
>   
>   	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> -	if (rc) {
> -		DRM_ERROR("failed to enable DP core clocks, %d\n", rc);
> -		goto exit;
> -	}
> -
> -	return 0;
> +	if (rc)
> +		pm_runtime_put_sync(&power->pdev->dev);
>   
> -exit:
> -	pm_runtime_put_sync(&power->pdev->dev);
>   	return rc;
>   }
>   
> @@ -238,11 +199,6 @@ struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
>   	struct dp_power_private *power;
>   	struct dp_power *dp_power;
>   
> -	if (!parser) {
> -		DRM_ERROR("invalid input\n");
> -		return ERR_PTR(-EINVAL);
> -	}
> -
>   	power = devm_kzalloc(&parser->pdev->dev, sizeof(*power), GFP_KERNEL);
>   	if (!power)
>   		return ERR_PTR(-ENOMEM);

-- 
With best wishes
Dmitry

