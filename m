Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F997C7D8D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 08:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4829610E5A8;
	Fri, 13 Oct 2023 06:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C8410E5A8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 06:13:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qrBQg-0000vt-Ij; Fri, 13 Oct 2023 08:13:46 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1qrBQf-001Kft-Ab; Fri, 13 Oct 2023 08:13:45 +0200
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qrBQf-00EE5J-7t; Fri, 13 Oct 2023 08:13:45 +0200
Date: Fri, 13 Oct 2023 08:13:45 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH 1/3] drm/rockchip: remove unused struct in vop2
Message-ID: <20231013061345.GJ3359458@pengutronix.de>
References: <20231012023439.1497304-1-andyshrk@163.com>
 <20231012023653.1497576-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012023653.1497576-1-andyshrk@163.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: sjoerd.simons@collabora.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 10:36:53AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> These structs are undefined and un used.
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> 
> ---
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 --
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 3 ---
>  2 files changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 583df4d22f7e..3c524ca23d53 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -160,7 +160,6 @@ struct vop2_video_port {
>  	struct vop2 *vop2;
>  	struct clk *dclk;
>  	unsigned int id;
> -	const struct vop2_video_port_regs *regs;
>  	const struct vop2_video_port_data *data;
>  
>  	struct completion dsp_hold_completion;
> @@ -2274,7 +2273,6 @@ static int vop2_create_crtcs(struct vop2 *vop2)
>  		vp = &vop2->vps[i];
>  		vp->vop2 = vop2;
>  		vp->id = vp_data->id;
> -		vp->regs = vp_data->regs;
>  		vp->data = vp_data;
>  
>  		snprintf(dclk_name, sizeof(dclk_name), "dclk_vp%d", vp->id);
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> index f1234a151130..56fd31e05238 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -134,16 +134,13 @@ struct vop2_video_port_data {
>  	u16 cubic_lut_len;
>  	struct vop_rect max_output;
>  	const u8 pre_scan_max_dly[4];
> -	const struct vop2_video_port_regs *regs;
>  	unsigned int offset;
>  };
>  
>  struct vop2_data {
>  	u8 nr_vps;
> -	const struct vop2_ctrl *ctrl;
>  	const struct vop2_win_data *win;
>  	const struct vop2_video_port_data *vp;
> -	const struct vop_csc_table *csc_table;
>  	struct vop_rect max_input;
>  	struct vop_rect max_output;
>  
> -- 
> 2.34.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
