Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3E5844588
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 18:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2253710F69C;
	Wed, 31 Jan 2024 17:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE4910F69C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 17:05:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 35A11618BF;
 Wed, 31 Jan 2024 17:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7EDC433C7;
 Wed, 31 Jan 2024 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706720699;
 bh=9YBjQBTUa0AsexR9AXcn+W7TxL4szVC3nEnblkHVLqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mUXtqNz703J4tBh8rmN0JrlkMGOv5LDOfdJdGirHdtn9yFqKgSmiChPIweMFhkr0D
 pbbqYoPCnTmdYCa2wut4tTj6V3vS4NABudZNCWdnJaCJpr/NyVcJ0efIu/1UkHE8bD
 EOoKKrCTnHYTSvfCHXz6mY6qbtZGjOebH4e5PFIxNFNnxEPYGIFOS5tfkBiK2P4s5v
 r86JGoRLqxS/qSolpwLyixZm3o1Iordd+RyB05djV9Z3cmAdyE8vH0yTNsqGugnYnF
 66ERNywfc3bEnjhvd4NZqFYTd1pKhmX1671R3AZrd+OW66LnJgHksndcOSBfnfKfGe
 iIyPdNrJuckzw==
Date: Wed, 31 Jan 2024 17:04:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [linux][PATCH v5 1/3] dt-bindings: display: convert Atmel's
 HLCDC to DT schema
Message-ID: <20240131-buffing-defendant-546bb08a5927@spud>
References: <20240131033523.577450-1-dharma.b@microchip.com>
 <20240131033523.577450-2-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x4Faj0Fmly0DK799"
Content-Disposition: inline
In-Reply-To: <20240131033523.577450-2-dharma.b@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, hari.prasathge@microchip.com, sam@ravnborg.org,
 manikandan.m@microchip.com, lee@kernel.org, u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--x4Faj0Fmly0DK799
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 31, 2024 at 09:05:21AM +0530, Dharma Balasubiramani wrote:
> Convert the existing DT binding to DT schema of the Atmel's HLCDC display
> controller.

I feel like I recall a request to only have a complete example in the
mfd binding but nowhere else.

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +examples:
> +  - |
> +    display-controller {
> +      compatible = "atmel,hlcdc-display-controller";
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb565>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      port@0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0>;
> +
> +        hlcdc_panel_output: endpoint@0 {
> +          reg = <0>;
> +          bus-width = <16>;
> +          remote-endpoint = <&panel_input>;
> +        };
> +      };
> +    };

--x4Faj0Fmly0DK799
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbp9tAAKCRB4tDGHoIJi
0jA8AP9MiGr0thtxbrsJ240AB+1N/ysHZ34FcPCS6PQuuTSivQD9FfOKosMWG1g4
U7rnJqMxAnyYgkQlbQJQ2024xHr5fQ0=
=yRS/
-----END PGP SIGNATURE-----

--x4Faj0Fmly0DK799--
