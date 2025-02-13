Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822E0A333E9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 01:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056F410E337;
	Thu, 13 Feb 2025 00:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wDMJQN0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD2310E337
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 00:18:26 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3076262bfc6so3216881fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 16:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739405904; x=1740010704; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NYwMl8hYId1dHgVixRuFQX5UO/e6ftwN7SI4dVqr4nw=;
 b=wDMJQN0PbU2O4dKeIzRbl4v9ikNvw4SxXmfgZQUdoqqR2yg+go5WTs41c4C8c/OdSY
 Ff4lqA5vZDDXsVsU0nFy/G8GjJqCJYY7gjomA61b/jOjxUn4dHkuIjMe4Qe12thNMjUr
 FgscHXZun0Ey4G2ILgCDkVjAyVeJdIvH+IFjLYrDfkE2M7s1sUIBFpwhYeDot0K8Ipi5
 sMhjxRaYtK/IuBrZlRvu422oflifH+hB3EExiHPrGAdXp5Ih9h5MjbNS1NprKU1OKzBA
 WpgP8sWkLwdSFmTjNJjyxb4l2rtks/KStiMlwtk1NznX+e7YLL5tAR+TbgMOgpg74nAB
 0XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739405904; x=1740010704;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NYwMl8hYId1dHgVixRuFQX5UO/e6ftwN7SI4dVqr4nw=;
 b=L5Bjkjm2bB6M5sqklV2Iw/3rZwHDrTiLguy8nb/R3sTTC8EyBoJfFryBp1IEwGlM6Y
 AfJcNe9WGBcWih3T2p//Z/IU1FmM6SCC+u4209b80LFc+IqjJxWZ5hK8Eh54vASuU0Xa
 acUpoPaNFYP8Et/94aMR+VKbeeOvs/5z4F376G7qSlnu0TEQKrjrPp1QagYWOUcCzToa
 gEItZFM/+DFvdHFFqyD/pYNDzuD7/kpxGpwNUwbEmBQyiza0hESgV6K/JtPUxn46G+QC
 bPtREBikLBwSMTtIUKSt7TSneIjJElJtJN2MEO7G0E3G0cHjo0hU//dsW+pnhgStkPp8
 23Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr5GTEGulmbim0Gw4CeHN3tnw4uvECb46pXqgZRgGpDH4rKPwsXprxLreknkY3igxnTiPMdzygUcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPz1v1DCy2s98yl7XOFo71YbC6yTcnZDTWllmQPiRveq7xdM6h
 CHPx3loVL43QqNlvK0O//66LAQoAUxNuzmNr2+hqVHP/5pZrO05JeKxkbSg10hM=
X-Gm-Gg: ASbGncsyCXPLrkNpTrUIRJ96aTN5jEq4FNSEVU7ZTN23OznR4Z8EFUwnhHasJRHYl6U
 e85hq41PKJfGm1FYwmTeNahaAoY/L/gwkSNhF57Xv4RYDT3XfBvs5yQ+HYwKQoAeLmPzjMW/hVU
 5GMfPIupl7o5Pfv/wlvEznN/wDVmu372PiXP6MGKcHUUt7XlXdhaCX6c1VbT8jaxIYHpXUmxWbi
 jNocJ6jy1SSgZ9ELe96xNFBbiP0DvjqMwSfha9Fxp/+L4iTDLBUv6gl3SmFbQBhocqRO2kuR4yj
 WpNlSTTPZ+XF3op+S/iapSH+ahbUx9Pjqc/1flIYsmIeqJpfUmg1mZgpCSMK4QeX4+DJaMo=
X-Google-Smtp-Source: AGHT+IEGBtbida/nkyz2iSc/ztiC9h+P0x7PpqIb2FckqspMzJVGwE6/YlJrL2BX/gLygIxkY5XDvw==
X-Received: by 2002:a2e:b8c8:0:b0:309:bc3:3a56 with SMTP id
 38308e7fff4ca-3090db47b6bmr5792721fa.0.1739405904383; 
 Wed, 12 Feb 2025 16:18:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309100c691fsm388161fa.5.2025.02.12.16.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 16:18:23 -0800 (PST)
Date: Thu, 13 Feb 2025 02:18:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 5/7] drm/hisilicon/hibmc: Get link status and
 dpcd caps
Message-ID: <yiaq5suivzbgjzc2q5pjxwmfmwaqdhg6of3nn44wirmer3g62w@ytvgyr4h773l>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
 <20250210144959.100551-6-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210144959.100551-6-shiyongbang@huawei.com>
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

On Mon, Feb 10, 2025 at 10:49:57PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Prepare the hibmc_dp_get_foo() functions for debugfs using in
> next patch. We also add dpcd's if statement in link training process,
> because we have the dpcd.

Unrelated, split to a separate patch.

> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  3 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c   | 15 ++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h   |  3 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 39 ++++++++++++++++----
>  4 files changed, 52 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> index d613da8b544c..8eb1659c7685 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> @@ -26,6 +26,9 @@ struct hibmc_link_status {
>  struct hibmc_link_cap {
>  	u8 link_rate;
>  	u8 lanes;
> +	int rx_dpcd_revision;
> +	bool is_tps3;
> +	bool is_tps4;
>  };
>  
>  struct hibmc_dp_link {
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 8adace0befde..5e889c377117 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -227,6 +227,21 @@ int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
>  	return 0;
>  }
>  
> +u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp)
> +{
> +	return dp->dp_dev->link.cap.link_rate;
> +}
> +
> +u8 hibmc_dp_get_lanes(struct hibmc_dp *dp)
> +{
> +	return dp->dp_dev->link.cap.lanes;
> +}
> +
> +int hibmc_dp_get_dpcd(struct hibmc_dp *dp)
> +{
> +	return dp->dp_dev->link.cap.rx_dpcd_revision;
> +}
> +
>  static const struct hibmc_dp_color_raw g_rgb_raw[] = {
>  	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
>  	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index 621a0a1d7eb7..823544b8008b 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -54,6 +54,9 @@ struct hibmc_dp {
>  int hibmc_dp_hw_init(struct hibmc_dp *dp);
>  int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
>  void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
> +int hibmc_dp_get_dpcd(struct hibmc_dp *dp);
> +u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp);
> +u8 hibmc_dp_get_lanes(struct hibmc_dp *dp);
>  void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg);
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> index 4a99a9b7e3c4..39345fc78c06 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> @@ -7,6 +7,7 @@
>  #include "dp_comm.h"
>  #include "dp_reg.h"
>  #include "dp_serdes.h"
> +#include "dp_config.h"
>  
>  #define HIBMC_EQ_MAX_RETRY 5
>  
> @@ -42,11 +43,7 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
>  		return ret >= 0 ? -EIO : ret;
>  	}
>  
> -	ret = drm_dp_read_dpcd_caps(dp->aux, dp->dpcd);
> -	if (ret)
> -		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
> -
> -	return ret;
> +	return 0;
>  }
>  
>  static int hibmc_dp_link_set_pattern(struct hibmc_dp_dev *dp, int pattern)
> @@ -189,15 +186,17 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
>  	bool level_changed;
>  	u32 voltage_tries;
>  	u32 cr_tries;
> +	u32 max_cr;
>  	int ret;
>  
>  	/*
>  	 * DP 1.4 spec define 10 for maxtries value, for pre DP 1.4 version set a limit of 80
>  	 * (4 voltage levels x 4 preemphasis levels x 5 identical voltage retries)
>  	 */
> +	max_cr = dp->link.cap.rx_dpcd_revision >= DP_DPCD_REV_14 ? 10 : 80;
>  
>  	voltage_tries = 1;
> -	for (cr_tries = 0; cr_tries < 80; cr_tries++) {
> +	for (cr_tries = 0; cr_tries < max_cr; cr_tries++) {
>  		drm_dp_link_train_clock_recovery_delay(dp->aux, dp->dpcd);
>  
>  		ret = drm_dp_dpcd_read_link_status(dp->aux, lane_status);
> @@ -234,7 +233,7 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
>  		voltage_tries = level_changed ? 1 : voltage_tries + 1;
>  	}
>  
> -	drm_err(dp->dev, "dp link training clock recovery 80 times failed\n");
> +	drm_err(dp->dev, "dp link training clock recovery %u times failed\n", max_cr);
>  	dp->link.status.clock_recovered = false;
>  
>  	return 0;
> @@ -244,9 +243,17 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
>  {
>  	u8 lane_status[DP_LINK_STATUS_SIZE] = {0};
>  	u8 eq_tries;
> +	int tps;
>  	int ret;
>  
> -	ret = hibmc_dp_link_set_pattern(dp, DP_TRAINING_PATTERN_2);
> +	if (dp->link.cap.is_tps4)
> +		tps = DP_TRAINING_PATTERN_4;
> +	else if (dp->link.cap.is_tps3)
> +		tps = DP_TRAINING_PATTERN_3;
> +	else
> +		tps = DP_TRAINING_PATTERN_2;
> +
> +	ret = hibmc_dp_link_set_pattern(dp, tps);
>  	if (ret)
>  		return ret;
>  
> @@ -313,11 +320,27 @@ static int hibmc_dp_link_downgrade_training_eq(struct hibmc_dp_dev *dp)
>  	return hibmc_dp_link_reduce_rate(dp);
>  }
>  
> +static void hibmc_dp_update_caps(struct hibmc_dp_dev *dp)
> +{
> +	dp->link.cap.rx_dpcd_revision = dp->dpcd[DP_DPCD_REV];
> +
> +	dp->link.cap.is_tps3 = (dp->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
> +			       (dp->dpcd[DP_MAX_LANE_COUNT] & DP_TPS3_SUPPORTED);
> +	dp->link.cap.is_tps4 = (dp->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14) &&
> +			       (dp->dpcd[DP_MAX_DOWNSPREAD] & DP_TPS4_SUPPORTED);
> +}
> +
>  int hibmc_dp_link_training(struct hibmc_dp_dev *dp)
>  {
>  	struct hibmc_dp_link *link = &dp->link;
>  	int ret;
>  
> +	ret = drm_dp_read_dpcd_caps(dp->aux, dp->dpcd);
> +	if (ret)
> +		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
> +
> +	hibmc_dp_update_caps(dp);
> +
>  	while (true) {
>  		ret = hibmc_dp_link_training_cr_pre(dp);
>  		if (ret)
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
