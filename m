Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE9771F17C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 20:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3004310E59E;
	Thu,  1 Jun 2023 18:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1B810E0C1
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 18:15:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC2CA648A7;
 Thu,  1 Jun 2023 18:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EB3C433D2;
 Thu,  1 Jun 2023 18:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685643306;
 bh=BT+vGOJPrHx0Z+8fcx0oC3s+z46tF+kKwZcJYsOV+fw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o36oVFmLU2Wu1q9HMvmzFAcs3DkxUKsOOs+rnml0FkqZwt44JlusFYehnv5xwW8Ja
 9cTEiPRE12wWpOt2jYxHXkGvO4LEpv/9US4BfBy/NDtsUQNbc1ka7YFJDq4bZwT1Bl
 s43kJ3taXnkcoMqCGVziv+GgNMikGtYcBZ/joSOEbDDwHlRNUfYl0u4LkyNYzDSAK7
 wvSWK+rymUrN114LHrVlELV5K3LusD2UfJPh4g4R8DoeD6JEKIP8W+U0o8ZgYWggn2
 Sngjon5qCNG72R4sCxfwVTWU74ueQs7llH5W0RaoXAYgNHPwS+RiCDOYvm5mU7JZ9I
 RgKDs9LUM+5xQ==
Date: Thu, 1 Jun 2023 19:15:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH 4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
Message-ID: <20230601-geologic-bolster-72409d4270b4@spud>
References: <20230601170320.2845218-1-dario.binacchi@amarulasolutions.com>
 <20230601170320.2845218-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FrkmRzBBFS1z/3bF"
Content-Disposition: inline
In-Reply-To: <20230601170320.2845218-5-dario.binacchi@amarulasolutions.com>
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
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--FrkmRzBBFS1z/3bF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 07:03:18PM +0200, Dario Binacchi wrote:
> Add compatible to panel-simple for Rocktech Displays Limited
> RK043FN48H 4.3" 480x272 LCD-TFT panel.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>=20
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 01560fe226dd..bd6a92d2b41c 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -280,6 +280,8 @@ properties:
>        - rocktech,rk101ii01d-ct
>          # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
>        - rocktech,rk070er9427
> +        # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
> +      - rocktech,rk043fn48h

I was going to ask why not alphanumerically, but clearly things are not
in that order to begin with =C2=AF\_(=E3=83=84)_/=C2=AF
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>          # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
>        - samsung,atna33xc20
>          # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
> --=20
> 2.32.0
>=20

--FrkmRzBBFS1z/3bF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHjgJAAKCRB4tDGHoIJi
0k89AP9HH1arvvQRctJmZd92CgCawWgeDTcpytwjoIu+/HkAIAEAz1Y7DsZQRLUa
y5PjzVH5Tym/ag5DxXL7tTuotZs/RwA=
=Qkdm
-----END PGP SIGNATURE-----

--FrkmRzBBFS1z/3bF--
