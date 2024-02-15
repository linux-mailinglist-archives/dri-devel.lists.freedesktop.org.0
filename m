Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A3C856A8F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806F010EA08;
	Thu, 15 Feb 2024 17:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L19myfkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3233410EA10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 17:07:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8A595CE1C57;
 Thu, 15 Feb 2024 17:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF322C433F1;
 Thu, 15 Feb 2024 17:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708016837;
 bh=2asH+tFhAWjLqNzzIq56m1OL7FiVFPqmNlQQz3tdsas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L19myfkJ+7APjC59ZGBiIdknXGONeEzfarjoEkAg1oerdjcjq4l5UWIGWanIEGw2h
 xdmX3tQE3k+jJiqINDy84QkFyzwq0JQ3i1dl9RNm9ao2BvaFDlYUn7ceTAS3FI+5Wi
 +3arUmcDgX1crlAaobeq8X++sF91VWAGiDiliHfEPnbCzHb65WGqM19dxivq0HOcv3
 pzNT5GCyNyrmtjMMgodD4ERd6RKsH+I8hdZGRS/PoJjGh2TEPlIefhinvYJBwJiaVZ
 K5TrCc8OegbWt9N+P24FYqf9c7zrowuvNBZuJ4lrIGJnCCurhG+T6xqdKG0KyLO1lv
 EJwmvXQWv7Ccw==
Date: Thu, 15 Feb 2024 17:07:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quentin.schulz@theobroma-systems.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 2/2] dt-bindings: display: panel-lvds: Add compatible for
 admatec 9904370 panel
Message-ID: <20240215-deranged-winner-dc7fba991e59@spud>
References: <20240215090442.3513760-1-heiko@sntech.de>
 <20240215090442.3513760-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oPeBBt0zBjLbBxGI"
Content-Disposition: inline
In-Reply-To: <20240215090442.3513760-2-heiko@sntech.de>
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


--oPeBBt0zBjLbBxGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 10:04:42AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> The 9904379 is a 10.1" 1024x600 LVDS display using the standard
> lvds properties.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.y=
aml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index 3fb24393529cd..155d8ffa8f6ef 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -39,6 +39,8 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          # Admatec 9904379 10.1" 1024x600 LVDS panel
> +          - admatec,9904379
>            - auo,b101ew05
>            # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS =
panel
>            - chunghwa,claa070wp03xg
> --=20
> 2.39.2
>=20

--oPeBBt0zBjLbBxGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc5EwAAKCRB4tDGHoIJi
0sGhAQDf55K04Q4/h4RtJu3+GI/+RXj1YCV26C2tngBLGQOQegEA5azUXJRnv+Dl
9zRdCHLcNATb8sne3m0KN7J4cyLfig4=
=zE4Y
-----END PGP SIGNATURE-----

--oPeBBt0zBjLbBxGI--
