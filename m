Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12A24E555C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC30210E6FC;
	Wed, 23 Mar 2022 15:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B00510E6FC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 15:35:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 71FD93201DE8;
 Wed, 23 Mar 2022 11:35:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 23 Mar 2022 11:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=4YNPjKCj77tyerqK9caWnIP27WFmmz+a/aytIK
 nfBVk=; b=V7nd4morSEv5GQN9la0HGa6JRZVuS7ERaHl8RYdPDGAe41RZ67cuCH
 7iya3wPTcqnwRTL2SNlvaJEOIQRqs7bXsOkhY0aOKOWayupLMbqLKWEeXCjko8O7
 6B+Q8h1djJLGkaJhFVTaqb7YNzUepOdlw+FpqPBpDU3/PgVNRGHotmBnpA2ZvJln
 WpKfkB0zUc5IBcUpohfpFNY3DKbymCn/1CZRPJoEA1qjxMcPKo1RvOg9Ie5MyMYG
 W/Wa/Crx70o/rli2IFzn5Ew0zD0Z2qeSGrruBAQi0meVWsCfc1K/TlaZcl5HpKLb
 w0QUXN4lF8xR2xkxPI5A4N+OoKSPwEXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4YNPjKCj77tyerqK9
 caWnIP27WFmmz+a/aytIKnfBVk=; b=gC1b8zyxbixlTapdtnaWIBtzGyv/eJVLo
 Q/mKwoBGhd9Pv8rDQGTp1eKyrgB2zkZ5WEl+YMf4Y8kVvhWRXVx2pSoVkGnF+4m2
 sZQea9nCkOb9BGP1I3fivgwSPGA/8dTK1tzr84MgkGMrC1RxUHsMw1PvKCYo3i3v
 VqLUx+IeJ1lOssCVO3ML7AqD1TAE6Ll92l8y1EP4eUdWMm6lfVh3MoHMKRcqcKTA
 8eqeltgrrQ23yMuxFxlWYXOyewjPpRnmxSyGqB8bPNaVZEECJJHOV0LOm7L1JrYM
 enF5pDP6c8titgQc0wppQx59atmVImSlMGx7CXh8hZZGFBQ9xPz7g==
X-ME-Sender: <xms:KD47YpqHfMW6rJy2FB8QdULtPKYQd7reCLLg_JA8bjmqZWljHq6GbA>
 <xme:KD47Yro0yM0ts9M7Wv9fZJvgDwmqbdPTHnZMSf4Iwk8ZTKnkUWIS6PEJX7nSK1YlI
 XZY7bdNkMayecbi3lQ>
X-ME-Received: <xmr:KD47YmPndVwSlJHF_DjYjKEG_-HANR1PJFqnvllDI-BrC4JR84KQvXPWsAFnmlGcAQw0fivpkyV65dVwUibCIjnuiN2z71YE_ma6dPU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegjedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KD47Yk7jPboIb5qwu6_ZjF-9X-_nll4CMAg-1YVCV5zJ0F2Bkq-6dQ>
 <xmx:KD47Yo6gvVJ29prOsFSn1MaQzYL6wQ4k8zyBV8eymZwaDdyjCbVeXg>
 <xmx:KD47YsiMy0DgpOsrheqRlNoXspm25ybgeB74en3zo4g_oqjrisUZ6Q>
 <xmx:KT47Yj0pPJwxf8ibKxse26kRgYpDXNFlIezbsAQ8Alx11l3hwsM6cw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Mar 2022 11:35:04 -0400 (EDT)
Date: Wed, 23 Mar 2022 16:35:01 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v5 09/11] drm: bridge: icn6211: Add I2C configuration
 support
Message-ID: <20220323153501.nmgye6hyo2bkocar@houat>
References: <20220318184755.113152-1-marex@denx.de>
 <20220318184755.113152-10-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eqyt3oazx7d7cmzq"
Content-Disposition: inline
In-Reply-To: <20220318184755.113152-10-marex@denx.de>
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eqyt3oazx7d7cmzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 07:47:53PM +0100, Marek Vasut wrote:
> The ICN6211 chip starts in I2C configuration mode after cold boot.
> Implement support for configuring the chip via I2C in addition to
> the current DSI LP command mode configuration support. The later
> seems to be available only on chips which have additional MCU on
> the panel/bridge board which preconfigures the ICN6211, while the
> I2C configuration mode added by this patch does not require any
> such MCU.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

I still don't get why removing a line in a binding is too hard, but I
guess I'll have to do it myself.

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--eqyt3oazx7d7cmzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjs+JQAKCRDj7w1vZxhR
xXhSAP9RZLRoBwZ+HoFyZlFCzwXVWDBw0ZynoUHpeskHmNUvbQD/XP5gXlBM/+bi
IsLd6/SiQfL/0570SXLUK5Zg3D9aWgk=
=Jdd0
-----END PGP SIGNATURE-----

--eqyt3oazx7d7cmzq--
