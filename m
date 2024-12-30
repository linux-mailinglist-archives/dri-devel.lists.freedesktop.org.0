Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FDA9FE6D0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 15:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3845E10E1B5;
	Mon, 30 Dec 2024 14:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6739910E1B5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:07:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDE42143D;
 Mon, 30 Dec 2024 06:08:11 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D758B3F59E;
 Mon, 30 Dec 2024 06:07:38 -0800 (PST)
Date: Mon, 30 Dec 2024 14:07:28 +0000
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
Subject: Re: [PATCH RESEND 04/22] dt-bindings: clock: sun8i de2 clock: Add
 a100/a133 compatible
Message-ID: <20241230140728.78629cd3@donnerap.manchester.arm.com>
In-Reply-To: <20241227-a133-display-support-v1-4-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-4-abad35b3579c@linumiz.com>
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

On Fri, 27 Dec 2024 18:30:53 +0530
Parthiban Nallathambi <parthiban@linumiz.com> wrote:

Hi,

> A100/A133 uses one mixer without rotation support, which is same
> as sun8i v3s. Add it with fallback to v3s compatible.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> index 3e00905b66ca..ed038967929b 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> @@ -23,6 +23,7 @@ properties:
>        - const: allwinner,sun8i-h3-de2-clk
>        - const: allwinner,sun8i-v3s-de2-clk
>        - const: allwinner,sun50i-a64-de2-clk
> +      - const: allwinner,sun50i-a100-de2-clk
>        - const: allwinner,sun50i-h5-de2-clk
>        - const: allwinner,sun50i-h6-de3-clk
>        - items:
> @@ -31,6 +32,9 @@ properties:
>        - items:
>            - const: allwinner,sun20i-d1-de2-clk
>            - const: allwinner,sun50i-h5-de2-clk
> +      - items:
> +          - const: allwinner,sun50i-a100-de2-clk
> +          - const: allwinner,sun8i-v3s-de2-clk

Wait, does this add the same compatible string twice, once as a
standalone, once with a fallback? This doesn't look right.

If you positively know already about an incompatibility, just provide the
single string. If you suspect there *might* be something, use the fallback
version for now, and we can revisit that later.

Also please note that the semantics of the fallback is:
"Any driver supporting only the V3s can also support the A100 version of
the clock, as the new device is either fully compatible or a subset of the
old one."

So what would it be then here? The driver patch [16/22] suggests it's
compatible, but that might just cover the part that the Linux driver
implements? If it is compatible, you wouldn't need any change to the
driver code at all, the DT core code takes care of matching the driver
using the fallback.

Cheers,
Andre

>  
>    reg:
>      maxItems: 1
> 

