Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCABC7A9285
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D662710E0C6;
	Thu, 21 Sep 2023 08:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63AD10E0C6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:12:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DCDCECE1689;
 Thu, 21 Sep 2023 08:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF65BC116B4;
 Thu, 21 Sep 2023 08:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695283948;
 bh=KlK68PiRYmNjDZ522KXFD15kcxu9BDel8MdfKGOwXpE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q5ielep+830ry6o1O39pwOmhlA5Dd3vzUZcRQoBZJURr/+cc5DnJGolJiIRGB3lTJ
 iWNjjS21c6r62YsrVzhW0MSOAQ6USouYky4eccKL6sMLbjkBTrt+m+3jyvSN1Zafbi
 BOAcYc4p0z80XbHapFdPWD35auDsgaTgejgzPCkRx4t3O2+pK6bywzePrw7JZUQcVm
 9GeO+E6zQV9frsiN8hyVHpuBXSjha7sFejhkqK4QbfugMrnEsRomrpEsF8RXwfmlB0
 mUHjG9RzU2vUghmNAXZ43wF+IHJDZs8kabj0yg9bfiRPBtdItnHB4tq4rtRSoLS8lv
 SAxdKepsipABg==
Date: Thu, 21 Sep 2023 10:12:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
Message-ID: <2p53aei56tlr7k6w5oawlwpmv2k7agpbb6wfwpxcg3rqyueyrx@2as7tijrgnh4>
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
 <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4d2dwrs5mcu6fwes"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4d2dwrs5mcu6fwes
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 09:57:22AM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Thu, Sep 21, 2023 at 9:44=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Mon, Sep 18, 2023 at 09:19:07AM +0200, Javier Martinez Canillas wrot=
e:
> > > Thomas Zimmermann <tzimmermann@suse.de> writes:
> > > > Am 14.09.23 um 21:51 schrieb Javier Martinez Canillas:
> > > >> The driver uses a naming convention where functions for struct drm=
_*_funcs
> > > >> callbacks are named ssd130x_$object_$operation, while the callback=
s for
> > > >> struct drm_*_helper_funcs are named ssd130x_$object_helper_$operat=
ion.
> > > >>
> > > >> The idea is that this helper_ prefix in the function names denote =
that are
> > > >> for struct drm_*_helper_funcs callbacks. This convention was copie=
d from
> > > >> other drivers, when ssd130x was written but Maxime pointed out tha=
t is the
> > > >> exception rather than the norm.
> > > >
> > > > I guess you found this in my code. I want to point out that I use t=
he
> > > > _helper infix to signal that these are callback for
> > > > drm_primary_plane_helper_funcs and *not* drm_primary_plane_funcs. T=
he
> > > > naming is intentional.
> > >
> > > Yes, that's what tried to say in the commit message and indeed I got =
the
> > > convention from drivers in drivers/gpu/drm/tiny. In fact I believe th=
ese
> > > function names are since first iteration of the driver, when was mean=
t to
> > > be a tiny driver.
> > >
> > > According to Maxime it's the exception rather than the rule and sugge=
sted
> > > to change it, I don't really have a strong opinion on either naming T=
BH.
> >
> > Maybe that's just me, but the helper in the name indeed throws me off. =
In my
> > mind, it's supposed to be used only for helpers, not functions implemen=
ting the
> > helpers hooks.
>=20
> With several callbacks using the same (field) name, it is very helpful
> to name the actual implementation by combining the struct type name
> and the field name.

I can't think of any (at least for a given object). Which one do you have in
mind?

> Anything else confuses the casual reader. Perhaps the real question is wh=
ether
> the structures should have "helper" in their name in the first place?

Those structures are meant for functions used by the helpers, they are not
helper functions.

Maxime

--4d2dwrs5mcu6fwes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQv66AAKCRDj7w1vZxhR
xaUuAP49Dk5XZHDwOEMvFpUNAd5qO3W2XesVv7Vgkx9mVzpbiAD9Fd8QBcyq7FrB
lGErmbmSM6/2LttSu9BDRi/YKeTRbws=
=fnWn
-----END PGP SIGNATURE-----

--4d2dwrs5mcu6fwes--
