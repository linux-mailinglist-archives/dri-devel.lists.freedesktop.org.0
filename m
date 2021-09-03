Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5018E400810
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 01:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294B06E8E4;
	Fri,  3 Sep 2021 23:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865FA6E8E4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 23:09:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2040D610D2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 23:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630710545;
 bh=+EPWpGxs3T9Uo/rZCTHnQYWwEXZm+0EO0/1mha6nTa4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PsvUU0jeXmTMrj2xAYG7mEtck7BYfJ242ItmR/IqPmPiMvNgjMP1O5dNXTVD3+i7U
 vfhz8jnigKIPx2Ihieu1jVh7u1WWGBx9GwHxcKOpv7xt9L7ywn/jNTBjwOCCMG4m5y
 qoCSeaA9ohL4/SkBqF55sHlA5WZ5d/jRd8n78Pcj6YcDLJURwq6L9t30Dk6031Yqko
 5f15bFYGYljOq4mnsKWLa7sV1u539MzNRTarBu/jtyAdCSrfOd97cZOlGhVk+8vmS7
 gBw+cgUUVnhWlTTtv288B8n0LNwrISvtEtxgF21jGegWeHTNzTyHG40Shv/aY5GgWz
 UDgSk8TrFsH/w==
Received: by mail-ed1-f48.google.com with SMTP id u19so982547edb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 16:09:05 -0700 (PDT)
X-Gm-Message-State: AOAM532wqYIP5xArRTrShJwpGERVRtM8RVq9wXoFDf4eJ6FihZtsFc9A
 rhuzVJwqRhLh4BBcanQcYxD1Hbv0LNPKLq18Cw==
X-Google-Smtp-Source: ABdhPJz4lEEmfpXjdeGrQR0fYR+vvvNDtbaIe409iJr4s/erwwA00YR7R74Biml7KDpYg2YDhsHicxPQb1hlrcxH+as=
X-Received: by 2002:aa7:d3d1:: with SMTP id o17mr1353761edr.272.1630710543641; 
 Fri, 03 Sep 2021 16:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
 <20210825144833.7757-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20210825144833.7757-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 4 Sep 2021 07:08:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-p8m_rGgQ3=Q9WmuC19LJnT2gSTcJopkgYBpgj-h-T1Q@mail.gmail.com>
Message-ID: <CAAOTY_-p8m_rGgQ3=Q9WmuC19LJnT2gSTcJopkgYBpgj-h-T1Q@mail.gmail.com>
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
>  .../display/mediatek/mediatek,aal.yaml        |  75 ++++++
>  .../display/mediatek/mediatek,ccorr.yaml      |  69 ++++++
>  .../display/mediatek/mediatek,color.yaml      |  84 +++++++
>  .../display/mediatek/mediatek,disp.txt        | 219 ------------------
>  .../display/mediatek/mediatek,dither.yaml     |  70 ++++++
>  .../display/mediatek/mediatek,gamma.yaml      |  71 ++++++
>  .../display/mediatek/mediatek,merge.yaml      |  66 ++++++
>  .../display/mediatek/mediatek,mutex.yaml      |  77 ++++++
>  .../display/mediatek/mediatek,od.yaml         |  52 +++++
>  .../display/mediatek/mediatek,ovl-2l.yaml     |  86 +++++++
>  .../display/mediatek/mediatek,ovl.yaml        |  96 ++++++++
>  .../display/mediatek/mediatek,rdma.yaml       | 110 +++++++++
>  .../display/mediatek/mediatek,split.yaml      |  56 +++++
>  .../display/mediatek/mediatek,ufoe.yaml       |  59 +++++
>  .../display/mediatek/mediatek,wdma.yaml       |  86 +++++++
>  15 files changed, 1057 insertions(+), 219 deletions(-)
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

Because mutex does not only control display function block, but also
control mdp function block, so move mutex binding document to the same
folder of mmsys.

>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,od.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ovl-2l.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ovl.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,split.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ufoe.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,wdma.yaml
>

[snip]

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mu=
tex.yaml
> new file mode 100644
> index 000000000000..939dff14d989
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y=
aml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek display mutex
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  The mediatek display mutex is used to send the triggers signals called
> +  Start Of Frame (SOF)/ Error Of Frame (EOF) to each sub-modules on the

EOF is End of Frame.

> +  display data path

In some SoC, such as mt2701, MUTEX could be a hardware mutex which
protect the shadow register. Please describe this because this is a
main function and this is why it's called MUTEX.

Regards,
Chun-Kuang.
.
> +  MUTEX device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for=
 details.
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
l to gce.
> +      The event id is defined in the gce header
> +      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
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
