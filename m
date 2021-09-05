Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF310400DE6
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 06:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ABF89DF7;
	Sun,  5 Sep 2021 04:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F32B89E41
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:11:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6E4F61054
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630815079;
 bh=FJt08tLv94mGzxxoL9aKwkbFQx3aABVQCv3d6GkPJ50=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BkGVJHzzLOWSqg7qiTcFvDwkAz7IvFkSPRqU6MLqjnzLUWEoRoJy2C04dJn99rBm2
 8jPItABi5toutqoXFN7bM90fBVnhJctZFwug62V6r3xFeTscbRp0JvDH9H/A3LN+TT
 W1Gmfpo56UaDXGE87GY5qVU9754eKQXwsBguLTUYTDkTq2/pIgOa2Frcjx94/5JwHH
 9a8KzjE3uUo790W8f4D/3x8jzlwDMQvYaar4a1HpaQQ6gzzyLlZdudj0/SfiokpXOl
 P7hUBdLNpNlY3VNCQ65Oe/ZsaSCUQGvr3dTsCkfHEB03sj3RhWEtR3Bo3svALVk8rp
 j18hxIAIQzSfg==
Received: by mail-ej1-f45.google.com with SMTP id n27so6351345eja.5
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Sep 2021 21:11:19 -0700 (PDT)
X-Gm-Message-State: AOAM531/eSS+ea4rE10Y0Rig3sYh7OB8sS5aix3wwKETZx39FtSoo5r+
 4SUZIhS9yJgGxygxJONEWaG3jMP9asiD8R8C5A==
X-Google-Smtp-Source: ABdhPJxuQktwkT66NyxvIWF/PbhLjJE31qsp+wgNqVEER3VZSiT7tBa60/3ZxcrdU/9Low1/zRYZ7e6Rc2WPzONInhU=
X-Received: by 2002:a17:906:26c4:: with SMTP id
 u4mr6927063ejc.511.1630815078141; 
 Sat, 04 Sep 2021 21:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
 <20210825144833.7757-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20210825144833.7757-5-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Sep 2021 12:11:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8XoeNVWqYpGPyUS-9X4jrjo8N=QxoBY0oD8nfeVMsESA@mail.gmail.com>
Message-ID: <CAAOTY_8XoeNVWqYpGPyUS-9X4jrjo8N=QxoBY0oD8nfeVMsESA@mail.gmail.com>
Subject: Re: [PATCH v9 04/14] dt-bindings: mediatek: add mediatek, dsc.yaml for
 mt8195 SoC binding
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
> 1. Add mediatek,dsc.yaml to describe DSC module in details.
> 2. Add mt8195 SoC binding to mediatek,dsc.yaml.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dsc.yaml        | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,dsc.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.=
yaml
> new file mode 100644
> index 000000000000..f26e3010d5f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yam=
l
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek display DSC controller

Mediatek

Regards,
Chun-Kuang.

> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  The DSC standard is a specification of the algorithms used for
> +  compressing and decompressing image display streams, including
> +  the specification of the syntax and semantics of the compressed
> +  video bit stream. DSC is designed for real-time systems with
> +  real-time compression, transmission, decompression and Display.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8195-disp-dsc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: DSC Wrapper Clock
> +
> +  power-domains:
> +    description: A phandle and PM domain specifier as defined by binding=
s of
> +      the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.
> +
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
> +    dsc0: disp_dsc_wrap@1c009000 {
> +        compatible =3D "mediatek,mt8195-disp-dsc";
> +        reg =3D <0 0x1c009000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
> +        power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +        clocks =3D <&vdosys0 CLK_VDO0_DSC_WRAP0>;
> +        mediatek,gce-client-reg =3D <&gce1 SUBSYS_1c00XXXX 0x9000 0x1000=
>;
> +    };
> --
> 2.18.0
>
