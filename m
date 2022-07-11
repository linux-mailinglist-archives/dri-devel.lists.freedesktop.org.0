Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3AE5700E6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459998DC5A;
	Mon, 11 Jul 2022 11:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBFB8DC59
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:42:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E1955C013B;
 Mon, 11 Jul 2022 07:42:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 07:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657539730; x=1657626130; bh=65xJGGrqgx
 njVVpdic5sDfiZGfil8T9lrpxrDrPHf8g=; b=HH/oTqjkcgrCHZYQXcX34oNi2K
 v2nwKLFL6z8ieVJvkDHC2/65uCw4GqEi7rfDiBQ3+va/U9slT9f18Y9zKOXK9X4k
 9ilYU46tQruBfK6Xa8pn+UjeoQcKPU2/g+30tOimqCTZJcSBxvKnGA1bFLSmBw6L
 TTvBjWDvx6ACJuzhc/sU6BRTVbi/vQcTb0mrgzv1xEP5sxZ+xByigzyuXEOgv/2q
 98qc7V1d8rglqZkngnrnkqzkLPqhADyQo8qYPojZGFwpUg5eue2yZ7H//bReDeJF
 KerxiCkE1e3uUMCRN0RkLEuGrpXZD7q85BBVCg/rWUsqogj40QxrWGO7vrkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657539730; x=1657626130; bh=65xJGGrqgxnjVVpdic5sDfiZGfil
 8T9lrpxrDrPHf8g=; b=SM3pwVw/xvpwPzEDiqdckW7A4Y+apqrkRj2qxW2dHpSr
 W32C+6Yr2aW6lEClvZgzLSa1dl9T5s9zuMPQTe4YLAJx/vBroR3Cyh+KgyouUSr9
 u/2ZxyXhLxXPQg1nw1tlfcZ3FIQQ3kdQgA12znOPg1+JntdJnKEKz5dgWDwAFnvN
 qxS5A9piswC9OdTwScnXKKTQRXAHPTV9gsx0CWiCsu3nKrLBXPirWAMq9chKxJKj
 hg3ekMROL5/X0H2YoMHV7IduIkpNI8KV+sCvL0T3fUgxNJvvG+EEgDHk44/c3/TN
 tprAeyYSU6CSa+R8OpFx1gcstGWKeR8F9rzQnvZOoA==
X-ME-Sender: <xms:kQzMYv6aGsTlyGCWJj2O8_3HBbowEcshnFvorQPQMXV1g3wE_HGc5A>
 <xme:kQzMYk5OstTLK1E3FOtat7kPi8KBy7NhDj2vRdj5pbZxFRQTmXRGHlUL6kFLXIW2N
 gwGgaV2XmP1motf3ow>
X-ME-Received: <xmr:kQzMYmfDjY1o2XAncdq2l8XzWaTHY9aRFocnAQmF76LGF-pGByeWRxy-5eL45gp1k2LOBEVLwJCJTyqqSSonyaKQrpdeLdKaZ9AaUc8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgkeevueetgffhueeujefhgeejiefgiedtveefgfdugefhteejgedufedv
 geeukeenucffohhmrghinhepsghoohhtlhhinhdrtghomhdpfihikhhiphgvughirgdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kQzMYgIpwlyetzGyREVDazqmlrNxuxwjsUwYDYiCSpoMUYI5JiyNrA>
 <xmx:kQzMYjIGn7UY-kdG9RPUgDecNKS9Q7x8WOGXiSR47xexBommMXEiig>
 <xmx:kQzMYpwrRcfOhPv-CTR3BPIAulKFPs98dXVR_JaA-0cffCl8IX0X6A>
 <xmx:kgzMYq9T4G60-J4BnJWcyTtUCNNfVlt7Nhz10dG_BXN6yCUelZWuaA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 07:42:09 -0400 (EDT)
Date: Mon, 11 Jul 2022 13:42:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named modes
Message-ID: <20220711114206.sawqdl54ibuxsxp4@houat>
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
 <20220711093513.wilv6e6aqcuyg52w@houat>
 <43d75dce-988a-0a95-cb0a-0d0a7c81ca63@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ochmvmz2mndf2rso"
