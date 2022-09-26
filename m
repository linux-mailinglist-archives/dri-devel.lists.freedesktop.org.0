Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B3E5EA666
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 14:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDA410E69D;
	Mon, 26 Sep 2022 12:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889AD89864;
 Mon, 26 Sep 2022 12:43:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E376F58AE2F;
 Mon, 26 Sep 2022 08:43:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 26 Sep 2022 08:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664196182; x=1664203382; bh=i4gXX7cMD1
 +PjoZvTs+9A2oUnU38ddYmRKsQkQVxiMs=; b=utTKiHScIMKiv0MpVyZ4lYRSxq
 IdIfp7iVLBBmx2S2eOAO53gfMKyfiFzEuir61MIGPNtwTE7wHXJHK7BGuOXHrQ+C
 6X4WAl58F/xpl6BNrq0gnmF1iHRRK/dZjj6RZarM+rsvG+kwaBM11YzBKwU2fK+J
 aYMxKD/57VEDUbQAprlFh6MyepwhDcYUwbQ2YQpPw2K0aafj9t8XvbE4bATWnjnG
 9zsJZcovK2yYprsEajU1fQdq98AwZ1JXxZJxIQKfQR6JVyM9iGlnbc33dbmnjjBh
 Jq564dxEOi7Rhb74/fPZNrDBmsyqdjHxdfYtEO3M+Nvo2uClDa6pcwPXODtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664196182; x=1664203382; bh=i4gXX7cMD1+PjoZvTs+9A2oUnU38
 ddYmRKsQkQVxiMs=; b=Exp0lmhEFcQQlHZBqhBkTbZV5eb7+Y9htD6qSb+s/hgK
 oVFKHN8HJq9Urzj4VJy3PyLbWdJ9n1dKgyqxCE+05OCGD885OoKYLqQi+Ud55+zy
 RnwkhD9xF274QiLfb+kMpRK/hXxkE9RLFRllQKr3UShCwH4VfQDIuL3LsgnoaHQA
 aVYCrQFwMjwEmcbRluRGExOFwQ8sOeZZH/cEMPHNks5Vb6dhw8s6eQ1AuRig0GOV
 eAD6u45d6IWsbNVjU7bRobP+NZQt8a1kQwa+/rGROqgNf2+R5zIPDdLfDHmTtRPc
 SbQXmxra9Viq7gcGHn5blSVPsVIwNbMy7sQ3vGMMeA==
X-ME-Sender: <xms:Vp4xY35t1RrPNaALSMHuh1B7j94uji_FDc0WF_zgf44oMTSpfpclbA>
 <xme:Vp4xY87uXKmLp9ZsVPzW4LKLiBZi2Qtf7Id_KCsiNFUVqwiERIq89SKC8Z9K9VD1X
 pSqU4vHHxKHDrsaiwQ>
X-ME-Received: <xmr:Vp4xY-cZZ1wFeWgO57h01Q7WFAblva8uy_54RuhC02BABgmJvfEOFmnQw5n9NjuVU-XBPrQKB16mWXK-lHGIiEg4NBmioW1bYckL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Vp4xY4L9AnEzzujabPzhsNgmzGczwxE5aCo-hgxyNFIM0zd-bd6AJQ>
 <xmx:Vp4xY7KAJHokA38AoKvWik_cMIoXMQP0yZRl6yvN-iMXL7wV1b-Y-Q>
 <xmx:Vp4xYxxUKU4-qvMnxN_ooEXC7nxV7xQuaa8m_z0yvZwsa4OkyikzBg>
 <xmx:Vp4xY5ksBfiDGqIvX384MVdKlM8qOdvR5mmTsN5k9EWbuVI4_0PHdA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 08:43:01 -0400 (EDT)
Date: Mon, 26 Sep 2022 14:42:59 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20220926124259.o6fcfnxjy7gyzqz2@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de>
 <20220926101716.urehomr2lzv5pqln@houat>
 <CAMuHMdXonxXiw4x2PvnQ=xedOQO1y=K0O8g1+ixeSvXmzcOOVw@mail.gmail.com>
 <c714b53d-8e18-9105-9e27-8b783f246082@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zlfwclqmvthsubza"
Content-Disposition: inline
In-Reply-To: <c714b53d-8e18-9105-9e27-8b783f246082@suse.de>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zlfwclqmvthsubza
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 01:17:52PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 26.09.22 um 12:34 schrieb Geert Uytterhoeven:
> > Hi Maxime,
> >=20
> > On Mon, Sep 26, 2022 at 12:17 PM Maxime Ripard <maxime@cerno.tech> wrot=
e:
> > > On Fri, Sep 23, 2022 at 11:05:48AM +0200, Thomas Zimmermann wrote:
> > > > > +   /* 63.556us * 13.5MHz =3D 858 pixels */
> > > >=20
> > > > I kind of get what the comment wants to tell me, but the units don'=
t add up.
> > >=20
> > > I'm not sure how it doesn't add up?
> > >=20
> > > We have a frequency in Hz (equivalent to s^-1) and a duration in s, so
> > > the result ends up with no dimension, which is to be expected for a
> > > number of periods?
> >=20
> > To make the units add up, it should be 13.5 Mpixel/s
> > (which is what a pixel clock of 13.5 MHz really means ;-)
>=20
> Sort of. It leaves the time value as a magic number, which obfuscates wha=
t's
> happening.
>=20
> The unit for htotal is pixels/scanline because if you multiply it with the
> number of scanlines per frame (which is in vtotal), you get pixels/frame.
> Multiplying with the frames per second results in the pixel clock in
> pixels/second.

That's true, but both are true?

> That's a bit much for this comment. Hence, I suggested to remove these
> comments entirely and document the relation among the numbers in a more
> prominent location. The documentation for drm_display_mode would be a good
> place, I guess.

I'm not sure I understand what it's about. It's an explicit requirement
of PAL and NTSC, why would something so specific be in the generic
definition of drm_display_mode?

Maxime

--zlfwclqmvthsubza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYzGeUwAKCRDj7w1vZxhR
xY5tAP9KJjA2OGdWz1GFAUwsCyA+v6gay+4c8P+X8ZcLHAES9QEAx6aTDtrTd2Yz
yzAZ6N+Br4689AWFKhh40XQtNNC5JQE=
=nm5h
-----END PGP SIGNATURE-----

--zlfwclqmvthsubza--
