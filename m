Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AE042FEF0
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 01:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98226EE09;
	Fri, 15 Oct 2021 23:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E606EE09
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 23:37:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F9C461151
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 23:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634341063;
 bh=mSjYeFIn9iGlyPP4YkVaaAXlNZukCc45jcHgdHPqRkE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pyAUmchIGw+xhTn5XPKIJXcTdHE2HCpQQ+CQZC84WgKMnyj4zMhPN8Ov0N45cTbFN
 UwqeBafwPOy1d1IWEf4SdQOrw33/DSjZG510fKbOHFFcQ1U8tF9qsihxFtKrG42IKe
 DTgnCovyzsBDfiw4Nsmi8cETddT5k2khKCTa4y07SpRI3EmN4nT0bavTJplqzaebca
 FnRQGtt/XyxHlYkl4BT7DWQRub6rHnYvAsj5ecFxfer46G914it4SAJiHlICyq8XFI
 +iekoEd14Uve20wEGWTlmpyppeFgDv7yZ20rp8lJ11sK3N+nk4Za54bvHsIHzyGs3l
 i5ta83l+BFNCQ==
Received: by mail-ed1-f43.google.com with SMTP id i20so43093824edj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 16:37:43 -0700 (PDT)
X-Gm-Message-State: AOAM532XliJhJMAGYFUOywASluIrE111C4fUwd+5UF4GHB3qqY5Ifkqt
 /9tt2Oz5yL7bwvrp56a8Hg9YY2Lpq7f5XTH9LA==
X-Google-Smtp-Source: ABdhPJx7e7jgpvAeVvVWkAoJO6fkrTE4NIWAOgQMlVK6+qesKagjCdsdIwI9BRGXChm59BFOTGlMmv9rpanjba34ygM=
X-Received: by 2002:a17:906:9414:: with SMTP id
 q20mr10783875ejx.241.1634341061891; 
 Fri, 15 Oct 2021 16:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-4-nancy.lin@mediatek.com>
In-Reply-To: <20211004062140.29803-4-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 Oct 2021 07:37:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9EG-dUE3TN3+8o5nBV1SW4CY9q+jy1P+G03W40C8zu5Q@mail.gmail.com>
Message-ID: <CAAOTY_9EG-dUE3TN3+8o5nBV1SW4CY9q+jy1P+G03W40C8zu5Q@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] dt-bindings: mediatek: add ethdr definition for
 mt8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
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

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=884=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add vdosys1 ETHDR definition.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ethdr.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,et=
hdr.yaml
> new file mode 100644
> index 000000000000..e127f0b392d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y=
aml
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Ethdr Device Tree Bindings
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  ETHDR is designed for HDR video and graphics conversion in the externa=
l display path.
> +  It handles multiple HDR input types and performs tone mapping, color s=
pace/color
> +  format conversion, and then combine different layers, output the requi=
red HDR or
> +  SDR signal to the subsequent display path. This engine is composed of =
two video
> +  frontends, two graphic frontends, one video backend and a mixer.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8195-disp-ethdr
> +  reg:
> +    maxItems: 7
> +  reg-names:
> +    items:
> +      - const: mixer
> +      - const: vdo_fe0
> +      - const: vdo_fe1
> +      - const: gfx_fe0
> +      - const: gfx_fe1
> +      - const: vdo_be
> +      - const: adl_ds
> +  interrupts:
> +    minItems: 1
> +  iommus:
> +    description: The compatible property is DMA function blocks.
> +      Should point to the respective IOMMU block with master port as arg=
ument,
> +      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml fo=
r
> +      details.

In description, you does not mention that ethdr has dma function. I
expect that video front end and graphics front end direct link to
another hardware function block and no dma function. If it has both
direct link and dma function, add explain in description.

> +    minItems: 1
> +    maxItems: 2
> +  clocks:
> +    items:
> +      - description: mixer clock
> +      - description: video frontend 0 clock
> +      - description: video frontend 1 clock
> +      - description: graphic frontend 0 clock
> +      - description: graphic frontend 1 clock
> +      - description: video backend clock
> +      - description: autodownload and menuload clock
> +      - description: video frontend 0 async clock
> +      - description: video frontend 1 async clock
> +      - description: graphic frontend 0 async clock
> +      - description: graphic frontend 1 async clock
> +      - description: video backend async clock
> +      - description: ethdr top clock
> +  clock-names:
> +    items:
> +      - const: mixer
> +      - const: vdo_fe0
> +      - const: vdo_fe1
> +      - const: gfx_fe0
> +      - const: gfx_fe1
> +      - const: vdo_be
> +      - const: adl_ds
> +      - const: vdo_fe0_async
> +      - const: vdo_fe1_async
> +      - const: gfx_fe0_async
> +      - const: gfx_fe1_async
> +      - const: vdo_be_async
> +      - const: ethdr_top
> +  power-domains:
> +    maxItems: 1
> +  resets:
> +    maxItems: 5
> +  mediatek,gce-client-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: The register of display function block to be set by gce=
.
> +      There are 4 arguments in this property, gce node, subsys id, offse=
t and
> +      register size. The subsys id is defined in the gce header of each =
chips
> +      include/include/dt-bindings/gce/<chip>-gce.h, mapping to the regis=
ter of
> +      display function block.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    disp_ethdr@1c114000 {
> +            compatible =3D "mediatek,mt8195-disp-ethdr";
> +            reg =3D <0 0x1c114000 0 0x1000>,
> +                  <0 0x1c115000 0 0x1000>,
> +                  <0 0x1c117000 0 0x1000>,
> +                  <0 0x1c119000 0 0x1000>,
> +                  <0 0x1c11A000 0 0x1000>,
> +                  <0 0x1c11B000 0 0x1000>,
> +                  <0 0x1c11C000 0 0x1000>;
> +            reg-names =3D "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx=
_fe1",
> +                        "vdo_be", "adl_ds";
> +            mediatek,gce-client-reg =3D <&gce1 SUBSYS_1c11XXXX 0x4000 0x=
1000>,
> +                                      <&gce1 SUBSYS_1c11XXXX 0x5000 0x10=
00>,
> +                                      <&gce1 SUBSYS_1c11XXXX 0x7000 0x10=
00>,
> +                                      <&gce1 SUBSYS_1c11XXXX 0x9000 0x10=
00>,
> +                                      <&gce1 SUBSYS_1c11XXXX 0xA000 0x10=
00>,
> +                                      <&gce1 SUBSYS_1c11XXXX 0xB000 0x10=
00>,
> +                                      <&gce1 SUBSYS_1c11XXXX 0xC000 0x10=
00>;
> +            clocks =3D <&vdosys1 CLK_VDO1_DISP_MIXER>,
> +                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> +                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> +                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> +                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> +                     <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> +                     <&vdosys1 CLK_VDO1_26M_SLOW>,
> +                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> +                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> +                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> +                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> +                     <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> +                     <&topckgen CLK_TOP_ETHDR_SEL>;
> +            clock-names =3D "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "g=
fx_fe1",
> +                          "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_=
async",
> +                          "gfx_fe0_async", "gfx_fe1_async","vdo_be_async=
",
> +                          "ethdr_top";
> +            power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +            iommus =3D <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> +                     <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> +            interrupts =3D <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp =
mixer */
> +            resets =3D <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL=
_ASYNC>,
> +                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_A=
SYNC>,
> +                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_A=
SYNC>,
> +                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_A=
SYNC>,
> +                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_AS=
YNC>;
> +    };
> +
> +...
> --
> 2.18.0
>
