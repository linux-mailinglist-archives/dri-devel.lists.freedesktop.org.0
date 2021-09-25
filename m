Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8022417F4F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 04:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754386EEC0;
	Sat, 25 Sep 2021 02:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0F16EEC0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 02:20:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 261856127C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 02:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632536423;
 bh=NkVfDV7buz8hhB0gAyU+iC6+jhK1x3NV0AJzlDQ8cFg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tgFO0XNCAl0T3U7A/21ILaY6tc0344+SY94NypcH5AaIGaT787jpLB4o5q/SULqsX
 qhK4FxT0vazdaNhJRd1XP1gMQke+YMNAAy7P3CyKdkV/j9ApMwDRJ3Fcoq4+3/SyXI
 1FLekqeWTIbfxRFxsooO1dcHj3Cu1x5bangjw8QHBoh6M1G6PyDglblJosE5+SmKKV
 yXlUIcaR0fxbqDsuJa2jI1ZxP6nwEsT9oAtvFt7+ru1ddWlRN1LeJsfqDb1324qmF+
 Hzg7/3S7qxviJv3IdcW/9gjemB1109cyB1SpiM7jUBHHEKdq6wIgfzThGV0TjdbKAl
 aj5f64GanXKkg==
Received: by mail-ed1-f48.google.com with SMTP id g8so43190308edt.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 19:20:23 -0700 (PDT)
X-Gm-Message-State: AOAM531gMNl8OSY4vAexyaErS3EbmN+PnPmgTOSY40KImQLK0PW4s+m/
 9vrYidQYZZmCOc7NyWW7jNHTaJCV6OEBrsrtcQ==
X-Google-Smtp-Source: ABdhPJz5v8IcEP0K7BZOpejJ82A4PaMKETvbTe8ACGV95fhcARZbpANrw3kILcyXFqo8tyAgfUxe+gPIleWESeu7Jd0=
X-Received: by 2002:a17:906:2418:: with SMTP id
 z24mr14851325eja.105.1632536421509; 
 Fri, 24 Sep 2021 19:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-7-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Sep 2021 10:20:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9CemLxoYX79z6ELEUmkfBrvPccHh2Z=+9RH257O5-nWw@mail.gmail.com>
Message-ID: <CAAOTY_9CemLxoYX79z6ELEUmkfBrvPccHh2Z=+9RH257O5-nWw@mail.gmail.com>
Subject: Re: [PATCH v11 06/16] dt-bindings: display: mediatek: add mt8195 SoC
 binding for vdosys0
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
> Add mt8195 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MERGE,
> MUTEX, OVL and RDMA yaml schema for vdosys0.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml   | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 5 +++++
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
>  .../bindings/display/mediatek/mediatek,dither.yaml           | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,merge.yaml | 2 ++
>  .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml | 5 +++--
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 +++++
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 2 ++
>  9 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index 92a350ab9722..311bbf05a967 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -28,6 +28,7 @@ properties:
>                - mediatek,mt2712-disp-aal
>                - mediatek,mt8183-disp-aal
>                - mediatek,mt8192-disp-aal
> +              - mediatek,mt8195-disp-aal
>            - enum:
>                - mediatek,mt8173-disp-aal
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index 7840e12d4caf..60752ce45d49 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -25,6 +25,11 @@ properties:
>            - const: mediatek,mt8183-disp-ccorr
>        - items:
>            - const: mediatek,mt8192-disp-ccorr
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-disp-ccorr
> +          - enum:
> +              - mediatek,mt8192-disp-ccorr
>
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index 7a249ba8584c..f6636869909c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -38,6 +38,7 @@ properties:
>            - enum:
>                - mediatek,mt8183-disp-color
>                - mediatek,mt8192-disp-color
> +              - mediatek,mt8195-disp-color
>            - enum:
>                - mediatek,mt8173-disp-color
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,d=
ither.yaml
> index 316374315962..d4fa75bb19a3 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8192-disp-dither
> +              - mediatek,mt8195-disp-dither
>            - enum:
>                - mediatek,mt8183-disp-dither
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ga=
mma.yaml
> index 1c53ce20a71e..8ce612b016ab 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> @@ -28,6 +28,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8192-disp-gamma
> +              - mediatek,mt8195-disp-gamma
>            - enum:
>                - mediatek,mt8183-disp-gamma
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,me=
rge.yaml
> index 542dd7137d3b..6007e00679a8 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> @@ -23,6 +23,8 @@ properties:
>      oneOf:
>        - items:
>            - const: mediatek,mt8173-disp-merge
> +      - items:
> +          - const: mediatek,mt8195-disp-merge
>
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mu=
tex.yaml
> index 90f11e12a55e..6eca525eced0 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y=
aml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Mediatek display mutex
> +title: Mediatek mutex
>
>  maintainers:
>    - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> @@ -36,7 +36,8 @@ properties:
>            - const: mediatek,mt8183-disp-mutex
>        - items:
>            - const: mediatek,mt8192-disp-mutex
> -
> +      - items:
> +          - const: mediatek,mt8195-disp-mutex
>    reg:
>      maxItems: 1
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index 50552428150f..a6dbbd65166e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -35,6 +35,11 @@ properties:
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
> index 8393a25a3781..0dcde0749078 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> @@ -29,6 +29,8 @@ properties:
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
