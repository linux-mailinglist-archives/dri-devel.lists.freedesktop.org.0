Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2E3402171
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 01:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB90589C6C;
	Mon,  6 Sep 2021 23:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6FA89C6C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 23:42:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 310E26109D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 23:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630971755;
 bh=cuA40y3WCNTC7CV2ya4Ol9astWJ3BZ/R1zc7YsJ6DPA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hpN7vQakMSneLWTFVH6kZZKK4AhSVRO7Ecnkyzi22rWZMdDaDmCfJGp/sGAJx/5As
 GgAx4SCnLhHUB6dkNnyfIeWiwzOpnnxSB+yfhC/rjf+eNWmNjjZUgTiqsHr0XkE9XJ
 jD1j6RtWUqfaj+e8PjnF9aO1SQyq58+mz0jAAgk3hrdU/scVgiUQXVvOK9lRITTFkw
 k6tRK8Fbc77Ea5I3UyrpIQhTfkar5lY9WhIXwjly72Qb6J9djnmFESFJWIl45tiA0j
 QmiMLSWfdh0BcIeGw41pCHaZ5lEGu+jZ/m2ZAn2p2y0y6WzPxko0VPwV78xk1BkLNk
 9xiptRB80UHvw==
Received: by mail-ed1-f47.google.com with SMTP id z19so11324771edi.9
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 16:42:35 -0700 (PDT)
X-Gm-Message-State: AOAM531oc9edjnJjRkJHNgzZHd2By3fMhKF2w+jBb04LmZj/epN5f1Mq
 MUiMECrk6kJcxpiLFm1U0rnBOICVRx34p+v/sw==
X-Google-Smtp-Source: ABdhPJw32cZWysU/gUon/jwslWOIEpz6VH6QFcrMYANk7op3saADxfLqzXBlOA7lAnpQU/NU929WdYzUfwR6UAj9wSE=
X-Received: by 2002:a05:6402:51c9:: with SMTP id
 r9mr15862686edd.65.1630971753787; 
 Mon, 06 Sep 2021 16:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-2-nancy.lin@mediatek.com>
In-Reply-To: <20210906071539.12953-2-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 7 Sep 2021 07:42:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-rVhh4_m39JPRnE-zwW38k-OPArVv6GqOmORaD=qStVQ@mail.gmail.com>
Message-ID: <CAAOTY_-rVhh4_m39JPRnE-zwW38k-OPArVv6GqOmORaD=qStVQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/16] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
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

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:15=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add vdosys1 RDMA definition.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,mdp-rdma.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mdp-rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,mdp-rdma.yaml
> new file mode 100644
> index 000000000000..3610093848e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdm=
a.yaml

I've compared the rdma driver in mdp [1] with the rdma driver in
display [2], both are similar. The difference are like merge0 versus
merge5. So I would like both binding document are placed together. In
display folder? In media folder? In SoC folder? I've no idea which one
is better, but at lease put together.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/2021082410002=
7.25989-6-moudy.ho@mediatek.com/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/2021090607153=
9.12953-12-nancy.lin@mediatek.com/

Regards,
Chun-Kuang.

> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek display MDP RDMA
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +
> +description: |
> +  The mediatek display MDP RDMA stands for Read Direct Memory Access.
> +  It provides real time data to the back-end panel driver, such as DSI,
> +  DPI and DP_INTF.
> +  It contains one line buffer to store the sufficient pixel data.
> +  RDMA device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for=
 details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8195-vdo1-rdma
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
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are=
 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys =
id that is
> +      mapping to the register of display function blocks is defined in t=
he gce header
> +      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - clocks
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    vdo1_rdma0: vdo1_rdma@1c104000 {
> +        compatible =3D "mediatek,mt8195-vdo1-rdma";
> +        reg =3D <0 0x1c104000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> +        power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +        iommus =3D <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> +        mediatek,gce-client-reg =3D <&gce1 SUBSYS_1c10XXXX 0x4000 0x1000=
>;
> +    };
> +
> --
> 2.18.0
>
