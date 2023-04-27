Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654E76F036A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 11:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430BF10E011;
	Thu, 27 Apr 2023 09:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9304110E011
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 09:31:34 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 473382B05EAC;
 Thu, 27 Apr 2023 05:31:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 27 Apr 2023 05:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1682587891; x=1682595091; bh=4A
 A/hUm7D5pj1dXpkRE40WDcs6X1KOVEyS7AjjrVzTg=; b=c6gG7qWeLWbvTYBneh
 0cpMlN1hyuwFW9AVaILSZUzXlq2VrkXNdECHe5Koom2PdV8p4wwa+81y5gKhunta
 aAaGkdMC0YRzd1PuHg2GdjJHx1yUYKa3lb8ki5/TovNESn5HJ2N9l+uxdSERyb8j
 6UPazgbAd3C/ncRP8N+/LNCKgVEUAyUYGQmIdwKAjaQOFwCgj0SYRfCbU69u17uo
 DjtDjRJDjj7Nxd6B1mqAC/0L3o2vyxySuqMqklSIh7zx01IuMQ1BH1ZIKVXGTc5C
 drJu3ZJFshS42Uzf3h6K9NIB1X8C/49PWH9Hw8cNXB+Kiiv/KvVSxaFg5MBToIp6
 KlCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1682587891; x=1682595091; bh=4AA/hUm7D5pj1
 dXpkRE40WDcs6X1KOVEyS7AjjrVzTg=; b=W7jpYx5LESYg91sizldIl10GJj+rD
 jy65wkdbCw9O2TfuZAxD8IXNKrJU54OHcVsK0s8PBzGKRRhO5D8H64obaZgmJLzj
 6t0y2Voe0mmDovsP/Sr02ZFSSs/A2fTixlzQ4cCky62qPAsnYsOYe7WxgqGVuGMr
 w23ok5ubBrSkkNAql/NxVjgSxlwUCzI4a8fdNS1kiq8iCLrBlWQ2+c2UIY+Rf5D+
 1zKWmXemMSUJxEKiioxqTLbe8DNGVa2ZTMcxW69sMUcqZIiHQ3BCksM3h4uo88hI
 5hmu0js2B8jrbEAXV8FqDng+UL7k1Vhc3SFFs3Rk5PR8jjIFkVzqd7ctw==
X-ME-Sender: <xms:80BKZMuezHer77xiPJPHYQSQdr8oXzND7NAvo5BvbwQ0SgOCW6OvZA>
 <xme:80BKZJca5I2T0brI_D2owkz9GslDbTu4l1WYIuAoUiV0SHjP0NMKOs02VbIhYqvwH
 AUJ-guwwvwIUWQy66s>
X-ME-Received: <xmr:80BKZHxUl8aMEWZltEiEr2W91x2OfV3PxH-BSGTEwSjUxVD-Q28S6TiPP6e6lAeK_BLtID6_fIr33xntyh37F71PREGTxpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduiedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:80BKZPPMiTNp0pBWuXJpw5IwOR3f38iRB439Cq27YP-QUCoGIsVqpw>
 <xmx:80BKZM9ZFqa3UlRm8hdodsvAqVdMvyDVXWChodXOIVFa3Yjt3eWzVg>
 <xmx:80BKZHXT7pkUKMWvj08PDMoi81_ZdSo8ESftR8zGgCqgAPx_znBg0g>
 <xmx:80BKZKMkjjtpN_9xl810hqNl5QdFO91lcsI8bvgOh3pYhmGLgHUvkD2O1vA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Apr 2023 05:31:30 -0400 (EDT)
Date: Thu, 27 Apr 2023 11:31:29 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Beranek <me@crly.cz>
Subject: Re: [PATCH v3 4/7] arm64: dts: allwinner: a64: reset pll-video0 rate
Message-ID: <i5sad34yvpcdavj76imjeifdz72ah3ue6mi6g6tf4cxc54yzla@gzhfmogh3oar>
References: <20230427091611.99044-1-me@crly.cz>
 <20230427091611.99044-5-me@crly.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="73te7bsofh2bjjp6"
Content-Disposition: inline
In-Reply-To: <20230427091611.99044-5-me@crly.cz>
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
Cc: Samuel Holland <samuel@sholland.org>, Frank Oltmanns <frank@oltmanns.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megi@xff.cz>,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--73te7bsofh2bjjp6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm not sure I understand what you're doing here

On Thu, Apr 27, 2023 at 11:16:08AM +0200, Roman Beranek wrote:
> With pll-mipi as its source clock, the exact rate to which TCON0's data
> clock can be set to is constrained by the current rate of pll-video0.

What in the TCON exactly is constrained by pll-video0 rate?

> Unless changed on a request of another consumer, the rate of pll-video0
> is left as inherited from the bootloader.
>
> The default rate on reset is 297 MHz, a value preferable to what it is
> later set to in u-boot (294 MHz). This happens unintentionally though,
> as u-boot, for the sake of simplicity, rounds the rate requested by DE2
> driver (297 MHz) to 6 MHz steps.
>
> Reset the PLL to its default rate of 297 MHz.
>=20
> Signed-off-by: Roman Beranek <me@crly.cz>

If the driver depends on the value being the reset value, then that's
the issue we should fix, either by reading the clock rate and adjusting
to it, or enforcing the rate we expect in the TCON driver.

Maxime

--73te7bsofh2bjjp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZEpA8QAKCRDj7w1vZxhR
xaEnAP9+CfgLfIBh7+mlIZQEeNhmazMhTc+4FfTDKHlU2/4uwwEAhul26+AYC72i
NRQL72HmiIWlL9U7nFEsCX6vZx2DlgI=
=ra2f
-----END PGP SIGNATURE-----

--73te7bsofh2bjjp6--
