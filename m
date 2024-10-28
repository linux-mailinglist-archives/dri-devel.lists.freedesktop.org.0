Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CB89B2A0F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 09:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1768910E369;
	Mon, 28 Oct 2024 08:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JVo2gvMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F2A10E369
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 08:18:44 +0000 (UTC)
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi
 [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A6EB346;
 Mon, 28 Oct 2024 09:18:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730103518;
 bh=oTZcLPgcKD+r+j82teHUk2WjErDiTFdhz3SQ/oyqBBY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JVo2gvMep981S+CQqvIUtYkte+efuo8Gy2cKxpe9ltI3KEGG2BnjW4sbXiOdm8SEp
 Eymlwwtme+7uZU+z7NxXw/vZTln2U6zv18VU+HB61PkfHtHo3367KQmrr9nbQMf8oa
 HkvPWD1z5L+9lk6dEfjlR7l/cXyLrykT9CvEdsXQ=
Message-ID: <3d1d1008-0178-412a-ba26-2e1a956cfed3@ideasonboard.com>
Date: Mon, 28 Oct 2024 10:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/omap: Clean up deadcode functions
To: linux@treblig.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
References: <20241026220010.93773-1-linux@treblig.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241026220010.93773-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 27/10/2024 01:00, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> dispc_enable_fifomerge() last use was removed by 2012's
> commit 85099f11bd03 ("Revert "OMAPDSS: APPLY: add fifo merge support
> funcs"")
> 
> dispc_has_writeback(), dispc_wb_get_framedone_irq(), dispc_wb_go(),
> dispc_wb_go_busy() and dispc_wb_setup() were changed from statics
> to public symbols and unwired from a structure by 2020's
> commit dac62bcafeaa ("drm/omap: remove dispc_ops")
> but didn't have any users.
> 
> dispc_mgr_get_clock_div() got renamed from dispc_get_clock_div()
> and it's last use was removed in 2011 by commit
> 42c9dee82129 ("OMAP: DSS2: Remove FB_OMAP_BOOTLOADER_INIT support")
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   drivers/gpu/drm/omapdrm/dss/dispc.c | 146 ----------------------------
>   drivers/gpu/drm/omapdrm/dss/dss.h   |  13 ---
>   2 files changed, 159 deletions(-)
> 

Thanks, looks good to me. I'll push to drm-misc-next.

  Tomi

> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index 993691b3cc7e..9344855c4887 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -691,11 +691,6 @@ u32 dispc_mgr_get_sync_lost_irq(struct dispc_device *dispc,
>   	return mgr_desc[channel].sync_lost_irq;
>   }
>   
> -u32 dispc_wb_get_framedone_irq(struct dispc_device *dispc)
> -{
> -	return DISPC_IRQ_FRAMEDONEWB;
> -}
> -
>   void dispc_mgr_enable(struct dispc_device *dispc,
>   			     enum omap_channel channel, bool enable)
>   {
> @@ -726,30 +721,6 @@ void dispc_mgr_go(struct dispc_device *dispc, enum omap_channel channel)
>   	mgr_fld_write(dispc, channel, DISPC_MGR_FLD_GO, 1);
>   }
>   
> -bool dispc_wb_go_busy(struct dispc_device *dispc)
> -{
> -	return REG_GET(dispc, DISPC_CONTROL2, 6, 6) == 1;
> -}
> -
> -void dispc_wb_go(struct dispc_device *dispc)
> -{
> -	enum omap_plane_id plane = OMAP_DSS_WB;
> -	bool enable, go;
> -
> -	enable = REG_GET(dispc, DISPC_OVL_ATTRIBUTES(plane), 0, 0) == 1;
> -
> -	if (!enable)
> -		return;
> -
> -	go = REG_GET(dispc, DISPC_CONTROL2, 6, 6) == 1;
> -	if (go) {
> -		DSSERR("GO bit not down for WB\n");
> -		return;
> -	}
> -
> -	REG_FLD_MOD(dispc, DISPC_CONTROL2, 1, 6, 6);
> -}
> -
>   static void dispc_ovl_write_firh_reg(struct dispc_device *dispc,
>   				     enum omap_plane_id plane, int reg,
>   				     u32 value)
> @@ -1498,17 +1469,6 @@ void dispc_ovl_set_fifo_threshold(struct dispc_device *dispc,
>   				min(high, 0xfffu));
>   }
>   
> -void dispc_enable_fifomerge(struct dispc_device *dispc, bool enable)
> -{
> -	if (!dispc_has_feature(dispc, FEAT_FIFO_MERGE)) {
> -		WARN_ON(enable);
> -		return;
> -	}
> -
> -	DSSDBG("FIFO merge %s\n", enable ? "enabled" : "disabled");
> -	REG_FLD_MOD(dispc, DISPC_CONFIG, enable ? 1 : 0, 14, 14);
> -}
> -
>   void dispc_ovl_compute_fifo_thresholds(struct dispc_device *dispc,
>   				       enum omap_plane_id plane,
>   				       u32 *fifo_low, u32 *fifo_high,
> @@ -2814,95 +2774,6 @@ int dispc_ovl_setup(struct dispc_device *dispc,
>   	return r;
>   }
>   
> -int dispc_wb_setup(struct dispc_device *dispc,
> -		   const struct omap_dss_writeback_info *wi,
> -		   bool mem_to_mem, const struct videomode *vm,
> -		   enum dss_writeback_channel channel_in)
> -{
> -	int r;
> -	u32 l;
> -	enum omap_plane_id plane = OMAP_DSS_WB;
> -	const int pos_x = 0, pos_y = 0;
> -	const u8 zorder = 0, global_alpha = 0;
> -	const bool replication = true;
> -	bool truncation;
> -	int in_width = vm->hactive;
> -	int in_height = vm->vactive;
> -	enum omap_overlay_caps caps =
> -		OMAP_DSS_OVL_CAP_SCALE | OMAP_DSS_OVL_CAP_PRE_MULT_ALPHA;
> -
> -	if (vm->flags & DISPLAY_FLAGS_INTERLACED)
> -		in_height /= 2;
> -
> -	DSSDBG("dispc_wb_setup, pa %x, pa_uv %x, %d,%d -> %dx%d, cmode %x, "
> -		"rot %d\n", wi->paddr, wi->p_uv_addr, in_width,
> -		in_height, wi->width, wi->height, wi->fourcc, wi->rotation);
> -
> -	r = dispc_ovl_setup_common(dispc, plane, caps, wi->paddr, wi->p_uv_addr,
> -		wi->buf_width, pos_x, pos_y, in_width, in_height, wi->width,
> -		wi->height, wi->fourcc, wi->rotation, zorder,
> -		wi->pre_mult_alpha, global_alpha, wi->rotation_type,
> -		replication, vm, mem_to_mem, DRM_COLOR_YCBCR_BT601,
> -		DRM_COLOR_YCBCR_LIMITED_RANGE);
> -	if (r)
> -		return r;
> -
> -	switch (wi->fourcc) {
> -	case DRM_FORMAT_RGB565:
> -	case DRM_FORMAT_RGB888:
> -	case DRM_FORMAT_ARGB4444:
> -	case DRM_FORMAT_RGBA4444:
> -	case DRM_FORMAT_RGBX4444:
> -	case DRM_FORMAT_ARGB1555:
> -	case DRM_FORMAT_XRGB1555:
> -	case DRM_FORMAT_XRGB4444:
> -		truncation = true;
> -		break;
> -	default:
> -		truncation = false;
> -		break;
> -	}
> -
> -	/* setup extra DISPC_WB_ATTRIBUTES */
> -	l = dispc_read_reg(dispc, DISPC_OVL_ATTRIBUTES(plane));
> -	l = FLD_MOD(l, truncation, 10, 10);	/* TRUNCATIONENABLE */
> -	l = FLD_MOD(l, channel_in, 18, 16);	/* CHANNELIN */
> -	l = FLD_MOD(l, mem_to_mem, 19, 19);	/* WRITEBACKMODE */
> -	if (mem_to_mem)
> -		l = FLD_MOD(l, 1, 26, 24);	/* CAPTUREMODE */
> -	else
> -		l = FLD_MOD(l, 0, 26, 24);	/* CAPTUREMODE */
> -	dispc_write_reg(dispc, DISPC_OVL_ATTRIBUTES(plane), l);
> -
> -	if (mem_to_mem) {
> -		/* WBDELAYCOUNT */
> -		REG_FLD_MOD(dispc, DISPC_OVL_ATTRIBUTES2(plane), 0, 7, 0);
> -	} else {
> -		u32 wbdelay;
> -
> -		if (channel_in == DSS_WB_TV_MGR)
> -			wbdelay = vm->vsync_len + vm->vback_porch;
> -		else
> -			wbdelay = vm->vfront_porch + vm->vsync_len +
> -				vm->vback_porch;
> -
> -		if (vm->flags & DISPLAY_FLAGS_INTERLACED)
> -			wbdelay /= 2;
> -
> -		wbdelay = min(wbdelay, 255u);
> -
> -		/* WBDELAYCOUNT */
> -		REG_FLD_MOD(dispc, DISPC_OVL_ATTRIBUTES2(plane), wbdelay, 7, 0);
> -	}
> -
> -	return 0;
> -}
> -
> -bool dispc_has_writeback(struct dispc_device *dispc)
> -{
> -	return dispc->feat->has_writeback;
> -}
> -
>   int dispc_ovl_enable(struct dispc_device *dispc,
>   			    enum omap_plane_id plane, bool enable)
>   {
> @@ -3742,23 +3613,6 @@ void dispc_mgr_set_clock_div(struct dispc_device *dispc,
>   				  cinfo->pck_div);
>   }
>   
> -int dispc_mgr_get_clock_div(struct dispc_device *dispc,
> -			    enum omap_channel channel,
> -			    struct dispc_clock_info *cinfo)
> -{
> -	unsigned long fck;
> -
> -	fck = dispc_fclk_rate(dispc);
> -
> -	cinfo->lck_div = REG_GET(dispc, DISPC_DIVISORo(channel), 23, 16);
> -	cinfo->pck_div = REG_GET(dispc, DISPC_DIVISORo(channel), 7, 0);
> -
> -	cinfo->lck = fck / cinfo->lck_div;
> -	cinfo->pck = cinfo->lck / cinfo->pck_div;
> -
> -	return 0;
> -}
> -
>   u32 dispc_read_irqstatus(struct dispc_device *dispc)
>   {
>   	return dispc_read_reg(dispc, DISPC_IRQSTATUS);
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/dss/dss.h
> index 4ff02fbc0e71..a8b231ed4f4b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.h
> @@ -416,7 +416,6 @@ u32 dispc_mgr_get_framedone_irq(struct dispc_device *dispc,
>   				       enum omap_channel channel);
>   u32 dispc_mgr_get_sync_lost_irq(struct dispc_device *dispc,
>   				       enum omap_channel channel);
> -u32 dispc_wb_get_framedone_irq(struct dispc_device *dispc);
>   
>   u32 dispc_get_memory_bandwidth_limit(struct dispc_device *dispc);
>   
> @@ -458,20 +457,11 @@ int dispc_ovl_setup(struct dispc_device *dispc,
>   int dispc_ovl_enable(struct dispc_device *dispc,
>   			    enum omap_plane_id plane, bool enable);
>   
> -bool dispc_has_writeback(struct dispc_device *dispc);
> -int dispc_wb_setup(struct dispc_device *dispc,
> -		   const struct omap_dss_writeback_info *wi,
> -		   bool mem_to_mem, const struct videomode *vm,
> -		   enum dss_writeback_channel channel_in);
> -bool dispc_wb_go_busy(struct dispc_device *dispc);
> -void dispc_wb_go(struct dispc_device *dispc);
> -
>   void dispc_enable_sidle(struct dispc_device *dispc);
>   void dispc_disable_sidle(struct dispc_device *dispc);
>   
>   void dispc_lcd_enable_signal(struct dispc_device *dispc, bool enable);
>   void dispc_pck_free_enable(struct dispc_device *dispc, bool enable);
> -void dispc_enable_fifomerge(struct dispc_device *dispc, bool enable);
>   
>   typedef bool (*dispc_div_calc_func)(int lckd, int pckd, unsigned long lck,
>   		unsigned long pck, void *data);
> @@ -494,9 +484,6 @@ void dispc_ovl_compute_fifo_thresholds(struct dispc_device *dispc,
>   void dispc_mgr_set_clock_div(struct dispc_device *dispc,
>   			     enum omap_channel channel,
>   			     const struct dispc_clock_info *cinfo);
> -int dispc_mgr_get_clock_div(struct dispc_device *dispc,
> -			    enum omap_channel channel,
> -			    struct dispc_clock_info *cinfo);
>   void dispc_set_tv_pclk(struct dispc_device *dispc, unsigned long pclk);
>   
>   #ifdef CONFIG_OMAP2_DSS_COLLECT_IRQ_STATS

