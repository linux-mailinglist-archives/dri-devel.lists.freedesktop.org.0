Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C1A417E5F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 01:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD1E6EE99;
	Fri, 24 Sep 2021 23:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090BA6EE99
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 23:41:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FF6961251
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 23:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632526902;
 bh=H0n/jnqm5KuCuYqKLtzIg5jI1qiuico64G+YimVonrs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kV2+nslr8SnFcxGb6J3pvTGCxpqBndDPEU6ytLnEArU3wyk2WO/F/qy5Qv2HUuQ/w
 X+U2AA+zLBiB6vxD8ZzDPsNNJ/ELjGJs1oSKXFAojI3k3tOxYZEsDI75+cSlO4tI9e
 geMwRgYGrsaXDYohs2TPq06LAHvpG8kdDH3pD3FtoJ000rSA6hEk0fMV3JBpegpZx0
 m4bviXSffB48tXy/9BT2P/y1aMhVggzJtxsqGgA+ZHGC8xrmt40g70psndfszJh+QR
 HMXPNrccESxyDnWS4+F1Sh0wtQqw8DypwRdf1T/K8hk44QTH4pVikCh6Q3IhdfJPl+
 rsi5oDNF0HmcA==
Received: by mail-ed1-f45.google.com with SMTP id bx4so42254620edb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 16:41:42 -0700 (PDT)
X-Gm-Message-State: AOAM5336wj5cymu4SB5ccYhl4FgfbGlpzA1meXvnosuLIeKysN77n+IQ
 oypMyPPWpFrN0de5M6lCYqb5TJhBE6jy9JxlEQ==
X-Google-Smtp-Source: ABdhPJwoDP2zmwC9Fo9OuBxzOgtPV1nW7Ny2YgqQPQF4iae5iG08UKN+eduUeiIrvmiGmmI+yndr+6NfFQw8Nd98IFA=
X-Received: by 2002:a17:907:995a:: with SMTP id
 kl26mr14831744ejc.6.1632526900508; 
 Fri, 24 Sep 2021 16:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Sep 2021 07:41:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-=jjO0kkmFBsSkO4zwFfk+jRL-G0gZ3SGKv3Gq2zseYg@mail.gmail.com>
Message-ID: <CAAOTY_-=jjO0kkmFBsSkO4zwFfk+jRL-G0gZ3SGKv3Gq2zseYg@mail.gmail.com>
Subject: Re: [PATCH v11 03/16] dt-bindings: display: mediatek: disp: split
 each block to individual yaml
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, fshao@chromium.org, 
 Moudy Ho <moudy.ho@mediatek.com>, roy-cw.yeh@mediatek.com, 
 Fabien Parent <fparent@baylibre.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=882=
