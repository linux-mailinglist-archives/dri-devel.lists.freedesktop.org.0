Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6CA7A92CA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB3010E0D2;
	Thu, 21 Sep 2023 08:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9049010E0D2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:48:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 96D60CE1D4D;
 Thu, 21 Sep 2023 08:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F018C116D3;
 Thu, 21 Sep 2023 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695286080;
 bh=KmendGjAj9mcIv/qAR8I0o69GyeYEy8iA0laqXgqu4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z2qrGfYTUxHKu3NNGQvn6GS3KvYbUGdIPMz7Zq+zbhGL/71IWQhpmvSNwmci85IP9
 3uEkHnylqAOWmS26Exf148JI89ZWtIJvRBFvHbmIE6M/HoZ1glHQ8aDwnh5H/4UVWY
 ZQi8YKnLZJINnV3FqE4uzgxmlaQKGTFT5Qbp2pAoWWieBA5bKBwZJJZNKagOE27+Jw
 siJ1FVbkQLWJQtY5Qsa3VxwjRcY0fQ8wf3THhEZrCTNn68FAT0ZBTida10L2Dxoxqe
 s7k8ll8+LaeJbTUfmGYI0Zo61Rnzt1fFGjZHSjd1Bq228ZTxEfH6HQ8fW9p6rGY1g3
 liEoGmJx9PQJA==
Date: Thu, 21 Sep 2023 10:47:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: MAINTAINERS: Update drm-misc entry to match all drivers
Message-ID: <enobmyvbv5rw5uvdlcznttqxnh4d5674agh4x6aqcbrlcxvryg@vbzdomlyleyx>
References: <20230919131235.759959-1-mripard@kernel.org>
 <afc3da23-81ce-edcf-6ea6-8fd8711e17b0@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nfekatucbu5p3sge"
Content-Disposition: inline
In-Reply-To: <afc3da23-81ce-edcf-6ea6-8fd8711e17b0@loongson.cn>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nfekatucbu5p3sge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Adding Paul in Cc

On Thu, Sep 21, 2023 at 04:25:50PM +0800, suijingfeng wrote:
> On 2023/9/19 21:12, Maxime Ripard wrote:
> > We've had a number of times when a patch slipped through and we couldn't
> > pick them up either because our MAINTAINERS entry only covers the
> > framework and thus we weren't Cc'd.
> >=20
> > Let's take another approach where we match everything, and remove all
> > the drivers that are not maintained through drm-misc.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >   MAINTAINERS | 23 ++++++++++++++++++++---
> >   1 file changed, 20 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 90f13281d297..757d4f33e158 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6860,12 +6860,29 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
> >   S:	Maintained
> >   W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.ht=
ml
> >   T:	git git://anongit.freedesktop.org/drm/drm-misc
> > +F:	Documentation/devicetree/bindings/display/
> > +F:	Documentation/devicetree/bindings/gpu/
> >   F:	Documentation/gpu/
> > -F:	drivers/gpu/drm/*
> > +F:	drivers/gpu/drm/
> >   F:	drivers/gpu/vga/
> > -F:	include/drm/drm*
> > +F:	include/drm/drm
> >   F:	include/linux/vga*
> > -F:	include/uapi/drm/drm*
> > +F:	include/uapi/drm/
> > +X:	drivers/gpu/drm/amd/
> > +X:	drivers/gpu/drm/armada/
> > +X:	drivers/gpu/drm/etnaviv/
> > +X:	drivers/gpu/drm/exynos/
> > +X:	drivers/gpu/drm/gma500/
> > +X:	drivers/gpu/drm/i915/
> > +X:	drivers/gpu/drm/imx/
> > +X:	drivers/gpu/drm/ingenic/
> > +X:	drivers/gpu/drm/kmb/
> > +X:	drivers/gpu/drm/mediatek/
> > +X:	drivers/gpu/drm/msm/
> > +X:	drivers/gpu/drm/nouveau/
> > +X:	drivers/gpu/drm/radeon/
> > +X:	drivers/gpu/drm/renesas/
> > +X:	drivers/gpu/drm/tegra/
> >   DRM DRIVERS FOR ALLWINNER A10
> >   M:	Maxime Ripard <mripard@kernel.org>
>=20
>=20
> Nice patch!
>=20
> Well, I'm just curious about why the drm/ingenic and drm/gma500 are not m=
aintained through drm-misc?
>=20
> As far as I know:
> 1) the drm/ingenic driver don't have a "T" annotation (location of the li=
nk).

Yeah, I wasn't sure about that one indeed. I remained conservative since it=
's a
sensitive topic for some.

Paul, is drm/ingenic supposed to be maintained through drm-misc? Either way,
could you clarify which git tree is supposed to merge those patches in
MAINTAINERS?

> 2) the "T" of drm/gma500 is "git git://github.com/patjak/drm-gma500", but=
 the
  code for this link is not up to date.

For gma500, I think it's mostly historical since it was there before drm-mi=
sc
was a thing.

> I think at least the drm/ingenic and drm/gma500 drivers are *actually*
> maintained through drm-misc, So perhaps, these two drivers should not be
> excluded. Am I correct?

It's likely :)

Either way, I think it can be solved/clarified later on

Maxime

--nfekatucbu5p3sge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQwDPgAKCRDj7w1vZxhR
xdCIAQCnStvwrzY8522+bj04SgY30MKu9eI5/IH98To/cEJTfAEAnY4a0h5B+v6u
1X9x2tE812i05cb1Z+D0rRJhBs7HAwA=
=/4I4
-----END PGP SIGNATURE-----

--nfekatucbu5p3sge--
