Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4132417F3F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 04:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC2D6EE9F;
	Sat, 25 Sep 2021 02:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AEB6EE9F
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 02:11:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 942856124B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 02:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632535876;
 bh=bh2NnvETqZ5gppTlIxdn7adU8NHofIsaMMg5rGECvIs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oyXkVs0M9xuz9X0bXR7/OLdzcXDXj+3NZbVkICK0B6LOn7gsOhWZKos44L9RBL5uD
 BwIJbHEEidbS9QkrLI2sNoW4Ax3xN9Bmc5DTlxF1VTJibs2mC8MRFn22KYx5dtt3bf
 cNBDnAA7OuYi1HhmOP4ng/RjMxsnN1vS0WhVzYXGQqyGJS42jWbWlFVa67xx2FAGTY
 kJXtiagOrPopJiPuMmZGlKivK4QP/7Dd4GFr5B+kfyGAkRHeDkILUYTUItJA48ftFO
 66LvFyl/hZc3BaTa11PSR2BzR9HgPQGo74IZopZdl10Kmm/a+2T6k3ahghE+dAI/i0
 /aF+O/fDYvGZQ==
Received: by mail-ed1-f49.google.com with SMTP id bx4so43273804edb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 19:11:16 -0700 (PDT)
X-Gm-Message-State: AOAM532Ihi87TXyHC31rzarbHdyyOw5twP633cAV86ioPv1YAlbRs85U
 YxbXOQQuNHPVgy3XVXIbMs3pBrHvLDKAAyWagQ==
X-Google-Smtp-Source: ABdhPJxHVfwE5NBLEqjXLuieV73XDg/3aABwa8SyIvmNcOwLifu66viuQEN5dIOmQCviZEg+9kCT9dfv4FoGZK01SQc=
X-Received: by 2002:a17:906:26c4:: with SMTP id
 u4mr14435742ejc.511.1632535875178; 
 Fri, 24 Sep 2021 19:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-5-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Sep 2021 10:11:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8uRKQP5AEp6V4Ez1YZAfSYrruo5n-hG=Vp3GUPUE=sGA@mail.gmail.com>
Message-ID: <CAAOTY_8uRKQP5AEp6V4Ez1YZAfSYrruo5n-hG=Vp3GUPUE=sGA@mail.gmail.com>
Subject: Re: [PATCH v11 04/16] dt-bindings: display: mediatek: dsc: add yaml
 for mt8195 SoC binding
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
> 1. Add mediatek,dsc.yaml to describe DSC module in details.
> 2. Add mt8195 SoC binding to mediatek,dsc.yaml.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dsc.yaml        | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,dsc.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.=
yaml
> new file mode 100644
> index 000000000000..1ec083eff824
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yam=
l
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek display DSC controller
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
