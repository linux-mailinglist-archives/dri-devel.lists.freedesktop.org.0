Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B931B9FE6A1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 14:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406E010E157;
	Mon, 30 Dec 2024 13:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hoBW5Ro8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE57910E157
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 13:43:52 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso1737286966b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 05:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735566171; x=1736170971; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q5prvbL4qVVxyUau/62tjpzq6Xjuv+m8EjzcAcEKEz4=;
 b=hoBW5Ro8d7ARzYT3PqkWXrOmXRxgk9fsLXMZL2a1l+JMNc7cV/2ljoOl7wXvvpgWoP
 HtE7nARI27h0GOKLRFTuzfZ5I9bk05b1V/QHt8eU0DRApU9mzSFQtqp19XihiQLebLGQ
 eUhzufrfZh+PJjtE2MT6nfuyW9x+ln0Hh3ke5Cewc5kOVqYUHygVuW8S4PmROmnUGjWB
 mJpt/8y991l3dFlIB2PqK596YY7ykS0d2w/4kIn5n821YmDcr21GSGy1UbCHZV2j5WwJ
 2Xk9i7BKOr3xok6GYFcAGMwPZ9V5Rm/ZrNAr892+hSTMEQaCG6OLy7zjIYRt1b5qUlaN
 IdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735566171; x=1736170971;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5prvbL4qVVxyUau/62tjpzq6Xjuv+m8EjzcAcEKEz4=;
 b=s47MRXkRcC0Bpu9LSj/Zw20Y58MgjQbYncp1Nq5au6jqFIQib1UA2Z2vnhrDE0Jp42
 VSSRF49lZoguxez/bUibsEEorZsgEo766AQDFaxG1fvSBSiItPQtn8knvWnRNVmKWYcK
 bgefNy0Zwod0uU7Cd/8wSdm4O+EElqV6DKuKqljEDFm3Jn94eYsagRGMggWCQct1iTfx
 Hdn8N2HLtfbhGtTvsONQAsKJh668FtT6SOB3dJ/9CEdBK8JIOZkOGUC1GzLroLR4TNS5
 lPbq/5CxTvJQuS3LkmrrTubegKQydwfCpFHGQWlRXAg/l4a3zOmlQUj4OW77M2ICZsF9
 DLhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkU/M0VsFtqlivcKsuxei2nJ0ffcqZ7LZ3uQ8AKng8a1ITMRRW4z0PdEI7pDGvR5GznSUMMBxGk4U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz02v1EWPbfpzc2J3QE6k2uu/ZidySSmH9QcSG8iNSJyqOwAEW2
 6zctSirvols2jijlKvxeaJWq/VGDfSzjqhWfP7/fipd6vBM+kndsUs5jNc9OituW/pBRzBlNjOp
 j
X-Gm-Gg: ASbGnct5ocAWSF2KpffE3HXT7bt/AqLzrRTwTT0w6FwBa4XB1knRsC86hTis2LYRcik
 97xruCEyRnxrTgwzx0SS3B0xgQBn8Pmphsoc99bSIeaDyNufjDWgFvwSg2aB7aaagIH7om2fT5f
 1KxR3z6g75KLFqzAetcm2PLVRPHdQdcySthe0YKOpSn2kdAFQcZDtMhUXJz2aFVRCvtQM7U3WsV
 n16CxkfBUQGODfzDHZhFzug/PuQVMHGlGpmP7Crw4ZWsiaqMSThQ8FbCCusKknkXYhH/B71D9me
 MTw3Rh0nZBq5IyTvq+K2gLKG65R9xUX1nbgb
X-Google-Smtp-Source: AGHT+IGYRhZnLXNmLM+FMzz0ZpamPsZkQchJSYMBUnIzcz5KdEvg8k8tQLs0cvWfBZIvHDrkMU6Dow==
X-Received: by 2002:a05:6512:3ca8:b0:542:2a20:e694 with SMTP id
 2adb3069b0e04-5422a20e73dmr10688219e87.20.1735565737587; 
 Mon, 30 Dec 2024 05:35:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5423e0662e3sm1661166e87.188.2024.12.30.05.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 05:35:36 -0800 (PST)
Date: Mon, 30 Dec 2024 15:35:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 13/17] drm/bridge: analogix_dp: Convert
 &analogix_dp_device.aux into a pointer
Message-ID: <e52pbjnusvuoqiyoorjr5msrfmgeqs2jt5sk6zcesvzy7cszzk@fzrtpsjoklgu>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-14-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-14-damon.ding@rock-chips.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 26, 2024 at 02:33:09PM +0800, Damon Ding wrote:
> With the previous patch related to the support of getting panel from
> the DP AUX bus, the &analogix_dp_device.aux can be obtained from the
> &analogix_dp_plat_data.aux.
> 
> Furthermore, the assignment of &analogix_dp_plat_data.connector is
> intended to obtain the pointer of struct analogix_dp_device within the
> analogix_dpaux_transfer() function.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 92 ++++++++++---------
>  .../drm/bridge/analogix/analogix_dp_core.h    |  2 +-
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  2 +-
>  3 files changed, 50 insertions(+), 46 deletions(-)
> 

[...]

> @@ -1127,6 +1128,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>  
>  	if (!dp->plat_data->skip_connector) {
>  		connector = &dp->connector;
> +		dp->plat_data->connector = &dp->connector;
>  		connector->polled = DRM_CONNECTOR_POLL_HPD;
>  
>  		ret = drm_connector_init(dp->drm_dev, connector,
> @@ -1535,7 +1537,9 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>  static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>  				       struct drm_dp_aux_msg *msg)
>  {
> -	struct analogix_dp_device *dp = to_dp(aux);
> +	struct analogix_dp_plat_data *plat_data = to_pdata(aux);
> +	struct drm_connector *connector = plat_data->connector;
> +	struct analogix_dp_device *dp = to_dp(connector);

I see that Analogix DP driver doesn't support
DRM_BRIDGE_ATTACH_NO_CONNECTOR, but at the same time I don't think this
is the step in the right direction. Instead please keep the AUX bus on
the Analogix side and add an API to go from struct drm_dp_aux to struct
analogix_dp_plat_data. Then your done_probing() callback can use that
function.

>  	int ret;
>  
>  	pm_runtime_get_sync(dp->dev);
> 

-- 
With best wishes
Dmitry
