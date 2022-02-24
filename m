Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D74714C2EA4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 15:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4794E10EA23;
	Thu, 24 Feb 2022 14:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671A910EA23
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 14:47:19 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nNFOn-0002CG-Kv; Thu, 24 Feb 2022 15:47:17 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nNFOk-0001ct-HF; Thu, 24 Feb 2022 15:47:14 +0100
Date: Thu, 24 Feb 2022 15:47:14 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v6 21/23] drm: rockchip: Add VOP2 driver
Message-ID: <20220224144714.GV9136@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-22-s.hauer@pengutronix.de>
 <b9b59c1d-5808-f348-62fb-257746df134d@collabora.com>
 <20220224074750.GR9136@pengutronix.de>
 <a6f2b4a8-b9f0-dd2b-2361-8ede766b8394@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6f2b4a8-b9f0-dd2b-2361-8ede766b8394@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:38:31 up 75 days, 23:24, 89 users,  load average: 0.08, 0.12, 0.17
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 05:36:29PM +0300, Dmitry Osipenko wrote:
> On 2/24/22 10:47, Sascha Hauer wrote:
> > On Thu, Feb 17, 2022 at 04:24:29PM +0300, Dmitry Osipenko wrote:
> >> 17.02.2022 11:29, Sascha Hauer пишет:
> >>> @@ -28,6 +28,12 @@ config ROCKCHIP_VOP
> >>>  	  This selects support for the VOP driver. You should enable it
> >>>  	  on all older SoCs up to RK3399.
> >>>  
> >>> +config ROCKCHIP_VOP2
> >>> +	bool "Rockchip VOP2 driver"
> >>> +	help
> >>> +	  This selects support for the VOP2 driver. You should enable it
> >>> +	  on all newer SoCs beginning form RK3568.
> >>
> >> s/form/from/
> >>
> >> The ROCKCHIP_VOP option is "default y". Do you really want "default n"
> >> for the VOP2?
> > 
> > ROCKCHIP_VOP is only default y to keep the VOP driver enabled for
> > existing defconfig that were generated before the introduction of
> > that symbol.
> > We don't have this problem for VOP2, so no need to make it default y.
> 
> To me it will be more consistent of you'll have both defaulting to y,
> since both options are behind DRM_ROCKCHIP.

New drivers should not be enabled by default, at least that's what I
have been told before. The VOP driver is enabled by default for the
reasons explained. But yes, you are right, it's more consistent to have
the same default on both drivers. Personally I don't care much, for now
I just follow what Heiko suggests as he is the one who hopefully merges
these patches ;)

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
