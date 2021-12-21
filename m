Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FC847C0F5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 14:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807B41135A7;
	Tue, 21 Dec 2021 13:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B481F1135AA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 13:44:43 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so1726154wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 05:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M6WblWSHIwVZA1TPyV1QhwkBUyw+3xJLVoup+PTnGJg=;
 b=RpK69p/u2VSj1ArcBnzESutKe1SA8Qa3o+4kdV+qKkJZtakCPx8loDRQgzF6GAysO/
 TLNoGTSMKxkfAQsn7Jad5Znt7eKMgbxe9gzWYrRksp6GU9iYdErDLS9tCIGmG1V02K3R
 WsrDLM5XJRnMlV/1YrP76P82GCG/Z4QXlm+Gsp7AoNZ5CYqBj/Iy6NQodWuWcNQBisgi
 WbFmqylHuc227IHLZsGQd6tWI6aaM1Xn9yMuXz21GujRyz95JFlVW/QL095SK28kn5to
 TBrRvtZwVcCtGEGUSdJMgiBQtGh/tFFGfoOHW8DWQ4a3cUsJV5E1YCC1GDBEkAznRd1x
 EXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M6WblWSHIwVZA1TPyV1QhwkBUyw+3xJLVoup+PTnGJg=;
 b=pr28YvMFCWWmB8G/0ZzIk7zY3rLaHHcAQPuZcTCbGHqSLNwYmIa5tMjTOL/268Tx6s
 LgbJfvEsITgFUDnF3/vXOlT4HSHoiejvIU5Ydngz6LpylCD4JG+9dg3lwr3AL+JWSjWb
 RIB1RY+41QTNierjJRP74YdxkG4kwuDGS95aqbwQOEIl1KpAkrBo54ulQvpkJdzozUMZ
 egzgvEMM19SblAy/5MAccp7StuIY6KnJKeLnCXVOVCkzgiZGrQyFfzNjW9Ku7THR+RXr
 jVPqUP8d0netWSGfGcxnNoUn4OzFmnl4H+5Gunr/ibRWfXIhRT1q88zVhI0MVf5ghuyG
 qQjg==
X-Gm-Message-State: AOAM533izHhN6dZczsE7p07LoD8o9jIb42NP4yD0pR4Y/a074u8GTvaI
 /MzcUiavXnBtdamu0e+XPqYC6CXdcEE=
X-Google-Smtp-Source: ABdhPJyB73ovHm35A/LMaZOiWRKuWblo3vuxm1EaeOFWfVQo4sEuZbFp+HA04c5OynVB2M8j8PW0aQ==
X-Received: by 2002:a05:600c:3d19:: with SMTP id
 bh25mr2865200wmb.186.1640094281926; 
 Tue, 21 Dec 2021 05:44:41 -0800 (PST)
Received: from archbook.localnet ([217.151.114.10])
 by smtp.gmail.com with ESMTPSA id u23sm2286758wmc.7.2021.12.21.05.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 05:44:41 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 22/22] drm: rockchip: Add VOP2 driver
Date: Tue, 21 Dec 2021 14:44:39 +0100
Message-ID: <1761858.GBYTvM79DV@archbook>
In-Reply-To: <20211220110630.3521121-23-s.hauer@pengutronix.de>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211220110630.3521121-23-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Montag, 20. Dezember 2021 12:06:30 CET Sascha Hauer wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The VOP2 unit is found on Rockchip SoCs beginning with rk3566/rk3568.
> It replaces the VOP unit found in the older Rockchip SoCs.
> 
> This driver has been derived from the downstream Rockchip Kernel and
> heavily modified:
> 
> - All nonstandard DRM properties have been removed
> - dropped struct vop2_plane_state and pass around less data between
>   functions
> - Dropped all DRM_FORMAT_* not known on upstream
> - rework register access to get rid of excessively used macros
> - Drop all waiting for framesyncs
> 
> The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
> board. Overlay support is tested with the modetest utility. AFBC support
> on the cluster windows is tested with weston-simple-dmabuf-egl on
> weston using the (yet to be upstreamed) panfrost driver support.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---

Hi Sascha,

quick partial review of the code in-line.

For reference, I debugged locking issues with the kernel lock
debug config options and assert_spin_locked in the reg write
functions, as well as some manual deduction.

