Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185019B2FED
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 13:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A970C10E20C;
	Mon, 28 Oct 2024 12:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FSWDCe9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F2B10E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 12:16:22 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo1553921e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 05:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730117781; x=1730722581; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Iobw3oThGckbb8S6CgbEUUhRVxOYF7teFOmalzjcItw=;
 b=FSWDCe9ANJn4dtLBJRw6ZkPm0yWod8eIrdiEB3LdI0vhL3Kzvgn0cYnR+PtIiUVAVJ
 LqBTQR9OejQtF0gfoRwLTr4QMvIsVgGHm5eb8KZObxDxG6wIFyl0rta/qoCvGPjricwL
 /mSU0vNRGscOw+jm6EhMLVy3/SyoLsz6LbpozooTvyZFf6nDxPRlgxOo+XhvEdjIX3qF
 JeY6oQpKoD6hVmz+69woKWRrrTBmd1mvNA1Zn/rtpWbwCuCy5tMXLSr0fxqbD3U5dieX
 zw3fxOxe5cEzJ9WNWJfCgrIMvzZJ4hi0heQupnttWe2c7rxW/LKWvh4M3zwYVnCknRBC
 2psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730117781; x=1730722581;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iobw3oThGckbb8S6CgbEUUhRVxOYF7teFOmalzjcItw=;
 b=Gx6Rw0PT1XhtUbbMl71SZAILz8c0sVSCjAx1izWDrvxsoMYglJTi1wTAmlNp6GGDed
 7LlVJsaCXODF0feOohEPeUB2Whm7Zjo70Rq2ps4Ftc2MqzdyHkSKeG7d1+fxSOLtco4o
 NWBR4kebDCM38PMP8Da/KkWdnwVqE7neUgBaBYdsSCmef/BkUP2my9ZBe9Qy86A/SBx4
 QGdUslF6+BZeqWhFcB92hgh+kImRLlfV7ZUNcNHIIE2JaItaFZcEQZnGBlhFARpjsDk6
 LfR4Fr6BG4zRLd/Qi7R1YqrVq4c0wBu6U8k1+9o+knbWEa0Rr7NwEoiHuv+4308wNnp0
 cvfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/4l64DR5N9XMQDUeqqUjjxjZsclJNVT4FPsjW/lIPoP3dIwVMHbVdKZJ1AyxxVfTnxVQHGVb9qjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnsQr3tWY9gi/ReVi8sv8jUcxN9MroAUVx53BAatsdpFOigFYO
 P2z/6cZAOeo4FZ+e8E+QN2Nnlsig6cEwsrC7KYTaaGa0F8abGHLng+MV/Hbv5+A=
X-Google-Smtp-Source: AGHT+IE388dri54IlTqnUWiPmz5NLkTnub48q8UbuLlaZFrJF8C5gM5HbSVXVL8s4Pe7V94vNJReOg==
X-Received: by 2002:a05:6512:ba2:b0:539:968a:9196 with SMTP id
 2adb3069b0e04-53b34a2d6e3mr2952347e87.48.1730117780646; 
 Mon, 28 Oct 2024 05:16:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e10a670sm1055690e87.20.2024.10.28.05.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 05:16:19 -0700 (PDT)
Date: Mon, 28 Oct 2024 14:16:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 drm-dp 2/4] drm/hisilicon/hibmc: add dp link moduel in
 hibmc
Message-ID: <k5d3ny7dl4tgsy2y2kagz3d3s5rg74qaazck3xxbqpwlrjjd2i@e4dohu4uuwsr>
References: <20241022124148.1952761-1-shiyongbang@huawei.com>
 <20241022124148.1952761-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022124148.1952761-3-shiyongbang@huawei.com>
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

On Tue, Oct 22, 2024 at 08:41:46PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Add link training process functions in this moduel.

We should probably have a bounty for a developer who finally writes a
generic DP link training helpers.

> Signed-off-by: baihan li <libaihan@huawei.com>

Missing SoB

