Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D889FB9E6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 07:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D75110E457;
	Tue, 24 Dec 2024 06:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zZLYllCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0A810E457
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 06:37:53 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e46c6547266so3960233276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 22:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735022272; x=1735627072; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o1XvnZFs6gULC9u+/TF7lOR4yZnTuNv7QjOSNUS7iok=;
 b=zZLYllCh7WgVPd4RPKvkby6Sqt24pxJOSCnuGdqIfDGp1109coQu0BOwHHDfvPiXRI
 RA1Im/cDzkAyqLsKW7mBic0E3SMFhyLNr3og/vT5rlrceYV4dKia3yBkFj6w0ejAZV96
 Pq7JYW1v4NJ9ECWYBpemjRoPqw5ZkQsjFAz95Eg+il5hcH38+L9E8LNue/y/QwRCQgMo
 mjwV27geDf6k4ajhdeBiEFlgISN84K+JiiUnneWB5Pc1hmR/ayD1DKQN+VZfkhCUVqXt
 h2oTJCfuUi79YBWP97Hr8I0aWylIK3SVvdxmeGcCObBqCqnj36OgfzAN1m16NvmKca8G
 /G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735022272; x=1735627072;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o1XvnZFs6gULC9u+/TF7lOR4yZnTuNv7QjOSNUS7iok=;
 b=SZzL1v99Ht361rARltDXY0XbFtPfyUA5UQIbLbg/wnQ0QymXLkTJVJfqET1M1Vc+we
 NRsZvrcXDLHKlERdlLAB6i+dqcKkQEtWdMxJ2agPrGpVTmHfYzWsClN1Wc0iZBUvY0BO
 ck6CHq/XySu2FsxrFdpPZK6ydxpvOuHBNTRtT1Ruo7P732rKfBCvhXxQMF2ZlvVfNHyz
 tcSs/EblBiPWhaUIlQWewCzMSC6ZCyGjF1eaYaOoAYvWI4674Pl2onoH38N1YvgH07FP
 0CzV+20er69llH+SprnbQ3LyM1Q/4t83voi5hSME9fYZQrDl2KiG8IQtLg9CmRbIT0j3
 ORCA==
X-Gm-Message-State: AOJu0Ywty9ToYw0KU0odPvXlsPUXNnDIdmS6lryb7jVyi/t0983sNJU9
 xrby5vHVQXB0zc9LYtSHZWctMiP9nWL6bXVHucAXhjgea+W75MCciFBJnPhHiN12kKM0vfjgInR
 80EpK1m/3eClqGpEkR/uIMNIoB5j7XSBrVixiTw==
X-Gm-Gg: ASbGncvLSPTfqv5tqBFRdiF+lxLj9QzlAXlLq9/ie6mZR0oUrHXpT0Vx5aDY05rINnT
 cjDgcKPySZrC+GhJdaeMc9wDQ4EERG1x4pyqlA4Ef2NlfcHv4Nitr
X-Google-Smtp-Source: AGHT+IFZ8ke7ALCJ3nOuLTQKsekeJoRs3cJKquLJ733BfXm3xrOprg1bOLqkxV6UJrbJ7rSuBs35FEWCK/hX2TFMd+E=
X-Received: by 2002:a05:690c:7402:b0:6ef:7370:96ee with SMTP id
 00721157ae682-6f3f812055fmr116458157b3.12.1735022271919; Mon, 23 Dec 2024
 22:37:51 -0800 (PST)
MIME-Version: 1.0
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-4-victor.liu@nxp.com>
 <kpem2w4wu7ywc5pvbk3ls5hsyttrwcylomzfh567ejlxkymeqd@cujrbfxgrntc>
 <73c80079-582a-40cb-b9e1-e20fc96fe603@nxp.com>
