Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F00A10B9F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A132E10E12A;
	Tue, 14 Jan 2025 16:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 97A0B10E12A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:00:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68F4C11FB;
 Tue, 14 Jan 2025 08:01:21 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A3A23F673;
 Tue, 14 Jan 2025 08:00:48 -0800 (PST)
Date: Tue, 14 Jan 2025 16:00:45 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 10/22] pinctrl: sunxi: add missed lvds pins for
 a100/a133
Message-ID: <20250114160045.2baacdaa@donnerap.manchester.arm.com>
In-Reply-To: <20241227-a133-display-support-v1-10-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-10-abad35b3579c@linumiz.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 27 Dec 2024 18:30:59 +0530
Parthiban Nallathambi <parthiban@linumiz.com> wrote:

Hi,

since LinusW wants to pull this already, I gave it a look, despite this
series being not complete.

> lvds, lcd, dsi all shares the same GPIO D bank and lvds0
> data 3 lines and lvds1 pins are missed, add them.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> index df90c75fb3c5..b97de80ae2f3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> @@ -256,72 +256,84 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D12 */
> +		  SUNXI_FUNCTION(0x3, "lvds0"),		/* D3P */

I initially stumbled upon those first two pins being from lvds0, with the
other 8 pins missing for this interface, but then realised that those are
on portD, and we already describe them in this table (above). So those two
were missing all the time.

So having compared these lines to the A133 user manual, I can now say that
they are all correct:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Linus, in contrast to what I originally thought, this patch *is* fine, so
feel free to keep it in your tree.
Sorry for the noise!

Cheers,
Andre

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
> 

