Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A409842B92
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 19:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40754113301;
	Tue, 30 Jan 2024 18:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C0311315B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 18:18:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4C9ECCE1804;
 Tue, 30 Jan 2024 18:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1DDC433C7;
 Tue, 30 Jan 2024 18:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706638734;
 bh=PjrgU25A2IyPMYtXC01U7AtGDTIv3s/p7Yxp4fnNn1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jg5rqK6279YfSzKAR1sZHIUwGBdewBi2js96OhWqlbDh192UiiugY1LcKTFvFPWiY
 xa9/Q9WWBx4OIYBULA8jJ1cUtscgsUnSLfau93NItGxxMf8kbCA9yxDKZHPQ1YYU+W
 WmqDeYDOSDA9MyONG8RfrACX0JcroXhi8aCHu/ZYGxEVTfA+zrvg82zajlIpugPOri
 dL72iJZQ7owNDRpmnmrxWwKZn2ONNv5bpGEPxaKN2TrK+qGRTWKHmPk2/IcdxoRqzZ
 +1MGIeEl2e6HF2Yg1jTfcWFtIFrJqyzq8O7xSEvJDllKzpdMQeuwUjVQIuSvs/voJF
 4x/WGeh3mLu5A==
Date: Tue, 30 Jan 2024 18:18:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: display: rockchip: rockchip, dw-hdmi:
 deprecate port property
Message-ID: <20240130-denim-capacity-e1617595ac9f@spud>
References: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Se7db1/EZ7/Uf0wV"
Content-Disposition: inline
In-Reply-To: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
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
Cc: daniel@ffwll.ch, conor+dt@kernel.org, devicetree@vger.kernel.org,
 tzimmermann@suse.de, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 andy.yan@rock-chips.com, airlied@gmail.com, markyao0591@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Se7db1/EZ7/Uf0wV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 03:55:43PM +0100, Johan Jonker wrote:
> The hdmi-connector nodes are now functional and the new way to model
> hdmi nodes with, so deprecate the port property and

This doesn't really explain what makes having hdmi-connector nodes
replace the usecase for "port".

> make port@0 and
> port@1 a requirement.

Why?

> Also update example.

"Also do x" is a red flag when it comes to commit messages, as it
immediately makes me think that this should be more than one commit.
I'd probably write this as "Update the example to avoid use of the
deprecated property" or something to avoid bad gut reactions.
That's not worth resending for though obviously...

>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../display/rockchip/rockchip,dw-hdmi.yaml    | 27 ++++++++++++++++---
>  1 file changed, 23 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-hdmi.yaml
> index 7e59dee15a5f..cd0a42f35f24 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi=
=2Eyaml
> @@ -97,8 +97,11 @@ properties:
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>=20
> -    patternProperties:
> -      "^port(@0)?$":
> +    properties:
> +      port:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        deprecated: true

This change makes the deprecated property's description incomplete,
since it doesn't cover the endpoints any more. It also doesn't make
port@0 and port mutually exclusive.
I think I'd just be inclined to delete the "port" bit entirely from the
binding if you're not gonna preserve the description of what that
property was meant to be. Otherwise, I'd be doing something like:
@@ -112,6 +112,8 @@ properties:
           endpoint@1:
             description: Connection to the VOPL
     properties:
+      port:
+        deprecated: true
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Output of the DWC HDMI TX

So that the description of the deprecated property is maintained.

Cheers,
Conor.

> +      port@0:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: Input of the DWC HDMI TX
>          properties:
> @@ -108,11 +111,14 @@ properties:
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
> @@ -147,7 +153,11 @@ examples:
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
> @@ -155,11 +165,20 @@ examples:
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

--Se7db1/EZ7/Uf0wV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbk9iAAKCRB4tDGHoIJi
0ov4AQC/D1c0VhrC43ss+Gx+M3QV8KxYk6PBwCzFXmE5ODySRQEA9bUSt6oR5ZHe
QvmugJnjTjCAnylB7d4Ml9YpiJeaEAU=
=pq3u
-----END PGP SIGNATURE-----

--Se7db1/EZ7/Uf0wV--
