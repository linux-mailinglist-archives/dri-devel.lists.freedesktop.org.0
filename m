Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131B99FAD1B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 11:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD37710E308;
	Mon, 23 Dec 2024 10:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Lbk/K2LK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83EB10E308
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 10:26:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso4475328e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 02:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734949590; x=1735554390; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LpcAPRrti2Mspwvvh0HkUfdkgM+x6sKmtKugtmBINFQ=;
 b=Lbk/K2LKTccIbVX3NVE1HaaPc1bz7IYUC4PIurhD/tyIJdSS/MCK/GC3uOWpRVMVVE
 BwVnz5ZQxY7m49FeDwXvyCZEF7mdhpoeChkKAI/YUDBvNljZwdNsREY1LFQbZ8KxMLlA
 uBAUAbD8giuvCJYF7STXCREtq6chFhNuqUgWL0UdbZdcoX8bT6C0Pgn3bI6oxmM5j9OC
 2EblHSPSZgeIz8Xk9XrP3pUQnMFqYHGo4PNizq1S/9kpihjVDMVCVbe4qEPuQEQPTIbw
 4Ep9OV4/U8u9SVew6JhErh61Fe1bJBgp3c8NpWJbs0x7Q8jlu/6XcUbLVmgfmu3gWioj
 7YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734949590; x=1735554390;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LpcAPRrti2Mspwvvh0HkUfdkgM+x6sKmtKugtmBINFQ=;
 b=lT3TqvtK1Sp7FbnGNjfBSUjO1k8peQtkIVH47Yc4+DafWMEioY6vpE4DW65mirCxd/
 /kBeI2tgz3XI6oJEMvcuzxNzjYlwmCLwZqVPzlCu++h31f3URrgbJXijM7h1a/kgc53b
 cK5woINDwBD9QQ5LL7MK3pLLbgHa2u3k47Mbza6VatFp7r+6IDde13ZdlJyuEObhqqeW
 dPNElwwzHszJ0UZNdZMLLVUE31pYBliCXTMf64QGG0kh1G1eBFIYBWyVwuhxtwvpistf
 FFKfWnIGkPTtQq2nWHa6aP7Kt4eHm560KUVyp8ENQ376wIpd6Z2PFNgFgb8gOMGu/nj3
 Sdpw==
X-Gm-Message-State: AOJu0YyZDq3k3/ocHAnXM/Y5ehtcJOKJkFZ8Y2czSIahQbPIFuesgGJB
 wRTQmAlnXU6leo3Q7Q5LNQmybxt7rmGIjZ0KfwuZk0g+GXxYEIWgOtgoagFiYzg=
X-Gm-Gg: ASbGncsBNEQywe6TNkck56ycnnOaNgxUglhYhkaoCBQ+7zzfKGwZYfm+ZEFkdJUA0Sr
 nDk4yDgYg8rw25UxlNB1kStiU7LV/BczSvjHcnmqQH5pJmVf0/nu0HZ3VX0OO1ooGhfKlJrcNvt
 yS3qL9vJSm2ihQGyihqOZDUMoARe1YM/bN0VvgUJSiXbVuRN2g0uJu/95uZQrwxTvz0wW3pZId8
 c6/hqLjWslylT9fAWt7/1temUtZ7+/2Mepj2sygYJT9xgrUx6O9Ft2nM177wPza4Nl5C2xU7AER
 W0cXbjNSQz37Lzd3FPcrz50jxiIrYx+CSE+5
X-Google-Smtp-Source: AGHT+IFbBpruzFpAgIIU0n0/jwU07GmTaDXBwkrAj3El2zSPjw4bqzUyTtJuARVLHLA0cBnGaJX8lw==
X-Received: by 2002:a05:6512:1044:b0:542:218a:71a with SMTP id
 2adb3069b0e04-5422953ac6bmr3140370e87.26.1734949589912; 
 Mon, 23 Dec 2024 02:26:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5efbsm1241435e87.39.2024.12.23.02.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 02:26:29 -0800 (PST)
