Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CB0BC6A4D
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 23:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6F610E8DB;
	Wed,  8 Oct 2025 21:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rW3m53ug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AD110E8DB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 21:11:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C41F4198F;
 Wed,  8 Oct 2025 21:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF188C4CEE7;
 Wed,  8 Oct 2025 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759957890;
 bh=ydFtpo6dhi61s4kQmCQFz/+cR86DGUMPR5XGUXkkB6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rW3m53ugZgeXGhdMiJOyM/Nn4cAr/stSD5us2KKk76NyxJf4CNpfkGw96c+EssgpE
 P4ckMojIWnOxwDBQd/riR8lOK2fn2E4gWCN/+XUEw2hRgZAjRZG0jStHjranbYjRnw
 f/Vb5vLiw3yAPUJqQ8mkE208jFjLiC9HZ/f94BSHJlp17FjajFqIDLWosr+CEMKCNb
 FJWkR+XhRnG8AtywVXx0D8Dmmgsttu60pi6IruHA58tfgQTFE/wCjkyuJxtxMM8APQ
 wa3iNXXOxCopSU8dBgaIbKIEd1r7/FqUanP5eKfXH8Bx4GC5yUl4L1tcocXI6lE1Kk
 /7VHMRJiypVhw==
Date: Wed, 8 Oct 2025 22:11:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
Message-ID: <20251008-safely-reach-9274474a2ec8@spud>
References: <20251008082800.67718-1-clamor95@gmail.com>
 <20251008082800.67718-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t0NOkuCq/S/rhM4m"
Content-Disposition: inline
In-Reply-To: <20251008082800.67718-2-clamor95@gmail.com>
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


--t0NOkuCq/S/rhM4m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 11:27:53AM +0300, Svyatoslav Ryhel wrote:
> LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which it
> clearly is not. Address this by adding the proper schema for this panel.
>=20
> There is only one user of this panel binding in the mainline Linux kernel,
> which is the Nvidia tablet Tegra Note 7. Its panel is broken anyway since
> it cannot initialize properly if the bootloader does not leave a
> pre-initialized panel. It also cannot suspend or re-initialize properly,
> since no DSI configuration is set and it has a loose regulator which
> relies on an always-on property rather than being hooked to the panel
> where it belongs.

I think this is a reasonable justification. For my own enlightenment,
what happens if a new kernel uses the old simple-panel devicetree?

> Tegra Note 7 device tree is adjusted as a part of this series.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++++
>  .../display/panel/panel-simple-dsi.yaml       |  2 -
>  2 files changed, 60 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld=
070wx3.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.=
yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> new file mode 100644
> index 000000000000..0a82cf311452
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#

Could you make the filename match the compatible please?
With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LG Corporation 7" WXGA TFT LCD panel
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: lg,ld070wx3-sl01
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +  vcc-supply: true
> +
> +  backlight: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - vdd-supply
> +  - vcc-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel@0 {
> +            compatible =3D "lg,ld070wx3-sl01";
> +            reg =3D <0>;
> +
> +            vdd-supply =3D <&vdd_3v3_lcd>;
> +            vcc-supply =3D <&vcc_1v8_lcd>;
> +
> +            backlight =3D <&backlight>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint =3D <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-ds=
i.yaml
> index 9b92a05791cc..f9f1e76a810c 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.ya=
ml
> @@ -42,8 +42,6 @@ properties:
>        - kingdisplay,kd097d04
>          # LG ACX467AKM-7 4.95" 1080=D71920 LCD Panel
>        - lg,acx467akm-7
> -        # LG Corporation 7" WXGA TFT LCD panel
> -      - lg,ld070wx3-sl01
>          # LG Corporation 5" HD TFT LCD panel
>        - lg,lh500wx1-sd03
>          # Lincoln LCD197 5" 1080x1920 LCD panel
> --=20
> 2.48.1
>=20

--t0NOkuCq/S/rhM4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaObTfAAKCRB4tDGHoIJi
0sbPAP9ETzchfCEkgEW+0XNFC12oWkarcESlSeMmYHZJP6sHnAD/XuI1z+hb9MER
rys8wD8HxNJLhaDCclO3joS0zYisJQ8=
=DFYj
-----END PGP SIGNATURE-----

--t0NOkuCq/S/rhM4m--
