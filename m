Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52C951F873
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 11:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A75510E7F6;
	Mon,  9 May 2022 09:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EB510E8A0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 09:56:02 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1no07U-0002C4-DF; Mon, 09 May 2022 11:56:00 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1no07T-00082L-QN; Mon, 09 May 2022 11:55:59 +0200
Date: Mon, 9 May 2022 11:55:59 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Heiko =?iso-8859-15?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v12 0/3] drm/rockchip: RK356x VOP2 support last fixups
Message-ID: <20220509095559.GC4012@pengutronix.de>
References: <20220509083738.1246866-1-s.hauer@pengutronix.de>
 <5819111.lOV4Wx5bFT@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5819111.lOV4Wx5bFT@diego>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:54:31 up 39 days, 22:24, 93 users,  load average: 0.10, 0.08, 0.12
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 09, 2022 at 10:44:17AM +0200, Heiko Stübner wrote:
> Hi Sascha,
> 
> Am Montag, 9. Mai 2022, 10:37:35 CEST schrieb Sascha Hauer:
> > This is not the full series, if you want that, look for v11.
> > 
> > This series merely has a last-minute change: The VOP2 driver used
> > platform_get_resource_byname() to get its registers, but the reg-names
> > property hasn't been documented in the binding. This series adds the
> > missing documentation and along the way renames the generic "regs"
> > name to "vop" and "gamma_lut" to "gamma-lut".
> 
> we need a fixup-series though. Both the original binding + vop2 driver
> already made it into drm-misc [0]. As this is a shared tree, this can't be
> changed anymore ;-) .
> 
> (Just ignore that the vop2-header moved to the driver-patch, I'll
> fix that up when applying to not cause conflicts)

Ok, I just sent the series as a fixup series. After I've hit the send
button I am not quite sure if that's what you want, you probably want
the patches with proper patch description rather than just --fixup
patches :(

Sascha

> 
> 
> Heiko
> 
> [0] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=604be85547ce4d61b89292d2f9a78c721b778c16
>     https://cgit.freedesktop.org/drm/drm-misc/commit/?id=74015e2650bad641a02100cdf0ac23a96c1a2553
> 
> 
> > Andy Yan (1):
> >   drm: rockchip: Add VOP2 driver
> > 
> > Sascha Hauer (2):
> >   arm64: dts: rockchip: rk356x: Add VOP2 nodes
> >   dt-bindings: display: rockchip: Add binding for VOP2
> > 
> >  .../display/rockchip/rockchip-vop2.yaml       |  146 +
> >  arch/arm64/boot/dts/rockchip/rk3566.dtsi      |    4 +
> >  arch/arm64/boot/dts/rockchip/rk3568.dtsi      |    4 +
> >  arch/arm64/boot/dts/rockchip/rk356x.dtsi      |   51 +
> >  drivers/gpu/drm/rockchip/Kconfig              |    6 +
> >  drivers/gpu/drm/rockchip/Makefile             |    1 +
> >  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    1 +
> >  drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    6 +-
> >  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |    2 +
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |   15 +
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 2706 +++++++++++++++++
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  477 +++
> >  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  |  281 ++
> >  include/dt-bindings/soc/rockchip,vop2.h       |   14 +
> >  14 files changed, 3713 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> >  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> >  create mode 100644 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> >  create mode 100644 include/dt-bindings/soc/rockchip,vop2.h
> > 
> > 
> 
> 
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