In-Reply-To: <73c80079-582a-40cb-b9e1-e20fc96fe603@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 08:37:41 +0200
Message-ID: <CAA8EJpqJiiR15Xxw3j+vGPUBYYLgvxuXKeigMGBb4F3w178cfA@mail.gmail.com>
Subject: Re: [PATCH v7 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, aisheng.dong@nxp.com, 
 agx@sigxcpu.org, u.kleine-koenig@baylibre.com, francesco@dolcini.it, 
 frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 24 Dec 2024 at 07:56, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 12/23/2024, Dmitry Baryshkov wrote:
> > On Mon, Dec 23, 2024 at 02:41:31PM +0800, Liu Ying wrote:
> >> i.MX8qxp Display Controller display engine consists of all processing units
> >> that operate in a display clock domain.
> >>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v7:
> >> * Drop DT alias documentations and add instance numbers to compatible strings.
> >>   (Rob)
> >>
> >> v6:
> >> * No change.
> >>
> >> v5:
> >> * Document aliases.  Drop Rob's previous R-b tag. (Maxime)
> >>
> >> v4:
> >> * Collect Rob's R-b tag.
> >>
> >> v3:
> >> * No change.
> >>
> >> v2:
> >> * Drop fsl,dc-*-id DT properties. (Krzysztof)
> >> * Drop port property. (Krzysztof)
> >> * Fix register range sizes in example.
> >>
> >>  .../imx/fsl,imx8qxp-dc-display-engine0.yaml   | 235 ++++++++++++++++++
> >>  1 file changed, 235 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> >> new file mode 100644
> >> index 000000000000..60d1e0a4a5dd
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> >> @@ -0,0 +1,235 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine0.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Freescale i.MX8qxp Display Controller Display Engine
> >> +
> >> +description:
> >> +  All Processing Units that operate in a display clock domain. Pixel pipeline
> >> +  is driven by a video timing and cannot be stalled. Implements all display
> >> +  specific processing.
> >> +
> >> +maintainers:
> >> +  - Liu Ying <victor.liu@nxp.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - fsl,imx8qxp-dc-display-engine0
> >> +      - fsl,imx8qxp-dc-display-engine1
> >
> > Is there actual difference between engines 0 and 1? If there is none,
> > why are you artificially adding one here?
>
> I think engine 0 and 1 have the same HW implementation, but they connect
> to different ExtDsts through FrameGens.  The two compatible strings make
> it possible for an operating system to figure out which engine is which
> by getting the instance numbers from them.

This is about HW description, no OS in place.

>
> If the two engines use a same compatible string, then either 1) use
> DT aliases to get the instance number(as v5/v6 do) or 2) use OF graph to
> describe the connections between FrameGens and ExtDsts.  However, in v6,
> Rob doesn't like 1) because it abuses the aliases which contain the display
> controller instance number, like "dc0-display-engine0"(i.MX8QM SoC has
> two display controllers), and 2) is too complex because all connections
> between internal devices need to be documented with OF graph.  So, I choose
> to use the two compatible strings, like brcm,bcm2835-pixelvalve0.yaml does.
> Thinking about 2) more, maybe the connections between pixel engine and
> display engines need to be documented too, which seems to be more or less
> duplicating the connections between FrameGens and ExtDsts.

3) use IO addresses to determine the block ID. I think this has been
pointed out by somebody else too, not only by me.

