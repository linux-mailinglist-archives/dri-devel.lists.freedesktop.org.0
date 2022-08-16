Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DD3595704
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 11:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E7111A3DB;
	Tue, 16 Aug 2022 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAE0A1705
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 09:49:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id B14432B059FF;
 Tue, 16 Aug 2022 05:49:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 16 Aug 2022 05:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660643366; x=1660650566; bh=LDg0F/tdWm
 uuX+5Y52zO8Sqcm7DQL0YcyaqGkQk8adc=; b=GPpFjSOrwZxIYxYGAXsZL6mHjD
 WbjU9v6Cap1kKGhAEqkg57BIGNOPRu2hyTIbMt7feU6DsQpypdeWuoTEyC/buFjX
 rk2MONDaPv9NB3Ig+QokHa5oA98ZpWJoXyFA2tcQfUcu5t+1S+oedTww0kKzo7NU
 yaPmk8EUfi4c2+xNI0YjM1CXGv22lWemlWZl8x5QSycKGykmDH13U0fI3PDII043
 YpYk8UEsy4wk741tnCqA/AvXdH8FUCixrYVSLAe5BpFwv1Fcrvhf/8diiRG5Eu8x
 otMOeoTcNjVRrlmwMvQ5K4xRMgRq1TphmgdkW6PUa8eeezdDTJy7rz/q1Rwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660643366; x=1660650566; bh=LDg0F/tdWmuuX+5Y52zO8Sqcm7DQ
 L0YcyaqGkQk8adc=; b=3Ax3i/frWA1OJ/WVrRDv96/pDYIOq+xB3sBoWFdH93O/
 d+E8N3D5uiix0u5hIsoOzu1B6xy1iuXInlcuUTOQwWfP4rghbaotNkEukW6wnxZz
 3zNWdBo34rrVe2jpV7L+epwEr0ke9uBhMVc3Hh069JCweIrJuRPkMu0ecjkTisvI
 RE4hGsBf5hCU1rE2ChO8nndii3HbsP2eMrL8ty45mv/HhGxkftE/RJUS18iP9QnX
 G6+f6O2nisM/yWvQ19b+sAuJDAMHaskW1WkltLGBUhmrJJ4kPHuqe2so1lLne4XI
 vIE45/4Q+Wc6+MMPDs5WPDbVOWzvXD2mL13r0G6i+A==
X-ME-Sender: <xms:JWj7YmJ2NdSrJApiuS_qsqrvR7DFDeJm9787V7XliSkuq9hHJuVKBw>
 <xme:JWj7YuKPbclW3rHsThJRK-7jLiV_b3I5zfTpWR4g-AnfNzzd6hxjr_cJgTycWkxsp
 VYY8lmhggu0WbWScJY>
X-ME-Received: <xmr:JWj7Ymuno8rq01Nb1Z8-oyF0Irh3B8eOgkhXeL7ahfp9kVf2ihQgcEDCD0k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedukeevvdehheeuhefhhfefteeiffefgeffuefgkeetffevgeevgeejteei
 gffghfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghh
X-ME-Proxy: <xmx:JWj7YrbWn7UHWJgGfNxx5L3ZSRi_2z9w7seKrmSh0e-w89WzmrAYIA>
 <xmx:JWj7YtazAfBfmbhzLNpiqYbkr7bdx71dbJowYgq8817v2UYa5dqsNw>
 <xmx:JWj7YnByepaGyImxjUck4n1YplQ2s7xp7VgiN2rXgIAcWX7lvHGMUA>
 <xmx:Jmj7YqJp35QTIMSU1Q05bl9u74Ce-NNm75OwDKsOOSwtg18qO_VHALNIk_s>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 05:49:24 -0400 (EDT)
Date: Tue, 16 Aug 2022 11:49:22 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220816094922.oqhrhefv327zo2ou@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wxlquavc6w2uimy2"
Content-Disposition: inline
In-Reply-To: <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
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
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wxlquavc6w2uimy2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 11:42:20AM +0200, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 16.08.2022 10.26, skrev Maxime Ripard:
> > Hi,
> >=20
> > On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Tr=F8nnes wrote:
> >> Den 29.07.2022 18.34, skrev Maxime Ripard:
> >>> The TV mode property has been around for a while now to select and ge=
t the
> >>> current TV mode output on an analog TV connector.
> >>>
> >>> Despite that property name being generic, its content isn't and has b=
een
> >>> driver-specific which makes it hard to build any generic behaviour on=
 top
> >>> of it, both in kernel and user-space.
> >>>
> >>> Let's create a new bitmask tv norm property, that can contain any of =
the
> >>> analog TV standards currently supported by kernel drivers. Each drive=
r can
> >>> then pass in a bitmask of the modes it supports.
> >>>
> >>> We'll then be able to phase out the older tv mode property.
> >>>
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>
> >>
> >> Please also update Documentation/gpu/kms-properties.csv
> >>
> >> Requirements for adding a new property is found in
> >> Documentation/gpu/drm-kms.rst
> >=20
> > I knew this was going to be raised at some point, so I'm glad it's that
> > early :)
> >=20
> > I really don't know what to do there. If we stick by our usual rules,
> > then we can't have any of that work merged.
> >=20
> > However, I think the status quo is not really satisfactory either.
> > Indeed, we have a property, that doesn't follow those requirements
> > either, with a driver-specific content, and that stands in the way of
> > fixes and further improvements at both the core framework and driver
> > levels.
> >=20
> > So having that new property still seems like a net improvement at the
> > driver, framework and uAPI levels, even if it's not entirely following
> > the requirements we have in place.
> >=20
> > Even more so since, realistically, those kind of interfaces will never
> > get any new development on the user-space side of things, it's
> > considered by everyone as legacy.
> >=20
> > This also is something we need to support at some point if we want to
> > completely deprecate the fbdev drivers and provide decent alternatives
> > in KMS.
> >=20
> > So yeah, strictly speaking, we would not qualify for our requirements
> > there. I still think we have a strong case for an exception though.
>
> Which requirements would that be? The only one I can see is the
> documentation and maybe an IGT test.

This is the one I had in mind
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspac=
e-requirements

I overlooked yours obviously, so I'll update my patches to fix it.

Maxime

--wxlquavc6w2uimy2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvtoIgAKCRDj7w1vZxhR
xdmCAP0TxNLQ337aCmZF1DrZ9PxgyCBlNhBMtaDX8zJsaRfqJgD+Kw7tZK+ncFk4
xnge3+28RfIGi25dtfBBzpr7m1dc6QA=
=aMK2
-----END PGP SIGNATURE-----

--wxlquavc6w2uimy2--