>  drivers/gpu/drm/rockchip/Kconfig             |    6 +
>  drivers/gpu/drm/rockchip/Makefile            |    1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c  |    1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h  |    7 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c   |    2 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h  |   15 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2768 ++++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  480 +++
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c |  285 ++
>  9 files changed, 3564 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
>  create mode 100644 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> 
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index b9b156308460a..4ff0043f0ee70 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -28,6 +28,12 @@ config ROCKCHIP_VOP
>  	  This selects support for the VOP driver. You should enable it
>  	  on all older SoCs up to RK3399.
>  
> +config ROCKCHIP_VOP2
> +	bool "Rockchip VOP2 driver"
> +	help
> +	  This selects support for the VOP2 driver. You should enable it
> +	  on all newer SoCs beginning form RK3568.
> +
>  config ROCKCHIP_ANALOGIX_DP
>  	bool "Rockchip specific extensions for Analogix DP driver"
>  	depends on ROCKCHIP_VOP
> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
> index cd6e7bb5ce9c5..29848caef5c21 100644
> --- a/drivers/gpu/drm/rockchip/Makefile
> +++ b/drivers/gpu/drm/rockchip/Makefile
> @@ -7,6 +7,7 @@ rockchipdrm-y := rockchip_drm_drv.o rockchip_drm_fb.o \
>  		rockchip_drm_gem.o
>  rockchipdrm-$(CONFIG_DRM_FBDEV_EMULATION) += rockchip_drm_fbdev.o
>  
> +rockchipdrm-$(CONFIG_ROCKCHIP_VOP2) += rockchip_drm_vop2.o rockchip_vop2_reg.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_VOP) += rockchip_drm_vop.o rockchip_vop_reg.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_ANALOGIX_DP) += analogix_dp-rockchip.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_CDN_DP) += cdn-dp-core.o cdn-dp-reg.o
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 64fa5fd62c01a..2bd9acb265e5a 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -474,6 +474,7 @@ static int __init rockchip_drm_init(void)
>  
>  	num_rockchip_sub_drivers = 0;
>  	ADD_ROCKCHIP_SUB_DRIVER(vop_platform_driver, CONFIG_ROCKCHIP_VOP);
> +	ADD_ROCKCHIP_SUB_DRIVER(vop2_platform_driver, CONFIG_ROCKCHIP_VOP2);
>  	ADD_ROCKCHIP_SUB_DRIVER(rockchip_lvds_driver,
>  				CONFIG_ROCKCHIP_LVDS);
>  	ADD_ROCKCHIP_SUB_DRIVER(rockchip_dp_driver,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> index aa0909e8edf93..fd6994f21817e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> @@ -18,7 +18,7 @@
>  
>  #define ROCKCHIP_MAX_FB_BUFFER	3
>  #define ROCKCHIP_MAX_CONNECTOR	2
> -#define ROCKCHIP_MAX_CRTC	2
> +#define ROCKCHIP_MAX_CRTC	4
>  
>  struct drm_device;
>  struct drm_connector;
> @@ -31,6 +31,9 @@ struct rockchip_crtc_state {
>  	int output_bpc;
>  	int output_flags;
>  	bool enable_afbc;
> +	uint32_t bus_format;
> +	u32 bus_flags;
> +	int color_space;
>  };
>  #define to_rockchip_crtc_state(s) \
>  		container_of(s, struct rockchip_crtc_state, base)
> @@ -65,4 +68,6 @@ extern struct platform_driver rockchip_dp_driver;
>  extern struct platform_driver rockchip_lvds_driver;
>  extern struct platform_driver vop_platform_driver;
>  extern struct platform_driver rk3066_hdmi_driver;
> +extern struct platform_driver vop2_platform_driver;
> +
>  #endif /* _ROCKCHIP_DRM_DRV_H_ */
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> index 3aa37e177667e..0d2cb4f3922b8 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -134,4 +134,6 @@ void rockchip_drm_mode_config_init(struct drm_device *dev)
>  
>  	dev->mode_config.funcs = &rockchip_drm_mode_config_funcs;
>  	dev->mode_config.helper_private = &rockchip_mode_config_helpers;
> +
> +	dev->mode_config.normalize_zpos = true;
>  }
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> index 857d97cdc67c6..1e364d7b50e69 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> @@ -54,9 +54,23 @@ struct vop_afbc {
>  	struct vop_reg enable;
>  	struct vop_reg win_sel;
>  	struct vop_reg format;
> +	struct vop_reg rb_swap;
> +	struct vop_reg uv_swap;
> +	struct vop_reg auto_gating_en;
> +	struct vop_reg block_split_en;
> +	struct vop_reg pic_vir_width;
> +	struct vop_reg tile_num;
>  	struct vop_reg hreg_block_split;
> +	struct vop_reg pic_offset;
>  	struct vop_reg pic_size;
> +	struct vop_reg dsp_offset;
> +	struct vop_reg transform_offset;
>  	struct vop_reg hdr_ptr;
> +	struct vop_reg half_block_en;
> +	struct vop_reg xmirror;
> +	struct vop_reg ymirror;
> +	struct vop_reg rotate_270;
> +	struct vop_reg rotate_90;
>  	struct vop_reg rstn;
>  };
>  
> @@ -410,4 +424,5 @@ static inline int scl_vop_cal_lb_mode(int width, bool is_yuv)
>  }
>  
>  extern const struct component_ops vop_component_ops;
> +
>  #endif /* _ROCKCHIP_DRM_VOP_H */
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> new file mode 100644
> index 0000000000000..7d39ba90061d1
> --- /dev/null
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -0,0 +1,2768 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 Rockchip Electronics Co., Ltd.
> + * Author: Andy Yan <andy.yan@rock-chips.com>
> + */
> +#include <drm/drm.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_flip_work.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_writeback.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_atomic_uapi.h>
> +
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/component.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/delay.h>
> +#include <linux/swab.h>
> +#include <linux/bitfield.h>
> +#include <drm/drm_debugfs.h>
> +#include <uapi/linux/videodev2.h>
> +#include <drm/drm_vblank.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>

Alphabetically sort these includes? Not sure on what the
convention is in the DRM subsystem.

