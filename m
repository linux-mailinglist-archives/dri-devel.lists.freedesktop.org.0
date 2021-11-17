Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6644549B6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 16:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DE76E8E1;
	Wed, 17 Nov 2021 15:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7D86E8E1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 15:16:27 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mnMfh-0004un-MX; Wed, 17 Nov 2021 16:16:25 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 11/12] drm/rockchip: Make VOP driver optional
Date: Wed, 17 Nov 2021 16:16:24 +0100
Message-ID: <2763206.1bNW4tK36S@diego>
In-Reply-To: <20211117145054.GL6556@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <15744316.EhFUcUTHNY@diego> <20211117145054.GL6556@pengutronix.de>
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
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 17. November 2021, 15:50:54 CET schrieb Sascha Hauer:
> On Wed, Nov 17, 2021 at 03:40:26PM +0100, Heiko St=FCbner wrote:
> > Am Mittwoch, 17. November 2021, 15:33:46 CET schrieb Sascha Hauer:
> > > With upcoming VOP2 support VOP won't be the only choice anymore, so m=
ake
> > > the VOP driver optional.
> > >=20
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > ---
> > >  arch/arm/configs/multi_v7_defconfig         | 1 +
> > >  arch/arm64/configs/defconfig                | 1 +
> > >  drivers/gpu/drm/rockchip/Kconfig            | 7 +++++++
> > >  drivers/gpu/drm/rockchip/Makefile           | 3 ++-
> > >  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
> > >  5 files changed, 12 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/m=
ulti_v7_defconfig
> > > index c951aeed2138c..fc123e8f3e2f9 100644
> > > --- a/arch/arm/configs/multi_v7_defconfig
> > > +++ b/arch/arm/configs/multi_v7_defconfig
> > > @@ -667,6 +667,7 @@ CONFIG_DRM_EXYNOS_DPI=3Dy
> > >  CONFIG_DRM_EXYNOS_DSI=3Dy
> > >  CONFIG_DRM_EXYNOS_HDMI=3Dy
> > >  CONFIG_DRM_ROCKCHIP=3Dm
> > > +CONFIG_ROCKCHIP_VOP=3Dy
> > >  CONFIG_ROCKCHIP_ANALOGIX_DP=3Dy
> > >  CONFIG_ROCKCHIP_DW_HDMI=3Dy
> > >  CONFIG_ROCKCHIP_DW_MIPI_DSI=3Dy
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defcon=
fig
> > > index f2e2b9bdd7024..a623386473dc9 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -682,6 +682,7 @@ CONFIG_DRM_EXYNOS_DSI=3Dy
> > >  CONFIG_DRM_EXYNOS_HDMI=3Dy
> > >  CONFIG_DRM_EXYNOS_MIC=3Dy
> > >  CONFIG_DRM_ROCKCHIP=3Dm
> > > +CONFIG_ROCKCHIP_VOP=3Dy
> > >  CONFIG_ROCKCHIP_ANALOGIX_DP=3Dy
> > >  CONFIG_ROCKCHIP_CDN_DP=3Dy
> > >  CONFIG_ROCKCHIP_DW_HDMI=3Dy
> > > diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockc=
hip/Kconfig
> > > index 9f1ecefc39332..a1c4158259099 100644
> > > --- a/drivers/gpu/drm/rockchip/Kconfig
> > > +++ b/drivers/gpu/drm/rockchip/Kconfig
> > > @@ -21,8 +21,15 @@ config DRM_ROCKCHIP
> > > =20
> > >  if DRM_ROCKCHIP
> > > =20
> > > +config ROCKCHIP_VOP
> > > +	bool "Rockchip VOP driver"
> >=20
> > would this benefit from a default-y ?
> > For builds reusing preexisting .configs.
>=20
> I enabled CONFIG_ROCKCHIP_VOP for all configs in the tree that enable
> CONFIG_DRM_ROCKCHIP, so defconfig users shouldn't see any surprises.
> That won't help users of custom configs of course.
>=20
> I don't know what's preferred in such cases, I can change to default-y
> if you like.

default-y would keep the behaviour identical for all existing configs I
guess and right now vop(1) is still the most used variant and will stay
that way for a while longer, so I guess my preference would be for going
that route - also so that we don't drown in "my display stopped working"
during 5.17 ;-)


Heiko