> ---
> ChangeLog:
> v1 -> v2:
>   - using drm_dp_* functions implement dp link training process, suggested by Jani Nikula.
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/
>   v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile     |   2 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 344 +++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.h |  25 ++
>  3 files changed, 370 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.h
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> index 8770ec6dfffd..94d77da88bbf 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> -	       dp/dp_aux.o
> +	       dp/dp_aux.o dp/dp_link.o
>  
>  obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> new file mode 100644
> index 000000000000..b02a536e0689
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> @@ -0,0 +1,344 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2024 Hisilicon Limited.
> +
> +#include <linux/delay.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_print.h>
> +#include "dp_comm.h"
> +#include "dp_reg.h"
> +#include "dp_link.h"
> +#include "dp_aux.h"
> +
> +const u8 link_rate_map[] = {DP_LINK_BW_1_62, DP_LINK_BW_2_7,
> +			    DP_LINK_BW_5_4, DP_LINK_BW_8_1};
> +
> +static int dp_link_training_configure(struct dp_dev *dp)
> +{
> +	u8 buf[2];
> +	int ret;
> +
> +	/* DP 2 lane */
> +	dp_write_bits(dp->base + DP_PHYIF_CTRL0, DP_CFG_LANE_DATA_EN,
> +		      dp->link.cap.lanes == DP_LANE_NUM_2 ? 0x3 : 0x1);
> +	dp_write_bits(dp->base + DP_DPTX_GCTL0, DP_CFG_PHY_LANE_NUM,
> +		      dp->link.cap.lanes == DP_LANE_NUM_2 ? 0x1 : 0);
> +
> +	/* enhanced frame */
> +	dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_FRAME_MODE, 0x1);
> +
> +	/* set rate and lane count */
> +	buf[0] = dp_get_link_rate(dp->link.cap.link_rate);
> +	buf[1] = DP_LANE_COUNT_ENHANCED_FRAME_EN | dp->link.cap.lanes;
> +	ret = drm_dp_dpcd_write(&dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
> +	if (ret != sizeof(buf)) {
> +		drm_err(dp->dev, "dp aux write link rate and lanes failed, ret: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* set 8b/10b and downspread */
> +	buf[0] = 0x10;
> +	buf[1] = 0x1;
> +	ret = drm_dp_dpcd_write(&dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
> +	if (ret != sizeof(buf))
> +		drm_err(dp->dev, "dp aux write 8b/10b and downspread failed, ret: %d\n", ret);
> +
> +	ret = drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd);
> +	if (ret)
> +		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int dp_link_pattern2dpcd(struct dp_dev *dp, enum dp_pattern_e pattern)
> +{
> +	switch (pattern) {
> +	case DP_PATTERN_NO:
> +		return DP_TRAINING_PATTERN_DISABLE;
> +	case DP_PATTERN_TPS1:
> +		return DP_TRAINING_PATTERN_1;
> +	case DP_PATTERN_TPS2:
> +		return DP_TRAINING_PATTERN_2;
> +	case DP_PATTERN_TPS3:
> +		return DP_TRAINING_PATTERN_3;
> +	case DP_PATTERN_TPS4:
> +		return DP_TRAINING_PATTERN_4;
> +	default:
> +		drm_err(dp->dev, "dp link unknown pattern %d\n", pattern);
> +		return -EINVAL;

Why do you need the extra defines / wrappers? Can you use
DP_TRAINING_PATTERN_foo directly?

> +	}
> +}
> +
> +static int dp_link_set_pattern(struct dp_dev *dp, enum dp_pattern_e pattern)
> +{
> +	int ret;
> +	u8 buf;
> +
> +	ret = dp_link_pattern2dpcd(dp, pattern);
> +	if (ret < 0)
> +		return ret;
> +
> +	buf = (u8)ret;
> +	if (pattern != DP_TRAINING_PATTERN_DISABLE && pattern != DP_TRAINING_PATTERN_4) {
> +		buf |= DP_LINK_SCRAMBLING_DISABLE;
> +		dp_write_bits(dp->base + DP_PHYIF_CTRL0, DP_CFG_SCRAMBLE_EN, 0x1);
> +	} else {
> +		dp_write_bits(dp->base + DP_PHYIF_CTRL0, DP_CFG_SCRAMBLE_EN, 0);
> +	}
> +
> +	dp_write_bits(dp->base + DP_PHYIF_CTRL0, DP_CFG_PAT_SEL, pattern);
> +
> +	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_PATTERN_SET, &buf, sizeof(buf));
> +	if (ret != sizeof(buf))
> +		drm_err(dp->dev, "dp aux write training pattern set failed\n");
> +
> +	return 0;
> +}
> +
> +static int dp_link_training_cr_pre(struct dp_dev *dp)
> +{
> +	u8 *train_set = dp->link.train_set;
> +	int ret;
> +	u8 i;
> +
> +	ret = dp_link_training_configure(dp);
> +	if (ret)
> +		return ret;
> +
> +	ret = dp_link_set_pattern(dp, DP_PATTERN_TPS1);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < dp->link.cap.lanes; i++)
> +		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
> +
> +	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
> +	if (ret != dp->link.cap.lanes)
> +		drm_err(dp->dev, "dp aux write training lane set failed\n");
> +
> +	return 0;
> +}
> +
> +static bool dp_link_get_adjust_train(struct dp_dev *dp, u8 lane_status[DP_LINK_STATUS_SIZE])
> +{
> +	u8 pre_emph[DP_LANE_NUM_MAX] = {0};
> +	u8 voltage[DP_LANE_NUM_MAX] = {0};
> +	bool changed = false;
> +	u8 train_set;
> +	u8 lane;
> +
> +	/* not support level 3 */

??

> +	for (lane = 0; lane < dp->link.cap.lanes; lane++) {
> +		voltage[lane] = drm_dp_get_adjust_request_voltage(lane_status, lane);
> +		pre_emph[lane] = drm_dp_get_adjust_request_pre_emphasis(lane_status, lane);
> +	}
> +
> +	for (lane = 0; lane < dp->link.cap.lanes; lane++) {
> +		train_set = voltage[lane] | pre_emph[lane];
> +		if (dp->link.train_set[lane] != train_set) {
> +			changed = true;
> +			dp->link.train_set[lane] = train_set;
> +		}
> +	}
> +
> +	return changed;
> +}
> +
> +u8 dp_get_link_rate(u8 index)
> +{
> +	return link_rate_map[index];
> +}

Use the array directly

> +
> +static int dp_link_reduce_rate(struct dp_dev *dp)
> +{
> +	if (dp->link.cap.link_rate > 0) {
> +		dp->link.cap.link_rate--;
> +		return 0;
> +	}
> +
> +	drm_err(dp->dev, "dp link training reduce rate failed, already lowest rate\n");
> +
> +	return -EFAULT;

EFAULT => "Bad address". Probably the error code should be slightly
different.

> +}
> +
> +static int dp_link_reduce_lane(struct dp_dev *dp)
> +{
> +	if (dp->link.cap.lanes == DP_LANE_NUM_1) {
> +		drm_err(dp->dev, "dp link training reduce lane failed, already reach minimum\n");
> +		return -EFAULT;
> +	}
> +
> +	/* currently only 1 lane */

You've probably meant "1 or 2 lanes". Still a switchcase might be
better.

> +	dp->link.cap.lanes = DP_LANE_NUM_1;
> +
> +	return 0;
> +}
> +
> +static int dp_link_training_cr(struct dp_dev *dp)
> +{
> +	u8 lane_status[DP_LINK_STATUS_SIZE] = {0};
> +	bool level_changed;
> +	u32 voltage_tries;
> +	u32 cr_tries;
> +	u32 max_cr;
> +	int ret;
> +
> +	/*
> +	 * DP 1.4 spec define 10 for maxtries value, for pre DP 1.4 version set a limit of 80
> +	 * (4 voltage levels x 4 preemphasis levels x 5 identical voltage retries)
> +	 */
> +	max_cr = dp->link.cap.rx_dpcd_revision >= DPCD_REVISION_14 ? 10 : 80;
> +
> +	voltage_tries = 1;
> +	for (cr_tries = 0; cr_tries < max_cr; cr_tries++) {
> +		drm_dp_link_train_clock_recovery_delay(&dp->aux, dp->dpcd);
> +
> +		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
> +		if (ret != DP_LINK_STATUS_SIZE) {
> +			drm_err(dp->dev, "Get lane status failed\n");
> +			return ret;
> +		}
> +
> +		if (drm_dp_clock_recovery_ok(lane_status, dp->link.cap.lanes)) {
> +			drm_info(dp->dev, "dp link training cr done\n");
> +			dp->link.status.clock_recovered = true;
> +			return 0;
> +		}
> +
> +		if (voltage_tries == 5) {
> +			drm_info(dp->dev, "same voltage tries 5 times\n");
> +			dp->link.status.clock_recovered = false;
> +			return 0;
> +		}
> +
> +		level_changed = dp_link_get_adjust_train(dp, lane_status);
> +		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
> +					dp->link.cap.lanes);
> +		if (ret != dp->link.cap.lanes) {
> +			drm_err(dp->dev, "Update link training failed\n");
> +			return ret;
> +		}
> +
> +		voltage_tries = level_changed ? 1 : voltage_tries + 1;
> +	}
> +
> +	drm_err(dp->dev, "dp link training clock recovery %u timers failed\n", max_cr);
> +	dp->link.status.clock_recovered = false;
> +
> +	return 0;
> +}
> +
> +static int dp_link_training_channel_eq(struct dp_dev *dp)
> +{
> +	u8 lane_status[DP_LINK_STATUS_SIZE] = {0};
> +	enum dp_pattern_e tps;
> +	u8 eq_tries;
> +	int ret;
> +
> +	if (dp->link.cap.is_tps4)
> +		tps = DP_PATTERN_TPS4;
> +	else if (dp->link.cap.is_tps3)
> +		tps = DP_PATTERN_TPS3;
> +	else
> +		tps = DP_PATTERN_TPS2;
> +
> +	ret = dp_link_set_pattern(dp, tps);
> +	if (ret)
> +		return ret;
> +
> +	for (eq_tries = 0; eq_tries < EQ_MAX_RETRY; eq_tries++) {
> +		drm_dp_link_train_channel_eq_delay(&dp->aux, dp->dpcd);
> +
> +		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
> +		if (ret != DP_LINK_STATUS_SIZE) {
> +			drm_err(dp->dev, "get lane status failed\n");
> +			break;
> +		}
> +
> +		if (!drm_dp_clock_recovery_ok(lane_status, dp->link.cap.lanes)) {
> +			drm_info(dp->dev, "clock recovery check failed\n");
> +			drm_info(dp->dev, "cannot continue channel equalization\n");
> +			dp->link.status.clock_recovered = false;
> +			break;
> +		}
> +
> +		if (drm_dp_channel_eq_ok(lane_status, dp->link.cap.lanes)) {
> +			dp->link.status.channel_equalized = true;
> +			drm_info(dp->dev, "dp link training eq done\n");
> +			break;
> +		}
> +
> +		dp_link_get_adjust_train(dp, lane_status);
> +		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
> +					dp->link.train_set, dp->link.cap.lanes);
> +		if (ret != dp->link.cap.lanes) {
> +			drm_err(dp->dev, "Update link training failed\n");
> +			break;
> +		}
> +	}
> +
> +	if (eq_tries == EQ_MAX_RETRY)
> +		drm_err(dp->dev, "channel equalization failed %u times\n", eq_tries);
> +
> +	dp_link_set_pattern(dp, DP_PATTERN_NO);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int dp_link_downgrade_training_cr(struct dp_dev *dp)
> +{
> +	if (dp_link_reduce_rate(dp))
> +		return dp_link_reduce_lane(dp);
> +
> +	return 0;
> +}
> +
> +static int dp_link_downgrade_training_eq(struct dp_dev *dp)
> +{
> +	if ((dp->link.status.clock_recovered && !dp->link.status.channel_equalized)) {
> +		if (!dp_link_reduce_lane(dp))
> +			return 0;
> +	}
> +
> +	return dp_link_reduce_rate(dp);
> +}
> +
> +int dp_link_training(struct dp_dev *dp)
> +{
> +	struct hibmc_dp_link *link = &dp->link;
> +	int ret;
> +
> +	while (true) {
> +		ret = dp_link_training_cr_pre(dp);
> +		if (ret)
> +			goto err;
> +
> +		ret = dp_link_training_cr(dp);
> +		if (ret)
> +			goto err;
> +
> +		if (!link->status.clock_recovered) {
> +			ret = dp_link_downgrade_training_cr(dp);
> +			if (ret)
> +				goto err;
> +			continue;
> +		}
> +
> +		ret = dp_link_training_channel_eq(dp);
> +		if (ret)
> +			goto err;
> +
> +		if (!link->status.channel_equalized) {
> +			ret = dp_link_downgrade_training_eq(dp);
> +			if (ret)
> +				goto err;
> +			continue;
> +		}
> +
> +		return 0;
> +	}
> +
> +err:
> +	dp_link_set_pattern(dp, DP_PATTERN_NO);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.h
> new file mode 100644
> index 000000000000..38877d8f473b
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (c) 2024 Hisilicon Limited. */
> +
> +#ifndef DP_LINK_H
> +#define DP_LINK_H
> +
> +#include "dp_comm.h"
> +
> +#define DP_LANE_NUM_MAX		2
> +#define DP_LANE_STATUS_SIZE	1
> +#define DP_LANE_NUM_1		0x1
> +#define DP_LANE_NUM_2		0x2
> +
> +enum dp_pattern_e {
> +	DP_PATTERN_NO = 0,
> +	DP_PATTERN_TPS1,
> +	DP_PATTERN_TPS2,
> +	DP_PATTERN_TPS3,
> +	DP_PATTERN_TPS4,
> +};
> +
> +int dp_link_training(struct dp_dev *dp);
> +u8 dp_get_link_rate(u8 index);
> +
> +#endif
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
