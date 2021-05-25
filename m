Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE36D38FDB9
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 11:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4FA6E408;
	Tue, 25 May 2021 09:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ACB6E9FE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 09:23:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id CD5F4146D;
 Tue, 25 May 2021 05:23:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 25 May 2021 05:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=qhdCG6Qg5hhTfUV1qjjJLTSxYnh
 gWog/DLM8gX+Rusw=; b=kQDf+JuM1XOO7yWY/YL1k0CL6e3A113Z8bh5JDuafz+
 z94tfBfnQQg27AIRT06Rsgw04DasL3N7qVNihNOHmNB/G2naEPIbd3IF7gkHRQyB
 GEOBjUVfRWivgP1xck9qrC1uNcmBo9yo8Un68paBoq041Vx/GXXHQ/6YK4FXF+Qd
 TVTm+VbQFLJ8GIMReDS8wl1NP8vQ+0iSQDxM374HcGzl3FLB/rs5aDvlKyG/LRMD
 VioNeGIx+W6JPj7NnkxKevxhJ+A3aLUYm4kgdU3J6VCIzMK3HPlyAO7x7D9SqTyF
 CaPBvmn9ZdA6U1s50PSQ9L3LCpChe/bJZlqHAEE+fug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qhdCG6
 Qg5hhTfUV1qjjJLTSxYnhgWog/DLM8gX+Rusw=; b=Mklc8vs2/D9YTg3aQo2JtP
 t1TF8RrAeXK7XLX2eSBz97ykXhYUVrOxgzC9LOclpg2Uzteh66i6r5sfPqWjqCkm
 toZtkPuHZjeSPpOC2TdW4M2tN7B3MgLT2N4A+kxDBYt1+3lR7Gc6r5fU2sywDv/g
 1Mn4ZMttFyaHlRZY73A/wa7VE1odVJ3oV97BlAZnk3dh73SH/HNwoNFChwYNYska
 UxNm6UTU8HInw0Hyii5M9vRPMrv1I8PdYpj108UpqfUgIoAgBRm9qxLELzxPRCCk
 0DiVLKYtuI0vX69CIkZ2AumhAjQuERrORIGaf48N5Mppfj5/GkweCvxHRhhNmEBw
 ==
X-ME-Sender: <xms:KsKsYLdnP2618sd6zawCSXHzcX4_-iddEzx-a9ZGhUJT-T8BXksu2Q>
 <xme:KsKsYBOv137-AxhPN7UQOyCS3Vs5OTGg3xC2kbq5T2sc3PjxwfhWs34-jruzrfHcI
 ImRi_SGooe4rB41IRE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KsKsYEj1BKBHEYxHgdXquEgl9aODqOdbjh81TC1TUIoIW1fz3qZ83Q>
 <xmx:KsKsYM-Lvmk5qwORpR_7TxuKVFsUgAiFezeESRtA3kTmDRpOXmzWaw>
 <xmx:KsKsYHtF1dgQHFCO7z2LcUUFfWYHrxXzK_UMXQbLCW-aP837jwl8UA>
 <xmx:LMKsYMWVbhzXzkPmZC0FkNMnr7FA9uoPQal5hT7tFwKc-vh_jYejiGByJRk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 05:23:54 -0400 (EDT)
Date: Tue, 25 May 2021 11:23:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/11] drm/vc4: hdmi: Enable Channel Mapping, IEC958, HBR
 Passthrough using hdmi-codec
Message-ID: <20210525092353.mvqdv4bi4i4rkqsu@gilmour>
References: <20210507140334.204865-1-maxime@cerno.tech>
 <20210524133904.kgkh6xd3m5c2j3xa@gilmour>
 <s5hzgwjcit9.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="edyfacc36enjbeyb"
Content-Disposition: inline
In-Reply-To: <s5hzgwjcit9.wl-tiwai@suse.de>
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
Cc: alsa-devel@alsa-project.org, Tim Gover <tim.gover@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Takashi Iwai <tiwai@suse.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--edyfacc36enjbeyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Tue, May 25, 2021 at 10:35:14AM +0200, Takashi Iwai wrote:
> On Mon, 24 May 2021 15:39:04 +0200,
> Maxime Ripard wrote:
> >=20
> > Hi,
> >=20
> > On Fri, May 07, 2021 at 04:03:23PM +0200, Maxime Ripard wrote:
> > > Hi,
> > >=20
> > > hdmi-codec allows to have a lot of HDMI-audio related infrastructure =
in place,
> > > it's missing a few controls to be able to provide HBR passthrough. Th=
is series
> > > adds more infrastructure for the drivers, and leverages it in the vc4=
 HDMI
> > > controller driver.
> > >=20
> > > One thing that felt a bit weird is that even though
> > > https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-al=
sa-driver.html#iec958-s-pdif
> > > mentions that the iec958 mask control should be a mixer control and t=
he
> > > default control should be a PCM one, it feels a bit weird to have two=
 different
> > > control type for two controls so similar, and other drivers are pretty
> > > inconsistent with this. Should we update the documentation?
> >=20
> > Any comments on this series?
>=20
> A patch for updating the documentation is welcome.
> Currently, as de facto standard, we allow both MIXER and PCM ifaces
> for all IEC958-related controls, and it's unlikely that we would
> change that in future.

Ok, I'll write a patch for the documentation make it clearer then :)

Do we want to make sure that all the iec958 controls are on the same
iface, or is it also left to the driver (or should we just leave the
existing drivers as is but encourage a consistent use in the future)?

Maxime

--edyfacc36enjbeyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKzCKAAKCRDj7w1vZxhR
xT6GAQCmK74YyTmGnQSUD3qsdks6qIaoPcyMDO73ebQeXm4xZwEAzb0RQ+6uvdWf
9lgi7PPwMH7RXPFAdijTOOtf4OHrLAU=
=kqaK
-----END PGP SIGNATURE-----

--edyfacc36enjbeyb--
