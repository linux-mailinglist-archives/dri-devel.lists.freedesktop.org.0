Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE427996246
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F3110E683;
	Wed,  9 Oct 2024 08:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJVuUW+V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF00010E683
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728462022; x=1759998022;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rG0XqoZFGH9Y2c0xiFmDQwWZ2CiVzBgcK+dusQrBmB8=;
 b=mJVuUW+VCBjwmXkmWpHWHT0XroqZPxcNUnEVccDuWnyyFt7mLGCbXjL4
 8dcLpKqbDXlz12DAw8tm/r/5jgLbwBzpOARh7V9H3FgKCjKt4sTUVNbY4
 rMf+h8wM4W26d75y40oen8Tnr/qyrPHU+pnVcwui6zUUB/En9GWxvPGHk
 LIPPPLJFKG4mY8gv3T4lc0zaVVLgA+qJ/g9wPXp7P5LkxscIzqrNpDq02
 lPNA3MSDGnx5TmHR8/Hr+saV3Tfm6XVmvO5kYGbbCVLT/xuK5Buxd83xq
 NZo0mZqpROfU9QH/sshKrtxkBIJLHJszpE4UGVU7FEHk9uvqv0lf2kZBL Q==;
X-CSE-ConnectionGUID: ZKGF0bWdQryx6jvCcKA45A==
X-CSE-MsgGUID: hZc1lMa1QgKkb+Glb3A1jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="15367458"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="15367458"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:20:21 -0700
X-CSE-ConnectionGUID: ZNbW5dmWSg6vFSPxhdR8vg==
X-CSE-MsgGUID: i0j0TLMTQkiMkJMiJWvM/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="81009908"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.80])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:20:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: shiyongbang <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com
Cc: liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com,
 shiyongbang@huawei.com, libaihan@huawei.com, shenjian15@huawei.com,
 shaojijie@huawei.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 2/4] drm/hisilicon/hibmc: add dp link moduel in
 hibmc drivers
In-Reply-To: <20240930100610.782363-3-shiyongbang@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240930100610.782363-1-shiyongbang@huawei.com>
 <20240930100610.782363-3-shiyongbang@huawei.com>
Date: Wed, 09 Oct 2024 11:20:12 +0300
Message-ID: <878quxbscj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 30 Sep 2024, shiyongbang <shiyongbang@huawei.com> wrote:
> From: baihan li <libaihan@huawei.com>
>
> Add link training process functions in this moduel.

Lots of duplication of drm_dp_helper.[ch] stuff here too. I'll mention a
few inline, but there's more.

BR,
Jani.

