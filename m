Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4655AA7C1DE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 18:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375D310E0B6;
	Fri,  4 Apr 2025 16:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ULRTN/uZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F5610E0B6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 16:55:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8B6E644FCC;
 Fri,  4 Apr 2025 16:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC06C4CEDD;
 Fri,  4 Apr 2025 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743785743;
 bh=ThNXk6gQmRSG91uTwe+RSVnkgKn9o9HMxBFyge/Vpio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ULRTN/uZrtDIdGK0Npe+J/IFBIzHTvgqz6iAT15uYWKsSOXxe13+WDcf32RPw2DGz
 2qupFztV7yAlvr4Twq9o+Ibw9PxelQdMhITs714Z0FAhvJDiyYS59oyZZPhFGwSNP6
 ia8BVA+4hqmPN2rnjJVqPMaloPNr7M02l7BQA2hH0HS7B3UBrX7z4hDy/GY+ez4btn
 kj10SJ71bWqSkB0k6nlLEhQl/TZeh47PhlqnC1pjCH2anFUwYE1sLDqK6DpD3tztEQ
 M1cvsZDT9UELKrX5lqDmR3kddMeunMWD0xZDQf3Qz+s7J5qafA0lkHmlGSuRq4A5lk
 YVJ2IOSiA/tHw==
Date: Fri, 4 Apr 2025 17:55:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: Add Sitronix ST7571 panel
Message-ID: <20250404-railway-croon-288f2943928d@spud>
References: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
 <20250404-st7571-v2-1-4c78aab9cd5a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qzsnKKKTsOCiJ2gz"
Content-Disposition: inline
In-Reply-To: <20250404-st7571-v2-1-4c78aab9cd5a@gmail.com>
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


--qzsnKKKTsOCiJ2gz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2025 at 03:50:32PM +0200, Marcus Folkesson wrote:
> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  .../bindings/display/sitronix,st7571.yaml          | 73 ++++++++++++++++=
++++++
>  1 file changed, 73 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.ya=
ml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..11575b820c59c5ada427fbb6b=
015c331215c8db6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sitronix,st7571.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sitronix ST7571 Display Panels
> +
> +maintainers:
> +  - Marcus Folkesson <marcus.folkesson@gmail.com>
> +
> +description:
> +  This binding is for display panels using a Sitronix ST7571 controller =
in I2C
> +  mode.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sitronix,st7571
> +
> +  reg: true

You need to constrain this, so maxItems: 1.
Otherwise, seems okay.

--qzsnKKKTsOCiJ2gz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/APCgAKCRB4tDGHoIJi
0jFaAP94txS1od9FB9n4WU+erJN/I8jN9X+7sbHfsWd5TswTLAD/b05lLr3/b6yz
+nYXOZDzWEmbmlxEz43LbhhqbWDX2gA=
=QZbK
-----END PGP SIGNATURE-----

--qzsnKKKTsOCiJ2gz--
