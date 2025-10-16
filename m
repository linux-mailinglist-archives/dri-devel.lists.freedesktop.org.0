Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D410CBE4414
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D6210EA24;
	Thu, 16 Oct 2025 15:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p9RZ2NKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9DD10EA24
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 15:33:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3184E4A15B;
 Thu, 16 Oct 2025 15:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF41C2BC86;
 Thu, 16 Oct 2025 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760628786;
 bh=9w4ldvS/v8mZpOqFATR9RwRH4Sxmge8BG7AOwopND6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p9RZ2NKDfomcr6Rsn1H0XWisSH8fUmiWTbcVtNBnEpNN9VRa42AGUzhrb1rClvZP7
 NQDvxrdL0EJXxGaS+4O2UcaApQ7G/YrFg+BVFBKeDjakZFOx6V4ghTSNXKNTRVCISn
 hmH2W60TBUQTg0U0Hpw18I7HMr07wUWh4eHjCxJbvt9Ve8qt9l0erJqe6fheoOI01e
 VlqXyEbQDqkvmlgh3XWCwOT6d/UPo/MkHBc0nyvQjGaUJaILFvwNJ/E8zJeuOKEu73
 i0d9M5pmsTcaVIasZr5FvXEfErNHzH8zfp3CAHjOJLgaMPaAzuxfH9XxG07GabFZbP
 PJ/POwOHJNwYw==
Date: Thu, 16 Oct 2025 16:33:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add Tianma
 TL121BVMS07-00 panel
Message-ID: <20251016-coke-viability-3caac4bc9d9d@spud>
References: <20251016095043.1694736-1-yelangyan@huaqin.corp-partner.google.com>
 <20251016095043.1694736-2-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="A13/o+hd7ASE21iW"
Content-Disposition: inline
In-Reply-To: <20251016095043.1694736-2-yelangyan@huaqin.corp-partner.google.com>
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


--A13/o+hd7ASE21iW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 05:50:42PM +0800, Langyan Ye wrote:
> Add device tree bindings for the Tianma TL121BVMS07-00 12.1-inch
> MIPI-DSI TFT LCD panel. The panel is based on the Ilitek IL79900A
> controller.
>=20
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  .../display/panel/ilitek,il79900a.yaml        | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilite=
k,il79900a.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,il799=
00a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.=
yaml
> new file mode 100644
> index 000000000000..4e3c5afd4584
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/ilitek,il79900a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek IL79900a based MIPI-DSI panels
> +
> +maintainers:
> +  - Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - tianma,il79900a

Per the commit message, this is for a "Tianma TL121BVMS07-00 12.1-inch
MIPI-DSI TFT LCD panel". The compatible you've chosen looks like a
copy-paste mistake. Please change it to match the name of the device.

> +      - const: ilitek,il79900a
> +
> +  reg: true

Missing constraints here, right? Unlike backlight, panel-common.yaml
doesn't define this property.

pw-bot: changes-requested

> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for the enable pin
> +
> +  avdd-supply:
> +    description: Positive analog voltage supply (AVDD)
> +
> +  avee-supply:
> +    description: Negative analog voltage supply (AVEE)
> +
> +  pp1800-supply:
> +    description: 1.8V logic voltage supply
> +
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - avdd-supply
> +  - avee-supply
> +  - pp1800-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel@0 {
> +            compatible =3D "tianma,il79900a", "ilitek,il79900a";
> +            reg =3D <0>;
> +            enable-gpios =3D <&pio 25 0>;
> +            avdd-supply =3D <&reg_avdd>;
> +            avee-supply =3D <&reg_avee>;
> +            pp1800-supply =3D <&reg_pp1800>;
> +            backlight =3D <&backlight>;
> +        };
> +    };
> +
> +...
> --=20
> 2.34.1
>=20

--A13/o+hd7ASE21iW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEQLAAKCRB4tDGHoIJi
0lSjAQCkisR+5hpzHQjyvKPCFV2oOqswv94hlbDoUWI+Sh/32wD9FcRnRoWMLQeH
LsAcmdzr/o6VvU7XZu0fYiogYktyjAQ=
=fU/P
-----END PGP SIGNATURE-----

--A13/o+hd7ASE21iW--
