Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFED76F82F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 05:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A35210E231;
	Fri,  4 Aug 2023 03:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728FD10E231
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 03:04:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E50CB61F1D;
 Fri,  4 Aug 2023 03:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABD1C433C9;
 Fri,  4 Aug 2023 03:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691118259;
 bh=E5AW+8FOiatGFHegkfNTd5xukRWfVLb/sZxc4H0rl7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AVIIzXBdhWzsRhwMhioiliS0MBfh9cwBNNhxxYv/BsDbMQGrbORvwnGZoQkJkuUC6
 jQE5d2Tn8sweTkUmjFWAlty/QZZo7Pc/bUOZNFXszINiZ347GyHomYCqX8FnF0oYaU
 2YdwABPGTSovU8P5l1uKTi3dWWGbeCTWRXnJPUxxenu/6H6hV49uGd7qhoSvAKymvu
 7zDSTm1LMiTfxagQ1vZEpY1xLoliDZ3G7777HXYEEUMH/DeB6qDRqa/Y4jz+o6Tf3u
 VZs8huE0A/pcX+CpaFGG9QMQZcn4OvFXYmsiVQ8o936T3ZFGA3saPjEnrvtAlo9Vqs
 cJZLDiVGHThkA==
Received: by mercury (Postfix, from userid 1000)
 id 085591061B64; Fri,  4 Aug 2023 05:04:15 +0200 (CEST)
Date: Fri, 4 Aug 2023 05:04:15 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: add rotation property to
 sitronix,st7789v
Message-ID: <20230804030415.yrvbq3kc6r2lj3jc@mercury.elektranox.org>
References: <20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net>
 <20230718-feature-st7789v-v2-3-207cb1baea0f@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jrx2f36fuc4chij4"
Content-Disposition: inline
In-Reply-To: <20230718-feature-st7789v-v2-3-207cb1baea0f@wolfvision.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jrx2f36fuc4chij4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 03, 2023 at 10:13:50PM +0200, Michael Riesch wrote:
> The sitronix-st7789v driver now considers the rotation property.
> Add the property to the documentation.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---

Reviewed-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

>  Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml | =
2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7=
789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789=
v.yaml
> index fa6556363cca..694d7f771d0c 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.ya=
ml
> @@ -22,6 +22,7 @@ properties:
>    power-supply: true
>    backlight: true
>    port: true
> +  rotation: true
> =20
>    spi-cpha: true
>    spi-cpol: true
> @@ -52,6 +53,7 @@ examples:
>              reset-gpios =3D <&pio 6 11 GPIO_ACTIVE_LOW>;
>              backlight =3D <&pwm_bl>;
>              power-supply =3D <&power>;
> +            rotation =3D <180>;
>              spi-max-frequency =3D <100000>;
>              spi-cpol;
>              spi-cpha;
>=20
> --=20
> 2.37.2
>=20

--jrx2f36fuc4chij4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmTMaq4ACgkQ2O7X88g7
+prVHBAAnranxr8+661icCSUonDadVce0QrTh8fLIimhGKFW3nLjk29h77sHwGHO
JuZwJzIOj6uvfLDRFgavN6NT/R+IW1W+cJ4UfgwaXBTvByIK7RtXDq8FtcHJvdxn
0ub3F2PIEu1FXsme6r7kCcDD6vpef7VRCtHcmscv+FghdN8xT+Qj5lDIdNTQ4a/v
z+HKkmxBTf425t7yZDr6drLqf9q6jdSJDib94svyvzANnHX1CzobRFSRChMpODrR
RT52i4WV6hoPTTdHL/l710QG0okd+kiA7PgiKXCEXeDi90nHlriHNFci4XowT+8h
gDoHXYmc5Mj/+bJdL+2SqO/bNeXLOuVlN0IW1I8M3b0tks4HgduPLalYHhyXxL4p
ATKJbCsdO7cLrll4llAaF/1UVDhzdKZnSeTpbMAgm4ix6LZYO3Habgv1AsZZ9/EM
C07imC5o9bxyIfo7KhiP/aOEywZhLYFBiCvCRIWm1x+IeJsiat4Xp9ONjlZVoQQc
X5zf1vYmB5UPFq0F09gjMoFZxk0vC8LTBBrSxJq+FuhPwWtg4HQ4sfydvnC2XTgG
9/ava273kLsmnOwE+vTmapZOmrRhDIYxfRA8w8/akBqVWlRtBsanleKlBxS6hDbb
PBT3R9iuh9BeX1tpXJUIyz/J5d+aEipYg7nsRx0349vOn+/oD5Y=
=qDfw
-----END PGP SIGNATURE-----

--jrx2f36fuc4chij4--
