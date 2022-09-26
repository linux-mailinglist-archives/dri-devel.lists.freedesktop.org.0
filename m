Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B335E9EFE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 12:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544C410E66C;
	Mon, 26 Sep 2022 10:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A4E10E66A;
 Mon, 26 Sep 2022 10:17:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 509A82B06A11;
 Mon, 26 Sep 2022 06:17:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 26 Sep 2022 06:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664187438; x=1664194638; bh=rl9YQRMrLQ
 Jn6n80xCv8aYOf+VIHpMfcgzt7f7zjMaU=; b=iiiaYcTZ9qp70c+RGtu3oMk2bQ
 WP19OHHjsm9H+9BdRB7BKF/l+t2LpvuC9aA2U4r2rIXXTDcRi+VrBAgHkJciICSN
 Bnkx4HOz6KPeFUCRwNTxSXqZyDdqgG5iVc4j3m9Sk/8CIWlqV71w5kS3j4ZK52+2
 KNLUZwjhkMb6eEt3jjoNtTG7+PU/H6526hXP6bQ+PEgNOsd5JYKiMOwN9XDg5zqB
 oTDDAaiaOXFTyHa5ooZkgmRnBVeriZIb0vLZWTqgCOMejt9rt8JTAmEoYZz/ELIw
 VtgDrUlpCIgvNpvEU5v08/5g6xJDPoyfAjMfcdFOy+RobY/5E5tcDd/p+7hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664187438; x=1664194638; bh=rl9YQRMrLQJn6n80xCv8aYOf+VIH
 pMfcgzt7f7zjMaU=; b=r5zUfGaaAw67Am5QZUwRH9tW4S+orq5guCn5NBSQ2DFZ
 5R7CaDZdg1/bA/tvdX1mU0+byqe+H7OSwtHcRY8gc3+I4ctgoD6A5N9zMXFP6C7H
 Oy+MPxzU6TlBZ08XZf2t6XSowTTDpY48Eg/TvGiOkKDb1cbVarh82NXsK/DAT0c9
 NzbzwI8T0hqKexErAay6q4BS9TjT57OeiBnrkAI0+QUdBj2G7r9BDDMeS3+bHZPN
 4ytBRePtCHl4mTWfUPyJb4HQ8pXXI/RMGfFd72t7p+g4yKSrTFt/pjNBXKtCKWjv
 BGdTFT9mwT91ri6qZJegiLMBzN1JHvXDztyZDfkR1Q==
X-ME-Sender: <xms:LnwxYzgNEmlWSI-iRsLHKIz4RDfxDCN95Lg0eL-TBa-kica_ueMtrw>
 <xme:LnwxYwANJvypltOLJRxmn6KA3HTC6PqV6xGjd80tGPuewYSi7JUswggsxlUBVa5fl
 wzzidljZOx2NwpfFPM>
X-ME-Received: <xmr:LnwxYzHhQX_dk01wS-DnCS0tqvcLRpTPvOt7cSjErYwNexn3NtBtty1wZpCb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LnwxYwRUbrtzrvWyCAcSHposR4ZzgYU4nuOQoCW7hsSUN6S2deRXmg>
 <xmx:LnwxYwwiaRV9Yvlxpej_I2Fl6e4FHx7h2SnAJfsaERfQJIt_xqzFnA>
 <xmx:LnwxY27jUN7CWecX-f0oAUW-abJHdxLwmcNx7iw4z3dQynAbgviV1Q>
 <xmx:LnwxYxRbcCHjLPEee4BWMO5EAhVXZuHSZlrKQPQhZJ5lD8uRXCQ0JNaIy_Y>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 06:17:17 -0400 (EDT)
Date: Mon, 26 Sep 2022 12:17:16 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20220926101716.urehomr2lzv5pqln@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k7oktdtvp3ipcm7k"
Content-Disposition: inline
In-Reply-To: <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
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


--k7oktdtvp3ipcm7k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 23, 2022 at 11:05:48AM +0200, Thomas Zimmermann wrote:
> > +	/* 63.556us * 13.5MHz =3D 858 pixels */
>=20
> I kind of get what the comment wants to tell me, but the units don't add =
up.

I'm not sure how it doesn't add up?

We have a frequency in Hz (equivalent to s^-1) and a duration in s, so
the result ends up with no dimension, which is to be expected for a
number of periods?

If you're talking about the comment itself, then NTSC mandates that a
line is 63.556us long. If we're using a pixel clock at 13.5 MHz, it
means that the period (=3D=3D pixel) is ~74ns, so we get 63556 / 74 =3D 858
pixels / line.

> I think you want to end up with 858 pixels/line =3D
>=20
>   13,5 pixels/second / (60/2I frame/second * 525 lines/frame)
>=20
> I: interlaced
>=20
> Maybe just remove the short comments and document that in a more meaningf=
ul
> place.

I guess this is where it's meaningful, we really want to hit that
target. BT601 also mandates it.

Maxime

--k7oktdtvp3ipcm7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYzF8KwAKCRDj7w1vZxhR
xV9fAQDnxZyqz39vGg64Oqr+zhaZZobk1gPiciVJ4v0EI/nzOgD/VaWQoS8Orsjk
80pHjJdXIU06FcXOaBvhX/eYS4k7mAo=
=RnOU
-----END PGP SIGNATURE-----

--k7oktdtvp3ipcm7k--
