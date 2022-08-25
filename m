Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 866CA5A1628
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 17:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C5B10E002;
	Thu, 25 Aug 2022 15:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C07410E002
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 15:55:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7263B5809BC;
 Thu, 25 Aug 2022 11:55:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 25 Aug 2022 11:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661442911; x=1661450111; bh=tqptnFbA7h
 c7h/4TDLxF1PP/YGhchwUmCeAxXxdoHRo=; b=RFffi5cPCoCoz36n0Z8bN6eFVo
 0sldhf8QeuR3gcVvDvDA14WK7m4PCGogEN5hgOGNhMxp86aHJmN5QCxoI6JEhCbF
 SnB2daum5piCYP9HFE0Sk47iUU1dDYq//YjNQ1YzbKqsUgYdvCJfpJ8055ay/Zoy
 FMOQIFumgNUTa9nWhOrV6SrtiQk6Vx/wi1GE+0qlZ72ReSlAXTkUCsNMzngMBrIu
 cQbZV5YxB9MegL+jACYJqF8sbi9DrBrZ7Fqp6Mnigl3BL5c9bw0cXZ6XUZDK0Igc
 d8M18gBNErH4jzQ0A0iITF6KOd+qvh7IhYLUrastuhlkXfXPkbAaIGAu91kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661442911; x=1661450111; bh=tqptnFbA7hc7h/4TDLxF1PP/YGhc
 hwUmCeAxXxdoHRo=; b=E8A8tVJzDj9pu9GbygbxuEQP8MB41DMI91z2ueoX8nBy
 zySUgxlsfCZSiTrHU5+aI3u6QnvYVuHp2kMEVivQlWk8zqcMXzuar6Xd0QNFm+hk
 RyLc9PCRXMRyq7+RH2cxVzw2yFYT5JhNg6nCfs4t6MXRXpPCCSN2I/jj1EMN6Yr7
 c5Hticfaet3zeUGcT5DDX95lN+/61APn8enJPVDcrmOcGUZM67WJ7NNUniFuqnCM
 d9eiETS+xNIVxMbovGUiM5RwZoFKkGKeLL0fEU41xLpnhXxQF3yvKqadjfKoP8UY
 YKG9dXlEP/QCRdsfcAIaiQgTDmAPobAl5xm48eFJFw==
X-ME-Sender: <xms:XZsHY0xsv4iDhjXgedHZcaQ9BoeKJEsj0XKKPtURgGDvdVmCrAp2zQ>
 <xme:XZsHY4SA0zrQVDzvrKCYS_108LKJSh88MN_v67-LfnsoEcx1f6Kgv43WwUTneaOfG
 3Tt0KRWe6xuxjCpnkw>
X-ME-Received: <xmr:XZsHY2WolPrgWEYiYyCgZ092JoyS0D-qIhr4rkuG2-slyMuUoj8dLuVefag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefhkeehfedthfejfeejtdfhvddvueeigeejjeeuteegveffhfffgeffieeu
 ueduvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:XpsHYyjdlVhneiSB4ustS7xDJwI1mC6wv4gJhjpJXLF3JfdGi3cf1w>
 <xmx:XpsHY2DepCkheOhxgh4cnsdJEgcwkyRqcq23RUfJ3SWuKnwJGa16kA>
 <xmx:XpsHYzKLY5z2Qt95j_xLe_zMkehclF39eHC4SCWy3DliPelW2Vixjg>
 <xmx:X5sHY4ycPKM8nQmjvA_fj97WxxkhwpA3jPTgoMqJP0U0Rk2ysCJr2A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 11:55:09 -0400 (EDT)
Date: Thu, 25 Aug 2022 17:55:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Message-ID: <20220825155506.wqurh5r752qfufqs@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
 <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o2rxfoydvcfezv5r"
Content-Disposition: inline
In-Reply-To: <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
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


--o2rxfoydvcfezv5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mateusz,

On Mon, Aug 22, 2022 at 10:57:26AM +0200, Mateusz Kwiatkowski wrote:
> Hi Maxime,
>=20
> I tried testing and reviewing your changes properly over the last weekend=
, but
> ultimately ran into this ("flip_done timed out" etc.) issue and was unabl=
e to
> mitigate it, at least so far. This seems to pop up every time I try to ch=
ange
> modes in any way (either change the TV norm, or just try doing
> "xrandr --output Composite-1 --off" followed by bringing it back on; it a=
lso
> means that the Pi goes unusable when the DE's screen saving routine kicks=
 in).
>=20
> I'm using a Pi 4, and it works with the rpi-5.13.y branch
> https://github.com/raspberrypi/linux, but seemingly nothing newer.
> I specifically tried rpi-5.14.y, rpi-5.15.y and rpi-5.19.y - rpi-5.15.y,
> which is the current main branch in Raspberry Pi OS, seems to be broken s=
ince
> forever; at least since my patches (originally written for 5.10) landed t=
here.
>=20
> I'll try identifying the issue further, possibly later today, and maybe c=
heck
> the rpi-6.0.y branch as well.

I've tried it this, and I can't reproduce it here. But I'm curious, how
did you apply this series? rpi-5.13.y is probably full of conflicts
everywhere?

Maxime

--o2rxfoydvcfezv5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwebWgAKCRDj7w1vZxhR
xWTZAQDwNGx7ING3Lb1EnLGPTAGR3tQpH/72q4zipEWhAbBLSwEAuSVMBrPHUOys
oIi4MLhNS5Ak7DHUrbr+dgxHf4umjwA=
=vOq0
-----END PGP SIGNATURE-----

--o2rxfoydvcfezv5r--
