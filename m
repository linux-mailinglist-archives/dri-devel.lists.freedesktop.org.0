Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B88A408948
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 12:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF656E12B;
	Mon, 13 Sep 2021 10:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [IPv6:2001:888:0:108::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924FF6E12B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:43:49 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id PjK4mY9mDpQdWPjK6m2WBC; Mon, 13 Sep 2021 12:36:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1631529389; bh=ts0p47VDy1RuNtn8qktl3hYi7SGUCH+xhpXXyzEAqtw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=uT8KXGzgjksultoKLa6we++Z5zQLHWwzxQ1lEaWts3V+Qt0LNNuLFKu25NrWVtuZo
 1LjgM6hHryuY3vq86+RddrMjTRLIOGkgo4SfsdiOrUr48cKtu+vNfkx0MjBiwNcpfO
 x6kplKvSIXRoXxHHPc0inP48WEZxdSkXCSqJm8OA8GgCSgu+LIvqbVnp4QM5ZYTn7J
 6MU68wd2j4SMjAOYTSWc5DvNC5MeX1A8pf+1CWNkki8e9D88yU+UdZUnskF6jcxZTb
 x7hQZjC3/LvQLv9qw4W/mb7PL04dcOPrwcCuvqA4xG8KRGj+HQy9zMnX4rlqCMTzEn
 tPbVQ1sl7yM4Q==
Subject: Re: [PATCH v11 22/34] media: dt: bindings: tegra-vde: Convert to
 schema
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210912200832.12312-1-digetx@gmail.com>
 <20210912200832.12312-23-digetx@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0feef7a8-932e-0190-1043-bba7912f9599@xs4all.nl>
Date: Mon, 13 Sep 2021 12:36:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912200832.12312-23-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBdOdOXcUGbOy8OWfAC0zxt/5ZR1EjxHBJ5gYl1f4tGuUDl47qC7VjDg1mAM1PInADc627yzwRlN776HivHd3rTukcU69b8xPC7ACa9E2OCKz91uYxVL
 3pdE4kFomOEJlyK5XDfxdXtkeeBC6mOcEhqdqQwH4Zws8gqXIk0y1SM6A/xR4dq6DXJT7ktzTegdDG2vf69Bf1Inc0nSWgZcbClZjXwBh/6PUzQQyvzHLfsA
 MRCg1hz61XV+l3VOAjxTdsKpAIGBo5kKouuEEKeKcN1jvS8Y8nT2StkOml2QcAp89m6Wk/ljTRQJt50Pf/R0Xpa6GKRLtA+x9Yq2QyyozRGaEmdryuHf2IDp
 Q6SW4rvA5uBRNutfkivCZXigSZU5qHJ5kw750tkFQIIHV4Q1Hgy7BxRlCWLDxS8PfBn9Lp7H+asKVWAphKn3QHcek/YltS/ABCs0FsZ/YxLaK0+MXtijtE8N
 7IoOEhoYPPSuxCJVYRY2UIX6BUYkHxG05T8QxzP2/1OIQgwJfCAP+XbzTGzEjP6pVMvZubLc12lsVJWCTiZdTLStuvHC7VjW/9q0/DSNdZjEcJSwFcQ+5dyU
 0eKCP9Dh5LYZT7DIAVFey8OVjpZ9uaftPAxLqk1JoPg7m9mI9PoDMKZdyopexXSAEkA+hIx7xrEvoftuPWB7pcPk0PvijwpFW0auOy3J3kPh/369Sb87TZNZ
 aPAjyWc0MbC3Mh70ruxm3cUiNK/HT/bmjvtwWG3dOkjR32K9siusAxDnRz9cS4EDVOuoyYuZ13/BO7ElqRAuOx5q0R3emXQu2tGq4Lm3cJIySdIAPOeQHKlC
 Pt/2uJZ1rD/V8hREozP5HWMpb/VDmz2UKrzSUl/oM93MrtwwA5OReojHDK/jBj047YRvvi048iAM+C77MmGajROkXVOkz5zTgmTdgFpLyczCfSLozwWsOB8/
 /WmY+e3vD4ivhhMDYTMT1pKxMCf5o0J9NBATSWpd+8gyniN4r86bss3nC+zossl+DEmHbl9DW37wvlJaoD0uAuclOEZkulWi/mTtMePBwtj9f2qDzfpZ1kJ1
 GMs/9dNnpONv9MRYquVtr/jvyP+/QyoAuPUWqaA14jfh9yQKudX8GRbJ7H3I9R9OnMQUMzEV8DF73tiZK/ez+BpOXxl4QyeKAgjItyGL2Mgf5aO2W51MBFUA
 vcBqz+fImYuWTCXG/ganwWyK78mkW/C/g6Kw1BNFDg8+AQek3w9LKWRqiiYlFGaouizKDG4jvgu0tfNQQRQWEAI27rJZnQmS9XbIySYi3JeHzJsYHbI/eq12
 HB9rl2aipViGOkt0q/AYjTyawB5Sw+66uJO0J7XD9CgnHeRUD9T11P5quyCclU6iI5roRQOJt9rwOjTWp5qC2bm5CYZMtQ4P/nzrPZDQSkLzGV+KgPC0vZzo
 2tBxqWDknYbfj2P6g7YMu8cpLcqf0WxFjGnH8w==
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

On 12/09/2021 22:08, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra video decoder binding to schema.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  .../bindings/media/nvidia,tegra-vde.txt       |  64 -----------
>  .../bindings/media/nvidia,tegra-vde.yaml      | 107 ++++++++++++++++++
>  2 files changed, 107 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
>  create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
> deleted file mode 100644
> index 602169b8aa19..000000000000
> --- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -NVIDIA Tegra Video Decoder Engine
> -
> -Required properties:
> -- compatible : Must contain one of the following values:
> -   - "nvidia,tegra20-vde"
> -   - "nvidia,tegra30-vde"
> -   - "nvidia,tegra114-vde"
> -   - "nvidia,tegra124-vde"
> -   - "nvidia,tegra132-vde"
> -- reg : Must contain an entry for each entry in reg-names.
> -- reg-names : Must include the following entries:
> -  - sxe
> -  - bsev
> -  - mbe
> -  - ppe
> -  - mce
> -  - tfe
> -  - ppb
> -  - vdma
> -  - frameid
> -- iram : Must contain phandle to the mmio-sram device node that represents
> -         IRAM region used by VDE.
> -- interrupts : Must contain an entry for each entry in interrupt-names.
> -- interrupt-names : Must include the following entries:
> -  - sync-token
> -  - bsev
> -  - sxe
> -- clocks : Must include the following entries:
> -  - vde
> -- resets : Must contain an entry for each entry in reset-names.
> -- reset-names : Should include the following entries:
> -  - vde
> -
> -Optional properties:
> -- resets : Must contain an entry for each entry in reset-names.
> -- reset-names : Must include the following entries:
> -  - mc
> -- iommus: Must contain phandle to the IOMMU device node.
> -
> -Example:
> -
> -video-codec@6001a000 {
> -	compatible = "nvidia,tegra20-vde";
> -	reg = <0x6001a000 0x1000 /* Syntax Engine */
> -	       0x6001b000 0x1000 /* Video Bitstream Engine */
> -	       0x6001c000  0x100 /* Macroblock Engine */
> -	       0x6001c200  0x100 /* Post-processing Engine */
> -	       0x6001c400  0x100 /* Motion Compensation Engine */
> -	       0x6001c600  0x100 /* Transform Engine */
> -	       0x6001c800  0x100 /* Pixel prediction block */
> -	       0x6001ca00  0x100 /* Video DMA */
> -	       0x6001d800  0x300 /* Video frame controls */>;
> -	reg-names = "sxe", "bsev", "mbe", "ppe", "mce",
> -		    "tfe", "ppb", "vdma", "frameid";
> -	iram = <&vde_pool>; /* IRAM region */
> -	interrupts = <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>, /* Sync token interrupt */
> -		     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>, /* BSE-V interrupt */
> -		     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
> -	interrupt-names = "sync-token", "bsev", "sxe";
> -	clocks = <&tegra_car TEGRA20_CLK_VDE>;
> -	reset-names = "vde", "mc";
> -	resets = <&tegra_car 61>, <&mc TEGRA20_MC_RESET_VDE>;
> -	iommus = <&mc TEGRA_SWGROUP_VDE>;
> -};
> diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> new file mode 100644
> index 000000000000..3b6c1f031e04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nvidia,tegra-vde.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Video Decoder Engine
> +
> +maintainers:
> +  - Dmitry Osipenko <digetx@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - nvidia,tegra132-vde
> +              - nvidia,tegra124-vde
> +              - nvidia,tegra114-vde
> +              - nvidia,tegra30-vde
> +          - enum:
> +              - nvidia,tegra20-vde
> +      - items:
> +          - const: nvidia,tegra20-vde
> +
> +  reg:
> +    maxItems: 9
> +
> +  reg-names:
> +    items:
> +      - const: sxe
> +      - const: bsev
> +      - const: mbe
> +      - const: ppe
> +      - const: mce
> +      - const: tfe
> +      - const: ppb
> +      - const: vdma
> +      - const: frameid
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: vde
> +      - const: mc
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: sync-token
> +      - const: bsev
> +      - const: sxe
> +
> +  iommus:
> +    maxItems: 1
> +
> +  iram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle of the SRAM MMIO node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - resets
> +  - reset-names
> +  - interrupts
> +  - interrupt-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    video-codec@6001a000 {
> +      compatible = "nvidia,tegra20-vde";
> +      reg = <0x6001a000 0x1000>, /* Syntax Engine */
> +            <0x6001b000 0x1000>, /* Video Bitstream Engine */
> +            <0x6001c000  0x100>, /* Macroblock Engine */
> +            <0x6001c200  0x100>, /* Post-processing Engine */
> +            <0x6001c400  0x100>, /* Motion Compensation Engine */
> +            <0x6001c600  0x100>, /* Transform Engine */
> +            <0x6001c800  0x100>, /* Pixel prediction block */
> +            <0x6001ca00  0x100>, /* Video DMA */
> +            <0x6001d800  0x300>; /* Video frame controls */
> +      reg-names = "sxe", "bsev", "mbe", "ppe", "mce",
> +                  "tfe", "ppb", "vdma", "frameid";
> +      iram = <&iram>; /* IRAM MMIO region */
> +      interrupts = <0  9 4>, /* Sync token */
> +                   <0 10 4>, /* BSE-V */
> +                   <0 12 4>; /* SXE */
> +      interrupt-names = "sync-token", "bsev", "sxe";
> +      clocks = <&clk 61>;
> +      reset-names = "vde", "mc";
> +      resets = <&rst 61>, <&mem 13>;
> +      iommus = <&mem 15>;
> +    };
> 

