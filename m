Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815782B9C06
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453756E81C;
	Thu, 19 Nov 2020 20:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E6B6E527
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 13:54:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 834095806CD;
 Thu, 19 Nov 2020 08:53:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Nov 2020 08:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=qwUwKAOnCXIO/VKCgdjuqrvU0jz
 rwqIByRKFslj4P0U=; b=Dh+cGrAaYY/69KWDDPVjXgWxTQz0wzEwEX7lFJH386b
 caMyUb9jvhJ9SR2YWxQnZowwip0unH3mY3SQtxzX+J8etZTiKe4RwSya4oy4FE7n
 ddF0TO5S0q/AIJdeskajgg/srKtVdxda3ZH7iW85a+GXoqAm6tURiWhNZC65KmKW
 p5qpIM0QladuSz9BfGBaAUrZ1Lo+j8nSBoW/hErewlTqAAAQfELb3CYGMwgVfPpK
 +CfjqHV7JZfqwog/IohmPsSDOTLBryBDAS1IInD62gieo7tQB9AJadoyLrmTnL91
 amnP6fYemvKAs7CIsPIW4alYa0c8AfmK792zUmO7OLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qwUwKA
 OnCXIO/VKCgdjuqrvU0jzrwqIByRKFslj4P0U=; b=PuRk3DclKeylLTj5kLX52W
 zIGX0eVIUR4goaQyZt3qiIfGZ3IiQeIpx2Y098TniWyEGndcKnxHi5AyrGmrB+z5
 hdy1S97kc4KqudPrKMDDTaneXQp4yk/LqRJMSgOcVYwWelW9rlk/1HZv3+rQLx3s
 MMGNTIsbExRI3Mbed8tO5azICvk57byYCdgamVvWrcypVU3CDuDIFodYJBRR+Znw
 UtdrzMlVE6UOmGoQz6QUxgai82aCxGsCQMfsbB6G2Gvri1nPdvlnGn8LQYX1ors+
 y5lGINohUnsXbVKkDj9S9YmP8QCS/9O9uyedPzVODce2BY0V8pEopt9dtKnu3GEQ
 ==
X-ME-Sender: <xms:9ni2X14Ip3zmPoIcnxawnZxLtkonIcF7h2uzjWxEBWDT_fg1-3rKyg>
 <xme:9ni2Xy4gQac9DfDWvZ3wvi4qszIYvEsXF8gkTrZUTruzVM_ZivtU-nzmLEHm7DCea
 MNTJmKnJUJ9LYvN0qk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefjedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9ni2X8dfbD9hxXXgTvVHuQHhj2zTkWAYjQdSA6q4oRrFnUM7KlxKZA>
 <xmx:9ni2X-L9iIHMoeyX_f3HKY51-dxvjkeTiG5rI1kkOeG8Skllif1u4w>
 <xmx:9ni2X5LpCIBDQk0jETlmvbE4k8zcgKt0D06_Df_CI9UjsZ6t6vKZPw>
 <xmx:93i2X7iNR9wy5l5_8eOrK4NQKpw76yljYUHY7IHILCkF3eWS-kDCuA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B5103280066;
 Thu, 19 Nov 2020 08:53:58 -0500 (EST)
Date: Thu, 19 Nov 2020 14:53:56 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 5/7] drm/vc4: kms: Document the muxing corner cases
Message-ID: <20201119135356.25tsxpbvjxopz6od@gilmour.lan>
References: <20201105135656.383350-1-maxime@cerno.tech>
 <20201105135656.383350-6-maxime@cerno.tech>
 <2a79055f-a2e7-913c-b566-91780f199016@suse.de>
MIME-Version: 1.0
In-Reply-To: <2a79055f-a2e7-913c-b566-91780f199016@suse.de>
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1270919057=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1270919057==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qihihgcaukra524q"
Content-Disposition: inline


--qihihgcaukra524q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks again for your review

On Thu, Nov 19, 2020 at 09:11:58AM +0100, Thomas Zimmermann wrote:
> Hi,
>=20
> A few suggestions below. But I'm not a native speaker.
>=20
> Am 05.11.20 um 14:56 schrieb Maxime Ripard:
> > We've had a number of muxing corner-cases with specific ways to reprodu=
ce
> > them, so let's document them to make sure they aren't lost and introduce
> > regressions later on.
> >=20
> > Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/vc4/vc4_kms.c | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_km=
s.c
> > index bb2efc5d2d01..499c6914fce4 100644
> > --- a/drivers/gpu/drm/vc4/vc4_kms.c
> > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> > @@ -662,6 +662,28 @@ static int vc4_load_tracker_obj_init(struct vc4_de=
v *vc4)
> >   	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fin=
i, NULL);
> >   }
> > +/*
> > + * The BCM2711 HVS has up to 7 output connected to the pixelvalves and
>=20
> '7 outputs'
>=20
> Is it 'pixelvalves' or 'pixel valves'?

The documentation uses both, but the driver uses the former all the
time.

>=20
> > + * the TXP (and therefore all the CRTCs found on that platform).
> > + *
> > + * The naive (and our initial) implementation would just iterate over
> > + * all the active CRTCs, try to find a suitable FIFO, and then remove =
it
> > + * from the available FIFOs pool. However, there's a few corner cases
>=20
> I'd write. 'and remove it from the pool of available FIFOs'. Sounds more
> natural to me.
>=20
> 'there are a few'
>=20
> > + * that need to be considered:
> > + *
> > + * - When running in a dual-display setup (so with two CRTCs involved),
> > + *   we can update the state of a single CRTC (for example by changing
> > + *   its mode using xrandr under X11) without affecting the other. In
> > + *   this case, the other CRTC wouldn't be in the state at all, so we
> > + *   need to consider all the running CRTCs in the DRM device to assign
> > + *   a FIFO, not just the one in the state.
> > + *
> > + * - Since we need the pixelvalve to be disabled and enabled back when
> > + *   the FIFO is changed, we should keep the FIFO assigned for as long
> > + *   as the CRTC is enabled, only considering it free again once that
> > + *   CRTC has been disabled. This can be tested by booting X11 on a
> > + *   single display, and changing the resolution down and then back up.
> > + */
>=20
> With my suggestions considered,
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

I've applied it with your comments fixed. Thanks!
Maxime

--qihihgcaukra524q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7Z49AAKCRDj7w1vZxhR
xalWAQDV0Mhb4aB8CuICXvs1elL9yDhSUPAnD3GxJAFVjn7YkwEAi+bCZ7FhjS3y
A1aNcwUHBin2gFbS7DYClW0EFE02twg=
=M6qC
-----END PGP SIGNATURE-----

--qihihgcaukra524q--

--===============1270919057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1270919057==--