> +
> +#include "rockchip_drm_drv.h"
> +#include "rockchip_drm_gem.h"
> +#include "rockchip_drm_fb.h"
> +#include "rockchip_drm_vop2.h"
> +
> +/*
> + * VOP2 architecture
> + *
> + +----------+   +-------------+                                                        +-----------+
> + |  Cluster |   | Sel 1 from 6|                                                        | 1 from 3  |
> + |  window0 |   |    Layer0   |                                                        |    RGB    |
> + +----------+   +-------------+              +---------------+    +-------------+      +-----------+
> + +----------+   +-------------+              |N from 6 layers|    |             |
> + |  Cluster |   | Sel 1 from 6|              |   Overlay0    +--->| Video Port0 |      +-----------+
> + |  window1 |   |    Layer1   |              |               |    |             |      | 1 from 3  |
> + +----------+   +-------------+              +---------------+    +-------------+      |   LVDS    |
> + +----------+   +-------------+                                                        +-----------+
> + |  Esmart  |   | Sel 1 from 6|
> + |  window0 |   |   Layer2    |              +---------------+    +-------------+      +-----------+
> + +----------+   +-------------+              |N from 6 Layers|    |             | +--> | 1 from 3  |
> + +----------+   +-------------+   -------->  |   Overlay1    +--->| Video Port1 |      |   MIPI    |
> + |  Esmart  |   | Sel 1 from 6|   -------->  |               |    |             |      +-----------+
> + |  Window1 |   |   Layer3    |              +---------------+    +-------------+
> + +----------+   +-------------+                                                        +-----------+
> + +----------+   +-------------+                                                        | 1 from 3  |
> + |  Smart   |   | Sel 1 from 6|              +---------------+    +-------------+      |   HDMI    |
> + |  Window0 |   |    Layer4   |              |N from 6 Layers|    |             |      +-----------+
> + +----------+   +-------------+              |   Overlay2    +--->| Video Port2 |
> + +----------+   +-------------+              |               |    |             |      +-----------+
> + |  Smart   |   | Sel 1 from 6|              +---------------+    +-------------+      |  1 from 3 |
> + |  Window1 |   |    Layer5   |                                                        |    eDP    |
> + +----------+   +-------------+                                                        +-----------+
> + *
> + */
> +
> +enum vop2_data_format {
> +	VOP2_FMT_ARGB8888 = 0,
> +	VOP2_FMT_RGB888,
> +	VOP2_FMT_RGB565,
> +	VOP2_FMT_XRGB101010,
> +	VOP2_FMT_YUV420SP,
> +	VOP2_FMT_YUV422SP,
> +	VOP2_FMT_YUV444SP,
> +	VOP2_FMT_YUYV422 = 8,
> +	VOP2_FMT_YUYV420,
> +	VOP2_FMT_VYUY422,
> +	VOP2_FMT_VYUY420,
> +	VOP2_FMT_YUV420SP_TILE_8x4 = 0x10,
> +	VOP2_FMT_YUV420SP_TILE_16x2,
> +	VOP2_FMT_YUV422SP_TILE_8x4,
> +	VOP2_FMT_YUV422SP_TILE_16x2,
> +	VOP2_FMT_YUV420SP_10,
> +	VOP2_FMT_YUV422SP_10,
> +	VOP2_FMT_YUV444SP_10,
> +};
> +
> +enum vop2_afbc_format {
> +	VOP2_AFBC_FMT_RGB565,
> +	VOP2_AFBC_FMT_ARGB2101010 = 2,
> +	VOP2_AFBC_FMT_YUV420_10BIT,
> +	VOP2_AFBC_FMT_RGB888,
> +	VOP2_AFBC_FMT_ARGB8888,
> +	VOP2_AFBC_FMT_YUV420 = 9,
> +	VOP2_AFBC_FMT_YUV422 = 0xb,
> +	VOP2_AFBC_FMT_YUV422_10BIT = 0xe,
> +	VOP2_AFBC_FMT_INVALID = -1,
> +};
> +
> +union vop2_alpha_ctrl {
> +	uint32_t val;
> +	struct {
> +		/* [0:1] */
> +		uint32_t color_mode:1;
> +		uint32_t alpha_mode:1;
> +		/* [2:3] */
> +		uint32_t blend_mode:2;
> +		uint32_t alpha_cal_mode:1;
> +		/* [5:7] */
> +		uint32_t factor_mode:3;
> +		/* [8:9] */
> +		uint32_t alpha_en:1;
> +		uint32_t src_dst_swap:1;
> +		uint32_t reserved:6;
> +		/* [16:23] */
> +		uint32_t glb_alpha:8;
> +	} bits;
> +};
> +
> +struct vop2_alpha {
> +	union vop2_alpha_ctrl src_color_ctrl;
> +	union vop2_alpha_ctrl dst_color_ctrl;
> +	union vop2_alpha_ctrl src_alpha_ctrl;
> +	union vop2_alpha_ctrl dst_alpha_ctrl;
> +};
> +
> +struct vop2_alpha_config {
> +	bool src_premulti_en;
> +	bool dst_premulti_en;
> +	bool src_pixel_alpha_en;
> +	bool dst_pixel_alpha_en;
> +	uint16_t src_glb_alpha_value;
> +	uint16_t dst_glb_alpha_value;
> +};
> +
> +struct vop2_win {
> +	struct vop2 *vop2;
> +	struct drm_plane base;
> +	const struct vop2_win_data *data;
> +	struct regmap_field *reg[VOP2_WIN_MAX_REG];
> +
> +	/**
> +	 * @win_id: graphic window id, a cluster maybe split into two

maybe -> may be

> +	 * graphics windows.
> +	 */
> +	uint8_t win_id;
> +
> +	uint32_t offset;
> +
> +	uint8_t delay;
> +	enum drm_plane_type type;
> +};
> +
> +struct vop2_video_port {
> +	struct drm_crtc crtc;
> +	struct vop2 *vop2;
> +	struct clk *dclk;
> +	uint8_t id;
> +	const struct vop2_video_port_regs *regs;
> +	const struct vop2_video_port_data *data;
> +
> +	struct completion dsp_hold_completion;
> +
> +	/**
> +	 * @win_mask: Bitmask of wins attached to the video port;

wins -> windows

> +	 */
> +	uint32_t win_mask;
> +
> +	struct vop2_win *primary_plane;
> +	struct drm_pending_vblank_event *event;
> +
> +	int nlayers;
> +};
> +
> +struct vop2 {
> +	struct device *dev;
> +	struct drm_device *drm;
> +	struct vop2_video_port vps[ROCKCHIP_MAX_CRTC];
> +
> +	const struct vop2_data *data;
> +	/* Number of win that registered as plane,
> +	 * maybe less than the total number of hardware
> +	 * win.

Number of windows that are registered as planes, may be, windows again

> +	 */
> +	uint32_t registered_num_wins;
> +
> +	void __iomem *regs;
> +	struct regmap *map;
> +
> +	struct regmap *grf;
> +
> +	/* physical map length of vop2 register */
> +	uint32_t len;
> +
> +	void __iomem *lut_regs;
> +	/* one time only one process allowed to config the register */

only one thread at a time is allowed to configure the registers

> +	spinlock_t reg_lock;
> +
> +	/* protects crtc enable/disable */
> +	struct mutex vop2_lock;
> +
> +	int irq;
> +
> +	/*
> +	 * Some globle resource are shared between all
> +	 * the vidoe ports(crtcs), so we need a ref counter here.

Some global resources, video

> +	 */
> +	unsigned int enable_count;
> +	struct clk *hclk;
> +	struct clk *aclk;
> +
> +	/* must put at the end of the struct */

must be put

> +	struct vop2_win win[];
> +};
> +
> +static struct vop2_video_port *to_vop2_video_port(struct drm_crtc *crtc)
> +{
> +	return container_of(crtc, struct vop2_video_port, crtc);
> +}
> +
> +static struct vop2_win *to_vop2_win(struct drm_plane *p)
> +{
> +	return container_of(p, struct vop2_win, base);
> +}
> +
> +static void vop2_lock(struct vop2 *vop2)
> +{
> +	mutex_lock(&vop2->vop2_lock);
> +}
> +
> +static void vop2_unlock(struct vop2 *vop2)
> +{
> +	mutex_unlock(&vop2->vop2_lock);
> +}
> +
> +static void vop2_writel(struct vop2 *vop2, uint32_t offset, uint32_t v)
> +{
> +	regmap_write(vop2->map, offset, v);
> +}
> +
> +static void vop2_vp_write(struct vop2_video_port *vp, uint32_t offset,
> +			  uint32_t v)
> +{
> +	regmap_write(vp->vop2->map, vp->data->offset + offset, v);
> +}
> +
> +static uint32_t vop2_readl(struct vop2 *vop2, uint32_t offset)
> +{
> +	uint32_t val;
> +
> +	regmap_read(vop2->map, offset, &val);
> +
> +	return val;
> +}
> +
> +static void vop2_win_write(const struct vop2_win *win, unsigned int reg,
> +			   uint32_t v)
> +{
> +	regmap_field_write(win->reg[reg], v);
> +}
> +
> +static bool vop2_cluster_window(const struct vop2_win *win)
> +{
> +	return win->data->feature & WIN_FEATURE_CLUSTER;
> +}
> +
> +static void vop2_cfg_done(struct vop2_video_port *vp)
> +{
> +	struct vop2 *vop2 = vp->vop2;
> +	uint32_t val;
> +
> +	val = vop2_readl(vop2, RK3568_REG_CFG_DONE);
> +
> +	val &= 0x7;

GENMASK(2, 0) instead of 0x7, should that be a constant somewhere?

> +
> +	vop2_writel(vop2, RK3568_REG_CFG_DONE,
> +		    val | BIT(vp->id) | RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN);
> +}
> +
> +static void vop2_win_disable(struct vop2_win *win)
> +{
> +	vop2_win_write(win, VOP2_WIN_ENABLE, 0);
> +
> +	if (vop2_cluster_window(win))
> +		vop2_win_write(win, VOP2_WIN_CLUSTER_ENABLE, 0);
> +}
> +
> +static enum vop2_data_format vop2_convert_format(uint32_t format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ABGR8888:
> +		return VOP2_FMT_ARGB8888;
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_BGR888:
> +		return VOP2_FMT_RGB888;
> +	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_BGR565:
> +		return VOP2_FMT_RGB565;
> +	case DRM_FORMAT_NV12:
> +		return VOP2_FMT_YUV420SP;
> +	case DRM_FORMAT_NV16:
> +		return VOP2_FMT_YUV422SP;
> +	case DRM_FORMAT_NV24:
> +		return VOP2_FMT_YUV444SP;
> +	case DRM_FORMAT_YUYV:
> +	case DRM_FORMAT_YVYU:
> +		return VOP2_FMT_VYUY422;
> +	case DRM_FORMAT_VYUY:
> +	case DRM_FORMAT_UYVY:
> +		return VOP2_FMT_YUYV422;
> +	default:
> +		DRM_ERROR("unsupported format[%08x]\n", format);
> +		return -EINVAL;
> +	}
> +}
> +
> +static enum vop2_afbc_format vop2_convert_afbc_format(uint32_t format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ABGR8888:
> +		return VOP2_AFBC_FMT_ARGB8888;
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_BGR888:
> +		return VOP2_AFBC_FMT_RGB888;
> +	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_BGR565:
> +		return VOP2_AFBC_FMT_RGB565;
> +	case DRM_FORMAT_NV12:
> +		return VOP2_AFBC_FMT_YUV420;
> +	case DRM_FORMAT_NV16:
> +		return VOP2_AFBC_FMT_YUV422;
> +	default:
> +		return VOP2_AFBC_FMT_INVALID;
> +	}
> +
> +	return VOP2_AFBC_FMT_INVALID;
> +}
> +
> +static bool vop2_win_rb_swap(uint32_t format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ABGR8888:
> +	case DRM_FORMAT_BGR888:
> +	case DRM_FORMAT_BGR565:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool vop2_afbc_rb_swap(uint32_t format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_NV24:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool vop2_afbc_uv_swap(uint32_t format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool vop2_win_uv_swap(uint32_t format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV24:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool vop2_win_dither_up(uint32_t format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_BGR565:
> +	case DRM_FORMAT_RGB565:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool vop2_output_uv_swap(uint32_t bus_format, uint32_t output_mode)
> +{
> +	/*
> +	 * FIXME:
> +	 *
> +	 * There is no media type for YUV444 output,
> +	 * so when out_mode is AAAA or P888, assume output is YUV444 on
> +	 * yuv format.
> +	 *
> +	 * From H/W testing, YUV444 mode need a rb swap.
> +	 */
> +	if (bus_format == MEDIA_BUS_FMT_YVYU8_1X16 ||
> +	    bus_format == MEDIA_BUS_FMT_VYUY8_1X16 ||
> +	    bus_format == MEDIA_BUS_FMT_YVYU8_2X8 ||
> +	    bus_format == MEDIA_BUS_FMT_VYUY8_2X8 ||
> +	    ((bus_format == MEDIA_BUS_FMT_YUV8_1X24 ||
> +	      bus_format == MEDIA_BUS_FMT_YUV10_1X30) &&
> +	     (output_mode == ROCKCHIP_OUT_MODE_AAAA ||
> +	      output_mode == ROCKCHIP_OUT_MODE_P888)))
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static bool is_yuv_output(uint32_t bus_format)
> +{
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_YUV8_1X24:
> +	case MEDIA_BUS_FMT_YUV10_1X30:
> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +	case MEDIA_BUS_FMT_YUYV8_2X8:
> +	case MEDIA_BUS_FMT_YVYU8_2X8:
> +	case MEDIA_BUS_FMT_UYVY8_2X8:
> +	case MEDIA_BUS_FMT_VYUY8_2X8:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_YVYU8_1X16:
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_VYUY8_1X16:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool rockchip_afbc(struct drm_plane *plane, u64 modifier)
> +{
> +	int i;
> +
> +	if (modifier == DRM_FORMAT_MOD_LINEAR)
> +		return false;
> +
> +	for (i = 0 ; i < plane->modifier_count; i++)
> +		if (plane->modifiers[i] == modifier)
> +			break;
> +
> +	return (i < plane->modifier_count) ? true : false;
> +
> +}
> +
> +static bool rockchip_vop2_mod_supported(struct drm_plane *plane, uint32_t format, u64 modifier)
> +{
> +	struct vop2_win *win = to_vop2_win(plane);
> +	struct vop2 *vop2 = win->vop2;
> +
> +	if (modifier == DRM_FORMAT_MOD_INVALID)
> +		return false;
> +
> +	if (modifier == DRM_FORMAT_MOD_LINEAR)
> +		return true;
> +
> +	if (!rockchip_afbc(plane, modifier)) {
> +		drm_err(vop2->drm, "Unsupported format modifier 0x%llx\n", modifier);
> +
> +		return false;
> +	}
> +
> +	return vop2_convert_afbc_format(format) >= 0;
> +}
> +
> +static int vop2_afbc_half_block_enable(struct drm_plane_state *pstate)
> +{
> +	if ((pstate->rotation & DRM_MODE_ROTATE_270) || (pstate->rotation & DRM_MODE_ROTATE_90))
> +		return 0;
> +	else
> +		return 1;
> +}
> +
> +static uint32_t vop2_afbc_transform_offset(struct drm_plane_state *pstate,
> +					   bool afbc_half_block_en)
> +{
> +	struct drm_rect *src = &pstate->src;
> +	struct drm_framebuffer *fb = pstate->fb;
> +	uint32_t bpp = fb->format->cpp[0] * 8;
> +	uint32_t vir_width = (fb->pitches[0] << 3) / bpp;
> +	uint32_t width = drm_rect_width(src) >> 16;
> +	uint32_t height = drm_rect_height(src) >> 16;
> +	uint32_t act_xoffset = src->x1 >> 16;
> +	uint32_t act_yoffset = src->y1 >> 16;
> +	uint32_t align16_crop = 0;
> +	uint32_t align64_crop = 0;
> +	uint32_t height_tmp = 0;
> +	uint32_t transform_tmp = 0;
> +	uint8_t transform_xoffset = 0;
> +	uint8_t transform_yoffset = 0;
> +	uint8_t top_crop = 0;
> +	uint8_t top_crop_line_num = 0;
> +	uint8_t bottom_crop_line_num = 0;
> +
> +	/* 16 pixel align */
> +	if (height & 0xf)
> +		align16_crop = 16 - (height & 0xf);
> +
> +	height_tmp = height + align16_crop;
> +
> +	/* 64 pixel align */
> +	if (height_tmp & 0x3f)
> +		align64_crop = 64 - (height_tmp & 0x3f);
> +
> +	top_crop_line_num = top_crop << 2;
> +	if (top_crop == 0)
> +		bottom_crop_line_num = align16_crop + align64_crop;
> +	else if (top_crop == 1)
> +		bottom_crop_line_num = align16_crop + align64_crop + 12;
> +	else if (top_crop == 2)
> +		bottom_crop_line_num = align16_crop + align64_crop + 8;

top_crop == 0 is always taken from what I can gather, rest is
dead code. Is this intentional? It doesn't seem intentional.

> +
> +	switch (pstate->rotation &
> +		(DRM_MODE_REFLECT_X |
> +		 DRM_MODE_REFLECT_Y |
> +		 DRM_MODE_ROTATE_90 |
> +		 DRM_MODE_ROTATE_270)) {
> +	case DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y:
> +		transform_tmp = act_xoffset + width;
> +		transform_xoffset = 16 - (transform_tmp & 0xf);
> +		transform_tmp = bottom_crop_line_num - act_yoffset;
> +
> +		if (afbc_half_block_en)
> +			transform_yoffset = transform_tmp & 0x7;
> +		else
> +			transform_yoffset = (transform_tmp & 0xf);
> +
> +		break;
> +	case DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90:
> +		transform_tmp = bottom_crop_line_num - act_yoffset;
> +		transform_xoffset = transform_tmp & 0xf;
> +		transform_tmp = vir_width - width - act_xoffset;
> +		transform_yoffset = transform_tmp & 0xf;
> +		break;
> +	case DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270:
> +		transform_tmp = top_crop_line_num + act_yoffset;
> +		transform_xoffset = transform_tmp & 0xf;
> +		transform_tmp = act_xoffset;
> +		transform_yoffset = transform_tmp & 0xf;
> +		break;
> +	case DRM_MODE_REFLECT_X:
> +		transform_tmp = act_xoffset + width;
> +		transform_xoffset = 16 - (transform_tmp & 0xf);
> +		transform_tmp = top_crop_line_num + act_yoffset;
> +
> +		if (afbc_half_block_en)
> +			transform_yoffset = transform_tmp & 0x7;
> +		else
> +			transform_yoffset = transform_tmp & 0xf;
> +
> +		break;
> +	case DRM_MODE_REFLECT_Y:
> +		transform_tmp = act_xoffset;
> +		transform_xoffset = transform_tmp & 0xf;
> +		transform_tmp = bottom_crop_line_num - act_yoffset;
> +
> +		if (afbc_half_block_en)
> +			transform_yoffset = transform_tmp & 0x7;
> +		else
> +			transform_yoffset = transform_tmp & 0xf;
> +
> +		break;
> +	case DRM_MODE_ROTATE_90:
> +		transform_tmp = bottom_crop_line_num - act_yoffset;
> +		transform_xoffset = transform_tmp & 0xf;
> +		transform_tmp = act_xoffset;
> +		transform_yoffset = transform_tmp & 0xf;
> +		break;
> +	case DRM_MODE_ROTATE_270:
> +		transform_tmp = top_crop_line_num + act_yoffset;
> +		transform_xoffset = transform_tmp & 0xf;
> +		transform_tmp = vir_width - width - act_xoffset;
> +		transform_yoffset = transform_tmp & 0xf;
> +		break;
> +	case 0:
> +		transform_tmp = act_xoffset;
> +		transform_xoffset = transform_tmp & 0xf;
> +		transform_tmp = top_crop_line_num + act_yoffset;
> +
> +		if (afbc_half_block_en)
> +			transform_yoffset = transform_tmp & 0x7;
> +		else
> +			transform_yoffset = transform_tmp & 0xf;
> +
> +		break;
> +	}
> +
> +	return (transform_xoffset & 0xf) | ((transform_yoffset & 0xf) << 16);
> +}

0xf, 0x3f, 0x7 might be more clear as GENMASK.
if (afbc_half_block_en) branches can be moved out of cases and
assign a transform mask variable instead.

> +
> +/*
> + * A Cluster window has 2048 x 16 line buffer, which can
> + * works at 2048 x 16(Full) or 4096 x 8 (Half) mode.
> + * for Cluster_lb_mode register:
> + * 0: half mode, for plane input width range 2048 ~ 4096
> + * 1: half mode, for cluster work at 2 * 2048 plane mode
> + * 2: half mode, for rotate_90/270 mode
> + *
> + */
> +static int vop2_get_cluster_lb_mode(struct vop2_win *win, struct drm_plane_state *pstate)
> +{
> +	if ((pstate->rotation & DRM_MODE_ROTATE_270) || (pstate->rotation & DRM_MODE_ROTATE_90))
> +		return 2;
> +	else
> +		return 0;
> +}

What about 1?

> +
> +/*
> + * bli_sd_factor = (src - 1) / (dst - 1) << 12;
> + * avg_sd_factor:
> + * bli_su_factor:
> + * bic_su_factor:
> + * = (src - 1) / (dst - 1) << 16;
> + *
> + * gt2 enable: dst get one line from two line of the src
> + * gt4 enable: dst get one line from four line of the src.
> + *
> + */
> +static uint16_t vop2_scale_factor(enum scale_mode mode,
> +				  int32_t filter_mode,
> +				  uint32_t src, uint32_t dst)
> +{
> +	uint32_t fac;
> +	int i;
> +
> +	if (mode == SCALE_NONE)
> +		return 0;
> +
> +	/*
> +	 * A workaround to avoid zero div.
> +	 */
> +	if (dst == 1 || src == 1) {
> +		dst++;
> +		src++;
> +	}
> +
> +	if ((mode == SCALE_DOWN) && (filter_mode == VOP2_SCALE_DOWN_BIL)) {
> +		fac = ((src - 1) << 12) / (dst - 1);
> +		for (i = 0; i < 100; i++) {
> +			if (fac * (dst - 1) >> 12 < (src - 1))
> +				break;
> +			fac -= 1;
> +			DRM_DEBUG("down fac cali: src:%d, dst:%d, fac:0x%x\n", src, dst, fac);
> +		}
> +	} else {
> +		fac = ((src - 1) << 16) / (dst - 1);
> +		for (i = 0; i < 100; i++) {
> +			if (fac * (dst - 1) >> 16 < (src - 1))
> +				break;
> +			fac -= 1;
> +			DRM_DEBUG("up fac cali:  src:%d, dst:%d, fac:0x%x\n", src, dst, fac);
> +		}
> +	}
> +
> +	return fac;
> +}

src = 0 or dst = 0 causes an uint underflow here.

> +
> +static void vop2_setup_scale(struct vop2 *vop2, const struct vop2_win *win,
> +			     uint32_t src_w, uint32_t src_h, uint32_t dst_w,
> +			     uint32_t dst_h, uint32_t pixel_format)
> +{
> +	const struct drm_format_info *info;
> +	uint16_t cbcr_src_w;
> +	uint16_t cbcr_src_h;
> +	uint16_t yrgb_hor_scl_mode, yrgb_ver_scl_mode;
> +	uint16_t cbcr_hor_scl_mode, cbcr_ver_scl_mode;
> +	uint16_t hscl_filter_mode, vscl_filter_mode;
> +	uint8_t gt2 = 0;
> +	uint8_t gt4 = 0;
> +	uint32_t val;
> +
> +	info = drm_format_info(pixel_format);
> +
> +	cbcr_src_w = src_w / info->hsub;
> +	cbcr_src_h = src_h / info->vsub;
> +
> +	if (src_h >= (4 * dst_h)) {
> +		gt4 = 1;
> +		src_h >>= 2;
> +	} else if (src_h >= (2 * dst_h)) {
> +		gt2 = 1;
> +		src_h >>= 1;
> +	}
> +
> +	yrgb_hor_scl_mode = scl_get_scl_mode(src_w, dst_w);
> +	yrgb_ver_scl_mode = scl_get_scl_mode(src_h, dst_h);
> +
> +	if (yrgb_hor_scl_mode == SCALE_UP)
> +		hscl_filter_mode = VOP2_SCALE_UP_BIC;
> +	else
> +		hscl_filter_mode = VOP2_SCALE_DOWN_BIL;
> +
> +	if (yrgb_ver_scl_mode == SCALE_UP)
> +		vscl_filter_mode = VOP2_SCALE_UP_BIL;
> +	else
> +		vscl_filter_mode = VOP2_SCALE_DOWN_BIL;
> +
> +	/*
> +	 * RK3568 VOP Esmart/Smart dsp_w should be even pixel
> +	 * at scale down mode
> +	 */
> +	if (!(win->data->feature & WIN_FEATURE_AFBDC)) {
> +		if ((yrgb_hor_scl_mode == SCALE_DOWN) && (dst_w & 0x1)) {
> +			drm_dbg(vop2->drm, "%s dst_w[%d] should align as 2 pixel\n",
> +				win->data->name, dst_w);
> +			dst_w += 1;
> +		}
> +	}
> +
> +	val = vop2_scale_factor(yrgb_hor_scl_mode, hscl_filter_mode,
> +				src_w, dst_w);
> +	vop2_win_write(win, VOP2_WIN_SCALE_YRGB_X, val);
> +	val = vop2_scale_factor(yrgb_ver_scl_mode, vscl_filter_mode,
> +				src_h, dst_h);
> +	vop2_win_write(win, VOP2_WIN_SCALE_YRGB_Y, val);
> +
> +	vop2_win_write(win, VOP2_WIN_VSD_YRGB_GT4, gt4);
> +	vop2_win_write(win, VOP2_WIN_VSD_YRGB_GT2, gt2);
> +
> +	vop2_win_write(win, VOP2_WIN_YRGB_HOR_SCL_MODE, yrgb_hor_scl_mode);
> +	vop2_win_write(win, VOP2_WIN_YRGB_VER_SCL_MODE, yrgb_ver_scl_mode);
> +
> +	if (vop2_cluster_window(win))
> +		return;
> +
> +	vop2_win_write(win, VOP2_WIN_YRGB_HSCL_FILTER_MODE, hscl_filter_mode);
> +	vop2_win_write(win, VOP2_WIN_YRGB_VSCL_FILTER_MODE, vscl_filter_mode);
> +
> +	if (info->is_yuv) {
> +		gt4 = gt2 = 0;
> +
> +		if (cbcr_src_h >= (4 * dst_h))
> +			gt4 = 1;
> +		else if (cbcr_src_h >= (2 * dst_h))
> +			gt2 = 1;
> +
> +		if (gt4)
> +			cbcr_src_h >>= 2;
> +		else if (gt2)
> +			cbcr_src_h >>= 1;
> +
> +		cbcr_hor_scl_mode = scl_get_scl_mode(cbcr_src_w, dst_w);
> +		cbcr_ver_scl_mode = scl_get_scl_mode(cbcr_src_h, dst_h);
> +
> +		val = vop2_scale_factor(cbcr_hor_scl_mode, hscl_filter_mode,
> +					cbcr_src_w, dst_w);
> +		vop2_win_write(win, VOP2_WIN_SCALE_CBCR_X, val);
> +
> +		val = vop2_scale_factor(cbcr_ver_scl_mode, vscl_filter_mode,
> +					cbcr_src_h, dst_h);
> +		vop2_win_write(win, VOP2_WIN_SCALE_CBCR_Y, val);
> +
> +		vop2_win_write(win, VOP2_WIN_VSD_CBCR_GT4, gt4);
> +		vop2_win_write(win, VOP2_WIN_VSD_CBCR_GT2, gt2);
> +		vop2_win_write(win, VOP2_WIN_CBCR_HOR_SCL_MODE, cbcr_hor_scl_mode);
> +		vop2_win_write(win, VOP2_WIN_CBCR_VER_SCL_MODE, cbcr_ver_scl_mode);
> +		vop2_win_write(win, VOP2_WIN_CBCR_HSCL_FILTER_MODE, hscl_filter_mode);
> +		vop2_win_write(win, VOP2_WIN_CBCR_VSCL_FILTER_MODE, vscl_filter_mode);
> +	}
> +}

Double-check that we do have the reg spinlock here, my
lock debugging died earlier due to a different lock bug

> +
> +static int vop2_convert_csc_mode(int csc_mode)
> +{
> +	switch (csc_mode) {
> +	case V4L2_COLORSPACE_SMPTE170M:
> +	case V4L2_COLORSPACE_470_SYSTEM_M:
> +	case V4L2_COLORSPACE_470_SYSTEM_BG:
> +		return CSC_BT601L;
> +	case V4L2_COLORSPACE_REC709:
> +	case V4L2_COLORSPACE_SMPTE240M:
> +	case V4L2_COLORSPACE_DEFAULT:
> +		return CSC_BT709L;
> +	case V4L2_COLORSPACE_JPEG:
> +		return CSC_BT601F;
> +	case V4L2_COLORSPACE_BT2020:
> +		return CSC_BT2020;
> +	default:
> +		return CSC_BT709L;
> +	}
> +}
> +
> +/*
> + * colorspace path:
> + *      Input        Win csc                     Output
> + * 1. YUV(2020)  --> Y2R->2020To709->R2Y   --> YUV_OUTPUT(601/709)
> + *    RGB        --> R2Y                  __/
> + *
> + * 2. YUV(2020)  --> bypasss               --> YUV_OUTPUT(2020)
> + *    RGB        --> 709To2020->R2Y       __/
> + *
> + * 3. YUV(2020)  --> Y2R->2020To709        --> RGB_OUTPUT(709)
> + *    RGB        --> R2Y                  __/
> + *
> + * 4. YUV(601/709)-> Y2R->709To2020->R2Y   --> YUV_OUTPUT(2020)
> + *    RGB        --> 709To2020->R2Y       __/
> + *
> + * 5. YUV(601/709)-> bypass                --> YUV_OUTPUT(709)
> + *    RGB        --> R2Y                  __/
> + *
> + * 6. YUV(601/709)-> bypass                --> YUV_OUTPUT(601)
> + *    RGB        --> R2Y(601)             __/
> + *
> + * 7. YUV        --> Y2R(709)              --> RGB_OUTPUT(709)
> + *    RGB        --> bypass               __/
> + *
> + * 8. RGB        --> 709To2020->R2Y        --> YUV_OUTPUT(2020)
> + *
> + * 9. RGB        --> R2Y(709)              --> YUV_OUTPUT(709)
> + *
> + * 10. RGB       --> R2Y(601)              --> YUV_OUTPUT(601)
> + *
> + * 11. RGB       --> bypass                --> RGB_OUTPUT(709)
> + */
> +
> +static void vop2_setup_csc_mode(struct vop2_video_port *vp,
> +				struct vop2_win *win,
> +				struct drm_plane_state *pstate)
> +{
> +	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(vp->crtc.state);
> +	int is_input_yuv = pstate->fb->format->is_yuv;
> +	int is_output_yuv = is_yuv_output(vcstate->bus_format);
> +	int input_csc = V4L2_COLORSPACE_DEFAULT;
> +	int output_csc = vcstate->color_space;
> +	bool r2y_en, y2r_en;
> +	int csc_mode;
> +
> +	if (is_input_yuv && !is_output_yuv) {
> +		y2r_en = 1;
> +		r2y_en = 0;

They're bools, use true/false.

> +		csc_mode = vop2_convert_csc_mode(input_csc);
> +	} else if (!is_input_yuv && is_output_yuv) {
> +		y2r_en = 0;
> +		r2y_en = 1;

ditto

> +		csc_mode = vop2_convert_csc_mode(output_csc);
> +	} else {
> +		y2r_en = 0;
> +		r2y_en = 0;

ditto

> +		csc_mode = 0;
> +	}
> +
> +	vop2_win_write(win, VOP2_WIN_Y2R_EN, y2r_en);
> +	vop2_win_write(win, VOP2_WIN_R2Y_EN, r2y_en);
> +	vop2_win_write(win, VOP2_WIN_CSC_MODE, csc_mode);
> +}
> +
> +static void vop2_crtc_enable_irq(struct vop2_video_port *vp, uint32_t irq)
> +{
> +	struct vop2 *vop2 = vp->vop2;
> +
> +	vop2_writel(vop2, RK3568_VP_INT_CLR(vp->id), irq << 16 | irq);
> +	vop2_writel(vop2, RK3568_VP_INT_EN(vp->id), irq << 16 | irq);
> +}
> +
> +static void vop2_crtc_disable_irq(struct vop2_video_port *vp, uint32_t irq)
> +{
> +	struct vop2 *vop2 = vp->vop2;
> +
> +	vop2_writel(vop2, RK3568_VP_INT_EN(vp->id), irq << 16);
> +}
> +
> +static int vop2_core_clks_prepare_enable(struct vop2 *vop2)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(vop2->hclk);
> +	if (ret < 0) {
> +		drm_err(vop2->drm, "failed to enable hclk - %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(vop2->aclk);
> +	if (ret < 0) {
> +		drm_err(vop2->drm, "failed to enable aclk - %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	clk_disable_unprepare(vop2->hclk);
> +
> +	return ret;
> +}
> +
> +static void vop2_enable(struct vop2 *vop2)
> +{
> +	int ret;
> +	uint32_t v;
> +
> +	ret = pm_runtime_get_sync(vop2->dev);
> +	if (ret < 0) {
> +		drm_err(vop2->drm, "failed to get pm runtime: %d\n", ret);
> +		return;
> +	}
> +
> +	ret = vop2_core_clks_prepare_enable(vop2);
> +	if (ret) {
> +		pm_runtime_put_sync(vop2->dev);
> +		return;
> +	}
> +
> +	if (vop2->data->soc_id == 3566)
> +		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
> +
> +	vop2_writel(vop2, RK3568_REG_CFG_DONE, RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN);
> +
> +	/*
> +	 * Disable auto gating, this is a workaround to
> +	 * avoid display image shift when a window enabled.
> +	 */
> +	v = vop2_readl(vop2, RK3568_SYS_AUTO_GATING_CTRL);
> +	v &= ~RK3568_SYS_AUTO_GATING_CTRL__AUTO_GATING_EN;
> +	vop2_writel(vop2, RK3568_SYS_AUTO_GATING_CTRL, v);
> +
> +	vop2_writel(vop2, RK3568_SYS0_INT_CLR,
> +		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
> +	vop2_writel(vop2, RK3568_SYS0_INT_EN,
> +		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
> +	vop2_writel(vop2, RK3568_SYS1_INT_CLR,
> +		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
> +	vop2_writel(vop2, RK3568_SYS1_INT_EN,
> +		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
> +}

Does reg writes but doesn't have the spinlock.

> [...]
> +static void vop2_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
> +{
> +	struct vop2_video_port *vp = to_vop2_video_port(crtc);
> +	struct vop2 *vop2 = vp->vop2;
> +	const struct vop2_data *vop2_data = vop2->data;
> +	const struct vop2_video_port_data *vp_data = &vop2_data->vp[vp->id];
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(crtc->state);
> +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> +	unsigned long clock = mode->crtc_clock * 1000;
> +	uint16_t hsync_len = mode->crtc_hsync_end - mode->crtc_hsync_start;
> +	uint16_t hdisplay = mode->crtc_hdisplay;
> +	uint16_t htotal = mode->crtc_htotal;
> +	uint16_t hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
> +	uint16_t hact_end = hact_st + hdisplay;
> +	uint16_t vdisplay = mode->crtc_vdisplay;
> +	uint16_t vtotal = mode->crtc_vtotal;
> +	uint16_t vsync_len = mode->crtc_vsync_end - mode->crtc_vsync_start;
> +	uint16_t vact_st = mode->crtc_vtotal - mode->crtc_vsync_start;
> +	uint16_t vact_end = vact_st + vdisplay;
> +	uint8_t out_mode;
> +	uint32_t dsp_ctrl = 0;
> +	int act_end;
> +	uint32_t val, polflags;
> +	int ret;
> +	struct drm_encoder *encoder;
> +
> +	drm_dbg(vop2->drm, "Update mode to %dx%d%s%d, type: %d for vp%d\n",
> +		hdisplay, vdisplay, mode->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "p",
> +		drm_mode_vrefresh(mode), vcstate->output_type, vp->id);
> +
> +	vop2_lock(vop2);
> +
> +	ret = clk_prepare_enable(vp->dclk);
> +	if (ret < 0) {
> +		drm_err(vop2->drm, "failed to enable dclk for video port%d - %d\n",
> +			      vp->id, ret);
> +		return;

vop2_lock is never unlocked in this branch

> +	}
> +
> +	if (!vop2->enable_count)
> +		vop2_enable(vop2);
> +
> +	vop2->enable_count++;
> +
> +	vop2_crtc_enable_irq(vp, VP_INT_POST_BUF_EMPTY);
> +
> +	polflags = 0;
> +	if (vcstate->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> +		polflags |= POLFLAG_DCLK_INV;
> +	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> +		polflags |= BIT(HSYNC_POSITIVE);
> +	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> +		polflags |= BIT(VSYNC_POSITIVE);
> +
> +	drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
> +		struct device_node *node, *parent;
> +
> +		parent = of_get_parent(encoder->port);
> +
> +		for_each_endpoint_of_node(parent, node) {
> +			struct device_node *crtc_port = of_graph_get_remote_port(node);
> +			struct device_node *epn;
> +			struct of_endpoint endpoint;
> +
> +			if (crtc->port != crtc_port) {
> +				of_node_put(crtc_port);
> +				continue;
> +			}
> +
> +			of_node_put(crtc_port);
> +
> +			epn = of_graph_get_remote_endpoint(node);
> +			of_graph_parse_endpoint(epn, &endpoint);
> +			of_node_put(epn);
> +
> +			drm_dbg(vop2->drm, "vp%d is connected to %s, id %d\n",
> +					   vp->id, encoder->name, endpoint.id);
> +			rk3568_set_intf_mux(vp, endpoint.id, polflags);
> +		}
> +		of_node_put(parent);
> +	}
> +
> +	if (vcstate->output_mode == ROCKCHIP_OUT_MODE_AAAA &&
> +	     !(vp_data->feature & VOP_FEATURE_OUTPUT_10BIT))
> +		out_mode = ROCKCHIP_OUT_MODE_P888;
> +	else
> +		out_mode = vcstate->output_mode;
> +
> +	dsp_ctrl |= FIELD_PREP(RK3568_VP_DSP_CTRL__OUT_MODE, out_mode);
> +
> +	if (vop2_output_uv_swap(vcstate->bus_format, vcstate->output_mode))
> +		dsp_ctrl |= RK3568_VP_DSP_CTRL__DSP_RB_SWAP;
> +
> +	if (is_yuv_output(vcstate->bus_format))
> +		dsp_ctrl |= RK3568_VP_DSP_CTRL__POST_DSP_OUT_R2Y;
> +
> +	vop2_dither_setup(crtc, &dsp_ctrl);
> +
> +	vop2_vp_write(vp, RK3568_VP_DSP_HTOTAL_HS_END, (htotal << 16) | hsync_len);
> +	val = hact_st << 16;
> +	val |= hact_end;
> +	vop2_vp_write(vp, RK3568_VP_DSP_HACT_ST_END, val);
> +
> +	val = vact_st << 16;
> +	val |= vact_end;
> +	vop2_vp_write(vp, RK3568_VP_DSP_VACT_ST_END, val);
> +
> +	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
> +		uint16_t vact_st_f1 = vtotal + vact_st + 1;
> +		uint16_t vact_end_f1 = vact_st_f1 + vdisplay;
> +
> +		val = vact_st_f1 << 16 | vact_end_f1;
> +		vop2_vp_write(vp, RK3568_VP_DSP_VACT_ST_END_F1, val);
> +
> +		val = vtotal << 16 | (vtotal + vsync_len);
> +		vop2_vp_write(vp, RK3568_VP_DSP_VS_ST_END_F1, val);
> +		dsp_ctrl |= RK3568_VP_DSP_CTRL__DSP_INTERLACE;
> +		dsp_ctrl |= RK3568_VP_DSP_CTRL__DSP_FILED_POL;
> +		dsp_ctrl |= RK3568_VP_DSP_CTRL__P2I_EN;
> +		vtotal += vtotal + 1;
> +		act_end = vact_end_f1;
> +	} else {
> +		act_end = vact_end;
> +	}
> +
> +	vop2_writel(vop2, RK3568_VP_LINE_FLAG(vp->id),
> +		    (act_end - us_to_vertical_line(mode, 0)) << 16 | act_end);
> +
> +	vop2_vp_write(vp, RK3568_VP_DSP_VTOTAL_VS_END, vtotal << 16 | vsync_len);
> +
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK) {
> +		dsp_ctrl |= RK3568_VP_DSP_CTRL__CORE_DCLK_DIV;
> +		clock *= 2;
> +	}
> +
> +	vop2_vp_write(vp, RK3568_VP_MIPI_CTRL, 0);
> +
> +	clk_set_rate(vp->dclk, clock);
> +
> +	vop2_post_config(crtc);
> +
> +	vop2_cfg_done(vp);
> +
> +	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> +
> +	drm_crtc_vblank_on(crtc);
> +
> +	vop2_unlock(vop2);
> +}

Whole function does reg writes without the spinlock, caught by
assert_spin_locked.

> [...]
> +static irqreturn_t vop2_isr(int irq, void *data)
> +{
> +	struct vop2 *vop2 = data;
> +	const struct vop2_data *vop2_data = vop2->data;
> +	uint32_t axi_irqs[VOP2_SYS_AXI_BUS_NUM];
> +	int ret = IRQ_NONE;
> +	int i;
> +
> +	/*
> +	 * The irq is shared with the iommu. If the runtime-pm state of the
> +	 * vop2-device is disabled the irq has to be targeted at the iommu.
> +	 */
> +	if (!pm_runtime_get_if_in_use(vop2->dev))
> +		return IRQ_NONE;
> +
> +	for (i = 0; i < vop2_data->nr_vps; i++) {
> +		struct vop2_video_port *vp = &vop2->vps[i];
> +		struct drm_crtc *crtc = &vp->crtc;
> +		uint32_t irqs;
> +
> +		irqs = vop2_readl(vop2, RK3568_VP_INT_STATUS(vp->id));
> +		vop2_writel(vop2, RK3568_VP_INT_CLR(vp->id), irqs << 16 | irqs);
> +
> +		if (irqs & VP_INT_DSP_HOLD_VALID) {
> +			complete(&vp->dsp_hold_completion);
> +			ret = IRQ_HANDLED;
> +		}
> +
> +		if (irqs & VP_INT_FS_FIELD) {
> +			unsigned long flags;
> +
> +			drm_crtc_handle_vblank(crtc);
> +			spin_lock_irqsave(&crtc->dev->event_lock, flags);
> +			if (vp->event) {
> +				uint32_t val = vop2_readl(vop2, RK3568_REG_CFG_DONE);
> +				if (!(val & BIT(vp->id))) {
> +					drm_crtc_send_vblank_event(crtc, vp->event);
> +					vp->event = NULL;
> +					drm_crtc_vblank_put(crtc);
> +				}
> +			}
> +			spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> +
> +			ret = IRQ_HANDLED;
> +		}
> +
> +		if (irqs & VP_INT_POST_BUF_EMPTY) {
> +			drm_err_ratelimited(vop2->drm,
> +					    "POST_BUF_EMPTY irq err at vp%d\n",
> +					    vp->id);
> +			ret = IRQ_HANDLED;
> +		}
> +	}
> +
> +	axi_irqs[0] = vop2_readl(vop2, RK3568_SYS0_INT_STATUS);
> +	vop2_writel(vop2, RK3568_SYS0_INT_CLR, axi_irqs[0] << 16 | axi_irqs[0]);
> +	axi_irqs[1] = vop2_readl(vop2, RK3568_SYS1_INT_STATUS);
> +	vop2_writel(vop2, RK3568_SYS1_INT_CLR, axi_irqs[1] << 16 | axi_irqs[1]);
> +
> +	for (i = 0; i < ARRAY_SIZE(axi_irqs); i++) {
> +		if (axi_irqs[i] & VOP2_INT_BUS_ERRPR) {
> +			drm_err_ratelimited(vop2->drm, "BUS_ERROR irq err\n");
> +			ret = IRQ_HANDLED;
> +		}
> +	}
> +
> +	pm_runtime_put(vop2->dev);
> +
> +	return ret;
> +}

Does reg writes, does the ISR need the reg spinlock here? I'm not
sure.

In general there appear to be a lot of issues with the register
lock, so either I'm misunderstanding what it's supposed to protect
or the code is very thread unsafe.

Regards,
Nicolas Frattaroli



