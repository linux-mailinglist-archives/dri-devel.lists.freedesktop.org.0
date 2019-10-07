Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756D3CDE36
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 11:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5296E503;
	Mon,  7 Oct 2019 09:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7416E503
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 09:31:25 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FDE32084B;
 Mon,  7 Oct 2019 09:31:24 +0000 (UTC)
Date: Mon, 7 Oct 2019 11:31:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: sun6i-dsi: Add A64 MIPI-DSI
 compatible
Message-ID: <20191007093122.ixrpzvy6ynh6vuir@gilmour>
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
 <20191005141913.22020-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20191005141913.22020-2-jagan@amarulasolutions.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570440685;
 bh=JaINcyQNLKJhhWm6YuBkApUi5w0bmV2v7c3hLArmMVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kd7fdRTlUPPtMG3X4zZBeEJWzSxB41hcUU2JEQL7IbNvkBcpHYYrBAJtWsAKa6WGp
 o3/OJOQ15zc6Czm/5Vy/8FTFe8OoYnnnOUrFHqkTTuuKS9WvKbDptV2MTvy98cIESh
 J2C9xVNo0kNqTdyOo6jlggUMaFXk7uTFHzPV8/vI=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 michael@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1040763028=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1040763028==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hcbxlzriavurqgww"
Content-Disposition: inline


--hcbxlzriavurqgww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 05, 2019 at 07:49:08PM +0530, Jagan Teki wrote:
> The MIPI DSI controller in Allwinner A64 is similar to A33.
>
> But unlike A33, A64 doesn't have DSI_SCLK gating so it is valid
> to with separate compatible for A64 on the same driver.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> index dafc0980c4fa..cfcc84d38084 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> @@ -15,7 +15,9 @@ properties:
>    "#size-cells": true
>
>    compatible:
> -    const: allwinner,sun6i-a31-mipi-dsi
> +    enum:
> +      - const: allwinner,sun6i-a31-mipi-dsi
> +      - const: allwinner,sun50i-a64-mipi-dsi

How did you test this? It will report an error when running the
validation

Maxime

--hcbxlzriavurqgww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZsF6gAKCRDj7w1vZxhR
xecaAP9RqOVF2LeEc8hVaJ7qENbVYYasarhmNzXWXQ/tp03R3gEAt6lJLwS2PUdi
ULmqU8z92Ol9GjvEOXSZB3G08d0G9wg=
=VSAg
-----END PGP SIGNATURE-----

--hcbxlzriavurqgww--

--===============1040763028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1040763028==--
