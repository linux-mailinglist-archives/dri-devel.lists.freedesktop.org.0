Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E60BA592B00
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 10:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A644C95E92;
	Mon, 15 Aug 2022 08:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F3E902DE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 08:37:07 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D88AC580384;
 Mon, 15 Aug 2022 04:37:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 15 Aug 2022 04:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660552626; x=1660559826; bh=oAuXuNlgNL
 w6WNYkkip9f54ivuwSvAVKETMQ5321nLw=; b=JtvTKO088RLfabk/+DMxHb16VK
 n3/KKHJWzmmylfv22KyKsZ2IgQoRY1mQGHOjbIkDa1hNaGvxxgdqisxgc3yjaXdF
 Ebuj615E6/OcnTUSpE5NE6yGsFTuaQ80s0FJv5sMjks/2QdnyRRLACOjujWff5Gz
 Yp+G5AYS1+lG2uu2pqZdHL4pPdXJi3/9dzozjs/ZWXmrlXfbx5SdkNaJis5Q5atw
 UQg/i1i7jCWokrsynR/TqH27lVcS90dLabBKuzrtzLFfCm4/vL9Nu7uYF/zCFHza
 i58/kNh1OhORKfQLCIfASYZ6wK0D1xrRxcdYQmM3ORVR0LXZEMVELsLToRqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660552626; x=1660559826; bh=oAuXuNlgNLw6WNYkkip9f54ivuwS
 vAVKETMQ5321nLw=; b=Jn9Qv8Syu8SeSEzUuzwQwjjDH/H6Vy35jlCSGm/j3HYW
 Lg6orKUGZDBdRoyA/L9Oe8UzwD+9anbe9dpwHfcxBpY8yWLJiQVicnycxzAcmRYP
 2b8Ek8R4bvcU7wpqJxF+LepddhIG3IyubJBFGekHIfKzuvGlKw0bYeNVPWtXPDYN
 rD7cL3SlfPv0kcVHXXrn3loLvtMuB58GuQgOE8aSXh+5CMBRa5GWsaXzgf+M/3uj
 0RFuY32Gh1D+PkvX4fHhh67/ShwzOfKs1Hrx+oxia2bWp0ru0Ye7yKDz24F7wgrQ
 cGE1rixPIb+59RLBshr88h9e2hentsFI5G5ISL/1/Q==
X-ME-Sender: <xms:sAX6YmovB4nAPnBdgQJ_xAaPW0cvNwV21QeAr1xQu_0jefTgBA3Hxw>
 <xme:sAX6YkqIVraw_jqADezR2U3FY1bYJuMeCNARQblF7ehFb96LWKX_AnEM4ngYYFCLv
 OpFPSCuWXD67qIqJ04>
X-ME-Received: <xmr:sAX6YrPb4ig8h2Jbzj783uvoBiREr8hLDfTmnnVocqw8F3Bb0kOMjaVlH3Yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgueeutdefgfevveehjeefgeehvdejjeefheekffduteeutdfgieeiieff
 uedtffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:sAX6Yl7J4UEUz-h4ZjuHDS57M2HIS5ub49-CTrcDS6zdF9lYtOzDqQ>
 <xmx:sAX6Yl71-EpBEfkuWCx2lB9xRhRuc1PiIuMRQL7Zix8nhwN8atXcUA>
 <xmx:sAX6YliJAdAgpBX12Iw5w7-7AnALYEkNmRhM5Cd4WXf74TNzde8r4Q>
 <xmx:sgX6YqpGarFWfdUppvtESPvzVQyJbRrXPbr71F_eKxrF5spRqzMrfw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 04:37:04 -0400 (EDT)
Date: Mon, 15 Aug 2022 10:37:02 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v1 24/35] drm/vc4: vec: Add support for more analog TV
 standards
Message-ID: <20220815083702.ipcmdwzkh2fxvdp7@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-24-3d53ae722097@cerno.tech>
 <0e7bebe2-3f45-0a1b-a4b6-bb783f8de7b6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xit2556wzwnf3mna"
Content-Disposition: inline
In-Reply-To: <0e7bebe2-3f45-0a1b-a4b6-bb783f8de7b6@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xit2556wzwnf3mna
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 29, 2022 at 07:55:30PM +0200, Mateusz Kwiatkowski wrote:
> Hi Maxime,
>=20
> I think that declaring PAL-B and SECAM-B as the only supported 576i
> norms is a bit random.

Starting with this patch, PAL-N should be supported as well, right?

> Norms B, D, G, H, I, K, K1 and L (for both PAL and SECAM) are
> essentially identical if we're talking about baseband signals, AFAIK
> they only differ when those are modulated as RF signals. I'm not sure
> if there's a point to differentiating those (that's more about patch
> 05/35) unless we need to deal with some device that actually features
> an RF modulator.

What I was aiming for is to have all the cases we have in all the
drivers covered so that we can make that property generic. i915
declares and uses all those variants:

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display=
/intel_sdvo.c#L68

Especially since it's i915 and it's pretty much the standard as far as
the uAPI goes, I'd rather avoid any regression there.

> But if we do want to have all those norms separate, then I'd say that
> VC4 should declare support for all of those, and all should map to the
> same VEC settings. Some users from e.g. the UK might think that they
> won't get proper picture if PAL-I is not on the list of supported
> norms. Same goes for e.g. SECAM-D/K in the former Soviet territories,
> and so on.

I'd be open to it, but we can always extend vc4 to support those modes
later on. The work you did to make that easier should make it trivial.

Maxime

--xit2556wzwnf3mna
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvoFrgAKCRDj7w1vZxhR
xZnyAP9jXpEvF2lUxvex7zTOvooUq38MKs/KI6lRaxdYOVThegEA6BfLk9GnTPKE
2NpP3lugt4OQILqB7O/cIIoIU2hkxwI=
=X9DV
-----END PGP SIGNATURE-----

--xit2556wzwnf3mna--
