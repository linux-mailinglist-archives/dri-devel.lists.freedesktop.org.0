Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A786D7F657E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF74610E231;
	Thu, 23 Nov 2023 17:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A3210E231
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:33:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C2F8EB82EDB;
 Thu, 23 Nov 2023 17:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EBEC433C7;
 Thu, 23 Nov 2023 17:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700760797;
 bh=woLJ62RYkt7tapNnqeAjaKeIkpTolDbLBY64GCRJz2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pgk6DEGHDHMD30MyZKcpHBIj2e4NiqNJ1+dNjOijT3YblPQbz8okp0NQtHY+MsU5R
 np1mse6z03lV4GlFofmHqkfRwFbF0JxdyaFfmNSwnrA3lTvkqn9b/OBB7zWU1+Bval
 LUAiz9hQO3g4erc5WkUpHpmyHdipBNAkEBUO6WcGj3AtiAOXtAMqGnm6/ldnMlaZVD
 tsnFBJ3XG1tpeBlXpzSJGnnA2ELEtFrwkLjKNFRanWSbInsgGy0d1i1aY9LwA4vang
 ppAnkWikW2OPCEHJiKOJ711+eyMFszHSdwr8hlPOkaKOLGPuS+g1FJ7AXL/XMAmBxG
 dxbDoNUx5LDLw==
Date: Thu, 23 Nov 2023 17:33:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add Evervision
 VGG644804 panel
Message-ID: <20231123-demote-landscape-4f49eea6f274@spud>
References: <20231123102404.2022201-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v/MTmL7bd4PQXEjS"
Content-Disposition: inline
In-Reply-To: <20231123102404.2022201-1-mwalle@kernel.org>
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
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v/MTmL7bd4PQXEjS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 11:24:03AM +0100, Michael Walle wrote:
> Add Evervision VGG644804 5.7" 640x480 LVDS panel compatible string.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 3ec9ee95045f..2471c99a0c96 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -144,6 +144,8 @@ properties:
>        - edt,etmv570g2dhu
>          # E Ink VB3300-KCA
>        - eink,vb3300-kca
> +        # Evervision Electronics Co. Ltd. VGG644804 5.7" VGA TFT LCD Pan=
el
> +      - evervision,vgg644804
>          # Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Pa=
nel
>        - evervision,vgg804821
>          # Foxlink Group 5" WVGA TFT LCD panel
> --=20
> 2.39.2
>=20

--v/MTmL7bd4PQXEjS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+M1wAKCRB4tDGHoIJi
0g5bAP4msuYt8MvmnmtOl4e/iBRX83HejY8bhwJ5ev0kBk7raQD40yYCRbaIBDL3
5u/TjYow9B+aexy90tzKAP86TVJqDA==
=OH5m
-----END PGP SIGNATURE-----

--v/MTmL7bd4PQXEjS--
