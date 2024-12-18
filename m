Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCCA9F6001
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 09:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA0E10EAF0;
	Wed, 18 Dec 2024 08:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d9aoecZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1610A10EAF0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 08:21:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4CA0EA41D90;
 Wed, 18 Dec 2024 08:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1FCC4CECE;
 Wed, 18 Dec 2024 08:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734510062;
 bh=Y67UFTQrPnNpxipawqZdos+lVbeXi0ujBQ7g+3GP5+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d9aoecZIumn9o1pSSiNDiYbyXoPMwNUMrowK3ZPZwuTmSP5r8unM9mhwrVE0poApQ
 5nRGqL7llNZonY24T5gPAdaEcxR2QiFBC+CeMCJZyp/9iKYWoMV5xTcWfxS+2ZyLOu
 /HQQLb3bQvEHbFFSmHQ5+Wo4j3V5v2xbAbs2E9LKSfRiwH2wzaC3IXRIGgyEe0m2YP
 2bee3/rkc+swKUahErNARRTJUnLDs5XlfOBd/9TEa1CJEVYnKQtAXMRz0Fw3gRoCr5
 ygs8lQAqIbCHARcAI1hFmYLyOUCNIHYbdWmzP0kxdnFVdujiYwCYteWU2ZgWDEGIg1
 JCI1nYMNr5nhQ==
Date: Wed, 18 Dec 2024 09:20:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, 
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3 07/33] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
Message-ID: <rsnyljmkdf7i74bkrlf5nesp2sa3n6xcnzsqao4znmczjpfyq2@dsakz56s4ypt>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
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

On Tue, Dec 17, 2024 at 04:43:19PM +0100, AngeloGioacchino Del Regno wrote:
> +  i2c:
> +    type: object
> +    $ref: /schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> +    unevaluatedProperties: false
> +    description: HDMI DDC I2C controller
> +
> +  phys:
> +    maxItems: 1
> +    description: PHY providing clocking TMDS and pixel to controller
> +
> +  phy-names:
> +    items:
> +      - const: hdmi
> +
> +  pinctrl-0: true
> +
> +  pinctrl-names:
> +    items:
> +      - const: default

Drop both pinctrl entries.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input port, usually connected to the output port of a DPI
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port that must be connected either to the input port of
> +          a HDMI connector node containing a ddc-i2c-bus, or to the input
> +          port of an attached bridge chip, such as a SlimPort transmitter.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Please keep the same order of things here and in main properties
section.

> +  - interrupts
> +  - power-domains
> +  - phys
> +  - phy-names
> +  - ports
> +

You need allOf: with ref to dai-common.yaml.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        hdmi-tx@1c300000 {

hdmi@

Best regards,
Krzysztof

