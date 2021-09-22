Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68443414DD8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 18:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF156EC2D;
	Wed, 22 Sep 2021 16:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8FC6EC2D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 16:13:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90F7F611C9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 16:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632327205;
 bh=k2Pj+TuZexZ6ukjV1H0j47mTKTEdHbsKE38t9ELGnwg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ss/t7YRtW4/pQQEQUBPntkIYXMZJu1oNsMVRHoU7WVsfEvF/Bin3so4Jur818nglt
 spUunv61xYEGWmqSfbZWff9/3nAjsjTGzjnjHtwyqpoztZPDdwTygO2P0a/76J8sMw
 eQyvGTIcefsJE1QATzbNab7J7wJc2GOi6FP9ClcuKbM05KTAoof7OJ3onnCnUKjTGW
 Zuc5BnTzCNN7ftVuY8R7khqroCJuET4/xQAdylFoeWEPHdqJwPKG218b2HoUPkSPZy
 bkZBDyX00TXR8EqIjjwsi+TUo9AmHHyP2UK/zmP994TvDvXpuIhaVv3fdfj/vzcVHt
 2ZoLgB7FPewWQ==
Received: by mail-ed1-f46.google.com with SMTP id v10so7252047edj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 09:13:25 -0700 (PDT)
X-Gm-Message-State: AOAM530+qYfNySRRW4D9CQi9uN57p8/mIPgtdV7d6WWS4p2XkYYZSYro
 qAPiQqX8p26kMlBs7GhrjnTXU9ycCHxzJdiF9w==
X-Google-Smtp-Source: ABdhPJz0EFOiG8RAy7xNyqTHM9kZtLsTE6kn0uXnl1IvG1FgKwEubeYEUB8kZr/WOB+y08WZzwtJ8r8/AvNNj4hXTTI=
X-Received: by 2002:a17:907:995a:: with SMTP id
 kl26mr454695ejc.6.1632327204098; 
 Wed, 22 Sep 2021 09:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210907083723.7725-1-granquet@baylibre.com>
 <20210907083723.7725-4-granquet@baylibre.com>
In-Reply-To: <20210907083723.7725-4-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 23 Sep 2021 00:13:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8FC-sP0PP0Fv6G-2cwUDp6mDLx_3JmmSc144NSCyULXw@mail.gmail.com>
Message-ID: <CAAOTY_8FC-sP0PP0Fv6G-2cwUDp6mDLx_3JmmSc144NSCyULXw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: phy: Add binding for Mediatek MT8195
 HDMI PHY
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-phy@lists.infradead.org
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

Hi, Guillaume:

Guillaume Ranquet <granquet@baylibre.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=88=
7=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:39=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add bindings to describe Mediatek MT8195 HDMI PHY

Move this patch before the driver patch which reference this patch.

>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../phy/mediatek,mtk8195-hdmi-phy.yaml        | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mtk819=
5-hdmi-phy.yaml

I think this file should be merged into mediatek,hdmi-phy.yaml [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml?h=3Dv5.15-rc2

Regards,
Chun-Kuang.

>
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-=
phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.=
yaml
> new file mode 100644
> index 000000000000..f03bd3af7fd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yam=
l
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek High Definition Multimedia Interface (HDMI) PHY binding =
for mt8195
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> +
> +description: |
> +  The HDMI PHY serializes the HDMI encoder's three channel 10-bit parall=
el
> +  output and drives the HDMI pads.
> +
> +properties:
> +  $nodename:
> +    pattern: "^hdmi-phy@[0-9a-f]+$"
> +
> +  compatible:
> +    - const: mediatek,mt8195-hdmi-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PLL reference clock
> +
> +  clock-names:
> +    items:
> +      - const: hdmi_xtal_sel
> +
> +  clock-output-names:
> +    items:
> +      - const: hdmi_txpll
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  "#clock-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-output-names
> +  - "#phy-cells"
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    hdmi_phy: hdmi-phy@11d5f000 {
> +        compatible =3D "mediatek,mt8195-hdmi-phy";
> +        reg =3D <0 0x11d5f000 0 0x100>;
> +        clocks =3D <&topckgen CLK_TOP_HDMI_XTAL>;
> +        clock-names =3D "hdmi_xtal_sel";
> +        clock-output-names =3D "hdmi_txpll";
> +        #clock-cells =3D <0>;
> +        #phy-cells =3D <0>;
> +    };
> +
> +...
> --
> 2.31.1
>
