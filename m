Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905D74F975D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 15:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B7A10F26D;
	Fri,  8 Apr 2022 13:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0F710F26D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 13:54:19 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 1DB1032022DC;
 Fri,  8 Apr 2022 09:54:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 08 Apr 2022 09:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=8+GWNPlu+xtHevq89dUyEvFQikVJFhZl72wH8k
 /wFqI=; b=XVBCU/18JAJw3KeTXOMYhe0DMRBrktc+jhuNaHW86/kTqa41qoYw9m
 Esx8w8G1Sj7L0ymeEK2seWPJcSKzGOfzHj0kAIOOZ/Y+ejE6zDTuWxQC+6sOyuXF
 M2FOhbBwu3UMfZuIvDHptJSUAvDhcWserDuVOwhBSL3vznXdQywmgRqRM70DJ28t
 XhdmgYAUJUabA5xKFcBffhqRL243b5AfzplOixSFIc9fNdYCHZmXD5gJRTJbVxBs
 Y0Ber6rflN+XZt5cAgU0SNe/Bxr9+s9SJrxhUtnWYxdRkyod/HNPHY2NRjFojX4i
 KOEyxEYVdOXSPoQZ1cqz2oc7QyONfhLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8+GWNPlu+xtHevq89
 dUyEvFQikVJFhZl72wH8k/wFqI=; b=Dsdq3J9TZefrOZPuCbSyxE9JCkZEEAN3V
 hGpcq3ShN1HjDV5h9XYKcWCyJ8QzGEQYZD0V26Z3KtgvYygfVGlHfgolJrtc23Ys
 5pz+U59I2yY1rFBrSU99lC8YL06Yk6ishDJwPMrwtvgzGBxyKGl4uquzeS3M5B3M
 JUSY/JXRKUrZuwm1imgx9kRtOV5yfadQwUuCOa/9y70ozlVLUw1AtHR85FkVe4JR
 V2kPvLdEb2gMxw2SUV+zHuW/yV/aBUarsa+HzcYIjzFn/Kos8h4A9h1JkrRvnaj3
 PBCpMTp40qgreQ3hVS6HBcPP8TvajDEWQKn+xt+aPCl0p/DOtc6aQ==
X-ME-Sender: <xms:hz5QYt3tV5_thf3ZYdFRm0UHeJxbAQVtt_qvvmnbI4rwgRa1b-5JTA>
 <xme:hz5QYkHx1g1OG39Kjge9IGWVzUKXxTVGgENGkyECXGhe3McnYR1Dkp8UpDvx0lyy6
 y5GD93ASEz63kBcY-g>
X-ME-Received: <xmr:hz5QYt52kb51oJNuEedM3AKYvM0muxrXp2KDKZvvuGQFw0Ozu7Elo1JjKsxiv6eX5_-JP8i1rAMwqcXMdXkEXADX_gy2BDJkW3fQYvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeduvdfhkeekhfdtgeeihfeluddtvedthfektdelfeejgfeludfhteduveej
 hefhnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:hz5QYq18RjKAOJNo1Vgdi-o6szEuSYumPNiQ1cYFzCwr8Rdox2ILlw>
 <xmx:hz5QYgFIxu2XwBbCtPnmvurz5Xv5sG-kNfM2QTWmVb3Vz1DqnoFDmw>
 <xmx:hz5QYr8q8CGRyjEqb232wXmnA5mE5yrlyZFcPq45ZU8iCNxq3Qfr0Q>
 <xmx:hz5QYubSI9qfZXwe4Mp5pwsDpUaITnD_DakBat6oumNZ3AgvVrtCNQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 09:54:14 -0400 (EDT)
Date: Fri, 8 Apr 2022 15:54:13 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/5] drm: Fix monochrome conversion for sdd130x
Message-ID: <20220408135413.2vwp4oyzdlu7iczs@houat>
References: <20220317081830.1211400-1-geert@linux-m68k.org>
 <f94c0f44-36f1-e1a9-5963-5da0bafb8c90@redhat.com>
 <YjSMWDFxTeJZZ/CB@smile.fi.intel.com>
 <20220318142145.kwq46bf6exgce6wu@houat>
 <YjSYL5oPaDuCXOJQ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fpokwbkqxdym2r3r"
Content-Disposition: inline
In-Reply-To: <YjSYL5oPaDuCXOJQ@smile.fi.intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fpokwbkqxdym2r3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 04:33:19PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 18, 2022 at 03:21:45PM +0100, Maxime Ripard wrote:
> > On Fri, Mar 18, 2022 at 03:42:48PM +0200, Andy Shevchenko wrote:
> > > On Thu, Mar 17, 2022 at 12:39:57PM +0100, Javier Martinez Canillas wr=
ote:
> > > > On 3/17/22 09:18, Geert Uytterhoeven wrote:
> > >=20
> > > > By the way, you should probably request commit access to the drm-mi=
sc tree:
> > > >=20
> > > > https://drm.pages.freedesktop.org/maintainer-tools/commit-access.ht=
ml
> > >=20
> > > Does it really work? I tried and no one replied to request.
> > > Keeping silent is a bad service. If people don't want a person
> > > to have such access it should be well communicated.
> >=20
> > I don't see any issue on Gitlab to request commit access, so I'm not
> > sure what you did exactly but it's not surprising you didn't get any
> > answer.
>=20
> https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/311

Indeed, I wasn't expecting it to be that old.

I'm not sure why it fell through the cracks, sorry for that.

That being said, the criteria for requesting drm-misc commit access are
listed here:
https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-m=
isc

And looking at your commit history so far, I'm not sure you qualifies
yet for the first criteria. All your patches to drivers/gpu/drm, while
definitely useful, only seem to be conversions to helpers and general
best practices changes, which could be classified as trivial.

Maxime

--fpokwbkqxdym2r3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlA+hQAKCRDj7w1vZxhR
xQvdAQDsOhYAmhiCB4lkgsiPHP0a5xUK6B4s8GfY8/JUQqUTwAD+IzpK4e2WvPe1
uTbv8hsn0TYWT/tJwgrscSRWOMsCVwI=
=0hrM
-----END PGP SIGNATURE-----

--fpokwbkqxdym2r3r--
