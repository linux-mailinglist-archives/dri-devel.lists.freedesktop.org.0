Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC349BA507
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 11:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696410E1FA;
	Sun,  3 Nov 2024 10:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aQWZpohd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8D910E1FA
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 10:13:37 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fb3ce15172so41883611fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Nov 2024 02:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730628815; x=1731233615; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xl6YPGWu9xA/wY5gsbGupTQ2Wt7IWT2WiaMhIs90fjw=;
 b=aQWZpohd+OITtCAz1UvGMhO5rpN0mGI/8PLCujpdsXapEqxHu+kRTzhcm5cNp3oL5l
 gqXArHEXxll+/npkCu0Ro8t4pSIcStvvBBUoBi9qZ7X36LXKhcqrdCDRjCq+6Kn4sM63
 LAXOCL3UExUaix1DZnwYYHYlhAgAbYZ2iM1s9BNGqwb1d13alx/itN3kuocpgLcXqKqi
 8OVeCgr+sRWotl4LATpyCnjcV23OY8xymfwKyOt+wKZTEijq0tSYw3fsDSzVCQoTnIuQ
 4hZlEehw1U4MfLU+1rwHEpFfwLWHH4gBRYml3vYCkbHgob2+htrXfkKuJXBXNy7k0J4K
 tkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730628815; x=1731233615;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xl6YPGWu9xA/wY5gsbGupTQ2Wt7IWT2WiaMhIs90fjw=;
 b=ZQGqE9sJDiFY+v//XajtiHPAqJYR8ELCO1AO9tPl6+fNi6dJWHFJKgbRfBDQtOS1Bw
 Wrl0haI8EBJUykhg/n2/7XTsJvAHDjLaV0wunr93hMvjCcqZ3I0udc7oHcee8FYxYEZA
 tgkXVP2/rbEjrwTRmS1F6w/Z8/UJho8BLXaD589k49Tuf8lSVnSDf/MvJOvQy6jthEXz
 xgI/OWfrba6KaPmQ5oAtYlFrY9YEhHN+jEuFelzQANl3geuh5mc9wOBvX3Qagwd1vKzM
 oeH10x51N1EWRi8n3R4pZ+oUARXbxnpZY/lOWxI+x1KMAPPDwMEEXaW8wYlGNCMMffdx
 aKKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf3V6Swp47Ev0rb4GBX6QX3wXbbePOKoAHA34OXvcryNpf0yww2OHeJizdzIXRP0gO5INhSDm0ogQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+M8+2dLUhrD5oao8j9frhwFsHqFBGa/Gj3bX8IzcuYtwNse72
 iVzqbVMPFHsBXRd6NBD4Ygg+i/avS43sOuT7jcrBJgGCzvZNGupydNO6nhDTGAU=
X-Google-Smtp-Source: AGHT+IEDktf75UkUVM5gve//7ypQdz5VhqZOkgoL1fyhYzN8HsZIVZWUYLd4VzsZqTRjd0MNA7f92w==
X-Received: by 2002:a2e:b8c1:0:b0:2fb:4b6c:4ef5 with SMTP id
 38308e7fff4ca-2fdef2ddca1mr31985751fa.24.1730628815358; 
 Sun, 03 Nov 2024 02:13:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef3aea3fsm12890961fa.19.2024.11.03.02.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 02:13:33 -0800 (PST)
Date: Sun, 3 Nov 2024 12:13:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 drm-dp 3/4] drm/hisilicon/hibmc: add dp hw moduel in
 hibmc
Message-ID: <3ke3n6mkxdcllgjohhudv6xi6csnqzpahaocpofmn26l6jdu6c@xpy2z7yeiijq>
References: <20241101105028.2177274-1-shiyongbang@huawei.com>
 <20241101105028.2177274-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101105028.2177274-4-shiyongbang@huawei.com>
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

