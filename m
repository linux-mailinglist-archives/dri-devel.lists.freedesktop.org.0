Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A5B842B73
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 19:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A14F1132B0;
	Tue, 30 Jan 2024 18:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0071132B0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 18:05:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9F15ECE1BC3;
 Tue, 30 Jan 2024 18:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9799DC433F1;
 Tue, 30 Jan 2024 18:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706637918;
 bh=OHFyP+aVZkV7WimrQq/9Ode6oDV20xNJ8JZxFNZOJXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gGv+MwpSdmQpUE4V4KrGsARR0kZl/6LfSla4MYaIOS/7m5dJYsFNCOklV2tWNqPKA
 SqzavLyRXyUwmo0/Uzs2JQLi9E0DnW7G5EAp3VwFxj2za1v2G0c3aVWgAVbhWcRLUg
 fqNhtSPyAoyxgVo+tGYuj898fFG7WRtEG2sKk6Fp1udaVUxjrvOj78sPG32yeHiFn3
 Z0Pdlo7wU+Nwhe8OAjOYuZLOhgz1yr1Fk4NaDOkSoSzcvaUrfbbWw8hX6A5fEzyRJi
 OBlVS5cJtow93FGnk3HZi+Nu0RqrqDPBdqOJcG1fDOqhcWTCYO/5h6ypxItg261KMM
 /gnBErPmEAAvQ==
Date: Tue, 30 Jan 2024 18:05:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1 2/6] dt-bindings: display: rockchip,dw-hdmi: add
 power-domains property
Message-ID: <20240130-crispy-unmatched-afcce4aec17e@spud>
References: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
 <1ba8b40d-005a-4665-afd9-a4eacf3e3031@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2iFecx6ZOPfafH63"
Content-Disposition: inline
In-Reply-To: <1ba8b40d-005a-4665-afd9-a4eacf3e3031@gmail.com>
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


--2iFecx6ZOPfafH63
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 03:57:23PM +0100, Johan Jonker wrote:
> Most Rockchip hdmi nodes are part of a power domain.
> Add a power-domains property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> Fix example.

Just a note, in the future please explain why simply reordering the
properties constitutes "fixing" the example. I figure your intention is
to align with the (new) documentation about property ordering.

Thanks,
Conor.

>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml   | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-hdmi.yaml
> index cd0a42f35f24..6f421740b613 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi=
=2Eyaml
> @@ -94,6 +94,9 @@ properties:
>        - const: default
>        - const: unwedge
>=20
> +  power-domains:
> +    maxItems: 1
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>=20
> @@ -141,16 +144,18 @@ examples:
>      #include <dt-bindings/clock/rk3288-cru.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3288-power.h>
>=20
>      hdmi: hdmi@ff980000 {
>          compatible =3D "rockchip,rk3288-dw-hdmi";
>          reg =3D <0xff980000 0x20000>;
> -        reg-io-width =3D <4>;
> -        ddc-i2c-bus =3D <&i2c5>;
> -        rockchip,grf =3D <&grf>;
>          interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
>          clocks =3D <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
>          clock-names =3D "iahb", "isfr";
> +        ddc-i2c-bus =3D <&i2c5>;
> +        power-domains =3D <&power RK3288_PD_VIO>;
> +        reg-io-width =3D <4>;
> +        rockchip,grf =3D <&grf>;
>=20
>          ports {
>              #address-cells =3D <1>;
> --
> 2.39.2
>=20
>=20

--2iFecx6ZOPfafH63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbk6WQAKCRB4tDGHoIJi
0vTuAP9WxYdzOWJ6nFmWTJinRfGUrrU/M+NVw8FPcWb7jZGUGwEAyMAn+FmqPdNy
c+ri0fW3UOjKkRIGQMzaUxqa0kHx1wo=
=nMOD
-----END PGP SIGNATURE-----

--2iFecx6ZOPfafH63--
