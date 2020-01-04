Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E084130228
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D346E432;
	Sat,  4 Jan 2020 11:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA526E3C4
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 08:45:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1CFD32203E;
 Sat,  4 Jan 2020 03:45:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 04 Jan 2020 03:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xPWxXOLRj2wJ5worV+vGX0zBBsW
 sywSnkvJSkhZtf9o=; b=RFmFpDT4XujVKz4GdxqY6agLft4CMokf2gv1wLu0at2
 rbIA83pi0D3TTpi4NAsmJzZ2MzlmBjsUatb4iqCIHaKSRQpz+gd0+bvDuzYk5oKB
 eVul0BfYg5PC7XKoc3syN+q76bXdiPgv6dmdzzzdPaAIzbkgoh6TBNmdHuuPGLEw
 OTWu9yDP2iqKeLX/m4tiEtgcAFZk6ffisnGd/uOBjxUT44NThAPXqN+GL0kP6mGF
 q2UBeEELHDnCnfLpz0c/BCs1p7OTN5DCJg/Nap9X6EjbszTIa57+vRxxdyPDboWW
 Thhd2BEjBDaA5fstSsGIqJuBclefzo0HTnzKRuOkufg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xPWxXO
 LRj2wJ5worV+vGX0zBBsWsywSnkvJSkhZtf9o=; b=BfOlyaNAYunwKweqAliio7
 YDEDBoeUorpVxTshG2uhrE2qVEaG81iLKV0bdIR4STo4Y2SV6G48raBHye0Y1MxE
 yeIBGBeQNVUdfisaqSP1aKu9BXu2VLxpujC4qZIBd5JYdCWQ1nQK25PcViUAUqlP
 6F7gjrhvOqKAR4gDYkV9mV8pSOqBO8HlumkwVcPGII607uhcGgNEW4cTp89mOAKw
 5I6kLhIj7mOueD0EAEHZ1WhMyqE20PGlqK63aWQW/GlJP7aH4vAZCoepZ9/YRcL5
 Rpik7tQcggbwTW8OmfY3dIO6tnI6STLfFfn+TOKSCnWI8PAcdtiSBFNHQm/8+XnQ
 ==
X-ME-Sender: <xms:tVAQXlo0gDOY790ckBZHa7THX-hr359oNLgI3sX1fLEdr6-30U1BZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeggedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkpheple
 dtrdekledrieekrdejieenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegt
 vghrnhhordhtvggthhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:tlAQXhBy_TxCOOpUei580NUXhnRVDIm319O1dT0lonpVRo5hySypsA>
 <xmx:tlAQXqsuI4MRlIrQiqIYuOCRBWKASHf1zfYYZA_8utQKZmSnxe6CCQ>
 <xmx:tlAQXgb_xP1j0jpTvV5u591-yRjj-ibvZYOYKYfpMo6IIU44T3f9AA>
 <xmx:tlAQXq7fdHGUzJCwaHVgHF6kY1VzQxXl06wJqyZRjf95axPt4pWJ5g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0BBB30600A8;
 Sat,  4 Jan 2020 03:45:41 -0500 (EST)
Date: Sat, 4 Jan 2020 09:45:40 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 3/4] clk: sunxi: a23/a33: Export the MIPI PLL
Message-ID: <20200104084540.qkyzomhmozxyrvec@gilmour.lan>
References: <20200103152801.47254-1-maxime@cerno.tech>
 <20200103152801.47254-3-maxime@cerno.tech>
 <CAGb2v662mJCGaRx_-0ij9inTGz1GtzNxkFyBeeq2hhbSYZm3Rg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v662mJCGaRx_-0ij9inTGz1GtzNxkFyBeeq2hhbSYZm3Rg@mail.gmail.com>
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0169423593=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0169423593==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="myszb7jthorvzpoy"
Content-Disposition: inline


--myszb7jthorvzpoy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 03, 2020 at 11:30:35PM +0800, Chen-Yu Tsai wrote:
> On Fri, Jan 3, 2020 at 11:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The MIPI PLL is used for LVDS. Make sure it's exported in the dt bindings
> > headers.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--myszb7jthorvzpoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhBQtAAKCRDj7w1vZxhR
xe4TAP9ExpfYfpOAx4fITDaJjcjpXXBBJFpkvnGrvxe3bMsr2gEAnbNwnDMTRIlr
iO0dNASqpwGVFjz/EpCVfvi2qIO5FAA=
=1Tvb
-----END PGP SIGNATURE-----

--myszb7jthorvzpoy--

--===============0169423593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0169423593==--
