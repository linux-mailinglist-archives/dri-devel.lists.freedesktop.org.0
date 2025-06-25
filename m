Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4130AE7AAD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1520A10E6AF;
	Wed, 25 Jun 2025 08:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933AE10E6AF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:47:04 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 19A811F00051
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:46:59 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 0FFA7AC7A5B; Wed, 25 Jun 2025 08:46:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id B42DBAC7A56;
 Wed, 25 Jun 2025 08:46:54 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:46:52 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
Message-ID: <aFu3fAMa8KPwjPbX@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eDJzuACllP3V3fib"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
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


--eDJzuACllP3V3fib
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi and thanks for your work!

On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
> lvds, lcd, dsi all shares the same GPIO D bank and lvds0
> data 3 lines and lvds1 pins are missed, add them.

Would it also make sense to submit device-tree pin definitions here?

Thanks!

Paul

> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctr=
l/sunxi/pinctrl-sun50i-a100.c
> index df90c75fb3c5..b97de80ae2f3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> @@ -256,72 +256,84 @@ static const struct sunxi_desc_pin a100_pins[] =3D {
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D12 */
> +		  SUNXI_FUNCTION(0x3, "lvds0"),		/* D3P */
>  		  SUNXI_FUNCTION(0x4, "dsi0"),		/* DP3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 8)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D13 */
> +		  SUNXI_FUNCTION(0x3, "lvds0"),		/* D3N */
>  		  SUNXI_FUNCTION(0x4, "dsi0"),		/* DM3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 9)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D14 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D0P */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 10)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D15 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D0N */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* CLK */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 11)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D18 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D1P */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* MOSI */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 12)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D19 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D1N */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* MISO */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 13)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D20 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D2P */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* TX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 14)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D21 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D2N */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* RX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 15)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D22 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* CKP */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* RTS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 16)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D23 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* CKN */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* CTS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 17)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* CLK */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D3P */
>  		  SUNXI_FUNCTION(0x4, "uart4"),		/* TX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 18)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* DE */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D3N */
>  		  SUNXI_FUNCTION(0x4, "uart4"),		/* RX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 19)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),
>=20
> --=20
> 2.39.5
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--eDJzuACllP3V3fib
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbt3wACgkQhP3B6o/u
lQyEFg//TrQuoq7rBWw2GiGLkr841GKFMfwbOgCvkZ1O7uCpLuCvW5wITVjF4qW8
flSBcs6qcLbz66ZXQS/86ukYfNUAvm1r4vfhJ3Ptf7m3ko5sCrkCNC3jtlukzG+k
Eq4GzElnseT7TosPmjtImNkDjp3u/Vh/pxOdRnUHzi6N7+jGWLvU72LcF6LJKq4d
ftamg9783Xb1QAjNnot6b+fLooAtozg34ftrIe2SE2KXt+U7qeiXtrxNerNAd6Br
Ld34QB2oMk23sar7GQTPgvoJRCiLUNEV3hJexXf/FNHz9OviwE8irhf6BBjNz7eQ
XwnsDeqkt5p2IF/ClwfrlsviI8HRAzqX1G7WDtuPqHTsDm67QJb8LztQ4hAUqpmS
hUjh+BowsXfez8fVAqyp+onplRVK07SebprsBd026Uhb/cG5kBMtg3Z5H+ENCFXg
TDLc46jsp32Mplo6wP3CVFHz0qurThqF6L8XyzIn6VoreU5uX/FRkN8jAuWtmXup
rYNpDSE54yEL5c5P0bO1fLMtwBNKZlHEhgxHlZJCNvxgegJrtXT9hDJfYC0cnCoa
mjeOwFuo2wZziH22TX/5QxhZzUZzOVR0CeMPn+TjJhX/qgTRXwS4DO8RexsKHHm2
u2Fj8LAaR6bglReFWl4F+LKIeo2AswAzTyS6581R7n62JhNuXGk=
=9BCo
-----END PGP SIGNATURE-----

--eDJzuACllP3V3fib--
