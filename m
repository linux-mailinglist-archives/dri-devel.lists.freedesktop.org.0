Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56540B35F04
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 14:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70D910E0CC;
	Tue, 26 Aug 2025 12:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="1/5Dba4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFB210E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 12:19:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QCHvoi002374;
 Tue, 26 Aug 2025 14:19:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ujNkOZE0cuMCrkJwlKMLY6SmezeQ3JXoWavUp7i/iqo=; b=1/5Dba4O/peeQRSN
 JloI1F6I0ZRIfDeV4KvyF97b4X2XBjk4UIqo4TnTVCK6Q6OkTQKG7eTENFcUU4PL
 zXiSvv80PEDoGQxZ2F7RqehPvFLYgJ9ISh4Lj4lccEj9icRRUQU+K4v2J0DGqbp3
 OGjQCOTIgWbbfEfsAU3F66Mqgf8Ty3LIEe3s6zuL+XEYWyA8WbDJrcvfYA0Zj8FG
 7i79DDwiUrNiO9ZCFZLCdAOrODpfeqRQkPfSyJOks7JgheNE4z6VAn13KVR6hYps
 uGBE2G3GvBL1Hs/YdR+T6EZxPuagx2HKq5mXufsSq2cV+ps0aJfVsDmo7QtsaISm
 aRHKtQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q5tsu8ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Aug 2025 14:19:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3E05640046;
 Tue, 26 Aug 2025 14:18:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA55E6C67D9;
 Tue, 26 Aug 2025 14:17:49 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 14:17:49 +0200
Message-ID: <33ee08ca-2cf9-4229-b58c-a533814f13ba@foss.st.com>
Date: Tue, 26 Aug 2025 14:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/stm: ltdc: unify log system
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250825132951.547899-1-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250825132951.547899-1-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
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

Hi Raphael,

Thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Le 25/08/2025 à 15:29, Raphael Gallais-Pou a écrit :
> DRM_ERROR and similar are deprecated.  Use drm_dev based logging.
>
> Link: https://lore.kernel.org/r/20250821130356.883553-1-raphael.gallais-pou@foss.st.com
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Changes in v2:
> - Fix kernel test robot's warnings
> https://lore.kernel.org/all/202508250637.nLxtkS26-lkp@intel.com/
> - Rebased onto latest drm-misc-next
> - Remove Yannick's acked-by since the patch changed
> ---
>   drivers/gpu/drm/stm/ltdc.c | 139 +++++++++++++++++++------------------
>   1 file changed, 70 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index ba315c66a04d..b9477fbec1c1 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -641,7 +641,7 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
>   		break;
>   	default:
>   		/* RGB or not a YCbCr supported format */
> -		DRM_ERROR("Unsupported pixel format: %u\n", drm_pix_fmt);
> +		drm_err(plane->dev, "Unsupported pixel format: %u\n", drm_pix_fmt);
>   		return;
>   	}
>   
> @@ -664,18 +664,19 @@ static inline void ltdc_set_ycbcr_coeffs(struct drm_plane *plane)
>   	u32 lofs = plane->index * LAY_OFS;
>   
>   	if (enc != DRM_COLOR_YCBCR_BT601 && enc != DRM_COLOR_YCBCR_BT709) {
> -		DRM_ERROR("color encoding %d not supported, use bt601 by default\n", enc);
> +		drm_err(plane->dev, "color encoding %d not supported, use bt601 by default\n", enc);
>   		/* set by default color encoding to DRM_COLOR_YCBCR_BT601 */
>   		enc = DRM_COLOR_YCBCR_BT601;
>   	}
>   
>   	if (ran != DRM_COLOR_YCBCR_LIMITED_RANGE && ran != DRM_COLOR_YCBCR_FULL_RANGE) {
> -		DRM_ERROR("color range %d not supported, use limited range by default\n", ran);
> +		drm_err(plane->dev,
> +			"color range %d not supported, use limited range by default\n", ran);
>   		/* set by default color range to DRM_COLOR_YCBCR_LIMITED_RANGE */
>   		ran = DRM_COLOR_YCBCR_LIMITED_RANGE;
>   	}
>   
> -	DRM_DEBUG_DRIVER("Color encoding=%d, range=%d\n", enc, ran);
> +	drm_err(plane->dev, "Color encoding=%d, range=%d\n", enc, ran);
>   	regmap_write(ldev->regmap, LTDC_L1CYR0R + lofs,
>   		     ltdc_ycbcr2rgb_coeffs[enc][ran][0]);
>   	regmap_write(ldev->regmap, LTDC_L1CYR1R + lofs,
> @@ -774,7 +775,7 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
>   	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>   	struct drm_device *ddev = crtc->dev;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(crtc->dev, "\n");
>   
>   	pm_runtime_get_sync(ddev->dev);
>   
> @@ -798,7 +799,7 @@ static void ltdc_crtc_atomic_disable(struct drm_crtc *crtc,
>   	struct drm_device *ddev = crtc->dev;
>   	int layer_index = 0;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(crtc->dev, "\n");
>   
>   	drm_crtc_vblank_off(crtc);
>   
> @@ -837,7 +838,7 @@ ltdc_crtc_mode_valid(struct drm_crtc *crtc,
>   
>   	result = clk_round_rate(ldev->pixel_clk, target);
>   
> -	DRM_DEBUG_DRIVER("clk rate target %d, available %d\n", target, result);
> +	drm_dbg_driver(crtc->dev, "clk rate target %d, available %d\n", target, result);
>   
>   	/* Filter modes according to the max frequency supported by the pads */
>   	if (result > ldev->caps.pad_max_freq_hz)
> @@ -872,14 +873,14 @@ static bool ltdc_crtc_mode_fixup(struct drm_crtc *crtc,
>   	int rate = mode->clock * 1000;
>   
>   	if (clk_set_rate(ldev->pixel_clk, rate) < 0) {
> -		DRM_ERROR("Cannot set rate (%dHz) for pixel clk\n", rate);
> +		drm_err(crtc->dev, "Cannot set rate (%dHz) for pixel clk\n", rate);
>   		return false;
>   	}
>   
>   	adjusted_mode->clock = clk_get_rate(ldev->pixel_clk) / 1000;
>   
> -	DRM_DEBUG_DRIVER("requested clock %dkHz, adjusted clock %dkHz\n",
> -			 mode->clock, adjusted_mode->clock);
> +	drm_dbg_driver(crtc->dev, "requested clock %dkHz, adjusted clock %dkHz\n",
> +		       mode->clock, adjusted_mode->clock);
>   
>   	return true;
>   }
> @@ -934,20 +935,20 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
>   	if (!pm_runtime_active(ddev->dev)) {
>   		ret = pm_runtime_get_sync(ddev->dev);
>   		if (ret) {
> -			DRM_ERROR("Failed to set mode, cannot get sync\n");
> +			drm_err(crtc->dev, "Failed to set mode, cannot get sync\n");
>   			return;
>   		}
>   	}
>   
> -	DRM_DEBUG_DRIVER("CRTC:%d mode:%s\n", crtc->base.id, mode->name);
> -	DRM_DEBUG_DRIVER("Video mode: %dx%d", mode->hdisplay, mode->vdisplay);
> -	DRM_DEBUG_DRIVER(" hfp %d hbp %d hsl %d vfp %d vbp %d vsl %d\n",
> -			 mode->hsync_start - mode->hdisplay,
> -			 mode->htotal - mode->hsync_end,
> -			 mode->hsync_end - mode->hsync_start,
> -			 mode->vsync_start - mode->vdisplay,
> -			 mode->vtotal - mode->vsync_end,
> -			 mode->vsync_end - mode->vsync_start);
> +	drm_dbg_driver(crtc->dev, "CRTC:%d mode:%s\n", crtc->base.id, mode->name);
> +	drm_dbg_driver(crtc->dev, "Video mode: %dx%d", mode->hdisplay, mode->vdisplay);
> +	drm_dbg_driver(crtc->dev, " hfp %d hbp %d hsl %d vfp %d vbp %d vsl %d\n",
> +		       mode->hsync_start - mode->hdisplay,
> +		       mode->htotal - mode->hsync_end,
> +		       mode->hsync_end - mode->hsync_start,
> +		       mode->vsync_start - mode->vdisplay,
> +		       mode->vtotal - mode->vsync_end,
> +		       mode->vsync_end - mode->vsync_start);
>   
>   	/* Convert video timings to ltdc timings */
>   	hsync = mode->hsync_end - mode->hsync_start - 1;
> @@ -1033,7 +1034,7 @@ static void ltdc_crtc_atomic_flush(struct drm_crtc *crtc,
>   	struct drm_device *ddev = crtc->dev;
>   	struct drm_pending_vblank_event *event = crtc->state->event;
>   
> -	DRM_DEBUG_ATOMIC("\n");
> +	drm_dbg_atomic(crtc->dev, "\n");
>   
>   	ltdc_crtc_update_clut(crtc);
>   
> @@ -1121,7 +1122,7 @@ static int ltdc_crtc_enable_vblank(struct drm_crtc *crtc)
>   	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>   	struct drm_crtc_state *state = crtc->state;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(crtc->dev, "\n");
>   
>   	if (state->enable)
>   		regmap_set_bits(ldev->regmap, LTDC_IER, IER_LIE);
> @@ -1135,7 +1136,7 @@ static void ltdc_crtc_disable_vblank(struct drm_crtc *crtc)
>   {
>   	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(crtc->dev, "\n");
>   	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_LIE);
>   }
>   
> @@ -1144,11 +1145,11 @@ static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
>   	struct ltdc_device *ldev;
>   	int ret;
>   
> -	DRM_DEBUG_DRIVER("\n");
> -
>   	if (!crtc)
>   		return -ENODEV;
>   
> +	drm_dbg_driver(crtc->dev, "\n");
> +
>   	ldev = crtc_to_ltdc(crtc);
>   
>   	if (source && strcmp(source, "auto") == 0) {
> @@ -1168,14 +1169,14 @@ static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
>   static int ltdc_crtc_verify_crc_source(struct drm_crtc *crtc,
>   				       const char *source, size_t *values_cnt)
>   {
> -	DRM_DEBUG_DRIVER("\n");
> -
>   	if (!crtc)
>   		return -ENODEV;
>   
> +	drm_dbg_driver(crtc->dev, "\n");
> +
>   	if (source && strcmp(source, "auto") != 0) {
> -		DRM_DEBUG_DRIVER("Unknown CRC source %s for %s\n",
> -				 source, crtc->name);
> +		drm_dbg_driver(crtc->dev, "Unknown CRC source %s for %s\n",
> +			       source, crtc->name);
>   		return -EINVAL;
>   	}
>   
> @@ -1233,7 +1234,7 @@ static int ltdc_plane_atomic_check(struct drm_plane *plane,
>   	struct drm_framebuffer *fb = new_plane_state->fb;
>   	u32 src_w, src_h;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(plane->dev, "\n");
>   
>   	if (!fb)
>   		return 0;
> @@ -1244,7 +1245,7 @@ static int ltdc_plane_atomic_check(struct drm_plane *plane,
>   
>   	/* Reject scaling */
>   	if (src_w != new_plane_state->crtc_w || src_h != new_plane_state->crtc_h) {
> -		DRM_DEBUG_DRIVER("Scaling is not supported");
> +		drm_dbg_driver(plane->dev, "Scaling is not supported");
>   
>   		return -EINVAL;
>   	}
> @@ -1270,7 +1271,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   	enum ltdc_pix_fmt pf;
>   
>   	if (!newstate->crtc || !fb) {
> -		DRM_DEBUG_DRIVER("fb or crtc NULL");
> +		drm_dbg_driver(plane->dev, "fb or crtc NULL");
>   		return;
>   	}
>   
> @@ -1280,11 +1281,11 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   	src_w = newstate->src_w >> 16;
>   	src_h = newstate->src_h >> 16;
>   
> -	DRM_DEBUG_DRIVER("plane:%d fb:%d (%dx%d)@(%d,%d) -> (%dx%d)@(%d,%d)\n",
> -			 plane->base.id, fb->base.id,
> -			 src_w, src_h, src_x, src_y,
> -			 newstate->crtc_w, newstate->crtc_h,
> -			 newstate->crtc_x, newstate->crtc_y);
> +	drm_dbg_driver(plane->dev, "plane:%d fb:%d (%dx%d)@(%d,%d) -> (%dx%d)@(%d,%d)\n",
> +		       plane->base.id, fb->base.id,
> +		       src_w, src_h, src_x, src_y,
> +		       newstate->crtc_w, newstate->crtc_h,
> +		       newstate->crtc_x, newstate->crtc_y);
>   
>   	regmap_read(ldev->regmap, LTDC_BPCR, &bpcr);
>   
> @@ -1312,8 +1313,8 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   		val = ltdc_set_flexible_pixel_format(plane, pf);
>   
>   	if (val == NB_PF) {
> -		DRM_ERROR("Pixel format %.4s not supported\n",
> -			  (char *)&fb->format->format);
> +		drm_err(fb->dev, "Pixel format %.4s not supported\n",
> +			(char *)&fb->format->format);
>   		val = 0;	/* set by default ARGB 32 bits */
>   	}
>   	regmap_write_bits(ldev->regmap, LTDC_L1PFCR + lofs, LXPFCR_PF, val);
> @@ -1350,7 +1351,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   	if (newstate->rotation & DRM_MODE_REFLECT_Y)
>   		paddr += (fb->pitches[0] * (y1 - y0));
>   
> -	DRM_DEBUG_DRIVER("fb: phys 0x%08x", paddr);
> +	drm_dbg_driver(fb->dev, "fb: phys 0x%08x", paddr);
>   	regmap_write(ldev->regmap, LTDC_L1CFBAR + lofs, paddr);
>   
>   	/* Configures the color frame buffer pitch in bytes & line length */
> @@ -1517,8 +1518,8 @@ static void ltdc_plane_atomic_disable(struct drm_plane *plane,
>   		regmap_write_bits(ldev->regmap, LTDC_L1RCR + lofs,
>   				  LXRCR_IMR | LXRCR_VBR | LXRCR_GRMSK, LXRCR_VBR);
>   
> -	DRM_DEBUG_DRIVER("CRTC:%d plane:%d\n",
> -			 oldstate->crtc->base.id, plane->base.id);
> +	drm_dbg_driver(plane->dev, "CRTC:%d plane:%d\n",
> +		       oldstate->crtc->base.id, plane->base.id);
>   }
>   
>   static void ltdc_plane_atomic_print_state(struct drm_printer *p,
> @@ -1632,7 +1633,7 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
>   
>   	drm_plane_create_alpha_property(plane);
>   
> -	DRM_DEBUG_DRIVER("plane:%d created\n", plane->base.id);
> +	drm_dbg_driver(plane->dev, "plane:%d created\n", plane->base.id);
>   
>   	return plane;
>   }
> @@ -1647,7 +1648,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   
>   	primary = ltdc_plane_create(ddev, DRM_PLANE_TYPE_PRIMARY, 0);
>   	if (!primary) {
> -		DRM_ERROR("Can not create primary plane\n");
> +		drm_err(ddev, "Can not create primary plane\n");
>   		return -EINVAL;
>   	}
>   
> @@ -1668,7 +1669,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   		ret = drmm_crtc_init_with_planes(ddev, crtc, primary, NULL,
>   						 &ltdc_crtc_funcs, NULL);
>   	if (ret) {
> -		DRM_ERROR("Can not initialize CRTC\n");
> +		drm_err(ddev, "Can not initialize CRTC\n");
>   		return ret;
>   	}
>   
> @@ -1677,13 +1678,13 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   	drm_mode_crtc_set_gamma_size(crtc, CLUT_SIZE);
>   	drm_crtc_enable_color_mgmt(crtc, 0, false, CLUT_SIZE);
>   
> -	DRM_DEBUG_DRIVER("CRTC:%d created\n", crtc->base.id);
> +	drm_dbg_driver(ddev, "CRTC:%d created\n", crtc->base.id);
>   
>   	/* Add planes. Note : the first layer is used by primary plane */
>   	for (i = 1; i < ldev->caps.nb_layers; i++) {
>   		overlay = ltdc_plane_create(ddev, DRM_PLANE_TYPE_OVERLAY, i);
>   		if (!overlay) {
> -			DRM_ERROR("Can not create overlay plane %d\n", i);
> +			drm_err(ddev, "Can not create overlay plane %d\n", i);
>   			return -ENOMEM;
>   		}
>   		if (ldev->caps.dynamic_zorder)
> @@ -1704,7 +1705,7 @@ static void ltdc_encoder_disable(struct drm_encoder *encoder)
>   	struct drm_device *ddev = encoder->dev;
>   	struct ltdc_device *ldev = ddev->dev_private;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(encoder->dev, "\n");
>   
>   	/* Disable LTDC */
>   	regmap_clear_bits(ldev->regmap, LTDC_GCR, GCR_LTDCEN);
> @@ -1718,7 +1719,7 @@ static void ltdc_encoder_enable(struct drm_encoder *encoder)
>   	struct drm_device *ddev = encoder->dev;
>   	struct ltdc_device *ldev = ddev->dev_private;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(encoder->dev, "\n");
>   
>   	/* set fifo underrun threshold register */
>   	if (ldev->caps.fifo_threshold)
> @@ -1734,7 +1735,7 @@ static void ltdc_encoder_mode_set(struct drm_encoder *encoder,
>   {
>   	struct drm_device *ddev = encoder->dev;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(encoder->dev, "\n");
>   
>   	/*
>   	 * Set to default state the pinctrl only with DPI type.
> @@ -1770,7 +1771,7 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
>   	if (ret)
>   		return ret;
>   
> -	DRM_DEBUG_DRIVER("Bridge encoder:%d created\n", encoder->base.id);
> +	drm_dbg_driver(encoder->dev, "Bridge encoder:%d created\n", encoder->base.id);
>   
>   	return 0;
>   }
> @@ -1870,7 +1871,7 @@ void ltdc_suspend(struct drm_device *ddev)
>   {
>   	struct ltdc_device *ldev = ddev->dev_private;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(ddev, "\n");
>   	clk_disable_unprepare(ldev->pixel_clk);
>   }
>   
> @@ -1879,11 +1880,11 @@ int ltdc_resume(struct drm_device *ddev)
>   	struct ltdc_device *ldev = ddev->dev_private;
>   	int ret;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(ddev, "\n");
>   
>   	ret = clk_prepare_enable(ldev->pixel_clk);
>   	if (ret) {
> -		DRM_ERROR("failed to enable pixel clock (%d)\n", ret);
> +		drm_err(ddev, "failed to enable pixel clock (%d)\n", ret);
>   		return ret;
>   	}
>   
> @@ -1903,7 +1904,7 @@ int ltdc_load(struct drm_device *ddev)
>   	int irq, i, nb_endpoints;
>   	int ret = -ENODEV;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(ddev, "\n");
>   
>   	/* Get number of endpoints */
>   	nb_endpoints = of_graph_get_endpoint_count(np);
> @@ -1913,12 +1914,12 @@ int ltdc_load(struct drm_device *ddev)
>   	ldev->pixel_clk = devm_clk_get(dev, "lcd");
>   	if (IS_ERR(ldev->pixel_clk)) {
>   		if (PTR_ERR(ldev->pixel_clk) != -EPROBE_DEFER)
> -			DRM_ERROR("Unable to get lcd clock\n");
> +			drm_err(ddev, "Unable to get lcd clock\n");
>   		return PTR_ERR(ldev->pixel_clk);
>   	}
>   
>   	if (clk_prepare_enable(ldev->pixel_clk)) {
> -		DRM_ERROR("Unable to prepare pixel clock\n");
> +		drm_err(ddev, "Unable to prepare pixel clock\n");
>   		return -ENODEV;
>   	}
>   
> @@ -1939,7 +1940,7 @@ int ltdc_load(struct drm_device *ddev)
>   		if (panel) {
>   			bridge = drmm_panel_bridge_add(ddev, panel);
>   			if (IS_ERR(bridge)) {
> -				DRM_ERROR("panel-bridge endpoint %d\n", i);
> +				drm_err(ddev, "panel-bridge endpoint %d\n", i);
>   				ret = PTR_ERR(bridge);
>   				goto err;
>   			}
> @@ -1949,7 +1950,7 @@ int ltdc_load(struct drm_device *ddev)
>   			ret = ltdc_encoder_init(ddev, bridge);
>   			if (ret) {
>   				if (ret != -EPROBE_DEFER)
> -					DRM_ERROR("init encoder endpoint %d\n", i);
> +					drm_err(ddev, "init encoder endpoint %d\n", i);
>   				goto err;
>   			}
>   		}
> @@ -1967,29 +1968,29 @@ int ltdc_load(struct drm_device *ddev)
>   
>   	ldev->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(ldev->regs)) {
> -		DRM_ERROR("Unable to get ltdc registers\n");
> +		drm_err(ddev, "Unable to get ltdc registers\n");
>   		ret = PTR_ERR(ldev->regs);
>   		goto err;
>   	}
>   
>   	ldev->regmap = devm_regmap_init_mmio(&pdev->dev, ldev->regs, &stm32_ltdc_regmap_cfg);
>   	if (IS_ERR(ldev->regmap)) {
> -		DRM_ERROR("Unable to regmap ltdc registers\n");
> +		drm_err(ddev, "Unable to regmap ltdc registers\n");
>   		ret = PTR_ERR(ldev->regmap);
>   		goto err;
>   	}
>   
>   	ret = ltdc_get_caps(ddev);
>   	if (ret) {
> -		DRM_ERROR("hardware identifier (0x%08x) not supported!\n",
> -			  ldev->caps.hw_version);
> +		drm_err(ddev, "hardware identifier (0x%08x) not supported!\n",
> +			ldev->caps.hw_version);
>   		goto err;
>   	}
>   
>   	/* Disable all interrupts */
>   	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_MASK);
>   
> -	DRM_DEBUG_DRIVER("ltdc hw version 0x%08x\n", ldev->caps.hw_version);
> +	drm_dbg_driver(ddev, "ltdc hw version 0x%08x\n", ldev->caps.hw_version);
>   
>   	/* initialize default value for fifo underrun threshold & clear interrupt error counters */
>   	ldev->transfer_err = 0;
> @@ -2008,27 +2009,27 @@ int ltdc_load(struct drm_device *ddev)
>   						ltdc_irq_thread, IRQF_ONESHOT,
>   						dev_name(dev), ddev);
>   		if (ret) {
> -			DRM_ERROR("Failed to register LTDC interrupt\n");
> +			drm_err(ddev, "Failed to register LTDC interrupt\n");
>   			goto err;
>   		}
>   	}
>   
>   	crtc = drmm_kzalloc(ddev, sizeof(*crtc), GFP_KERNEL);
>   	if (!crtc) {
> -		DRM_ERROR("Failed to allocate crtc\n");
> +		drm_err(ddev, "Failed to allocate crtc\n");
>   		ret = -ENOMEM;
>   		goto err;
>   	}
>   
>   	ret = ltdc_crtc_init(ddev, crtc);
>   	if (ret) {
> -		DRM_ERROR("Failed to init crtc\n");
> +		drm_err(ddev, "Failed to init crtc\n");
>   		goto err;
>   	}
>   
>   	ret = drm_vblank_init(ddev, NB_CRTC);
>   	if (ret) {
> -		DRM_ERROR("Failed calling drm_vblank_init()\n");
> +		drm_err(ddev, "Failed calling drm_vblank_init()\n");
>   		goto err;
>   	}
>   
> @@ -2047,7 +2048,7 @@ int ltdc_load(struct drm_device *ddev)
>   
>   void ltdc_unload(struct drm_device *ddev)
>   {
> -	DRM_DEBUG_DRIVER("\n");
> +	drm_dbg_driver(ddev, "\n");
>   
>   	pm_runtime_disable(ddev->dev);
>   }
