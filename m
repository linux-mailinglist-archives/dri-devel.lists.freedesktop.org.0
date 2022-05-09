Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8BE51F946
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 12:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BA910E782;
	Mon,  9 May 2022 10:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3089710E782
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 10:05:06 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1no0GE-0005IK-KZ; Mon, 09 May 2022 12:05:02 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v12 0/3] drm/rockchip: RK356x VOP2 support last fixups
Date: Mon, 09 May 2022 12:05:01 +0200
Message-ID: <2101133.irdbgypaU6@diego>
In-Reply-To: <20220509095559.GC4012@pengutronix.de>
References: <20220509083738.1246866-1-s.hauer@pengutronix.de>
 <5819111.lOV4Wx5bFT@diego> <20220509095559.GC4012@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Am Montag, 9. Mai 2022, 11:55:59 CEST schrieb Sascha Hauer:
> On Mon, May 09, 2022 at 10:44:17AM +0200, Heiko St=FCbner wrote:
> > Hi Sascha,
> >=20
> > Am Montag, 9. Mai 2022, 10:37:35 CEST schrieb Sascha Hauer:
> > > This is not the full series, if you want that, look for v11.
> > >=20
> > > This series merely has a last-minute change: The VOP2 driver used
> > > platform_get_resource_byname() to get its registers, but the reg-names
> > > property hasn't been documented in the binding. This series adds the
> > > missing documentation and along the way renames the generic "regs"
> > > name to "vop" and "gamma_lut" to "gamma-lut".
> >=20
> > we need a fixup-series though. Both the original binding + vop2 driver
> > already made it into drm-misc [0]. As this is a shared tree, this can't=
 be
> > changed anymore ;-) .
> >=20
> > (Just ignore that the vop2-header moved to the driver-patch, I'll
> > fix that up when applying to not cause conflicts)
>=20
> Ok, I just sent the series as a fixup series. After I've hit the send
> button I am not quite sure if that's what you want, you probably want
> the patches with proper patch description rather than just --fixup
> patches :(

from the sound of it that was probably the wrong approach :-)
I.e. drm-misc is a shared tree (with a plethora of people),
so there is always only a way forward, so fixing things is always
adding new things on top - like Dan's error handling as well as
the spelling and coci patches I applied yesterday.

So yes, we need proper patches on top of the drm-misc-next
branch for the VOP2 + binding changes.


Heiko


> >=20
> >=20
> > Heiko
> >=20
> > [0] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D604be85547ce=
4d61b89292d2f9a78c721b778c16
> >     https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D74015e2650ba=
d641a02100cdf0ac23a96c1a2553
> >=20
> >=20
> > > Andy Yan (1):
> > >   drm: rockchip: Add VOP2 driver
> > >=20
> > > Sascha Hauer (2):
> > >   arm64: dts: rockchip: rk356x: Add VOP2 nodes
> > >   dt-bindings: display: rockchip: Add binding for VOP2
> > >=20
> > >  .../display/rockchip/rockchip-vop2.yaml       |  146 +
> > >  arch/arm64/boot/dts/rockchip/rk3566.dtsi      |    4 +
> > >  arch/arm64/boot/dts/rockchip/rk3568.dtsi      |    4 +
> > >  arch/arm64/boot/dts/rockchip/rk356x.dtsi      |   51 +
> > >  drivers/gpu/drm/rockchip/Kconfig              |    6 +
> > >  drivers/gpu/drm/rockchip/Makefile             |    1 +
> > >  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    1 +
> > >  drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    6 +-
> > >  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |    2 +
> > >  drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |   15 +
> > >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 2706 +++++++++++++++=
++
> > >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  477 +++
> > >  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  |  281 ++
> > >  include/dt-bindings/soc/rockchip,vop2.h       |   14 +
> > >  14 files changed, 3713 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/rockchi=
p/rockchip-vop2.yaml
> > >  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > >  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > >  create mode 100644 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> > >  create mode 100644 include/dt-bindings/soc/rockchip,vop2.h
> > >=20
> > >=20
> >=20
> >=20
> >=20
> >=20
> >=20
>=20
>=20




