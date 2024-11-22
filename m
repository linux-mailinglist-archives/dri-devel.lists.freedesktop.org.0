Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A59D5687
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 01:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85710E201;
	Fri, 22 Nov 2024 00:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tFGumjMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9F710E201
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 00:05:39 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539d9fffea1so1480263e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 16:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732233937; x=1732838737; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1KAyJQfZm0CmYLeM6T1KNFUS7Aq70PuFpi7a8qa4S44=;
 b=tFGumjMUvaAkSPNpcChXdg1L1PLeTX9s2VBY0/S7nk54ceU6+UJf4CHUTYpGbeKpkx
 XjOjV7+nBensmMvp+NAe+rSB9jT5NSsnXiu/w1V3HsmnW8FzaczkfxKuE4JLdEz4FfHL
 qCIQzKvzvtRkR0eFhHNf8+bngpVfxdYKdsJi6gPC5kngS+dps9SYo55BDnbneGvhuImG
 15t2BN+TAErDqSOiMmBt/VBSL/5ykMd/FH0TbvqxB4ooDnmeOEsMoftk/s1WibHmFJJ3
 xBadeUIFp+myAY5R8LTfrH+eJ6RXWi4sEEYPcj5YjewpQbnq6TzCpqLXfcJDaoRXHmEn
 AWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732233937; x=1732838737;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1KAyJQfZm0CmYLeM6T1KNFUS7Aq70PuFpi7a8qa4S44=;
 b=n7fSOoWyh4Du/7yt482LyfcHP+k9OxiXkqtZZv4ZPmhfjMpi1EDAwXJNzA5d8j4e+J
 Aw/gc7ViAszS/Xw8JGmsJW6PfqH8sDuX6yxqv44h7YCrpWRs/uFWMYdQfELxxJTj4nD6
 g3+OxNqiyuXk3Hp1RZH1oumu1RlyduX2rGPysz83EiQurfX4uJTm2dEsZQBDuKBwrIEt
 bWa5xPMxkxUOK5s7gNluBux2chH6DW16mb8WPhi/5FFoPyQA11X++vYauHAJ0y0pQ7uJ
 xCe2VoabPbSdCqGVsfh2STVaF0xQlL2KVPKtGIwTu6Wp1trtq6iSjrxLtM8VTKKPX4M8
 L5ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRZHyywuYA29ppZEsNUaRXS4/k+iZLP6St6cz/WA76tP/mdR/Yc01ghwJ6awAXZiNA+8sl44c2fKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyno7iMznZouKKuY3GsL4lIFiTvEinz9NRvE2N98lkSLVA8NZhM
 dbLOMXTIw2cqzz4yUh1eYMgbMqbg4wzZZO6VSy3GvA2fZvqNCoBkYsstb9QSU1c=
X-Gm-Gg: ASbGncv0gkDa3KchUMgfC/m4M2419FTzAeIHyLxhxOyWNIUnHbqdW/CN1Ji5xubitGX
 iD8xDxibzHYPEl49/pQwMME8yx8UmsAGpzYWhR7Aw4ks1Ej3Qlf37ChEDgEPev99twz2ahPOrMq
 70CIt5eD2XRwgn4f1Vm2ksMdpn86BpM/D/LzbnFPD/7dZL3Ogn3p/1tF+sv0Bjdmnv5dnZB3F0o
 3M4CBlIi1PZADXjBaYTJrAhgDkXTrGPfPC+snOToife35Op5ADIxrEz+VDpnVJt+5SuixUsQJbs
 nWSZFvouAHbjriBlEOLXnyITZs7lwQ==
X-Google-Smtp-Source: AGHT+IGIMj4eDI4++nV9lsviqxg12ESwR9WEilZyyjFk+Pe0y3db1ZelPCRJMMwTSxiydGqYm4vhag==
X-Received: by 2002:a05:6512:b9a:b0:53d:d137:d7a4 with SMTP id
 2adb3069b0e04-53dd3aac10bmr293144e87.53.1732233937136; 
 Thu, 21 Nov 2024 16:05:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2445843sm123234e87.19.2024.11.21.16.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 16:05:35 -0800 (PST)
Date: Fri, 22 Nov 2024 02:05:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: keith zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, kernel@esmil.dk, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/9] drm/vs: Add Hardware Functions for VS DC8200
Message-ID: <kuoayjr6gfwsq3zbdeafmzx3kw27amkhmljlbpk4brgjkizm37@7wwjwg3tckjz>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <20241120061848.196754-5-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120061848.196754-5-keith.zhao@starfivetech.com>
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

On Wed, Nov 20, 2024 at 02:18:43PM +0800, keith zhao wrote:
> This commit introduces hardware-based APIs for
> the VS DRM related to the DC8200

This doesn't describe anything. I've asked to describe the hardware.
Also please don't use phrases as "This commit does this and this". See
Documentation/process/submitting-patches.rst

> 
> Signed-off-by: keith zhao <keith.zhao@starfivetech.com>
> ---
>  MAINTAINERS                            |    1 +
>  drivers/gpu/drm/Kconfig                |    2 +
>  drivers/gpu/drm/Makefile               |    1 +
>  drivers/gpu/drm/verisilicon/Kconfig    |   13 +
>  drivers/gpu/drm/verisilicon/Makefile   |    5 +
>  drivers/gpu/drm/verisilicon/vs_dc_hw.c | 1104 ++++++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_dc_hw.h |  492 +++++++++++
>  drivers/gpu/drm/verisilicon/vs_type.h  |   54 ++
>  8 files changed, 1672 insertions(+)
>  create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>  create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
> 

