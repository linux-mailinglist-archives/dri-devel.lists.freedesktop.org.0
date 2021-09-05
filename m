Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F45400DE7
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 06:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F226389E47;
	Sun,  5 Sep 2021 04:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EC189E47
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:16:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9359660E52
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630815383;
 bh=dbQUuh4Yx3Ua+XUK2KO2N0leWTaAb2HjH7wIuZYc5Bo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NtHu1bnDp3h2skKq0DJFXVUY9/b05a0wvlrhZLd2Jjhat460ByDqYAN6mcz+0eV/3
 FtVXr0y03hbh27DjFcXdSNiJGCdpNrL8cwvwWaiTo7QKoBObTDfb2aWy9chPEJXSsi
 nxmb54nHJv0uiew4wE08Rkwt3g60mf2tTonnHZm9dvgNvNxZlWmD1CB7dZ4dkBEZ82
 NOYR2FyJlfwSJfTV421EPCslyLcr9cD0m2KxTsjRPdhKjWhcsVuQuOq8YKpBz4OVPb
 ShTNABrxmPbjCSGWInRGF7N1jQBhwjHHr9rU/m0/D4mp+M1h35yi+i4f/xHvBn/A/5
 T1x6YzxWYr7GQ==
Received: by mail-ej1-f52.google.com with SMTP id h9so6375129ejs.4
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Sep 2021 21:16:23 -0700 (PDT)
X-Gm-Message-State: AOAM532E7gSYQeXsPyJiGohPnbs8Y9Fc6WvLrbojE5wlsn7M1J8DR60j
 tnQAuS0JJa12yXSKeV/y8I7RljkDemwxh+7FLA==
X-Google-Smtp-Source: ABdhPJyLKUZrRgxlYyVgn+KtXIanAcxi9/hlIrNt7il8Cyi5eO09vlN6v4RcsJp91Cx41ncifpXRBcbz7OUk4e068aU=
X-Received: by 2002:a17:907:7252:: with SMTP id
 ds18mr6990561ejc.105.1630815382131; 
 Sat, 04 Sep 2021 21:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
 <20210825144833.7757-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20210825144833.7757-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Sep 2021 12:16:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY_95nGj4mrO=hmYR1kV5HMdU1jp8kOjG5t9V1Cor1f2LOg@mail.gmail.com>
Message-ID: <CAAOTY_95nGj4mrO=hmYR1kV5HMdU1jp8kOjG5t9V1Cor1f2LOg@mail.gmail.com>
Subject: Re: [PATCH v9 05/14] dt-bindings: mediatek: display: add mt8195 SoC
 binding
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
> 1. Add mt8195 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MERGE,
>    MUTEX, OVL and RDMA yaml schema.
>
> 2. Add MERGE additional property description for mt8195
> - async clock
> - fifo setting enable
> - reset controller

I would like you to separate merge additional property description to
an independent patch.

Regards,
Chun-Kuang.

