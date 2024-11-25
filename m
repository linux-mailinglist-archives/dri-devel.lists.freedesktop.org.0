Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D6A9D7C1D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 08:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A770410E38A;
	Mon, 25 Nov 2024 07:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MYFrveyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3224510E389
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 07:45:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E34EA5C54E6;
 Mon, 25 Nov 2024 07:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A65BC4CECE;
 Mon, 25 Nov 2024 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732520749;
 bh=QkmKRQufxVbtOJlGOhCoU0r8+2yxxJyk9PPJcIydGG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MYFrveydLiYRWlAIyh8GYlL0YM9Q896zpfUzgrP0F9/Go8fZEYiUzoU56kg8PVMbI
 c0BolaJeNa1960vBUIJdWNczsAwuU5LjEenBa9nIm0/SHrtDlUGMjs0ASf9Y2QWrbi
 odnBkyNsXl3TUXYUj0aXwkubOMoLldrvbsHk65USwfjW0KoIiZc/H739irmyq9cjsK
 Jp/0N6/JvyJK7ut2EnOqctMa9QNnFqxpIK8EClS/Ro9X7CCRi1BX8TzQJx6jfDhA4b
 Es3cOdNVgtyzREvIT7yFzdZmmMVMlyl54De87aPPHr5dcZwxTVVMwuz9KvqfDHN1mE
 CY9x0i+yy68Ag==
Date: Mon, 25 Nov 2024 08:45:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindgins: display: Add Apple pre-DCP display
 controller bindings
Message-ID: <ksdp54qj55v7igvvcshl6y2cxpmqy7rlsh4xsixpptjn7s7wlu@76ejtq6ytvbp>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
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

On Sun, Nov 24, 2024 at 11:29:24PM +0100, Sasha Finkelstein wrote:
> Add bindings for a secondary display controller present on certain
> Apple laptops.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../bindings/display/apple,display-pipe.yaml       | 59 ++++++++++++++++++++++
>  .../bindings/display/panel/apple,summit.yaml       | 24 +++++++++
>  2 files changed, 83 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/apple,display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,display-pipe.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..bd25ddc6e09dd636c0221c854e594113f6011866
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/apple,display-pipe.yaml

No, use fallback compatible as filename.

> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/apple,display-pipe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple pre-DCP display controller.
> +
> +maintainers:
> +  - asahi@lists.linux.dev
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description: |

Drop |

> +  A secondary display controller used to drive the "touchbar" on certain
> +  Apple laptops.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - "apple,t8112-display-pipe"
> +        - "apple,t8103-display-pipe"
> +      - const: "apple,h7-display-pipe"


This wasn't tested... Drop all quotes. Do you see any file with quotes?
Why doing things entirely different than everyone else?

> +
> +  reg:
> +    minItems: 3

Drop

> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: be
> +      - const: fe
> +      - const: mipi
> +
> +  power-domains: true

List the items instead or maxItems: 1.

> +
> +  interrupts:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: be
> +      - const: fe
> +
> +  iommus: true


maxItems: 1

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +additionalProperties: true

This cannot be true. Must be false.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

This goes before additionalProperties.

Missing example: that's a strong NAK and prove that this could not be
even tested.

Do you see any device schema without example? No. Do not develop things
differently, Apple is not unique, special or exceptional.


> diff --git a/Documentation/devicetree/bindings/display/panel/apple,summit.yaml b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..dc281c1f52c1ed07cc2f7f804dcfd2f3b4239d89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/apple,summit.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple "Summit" display panel.
> +
> +maintainers:
> +  - asahi@lists.linux.dev
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: apple,summit

No, too generic. Panels need much more properties, this is heavily
incomplete. See other panel bindings.

Best regards,
Krzysztof

