Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD85400DE2
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 06:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EC389B00;
	Sun,  5 Sep 2021 04:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE4489ACC
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:08:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 666BD610CC
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630814905;
 bh=nx4REl+njlNJHlH1/v9GMRsaaP7ckBcrYhFjABgnkng=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q2g2BGZ62s53NMiaXH/ZJe61xO5qSLmughWVM8yoOGudz+e6scyZaMxLPoKxQDxb+
 96EEXXVYlGjwMCLezuSxrabUpU8pNa+Eg97CdxZARwYm29ZerEKEXoTzgXBsgFpCov
 wjR6SWBgJje9BSawCnrFxEeiBqRX880+z4EFTWs3qGw6hgUJdtyUqGW7Gw5CCjDbbj
 A0V/TfBsbqbOo+KiVG8z3/ZXT89T5wKAEyIn2//mZTHneve9A+MViZYkZq59WloZ62
 xeLdXJh9lI/sKw25ZkHJNH+jZF7KgHxHiqGrutA8qCbadAA8ZFY1V7j11hq74THkCB
 IyMI1AIEXQL6g==
Received: by mail-ej1-f44.google.com with SMTP id h9so6357094ejs.4
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Sep 2021 21:08:25 -0700 (PDT)
X-Gm-Message-State: AOAM531Ec2umsyeDOMtn6Blyq3oXb+WwYDQWLIvHPVKxkxylbodwDrSF
 MsdfDiaoIGCg4LcR1KTauMMo/rGAr6sUKsG3nQ==
X-Google-Smtp-Source: ABdhPJwxYaNEbPKWPnNcVS59ebQKG/bEAf/RqCqX3kVO7LT3UOWCF+VnzR6noARawcWJOnNLT4YEcUxhNvjqnISCMAU=
X-Received: by 2002:a17:906:6b96:: with SMTP id
 l22mr7234035ejr.430.1630814903719; 
 Sat, 04 Sep 2021 21:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
 <20210825144833.7757-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20210825144833.7757-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Sep 2021 12:08:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY__zVt48wgaD8-0mOA9XwGGdmPgnynycMapF-cRU58vtbg@mail.gmail.com>
Message-ID: <CAAOTY__zVt48wgaD8-0mOA9XwGGdmPgnynycMapF-cRU58vtbg@mail.gmail.com>
Subject: Re: [PATCH v9 03/14] dt-bindings: mediatek: display: split each block
 to individual yaml
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, fshao@chromium.org, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Jason:

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=882=
5=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8810:48=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> 1. Remove mediatek,dislpay.txt
> 2. Split each display function block to individual yaml file.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> new file mode 100644
> index 000000000000..faa764c12dfc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek display adaptive ambient light processor
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  The mediatek display adaptive ambient light processor, namely AAL,

Mediatek

> +  is responsible for backlight power saving and sunlight visibility impr=
oving.
> +  AAL device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for=
 details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8173-disp-aal
> +      - items:
> +          - enum:
> +              - mediatek,mt2712-disp-aal
> +              - mediatek,mt8183-disp-aal
> +          - enum:
> +              - mediatek,mt8173-disp-aal
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    description: A phandle and PM domain specifier as defined by binding=
s of
> +      the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.
> +
> +  clocks:
> +    items:
> +      - description: AAL Clock
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 argu=
ments defined
> +      in this property, such as phandle of gce, subsys id, register offs=
et and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks register
> +      which is defined in the gce header include/include/dt-bindings/gce=
/<chip>-gce.h.