>
> Signed-off-by: baihan li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile     |   2 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c | 258 ++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 390 +++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.h |  24 ++
>  4 files changed, 673 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
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
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
> new file mode 100644
> index 000000000000..4091723473ad
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
> @@ -0,0 +1,258 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2024 Hisilicon Limited.
> +
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include "dp_config.h"
> +#include "dp_comm.h"
> +#include "dp_reg.h"
> +#include "dp_kapi.h"
> +#include "dp_link.h"
> +
> +#define DP_LINK_RATE_HBR 0xa
> +
> +static int hibmc_dp_link_init(struct hibmc_dp_dev *dp)
> +{
> +	dp->link.cap.lanes = 2;
> +	dp->link.train_set = devm_kzalloc(dp->dev->dev,
> +					  dp->link.cap.lanes * sizeof(u8), GFP_KERNEL);
> +	if (!dp->link.train_set)
> +		return -ENOMEM;
> +
> +	dp->link.cap.link_rate = DP_LINK_RATE_HBR;
> +
> +	return 0;
> +}
> +
> +static void hibmc_dp_aux_init(struct hibmc_dp_dev *dp)
> +{
> +	struct hibmc_dp_aux *aux = &dp->aux;
> +
> +	aux->addr = dp->base;
> +	/* aux read/write lock */
> +	mutex_init(&aux->lock);
> +	dp_write_bits(aux->addr + DP_AUX_REQ, DP_CFG_AUX_SYNC_LEN_SEL, 0x0);
> +	dp_write_bits(aux->addr + DP_AUX_REQ, DP_CFG_AUX_TIMER_TIMEOUT, 0x1);
> +	dp_write_bits(aux->addr + DP_AUX_REQ, DP_CFG_AUX_MIN_PULSE_NUM, DP_MIN_PULSE_NUM);
> +}
> +
> +static void hibmc_dp_aux_uninit(struct hibmc_dp_dev *dp)
> +{
> +	struct hibmc_dp_aux *aux = &dp->aux;
> +
> +	mutex_destroy(&aux->lock);
> +}
> +
> +static void hibmc_dp_set_tu(struct hibmc_dp_dev *dp, struct dp_mode *mode)
> +{
> +	u32 tu_symbol_frac_size;
> +	u32 tu_symbol_size;
> +	u64 pixel_clock;
> +	u64 rate_ks;
> +	u8 lane_num;
> +	u32 value;
> +	u32 bpp;
> +
> +	pixel_clock = mode->pixel_clock;
> +	lane_num = dp->link.cap.lanes;
> +	if (lane_num == 0) {
> +		drm_err(dp->dev, "set tu failed, lane num cannot be 0!\n");
> +		return;
> +	}
> +
> +	bpp = DP_BPP;
> +	rate_ks = dp->link.cap.link_rate * DP_LINK_RATE_CAL;
> +	value = (pixel_clock * bpp * 5000) / (61 * lane_num * rate_ks);
> +
> +	if (value % 10 == 9) { /* 10: div, 9: carry */
> +		tu_symbol_size = value / 10 + 1; /* 10: div */
> +		tu_symbol_frac_size = 0;
> +	} else {
> +		tu_symbol_size = value / 10; /* 10: div */
> +		tu_symbol_frac_size = value % 10 + 1; /* 10: div */
> +	}
> +
> +	drm_info(dp->dev, "tu value: %u.%u value: %u\n",
> +		 tu_symbol_size, tu_symbol_frac_size, value);
> +
> +	dp_write_bits(dp->base + DP_VIDEO_PACKET,
> +		      DP_CFG_STREAM_TU_SYMBOL_SIZE, tu_symbol_size);
> +	dp_write_bits(dp->base + DP_VIDEO_PACKET,
> +		      DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE, tu_symbol_frac_size);
> +}
> +
> +static void hibmc_dp_set_sst(struct hibmc_dp_dev *dp, struct dp_mode *mode)
> +{
> +	u32 hblank_size;
> +	u32 htotal_size;
> +	u32 htotal_int;
> +	u32 hblank_int;
> +	u32 fclk; /* flink_clock */
> +
> +	fclk = dp->link.cap.link_rate * DP_LINK_RATE_CAL;
> +
> +	/* ssc: 9947 / 10000 = 0.9947 */
> +	htotal_int = mode->h_total * 9947 / 10000;
> +	htotal_size = (u32)((u64)htotal_int * fclk / (DP_SYMBOL_PER_FCLK * mode->pixel_clock));
> +
> +	/* ssc: max effect bandwidth 53 / 10000 = 0.53% */
> +	hblank_int = mode->h_blank - mode->h_active * 53 / 10000;
> +	hblank_size = (u64)hblank_int * fclk * 9947 /
> +		      ((u64)mode->pixel_clock * 10000 * DP_SYMBOL_PER_FCLK);
> +
> +	drm_info(dp->dev, "h_active %u v_active %u htotal_size %u hblank_size %u",
> +		 mode->h_active, mode->v_active, htotal_size, hblank_size);
> +	drm_info(dp->dev, "flink_clock %u pixel_clock %u", fclk, mode->pixel_clock);
> +
> +	dp_write_bits(dp->base + DP_VIDEO_HORIZONTAL_SIZE, DP_CFG_STREAM_HTOTAL_SIZE, htotal_size);
> +	dp_write_bits(dp->base + DP_VIDEO_HORIZONTAL_SIZE, DP_CFG_STREAM_HBLANK_SIZE, hblank_size);
> +}
> +
> +static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct dp_mode *mode)
> +{
> +	u32 timing_delay;
> +	u32 vblank;
> +	u32 hstart;
> +	u32 vstart;
> +
> +	vblank = mode->v_total - mode->v_active;
> +	timing_delay = mode->h_sync + mode->h_back;
> +	hstart = mode->h_sync + mode->h_back;
> +	vstart = mode->v_sync + mode->v_back;
> +
> +	dp_write_bits(dp->base + DP_TIMING_GEN_CONFIG0,
> +		      DP_CFG_TIMING_GEN0_HBLANK, mode->h_blank);
> +	dp_write_bits(dp->base + DP_TIMING_GEN_CONFIG0,
> +		      DP_CFG_TIMING_GEN0_HACTIVE, mode->h_active);
> +
> +	dp_write_bits(dp->base + DP_TIMING_GEN_CONFIG2,
> +		      DP_CFG_TIMING_GEN0_VBLANK, vblank);
> +	dp_write_bits(dp->base + DP_TIMING_GEN_CONFIG2,
> +		      DP_CFG_TIMING_GEN0_VACTIVE, mode->v_active);
> +	dp_write_bits(dp->base + DP_TIMING_GEN_CONFIG3,
> +		      DP_CFG_TIMING_GEN0_VFRONT_PORCH, mode->v_front);
> +
> +	dp_write_bits(dp->base + DP_VIDEO_CONFIG0,
> +		      DP_CFG_STREAM_HACTIVE, mode->h_active);
> +	dp_write_bits(dp->base + DP_VIDEO_CONFIG0,
> +		      DP_CFG_STREAM_HBLANK, mode->h_blank);
> +	dp_write_bits(dp->base + DP_VIDEO_CONFIG2,
> +		      DP_CFG_STREAM_HSYNC_WIDTH, mode->h_sync);
> +
> +	dp_write_bits(dp->base + DP_VIDEO_CONFIG1,
> +		      DP_CFG_STREAM_VACTIVE, mode->v_active);
> +	dp_write_bits(dp->base + DP_VIDEO_CONFIG1,
> +		      DP_CFG_STREAM_VBLANK, vblank);
> +	dp_write_bits(dp->base + DP_VIDEO_CONFIG3,
> +		      DP_CFG_STREAM_VFRONT_PORCH, mode->v_front);
> +	dp_write_bits(dp->base + DP_VIDEO_CONFIG3,
> +		      DP_CFG_STREAM_VSYNC_WIDTH, mode->v_sync);
> +
> +	dp_write_bits(dp->base + DP_VIDEO_MSA0,
> +		      DP_CFG_STREAM_VSTART, vstart);
> +	dp_write_bits(dp->base + DP_VIDEO_MSA0,
> +		      DP_CFG_STREAM_HSTART, hstart);
> +
> +	dp_write_bits(dp->base + DP_VIDEO_CTRL,
> +		      DP_CFG_STREAM_VSYNC_POLARITY, mode->v_pol);
> +	dp_write_bits(dp->base + DP_VIDEO_CTRL,
> +		      DP_CFG_STREAM_HSYNC_POLARITY, mode->h_pol);
> +
> +	/* MSA mic 0 and 1*/
> +	writel(DP_MSA1, dp->base + DP_VIDEO_MSA1);
> +	writel(DP_MSA2, dp->base + DP_VIDEO_MSA2);
> +
> +	hibmc_dp_set_tu(dp, mode);
> +
> +	dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_RGB_ENABLE, 0x1);
> +	dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_VIDEO_MAPPING, 0);
> +
> +	/*divide 2: up even */
> +	if (timing_delay % 2)
> +		timing_delay++;
> +
> +	dp_write_bits(dp->base + DP_TIMING_MODEL_CTRL,
> +		      DP_CFG_PIXEL_NUM_TIMING_MODE_SEL1, timing_delay);
> +
> +	hibmc_dp_set_sst(dp, mode);
> +}
> +
> +int hibmc_dp_kapi_init(struct hibmc_dp *dp)
> +{
> +	struct drm_device *drm_dev = dp->drm_dev;
> +	struct hibmc_dp_dev *dp_dev;
> +	int ret;
> +
> +	dp_dev = devm_kzalloc(drm_dev->dev, sizeof(struct hibmc_dp_dev), GFP_KERNEL);
> +	if (!dp_dev)
> +		return -ENOMEM;
> +
> +	dp->dp_dev = dp_dev;
> +
> +	dp_dev->dev = drm_dev;
> +	dp_dev->base = dp->mmio + DP_OFFSET;
> +
> +	hibmc_dp_aux_init(dp_dev);
> +
> +	ret = hibmc_dp_link_init(dp_dev);
> +	if (ret) {
> +		drm_err(drm_dev, "dp link init failed\n");
> +		hibmc_dp_aux_uninit(dp_dev);
> +		return ret;
> +	}
> +
> +	/* hdcp data */
> +	writel(DP_HDCP, dp_dev->base + DP_HDCP_CFG);
> +	/* int init */
> +	writel(0, dp_dev->base + DP_INTR_ENABLE);
> +	writel(DP_INT_RST, dp_dev->base + DP_INTR_ORIGINAL_STATUS);
> +	/* rst */
> +	writel(DP_DPTX_RST, dp_dev->base + DP_DPTX_RST_CTRL);
> +	/* clock enable */
> +	writel(DP_CLK_EN, dp_dev->base + DP_DPTX_CLK_CTRL);
> +
> +	return 0;
> +}
> +
> +void hibmc_dp_kapi_uninit(struct hibmc_dp *dp)
> +{
> +	hibmc_dp_aux_uninit(dp->dp_dev);
> +}
> +
> +void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable)
> +{
> +	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
> +
> +	if (enable) {
> +		dp_write_bits(dp_dev->base + DP_VIDEO_CTRL, BIT(0), 0x1);
> +		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
> +		dp_write_bits(dp_dev->base + DP_DPTX_GCTL0, BIT(10), 0x1);
> +		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
> +	} else {
> +		dp_write_bits(dp_dev->base + DP_DPTX_GCTL0, BIT(10), 0);
> +		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
> +		dp_write_bits(dp_dev->base + DP_VIDEO_CTRL, BIT(0), 0);
> +		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
> +	}
> +
> +	msleep(50);
> +}
> +
> +int hibmc_dp_mode_set(struct hibmc_dp *dp, struct dp_mode *mode)
> +{
> +	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
> +	int ret;
> +
> +	if (!dp_dev->link.status.channel_equalized) {
> +		ret = dp_link_training(dp_dev);
> +		if (ret) {
> +			drm_err(dp->drm_dev, "dp link training failed, ret: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	hibmc_dp_display_en(dp, false);
> +	hibmc_dp_link_cfg(dp_dev, mode);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> new file mode 100644
> index 000000000000..0a10cae1d8a4
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> @@ -0,0 +1,390 @@
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
> +static int dp_link_training_configure(struct hibmc_dp_dev *dp)
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
> +	buf[0] = dp->link.cap.link_rate;
> +	buf[1] = DPCD_ENHANCED_FRAME_EN | dp->link.cap.lanes;
> +	ret = dp_aux_write(dp, DPCD_LINK_BW_SET, buf, sizeof(buf));
> +	if (ret) {
> +		drm_err(dp->dev, "dp aux write link rate and lanes failed, ret: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* set 8b/10b and downspread */
> +	buf[0] = 0x10;
> +	buf[1] = 0x1;
> +	ret = dp_aux_write(dp, DPCD_DOWNSPREAD_CTRL, buf, sizeof(buf));
> +	if (ret)
> +		drm_err(dp->dev, "dp aux write 8b/10b and downspread failed, ret: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int dp_link_pattern2dpcd(struct hibmc_dp_dev *dp, enum dp_pattern_e pattern)
> +{
> +	switch (pattern) {
> +	case DP_PATTERN_NO:
> +		return DPCD_TRAINING_PATTERN_DISABLE;
> +	case DP_PATTERN_TPS1:
> +		return DPCD_TRAINING_PATTERN_1;
> +	case DP_PATTERN_TPS2:
> +		return DPCD_TRAINING_PATTERN_2;
> +	case DP_PATTERN_TPS3:
> +		return DPCD_TRAINING_PATTERN_3;
> +	case DP_PATTERN_TPS4:
> +		return DPCD_TRAINING_PATTERN_4;
> +	default:
> +		drm_err(dp->dev, "dp link unknown pattern %d\n", pattern);
> +		return -EINVAL;
> +	}
> +}
> +
> +static int dp_link_set_pattern(struct hibmc_dp_dev *dp, enum dp_pattern_e pattern)
> +{
> +	int ret;
> +	u8 buf;
> +
> +	ret = dp_link_pattern2dpcd(dp, pattern);
> +	if (ret < 0)
> +		return ret;
> +
> +	buf = (u8)ret;
> +	if (pattern != DPCD_TRAINING_PATTERN_DISABLE && pattern != DPCD_TRAINING_PATTERN_4) {
> +		buf |= DPCD_SCRAMBLING_DISABLE;
> +		dp_write_bits(dp->base + DP_PHYIF_CTRL0, DP_CFG_SCRAMBLE_EN, 0x1);
> +	} else {
> +		dp_write_bits(dp->base + DP_PHYIF_CTRL0, DP_CFG_SCRAMBLE_EN, 0);
> +	}
> +
> +	dp_write_bits(dp->base + DP_PHYIF_CTRL0, DP_CFG_PAT_SEL, pattern);
> +
> +	ret = dp_aux_write(dp, DPCD_TRAINING_PATTERN_SET, &buf, sizeof(buf));
> +	if (ret)
> +		drm_err(dp->dev, "dp aux write training pattern set failed\n");
> +
> +	return ret;
> +}
> +
> +static int dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
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
> +		train_set[i] = DPCD_VOLTAGE_SWING_LEVEL_2 | DPCD_PRE_EMPHASIS_LEVEL_0;
> +
> +	ret = dp_aux_write(dp, DPCD_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
> +	if (ret)
> +		drm_err(dp->dev, "dp aux write training lane set failed\n");
> +
> +	return ret;
> +}
> +
> +static bool dp_dpcd_cr_done_check_and_update(u8 lane_status, u8 lane_count,
> +					     u8 *cr_done_lanes)

drm_dp_clock_recovery_ok().

> +{
> +	bool is_ok = true;
> +	u8 val;
> +
> +	*cr_done_lanes = GENMASK(lane_count - 1, 0);
> +
> +	for (u8 lane = 0; lane < lane_count; lane++) {
> +		val = lane_status >> (lane * AUX_4_BIT);
> +		if ((val & DPCD_CR_DONE_BITS) == 0) {
> +			*cr_done_lanes &= ~(BIT(lane));
> +			is_ok = false;
> +		}
> +	}
> +
> +	return is_ok;
> +}
> +
> +static bool dp_dpcd_eq_is_ok(u8 lane_status, u8 lane_count)

drm_dp_channel_eq_ok().

> +{
> +	u8 val;
> +
> +	for (u8 lane = 0; lane < lane_count; lane++) {
> +		val = (lane_status >> (lane * AUX_4_BIT));
> +		if ((val & DPCD_EQ_DONE_BITS) != DPCD_EQ_DONE_BITS)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static bool dp_link_get_adjust_train(struct hibmc_dp_dev *dp, u8 lane_status)

drm_dp_get_adjust_request_voltage()
drm_dp_get_adjust_request_pre_emphasis()

> +{
> +	u8 pre_emph[DP_LANE_NUM_MAX] = {0};
> +	u8 voltage[DP_LANE_NUM_MAX] = {0};
> +	bool changed = false;
> +	u8 train_set;
> +	u8 lane;
> +
> +	/* not support level 3 */
> +	for (lane = 0; lane < dp->link.cap.lanes; lane++) {
> +		voltage[lane] = (lane_status & (DPCD_VOLTAGE_SWING_LANE_0 << (AUX_4_BIT * lane)))
> +			  << DPCD_VOLTAGE_SWING_SET_S;
> +		pre_emph[lane] = (lane_status & (DPCD_PRE_EMPHASIS_LANE_0 << (AUX_4_BIT * lane)))
> +			   << DPCD_PRE_EMPHASIS_SET_S;
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
> +static int dp_link_reduce_rate(struct hibmc_dp_dev *dp)
> +{
> +	u8 link_rate_map[DP_LINK_RATE_NUM] = {DP_LINK_RATE_0, DP_LINK_RATE_1,
> +					      DP_LINK_RATE_2, DP_LINK_RATE_3};
> +
> +	for (u8 i = 0; i < DP_LINK_RATE_NUM; i++) {
> +		if (link_rate_map[i] == dp->link.cap.link_rate) {
> +			if (i == 0) {
> +				drm_err(dp->dev, "dp link training reduce rate failed, already lowest rate\n");
> +				return -EFAULT;
> +			}
> +			dp->link.cap.link_rate = link_rate_map[i - 1];
> +			return 0;
> +		}
> +	}
> +
> +	drm_err(dp->dev, "dp link training reduce rate failed, rate match failed\n");
> +	return -EFAULT;
> +}
> +
> +static int dp_link_reduce_lane(struct hibmc_dp_dev *dp)
> +{
> +	/* currently only 1 lane */
> +	dp->link.cap.lanes = DP_LANE_NUM_1;
> +
> +	return 0;
> +}
> +
> +static int dp_link_training_cr(struct hibmc_dp_dev *dp)
> +{
> +	u8 lane_status[DP_LANE_STATUS_SIZE] = {0};
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
> +		msleep(50);
> +
> +		ret = dp_aux_read(dp, DPCD_LANE0_1_STATUS, lane_status, DP_LANE_STATUS_SIZE);
> +		if (ret) {
> +			drm_err(dp->dev, "Get lane status failed\n");
> +			return ret;
> +		}
> +
> +		ret = dp_dpcd_cr_done_check_and_update(lane_status[0], dp->link.cap.lanes,
> +						       &dp->link.status.cr_done_lanes);
> +		if (ret) {
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
> +		ret = dp_aux_read(dp, DPCD_ADJUST_REQUEST_LANE0_1, lane_status,
> +				  DP_LANE_STATUS_SIZE);
> +		if (ret) {
> +			drm_err(dp->dev, "Get adjust status failed\n");
> +			return ret;
> +		}
> +
> +		level_changed = dp_link_get_adjust_train(dp, lane_status[0]);
> +		ret = dp_aux_write(dp, DPCD_TRAINING_LANE0_SET, dp->link.train_set,
> +				   dp->link.cap.lanes);
> +		if (ret) {
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
> +static int dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
> +{
> +	u8 lane_status[DP_LANE_STATUS_SIZE] = {0};
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
> +		msleep(50);
> +
> +		ret = dp_aux_read(dp, DPCD_LANE0_1_STATUS, lane_status, DP_LANE_STATUS_SIZE);
> +		if (ret) {
> +			drm_err(dp->dev, "get lane status failed\n");
> +			break;
> +		}
> +
> +		ret = dp_dpcd_cr_done_check_and_update(lane_status[0], dp->link.cap.lanes,
> +						       &dp->link.status.cr_done_lanes);
> +		if (!ret) {
> +			drm_info(dp->dev, "clock recovery check failed\n");
> +			drm_info(dp->dev, "cannot continue channel equalization\n");
> +			dp->link.status.clock_recovered = false;
> +			break;
> +		}
> +
> +		ret = dp_dpcd_eq_is_ok(lane_status[0], dp->link.cap.lanes);
> +		if (ret) {
> +			dp->link.status.channel_equalized = true;
> +			drm_info(dp->dev, "dp link training eq done\n");
> +			break;
> +		}
> +
> +		ret = dp_aux_read(dp, DPCD_ADJUST_REQUEST_LANE0_1,
> +				  lane_status, DP_LANE_STATUS_SIZE);
> +		if (ret) {
> +			drm_err(dp->dev, "Get adjust status failed\n");
> +			return ret;
> +		}
> +
> +		dp_link_get_adjust_train(dp, lane_status[0]);
> +
> +		ret = dp_aux_write(dp, DPCD_TRAINING_LANE0_SET,
> +				   dp->link.train_set, dp->link.cap.lanes);
> +		if (ret) {
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
> +	return ret;
> +}
> +
> +static int dp_link_downgrade_training_cr(struct hibmc_dp_dev *dp)
> +{
> +	if (dp_link_reduce_rate(dp))
> +		return dp_link_reduce_lane(dp);
> +
> +	return 0;
> +}
> +
> +static int dp_link_downgrade_training_eq(struct hibmc_dp_dev *dp)
> +{
> +	if ((!dp->link.status.clock_recovered && dp->link.status.cr_done_lanes != 0) ||
> +	    (dp->link.status.clock_recovered && !dp->link.status.channel_equalized)) {
> +		if (!dp_link_reduce_lane(dp))
> +			return 0;
> +	}
> +
> +	return dp_link_reduce_rate(dp);
> +}
> +
> +int dp_link_training(struct hibmc_dp_dev *dp)
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
> index 000000000000..3271cdc4550c
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.h
> @@ -0,0 +1,24 @@
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
> +int dp_link_training(struct hibmc_dp_dev *dp);
> +
> +#endif

-- 
Jani Nikula, Intel