On Fri, Nov 01, 2024 at 06:50:27PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Build a dp level that hibmc driver can enable dp by
> calling their functions.
> 
> Signed-off-by: baihan li <libaihan@huawei.com>
> Signed-off-by: yongbang shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v2 -> v3:
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410250931.UDQ9s66H-lkp@intel.com/
> v1 -> v2:
>   - changed some defines and functions to former patch, suggested by Dmitry Baryshkov.
>   - sorting the headers including in dp_hw.h and hibmc_drm_drv.c files, suggested by Dmitry Baryshkov.
>   - deleting struct dp_mode and dp_mode_cfg function, suggested by Dmitry Baryshkov.
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410040328.VeVxM9yB-lkp@intel.com/
>   v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile    |   2 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c  | 237 ++++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h  |  31 +++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h |  41 ++++
>  4 files changed, 310 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> index 94d77da88bbf..214228052ccf 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> -	       dp/dp_aux.o dp/dp_link.o
> +	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o
>  
>  obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> new file mode 100644
> index 000000000000..214897798bdb
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -0,0 +1,237 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2024 Hisilicon Limited.
> +
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include "dp_config.h"
> +#include "dp_comm.h"
> +#include "dp_reg.h"
> +#include "dp_hw.h"
> +#include "dp_link.h"
> +#include "dp_aux.h"
> +
> +static int hibmc_dp_link_init(struct dp_dev *dp)
> +{
> +	dp->link.cap.lanes = 2;
> +	dp->link.train_set = devm_kzalloc(dp->dev->dev,
> +					  dp->link.cap.lanes * sizeof(u8), GFP_KERNEL);

Can you replace it just with an array, removing a need for an additional
allocation?

> +	if (!dp->link.train_set)
> +		return -ENOMEM;
> +
> +	dp->link.cap.link_rate = 1;

Ok, this is why I don't link using indices for link rates. Which rate is
this? Unlike cap.lanes this is pure magic number. I think it should be
handled other way around: store actual link rate and convert to the
register value when required.

> +
> +	return 0;
> +}
> +
> +static void hibmc_dp_set_tu(struct dp_dev *dp, struct drm_display_mode *mode)
> +{
> +	u32 tu_symbol_frac_size;
> +	u32 tu_symbol_size;
> +	u32 rate_ks;
> +	u8 lane_num;
> +	u32 value;
> +	u32 bpp;
> +
> +	lane_num = dp->link.cap.lanes;
> +	if (lane_num == 0) {
> +		drm_err(dp->dev, "set tu failed, lane num cannot be 0!\n");
> +		return;
> +	}
> +
> +	bpp = DP_BPP;

Where is this defined? Is it hibmc-specific or a generic value?

> +	rate_ks = hibmc_dp_get_link_rate(dp->link.cap.link_rate) * DP_LINK_RATE_CAL;

same question

> +	value = (mode->clock * bpp * 5) / (61 * lane_num * rate_ks);
> +
> +	if (value % 10 == 9) { /* 9 carry */
> +		tu_symbol_size = value / 10 + 1;
> +		tu_symbol_frac_size = 0;
> +	} else {
> +		tu_symbol_size = value / 10;
> +		tu_symbol_frac_size = value % 10 + 1;
> +	}
> +
> +	drm_info(dp->dev, "tu value: %u.%u value: %u\n",
> +		 tu_symbol_size, tu_symbol_frac_size, value);
> +
> +	dp_reg_write_field(dp->base + DP_VIDEO_PACKET,
> +			   DP_CFG_STREAM_TU_SYMBOL_SIZE, tu_symbol_size);
> +	dp_reg_write_field(dp->base + DP_VIDEO_PACKET,
> +			   DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE, tu_symbol_frac_size);
> +}
> +
> +static void hibmc_dp_set_sst(struct dp_dev *dp, struct drm_display_mode *mode)
> +{
> +	u32 hblank_size;
> +	u32 htotal_size;
> +	u32 htotal_int;
> +	u32 hblank_int;
> +	u32 fclk; /* flink_clock */
> +
> +	fclk = hibmc_dp_get_link_rate(dp->link.cap.link_rate) * DP_LINK_RATE_CAL;
> +
> +	/* ssc: 9947 / 10000 = 0.9947 */

This is obvious. More interesting question might be what exactly is
0.9947 (or 0.53 %).

> +	htotal_int = mode->htotal * 9947 / 10000;
> +	htotal_size = (u32)(htotal_int * fclk / (DP_SYMBOL_PER_FCLK * (mode->clock / 1000)));

Drop u32 ?

> +
> +	/* ssc: max effect bandwidth 53 / 10000 = 0.53% */
> +	hblank_int = (mode->htotal - mode->hdisplay) - mode->hdisplay * 53 / 10000;
> +	hblank_size = hblank_int * fclk * 9947 /
> +		      (mode->clock * 10 * DP_SYMBOL_PER_FCLK);
> +
> +	drm_info(dp->dev, "h_active %u v_active %u htotal_size %u hblank_size %u",
> +		 mode->hdisplay, mode->vdisplay, htotal_size, hblank_size);
> +	drm_info(dp->dev, "flink_clock %u pixel_clock %d", fclk, (mode->clock / 1000));
> +
> +	dp_reg_write_field(dp->base + DP_VIDEO_HORIZONTAL_SIZE,
> +			   DP_CFG_STREAM_HTOTAL_SIZE, htotal_size);
> +	dp_reg_write_field(dp->base + DP_VIDEO_HORIZONTAL_SIZE,
> +			   DP_CFG_STREAM_HBLANK_SIZE, hblank_size);
> +}
> +
> +static void hibmc_dp_link_cfg(struct dp_dev *dp, struct drm_display_mode *mode)
> +{
> +	u32 timing_delay;
> +	u32 vblank;
> +	u32 hstart;
> +	u32 vstart;
> +
> +	vblank = mode->vtotal - mode->vdisplay;
> +	timing_delay = mode->htotal - mode->hsync_start;
> +	hstart = mode->htotal - mode->hsync_start;
> +	vstart = mode->vtotal - mode->vsync_start;
> +
> +	dp_reg_write_field(dp->base + DP_TIMING_GEN_CONFIG0,
> +			   DP_CFG_TIMING_GEN0_HBLANK, (mode->htotal - mode->hdisplay));
> +	dp_reg_write_field(dp->base + DP_TIMING_GEN_CONFIG0,
> +			   DP_CFG_TIMING_GEN0_HACTIVE, mode->hdisplay);
> +
> +	dp_reg_write_field(dp->base + DP_TIMING_GEN_CONFIG2,
> +			   DP_CFG_TIMING_GEN0_VBLANK, vblank);
> +	dp_reg_write_field(dp->base + DP_TIMING_GEN_CONFIG2,
> +			   DP_CFG_TIMING_GEN0_VACTIVE, mode->vdisplay);
> +	dp_reg_write_field(dp->base + DP_TIMING_GEN_CONFIG3,
> +			   DP_CFG_TIMING_GEN0_VFRONT_PORCH, (mode->vsync_start - mode->vdisplay));
> +
> +	dp_reg_write_field(dp->base + DP_VIDEO_CONFIG0,
> +			   DP_CFG_STREAM_HACTIVE, mode->hdisplay);
> +	dp_reg_write_field(dp->base + DP_VIDEO_CONFIG0,
> +			   DP_CFG_STREAM_HBLANK, (mode->htotal - mode->hdisplay));
> +	dp_reg_write_field(dp->base + DP_VIDEO_CONFIG2,
> +			   DP_CFG_STREAM_HSYNC_WIDTH, (mode->hsync_end - mode->hsync_start));
> +
> +	dp_reg_write_field(dp->base + DP_VIDEO_CONFIG1,
> +			   DP_CFG_STREAM_VACTIVE, mode->vdisplay);
> +	dp_reg_write_field(dp->base + DP_VIDEO_CONFIG1,
> +			   DP_CFG_STREAM_VBLANK, vblank);
> +	dp_reg_write_field(dp->base + DP_VIDEO_CONFIG3,
> +			   DP_CFG_STREAM_VFRONT_PORCH, (mode->vsync_start - mode->vdisplay));
> +	dp_reg_write_field(dp->base + DP_VIDEO_CONFIG3,
> +			   DP_CFG_STREAM_VSYNC_WIDTH, (mode->vsync_end - mode->vsync_start));
> +
> +	dp_reg_write_field(dp->base + DP_VIDEO_MSA0,
> +			   DP_CFG_STREAM_VSTART, vstart);
> +	dp_reg_write_field(dp->base + DP_VIDEO_MSA0,
> +			   DP_CFG_STREAM_HSTART, hstart);
> +
> +	dp_reg_write_field(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_VSYNC_POLARITY,
> +			   mode->flags & DRM_MODE_FLAG_PVSYNC ? 1 : 0);
> +	dp_reg_write_field(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_HSYNC_POLARITY,
> +			   mode->flags & DRM_MODE_FLAG_PHSYNC ? 1 : 0);
> +
> +	/* MSA mic 0 and 1 */
> +	writel(DP_MSA1, dp->base + DP_VIDEO_MSA1);
> +	writel(DP_MSA2, dp->base + DP_VIDEO_MSA2);
> +
> +	hibmc_dp_set_tu(dp, mode);
> +
> +	dp_reg_write_field(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_RGB_ENABLE, 0x1);
> +	dp_reg_write_field(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_VIDEO_MAPPING, 0);
> +
> +	/* divide 2: up even */
> +	if (timing_delay % 2)
> +		timing_delay++;
> +
> +	dp_reg_write_field(dp->base + DP_TIMING_MODEL_CTRL,
> +			   DP_CFG_PIXEL_NUM_TIMING_MODE_SEL1, timing_delay);
> +
> +	hibmc_dp_set_sst(dp, mode);
> +}
> +
> +int hibmc_dp_hw_init(struct hibmc_dp *dp)
> +{
> +	struct drm_device *drm_dev = dp->drm_dev;
> +	struct dp_dev *dp_dev;
> +	int ret;
> +
> +	dp_dev = devm_kzalloc(drm_dev->dev, sizeof(struct dp_dev), GFP_KERNEL);
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
> +void hibmc_dp_hw_uninit(struct hibmc_dp *dp)
> +{
> +	// keep this uninit interface in the future use

no reason to, introduce it when required, not the other way around

> +}
> +
> +void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable)
> +{
> +	struct dp_dev *dp_dev = dp->dp_dev;
> +
> +	if (enable) {
> +		dp_reg_write_field(dp_dev->base + DP_VIDEO_CTRL, BIT(0), 0x1);
> +		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
> +		dp_reg_write_field(dp_dev->base + DP_DPTX_GCTL0, BIT(10), 0x1);
> +		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
> +	} else {
> +		dp_reg_write_field(dp_dev->base + DP_DPTX_GCTL0, BIT(10), 0);
> +		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
> +		dp_reg_write_field(dp_dev->base + DP_VIDEO_CTRL, BIT(0), 0);
> +		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
> +	}
> +
> +	msleep(50);
> +}
> +
> +int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
> +{
> +	struct dp_dev *dp_dev = dp->dp_dev;
> +	int ret;
> +
> +	if (!dp_dev->link.status.channel_equalized) {
> +		ret = hibmc_dp_link_training(dp_dev);
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
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> new file mode 100644
> index 000000000000..de802aaa8b4a
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (c) 2024 Hisilicon Limited. */
> +
> +#ifndef DP_KAPI_H
> +#define DP_KAPI_H
> +
> +#include <linux/types.h>
> +#include <linux/delay.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_print.h>
> +#include <video/videomode.h>
> +
> +struct dp_dev;

hibmc_dp_dev

> +
> +struct hibmc_dp {
> +	struct dp_dev *dp_dev;
> +	struct drm_device *drm_dev;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +	void __iomem *mmio;
> +};
> +
> +int hibmc_dp_hw_init(struct hibmc_dp *dp);
> +void hibmc_dp_hw_uninit(struct hibmc_dp *dp);
> +int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
> +void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
> +
> +#endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> index 1032f6cde761..3dcb847057a4 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> @@ -14,8 +14,26 @@
>  #define DP_AUX_STATUS			0x78
>  #define DP_PHYIF_CTRL0			0xa0
>  #define DP_VIDEO_CTRL			0x100
> +#define DP_VIDEO_CONFIG0		0x104
> +#define DP_VIDEO_CONFIG1		0x108
> +#define DP_VIDEO_CONFIG2		0x10c
> +#define DP_VIDEO_CONFIG3		0x110
> +#define DP_VIDEO_PACKET			0x114
> +#define DP_VIDEO_MSA0			0x118
> +#define DP_VIDEO_MSA1			0x11c
> +#define DP_VIDEO_MSA2			0x120
> +#define DP_VIDEO_HORIZONTAL_SIZE	0X124
> +#define DP_TIMING_GEN_CONFIG0		0x26c
> +#define DP_TIMING_GEN_CONFIG2		0x274
> +#define DP_TIMING_GEN_CONFIG3		0x278
> +#define DP_HDCP_CFG			0x600
> +#define DP_INTR_ENABLE			0x720
> +#define DP_INTR_ORIGINAL_STATUS		0x728
>  #define DP_DPTX_RST_CTRL		0x700
> +#define DP_DPTX_CLK_CTRL		0x704
>  #define DP_DPTX_GCTL0			0x708
> +#define DP_TIMING_MODEL_CTRL		0x884
> +#define DP_TIMING_SYNC_CTRL		0xFF0
>  
>  #define DP_CFG_AUX_SYNC_LEN_SEL			BIT(1)
>  #define DP_CFG_AUX_TIMER_TIMEOUT		BIT(2)
> @@ -31,5 +49,28 @@
>  #define DP_CFG_AUX_STATUS			GENMASK(11, 4)
>  #define DP_CFG_SCRAMBLE_EN			BIT(0)
>  #define DP_CFG_PAT_SEL				GENMASK(7, 4)
> +#define DP_CFG_TIMING_GEN0_HACTIVE		GENMASK(31, 16)
> +#define DP_CFG_TIMING_GEN0_HBLANK		GENMASK(15, 0)
> +#define DP_CFG_TIMING_GEN0_VACTIVE		GENMASK(31, 16)
> +#define DP_CFG_TIMING_GEN0_VBLANK		GENMASK(15, 0)
> +#define DP_CFG_TIMING_GEN0_VFRONT_PORCH		GENMASK(31, 16)
> +#define DP_CFG_STREAM_HACTIVE			GENMASK(31, 16)
> +#define DP_CFG_STREAM_HBLANK			GENMASK(15, 0)
> +#define DP_CFG_STREAM_HSYNC_WIDTH		GENMASK(15, 0)
> +#define DP_CFG_STREAM_VACTIVE			GENMASK(31, 16)
> +#define DP_CFG_STREAM_VBLANK			GENMASK(15, 0)
> +#define DP_CFG_STREAM_VFRONT_PORCH		GENMASK(31, 16)
> +#define DP_CFG_STREAM_VSYNC_WIDTH		GENMASK(15, 0)
> +#define DP_CFG_STREAM_VSTART			GENMASK(31, 16)
> +#define DP_CFG_STREAM_HSTART			GENMASK(15, 0)
> +#define DP_CFG_STREAM_VSYNC_POLARITY		BIT(8)
> +#define DP_CFG_STREAM_HSYNC_POLARITY		BIT(7)
> +#define DP_CFG_STREAM_RGB_ENABLE		BIT(1)
> +#define DP_CFG_STREAM_VIDEO_MAPPING		GENMASK(5, 2)
> +#define DP_CFG_PIXEL_NUM_TIMING_MODE_SEL1	GENMASK(31, 16)
> +#define DP_CFG_STREAM_TU_SYMBOL_SIZE		GENMASK(5, 0)
> +#define DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE	GENMASK(9, 6)
> +#define DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
> +#define DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
>  
>  #endif
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
