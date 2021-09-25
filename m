Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB1B417F54
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 04:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004536EF21;
	Sat, 25 Sep 2021 02:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A5F6EEC4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 02:22:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4412E60EDF
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 02:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632536571;
 bh=iC6T0DpgPQkNthlfRd9HIITiQDWjQJziefXuN46+sU4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kmg+frBhpG5jEZ6Npg8a8kvwXfwUYmxqBBEgsZFJgH/c8fHmw68iPKapvO0k0V9wu
 vDxlj2+qwDeONU2yJ4CuhUFrShYzEO8lcIegPwWJl2uKEr5pVMYDchE4n3ovVTpZFM
 W5HBgSbTp+JDqisd7CPf/apRTY7yokuFB+w92+gxVYo27jPCWnb7+PL6DD5KvGYjXm
 xKvrSrxmKbMnztSX25lh8UVx+n5tHjU8jkKi3DBNhOQBVQbQ1w05c0jRMIPpwpAEAR
 96DgnKfSFmsg+9Brwhs3iMg7pLttZf9OycH6Alb11g2VM5N5JIM3ibT/+cs20VHpAQ
 x19EbFJGRrifQ==
Received: by mail-ed1-f54.google.com with SMTP id v18so7945096edc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 19:22:51 -0700 (PDT)
X-Gm-Message-State: AOAM533bEXB/J5BdhQYe1B9CWVUiJpNMBWQ/QjZATrGazwC0NigtxVs2
 6ZmYSY2QgctSq9u7Xj2mGV3ejCD43/yliry0bQ==
X-Google-Smtp-Source: ABdhPJxS1P+giv9UtV7KMyZeRiSNnMTZ5XzQt2hoMoEP1zCq6SArgoS8BxyStv1KptPUUbvLjJOus6Ot6M1cAGAERys=
X-Received: by 2002:a17:907:995a:: with SMTP id
 kl26mr15504212ejc.6.1632536569784; 
 Fri, 24 Sep 2021 19:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-8-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-8-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Sep 2021 10:22:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_86H0KPdsmdeZL3gSW-7GFrtpe3akG4O_1Z-EnsoAjiAg@mail.gmail.com>