[...]

> +
> +struct dc_hw {
> +	enum dc_hw_out		out[DC_DISPLAY_NUM];
> +	void __iomem		*hi_base;
> +	void __iomem		*reg_base;
> +	struct dc_hw_plane_reg	reg[DC_LAYER_NUM];
> +
> +	struct dc_hw_gamma	gamma[DC_DISPLAY_NUM];
> +	struct vs_dc_info	*info;
> +};
> +
> +struct vs_dc_plane {
> +	enum dc_hw_plane_id id;
> +	u32 offset;
> +};
> +
> +struct vs_dc {
> +	struct vs_crtc		*crtc[DC_DISPLAY_NUM];

"Not defined here. Please drop and add when it is actually defined.",
this was in v4.

> +	struct dc_hw		hw;
> +
> +	struct vs_dc_plane	planes[PLANE_NUM];
> +};
> +
> +int dc_hw_init(struct vs_dc *dc);
> +void dc_hw_disable_plane(struct vs_dc *dc, u8 id);
> +void dc_hw_update_cursor(struct dc_hw *hw, u8 id, dma_addr_t dma_addr,
> +			 u32 crtc_w, u32 crtc_x, u32 crtc_y,
> +			 s32 hotspot_x, int32_t hotspot_y);
> +void dc_hw_disable_cursor(struct dc_hw *hw, u8 id);
> +void dc_hw_update_gamma(struct dc_hw *hw, u8 id, u16 index,
> +			u16 r, u16 g, u16 b);
> +void dc_hw_enable_gamma(struct dc_hw *hw, u8 id, bool enable);
> +void dc_hw_enable(struct dc_hw *hw, int id, struct drm_display_mode *mode,
> +		  u8 encoder_type, u32 output_fmt);
> +void dc_hw_disable(struct dc_hw *hw, int id);
> +void dc_hw_enable_interrupt(struct dc_hw *hw);
> +void dc_hw_disable_interrupt(struct dc_hw *hw);
> +void dc_hw_get_interrupt(struct dc_hw *hw, u8 *status);
> +void dc_hw_enable_shadow_register(struct vs_dc *dc, bool enable);
> +void dc_hw_set_out(struct dc_hw *hw, enum dc_hw_out out, u8 id);
> +void dc_hw_commit(struct dc_hw *hw);
> +void dc_plane_hw_update_format_colorspace(struct vs_dc *dc, u32 format,
> +					  enum drm_color_encoding encoding, u8 id, bool is_yuv);
> +void dc_plane_hw_update_address(struct vs_dc *dc, u8 id, u32 format, dma_addr_t *dma_addr,
> +				struct drm_framebuffer *drm_fb, struct drm_rect *src);
> +void dc_plane_hw_update_format(struct vs_dc *dc, u32 format, enum drm_color_encoding encoding,
> +			       unsigned int rotation, bool visible, unsigned int zpos,
> +			       u8 id, u8 display_id);
> +void dc_plane_hw_update_scale(struct vs_dc *dc, struct drm_rect *src, struct drm_rect *dst,
> +			      u8 id, u8 display_id, unsigned int rotation);
> +void dc_plane_hw_update_blend(struct vs_dc *dc, u16 alpha, u16 pixel_blend_mode,
> +			      u8 id, u8 display_id);
> +
> +#endif /* __VS_DC_HW_H__ */
> diff --git a/drivers/gpu/drm/verisilicon/vs_type.h b/drivers/gpu/drm/verisilicon/vs_type.h
> new file mode 100644
> index 000000000000..e9c4ef3cacd6
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_type.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_TYPE_H__
> +#define __VS_TYPE_H__
> +
> +enum drm_plane_type;
> +
> +struct vs_plane_data {
> +	unsigned int num_formats;
> +	const u32 *formats;
> +	u8 num_modifiers;
> +	const u64 *modifiers;
> +	unsigned int min_width;
> +	unsigned int min_height;
> +	unsigned int max_width;
> +	unsigned int max_height;
> +	unsigned int rotation;
> +	unsigned int blend_mode;
> +	unsigned int color_encoding;
> +	int min_scale; /* 16.16 fixed point */
> +	int max_scale; /* 16.16 fixed point */
> +	u8   zpos;
> +};

Doesn't seem to be used in this patch. I think in v4 I've already asked
to drop everything (data types, fields, defines) that are not used by
_this_ patch. Readd them later, as required.

> +
> +struct vs_plane_info {
> +	u32 id;
> +	const struct vs_plane_data *data;
> +	enum drm_plane_type type;
> +};
> +
> +struct vs_dc_info {
> +	const char *name;
> +
> +	u8 panel_num;
> +
> +	/* planes */
> +	u8 plane_num;
> +
> +	u8 layer_num;
> +	u8 primary_num;
> +	u8 overlay_num;
> +	u8 cursor_num;
> +	const struct vs_plane_info *info;
> +	/* 0 means no gamma LUT */
> +	u16 gamma_size;
> +	u8 gamma_bits;
> +
> +	u16 pitch_alignment;
> +};
> +
> +#endif /* __VS_TYPE_H__ */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
