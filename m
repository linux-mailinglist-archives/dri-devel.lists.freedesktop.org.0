Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0A4890782
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 18:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343D611235B;
	Thu, 28 Mar 2024 17:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L8Vfn5+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C5711235B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 17:48:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4963161797;
 Thu, 28 Mar 2024 17:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06368C433F1;
 Thu, 28 Mar 2024 17:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711648117;
 bh=PkXCPOm86ikadMRMC2GpqYlvUbxsONVcFOc0IqJSagU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L8Vfn5+7uZ0dU8mLzApQYBxbRr5mb2H3IHJ1SpUeu+jQRUxESXvMTdJWZL7M162Pn
 YjAGmqUnOTjdP2Rf54j8x7xZ9UORKfOeFhw3gLuDqwAvE1OQN9iVjgFS3hfGTSB6TE
 DSC+lp5F6nW7XkkquGibYKWOur/D+QWgtLbiHm7SlzfbMLQhkpkxsS6/bv8LfwIhE8
 wQFla1sxdgYzIxGLNBX7NwTqsvxJ6TrUTry8fdHv8b+yb7fsa03mDBlbxgQOTMaIEk
 z2XBZ5nEyE9jW0zMsWqr7VXy8Atw4ZOfz0i29ETja9Gjto/7GjZ2MjGY9PHy06lV35
 kMd5dPXbOoBDg==
Date: Thu, 28 Mar 2024 17:48:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: simple: Document support for
 Innolux G121XCE-L01
Message-ID: <20240328-riot-oblivion-06fb4440d3d6@spud>
References: <20240328102746.17868-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nAQA5np1luFy9Pfc"
Content-Disposition: inline
In-Reply-To: <20240328102746.17868-1-marex@denx.de>
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


--nAQA5np1luFy9Pfc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 11:27:35AM +0100, Marek Vasut wrote:
> Document support for Innolux CheMei 12" G121XCE-L01 XGA LVDS display.
>=20
> G121XCE-L01 is a Color Active Matrix Liquid Crystal Display composed of
> a TFT LCD panel, a driver circuit, and LED backlight system. The screen
> format is intended to support the 4:3, 1024(H) x 768(V) screen and either
> 262k/16.7M colors (RGB 6-bits or 8-bits) with LED backlight driver circui=
t.
> All input signals are LVDS interface compatible.
>=20
> Documentation [1] and [2] indicate that G121X1-L03 and G121XCE-L01 are
> effectively identical panels, use the former as RGB 6-bits variant and
> document the later as RGB 8-bits variant.
>=20
> [1] https://www.distec.de/fileadmin/pdf/produkte/TFT-Displays/Innolux/G12=
1X1-L03_Datasheet.pdf
> [2] https://www.distec.de/fileadmin/pdf/produkte/TFT-Displays/Innolux/G12=
1XCE-L01_Datasheet.pdf
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index e0f6aa9a025c4..931d98836e121 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -190,6 +190,8 @@ properties:
>        - innolux,g121i1-l01
>          # Innolux Corporation 12.1" G121X1-L03 XGA (1024x768) TFT LCD pa=
nel
>        - innolux,g121x1-l03
> +        # Innolux Corporation 12.1" G121XCE-L01 XGA (1024x768) TFT LCD p=
anel
> +      - innolux,g121xce-l01
>          # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
>        - innolux,n116bca-ea1
>          # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
> --=20
> 2.43.0
>=20

--nAQA5np1luFy9Pfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgWtcAAKCRB4tDGHoIJi
0q1hAQCo84FZjFO3/WGPsL9RV5l7skc5mUedM9L5yr8WP3CuWgD+JOAGLTP0cfYq
VIaaQQ0mPjy/ePnSRbZxPnb+xEg7WQ0=
=gcqt
-----END PGP SIGNATURE-----

--nAQA5np1luFy9Pfc--