Message-ID: <CAAOTY_86H0KPdsmdeZL3gSW-7GFrtpe3akG4O_1Z-EnsoAjiAg@mail.gmail.com>
Subject: Re: [PATCH v11 07/16] dt-bindings: arm: mediatek: move common module
 from display folder
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
> AAL, COLOR, CCORR, MUTEX, WDMA could be used by other modules,
> such as MDP, so move their binding document into the common folder.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../{display =3D> arm}/mediatek/mediatek,aal.yaml      |  9 ++++-----
>  .../{display =3D> arm}/mediatek/mediatek,ccorr.yaml    |  9 ++++-----
>  .../{display =3D> arm}/mediatek/mediatek,color.yaml    | 11 +++++------
>  .../{display =3D> arm}/mediatek/mediatek,mutex.yaml    | 12 +++++-------
>  .../{display =3D> arm}/mediatek/mediatek,wdma.yaml     |  9 ++++-----
>  5 files changed, 22 insertions(+), 28 deletions(-)
>  rename Documentation/devicetree/bindings/{display =3D> arm}/mediatek/med=
iatek,aal.yaml (88%)
>  rename Documentation/devicetree/bindings/{display =3D> arm}/mediatek/med=
iatek,ccorr.yaml (87%)
>  rename Documentation/devicetree/bindings/{display =3D> arm}/mediatek/med=
iatek,color.yaml (86%)
>  rename Documentation/devicetree/bindings/{display =3D> arm}/mediatek/med=
iatek,mutex.yaml (85%)
>  rename Documentation/devicetree/bindings/{display =3D> arm}/mediatek/med=
iatek,wdma.yaml (90%)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,aal.yaml
> similarity index 88%
> rename from Documentation/devicetree/bindings/display/mediatek/mediatek,a=
al.yaml
> rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,aal.yam=
l
> index 311bbf05a967..ab6eb9b550a4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,aal.yaml
> @@ -1,17 +1,16 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,aal.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Mediatek display adaptive ambient light processor
> +title: MediaTek adaptive ambient light processor
>
>  maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
>
>  description: |
> -  Mediatek display adaptive ambient light processor, namely AAL,
> +  MediaTek adaptive ambient light processor, namely AAL,
>    is responsible for backlight power saving and sunlight visibility impr=
oving.
>    AAL device node must be siblings to the central MMSYS_CONFIG node.
>    For a description of the MMSYS_CONFIG binding, see
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.=
yaml
> similarity index 87%
> rename from Documentation/devicetree/bindings/display/mediatek/mediatek,c=
corr.yaml
> rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.y=
aml
> index 60752ce45d49..de86e9ae35f3 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
> @@ -1,17 +1,16 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,ccorr.yaml#
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,ccorr.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Mediatek display color correction
> +title: MediaTek color correction
>
>  maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
>
>  description: |
> -  Mediatek display color correction, namely CCORR, reproduces correct co=
lor
> +  MediaTek color correction, namely CCORR, reproduces correct color
>    on panels with different color gamut.
>    CCORR device node must be siblings to the central MMSYS_CONFIG node.
>    For a description of the MMSYS_CONFIG binding, see
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,color.=
yaml
> similarity index 86%
> rename from Documentation/devicetree/bindings/display/mediatek/mediatek,c=
olor.yaml
> rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,color.y=
aml
> index f6636869909c..73be301b50d2 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,color.yaml
> @@ -1,18 +1,17 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,color.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Mediatek display color processor
> +title: MediaTek color processor
>
>  maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
>
>  description: |
> -  Mediatek display color processor, namely COLOR, provides hue, luma and
> -  saturation adjustments to get better picture quality and to have one p=
anel
> +  MediaTek color processor, namely COLOR, provides hue, luma and saturat=
ion
> +  adjustments to get better picture quality and to have one panel
>    resemble the other in their output characteristics.
>    COLOR device node must be siblings to the central MMSYS_CONFIG node.
>    For a description of the MMSYS_CONFIG binding, see
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mutex.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.=
yaml
> similarity index 85%
> rename from Documentation/devicetree/bindings/display/mediatek/mediatek,m=
utex.yaml
> rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.y=
aml
> index 6eca525eced0..713c7485e11a 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y=
aml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
> @@ -1,19 +1,17 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mutex.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Mediatek mutex
> +title: MediaTek mutex
>
>  maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
>
>  description: |
> -  Mediatek mutex, namely MUTEX, is used to send the triggers signals cal=
led
> -  Start Of Frame (SOF) / End Of Frame (EOF) to each sub-modules on the d=
isplay
> -  data path or MDP data path.
> +  MediaTek mutex, namely MUTEX, is used to send the triggers signals cal=
led
> +  Start Of Frame(SOF) / End Of Frame(EOF) to each sub-modules on the dat=
a path.
>    In some SoC, such as mt2701, MUTEX could be a hardware mutex which pro=
tects
>    the shadow register.
>    MUTEX device node must be siblings to the central MMSYS_CONFIG node.
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
wdma.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.ya=
ml
> similarity index 90%
> rename from Documentation/devicetree/bindings/display/mediatek/mediatek,w=
dma.yaml
> rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.ya=
ml
> index 25f9a63fe7af..5222535d98c6 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
> @@ -1,17 +1,16 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,wdma.yaml#
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,wdma.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Mediatek display WDMA
> +title: MediaTek WDMA
>
>  maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
>
>  description: |
> -  Mediatek display WDMA stands for Write Direct Memory Access.
> +  MediaTek WDMA stands for Write Direct Memory Access.
>    It can write the data in display pipeline into DRAM.
>    WDMA device node must be siblings to the central MMSYS_CONFIG node.
>    For a description of the MMSYS_CONFIG binding, see
> --
> 2.18.0
>