Content-Disposition: inline
In-Reply-To: <43d75dce-988a-0a95-cb0a-0d0a7c81ca63@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ochmvmz2mndf2rso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2022 at 01:11:14PM +0200, Thomas Zimmermann wrote:
> Hi Maxime
>=20
> Am 11.07.22 um 11:35 schrieb Maxime Ripard:
> > Hi Thomas,
> >=20
> > On Mon, Jul 11, 2022 at 11:03:38AM +0200, Thomas Zimmermann wrote:
> > > Am 08.07.22 um 20:21 schrieb Geert Uytterhoeven:
> > > > The mode parsing code recognizes named modes only if they are expli=
citly
> > > > listed in the internal whitelist, which is currently limited to "NT=
SC"
> > > > and "PAL".
> > > >=20
> > > > Provide a mechanism for drivers to override this list to support cu=
stom
> > > > mode names.
> > > >=20
> > > > Ideally, this list should just come from the driver's actual list of
> > > > modes, but connector->probed_modes is not yet populated at the time=
 of
> > > > parsing.
> > >=20
> > > I've looked for code that uses these names, couldn't find any. How is=
 this
> > > being used in practice? For example, if I say "PAL" on the command li=
ne, is
> > > there DRM code that fills in the PAL mode parameters?
> >=20
> > We have some code to deal with this in sun4i:
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/su=
n4i_tv.c#L292
> >=20
> > It's a bit off topic, but for TV standards, I'm still not sure what the
> > best course of action is. There's several interactions that make this a
> > bit troublesome:
> >=20
> >    * Some TV standards differ by their mode (ie, PAL vs NSTC), but some
> >      other differ by parameters that are not part of drm_display_mode
> >      (NTSC vs NSTC-J where the only difference is the black and blanking
> >      signal levels for example).
> >=20
> >    * The mode names allow to provide a fairly convenient way to add that
> >      extra information, but the userspace is free to create its own mode
> >      and might omit the mode name entirely.
> >=20
> > So in the code above, if the name has been preserved we match by name,
> > but we fall back to matching by mode if it hasn't been, which in this
> > case means that we have no way to differentiate between NTSC, NTSC-J,
> > PAL-M in this case.
> >=20
> > We have some patches downstream for the RaspberryPi that has the TV
> > standard as a property. There's a few extra logic required for the
> > userspace (like setting the PAL property, with the NTSC mode) so I'm not
> > sure it's preferable.
> >=20
> > Or we could do something like a property to try that standard, and
> > another that reports the one we actually chose.
> >=20
> > > And another question I have is whether this whitelist belongs into the
> > > driver at all. Standard modes exist independent from drivers or hardw=
are.
> > > Shouldn't there simply be a global list of all possible mode names? D=
rivers
> > > would filter out the unsupported modes anyway.
> >=20
> > We should totally do something like that, yeah
>=20
> That sun code already looks like sometihng the DRM core/helpers should be
> doing. And if we want to support named modes well, there's a long list of
> modes in Wikipedia.
>
> https://en.wikipedia.org/wiki/Video_Graphics_Array#/media/File:Vector_Vid=
eo_Standards2.svg

Yeah, and NTSC is missing :)

Thinking about this some more, I'm not sure how we would do that. Like I
said, we would need some extra parameters to drm_display_mode (like
blanking levels) that the core would need to pass to the driver.

If we go through the property route, I think the core could just look at
the name, with the new mode and state, and the driver should deal with
it. I'm not sure we can do more than that.

Maxime

--ochmvmz2mndf2rso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYswMjgAKCRDj7w1vZxhR
xVEnAP9X1YCEDZqn7PwDG4wC6RHwW3pwln90ztgI5n66WY0ckgEA3+Owyei3UCjf
z4cZW6l3/ZzQj6xt4UxCXTf9Cd2AVAo=
=2IFI
-----END PGP SIGNATURE-----

--ochmvmz2mndf2rso--
