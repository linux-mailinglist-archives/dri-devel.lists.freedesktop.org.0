Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D88A842A36
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 17:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E1110EC52;
	Tue, 30 Jan 2024 16:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BA510EC52
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 16:58:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA4AA60EC2;
 Tue, 30 Jan 2024 16:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6336DC433F1;
 Tue, 30 Jan 2024 16:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706633844;
 bh=v6l/aG3NuOvMx+KE2ZGqqEitQ+bqDRcCIoxDPA17aW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tu7noY8c+IFPsiF36V5S+RIPZAWazbwU+INC8AF6IRytGfbOaRgdP7eV7fEuOiSEz
 16MCGGFAXqNUO9HGsKY+D3Xjn5Rj8hjT43PcxjWPI0+Xbe+ZOw+L4hT0Ph8wCiD9nL
 UAwtfzv5hcEZ70A90MokXgfH+U+XfE3nQ2VxJK3DHTa9BXvsgpgJ14atFYZJ9uiOEk
 PVLrjq6oPoc9MXFJmsCJDiDA7UbWdp//B9cFJAUXiP3tfZJV0E8ApKOgcbzDyTkqDv
 bUX05ju+IfdeI1r7ZTkSjzxpx/T8ZfwwXvNXxoPT0n5LXBg6arFB5zsbFSgjF43AEN
 30moqVI0S1kNw==
Date: Tue, 30 Jan 2024 16:57:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma.B@microchip.com
Subject: Re: [PATCH v4 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Message-ID: <20240130-unveiling-subplot-c4ccf0488439@spud>
References: <20240124100019.290120-1-dharma.b@microchip.com>
 <20240124-portal-sputter-f5207ac206ee@spud>
 <6eb0a63e-8619-40d0-b76e-4bcf7094a9ab@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g66pnY2bvE7LgXvi"
Content-Disposition: inline
In-Reply-To: <6eb0a63e-8619-40d0-b76e-4bcf7094a9ab@microchip.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch,
 krzysztof.kozlowski+dt@linaro.org, bbrezillon@kernel.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, lee@kernel.org, Nicolas.Ferre@microchip.com,
 mripard@kernel.org, claudiu.beznea@tuxon.dev, robh+dt@kernel.org,
 thierry.reding@gmail.com, alexandre.belloni@bootlin.com, tzimmermann@suse.de,
 u.kleine-koenig@pengutronix.de, airlied@gmail.com, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--g66pnY2bvE7LgXvi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 06:42:04AM +0000, Dharma.B@microchip.com wrote:
> Hi Conor,
>=20
> On 24/01/24 10:10 pm, Conor Dooley wrote:
> > On Wed, Jan 24, 2024 at 03:30:16PM +0530, Dharma Balasubiramani wrote:
> >> Converted the text bindings to YAML and validated them individually us=
ing following commands
> >>
> >> $ make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bin=
dings/
> >> $ make dtbs_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/
> >>
> >> changelogs are available in respective patches.
> >>
> >> As Sam suggested I'm sending the PWM binding as it is in this patch se=
ries, clean up patch
> >> will be sent as separate patch.
> > Please give discussion on the previous version some time to complete
> > before sending a new one. I've still got questions about the clocks
> > there.
>=20
> Could you please give a green signal to proceed with the v5 patch series=
=20
> with the following changes only in PATCH 3/3?

Didn't we just decide on what to do on the v3 thread yesterday?
Go with that.

> +  clocks:
> +    minItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: periph_clk
> +      - const: sys_clk
> +      - const: slow_clk
> +      - const: lvds_pll_clk
>=20
> >=20
> > Thanks,
> > Conor.
>=20
> --=20
> With Best Regards,
> Dharma B.
>=20

--g66pnY2bvE7LgXvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbkqbgAKCRB4tDGHoIJi
0oiGAQCmzQ3c9h8KMcrP86fszRphmHgkRDFrSIntbabTD/m2HgD/Q3abC7mhzZpR
S4WKR6QUxtxsR7PdbFJQPRjftcEnlwY=
=EK8F
-----END PGP SIGNATURE-----

--g66pnY2bvE7LgXvi--
