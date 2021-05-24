Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A794438E7D1
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888FA6E7FE;
	Mon, 24 May 2021 13:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641366E5D4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 13:39:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 1B53C2685;
 Mon, 24 May 2021 09:39:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 24 May 2021 09:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=s/NM62L3Og2Ajx92SsKLLhMAsWU
 lDMHJJUgar/CuuyY=; b=AH+1x3mWyzoPAuqEmOjSdf9NVKXPq4ESFoEih3CtgKq
 91w//vo4s3/NB3tRwvoHyucf0T8J2F4ErGm+SwbRoFYbz2FHqSMtQzbGPxTRe1yH
 MtFD+8PIQ2RHqJVWuPrgLRRg67jDjd/Tvzl9lh4NSHVKovUp0e/A5nQYpVay7LwI
 7h0tFdBTjCz5rVaKbWZNRNu+ZlymcWuQ8RI+/ZUFWyFmYdw8J9j+0d+Y4gpxGPVW
 IX1N4X+bukknM8DrGdwUGR+FtWV2b1zEj4EqcSNhx6HMnyl9eSxvUGNI2U8MZ+/4
 9jTeg9m1+c0uDbIykYpdd1IKzGzPI3kXkcKGneDp2ZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=s/NM62
 L3Og2Ajx92SsKLLhMAsWUlDMHJJUgar/CuuyY=; b=diD59LTdjW4BEsvkAdgJl9
 ZMNasLZ6FLNm+bbeKBMBXEOAXzUHJqrucsikh/TNwhuX9aIv0uZ5tOrCwD/Nezqk
 /lAcrkNiNfou1WTPaL+c/IEwX4XwGCIRAw9gVrFav2rewtZWxTpJ24N7VPTSAOLr
 7a05iIoVEg9xCd98WRtRB1hhIdu2eDyc2N+EgVQVZ3cHdTALJGPsh+qLzsMl8RaZ
 rxZWyhIGT6Vi1uGfwEgGi5fSMYVI6R7F+PNIf0FTrfXK56vivT2pRc4DoEXLI79g
 79CLE3JPda8iXOqKdpvm9BOml1LrDguVoKoUtYMM3c5AmJpqKnOa7ZsmaCIxfOUg
 ==
X-ME-Sender: <xms:eqyrYFxsL2q9dhh77aZXvFfstEEF9C_Uzi7RY60hsVFCGY0ntHxCEA>
 <xme:eqyrYFTnUcb9HoC76mFuWWeB8qbi_w-_E6onwstHjlgwDwmFGm3jvEoHkjOuM_qGd
 9igVU0E-dFlVuX12J4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejledgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eqyrYPVOhRczMAYLMv_RxXCHvwSLvrFJagPZWFClCjv1uF44L9QaJw>
 <xmx:eqyrYHgock0f7W38mStevEeADAQU-4Kre_uutEDxs-47e1h9YOKOGg>
 <xmx:eqyrYHDP2iTsajqWwjTaqU-OH1SrrQ4TMMFcWFrSWwPqucqTP7f5nA>
 <xmx:fKyrYGAmJ9b0-7aB2g6z7QW16zur0z33CsLHEByv2n708o14hirnODAU1PA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 24 May 2021 09:39:05 -0400 (EDT)
Date: Mon, 24 May 2021 15:39:04 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/11] drm/vc4: hdmi: Enable Channel Mapping, IEC958, HBR
 Passthrough using hdmi-codec
Message-ID: <20210524133904.kgkh6xd3m5c2j3xa@gilmour>
References: <20210507140334.204865-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tmkkjaxkjbof4vya"
Content-Disposition: inline
In-Reply-To: <20210507140334.204865-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tmkkjaxkjbof4vya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 07, 2021 at 04:03:23PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> hdmi-codec allows to have a lot of HDMI-audio related infrastructure in p=
lace,
> it's missing a few controls to be able to provide HBR passthrough. This s=
eries
> adds more infrastructure for the drivers, and leverages it in the vc4 HDMI
> controller driver.
>=20
> One thing that felt a bit weird is that even though
> https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-d=
river.html#iec958-s-pdif
> mentions that the iec958 mask control should be a mixer control and the
> default control should be a PCM one, it feels a bit weird to have two dif=
ferent
> control type for two controls so similar, and other drivers are pretty
> inconsistent with this. Should we update the documentation?

Any comments on this series?
Thanks!
Maxime

--tmkkjaxkjbof4vya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKusdwAKCRDj7w1vZxhR
xVj3AP4uZTPoREfuFK3oXQIWtdDspcef5aq6+8o5wrl7gjJzFwD9GbDNuVOSZ62m
P4t+tqoRf1AhEyG+nYTwbpCM/Pkkqwc=
=nosZ
-----END PGP SIGNATURE-----

--tmkkjaxkjbof4vya--
