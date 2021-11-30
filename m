Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9097462F36
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 10:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FB06F3E2;
	Tue, 30 Nov 2021 09:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E847C6F3E2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:03:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F4805C019E;
 Tue, 30 Nov 2021 04:03:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 30 Nov 2021 04:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=cIzPzDIMNvXI+7c5/F0qLyKpS+g
 RyMx/VWujNf7m6rI=; b=TP+hM5/Jqy+yttAB+5jFxgnNDQdl8BXiMSVkWYj/krO
 2DxkvWWkeAB+4dDvWRx1bHSTTGTsi28dqz0fhxI45UVzOsBxAmeyw0d0uG+74vXz
 ShXmHs0p3GTtAfI9VD1g9YCRta5lcuRhhrgKWfyvskG5lKV9d+uuKNmhUDGdQK6C
 5+gfMydCh0pyxwI3NyXyfydpj+j1fP7e0kVHKK/zXXQIsZug8h1N0y+DwY2YaksE
 El7poTMWI5CWVi8/cJs7pUhCT6k58Xf+NPP79acSyxVfGO3ElFyEyduRd1BAMJO2
 gDVFXN3uQv8OJ3p4xZQWE/FcRX/aMONDh2Y5CJxabXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cIzPzD
 IMNvXI+7c5/F0qLyKpS+gRyMx/VWujNf7m6rI=; b=Ah1ZdrSLFy/WRXjwqNsSTa
 yMu/rC+Fwtub7VtUx+/9k6qPiawVxXNdQ179FUk7J9ExonbAVSXgN2Z3MVndw301
 VBMH9qhd3xjMoWA9YKPLuBS4L/Prv6khNNOp6drEY+Dv5fLkLH+OBToDjY8YXI2G
 Dj8wIug8kFAKcCNX20xmYeMigd4W9XUYr0RQ9mdcMWrUtRMMMK0CkIQAHbqq+CMA
 7xJJk6yWN6q2j1EQL4kvi3TwnLoK7rahp3I2fCQZTO29jVOTxMWId5yLfnudkd5j
 ayDIvjHrR1d7+byrvxWWb3IqvMFcqBZQroG+fmglKZ694Jok9gba2J8bW9iNNJbQ
 ==
X-ME-Sender: <xms:_eilYdowOwhkH3hdFUk4EX0A2t6axI6-_ftbrrKf6ddcMAEzAKW2BQ>
 <xme:_eilYfrEBQyrazRxRkq1rcEnMfv3thk5Cf-gTVyTYPi6q_V4tkaY4zklbKR7p90KL
 aDSRgENN98ee46h4pI>
X-ME-Received: <xmr:_eilYaPSRaf7VLATHV3qpkzOjpTY4Q2lbAUeyGE585xMd-XPmIKu27fTM9COOF_G2a77v2dFfZknABI2_f8nMWxhz8hA5DUApIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieduucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnh
 epleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieehgedunecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimh
 gvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_eilYY6NIME2jiFXqw3q7kjkqGNwXPePzMFw1OMz8PEmdyg-1PdzaA>
 <xmx:_eilYc6dNVnbAIkrvy9jcFq3EsiQRFr6Jtz4QZJgeMDCJX8aS90zcg>
 <xmx:_eilYQjhacbFEMubLiiB1E_gJvWkH70Y6rJw_iuOFreWYYoX_Xph2A>
 <xmx:_uilYbaBsgx006dUvOGfFeTthDGqByO0o06E4aWKr1-ITu9SgJ1HgA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Nov 2021 04:03:56 -0500 (EST)
Date: Tue, 30 Nov 2021 10:03:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/6] drm/tiny/st7735r: Match up with staging/fbtft driver
Message-ID: <20211130090355.2mqe3lixbn6j53sq@houat>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <eba23198-5c52-6520-079b-d2d41f71dc25@lechnology.com>
 <20211129093946.xhp22mvdut3m67sc@houat>
 <CAMuHMdUKcOuTjSOQmEywXWJtK+15jPD5jfxXx06JJG1f1U+fog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tszzmrkvbr2nm6rh"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUKcOuTjSOQmEywXWJtK+15jPD5jfxXx06JJG1f1U+fog@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Lechner <david@lechnology.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-staging@lists.linux.dev,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tszzmrkvbr2nm6rh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Nov 30, 2021 at 09:13:45AM +0100, Geert Uytterhoeven wrote:
> On Mon, Nov 29, 2021 at 11:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > The problem that fbtft (and this series) wants to fix is completely
> > different though: it wants to address the issue the users are facing.
> > Namely, you get a cheap display from wherever, connect it to your shiny
> > new SBC and wants to get something on the display.
> >
> > In this situation, the user probably doesn't have the knowledge to
> > introduce the compatible in the kernel in the first place. But there's
> > also some technical barriers there: if they use secure boot, they can't
> > change the kernel (well, at least the knowledge required is far above
> > what we can expect from the average user). If the platform doesn't allow
>=20
> If you can change the DT, you can introduce a vulnerability to change
> the kernel ;-)

Indeed

> > access to the DT, you can't change the DT either.
>=20
> How do people connect a cheap display from wherever to their shiny
> new SBC and make it work, without modifying DT?

Through overlays, usually. I guess it would still qualify as "DT", but
it's not the main DT

And the other issues remain the same: while the DT could be "easily"
patched, the kernel certainly isn't and we need both with the current
expectations.

Maxime

--tszzmrkvbr2nm6rh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaXo+wAKCRDj7w1vZxhR
xQNnAP4lb/slXlYnbnN/0BM8RqZs3CnVmes7f36wIK3jZH3bOwD9E5JJUnb7qGRN
g03xo7yQIoO4napOWZViabsJErR65gk=
=nhFG
-----END PGP SIGNATURE-----

--tszzmrkvbr2nm6rh--
