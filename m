Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD99494E7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 17:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C70010E14B;
	Tue,  6 Aug 2024 15:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cjtuVZBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7461210E14B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 15:55:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DDA9760FED;
 Tue,  6 Aug 2024 15:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F1EC32786;
 Tue,  6 Aug 2024 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722959743;
 bh=VLWMu+XGaZ9ljsmZ/RYlnVDMaBW8pidNKeBxbJItLqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cjtuVZBssb+fJ+eraMrjCPLdD7DVaSzuVlHjqca8Z8M7WYBn+4ZzOek2T/qAWRxCn
 E48kCirswlVS9RkBZYHqFx9CGMm8XRsA77I8NeXNl3h3Nkx/+ZePj6Kas9TW1ZzP6Q
 JloVL2snbcNTftQrYA5vy5ics6aQIPmyUEAFjMi/UZ+FBve2Hi/kJJ2CKitUffYihK
 vtVZBMcM4/UMpq/coSS0VcaB9jIEaXKu2dGbGUinMe9grytxQx1yQJJuFVHbf+WPKW
 wQfoHpPA6X+LNuZyu5vV8d5XOrK56C+dQ9Qp59kCrg/EGKuE8CWvsy8leHbnaqcrBO
 ztiC1xLZrC1tg==
Date: Tue, 6 Aug 2024 16:55:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH 2/4] dt-bindings: display: panel-lvds: Add compatible for
 Jenson BL-JT60050-01A
Message-ID: <20240806-slit-drizzle-f66826c4a75d@spud>
References: <20240806133352.440922-1-frieder@fris.de>
 <20240806133352.440922-3-frieder@fris.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qMNukOARXmC3ZgtK"
Content-Disposition: inline
In-Reply-To: <20240806133352.440922-3-frieder@fris.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qMNukOARXmC3ZgtK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2024 at 03:33:00PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> The Jenson BL-JT60050-01A is a 7" 1024x600 LVDS display.
>=20
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.y=
aml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index 155d8ffa8f6ef..5af2d69300751 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -50,6 +50,8 @@ properties:
>            - hannstar,hsd101pww2
>            # Hydis Technologies 7" WXGA (800x1280) TFT LCD LVDS panel
>            - hydis,hv070wx2-1e0
> +          # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT =
LCD LVDS panel
> +          - jenson,bl-jt60050-01a
>            - tbs,a711-panel
> =20
>        - const: panel-lvds
> --=20
> 2.45.2
>=20

--qMNukOARXmC3ZgtK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrJHeQAKCRB4tDGHoIJi
0uT/AQDZ3oYCjgSl8iA0ZosJw94mLPP8le3GIwiacXplGM09LwEAvrzQHMtQcy3n
o8MCHhrPfEZ67Ng4ZC71UnfjQfSTHgA=
=DsOi
-----END PGP SIGNATURE-----

--qMNukOARXmC3ZgtK--
