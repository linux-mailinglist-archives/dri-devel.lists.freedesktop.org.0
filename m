Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C44AA6AC50E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 16:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8496910E17D;
	Mon,  6 Mar 2023 15:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B7010E17D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 15:32:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 219FCCE1303
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 15:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C2EC433AF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678116719;
 bh=rRHqdKMHPWS/LjhmJ23Rc1dXdnIHUm1Jr8BzRDwRJ+0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aSYzF2ecWPWDMaM6cUrTAMbvIsldA4drf9R+JCTEQvmvwViieJhkO01+/M5p98Kuo
 saMe6/z+BUS9J4uZjhd/5krgzQdNI6x8QKQA8krznQtBcv/qf+MPI4/QIp5Q/9HuUF
 tcBKeyQR+1FDqCJhMiHFLMB8axxHXDSLAmvHwdw0Li5Njdf2mBoqZ91W/R4FKECexw
 EI3p/1pFrsqemTCqc/E/dQQuvzlGzQZb0hmDzQykxD1xliTpLrak7gyWalzAhLmnd7
 wlSnfxNiPhjl+dBU47YD1fXyySt3wCUrbqjbG1SGq7tXvh80IjkFcKaaM4TaabS9YQ
 xJYyRlkmo5Z/A==
Received: by mail-lj1-f181.google.com with SMTP id b13so10062547ljf.6
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 07:31:59 -0800 (PST)
X-Gm-Message-State: AO0yUKVtUcFjKQ/ZL61TiQNiCDtKJnxQ/iACVN1dzvljum2Tk0d5jxpG
 WGiDQ3Nu8hs5ith73ec9vi2PtxoCzr5LmqyLqw==
X-Google-Smtp-Source: AK7set8UntwEJ6mrYVsM5Db2la8gI8Llk2OG70nJiG7YKqjsiVHpGpJYhjWb4W9quf1biMBNHaS9hrRgUlcM3rripuo=
X-Received: by 2002:a2e:a0d2:0:b0:296:a59d:c969 with SMTP id
 f18-20020a2ea0d2000000b00296a59dc969mr5890413ljm.5.1678116717143; Mon, 06 Mar
 2023 07:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20221107072413.16178-1-nancy.lin@mediatek.com>
 <20221107072413.16178-2-nancy.lin@mediatek.com>
