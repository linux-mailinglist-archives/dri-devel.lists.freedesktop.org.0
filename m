Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B891825763E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7E989C56;
	Mon, 31 Aug 2020 09:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D131789AC6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 07:40:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6E4FA5C01AB;
 Mon, 31 Aug 2020 03:40:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 31 Aug 2020 03:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=IhGb3DeuuYHu5Na6nUBIcRvk2Xi
 EHRuVQRQsWSf8LSs=; b=guEhH34JK1YWBukKPEDBve4BhY6Cdjs7GSrwDd7bf53
 TWDVRj5n5NE2FtHwQMdbfDp1r5BRNQRzvlyikAUkp8CNaLdJ5u+kKTMhSe7Sjihq
 /+KxaboI9k7Pcn+5w/I/Ud6R972q5/i5PmW/U1SNwaCDfY/pISuHfiuj5+3TY22J
 6Nb4KczXF/Ny8awPSrjw1R+uDm265UJg0tQd26Za+jmSF8YWqFSYRfBTkOvXSYHt
 DGfJFicTgN6uUUDLw3mHnoV4HzWnsHZQ40LztVQ+XA2c1E6puD13DpOOE68jsndq
 oZYG8JUSQoZh/hhzLla9I+ThoFYBdiS2cdhW8hL7TgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IhGb3D
 euuYHu5Na6nUBIcRvk2XiEHRuVQRQsWSf8LSs=; b=jRv9hY5RDrNFs80Tmo1+iE
 WDerJU2Jh6nREyJ+KDG1/9Z69bF7bVbhAhufOJWwL70eEbOj6DFGLFShvV3QrN/p
 Dj+EOCsDfEqR+fP1ntZVaBfx+pAwGTvStapVYQklmZgTSN1JS0jP1eKmaDvkZ74Y
 5fIfU41Rr482FYYSKDS9lIBWehe7By6txyzOVFjF8r7M4rHXSCUiYBFvgvhoGkKg
 cm7iCttD5rCoiX/OKK/E7rE9le/9XfCS0AagPD/TFosKtojfAW7U16nGaKb5MigU
 jkwdBBUopf9bYRCMCuIIIEZWesup6igBJ7A1Xh6IktTkZKanEKL40iugXc2m5U8Q
 ==
X-ME-Sender: <xms:e6lMX8W1PHlzxpg9rGyfEXTjXa7txhDxCgcMu6n2ZYlvVv8d8C4rBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:e6lMXwl_utngBevTFE3wvwg0_Op8ZJrHSESmLzR_ksxP3sYTIzpfsA>
 <xmx:e6lMXwaFNiRx3euzTEhn_va6rSlq-DLr22A35W_Zk2LGMAiuC-tlFg>
 <xmx:e6lMX7VzJYEtzIVJgT5x5ohHv5wAv3Lq1XTf2_XqH6bcX2SNvfEumA>
 <xmx:fKlMX3DF1nu_i8zvhVVblhjXetqwaMIwAJl13POfFAn5paDxcGi6iw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 118403280064;
 Mon, 31 Aug 2020 03:40:42 -0400 (EDT)
Date: Mon, 31 Aug 2020 09:40:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpu: arm, mali-utgard: Correct Maxime's email
Message-ID: <20200831074041.wn25id7u3kci7l4i@gilmour.lan>
References: <20200830085122.20826-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200830085122.20826-1-krzk@kernel.org>
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1374465565=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1374465565==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jncvpyk7tscua4j6"
Content-Disposition: inline


--jncvpyk7tscua4j6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 10:51:22AM +0200, Krzysztof Kozlowski wrote:
> Update the address of Maxime Ripard as one in @free-electrons.com does
> not work.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--jncvpyk7tscua4j6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0ypdAAKCRDj7w1vZxhR
xdV4AQCUFFfso3akR5K79GMeFdFb1myFiHtYWRErzQjYWMa9dAD9G8K5A5llzHoH
DBAwcresf2RMY5DtX2ao+WhFPjCJPwI=
=zrs4
-----END PGP SIGNATURE-----

--jncvpyk7tscua4j6--

--===============1374465565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1374465565==--
