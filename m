Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9129B7121BE
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 10:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B701410E7B6;
	Fri, 26 May 2023 08:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9743910E7B6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 08:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1685088161; x=1716624161;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uUPmzyascHDc2Yhbxk2En/+7XKui32hlF6p4eUORT9A=;
 b=1/Sbikoyi6v8UyZ+/7/hzacx3FoNcPXjamzvBFN10WAyOxiyQFTLWE8d
 JTWCqQUZvE2xpASYHmSYLpyK2QQ3aM1fWw0DKQDCBcOgnZjZz4cLtdS4r
 +CX4efaDj/W63sfUyMqI59SA3rOrIBcWGTAaphuSRROMKDHF9zTdj4my7
 v7FxOmRmy7r+q1fUo+FmbIYijNnOR+h623Q1h+s4cDavGdlCzx+h4lJWI
 4sHJEc9/iLb8sM1NIs8uTdKvXHyO8G7wRKfG2pyXl3ER/teDXBfBSQ9fQ
 V1V+unXagmX4hixfmxc+aCuQocWIKlx4gnyzu2yMff4lWX4OARktMzSji Q==;
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
 d="asc'?scan'208";a="154060890"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 May 2023 01:02:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 26 May 2023 01:02:37 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 26 May 2023 01:02:34 -0700
Date: Fri, 26 May 2023 09:02:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] Revert "dt-bindings: bridge: samsung-dsim: Make some
 flags optional"
Message-ID: <20230526-oppressor-cabbie-fd5332dbc2cc@wendy>
References: <20230526-revert-bad-binding-v1-1-67329ad1bd80@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zfNhlKGJu8FDydZQ"
Content-Disposition: inline
In-Reply-To: <20230526-revert-bad-binding-v1-1-67329ad1bd80@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--zfNhlKGJu8FDydZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 09:27:16AM +0200, Neil Armstrong wrote:
> This reverts commit cfaf76d349837f695c8aa6d7077847fec4231fe5 which was ap=
plied
> without review due to a bad tool manipulation.

Is it a dt-binding maintainer review that you are missing on that
patch?

For this one:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml    | 9 +++=
+-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mip=
i-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi=
-dsim.yaml
> index 360fea81f4b6..9f61ebdfefa8 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> @@ -70,9 +70,7 @@ properties:
>    samsung,burst-clock-frequency:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      DSIM high speed burst mode frequency when connected to devices
> -      that support burst mode. If absent, the driver will use the pixel
> -      clock from the attached device or bridge.
> +      DSIM high speed burst mode frequency.
> =20
>    samsung,esc-clock-frequency:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -82,8 +80,7 @@ properties:
>    samsung,pll-clock-frequency:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      DSIM oscillator clock frequency. If absent, the driver will
> -      use the clock frequency of sclk_mipi.
> +      DSIM oscillator clock frequency.
> =20
>    phys:
>      maxItems: 1
> @@ -137,7 +134,9 @@ required:
>    - compatible
>    - interrupts
>    - reg
> +  - samsung,burst-clock-frequency
>    - samsung,esc-clock-frequency
> +  - samsung,pll-clock-frequency
> =20
>  allOf:
>    - $ref: ../dsi-controller.yaml#
>=20
> ---
> base-commit: cfaf76d349837f695c8aa6d7077847fec4231fe5
> change-id: 20230526-revert-bad-binding-f77a3ca96419
>=20
> Best regards,
> --=20
> Neil Armstrong <neil.armstrong@linaro.org>
>=20

--zfNhlKGJu8FDydZQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHBnhAAKCRB4tDGHoIJi
0tj/AP45IR5a9ay/LFvrrvJEvwTQVEmT/6yKORu+4heiuTw+gAEAhlTCczumzNgR
CCuPfSf1QIq9ldlpHQCis7EMHdhUhg0=
=h9HI
-----END PGP SIGNATURE-----

--zfNhlKGJu8FDydZQ--
