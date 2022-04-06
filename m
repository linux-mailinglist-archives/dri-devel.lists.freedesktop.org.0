Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1594F623C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 16:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1B9882D0;
	Wed,  6 Apr 2022 14:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9263890BF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 14:58:49 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nc77P-0001OW-VB; Wed, 06 Apr 2022 16:58:47 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nc77P-0006K0-CK; Wed, 06 Apr 2022 16:58:47 +0200
Date: Wed, 6 Apr 2022 16:58:47 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
Message-ID: <20220406145847.GX4012@pengutronix.de>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
 <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
 <BA4C591F-D115-43D2-BF59-A75B29889E50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BA4C591F-D115-43D2-BF59-A75B29889E50@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:56:21 up 7 days, 3:26, 72 users, load average: 0.20, 0.15, 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 11:47:22AM +0200, Piotr Oniszczuk wrote:
> 
> 
> > Wiadomość napisana przez Piotr Oniszczuk <piotr.oniszczuk@gmail.com> w dniu 01.04.2022, o godz. 15:05:
> > 
> > 
> > 
> >> Wiadomość napisana przez Sascha Hauer <s.hauer@pengutronix.de> w dniu 01.04.2022, o godz. 14:52:
> >> 
> >> Based on the discussion with Andy please try the following patch, it
> >> should fix your green screen issue. Note that with this patch the
> >> CRTC and plane ids will change, so the modetest commands need to be
> >> adjusted accordingly.
> >> 
> >> Sascha
> >> 
> >> -------------------------8<---------------------------
> >> 
> >> -- 
> >> From cbc03073623a7180243331ac24c3afaf9dec7522 Mon Sep 17 00:00:00 2001
> >> From: Sascha Hauer <s.hauer@pengutronix.de>
> >> Date: Fri, 1 Apr 2022 14:48:49 +0200
> >> Subject: [PATCH] fixup! drm: rockchip: Add VOP2 driver
> >> 
> >> ---
> >> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 ++++++++++++++
> >> 1 file changed, 14 insertions(+)
> >> 
> >> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> index 7dba7b9b63dc6..1421bf2f133f1 100644
> >> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> @@ -2287,6 +2287,20 @@ static int vop2_create_crtc(struct vop2 *vop2)
> >> 			}
> >> 		}
> >> 
> >> +		if (vop2->data->soc_id == 3566) {
> >> +			/*
> >> +			 * On RK3566 these windows don't have an independent
> >> +			 * framebuffer. They share the framebuffer with smart0,
> >> +			 * esmart0 and cluster0 respectively.
> >> +			 */
> >> +			switch (win->data->phys_id) {
> >> +			case ROCKCHIP_VOP2_SMART1:
> >> +			case ROCKCHIP_VOP2_ESMART1:
> >> +			case ROCKCHIP_VOP2_CLUSTER1:
> >> +				continue;
> >> +			}
> >> +		}
> >> +
> >> 		if (win->type == DRM_PLANE_TYPE_OVERLAY)
> >> 			possible_crtcs = (1 << nvps) - 1;
> >> 
> >> -- 
> >> 2.30.2
> >> 
> >> Pengutronix e.K.                           |                             |
> >> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> >> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> >> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> > 
> > Sascha
> > 
> > Now works perfectly!
> > (hd playback with 3.5...5.5% cpu while rendering to drm plane)
> > 
> > Fantastic work of You!
> 
> Sascha,
> 
> Having vop2 finally working with drm planes rendering i discovered another issue: overlay osd is invisible at playback. 
> 
> context: player draws video on plane #X and osd on overlay plane #Y
> When user do i.e. seek at playback - app uses overlay OSD plane to display OSD to user. This approach is used by majority of players (KODI, etc.)
> 
> This works well on all platforms i have  - except rk3566 
> 
> For me it looks like z-order vop2 issue or alpha blending issue.
> As this is only on rk3566 and only on drm-planes mode - issue is vop2 related imho.

During my testing I haven't seen any z-order issues, but that doesn't
mean much. With Weston I can currently only use the AFBC enabled cluster
windows and with modetest I can only use the non-cluster windows. Are
you able to find out which window is used for the OSD?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