Date: Mon, 23 Dec 2024 12:26:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v7 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Message-ID: <kpem2w4wu7ywc5pvbk3ls5hsyttrwcylomzfh567ejlxkymeqd@cujrbfxgrntc>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-4-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-4-victor.liu@nxp.com>
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

On Mon, Dec 23, 2024 at 02:41:31PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing units
> that operate in a display clock domain.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Drop DT alias documentations and add instance numbers to compatible strings.
>   (Rob)
> 
> v6:
> * No change.
> 
> v5:
> * Document aliases.  Drop Rob's previous R-b tag. (Maxime)
> 
> v4:
> * Collect Rob's R-b tag.
> 
> v3:
> * No change.
> 
> v2:
> * Drop fsl,dc-*-id DT properties. (Krzysztof)
> * Drop port property. (Krzysztof)
> * Fix register range sizes in example.
> 
>  .../imx/fsl,imx8qxp-dc-display-engine0.yaml   | 235 ++++++++++++++++++
>  1 file changed, 235 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> new file mode 100644
> index 000000000000..60d1e0a4a5dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> @@ -0,0 +1,235 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qxp Display Controller Display Engine
> +
> +description:
> +  All Processing Units that operate in a display clock domain. Pixel pipeline
> +  is driven by a video timing and cannot be stalled. Implements all display
> +  specific processing.
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qxp-dc-display-engine0
> +      - fsl,imx8qxp-dc-display-engine1

Is there actual difference between engines 0 and 1? If there is none,
why are you artificially adding one here?

> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: top
> +      - const: cfg
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: shdload
> +      - const: framecomplete
> +      - const: seqcomplete
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^dither@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-dither0
> +          - fsl,imx8qxp-dc-dither1
> +
> +  "^framegen@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-framegen0
> +          - fsl,imx8qxp-dc-framegen1
> +
> +  "^gammacor@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-gammacor0
> +          - fsl,imx8qxp-dc-gammacor1
> +
> +  "^matrix@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-matrix0
> +          - fsl,imx8qxp-dc-matrix1
> +
> +  "^signature@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-signature0
> +          - fsl,imx8qxp-dc-signature1
> +
> +  "^tcon@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-tcon0
> +          - fsl,imx8qxp-dc-tcon1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - power-domains
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qxp-dc-display-engine0
> +    then:
> +      patternProperties:
> +        "^dither@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-dither0
> +
> +        "^framegen@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-framegen0
> +
> +        "^gammacor@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-gammacor0
> +
> +        "^matrix@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-matrix0
> +
> +        "^signature@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-signature0
> +
> +        "^tcon@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-tcon0
> +    else:
> +      patternProperties:
> +        "^dither@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-dither1
> +
> +        "^framegen@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-framegen1
> +
> +        "^gammacor@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-gammacor1
> +
> +        "^matrix@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-matrix1
> +
> +        "^signature@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-signature1
> +
> +        "^tcon@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-tcon1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +
> +    display-engine@5618b400 {
> +        compatible = "fsl,imx8qxp-dc-display-engine0";
> +        reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
> +        reg-names = "top", "cfg";
> +        interrupt-parent = <&dc0_intc>;
> +        interrupts = <15>, <16>, <17>;
> +        interrupt-names = "shdload", "framecomplete", "seqcomplete";
> +        power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        framegen@5618b800 {
> +            compatible = "fsl,imx8qxp-dc-framegen0";
> +            reg = <0x5618b800 0x98>;
> +            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
> +            interrupt-parent = <&dc0_intc>;
> +            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
> +            interrupt-names = "int0", "int1", "int2", "int3",
> +                              "primsync_on", "primsync_off",
> +                              "secsync_on", "secsync_off";
> +        };
> +
> +        tcon@5618c800 {
> +            compatible = "fsl,imx8qxp-dc-tcon0";
> +            reg = <0x5618c800 0x588>;
> +
> +            port {
> +                dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
> +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
