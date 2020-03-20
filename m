Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FFF18CF39
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 14:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6506EB41;
	Fri, 20 Mar 2020 13:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49DD6EB41
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 13:43:02 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200320134301euoutp02d5357feb220321fdd145ec910ad958e0~_BvgYgjs42230922309euoutp02T
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 13:43:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200320134301euoutp02d5357feb220321fdd145ec910ad958e0~_BvgYgjs42230922309euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584711781;
 bh=0HBsEQW0nDyR5f7RFxkQQBnpLl+HN/S75YPbsKByK/Q=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=M4JVQFKSxuNXTbbp/NZJ4G69Mp/RWkpHEjjE1Z05+b8A05wqg6XJccUBOZ0PEIlkx
 G0thKalfvpfwsddC3KZZTgE7KolQ6SIN7ciXAzdT2xBE50X75e9g6aRDVtNPYDGy5W
 9HRByJaRHTiHtypGTjMQl0MwvhbA2Bm6JWmWN/Jc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200320134301eucas1p1c4bed7023fd2e505ad70755ee6768ce3~_BvgKdN3a3231132311eucas1p1A;
 Fri, 20 Mar 2020 13:43:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 90.24.60679.568C47E5; Fri, 20
 Mar 2020 13:43:01 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200320134300eucas1p192ef6a5774f25650e4e9dadc16f5e9ac~_Bvf4P-hD2952429524eucas1p1g;
 Fri, 20 Mar 2020 13:43:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200320134300eusmtrp13f5b5546443f628e856167c466896115~_Bvf3oNcx2315923159eusmtrp1e;
 Fri, 20 Mar 2020 13:43:00 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-6a-5e74c865a284
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 92.F7.07950.468C47E5; Fri, 20
 Mar 2020 13:43:00 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200320134300eusmtip2ebe8449c6d3907dcfa83b5e6e4a8c812~_BvfqpwSX1106811068eusmtip2d;
 Fri, 20 Mar 2020 13:43:00 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] omapfb: Remove unused writeback code
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <06984d29-8ad8-e40f-eae0-bf9aa8267279@samsung.com>
Date: Fri, 20 Mar 2020 14:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200313122410.7528-1-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djPc7qpJ0riDFb081hc+fqezaJz4hJ2
 ixN9H1gt1s+/xebA4jG7Yyarx/3u40wex29sZ/L4vEkugCWKyyYlNSezLLVI3y6BK+P8vD2s
 BeeMK6bPe8HUwDhHq4uRk0NCwERi36uLrF2MXBxCAisYJdYdOMME4XxhlJiwbiE7hPOZUWLL
 65VsMC3L9k2GqlrOKNE6tRmq/y2jxP3uE8wgVWwCVhIT21cxgtjCApYS0+9dZAKxRQS0JD6d
 7QFq4OBgFqiQ2PAvHyTMK2An0ff/MwuIzSKgKnFxRxs7iC0qECHx6cFhVogaQYmTM5+A1XAC
 jZ+26hNYnFlAXOLWk/lMELa8xPa3c5hB7pEQmM4ucbHxNyvE1S4Sn+8ugrKFJV4d38IOYctI
 nJ7cwwLRsI5R4m/HC6ju7YwSyyf/g/rZWuLOuV9sEFdrSqzfpQ8RdpT4vvw1WFhCgE/ixltB
 iCP4JCZtm84MEeaV6GgTgqhWk9iwbAMbzNqunSuZJzAqzULy2iwk78xC8s4shL0LGFlWMYqn
 lhbnpqcWG+WllusVJ+YWl+al6yXn525iBCaX0/+Of9nBuOtP0iFGAQ5GJR5ei5UlcUKsiWXF
 lbmHGCU4mJVEeHXTi+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoE
 k2Xi4JRqYGR879adEqCpv+Hqn5Qj0w2TdEuC9pxc5uV6KzyqUUyRc2/ddKun7Duex1zvu1q5
 WN+i54GWv3/c18W/hDdGvlshs1TjdvjSiqKHd4suztP8xBXlvO34RL2EKbu/BHy0OsXwNnDR
 NweuhRXTn6lp/VsRK82zx6KpXfdppHXD4oL3qReNeRw0zJVYijMSDbWYi4oTAa+yHEIqAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xe7opJ0riDFZ8trS48vU9m0XnxCXs
 Fif6PrBarJ9/i82BxWN2x0xWj/vdx5k8jt/YzuTxeZNcAEuUnk1RfmlJqkJGfnGJrVK0oYWR
 nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsb5eXtYC84ZV0yf94KpgXGOVhcjJ4eE
 gInEsn2TmboYuTiEBJYySrx79oG9i5EDKCEjcXx9GUSNsMSfa11sEDWvGSUWzl3OBJJgE7CS
 mNi+ihHEFhawlJh+7yJYXERAS+LT2R5WEJtZoEJi+663rBDNvYwSOw7+ZQZJ8ArYSfT9/8wC
 YrMIqEpc3NHGDmKLCkRIHN4xixGiRlDi5MwnYDWcQMumrfoENVRd4s+8S8wQtrjErSfzmSBs
 eYntb+cwT2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMJq2
 Hfu5ZQdj17vgQ4wCHIxKPLwWK0vihFgTy4orcw8xSnAwK4nw6qYXxwnxpiRWVqUW5ccXleak
 Fh9iNAV6biKzlGhyPjDS80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFx
 cEo1MG6RZw9dv4hbvmeN6quJJ8Lu/f24melH/iy3A+8/u859dEfTJVLYhXltBF/kgYZXE/Sf
 v1WumO/rOJ9l49ZiyY2FZxTO/XWSbO65wjfHyld/X/8164b+I2sULNZZX25hCY2bpLXZ9N+X
 pldCXSer+Pg6Zsx+GrJYcFrmfMOAJUG3+k6rTnzqEqLEUpyRaKjFXFScCADKo5iXvAIAAA==
