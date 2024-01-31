Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC89844373
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 16:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC0C10FAFE;
	Wed, 31 Jan 2024 15:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F24510FAFE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 15:54:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 07C1561775;
 Wed, 31 Jan 2024 15:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4B8C433C7;
 Wed, 31 Jan 2024 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706716439;
 bh=UniOl+JmqBJs3N7JkzLKxtaT2fSCqC1agl/ADUxyc38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=leXEIIdz8FN/YNq5ERSujskQfEb1FbMhoc3mIHN2GCQa5DU+j4TPkmPaauRiCon9T
 kcBVY9gUICedtjhHgaVU4/cpDjnxrSjNqrRN3RE5thMYSGK+kju05eB+up4SM5QeME
 3NdIRI6il2sj2k3u1oUfSxji/1aHYP7x7SrjrQe3a35GgqxJnDkcFIwAz/ITR4/vsc
 C5w1vbV5ekNaxe5e8pRuUaGsao4WuFzgOuLgyNFy2q1fEPJ3EvRb6UiTsE5NS0Onre
 Qihp0+W8hXfaf/O3LlrEUtKoi2LIzDBBwDLNjS4nlwkn7+xW16gWWyPlc/Oe3niXHa
 +7+wUX3g2aKZg==
Date: Wed, 31 Jan 2024 15:53:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [drm-drm-misc:drm-misc-next v2] dt-bindings: nt35510: document
 'port' property
Message-ID: <20240131-gap-making-59055befaf04@spud>
References: <20240131092852.643844-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OTnjAHXq7E9wBgWK"
Content-Disposition: inline
In-Reply-To: <20240131092852.643844-1-dario.binacchi@amarulasolutions.com>
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
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--OTnjAHXq7E9wBgWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 10:28:44AM +0100, Dario Binacchi wrote:
> Allow 'port' property (coming from panel-common.yaml) to be used in DTS:
>=20
>   st/stm32f769-disco-mb1166-reva09.dtb: panel@0: 'port' does not match an=
y of the regexes: 'pinctrl-[0-9]+'
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


>=20
> ---
>=20
> Changes in v2:
> - Rework the patch to drop errors found by command
>   'make DT_CHECKER_FLAGS=3D-m dt_binding_check'.
>=20
>  .../devicetree/bindings/display/panel/novatek,nt35510.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35=
510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.=
yaml
> index a4afaff483b7..91921f4b0e5f 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> @@ -31,6 +31,7 @@ properties:
>    vddi-supply:
>      description: regulator that supplies the vddi voltage
>    backlight: true
> +  port: true
> =20
>  required:
>    - compatible
> --=20
> 2.43.0
>=20

--OTnjAHXq7E9wBgWK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbptEQAKCRB4tDGHoIJi
0lmqAP9d7CWkSjo5G5rBveppth6+9eZOCItnUiJ1RmQBGMywiwD/WqGtiZfAmocN
H09ibibMntUfs22aOpJVsigqLYtfAA0=
=dN+W
-----END PGP SIGNATURE-----

--OTnjAHXq7E9wBgWK--
