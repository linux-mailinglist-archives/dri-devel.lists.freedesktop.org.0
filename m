Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3342E66668A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F55B10E834;
	Wed, 11 Jan 2023 22:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8E510E830
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:56:49 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bq39so25844144lfb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VRHfe7+oqQo3PR0iB4Sq4HE88hbM8IdnEc2KIv4oSKA=;
 b=B3nMlJ91BxxZKXIyJeRUpLJ6ssk7ksEk1VlX3JYJPEJ+PjwOdlu/b8aqYb64gsAdz2
 StWoURYfQE2ZuSet9nx8rrjHqmFlHQ305FBHqrdhIV+UiF7zqP3Ypv64vfxxzcXVBPG+
 LsMFk4DT5RLeQvTZlDcJWycTjj9L3818n7BmJTjw74GcjIm4/BO8TgcEntmRwwoxnw0y
 jMSt4crwss3am3sLRcccXcMOIwD27TnI3ETIpRUKTjlUQa1nDYlocr9Bx4qOqzrzhRi+
 +wawjnEEl3fGYSc3OdjfIjJdycLF2IICCxDmkOAMGA5qK6d2chd4X2euQx4pBAy2IjhX
 guyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VRHfe7+oqQo3PR0iB4Sq4HE88hbM8IdnEc2KIv4oSKA=;
 b=C2V54fqH8AH35ChiC7Ut1+6d8zEpdSTi5QYAPO6HIkdprDPnOI3dAgvWcnv+EVwmLZ
 yCVQZSOCp4b/nlEFVXDiunAi0CUiqQR1KYRj1zq0Nusmcf/KsgCfPtFcoxsm2WuOIyyC
 nzMgpUhX08DH4z5wpNX6Bq5RVvOWxG+BhlXROmrfBfI4ahjglaQlA5PPxcBd1x0MpYf3
 Parql/SQjftA4mwOMHFE8V0bICPe7VxR8SLGcLAMMW05XCUnVi6746KzsDNZ54yrqP8/
 KlNrXRugrX5gny80tpF5sb4vLh+MlhnaQcsdghg16EPojYfEGHtkvtBJ2qrIfOUuJERe
 0OXQ==
X-Gm-Message-State: AFqh2kochAl8BU3CpkltlFE+bDT/tZIC2rv87efMkQafO7YRm2BsTB0g
 209RDyRR60XmOrOQCNdxMB3ZDK0LF1ZrJ+ie
X-Google-Smtp-Source: AMrXdXsG4m5IHD45bBBL9zlsHY+CD2b1hJAsDpKlAk0RRJe4FJiaQuuTocxM1suhZYyspPDHNHN4ww==
X-Received: by 2002:a05:6512:1104:b0:4af:5088:959c with SMTP id
 l4-20020a056512110400b004af5088959cmr22826768lfg.2.1673477808028; 
 Wed, 11 Jan 2023 14:56:48 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a056512210600b004b55c1b5c66sm2941927lfr.157.2023.01.11.14.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 14:56:47 -0800 (PST)
Message-ID: <2304c252-354a-f214-3f89-7797110fc416@linaro.org>
Date: Thu, 12 Jan 2023 00:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] drm/msm/dsi: implement opp table based check for
 dsi_mgr_bridge_mode_valid()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230111225257.7510-1-quic_abhinavk@quicinc.com>
 <20230111225257.7510-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230111225257.7510-2-quic_abhinavk@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2023 00:52, Abhinav Kumar wrote:
> Currently there is no protection against a user trying to set
> an unsupported mode on DSI. Implement a check based on the opp
> table whether the byte clock for the mode can be supported by
> validating whether an opp table entry exists.
> 
> For devices which have not added opp table support yet, skip
> this check otherwise it will break bootup on those devices.
> 
> changes in v2:
> 	- drop dev_pm_opp_get_opp_table() usage
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
> Reported-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 3a1417397283..c4c24dabfd6f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -450,6 +450,31 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>   	int id = dsi_mgr_bridge_get_id(bridge);
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct mipi_dsi_host *host = msm_dsi->host;
> +	struct platform_device *pdev = msm_dsi->pdev;
> +	struct dev_pm_opp *opp;
> +	unsigned long byte_clk_rate;
> +
> +	byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), mode);
> +
> +	/*
> +	 * If dev_pm_opp_find_freq_ceil() returns -EINVAL, its a bad
> +	 * pointer being passed, so treat as an error and return MODE_ERROR
> +	 *
> +	 * If dev_pm_opp_find_freq_ceil() returns -ERANGE, no clock
> +	 * was found matching the byte_clk, so return MODE_CLOCK_RANGE
> +	 *
> +	 * If dev_pm_opp_find_freq_ceil() returns -ENODEV, don't treat
> +	 * it as an error as it could mean opp table is not implemented
> +	 */

I'd say, too lengthy and verbose.

> +	opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
> +	if (IS_ERR(opp)) {
> +		if (PTR_ERR(opp) == -EINVAL)
> +			return MODE_ERROR;
> +		else if (PTR_ERR(opp) == -ERANGE)
> +			return MODE_CLOCK_RANGE;

I think the logic should be quite opposite. Ignore -ENODEV, handle 
-ERANGE and return MODE_ERROR for all other errors. In your code you are 
ignoring not only -ENODEV, but all other possible errors which can be 
added in future.

> +	} else {
> +		dev_pm_opp_put(opp);
> +	}
>   
>   	return msm_dsi_host_check_dsc(host, mode);
>   }

-- 
With best wishes
Dmitry