X-CMS-MailID: 20200320134300eucas1p192ef6a5774f25650e4e9dadc16f5e9ac
X-Msg-Generator: CA
X-RootMTR: 20200313122425eucas1p16b0df0e1a4b81fb9abb4a9c28fdf4fff
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200313122425eucas1p16b0df0e1a4b81fb9abb4a9c28fdf4fff
References: <CGME20200313122425eucas1p16b0df0e1a4b81fb9abb4a9c28fdf4fff@eucas1p1.samsung.com>
 <20200313122410.7528-1-tomi.valkeinen@ti.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/13/20 1:24 PM, Tomi Valkeinen wrote:
> Remove unused writeback code. This code will never be used, as omapfb is
> being deprecated.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Patch queued for v5.7, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 114 -------------------
>  drivers/video/fbdev/omap2/omapfb/dss/dss.h   |  20 ----
>  2 files changed, 134 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> index ce37da85cc45..4a16798b2ecd 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> @@ -557,11 +557,6 @@ u32 dispc_mgr_get_sync_lost_irq(enum omap_channel channel)
>  }
>  EXPORT_SYMBOL(dispc_mgr_get_sync_lost_irq);
>  
> -u32 dispc_wb_get_framedone_irq(void)
> -{
> -	return DISPC_IRQ_FRAMEDONEWB;
> -}
> -
>  bool dispc_mgr_go_busy(enum omap_channel channel)
>  {
>  	return mgr_fld_read(channel, DISPC_MGR_FLD_GO) == 1;
> @@ -579,30 +574,6 @@ void dispc_mgr_go(enum omap_channel channel)
>  }
>  EXPORT_SYMBOL(dispc_mgr_go);
>  
> -bool dispc_wb_go_busy(void)
> -{
> -	return REG_GET(DISPC_CONTROL2, 6, 6) == 1;
> -}
> -
> -void dispc_wb_go(void)
> -{
> -	enum omap_plane plane = OMAP_DSS_WB;
> -	bool enable, go;
> -
> -	enable = REG_GET(DISPC_OVL_ATTRIBUTES(plane), 0, 0) == 1;
> -
> -	if (!enable)
> -		return;
> -
> -	go = REG_GET(DISPC_CONTROL2, 6, 6) == 1;
> -	if (go) {
> -		DSSERR("GO bit not down for WB\n");
> -		return;
> -	}
> -
> -	REG_FLD_MOD(DISPC_CONTROL2, 1, 6, 6);
> -}
> -
>  static void dispc_ovl_write_firh_reg(enum omap_plane plane, int reg, u32 value)
>  {
>  	dispc_write_reg(DISPC_OVL_FIR_COEF_H(plane, reg), value);
> @@ -1028,13 +999,6 @@ static enum omap_channel dispc_ovl_get_channel_out(enum omap_plane plane)
>  	}
>  }
>  
> -void dispc_wb_set_channel_in(enum dss_writeback_channel channel)
> -{
> -	enum omap_plane plane = OMAP_DSS_WB;
> -
> -	REG_FLD_MOD(DISPC_OVL_ATTRIBUTES(plane), channel, 18, 16);
> -}
> -
>  static void dispc_ovl_set_burst_size(enum omap_plane plane,
>  		enum omap_burst_size burst_size)
>  {
> @@ -2805,74 +2769,6 @@ int dispc_ovl_setup(enum omap_plane plane, const struct omap_overlay_info *oi,
>  }
>  EXPORT_SYMBOL(dispc_ovl_setup);
>  
> -int dispc_wb_setup(const struct omap_dss_writeback_info *wi,
> -		bool mem_to_mem, const struct omap_video_timings *mgr_timings)
> -{
> -	int r;
> -	u32 l;
> -	enum omap_plane plane = OMAP_DSS_WB;
> -	const int pos_x = 0, pos_y = 0;
> -	const u8 zorder = 0, global_alpha = 0;
> -	const bool replication = false;
> -	bool truncation;
> -	int in_width = mgr_timings->x_res;
> -	int in_height = mgr_timings->y_res;
> -	enum omap_overlay_caps caps =
> -		OMAP_DSS_OVL_CAP_SCALE | OMAP_DSS_OVL_CAP_PRE_MULT_ALPHA;
> -
> -	DSSDBG("dispc_wb_setup, pa %x, pa_uv %x, %d,%d -> %dx%d, cmode %x, "
> -		"rot %d, mir %d\n", wi->paddr, wi->p_uv_addr, in_width,
> -		in_height, wi->width, wi->height, wi->color_mode, wi->rotation,
> -		wi->mirror);
> -
> -	r = dispc_ovl_setup_common(plane, caps, wi->paddr, wi->p_uv_addr,
> -		wi->buf_width, pos_x, pos_y, in_width, in_height, wi->width,
> -		wi->height, wi->color_mode, wi->rotation, wi->mirror, zorder,
> -		wi->pre_mult_alpha, global_alpha, wi->rotation_type,
> -		replication, mgr_timings, mem_to_mem);
> -
> -	switch (wi->color_mode) {
> -	case OMAP_DSS_COLOR_RGB16:
> -	case OMAP_DSS_COLOR_RGB24P:
> -	case OMAP_DSS_COLOR_ARGB16:
> -	case OMAP_DSS_COLOR_RGBA16:
> -	case OMAP_DSS_COLOR_RGB12U:
> -	case OMAP_DSS_COLOR_ARGB16_1555:
> -	case OMAP_DSS_COLOR_XRGB16_1555:
> -	case OMAP_DSS_COLOR_RGBX16:
> -		truncation = true;
> -		break;
> -	default:
> -		truncation = false;
> -		break;
> -	}
> -
> -	/* setup extra DISPC_WB_ATTRIBUTES */
> -	l = dispc_read_reg(DISPC_OVL_ATTRIBUTES(plane));
> -	l = FLD_MOD(l, truncation, 10, 10);	/* TRUNCATIONENABLE */
> -	l = FLD_MOD(l, mem_to_mem, 19, 19);	/* WRITEBACKMODE */
> -	if (mem_to_mem)
> -		l = FLD_MOD(l, 1, 26, 24);	/* CAPTUREMODE */
> -	else
> -		l = FLD_MOD(l, 0, 26, 24);	/* CAPTUREMODE */
> -	dispc_write_reg(DISPC_OVL_ATTRIBUTES(plane), l);
> -
> -	if (mem_to_mem) {
> -		/* WBDELAYCOUNT */
> -		REG_FLD_MOD(DISPC_OVL_ATTRIBUTES2(plane), 0, 7, 0);
> -	} else {
> -		int wbdelay;
> -
> -		wbdelay = min(mgr_timings->vfp + mgr_timings->vsw +
> -			mgr_timings->vbp, 255);
> -
> -		/* WBDELAYCOUNT */
> -		REG_FLD_MOD(DISPC_OVL_ATTRIBUTES2(plane), wbdelay, 7, 0);
> -	}
> -
> -	return r;
> -}
> -
>  int dispc_ovl_enable(enum omap_plane plane, bool enable)
>  {
>  	DSSDBG("dispc_enable_plane %d, %d\n", plane, enable);
> @@ -2903,16 +2799,6 @@ bool dispc_mgr_is_enabled(enum omap_channel channel)
>  }
>  EXPORT_SYMBOL(dispc_mgr_is_enabled);
>  
> -void dispc_wb_enable(bool enable)
> -{
> -	dispc_ovl_enable(OMAP_DSS_WB, enable);
> -}
> -
> -bool dispc_wb_is_enabled(void)
> -{
> -	return dispc_ovl_enabled(OMAP_DSS_WB);
> -}
> -
>  static void dispc_lcd_enable_signal_polarity(bool act_high)
>  {
>  	if (!dss_has_feature(FEAT_LCDENABLEPOL))
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.h b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
> index a2269008590f..21cfcbf74a6d 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.h
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
> @@ -89,17 +89,6 @@ enum dss_dsi_content_type {
>  	DSS_DSI_CONTENT_GENERIC,
>  };
>  
> -enum dss_writeback_channel {
> -	DSS_WB_LCD1_MGR =	0,
> -	DSS_WB_LCD2_MGR =	1,
> -	DSS_WB_TV_MGR =		2,
> -	DSS_WB_OVL0 =		3,
> -	DSS_WB_OVL1 =		4,
> -	DSS_WB_OVL2 =		5,
> -	DSS_WB_OVL3 =		6,
> -	DSS_WB_LCD3_MGR =	7,
> -};
> -
>  enum dss_pll_id {
>  	DSS_PLL_DSI1,
>  	DSS_PLL_DSI2,
> @@ -403,15 +392,6 @@ int dispc_mgr_get_clock_div(enum omap_channel channel,
>  		struct dispc_clock_info *cinfo);
>  void dispc_set_tv_pclk(unsigned long pclk);
>  
> -u32 dispc_wb_get_framedone_irq(void);
> -bool dispc_wb_go_busy(void);
> -void dispc_wb_go(void);
> -void dispc_wb_enable(bool enable);
> -bool dispc_wb_is_enabled(void);
> -void dispc_wb_set_channel_in(enum dss_writeback_channel channel);
> -int dispc_wb_setup(const struct omap_dss_writeback_info *wi,
> -		bool mem_to_mem, const struct omap_video_timings *timings);
> -
>  u32 dispc_read_irqstatus(void);
>  void dispc_clear_irqstatus(u32 mask);
>  u32 dispc_read_irqenable(void);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
