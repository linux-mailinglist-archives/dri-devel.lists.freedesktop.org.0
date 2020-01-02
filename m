Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3912E57B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 12:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91036E0B6;
	Thu,  2 Jan 2020 11:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C816E0B6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 11:04:17 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47207215A4;
 Thu,  2 Jan 2020 11:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577963057;
 bh=3LNe3iq4StFtI2iDqoiQdEX5CNmS4n6Pm0K46y0rQn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dVtGJkDM8+eS4K5lHhsXqMDzObmErV/mA0SM43IPLKAiQMWCxyfiXAl7ZN0g9WEK6
 +uBi06ZlcF8DQgbWHRW/MC1034bd9h3uP2mvCBp6xSx1JjII8dpuawFMIrC7kwMABZ
 zIbSjojPzOsg/GnURuFNNHxlK7lPValhQDKlafNI=
Date: Thu, 2 Jan 2020 12:04:15 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 7/9] dt-bindings: sun6i-dsi: Document R40 MIPI-DSI
 controller (w/ A64 fallback)
Message-ID: <20200102110415.rtehrvtq3darfv35@gilmour.lan>
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
 <20191231130528.20669-8-jagan@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20191231130528.20669-8-jagan@amarulasolutions.com>
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
 Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0015847445=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0015847445==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ryvuaned34qshr7z"
Content-Disposition: inline


--ryvuaned34qshr7z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 31, 2019 at 06:35:26PM +0530, Jagan Teki wrote:
> The MIPI DSI controller on Allwinner R40 is similar on
> the one on A64 like doesn't associate any DSI_SCLK gating.
>
> So, add R40 compatible and append A64 compatible as fallback.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - update the binding in new yaml format
>
>  .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml    | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> index d41ecb5e7f7c..138ffb6ae403 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> @@ -15,9 +15,11 @@ properties:
>    "#size-cells": true
>
>    compatible:
> -    enum:
> -      - allwinner,sun6i-a31-mipi-dsi
> -      - allwinner,sun50i-a64-mipi-dsi
> +    oneOf:
> +      - const: allwinner,sun6i-a31-mipi-dsi
> +      - const: allwinner,sun50i-a64-mipi-dsi
> +      - items:
> +          - const: allwinner,sun8i-r40-mipi-dsi

Again, this isn't what you claim it does.

Maxime

--ryvuaned34qshr7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXg3OLwAKCRDj7w1vZxhR
xchiAP93RIGrX3ISxW0q1Z138tIsQSb3kOZXPC1XEawoRlNQHwEAzJ9E6ZE37C7r
7TLlBdK3HIs6GDySKpbjycSin4zM6wc=
=bTyi
-----END PGP SIGNATURE-----

--ryvuaned34qshr7z--

--===============0015847445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0015847445==--