1=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:52=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> 1. Remove mediatek,dislpay.txt
> 2. Split each display function block to individual yaml file.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        |  79 +++++++
>  .../display/mediatek/mediatek,ccorr.yaml      |  74 ++++++
>  .../display/mediatek/mediatek,color.yaml      |  88 +++++++
>  .../display/mediatek/mediatek,disp.txt        | 219 ------------------
>  .../display/mediatek/mediatek,dither.yaml     |  78 +++++++
>  .../display/mediatek/mediatek,gamma.yaml      |  79 +++++++
>  .../display/mediatek/mediatek,merge.yaml      |  69 ++++++
>  .../display/mediatek/mediatek,mutex.yaml      |  82 +++++++
>  .../display/mediatek/mediatek,od.yaml         |  53 +++++
>  .../display/mediatek/mediatek,ovl-2l.yaml     |  91 ++++++++
>  .../display/mediatek/mediatek,ovl.yaml        | 101 ++++++++
>  .../display/mediatek/mediatek,postmask.yaml   |  72 ++++++
>  .../display/mediatek/mediatek,rdma.yaml       | 118 ++++++++++
>  .../display/mediatek/mediatek,split.yaml      |  58 +++++
>  .../display/mediatek/mediatek,ufoe.yaml       |  61 +++++
>  .../display/mediatek/mediatek,wdma.yaml       |  89 +++++++
>  16 files changed, 1192 insertions(+), 219 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,aal.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,color.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,disp.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,dither.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,gamma.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,merge.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,mutex.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,od.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ovl-2l.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ovl.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,postmask.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,split.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ufoe.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,wdma.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> new file mode 100644
> index 000000000000..92a350ab9722
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display adaptive ambient light processor
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display adaptive ambient light processor, namely AAL,
> +  is responsible for backlight power saving and sunlight visibility impr=
oving.
> +  AAL device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
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
> +              - mediatek,mt8192-disp-aal
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
ments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
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
> index 000000000000..7840e12d4caf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,ccorr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display color correction
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display color correction, namely CCORR, reproduces correct co=
lor
> +  on panels with different color gamut.
> +  CCORR device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8183-disp-ccorr
> +      - items:
> +          - const: mediatek,mt8192-disp-ccorr
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
ments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
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
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> new file mode 100644
> index 000000000000..7a249ba8584c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display color processor
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display color processor, namely COLOR, provides hue, luma and
> +  saturation adjustments to get better picture quality and to have one p=
anel
> +  resemble the other in their output characteristics.
> +  COLOR device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt2701-disp-color
> +      - items:
> +          - const: mediatek,mt8167-disp-color
> +      - items:
> +          - const: mediatek,mt8173-disp-color
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-disp-color
> +              - mediatek,mt2712-disp-color
> +          - enum:
> +              - mediatek,mt2701-disp-color
> +      - items:
> +          - enum:
> +              - mediatek,mt8183-disp-color
> +              - mediatek,mt8192-disp-color
> +          - enum:
> +              - mediatek,mt8173-disp-color
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
> +      - description: COLOR Clock
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 argu=
ments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
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
> +    color0: color@14013000 {
> +        compatible =3D "mediatek,mt8173-disp-color";
> +        reg =3D <0 0x14013000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> +        clocks =3D <&mmsys CLK_MM_DISP_COLOR0>;
> +        mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX 0x3000 0x1000>=
;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp=
.txt
> deleted file mode 100644
> index fbb59c9ddda6..000000000000
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.tx=
t
> +++ /dev/null
> @@ -1,219 +0,0 @@
> -Mediatek display subsystem
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> -
> -The Mediatek display subsystem consists of various DISP function blocks =
in the
> -MMSYS register space. The connections between them can be configured by =
output
> -and input selectors in the MMSYS_CONFIG register space. Pixel clock and =
start
> -of frame signal are distributed to the other function blocks by a DISP_M=
UTEX
> -function block.
> -
> -All DISP device tree nodes must be siblings to the central MMSYS_CONFIG =
node.
> -For a description of the MMSYS_CONFIG binding, see
> -Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt.
> -
> -DISP function blocks
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -A display stream starts at a source function block that reads pixel data=
 from
> -memory and ends with a sink function block that drives pixels on a displ=
ay
> -interface, or writes pixels back to memory. All DISP function blocks hav=
e
> -their own register space, interrupt, and clock gate. The blocks that can
> -access memory additionally have to list the IOMMU and local arbiter they=
 are
> -connected to.
> -
> -For a description of the display interface sink function blocks, see
> -Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt and
> -Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.
> -
> -Required properties (all function blocks):
> -- compatible: "mediatek,<chip>-disp-<function>", one of
> -       "mediatek,<chip>-disp-ovl"              - overlay (4 layers, blen=
ding, csc)
> -       "mediatek,<chip>-disp-ovl-2l"           - overlay (2 layers, blen=
ding, csc)
> -       "mediatek,<chip>-disp-rdma"             - read DMA / line buffer
> -       "mediatek,<chip>-disp-wdma"             - write DMA
> -       "mediatek,<chip>-disp-ccorr"            - color correction
> -       "mediatek,<chip>-disp-color"            - color processor
> -       "mediatek,<chip>-disp-dither"           - dither
> -       "mediatek,<chip>-disp-aal"              - adaptive ambient light =
controller
> -       "mediatek,<chip>-disp-gamma"            - gamma correction
> -       "mediatek,<chip>-disp-merge"            - merge streams from two =
RDMA sources
> -       "mediatek,<chip>-disp-postmask"         - control round corner fo=
r display frame
> -       "mediatek,<chip>-disp-split"            - split stream to two enc=
oders
> -       "mediatek,<chip>-disp-ufoe"             - data compression engine
> -       "mediatek,<chip>-dsi"                   - DSI controller, see med=
iatek,dsi.txt
> -       "mediatek,<chip>-dpi"                   - DPI controller, see med=
iatek,dpi.txt
> -       "mediatek,<chip>-disp-mutex"            - display mutex
> -       "mediatek,<chip>-disp-od"               - overdrive
> -  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173, mt8183=
 and mt8192.
> -- reg: Physical base address and length of the function block register s=
pace
> -- interrupts: The interrupt signal from the function block (required, ex=
cept for
> -  merge and split function blocks).
> -- clocks: device clocks
> -  See Documentation/devicetree/bindings/clock/clock-bindings.txt for det=
ails.
> -  For most function blocks this is just a single clock input. Only the D=
SI and
> -  DPI controller nodes have multiple clock inputs. These are documented =
in
> -  mediatek,dsi.txt and mediatek,dpi.txt, respectively.
> -  An exception is that the mt8183 mutex is always free running with no c=
locks property.
> -
> -Required properties (DMA function blocks):
> -- compatible: Should be one of
> -       "mediatek,<chip>-disp-ovl"
> -       "mediatek,<chip>-disp-rdma"
> -       "mediatek,<chip>-disp-wdma"
> -  the supported chips are mt2701, mt8167 and mt8173.
> -- larb: Should contain a phandle pointing to the local arbiter device as=
 defined
> -  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-l=
arb.yaml
> -- iommus: Should point to the respective IOMMU block with master port as
> -  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.y=
aml
> -  for details.
> -
> -Optional properties (RDMA function blocks):
> -- mediatek,rdma-fifo-size: rdma fifo size may be different even in same =
SOC, add this
> -  property to the corresponding rdma
> -  the value is the Max value which defined in hardware data sheet.
> -  mediatek,rdma-fifo-size of mt8173-rdma0 is 8K
> -  mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
> -  mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
> -
> -Examples:
> -
> -mmsys: clock-controller@14000000 {
> -       compatible =3D "mediatek,mt8173-mmsys", "syscon";
> -       reg =3D <0 0x14000000 0 0x1000>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       #clock-cells =3D <1>;
> -};
> -
> -ovl0: ovl@1400c000 {
> -       compatible =3D "mediatek,mt8173-disp-ovl";
> -       reg =3D <0 0x1400c000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_OVL0>;
> -       iommus =3D <&iommu M4U_PORT_DISP_OVL0>;
> -       mediatek,larb =3D <&larb0>;
> -};
> -
> -ovl1: ovl@1400d000 {
> -       compatible =3D "mediatek,mt8173-disp-ovl";
> -       reg =3D <0 0x1400d000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 181 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_OVL1>;
> -       iommus =3D <&iommu M4U_PORT_DISP_OVL1>;
> -       mediatek,larb =3D <&larb4>;
> -};
> -
> -rdma0: rdma@1400e000 {
> -       compatible =3D "mediatek,mt8173-disp-rdma";
> -       reg =3D <0 0x1400e000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_RDMA0>;
> -       iommus =3D <&iommu M4U_PORT_DISP_RDMA0>;
> -       mediatek,larb =3D <&larb0>;
> -       mediatek,rdma-fifosize =3D <8192>;
> -};
> -
> -rdma1: rdma@1400f000 {
> -       compatible =3D "mediatek,mt8173-disp-rdma";
> -       reg =3D <0 0x1400f000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 183 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_RDMA1>;
> -       iommus =3D <&iommu M4U_PORT_DISP_RDMA1>;
> -       mediatek,larb =3D <&larb4>;
> -};
> -
> -rdma2: rdma@14010000 {
> -       compatible =3D "mediatek,mt8173-disp-rdma";
> -       reg =3D <0 0x14010000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 184 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_RDMA2>;
> -       iommus =3D <&iommu M4U_PORT_DISP_RDMA2>;
> -       mediatek,larb =3D <&larb4>;
> -};
> -
> -wdma0: wdma@14011000 {
> -       compatible =3D "mediatek,mt8173-disp-wdma";
> -       reg =3D <0 0x14011000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_WDMA0>;
> -       iommus =3D <&iommu M4U_PORT_DISP_WDMA0>;
> -       mediatek,larb =3D <&larb0>;
> -};
> -
> -wdma1: wdma@14012000 {
> -       compatible =3D "mediatek,mt8173-disp-wdma";
> -       reg =3D <0 0x14012000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_WDMA1>;
> -       iommus =3D <&iommu M4U_PORT_DISP_WDMA1>;
> -       mediatek,larb =3D <&larb4>;
> -};
> -
> -color0: color@14013000 {
> -       compatible =3D "mediatek,mt8173-disp-color";
> -       reg =3D <0 0x14013000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_COLOR0>;
> -};
> -
> -color1: color@14014000 {
> -       compatible =3D "mediatek,mt8173-disp-color";
> -       reg =3D <0 0x14014000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_COLOR1>;
> -};
> -
> -aal@14015000 {
> -       compatible =3D "mediatek,mt8173-disp-aal";
> -       reg =3D <0 0x14015000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_AAL>;
> -};
> -
> -gamma@14016000 {
> -       compatible =3D "mediatek,mt8173-disp-gamma";
> -       reg =3D <0 0x14016000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_GAMMA>;
> -};
> -
> -ufoe@1401a000 {
> -       compatible =3D "mediatek,mt8173-disp-ufoe";
> -       reg =3D <0 0x1401a000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_UFOE>;
> -};
> -
> -dsi0: dsi@1401b000 {
> -       /* See mediatek,dsi.txt for details */
> -};
> -
> -dpi0: dpi@1401d000 {
> -       /* See mediatek,dpi.txt for details */
> -};
> -
> -mutex: mutex@14020000 {
> -       compatible =3D "mediatek,mt8173-disp-mutex";
> -       reg =3D <0 0x14020000 0 0x1000>;
> -       interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_MUTEX_32K>;
> -};
> -
> -od@14023000 {
> -       compatible =3D "mediatek,mt8173-disp-od";
> -       reg =3D <0 0x14023000 0 0x1000>;
> -       power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> -       clocks =3D <&mmsys CLK_MM_DISP_OD>;
> -};
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,d=
ither.yaml
> new file mode 100644
> index 000000000000..316374315962
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dither.yaml=
#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display dither processor
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display dither processor, namely DITHER, works by approximati=
ng
> +  unavailable colors with available colors and by mixing and matching av=
ailable
> +  colors to mimic unavailable ones.
> +  DITHER device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8183-disp-dither
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-disp-dither
> +          - enum:
> +              - mediatek,mt8183-disp-dither
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
> +      - description: DITHER Clock
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 argu=
ments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
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
> +    dither0: dither@14012000 {
> +        compatible =3D "mediatek,mt8183-disp-dither";
> +        reg =3D <0 0x14012000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&spm MT8183_POWER_DOMAIN_DISP>;
> +        clocks =3D <&mmsys CLK_MM_DISP_DITHER0>;
> +        mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX 0x2000 0x1000>=
;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ga=
mma.yaml
> new file mode 100644
> index 000000000000..1c53ce20a71e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display gamma correction
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display gamma correction, namely GAMMA, provides a nonlinear
> +  operation used to adjust luminance in display system.
> +  GAMMA device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8173-disp-gamma
> +      - items:
> +          - const: mediatek,mt8183-disp-gamma
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-disp-gamma
> +          - enum:
> +              - mediatek,mt8183-disp-gamma
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
> +      - description: GAMMA Clock
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 argu=
ments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
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
> +    gamma@14016000 {
> +        compatible =3D "mediatek,mt8173-disp-gamma";
> +        reg =3D <0 0x14016000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> +        clocks =3D <&mmsys CLK_MM_DISP_GAMMA>;
> +        mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX 0x6000 0x1000>=
;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,me=
rge.yaml
> new file mode 100644
> index 000000000000..75beeb207ceb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,merge.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display merge
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display merge, namely MERGE, is used to merge two slice-per-l=
ine
> +  inputs into one side-by-side output.
> +  MERGE device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8173-disp-merge
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
> +      - description: MERGE Clock
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 argu=
ments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    merge@14017000 {
> +        compatible =3D "mediatek,mt8173-disp-merge";
> +        reg =3D <0 0x14017000 0 0x1000>;
> +        power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
> +        clocks =3D <&mmsys CLK_MM_DISP_MERGE>;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mu=
tex.yaml
> new file mode 100644
> index 000000000000..90f11e12a55e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y=
aml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display mutex
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek mutex, namely MUTEX, is used to send the triggers signals cal=
led
> +  Start Of Frame (SOF) / End Of Frame (EOF) to each sub-modules on the d=
isplay
> +  data path or MDP data path.
> +  In some SoC, such as mt2701, MUTEX could be a hardware mutex which pro=
tects
> +  the shadow register.
> +  MUTEX device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt2701-disp-mutex
> +      - items:
> +          - const: mediatek,mt2712-disp-mutex
> +      - items:
> +          - const: mediatek,mt8167-disp-mutex
> +      - items:
> +          - const: mediatek,mt8173-disp-mutex
> +      - items:
> +          - const: mediatek,mt8183-disp-mutex
> +      - items:
> +          - const: mediatek,mt8192-disp-mutex
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
> +      - description: MUTEX Clock
> +
> +  mediatek,gce-events:
> +    description:
> +      The event id which is mapping to the specific hardware event signa=
l
> +      to gce. The event id is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
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
> +    mutex: mutex@14020000 {
> +        compatible =3D "mediatek,mt8173-disp-mutex";
> +        reg =3D <0 0x14020000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
> +        clocks =3D <&mmsys CLK_MM_MUTEX_32K>;
> +        mediatek,gce-events =3D <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
> +                              <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.ya=
ml
> new file mode 100644
> index 000000000000..7519db315217
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,od.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display overdirve
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display overdrive, namely OD, increases the transition values
> +  of pixels between consecutive frames to make LCD rotate faster.
> +  OD device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
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
> +      - description: OD Clock
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
> index 000000000000..a10c6ce92dad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.=
yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl-2l.yaml=
#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display overlay 2 layer
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display overlay 2 layer, namely OVL-2L, provides 2 more layer
> +  for OVL.
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
> +      - items:
> +          - const: mediatek,mt8192-disp-ovl-2l
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
er devices defined in
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
ments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
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
> index 000000000000..50552428150f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display overlay
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display overlay, namely OVL, can do alpha blending from
> +  the memory.
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
> +          - const: mediatek,mt8192-disp-ovl
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-disp-ovl
> +              - mediatek,mt2712-disp-ovl
> +          - enum:
> +              - mediatek,mt2701-disp-ovl
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
er devices defined in
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
ments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
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
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,postmask.yaml
> new file mode 100644
> index 000000000000..b3ed6f3b8497
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,postmask.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display postmask
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display postmask, namely POSTMASK, provides round corner patt=
ern
> +  generation.
> +  POSTMASK device node must be siblings to the central MMSYS_CONFIG node=
.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8192-disp-postmask
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
> +      - description: POSTMASK Clock
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 argu=
ments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
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
> +    postmask0: postmask@1400d000 {
> +        compatible =3D "mediatek,mt8192-disp-postmask";
> +        reg =3D <0 0x1400d000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH 0>;
> +        power-domains =3D <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +        clocks =3D <&mmsys CLK_MM_DISP_POSTMASK0>;
> +        mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0xd000 0x1000>=
;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdm=
a.yaml
> new file mode 100644
> index 000000000000..8393a25a3781
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,rdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display RDMA
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display RDMA stands for Read Direct Memory Access.
> +  It provides real time data to the back-end panel driver, such as DSI,
> +  DPI and DP_INTF.
> +  It contains one line buffer to store the sufficient pixel data.
> +  RDMA device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt2701-disp-rdma
> +      - items:
> +          - const: mediatek,mt8173-disp-rdma
> +      - items:
> +          - const: mediatek,mt8183-disp-rdma
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-disp-rdma
> +              - mediatek,mt2712-disp-rdma
> +          - enum:
> +              - mediatek,mt2701-disp-rdma
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-disp-rdma
> +          - enum:
> +              - mediatek,mt8183-disp-rdma
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
> +      - description: RDMA Clock
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
er devices defined in
> +      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-=
larb.yaml.
> +      It must sort according to the local arbiter index, like larb0, lar=
b1, larb2...
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 32
> +
> +  mediatek,rdma-fifo-size:
> +    description:
> +      rdma fifo size may be different even in same SOC, add this propert=
y to the
> +      corresponding rdma.
> +      The value below is the Max value which defined in hardware data sh=
eet
> +      mediatek,rdma-fifo-size of mt8173-rdma0 is 8K
> +      mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
> +      mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [8192, 5120, 2048]
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 argu=
ments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
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
> +    rdma0: rdma@1400e000 {
> +        compatible =3D "mediatek,mt8173-disp-rdma";
> +        reg =3D <0 0x1400e000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> +        clocks =3D <&mmsys CLK_MM_DISP_RDMA0>;
> +        iommus =3D <&iommu M4U_PORT_DISP_RDMA0>;
> +        mediatek,larb =3D <&larb0>;
> +        mediatek,rdma-fifosize =3D <8192>;
> +        mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0xe000 0x1000>=
;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,sp=
lit.yaml
> new file mode 100644
> index 000000000000..4f08e89c1067
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.y=
aml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display split
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display split, namely SPLIT, is used to split stream to two
> +  encoders.
> +  SPLIT device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8173-disp-split
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
> +      - description: SPLIT Clock
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    split0: split@14018000 {
> +        compatible =3D "mediatek,mt8173-disp-split";
> +        reg =3D <0 0x14018000 0 0x1000>;
> +        power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
> +        clocks =3D <&mmsys CLK_MM_DISP_SPLIT0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufo=
e.yaml
> new file mode 100644
> index 000000000000..6e8748529e73
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.ya=
ml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,ufoe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display UFOe
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display UFOe stands for Unified Frame Optimization engine.
> +  UFOe can cut the data rate for DSI port which may lead to reduce power
> +  consumption.
> +  UFOe device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8173-disp-ufoe
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
> +      - description: UFOe Clock
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
> +    ufoe@1401a000 {
> +        compatible =3D "mediatek,mt8173-disp-ufoe";
> +        reg =3D <0 0x1401a000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> +        clocks =3D <&mmsys CLK_MM_DISP_UFOE>;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdm=
a.yaml
> new file mode 100644
> index 000000000000..25f9a63fe7af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,wdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek display WDMA
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  Mediatek display WDMA stands for Write Direct Memory Access.
> +  It can write the data in display pipeline into DRAM.
> +  WDMA device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8173-disp-wdma
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
> +      - description: WDMA Clock
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
er devices defined in
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
ments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function bl=
ocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
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
> +    wdma0: wdma@14011000 {
> +        compatible =3D "mediatek,mt8173-disp-wdma";
> +        reg =3D <0 0x14011000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> +        clocks =3D <&mmsys CLK_MM_DISP_WDMA0>;
> +        iommus =3D <&iommu M4U_PORT_DISP_WDMA0>;
> +        mediatek,larb =3D <&larb0>;
> +        mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX 0x1000 0x1000>=
;
> +    };
> --
> 2.18.0
>