include/dt-bindings/gce/<chip>-gce.h.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    aal@14015000 {
> +        compatible =3D "mediatek,mt8173-disp-aal";
> +        reg =3D <0 0x14015000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> +        clocks =3D <&mmsys CLK_MM_DISP_AAL>;
> +        mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX 0x5000 0x1000>=
;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> new file mode 100644
> index 000000000000..e848879d755c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,ccorr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek Ddsplay color correction

display

> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  The mediatek display color correction, namely CCORR, reproduces correc=
t color
> +  on panels with different color gamut.
> +  CCORR device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for=
 details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8183-disp-ccorr
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    description: A phandle and PM domain specifier as defined by binding=
s of
> +      the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.
> +
> +  clocks:
> +    items:
> +      - description: CCORR Clock
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 argu=
ments defined
> +      in this property, such as phandle of gce, subsys id, register offs=
et and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks register
> +      which is defined in the gce header include/include/dt-bindings/gce=
/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    ccorr0: ccorr@1400f000 {
> +        compatible =3D "mediatek,mt8183-disp-ccorr";
> +        reg =3D <0 0x1400f000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&spm MT8183_POWER_DOMAIN_DISP>;
> +        clocks =3D <&mmsys CLK_MM_DISP_CCORR0>;
> +        mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0xf000 0x1000>=
;
> +    };

[snip]

> new file mode 100644
> index 000000000000..d2e957cf1c61
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,od.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek display overdirve
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  The mediatek display overdrive, namely OD, increases the transition va=
lues
> +  of pixels between consecutive frames to make LCD rotate faster.
> +  OD device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for=
 details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt2712-disp-od
> +      - items:
> +          - const: mediatek,mt8173-disp-od
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: OVL Clock

OD Clock?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    od@14023000 {
> +        compatible =3D "mediatek,mt8173-disp-od";
> +        reg =3D <0 0x14023000 0 0x1000>;
> +        clocks =3D <&mmsys CLK_MM_DISP_OD>;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,o=
vl-2l.yaml
> new file mode 100644
> index 000000000000..60eb29c79b84
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.=
yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl-2l.yaml=
#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek display overlay 2 layer
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  The mediatek display overlay provides 2 more layer for OVL.
> +  OVL-2L device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8183-disp-ovl-2l
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    description: A phandle and PM domain specifier as defined by binding=
s of
> +      the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.
> +
> +  clocks:
> +    items:
> +      - description: OVL-2L Clock
> +
> +  iommus:
> +    description:
> +      This property should point to the respective IOMMU block with mast=
er port as argument,
> +      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml fo=
r details.
> +
> +  mediatek,larb:
> +    description:
> +      This property should contain a phandle pointing to the local arbit=
er deviceas defined in

devices

> +      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-=
larb.yaml.
> +      It must sort according to the local arbiter index, like larb0, lar=
b1, larb2...
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 32
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 argu=
ments defined
> +      in this property, such as phandle of gce, subsys id, register offs=
et and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks register
> +      which is defined in the gce header include/include/dt-bindings/gce=
/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - clocks
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    ovl_2l0: ovl@14009000 {
> +        compatible =3D "mediatek,mt8183-disp-ovl-2l";
> +        reg =3D <0 0x14009000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&spm MT8183_POWER_DOMAIN_DISP>;
> +        clocks =3D <&mmsys CLK_MM_DISP_OVL0_2L>;
> +        iommus =3D <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
> +        mediatek,larb =3D <&larb0>;
> +        mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0x9000 0x1000>=
;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> new file mode 100644
> index 000000000000..a0c29cd3377a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek display overlay
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  The mediatek display overlay, namely OVL, can do alpha blending from t=
he memory.
> +  OVL device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt2701-disp-ovl
> +      - items:
> +          - const: mediatek,mt8173-disp-ovl
> +      - items:
> +          - const: mediatek,mt8183-disp-ovl
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-disp-ovl
> +              - mediatek,mt2712-disp-ovl
> +          - enum:
> +              - mediatek,mt2701-disp-ovl

Why mediatek,mt8192-disp-ovl disapear?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    description: A phandle and PM domain specifier as defined by binding=
s of
> +      the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.
> +
> +  clocks:
> +    items:
> +      - description: OVL Clock
> +
> +  iommus:
> +    description:
> +      This property should point to the respective IOMMU block with mast=
er port as argument,
> +      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml fo=
r details.
> +
> +  mediatek,larb:
> +    description:
> +      This property should contain a phandle pointing to the local arbit=
er deviceas defined in
> +      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-=
larb.yaml.
> +      It must sort according to the local arbiter index, like larb0, lar=
b1, larb2...
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 32
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 argu=
ments defined
> +      in this property, such as phandle of gce, subsys id, register offs=
et and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks register
> +      which is defined in the gce header include/include/dt-bindings/gce=
/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - clocks
> +  - iommu
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    ovl0: ovl@1400c000 {
> +        compatible =3D "mediatek,mt8173-disp-ovl";
> +        reg =3D <0 0x1400c000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> +        clocks =3D <&mmsys CLK_MM_DISP_OVL0>;
> +        iommus =3D <&iommu M4U_PORT_DISP_OVL0>;
> +        mediatek,larb =3D <&larb0>;
> +        mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0xc000 0x1000>=
;
> +    };
