Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4CD12E577
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 12:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89616E054;
	Thu,  2 Jan 2020 11:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF346E0B6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 11:03:50 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 140F2215A4;
 Thu,  2 Jan 2020 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577963030;
 bh=lyuQwYk6duK7MRRoZwouWCgWYszfADDHUK+QRJ9MmW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9F7Onm8xocF2Q+5nqgcr+BNQIIsFDSMp1mLSNtnpHRUwDXcAn0vdgfxYhKm9z2aY
 LENy+LulhaOZmhM+KRmCYsGpCyY12E6fxwnNKZ78vnSe7EktsiTP5xBhmAKaBztR42
 hAgg9HmVyHQRWAAxwZJ7gJsuBzYGpjHKPq0m3JlI=
Date: Thu, 2 Jan 2020 12:03:47 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 6/9] dt-bindings: sun6i-dsi: Add R40 DPHY compatible
 (w/ A31 fallback)
Message-ID: <20200102110347.v7lsnmmsbp66r3ia@gilmour.lan>
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
 <20191231130528.20669-7-jagan@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20191231130528.20669-7-jagan@amarulasolutions.com>
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
Content-Type: multipart/mixed; boundary="===============1490307251=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1490307251==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5qm5gfldbu2p5gzt"
Content-Disposition: inline


--5qm5gfldbu2p5gzt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 31, 2019 at 06:35:25PM +0530, Jagan Teki wrote:
> The MIPI DSI PHY controller on Allwinner R40 is similar
> on the one on A31.
>
> Add R40 compatible and append A31 compatible as fallback.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - update the binding in new yaml format
>
>  .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> index 8841938050b2..0c283fe79402 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - const: allwinner,sun6i-a31-mipi-dphy
>        - items:
> +          - const: allwinner,sun8i-r40-mipi-dphy
>            - const: allwinner,sun50i-a64-mipi-dphy
>            - const: allwinner,sun6i-a31-mipi-dphy

This isn't doing what you say it does.

Here you're stating that there's two valid values, one that is a
single element allwinner,sun6i-a31-mipi-dphy, and another which is a
list of three elements allwinner,sun8i-r40-mipi-dphy,
allwinner,sun50i-a64-mipi-dphy and allwinner,sun6i-a31-mipi-dphy, in
that order.

Did you run make dtbs_check and dt_bindings_check?

Maxime

--5qm5gfldbu2p5gzt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXg3OEwAKCRDj7w1vZxhR
xYg8AQD+cQIazIyZ31zNcUjJMQLtkQ/R7hrnYDW+zDPmikoO1gEAjLRGNbqfmTOI
GKoV946i+sXeig/aykX9B6o8FpF0cg0=
=rFQC
-----END PGP SIGNATURE-----

--5qm5gfldbu2p5gzt--

--===============1490307251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1490307251==--
