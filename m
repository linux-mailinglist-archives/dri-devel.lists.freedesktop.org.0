Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB68846155
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 20:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DA110E6FF;
	Thu,  1 Feb 2024 19:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TFQ8HPYf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB46210E6FF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 19:47:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4155620F7;
 Thu,  1 Feb 2024 19:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BBBC433F1;
 Thu,  1 Feb 2024 19:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706816840;
 bh=jiEbi8QNujD3qdmkGJ2lzsWGIhAaTaj5nJA5MFhPzIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TFQ8HPYfLUZ9XI/F0aOi4FyO+QDE0GrDcw+xEVqwTRymAhcZ353kD6nFNd0BdJyqR
 yiXGUiNIZMiYjJW/WRivqt5UXGkzNP9fPWRq1B66aZ6IvGHin7KOeuWM79UJz4tAzJ
 JiRS9ooAQkyqelgqNjBWPvmDndxjxyYeNiNxCroc10DIYm/NTIn2cYuu+oERc/DZi6
 wSUe9XkqlLYzvw8mt/twkKtgzYxpxAUq81a4csfopthA00AKcPuTkM15wNREubYQgT
 Vg+J5TAuZug51DQH+0C1Czc6JqOWOag8s0bSLq0yIhyqAWIM4D3snS5M2sg2nVd9/J
 f3wlkV9EzFckA==
Date: Thu, 1 Feb 2024 19:47:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: robh+dt@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 mripard@kernel.org, markyao0591@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: display: rockchip: rockchip, dw-hdmi:
 remove port property
Message-ID: <20240201-raffle-frays-6b5a47faab69@spud>
References: <a493c65e-7cf9-455f-95d5-8c98cad35710@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JSTTUbvKmVnod5va"
Content-Disposition: inline
In-Reply-To: <a493c65e-7cf9-455f-95d5-8c98cad35710@gmail.com>
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


--JSTTUbvKmVnod5va
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 10:14:29PM +0100, Johan Jonker wrote:
> The hdmi-connector nodes are now functional and the new way to model
> hdmi ports nodes with both in and output port subnodes. Unfortunately
> with the conversion to YAML the old method with only an input port node
> was used. Later the new method was also added to the binding.
> A binding must be unambiguously, so remove the old port property
> entirely and make port@0 and port@1 a requirement as all
> upstream dts files are updated as well and because checking
> deprecated stuff is a bit pointless.
> Update the example to avoid use of the removed property.
>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>=20
> Changed V2:
>   rename title from deprecate to remove
>   reword
> ---
>  .../display/rockchip/rockchip,dw-hdmi.yaml    | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-hdmi.yaml
> index 7e59dee15a5f..391c2a7e79de 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi=
=2Eyaml
> @@ -97,8 +97,8 @@ properties:
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>=20
> -    patternProperties:
> -      "^port(@0)?$":
> +    properties:
> +      port@0:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: Input of the DWC HDMI TX
>          properties:
> @@ -108,11 +108,14 @@ properties:
>              description: Connection to the VOPB
>            endpoint@1:
>              description: Connection to the VOPL
> -    properties:
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: Output of the DWC HDMI TX
>=20
> +    required:
> +      - port@0
> +      - port@1
> +
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -147,7 +150,11 @@ examples:
>          clock-names =3D "iahb", "isfr";
>=20
>          ports {
> -            port {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
>                  #address-cells =3D <1>;
>                  #size-cells =3D <0>;
>=20
> @@ -155,11 +162,20 @@ examples:
>                      reg =3D <0>;
>                      remote-endpoint =3D <&vopb_out_hdmi>;
>                  };
> +
>                  hdmi_in_vopl: endpoint@1 {
>                      reg =3D <1>;
>                      remote-endpoint =3D <&vopl_out_hdmi>;
>                  };
>              };
> +
> +            port@1 {
> +                reg =3D <1>;
> +
> +                hdmi_out_con: endpoint {
> +                    remote-endpoint =3D <&hdmi_con_in>;
> +                };
> +            };
>          };
>      };
>=20
> --
> 2.39.2
>=20

--JSTTUbvKmVnod5va
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbv1QgAKCRB4tDGHoIJi
0qLhAP9gtjdsYMXoFDWX44wSIhRtbVkUz0tifEeaurm8VymPqAD/brjU7Mi8vOW3
Mr/QJdIlrf73AZ+4HC3l5fUMhqFzKQM=
=bE0f
-----END PGP SIGNATURE-----

--JSTTUbvKmVnod5va--
