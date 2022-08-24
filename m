Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D459FEB4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C71B798C;
	Wed, 24 Aug 2022 15:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B8BB78F7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 15:45:49 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id BD1B32B060D6;
 Wed, 24 Aug 2022 11:45:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 24 Aug 2022 11:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661355946; x=1661363146; bh=k0jUUwZlCp
 Fb8RacICxbFXp0XcVVSWVRMQYkg+IsL/w=; b=VsZuzuWdjynggiS089ISUrX+XF
 H2BRJSxCBnBl3CsIA/QQl6XyiPxYXEfJYDVkH8/TAg+/TsZe1jPkooNoJ83yeDKd
 wRQBdZMq+S+bTTTLPcNRVTGL+MBWRp/ueuJ0Ho0ZfZv1c6/HlOwwpuGL8Kfe9XM8
 CTzUtb7o/5LsIiWM4LJDLDOz30et9eWxW0pxZGZJruPuDw4uugRPT1L9w7w9n+P5
 wxEqFw8WZNGMkyxBzthn64/wOHoKdoowcqtim7edifBOtwSHRhWg+Iu8XwSG6TY8
 eb3k1LgRZ9QuHbUpIbIHfABQkHgNCBOo3KE01SYM7MsWkprPEtBIScI9pgdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661355946; x=1661363146; bh=k0jUUwZlCpFb8RacICxbFXp0XcVV
 SWVRMQYkg+IsL/w=; b=0Imn5JCOC0WiGzpT0k91VjTy8yvPpQT21DKTMRYUaOIU
 sVYc6lcCAKUzlsO7M0g9ZuyY85s14FiF7Jv6lyJNc+tUikgsJoSnyDn7tgRhOghN
 t3A9B2Rl3JSuSRFuPeWO4D1Ykh3svlsQpHq24F6szaCQCRG3hH1X/U7fRev/WeoS
 KKE4COiFBTvEKSDPFGC9Hh0IvugYt1lQxOqR9gMDTzQgGRrWS+uscDrs37LCL+ll
 EHLDmBjd9DFlg7L0b2Zy0CBa6yITRDksQMNFzkjHCGLojYQsP7Pq1oMQP3i50VpJ
 CuEn8xamB0p+mtmm+8YF28aDUd774vLyoMtRVNrLxw==
X-ME-Sender: <xms:qUcGYzDFrcpSHuvMtYDZYCmk3OqqfBUNHEHNQRr47kQ_AzR2afIyIg>
 <xme:qUcGY5gxXBuPRXb7sxz-fD3XY1K28G2HCR-RvP38qj6v37MMQtWuZzLkuflXKz6hS
 T87sk6NzGExfyCcTEI>
X-ME-Received: <xmr:qUcGY-kFUPrn5v4AZYHh9aAI1eHSI_0zzF-GVUOwsOwOCrZ2qMRsINvOscBW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qUcGY1xGET_pULNFhGqvRG7BMhJOOVXBW1PlHuuLfiGF87hbYnxCwQ>
 <xmx:qUcGY4RhpUBWSdpBficCdhAPILHPAM02fbxTamOx4Uo_5Z2mW7Rolw>
 <xmx:qUcGY4a5nfolhfg1OrHPchsQpZQXLra_1S2Z5ttkhMUYzjn83OUf6w>
 <xmx:qkcGY3A3Xa53RJusfXMGoi1NFvbhxZYRynCLfPYcniNVbVPTK5RITUscqak>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Aug 2022 11:45:44 -0400 (EDT)
Date: Wed, 24 Aug 2022 17:45:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
 command-line option
Message-ID: <20220824154543.bdtpz2evwzsjrdrz@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
 <eedb1a86-c1fb-cc76-2a43-4ed349d7d826@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fetwu2vf2sqny7wk"
Content-Disposition: inline
In-Reply-To: <eedb1a86-c1fb-cc76-2a43-4ed349d7d826@tronnes.org>
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


--fetwu2vf2sqny7wk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

On Sat, Aug 20, 2022 at 10:18:47PM +0200, Noralf Tr=F8nnes wrote:
> Den 29.07.2022 18.35, skrev Maxime Ripard:
> > Our new tv mode option allows to specify the TV mode from a property.
> > However, it can still be useful, for example to avoid any boot time
> > artifact, to set that property directly from the kernel command line.
> >=20
> > Let's add some code to allow it, and some unit tests to exercise that c=
ode.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
>=20
> In the subject it says "tv_mode property", but the property is called
> "tv norm", so the option should be tv_norm?

Yeah... I don't know. mode is taken but it's obviously the best name. So
I went with norm to avoid the (internal) conflict but I left mode for
the user facing property.

I'm not sure what's best here, or maybe we can pick another name entirely?

Maxime

--fetwu2vf2sqny7wk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwZHpwAKCRDj7w1vZxhR
xb3AAP9tWGleJEtkD6UwMhukbZIQ59/uDegXZyj1E6YRYC78RAEApPnjLjYnLERA
E4Ahd6Pzh7p0TuGpdjYkO1Ufgfim2AA=
=Le3o
-----END PGP SIGNATURE-----

--fetwu2vf2sqny7wk--
