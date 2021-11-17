Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF8745558D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B1E6E9BE;
	Thu, 18 Nov 2021 07:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575D06E420
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:50:57 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mnMH1-0000XG-Hs; Wed, 17 Nov 2021 15:50:55 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mnMH0-0001C9-9I; Wed, 17 Nov 2021 15:50:54 +0100
Date: Wed, 17 Nov 2021 15:50:54 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Heiko =?iso-8859-15?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 11/12] drm/rockchip: Make VOP driver optional
Message-ID: <20211117145054.GL6556@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <20211117143347.314294-12-s.hauer@pengutronix.de>
 <15744316.EhFUcUTHNY@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15744316.EhFUcUTHNY@diego>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:44:50 up 272 days, 18:08, 147 users,  load average: 0.28, 0.17,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 18 Nov 2021 07:28:27 +0000
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 03:40:26PM +0100, Heiko Stübner wrote:
> Am Mittwoch, 17. November 2021, 15:33:46 CET schrieb Sascha Hauer:
> > With upcoming VOP2 support VOP won't be the only choice anymore, so make
> > the VOP driver optional.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  arch/arm/configs/multi_v7_defconfig         | 1 +
> >  arch/arm64/configs/defconfig                | 1 +
> >  drivers/gpu/drm/rockchip/Kconfig            | 7 +++++++
> >  drivers/gpu/drm/rockchip/Makefile           | 3 ++-
> >  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
> >  5 files changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> > index c951aeed2138c..fc123e8f3e2f9 100644
> > --- a/arch/arm/configs/multi_v7_defconfig
> > +++ b/arch/arm/configs/multi_v7_defconfig
> > @@ -667,6 +667,7 @@ CONFIG_DRM_EXYNOS_DPI=y
> >  CONFIG_DRM_EXYNOS_DSI=y
> >  CONFIG_DRM_EXYNOS_HDMI=y
> >  CONFIG_DRM_ROCKCHIP=m
> > +CONFIG_ROCKCHIP_VOP=y
> >  CONFIG_ROCKCHIP_ANALOGIX_DP=y
> >  CONFIG_ROCKCHIP_DW_HDMI=y
> >  CONFIG_ROCKCHIP_DW_MIPI_DSI=y
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index f2e2b9bdd7024..a623386473dc9 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -682,6 +682,7 @@ CONFIG_DRM_EXYNOS_DSI=y
> >  CONFIG_DRM_EXYNOS_HDMI=y
> >  CONFIG_DRM_EXYNOS_MIC=y
> >  CONFIG_DRM_ROCKCHIP=m
> > +CONFIG_ROCKCHIP_VOP=y
> >  CONFIG_ROCKCHIP_ANALOGIX_DP=y
> >  CONFIG_ROCKCHIP_CDN_DP=y
> >  CONFIG_ROCKCHIP_DW_HDMI=y
> > diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> > index 9f1ecefc39332..a1c4158259099 100644
> > --- a/drivers/gpu/drm/rockchip/Kconfig
> > +++ b/drivers/gpu/drm/rockchip/Kconfig
> > @@ -21,8 +21,15 @@ config DRM_ROCKCHIP
> >  
> >  if DRM_ROCKCHIP
> >  
> > +config ROCKCHIP_VOP
> > +	bool "Rockchip VOP driver"
> 
> would this benefit from a default-y ?
> For builds reusing preexisting .configs.

I enabled CONFIG_ROCKCHIP_VOP for all configs in the tree that enable
CONFIG_DRM_ROCKCHIP, so defconfig users shouldn't see any surprises.
That won't help users of custom configs of course.

I don't know what's preferred in such cases, I can change to default-y
if you like.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
