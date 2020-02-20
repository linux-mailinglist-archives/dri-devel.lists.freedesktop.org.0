Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB5167BB0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6346F3F0;
	Fri, 21 Feb 2020 11:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF996EE0B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 17:24:49 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 339E821D6E;
 Thu, 20 Feb 2020 12:24:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 20 Feb 2020 12:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=te6hdqtQBQi0OFmy4I46vtfMUfG
 loiIkQJHlJUAw1Po=; b=jYZ2RHNbhZSEidhluJIDU6jVeGxE/iCJM/du3cp/Ae9
 aC4NNCcOaF5a1u04qZeMKjF/fHiD/BikSUcTZwytD6iTqppOcXkJ58ic50VnNNhy
 tP/IJMdwKd9AKmEVi0E6f9qa5eo88DcSggqpz4wU1boO8YxeiUk7CO1MmtHoXyCy
 oFqdEQJ6tf9/kd7YM+bZ+/PDvfQUn/Kc31mrtnryLvWBGrnv3UbE3FCg5s4Miw1D
 d6uoNw0SGFFL+lcArMkzdMEEcBbW5SBnbngpACskbT5QjRvhMQP4uIEuIkUdcAoF
 SddU2/FJtpCtLTMF/Gtiw2ifA3oo1JcFYXOjl694scA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=te6hdq
 tQBQi0OFmy4I46vtfMUfGloiIkQJHlJUAw1Po=; b=iKlzhwNoehwx38inZe86Sp
 MEMG6KRTstc2sT9ZNSGtmbr1E7eP0D7Wlk6tBBR7Vg6HsexHL8EnLv4AW1HSD18K
 jFc4hhQ+1d2MbnG9qWCNHR68jfuxgAUJCoz0vz5FiT6TQt1bE5Iul3hktQmfAAlV
 yyfbiMsQjCeM2ipKCcEkWt/KDRJ4Qd5TZA7TwK0xjJytTrmdJP/7+x+khplgNbeV
 WXKixC2GXYDnwAm8VswRgMGGcRzpVLoa2zJNbVVyWnAn2VxSwqcwDoAUAKawYKWI
 4ml3miuKfjbSmsooTvL1MOvngeQWb21Ih7TY5CG9bucivKaeVQTQ8UJr/8AQ2kwg
 ==
X-ME-Sender: <xms:38BOXsUyNFFHbTkUI4L6lSmEuBpN2to3bnumg5QKeZUwpWa5nK7cQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:38BOXtPnDlk2fotdqkIJYqsppoZXUNXEjhVlabcenoCtDlaazpySgQ>
 <xmx:38BOXmysRKSbfQ9lAMIu7F-OMkpWLMdLX4gSC0sTV_i62YKi3muq7Q>
 <xmx:38BOXlMIRB3K6gQeHz6LwzDvEyJ_gJSb0Rb_WfV1HHEj4OKssfzQaQ>
 <xmx:4cBOXprXyGmrPIxveegUBiPvy01hCRzkkJlR9OlNDZ7shuWsZoqYFA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6E60C3060C21;
 Thu, 20 Feb 2020 12:24:47 -0500 (EST)
Date: Thu, 20 Feb 2020 18:24:46 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Andrey Lebedev <andrey.lebedev@gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: display: sun4i: New compatibles for A20
 tcons
Message-ID: <20200220172446.gg746z5efmzwtfdz@gilmour.lan>
References: <20200210195633.GA21832@kedthinkpad>
 <20200219180858.4806-1-andrey.lebedev@gmail.com>
 <20200219180858.4806-5-andrey.lebedev@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200219180858.4806-5-andrey.lebedev@gmail.com>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:24 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrey Lebedev <andrey@lebedev.lt>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1072176780=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1072176780==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j2564guncf3jyy2w"
Content-Disposition: inline


--j2564guncf3jyy2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2020 at 08:08:57PM +0200, Andrey Lebedev wrote:
> From: Andrey Lebedev <andrey@lebedev.lt>
>
> Document new compatibles used to differentiate between timing
> controllers on A20 (sun7i)
>
> Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
> ---
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> index 86ad617d2327..c0f6bb16fa34 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> @@ -46,6 +46,12 @@ properties:
>            - allwinner,sun50i-h6-tcon-tv
>          - const: allwinner,sun8i-a83t-tcon-tv
>
> +      - items:
> +        - enum:
> +          - allwinner,sun7i-a20-tcon0
> +          - allwinner,sun7i-a20-tcon1
> +        - const: allwinner,sun7i-a20-tcon
> +
>    reg:
>      maxItems: 1

It wasn't ordered propertly, I've fixed it up while applying

Maxime

--j2564guncf3jyy2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXk7A3gAKCRDj7w1vZxhR
xfwVAP9fqMR6S5QNlK723niU/vA0ow7ntEjfO/d+1F6+P/qUHgEA8pTIZG3N0KC4
EDlYflE0dcgyudMkCjaHcAa7PgUxPAY=
=41w8
-----END PGP SIGNATURE-----

--j2564guncf3jyy2w--

--===============1072176780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1072176780==--
