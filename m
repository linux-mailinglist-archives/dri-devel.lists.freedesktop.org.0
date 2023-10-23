Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62C7D3DEE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 19:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B6810E220;
	Mon, 23 Oct 2023 17:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746B210E220
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 17:38:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 829DCCE276B;
 Mon, 23 Oct 2023 17:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5BDC433C7;
 Mon, 23 Oct 2023 17:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698082716;
 bh=eZlZ0RSR8neaBBF+HvzJKthBOQ2i00NRtc83TDbgb/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GZcoCvRUwfcmv7oI3ZoKRQE+hLDNpdANz8/BDEmtdrSB2ioRBIq6ZoJEeGHZTPrQ6
 gnxXS1y2gCKIIOUH86xYNxb6Cw1d0qkGZ6JYlMefFOdOgsiepFUfajPb+0UdftD+ao
 e7EK2ytUx3z+ij79CECne+/7u91MfFH+FZORhv7ytIhrgJPcSFQ8MwD+wAyWV5nbOP
 FqKH0wpAQmjLNmJr84u1AgLEWBQFaKtk+m+dL+bvfW7mCQjhSpwgNHTXV80gLlneKT
 1nhCgO0oxC5wcJMmyCa1r/z2anONnpe0U+eedfEA7GRxCX1i7O3rvm7G66ryiZ3gCP
 B4q/ik75qZn6A==
Date: Mon, 23 Oct 2023 18:38:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 11/18] dt-bindings: pwm: add power-domains property
Message-ID: <20231023-oppose-tamper-36d526ece102@spud>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-11-5c860ed5c33b@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cS4xr49HXM/FpVea"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v1-11-5c860ed5c33b@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, linux-pwm@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cS4xr49HXM/FpVea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Mon, Oct 23, 2023 at 04:40:11PM +0200, Alexandre Mergnat wrote:
> According to the Mediatek datasheet, the display PWM block has a power
> domain.

Datasheet for which soc? The mt8173? Is it valid for all devices in this
binding?

Cheers,
Conor.

>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml=
 b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index 153e146df7d4..efe0cacf55b7 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -53,6 +53,12 @@ properties:
>        - const: main
>        - const: mm
> =20
> +  power-domains:
> +    maxItems: 1
> +    description: A phandle and PM domain specifier as defined by binding=
s of
> +      the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.
> +
>  required:
>    - compatible
>    - reg
> @@ -67,6 +73,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/mt8173-clk.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> =20
>      pwm0: pwm@1401e000 {
>          compatible =3D "mediatek,mt8173-disp-pwm";
> @@ -75,4 +82,5 @@ examples:
>          clocks =3D <&mmsys CLK_MM_DISP_PWM026M>,
>                   <&mmsys CLK_MM_DISP_PWM0MM>;
>          clock-names =3D "main", "mm";
> +        power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
>      };
>=20
> --=20
> 2.25.1
>=20

--cS4xr49HXM/FpVea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTavlQAKCRB4tDGHoIJi
0v6MAP9Wb3x+52wloDaXjDqYEnoDpprt4+MalmIoclgMkfOMIQEAhpm3TcXRGiJp
BzZXQcz8bAvgaFDyy5KvWovrZlrFSgE=
=4JSZ
-----END PGP SIGNATURE-----

--cS4xr49HXM/FpVea--
