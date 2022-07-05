Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9934F5677B2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 21:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11B18B4F7;
	Tue,  5 Jul 2022 19:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6407F8B4E8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 19:23:11 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id n7so1510645ioo.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 12:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H5eyFsH62ZCOMR5j44c7qDXl+L0Xiqo5oRXL7/M/n9U=;
 b=y+bkYk7ucbwp/fN4xwQiSv4uN+9fj+1bmf7rmehfUKm8vXNT32rgAJMIwylY0VWITd
 GMR0ZffBD+qH1ht7wMZS3X1x40APMqPjwgcbHpaAjj/RLKQIMULwv7ggtL73MhWvOcra
 b7/YN/HREvrKzjAHPvXU+70iIQPPZ6QY/Cr2D+cUOGcvoC+IcMykPfmYyywJwgZHhtJS
 uvfALMdY3MATNeBgPQI+tEVSSmokD/D4/hUGYaOUlQdP6295WHl+Z2v6otKK1RVDOmNG
 S+b+8AdQjpdJPQzGzVnkB29OpDqsp5YaohlAxcpx5lTqsSYX5WLl9MXbZ/8OxAQzhGek
 ZoGQ==
X-Gm-Message-State: AJIora8rn/90kyrU+nwOuL9qMMg3MrPMuAjLv219AdjiHHvDYbvQDbSa
 1205NiY37FnMJrmLdU6N2A==
X-Google-Smtp-Source: AGRyM1u0fHCnFee1kEPRUg0SqoCFPI8COBha8zPrSVGZ62b76/VvOoRH5cPG5r4Gv3xkb5zkrF1YIg==
X-Received: by 2002:a05:6638:3014:b0:317:9daf:c42c with SMTP id
 r20-20020a056638301400b003179dafc42cmr22147925jak.10.1657048990513; 
 Tue, 05 Jul 2022 12:23:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a6bfd01000000b00675139dbff9sm14725537ioi.48.2022.07.05.12.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 12:23:10 -0700 (PDT)
Received: (nullmailer pid 2477219 invoked by uid 1000);
 Tue, 05 Jul 2022 19:23:07 -0000
Date: Tue, 5 Jul 2022 13:23:07 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 05/14] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Message-ID: <20220705192307.GA2471961-robh@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-6-conor@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701192300.2293643-6-conor@kernel.org>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Dillon Min <dillon.minfei@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, dmaengine@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 01, 2022 at 08:22:51PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 U-Boot port has been using the clocks defined in the
> devicetree to bring up the board's SRAM, but this violates the
> dt-schema. As such, move the clocks to a dedicated node with
> the same compatible string & document it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> new file mode 100644
> index 000000000000..82be32757713
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/canaan,k210-sram.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan K210 SRAM memory controller
> +
> +description: |

Don't need '|'.

> +  The Canaan K210 SRAM memory controller is initialised and programmed by
> +  firmware, but an OS might want to read its registers for error reporting
> +  purposes and to learn about the DRAM topology.

How the OS going to do that? You don't have any way defined to access 
the registers.

Also, where is the SRAM address itself defined?

> +
> +maintainers:
> +  - Conor Dooley <conor@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - canaan,k210-sram
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: sram0 clock
> +      - description: sram1 clock
> +      - description: aisram clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: sram0
> +      - const: sram1
> +      - const: aisram
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/k210-clk.h>
> +    memory-controller {
> +        compatible = "canaan,k210-sram";
> +        clocks = <&sysclk K210_CLK_SRAM0>,
> +                 <&sysclk K210_CLK_SRAM1>,
> +                 <&sysclk K210_CLK_AI>;
> +        clock-names = "sram0", "sram1", "aisram";
> +    };
> -- 
> 2.37.0
> 
> 
