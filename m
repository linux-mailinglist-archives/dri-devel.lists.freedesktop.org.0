Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA727A93AD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2544610E5B2;
	Thu, 21 Sep 2023 10:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AE310E5B2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 10:49:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 34482CE21BB;
 Thu, 21 Sep 2023 10:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207B3C4AF6D;
 Thu, 21 Sep 2023 10:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695293338;
 bh=VvzgHnXFUKAFfWDj0HBWMNICC2Um0tqDEaQcZ86bdF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jCu/eYMVS3GAgRdBl9idW/+itiiupWqQ0i9/LuUb6DY+RRHRwsKYHpOUdIZMidU4a
 T5s4kdCeSq+28/drKf81DIy6K02Dyiwk5MZwgPQIBlQ0UKm1Jrexwa86JZnoNqMgqm
 L/qK7y9jls4G4H8mjiIp7vJeV9FIajkWAKiyhrAXjpNR7qzYM3RfkGLOuOrLcVvLew
 0QJ4gCXE1soV8Ko4+QMSYr1WL0MOuiwO49nqMuwvkf09rxMEKuCQauchrlpyz2zbwH
 O5hGelwCCK0k2SpHkw2Cv3V8P76fTxgxa9IcrtbBXQhQ576PZl96gBG9IMdWmT+3A8
 mq6sjN7NwEsgg==
Date: Thu, 21 Sep 2023 12:48:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: MAINTAINERS: Update drm-misc entry to match all drivers
Message-ID: <igq3k7a2bepsm6b3mke53hdb7y32im272ntulqjgn3w5jei3ls@idhmdqkzmrko>
References: <20230919131235.759959-1-mripard@kernel.org>
 <afc3da23-81ce-edcf-6ea6-8fd8711e17b0@loongson.cn>
 <enobmyvbv5rw5uvdlcznttqxnh4d5674agh4x6aqcbrlcxvryg@vbzdomlyleyx>
 <728823a8-8892-e6e6-e004-427cfe23b233@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ckq25oa6w4yvcit5"
Content-Disposition: inline
In-Reply-To: <728823a8-8892-e6e6-e004-427cfe23b233@loongson.cn>
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


--ckq25oa6w4yvcit5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 05:09:07PM +0800, Sui Jingfeng wrote:
> On 2023/9/21 16:47, Maxime Ripard wrote:
> > Adding Paul in Cc
> >=20
> > On Thu, Sep 21, 2023 at 04:25:50PM +0800, suijingfeng wrote:
> > > On 2023/9/19 21:12, Maxime Ripard wrote:
> > > > We've had a number of times when a patch slipped through and we cou=
ldn't
> > > > pick them up either because our MAINTAINERS entry only covers the
> > > > framework and thus we weren't Cc'd.
> > > >=20
> > > > Let's take another approach where we match everything, and remove a=
ll
> > > > the drivers that are not maintained through drm-misc.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > > > ---
> > > >    MAINTAINERS | 23 ++++++++++++++++++++---
> > > >    1 file changed, 20 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 90f13281d297..757d4f33e158 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -6860,12 +6860,29 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
> > > >    S:	Maintained
> > > >    W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-mi=
sc.html
> > > >    T:	git git://anongit.freedesktop.org/drm/drm-misc
> > > > +F:	Documentation/devicetree/bindings/display/
> > > > +F:	Documentation/devicetree/bindings/gpu/
> > > >    F:	Documentation/gpu/
> > > > -F:	drivers/gpu/drm/*
> > > > +F:	drivers/gpu/drm/
> > > >    F:	drivers/gpu/vga/
> > > > -F:	include/drm/drm*
> > > > +F:	include/drm/drm
> > > >    F:	include/linux/vga*
> > > > -F:	include/uapi/drm/drm*
> > > > +F:	include/uapi/drm/
> > > > +X:	drivers/gpu/drm/amd/
> > > > +X:	drivers/gpu/drm/armada/
> > > > +X:	drivers/gpu/drm/etnaviv/
> > > > +X:	drivers/gpu/drm/exynos/
> > > > +X:	drivers/gpu/drm/gma500/
> > > > +X:	drivers/gpu/drm/i915/
> > > > +X:	drivers/gpu/drm/imx/
> > > > +X:	drivers/gpu/drm/ingenic/
> > > > +X:	drivers/gpu/drm/kmb/
> > > > +X:	drivers/gpu/drm/mediatek/
> > > > +X:	drivers/gpu/drm/msm/
> > > > +X:	drivers/gpu/drm/nouveau/
> > > > +X:	drivers/gpu/drm/radeon/
> > > > +X:	drivers/gpu/drm/renesas/
> > > > +X:	drivers/gpu/drm/tegra/
> > > >    DRM DRIVERS FOR ALLWINNER A10
> > > >    M:	Maxime Ripard <mripard@kernel.org>
> > >=20
> > > Nice patch!
> > >=20
> > > Well, I'm just curious about why the drm/ingenic and drm/gma500 are n=
ot maintained through drm-misc?
> > >=20
> > > As far as I know:
> > > 1) the drm/ingenic driver don't have a "T" annotation (location of th=
e link).
> > Yeah, I wasn't sure about that one indeed. I remained conservative sinc=
e it's a
> > sensitive topic for some.
> >=20
> > Paul, is drm/ingenic supposed to be maintained through drm-misc? Either=
 way,
> > could you clarify which git tree is supposed to merge those patches in
> > MAINTAINERS?
> >=20
> > > 2) the "T" of drm/gma500 is "git git://github.com/patjak/drm-gma500",=
 but the
> >    code for this link is not up to date.
> >=20
> > For gma500, I think it's mostly historical since it was there before dr=
m-misc
> > was a thing.
> >=20
> > > I think at least the drm/ingenic and drm/gma500 drivers are *actually*
> > > maintained through drm-misc, So perhaps, these two drivers should not=
 be
> > > excluded. Am I correct?
> > It's likely :)
> >=20
> > Either way, I think it can be solved/clarified later on
>=20
>=20
> OK, that's sound fairly enough. I will respect you and Paul's opinion.
> By the way, I also want to say that I think the drm/imb and various drm/i=
mx drivers
> are also belong to the drm-misc. They are also lack the "T" annotation.
> Hopes someone can help to check that. Thanks.
> Thanks for the patch.

As far as I know, imx is kind of in-between at the moment. Some patches
are going through drm-misc, but others are coming through their tree.
For kmb (if that's what you meant), then I would expect intel to do the
maintenance like they do for i915.

But given this discussion it could be a good idea to add all the
maintainers of those excluded drivers in Cc in the next revision.

Maxime

--ckq25oa6w4yvcit5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQwflwAKCRDj7w1vZxhR
xeVSAQC7Dd9EcpfoQlgRmtwSt/AC/lA1k6RMDlXHNq0INXIkbwD+N5bLA1m/hQuW
R+4Dbc5ImJtrzWi2+g9pw9JPK8AXWgE=
=uu21
-----END PGP SIGNATURE-----

--ckq25oa6w4yvcit5--
