Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222CC9FD4D1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 14:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AEE10E179;
	Fri, 27 Dec 2024 13:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y8P2gXOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF88010E179
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 13:16:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 14583A4189F;
 Fri, 27 Dec 2024 13:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A3BC4CEDD;
 Fri, 27 Dec 2024 13:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735305407;
 bh=Z7yi+afmx/uhCK7HF/9WlkjMbcxfvg7Jvqse7KgInuc=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=Y8P2gXOnGvjWSR7pppbIn9+uiy3Y9Z0vluLjkcnTQQIn84OguGqJjddlR0L88yLuL
 6V421rGIxpejqKE1L75webWki/DzFlCQVYLG2EEYZUu5aMg7m/bqDDZBCa+9e0gYRc
 GQvakfM4lr1cf5OTDgZLfuizLhngqWC04+vFgSChXzU7C2wkSRI+1Y6TOZu5bddOva
 HpnmhmiemPafHX9z1Btzexlk1nP9OWD4z8Am666h9i+Xn7O6XfbI8llWno+XkcbsLg
 ufOCrrp0ZZ6Vo/+/3GmhHKoAhS02PuJ3f8CVCDc+tmhHOxbt6Qx7e2+DPzz9eMQkOs
 OKmBdYqFoXs3w==
Date: Fri, 27 Dec 2024 07:16:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, 
 Chen-Yu Tsai <wens@csie.org>, Joerg Roedel <joro@8bytes.org>, 
 linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 iommu@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 linux-clk@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>
To: Parthiban Nallathambi <parthiban@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-3-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-3-13b52f71fb14@linumiz.com>
Message-Id: <173530540581.3097883.7476966654699325435.robh@kernel.org>
Subject: Re: [PATCH 03/22] dt-bindings: clock: sun8i de2 clock: Add PLL com
 clock
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


On Fri, 27 Dec 2024 16:37:50 +0530, Parthiban Nallathambi wrote:
> Some platforms like A100/A133 also uses pll-com clock as additional
> clock source for the display clock. This is not documents both in
> user manual and DE 2.0 specification. These changes are mainly from
> vendor BSP.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.example.dtb: clock@1000000: clocks: [[4294967295, 48], [4294967295, 101]] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.example.dtb: clock@1000000: clock-names: ['bus', 'mod'] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.example.dtb: clock@0: clocks: [[4294967295, 52], [4294967295, 99]] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.example.dtb: clock@0: clock-names: ['bus', 'mod'] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241227-a133-display-support-v1-3-13b52f71fb14@linumiz.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

