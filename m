Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3FC7A938B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EE810E595;
	Thu, 21 Sep 2023 10:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3AA10E595
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 10:20:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A3E7B81FB8;
 Thu, 21 Sep 2023 10:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E76C32791;
 Thu, 21 Sep 2023 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695291619;
 bh=+lkLNwZh6Sa3aJaq6v5Pm/+dg5ITqN/E+YoWrbKIpOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rZGECicZCX80Vef5lILMBVuqWvQ/5yR+Gb7qMqhpp1/kMG0Wb4w8ZaVzpsizA0pYK
 wOuRMBbhBB4+znDiOrd67Hbl6Yvj/WGc8ww1zZ3DkxF7mihVpGTrSVg3nQV5sYE3iZ
 VM+NTlTwg3fNNeu/vUbqALBBVWBpe1zrYstdNnJIZBrA1TZT02CMkqX97OKFiUnzv4
 vpS6ATaW1Ao+iIYGsVmLa53S8OaWexy+wYIBPq6H+j0cRFEQuG+rw3zwtw5lojtUhU
 AwRoxNFgRAmJgM37meBbwHuaQ1lJiigSEdOENOkwpeTTJVoTMnPEyR4C0pjfUu1xU7
 9JEfYY/dsm4oA==
Date: Thu, 21 Sep 2023 12:20:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: MAINTAINERS: Update drm-misc entry to match all drivers
Message-ID: <rwzcazgezu66qgzjmyalajrch4zyoc76goewulkyhsslfdpbi6@dyq4gd3v27hk>
References: <20230919131235.759959-1-mripard@kernel.org>
 <afc3da23-81ce-edcf-6ea6-8fd8711e17b0@loongson.cn>
 <enobmyvbv5rw5uvdlcznttqxnh4d5674agh4x6aqcbrlcxvryg@vbzdomlyleyx>
 <c07432575d33184eef2461f1c22510e9a8ab770f.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bcgvai7bojfasnws"
Content-Disposition: inline
In-Reply-To: <c07432575d33184eef2461f1c22510e9a8ab770f.camel@crapouillou.net>
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
Cc: suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bcgvai7bojfasnws
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Thu, Sep 21, 2023 at 10:57:46AM +0200, Paul Cercueil wrote:
> Le jeudi 21 septembre 2023 =E0 10:47 +0200, Maxime Ripard a =E9crit=A0:
> > On Thu, Sep 21, 2023 at 04:25:50PM +0800, suijingfeng wrote:
> > > On 2023/9/19 21:12, Maxime Ripard wrote:
> > > > We've had a number of times when a patch slipped through and we
> > > > couldn't
> > > > pick them up either because our MAINTAINERS entry only covers the
> > > > framework and thus we weren't Cc'd.
> > > >=20
> > > > Let's take another approach where we match everything, and remove
> > > > all
> > > > the drivers that are not maintained through drm-misc.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > > > ---
> > > > =A0 MAINTAINERS | 23 ++++++++++++++++++++---
> > > > =A0 1 file changed, 20 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 90f13281d297..757d4f33e158 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -6860,12 +6860,29 @@ M:=A0=A0=A0=A0=A0=A0Thomas Zimmermann
> > > > <tzimmermann@suse.de>
> > > > =A0 S:=A0=A0=A0=A0Maintained
> > > > =A0
> > > > W:=A0=A0=A0=A0https://01.org/linuxgraphics/gfx-docs/maintainer-tool=
s/drm-
> > > > misc.html
> > > > =A0 T:=A0=A0=A0=A0git git://anongit.freedesktop.org/drm/drm-misc
> > > > +F:=A0=A0=A0=A0=A0Documentation/devicetree/bindings/display/
> > > > +F:=A0=A0=A0=A0=A0Documentation/devicetree/bindings/gpu/
> > > > =A0 F:=A0=A0=A0=A0Documentation/gpu/
> > > > -F:=A0=A0=A0=A0=A0drivers/gpu/drm/*
> > > > +F:=A0=A0=A0=A0=A0drivers/gpu/drm/
> > > > =A0 F:=A0=A0=A0=A0drivers/gpu/vga/
> > > > -F:=A0=A0=A0=A0=A0include/drm/drm*
> > > > +F:=A0=A0=A0=A0=A0include/drm/drm
> > > > =A0 F:=A0=A0=A0=A0include/linux/vga*
> > > > -F:=A0=A0=A0=A0=A0include/uapi/drm/drm*
> > > > +F:=A0=A0=A0=A0=A0include/uapi/drm/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/amd/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/armada/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/etnaviv/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/exynos/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/gma500/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/i915/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/imx/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/ingenic/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/kmb/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/mediatek/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/msm/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/nouveau/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/radeon/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/renesas/
> > > > +X:=A0=A0=A0=A0=A0drivers/gpu/drm/tegra/
> > > > =A0 DRM DRIVERS FOR ALLWINNER A10
> > > > =A0 M:=A0=A0=A0=A0Maxime Ripard <mripard@kernel.org>
> > >=20
> > >=20
> > > Nice patch!
> > >=20
> > > Well, I'm just curious about why the drm/ingenic and drm/gma500 are
> > > not maintained through drm-misc?
> > >=20
> > > As far as I know:
> > > 1) the drm/ingenic driver don't have a "T" annotation (location of
> > > the link).
> >=20
> > Yeah, I wasn't sure about that one indeed. I remained conservative
> > since it's a
> > sensitive topic for some.
> >=20
> > Paul, is drm/ingenic supposed to be maintained through drm-misc?
> > Either way,
> > could you clarify which git tree is supposed to merge those patches
> > in
> > MAINTAINERS?
>=20
> drm/ingenic is maintained through drm-misc, yes.
>=20
> Looking at the MAINTAINERS file, it seems to be one of the only DRM
> drivers without its own entry. I'll add one then.

Ack, thanks!
Maxime

--bcgvai7bojfasnws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQwY4AAKCRDj7w1vZxhR
xft7AQCV+aiovvVYG49vRTa5vt/3Ds6TJwsBUEWPed6sGpeOxwD9ESmmtrZhGZzH
Y+RNWySQxvGun4KK/snx/aDoELqs0Qk=
=MVCs
-----END PGP SIGNATURE-----

--bcgvai7bojfasnws--
