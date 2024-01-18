Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DDB831CB3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 16:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120A310E859;
	Thu, 18 Jan 2024 15:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F0410E84F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 15:40:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6B70F61387;
 Thu, 18 Jan 2024 15:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B13C433C7;
 Thu, 18 Jan 2024 15:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705592422;
 bh=B0JbzjhM5BaOxmyfPcfGKeh0DLRt1nowj3SyUrIVfxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HduugTlSrhzT936r5EfEIhbIuJhdmDk8svGQsU7hxffyxq68q4Zduc66qWY6AE5Yw
 +Iq/+M0U4IFXZcxxJ0x/PzAjXp0INpVnLoTzL+FXcqcQ9y7cIvMz2h/MN6sq/BigSU
 9GyPUsa7ULneyhVUbBJKlGqktlCnpkr1IINOtlmyNZwIFybZgeCEk6qoBehTtSkWcV
 2j89dytolHJxj5ykuwJR4qA9c+FppmFRqP8f0S/7wfiVHILCMdTXyKWsWNI/oHETKh
 tORxBAIguMNqVvDTIojMHKQsdr1nw0mHckZ2GXjYhPKYnOVBZ8hd5BXJptLaObXUyP
 tTMUSg0gFmDUg==
Date: Thu, 18 Jan 2024 15:40:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Message-ID: <20240118-recent-glorified-fd35d72e006e@spud>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-4-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="o+4Qxw6Z8JF2FunJ"
Content-Disposition: inline
In-Reply-To: <20240118092612.117491-4-dharma.b@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 linux4microchip@microchip.com, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--o+4Qxw6Z8JF2FunJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 02:56:12PM +0530, Dharma Balasubiramani wrote:
> Convert the atmel,hlcdc binding to DT schema format.
>=20
> Adjust the clock-names property to clarify that the LCD controller expects
> one of these clocks (either sys_clk or lvds_pll_clk to be present but not
> both) along with the slow_clk and periph_clk. This alignment with the act=
ual
> hardware requirements will enable accurate device tree configuration for
> systems using the HLCDC IP.
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> changelog
> v2 -> v3
> - Rename hlcdc-display-controller and hlcdc-pwm to generic names.
> - Modify the description by removing the unwanted comments and '|'.
> - Modify clock-names simpler.
> v1 -> v2
> - Remove the explicit copyrights.
> - Modify title (not include words like binding/driver).
> - Modify description actually describing the hardware and not the driver.
> - Add details of lvds_pll addition in commit message.
> - Ref endpoint and not endpoint-base.
> - Fix coding style.
> ...
>  .../devicetree/bindings/mfd/atmel,hlcdc.yaml  | 97 +++++++++++++++++++
>  .../devicetree/bindings/mfd/atmel-hlcdc.txt   | 56 -----------
>  2 files changed, 97 insertions(+), 56 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml b/Doc=
umentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> new file mode 100644
> index 000000000000..eccc998ac42c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel's HLCD Controller
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
> +
> +description:
> +  The Atmel HLCDC (HLCD Controller) IP available on Atmel SoCs exposes t=
wo
> +  subdevices, a PWM chip and a Display Controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,at91sam9n12-hlcdc
> +      - atmel,at91sam9x5-hlcdc
> +      - atmel,sama5d2-hlcdc
> +      - atmel,sama5d3-hlcdc
> +      - atmel,sama5d4-hlcdc
> +      - microchip,sam9x60-hlcdc
> +      - microchip,sam9x75-xlcdc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3

Hmm, one thing I probably should have said on the previous version, but
I missed somehow: It would be good to add an items list to the clocks
property here to explain what the 3 clocks are/are used for - especially
since there is additional complexity being added here to use either the
sys or lvds clocks.

Thanks,
Conor.

> +
> +  clock-names:
> +    items:
> +      - const: periph_clk
> +      - enum: [sys_clk, lvds_pll_clk]
> +      - const: slow_clk

--o+4Qxw6Z8JF2FunJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZalGXgAKCRB4tDGHoIJi
0n63APwO3PcryW3m5qmOtCPUmCER5xFofHNE9C4ok35HJXY0RwD/WhbDDGMDO/jO
SfTZ40mYL4OX63fbti7nK939wPrXXAc=
=lFW+
-----END PGP SIGNATURE-----

--o+4Qxw6Z8JF2FunJ--