In-Reply-To: <20221107072413.16178-2-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 6 Mar 2023 23:31:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY__4R==J+v7etAHyaHokFGRC=phqBzR0oUXizhT2pFDotQ@mail.gmail.com>
Message-ID: <CAAOTY__4R==J+v7etAHyaHokFGRC=phqBzR0oUXizhT2pFDotQ@mail.gmail.com>
Subject: Re: [PATCH v28 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux@roeck-us.net,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, nfraprado@collabora.com,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

I've lost the v29 mail, so I reply in this mail for v29.
I got some message by make dt_binding_check.

/home/chunkuang/git/linux/Documentation/devicetree/bindings/display/mediate=
k/mediatek,ethdr.example.dtb:
hdr-engine@1c114000: mediatek,gce-client-reg:0: [4294967295, 7, 16384,
4096, 4294967295, 7, 20480, 4096, 4294967295, 7, 28672, 4096,
4294967295, 7, 36864, 4096, 4294967295, 7, 40960, 4096, 4294967295, 7,
45056, 4096, 4294967295, 7, 49152, 4096] is too long
From schema: /home/chunkuang/git/linux/Documentation/devicetree/bindings/di=
splay/mediatek/mediatek,ethdr.yaml
/home/chunkuang/git/linux/Documentation/devicetree/bindings/display/mediate=
k/mediatek,ethdr.example.dtb:
hdr-engine@1c114000: mediatek,gce-client-reg: [[4294967295, 7, 16384,
4096, 4294967295, 7, 20480, 4096, 4294967295, 7, 28672, 4096,
4294967295, 7, 36864, 4096, 4294967295, 7, 40960, 4096, 4294967295, 7,
45056, 4096, 4294967295, 7, 49152, 4096]] is too short
From schema: /home/chunkuang/git/linux/Documentation/devicetree/bindings/di=
splay/mediatek/mediatek,ethdr.yaml

Regards,
Chun-Kuang.

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2022=E5=B9=B411=E6=9C=887=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:24=E5=AF=AB=E9=81=93=EF=BC=9A

>
> Add vdosys1 ETHDR definition.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ethdr.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,et=
hdr.yaml
> new file mode 100644
> index 000000000000..3b11e47a8834
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y=
aml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Ethdr Device
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description:
> +  ETHDR (ET High Dynamic Range) is a MediaTek internal HDR engine and is
> +  designed for HDR video and graphics conversion in the external display=
 path.
> +  It handles multiple HDR input types and performs tone mapping, color
> +  space/color format conversion, and then combine different layers,
> +  output the required HDR or SDR signal to the subsequent display path.
> +  This engine is composed of two video frontends, two graphic frontends,
> +  one video backend and a mixer. ETHDR has two DMA function blocks, DS a=
nd ADL.
> +  These two function blocks read the pre-programmed registers from DRAM =
and
> +  set them to HW in the v-blanking period.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-disp-ethdr
> +
> +  reg:
> +    maxItems: 7
> +
> +  reg-names:
> +    items:
> +      - const: mixer
> +      - const: vdo_fe0
> +      - const: vdo_fe1
> +      - const: gfx_fe0
> +      - const: gfx_fe1
> +      - const: vdo_be
> +      - const: adl_ds
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 2
> +
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
> +
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
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: video frontend 0 async reset
> +      - description: video frontend 1 async reset
> +      - description: graphic frontend 0 async reset
> +      - description: graphic frontend 1 async reset
> +      - description: video backend async reset
> +
> +  reset-names:
> +    items:
> +      - const: vdo_fe0_async
> +      - const: vdo_fe1_async
> +      - const: gfx_fe0_async
> +      - const: gfx_fe1_async
> +      - const: vdo_be_async
> +
> +  mediatek,gce-client-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: The register of display function block to be set by gce=
.
> +      There are 4 arguments in this property, gce node, subsys id, offse=
t and
> +      register size. The subsys id is defined in the gce header of each =
chips
> +      include/dt-bindings/gce/<chip>-gce.h, mapping to the register of d=
isplay
> +      function block.
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    minItems: 7
> +    maxItems: 7
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - resets
> +  - mediatek,gce-client-reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +    #include <dt-bindings/memory/mt8195-memory-port.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +    #include <dt-bindings/reset/mt8195-resets.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        hdr-engine@1c114000 {
> +                compatible =3D "mediatek,mt8195-disp-ethdr";
> +                reg =3D <0 0x1c114000 0 0x1000>,
> +                      <0 0x1c115000 0 0x1000>,
> +                      <0 0x1c117000 0 0x1000>,
> +                      <0 0x1c119000 0 0x1000>,
> +                      <0 0x1c11a000 0 0x1000>,
> +                      <0 0x1c11b000 0 0x1000>,
> +                      <0 0x1c11c000 0 0x1000>;
> +                reg-names =3D "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", =
"gfx_fe1",
> +                            "vdo_be", "adl_ds";
> +                mediatek,gce-client-reg =3D <&gce0 SUBSYS_1c11XXXX 0x400=
0 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0x5000 =
0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0x7000 =
0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0x9000 =
0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0xa000 =
0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0xb000 =
0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX 0xc000 =
0x1000>;
> +                clocks =3D <&vdosys1 CLK_VDO1_DISP_MIXER>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> +                         <&vdosys1 CLK_VDO1_26M_SLOW>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> +                         <&topckgen CLK_TOP_ETHDR>;
> +                clock-names =3D "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0"=
, "gfx_fe1",
> +                              "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_=
fe1_async",
> +                              "gfx_fe0_async", "gfx_fe1_async","vdo_be_a=
sync",
> +                              "ethdr_top";
> +                power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +                iommus =3D <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> +                         <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> +                interrupts =3D <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* d=
isp mixer */
> +                resets =3D <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE=
0_DL_ASYNC>,
> +                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_=
DL_ASYNC>,
> +                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_=
DL_ASYNC>,
> +                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_=
DL_ASYNC>,
> +                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_D=
L_ASYNC>;
> +                reset-names =3D "vdo_fe0_async", "vdo_fe1_async", "gfx_f=
e0_async",
> +                              "gfx_fe1_async", "vdo_be_async";
> +        };
> +    };
> +...
> --
> 2.18.0
>
