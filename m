Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A205565BF5A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 12:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC9D10E1CF;
	Tue,  3 Jan 2023 11:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7810210E1CF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 11:51:51 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 659896602CE7;
 Tue,  3 Jan 2023 11:51:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672746709;
 bh=6chUOuhMbPwhQBYMQBmnbgN9yec/HXnOChceMVGoqic=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gG9UbXrrgSVeMwXELIxIuwXvRhEU35Fb89KnSK5SmwjjhQ9O3wB7j+BDd3lS8jkhk
 IXgHZgJELX2+QlzUlyCHHifndDkJ/2C1gc/F9rNweTIPXZBgR/cStGIXLdTInfoLBt
 fqAq68aomRHY5F6Agw7R+3syaZLI8BGtsv5gRrLWVFzk/aOzdA/QNPtdMRApVusFr8
 wja6kGf3ePZt9CQfJkUIc1/xZxeB5SrDZ5kqIlna9JDTABicClm3FJzZX0XJIsahmP
 JAvAje3oGDflWCSLKcHLAvKvlArcK3wtj7nt16E5ROG0/Em2+bgbSRcE6Rq7SdWvIW
 i1+Njg4yfhRbQ==
Message-ID: <09f1ca83-c7d5-a186-6fa6-09cdd7a0b9cc@collabora.com>
Date: Tue, 3 Jan 2023 12:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS panel
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren <guoren@kernel.org>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230103064615.5311-4-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 03/01/23 07:46, Aradhya Bhatia ha scritto:
> Dual-link LVDS interfaces have 2 links, with even pixels traveling on
> one link, and odd pixels on the other. These panels are also generic in
> nature, with no documented constraints, much like their single-link
> counterparts, "panel-lvds".
> 
> Add a new compatible, "panel-dual-lvds", and a dt-binding document for
> these panels.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   .../display/panel/panel-dual-lvds.yaml        | 157 ++++++++++++++++++
>   MAINTAINERS                                   |   1 +
>   2 files changed, 158 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> new file mode 100644
> index 000000000000..88a7aa2410be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> @@ -0,0 +1,157 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-dual-lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Dual-Link LVDS Display Panel
> +
> +maintainers:
> +  - Aradhya Bhatia <a-bhatia1@ti.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |
> +  A dual-LVDS interface is a dual-link connection with the even pixels
> +  traveling on one link, and the odd pixels traveling on the other.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/display/lvds.yaml/#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - lincolntech,lcd185-101ct
> +              - microtips,13-101hieb0hf0-s
> +          - const: panel-dual-lvds
> +      - const: panel-dual-lvds
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The sink for first set of LVDS pixels.
> +
> +        properties:
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +
> +          dual-lvds-even-pixels:
> +            type: boolean
> +
> +        oneOf:
> +          - required: [dual-lvds-odd-pixels]

One question: why do we need a "panel-dual-lvds" compatible?
A Dual-LVDS panel is a LVDS panel using two ports, hence still a panel-lvds.

If you're doing this to clearly distinguish, for human readability purposes,
single-link vs dual-link panels, I think that this would still be clear even
if we use panel-lvds alone because dual-link panels, as you wrote in this
binding, does *require* two ports, with "dual-lvds-{odd,even}-pixels" properties.

So... the devicetree node would look like this:

panel {
	compatible = "vendor,panel", "panel-lvds";
	....
	ports {
		port@0 {
			.....
			-> dual-lvds-odd-pixels <-
		}

		port@1 {
			.....
			-> dual-lvds-even-pixels <-
		};
	};
};

> +          - required: [dual-lvds-even-pixels]

...Though, if you expect dual-lvds panels to get other quirks in the future,
that's a whole different story and you may actually need the panel-dual-lvds
compatible.

Regards,
Angelo