>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        |  1 +
>  .../display/mediatek/mediatek,ccorr.yaml      |  2 ++
>  .../display/mediatek/mediatek,color.yaml      |  1 +
>  .../display/mediatek/mediatek,dither.yaml     |  5 +++
>  .../display/mediatek/mediatek,gamma.yaml      |  5 +++
>  .../display/mediatek/mediatek,merge.yaml      | 32 +++++++++++++++++++
>  .../display/mediatek/mediatek,mutex.yaml      |  2 ++
>  .../display/mediatek/mediatek,ovl.yaml        |  5 +++
>  .../display/mediatek/mediatek,rdma.yaml       |  2 ++
>  9 files changed, 55 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index faa764c12dfc..1599184a4dd1 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -26,6 +26,7 @@ properties:
>            - enum:
>                - mediatek,mt2712-disp-aal
>                - mediatek,mt8183-disp-aal
> +              - mediatek,mt8195-disp-aal
>            - enum:
>                - mediatek,mt8173-disp-aal
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index e848879d755c..f9b697604ab9 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -22,6 +22,8 @@ properties:
>      oneOf:
>        - items:
>            - const: mediatek,mt8183-disp-ccorr
> +      - items:
> +          - const: mediatek,mt8195-disp-ccorr
>
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index 019fc09bbddd..563755095a4f 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -36,6 +36,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8183-disp-color
> +              - mediatek,mt8195-disp-color
>            - enum:
>                - mediatek,mt8173-disp-color
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,d=
ither.yaml
> index 8e7c87c39f9c..b6f57243270c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> @@ -23,6 +23,11 @@ properties:
>      oneOf:
>        - items:
>            - const: mediatek,mt8183-disp-dither
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-disp-dither
> +          - enum:
> +              - mediatek,mt8183-disp-dither
>
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ga=
mma.yaml
> index 8fa1b373a8da..ab1e18da6bed 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> @@ -24,6 +24,11 @@ properties:
>            - const: mediatek,mt8173-disp-gamma
>        - items:
>            - const: mediatek,mt8183-disp-gamma
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-disp-gamma
> +          - enum:
> +              - mediatek,mt8183-disp-gamma
>
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,me=
rge.yaml
> index ca51a4c4a8c7..b15c6e17b421 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> @@ -22,6 +22,8 @@ properties:
>      oneOf:
>        - items:
>            - const: mediatek,mt8173-disp-merge
> +      - items:
> +          - const: mediatek,mt8195-disp-merge
>
>    reg:
>      maxItems: 1
> @@ -37,6 +39,19 @@ properties:
>    clocks:
>      items:
>        - description: MERGE Clock
> +      - description: MERGE Async Clock
> +          Controlling the synchronous process between MERGE and other di=
splay function
> +          blocks cross clock domain.
> +
> +  mediatek,merge-fifo-en:
> +    description:
> +      The setting of merge fifo is mainly provided for the display laten=
cy buffer.
> +      to ensure that the back-end panel display data will not be underru=
n,
> +      a little more data is needed in the fifo. According to the merge f=
ifo settings,
> +      when the water level is detected to be insufficient, it will trigg=
er RDMA sending
> +      ultra and preulra command to SMI to speed up the data rate.
> +    type: boolean
> +
>
>    mediatek,gce-client-reg:
>      description:
> @@ -47,6 +62,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>
> +  resets:
> +    description: reset controller
> +      See Documentation/devicetree/bindings/reset/reset.txt for details.
> +
>  required:
>    - compatible
>    - reg
> @@ -64,3 +83,16 @@ examples:
>          power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
>          clocks =3D <&mmsys CLK_MM_DISP_MERGE>;
>      };
> +
> +    merge5: disp_vpp_merge5@1c110000 {
> +        compatible =3D "mediatek,mt8195-disp-merge";
> +        reg =3D <0 0x1c110000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&vdosys1 CLK_VDO1_VPP_MERGE4>,
> +                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
> +        clock-names =3D "merge","merge_async";
> +        power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +        mediatek,gce-client-reg =3D <&gce1 SUBSYS_1c11XXXX 0x0000 0x1000=
>;
> +        mediatek,merge-fifo-en =3D <1>;
> +        resets =3D <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mu=
tex.yaml
> index 939dff14d989..db9db182318d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y=
aml
> @@ -31,6 +31,8 @@ properties:
>            - const: mediatek,mt8173-disp-mutex
>        - items:
>            - const: mediatek,mt8183-disp-mutex
> +      - items:
> +          - const: mediatek,mt8195-disp-mutex
>
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index a0c29cd3377a..5008f900d81f 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -32,6 +32,11 @@ properties:
>                - mediatek,mt2712-disp-ovl
>            - enum:
>                - mediatek,mt2701-disp-ovl
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-disp-ovl
> +          - enum:
> +              - mediatek,mt8183-disp-ovl
>
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdm=
a.yaml
> index 837659ab4ebd..806437166e3c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> @@ -28,6 +28,8 @@ properties:
>            - const: mediatek,mt8173-disp-rdma
>        - items:
>            - const: mediatek,mt8183-disp-rdma
> +      - items:
> +          - const: mediatek,mt8195-disp-rdma
>        - items:
>            - enum:
>                - mediatek,mt7623-disp-rdma
> --
> 2.18.0
>
