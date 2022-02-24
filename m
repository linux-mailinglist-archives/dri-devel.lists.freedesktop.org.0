Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D4A4C2490
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 08:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39B310F482;
	Thu, 24 Feb 2022 07:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D6710F47E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 07:47:55 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nN8qv-0006vD-AC; Thu, 24 Feb 2022 08:47:53 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nN8qs-0005n6-Mj; Thu, 24 Feb 2022 08:47:50 +0100
Date: Thu, 24 Feb 2022 08:47:50 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v6 21/23] drm: rockchip: Add VOP2 driver
Message-ID: <20220224074750.GR9136@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-22-s.hauer@pengutronix.de>
 <b9b59c1d-5808-f348-62fb-257746df134d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9b59c1d-5808-f348-62fb-257746df134d@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:39:49 up 75 days, 16:25, 81 users,  load average: 0.90, 0.38, 0.25
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 04:24:29PM +0300, Dmitry Osipenko wrote:
> 17.02.2022 11:29, Sascha Hauer пишет:
> > @@ -28,6 +28,12 @@ config ROCKCHIP_VOP
> >  	  This selects support for the VOP driver. You should enable it
> >  	  on all older SoCs up to RK3399.
> >  
> > +config ROCKCHIP_VOP2
> > +	bool "Rockchip VOP2 driver"
> > +	help
> > +	  This selects support for the VOP2 driver. You should enable it
> > +	  on all newer SoCs beginning form RK3568.
> 
> s/form/from/
> 
> The ROCKCHIP_VOP option is "default y". Do you really want "default n"
> for the VOP2?

ROCKCHIP_VOP is only default y to keep the VOP driver enabled for
existing defconfig that were generated before the introduction of
that symbol.
We don't have this problem for VOP2, so no need to make it default y.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