>
>                                            CF0/1/4/5
>                            PE               | | | |
>                                             V V V V  primary layer cross bar
>                           +------------------------------------------+
>                           |                                          |
> 4 FUs + (VS4/5 + HS4/5) =>|               LB0/1/2/3                  |
>    secondary layer        |                                          |
>    cross bar              +------------------------------------------+
>                              |          |              |          |
>                              V          V              V          V
>                           +-----+    +-----+        +-----+    +-----+
>                           | ED0 |    | ED4 |        | ED5 |    | ED1 |
>                           +-----+    +-----+        +-----+    +-----+
> -----------------------------|----------|--------------|----------|-------------
>                           content     safety        safety     content
>                           stream0    stream0        stream1    stream1
>                              |          |              |          |
>                              |  DE0     V              V    DE1   |
>                              |       +-----+        +-----+       |
>                               ------>| FG0 |        | FG1 |<------
>                                      +-----+        +-----+
>                                         |              |
>                                         V              V
>                                        ...            ...
>
> >
> >> +
> >> +  reg:
> >> +    maxItems: 2
> >> +
> >> +  reg-names:
> >> +    items:
> >> +      - const: top
> >> +      - const: cfg
> >> +
> >> +  resets:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 3
> >> +
> >> +  interrupt-names:
> >> +    items:
> >> +      - const: shdload
> >> +      - const: framecomplete
> >> +      - const: seqcomplete
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  "#address-cells":
> >> +    const: 1
> >> +
> >> +  "#size-cells":
> >> +    const: 1
> >> +
> >> +  ranges: true
> >> +
> >> +patternProperties:
> >> +  "^dither@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-dither0
> >> +          - fsl,imx8qxp-dc-dither1
> >> +
> >> +  "^framegen@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-framegen0
> >> +          - fsl,imx8qxp-dc-framegen1
> >> +
> >> +  "^gammacor@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-gammacor0
> >> +          - fsl,imx8qxp-dc-gammacor1
> >> +
> >> +  "^matrix@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-matrix0
> >> +          - fsl,imx8qxp-dc-matrix1
> >> +
> >> +  "^signature@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-signature0
> >> +          - fsl,imx8qxp-dc-signature1
> >> +
> >> +  "^tcon@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-tcon0
> >> +          - fsl,imx8qxp-dc-tcon1
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - reg-names
> >> +  - interrupts
> >> +  - interrupt-names
> >> +  - power-domains
> >> +  - "#address-cells"
> >> +  - "#size-cells"
> >> +  - ranges
> >> +
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: fsl,imx8qxp-dc-display-engine0
> >> +    then:
> >> +      patternProperties:
> >> +        "^dither@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-dither0
> >> +
> >> +        "^framegen@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-framegen0
> >> +
> >> +        "^gammacor@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-gammacor0
> >> +
> >> +        "^matrix@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-matrix0
> >> +
> >> +        "^signature@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-signature0
> >> +
> >> +        "^tcon@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-tcon0
> >> +    else:
> >> +      patternProperties:
> >> +        "^dither@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-dither1
> >> +
> >> +        "^framegen@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-framegen1
> >> +
> >> +        "^gammacor@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-gammacor1
> >> +
> >> +        "^matrix@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-matrix1
> >> +
> >> +        "^signature@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-signature1
> >> +
> >> +        "^tcon@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-tcon1
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/imx8-lpcg.h>
> >> +    #include <dt-bindings/firmware/imx/rsrc.h>
> >> +
> >> +    display-engine@5618b400 {
> >> +        compatible = "fsl,imx8qxp-dc-display-engine0";
> >> +        reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
> >> +        reg-names = "top", "cfg";
> >> +        interrupt-parent = <&dc0_intc>;
> >> +        interrupts = <15>, <16>, <17>;
> >> +        interrupt-names = "shdload", "framecomplete", "seqcomplete";
> >> +        power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
> >> +        #address-cells = <1>;
> >> +        #size-cells = <1>;
> >> +        ranges;
> >> +
> >> +        framegen@5618b800 {
> >> +            compatible = "fsl,imx8qxp-dc-framegen0";
> >> +            reg = <0x5618b800 0x98>;
> >> +            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
> >> +            interrupt-parent = <&dc0_intc>;
> >> +            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
> >> +            interrupt-names = "int0", "int1", "int2", "int3",
> >> +                              "primsync_on", "primsync_off",
> >> +                              "secsync_on", "secsync_off";
> >> +        };
> >> +
> >> +        tcon@5618c800 {
> >> +            compatible = "fsl,imx8qxp-dc-tcon0";
> >> +            reg = <0x5618c800 0x588>;
> >> +
> >> +            port {
> >> +                dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
> >> +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
> >> +                };
> >> +            };
> >> +        };
> >> +    };
> >> --
> >> 2.34.1
> >>
> >
>
> --
> Regards,
> Liu Ying



-- 
With best wishes
Dmitry
