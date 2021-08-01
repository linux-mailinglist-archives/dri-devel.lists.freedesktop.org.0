Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716AB3DC933
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 03:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0322389428;
	Sun,  1 Aug 2021 01:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185C889428
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 01:04:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7E4760F9D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 01:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627779867;
 bh=40pdlKueEyt7lev1UQagFt3c7F2SlDHQtUNBH7RZ1Y4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gz+YZAu7r+tD84jNsvzwhhrZG4waE/zU56AJSw+qfAmSZUHqQfsCiXSyCae/mlZMZ
 LMaJytAe9eRVfZEzHQbehQZYjM/eskdfeW+Mw+pMpHDOZav4eKLXHYQ51mEj9Mk0gU
 oGax40VZop1I/sJWXtB5fsMnnH2vVD+o8L3nIxhHQm+Dv92kl3B3BjMfcBXapo4Bb/
 1qEKEAGM7Av3leEc55vHAdaDsb1hpAXPs1DXg89F5YnvfxTSiBjP0LiWBYB5gd7jkx
 hPwrDlBciYfDsM8L4ZpAJu3Z8EfG2YMQlMaFIKydjOZwdWKr9rvtBmaeX657vH0EnT
 0UHg2tnxfI4Rw==
Received: by mail-ej1-f52.google.com with SMTP id cb3so2497021ejb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 18:04:27 -0700 (PDT)
X-Gm-Message-State: AOAM5315wNolJ/nhjITbscVeidWTAz/VjDFQNhkuSvBNTBMRC3LHi7FF
 X7thdG+HtFcKmViEjV8jKY8NPqqdlvUMOLyyWw==
X-Google-Smtp-Source: ABdhPJxChVMHTPtuXeIkTB7f77pLqBVLDVCfWKNw/m3lMjDr8wlREVH0WD35bnLA7EABAjNY/O6UQtfVK3j8dLRdHl8=
X-Received: by 2002:a17:907:76cd:: with SMTP id
 kf13mr9706503ejc.310.1627779866352; 
 Sat, 31 Jul 2021 18:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210729154912.20051-1-jason-jh.lin@mediatek.com>
 <20210729154912.20051-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20210729154912.20051-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 1 Aug 2021 09:04:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9aiXUEk7wJA9DBCOx-P1zVBFC6fqF-BP2HdHyvkxFwqA@mail.gmail.com>
Message-ID: <CAAOTY_9aiXUEk7wJA9DBCOx-P1zVBFC6fqF-BP2HdHyvkxFwqA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: mediatek: display: Change format to
 yaml
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo Serra <eballetbo@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Jitao shi <jitao.shi@mediatek.com>, fshao@chromium.org, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=882=
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:49=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Change mediatek,dislpay.txt to mediatek,display.yaml
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,disp.txt        | 219 ---------
>  .../display/mediatek/mediatek,disp.yaml       | 432 ++++++++++++++++++
>  2 files changed, 432 insertions(+), 219 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,disp.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,disp.yaml
>

[snip]

> +
> +  DISP function blocks
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  A display stream starts at a source function block that reads pixel da=
ta from
> +  memory and ends with a sink function block that drives pixels on a dis=
play
> +  interface, or writes pixels back to memory. All DISP function blocks h=
ave
> +  their own register space, interrupt, and clock gate. The blocks that c=
an
> +  access memory additionally have to list the IOMMU and local arbiter th=
ey are
> +  connected to.
> +
> +properties:
> +  compatible:
> +    description: |
> +      If the display function block of different soc have the same funct=
ion,
> +      you can use the same compatible name after it.
> +      For example, if mt8183 COLOR function is the same as mt8173, then =
the
> +      compatible of mt8183 cholud be set as:
> +      compatible =3D "mediatek,mt8183-disp-color", "mediatek,mt8173-disp=
-color";
> +    oneOf:
> +      # OVL: overlay (4 layers, blending, csc)
> +      - items:
> +          - const: mediatek,mt2701-disp-ovl
> +      - items:
> +          - const: mediatek,mt8173-disp-ovl
> +      - items:
> +          - const: mediatek,mt8183-disp-ovl
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-disp-ovl
> +              - mediatek,mt2712-disp-ovl
> +          - enum:
> +              - mediatek,mt2701-disp-ovl
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-disp-ovl
> +          - enum:
> +              - mediatek,mt8183-disp-ovl
> +
> +      # OVL2L: overlay (2 layers, blending, csc)
> +      - items:
> +          - const: mediatek,mt8183-disp-ovl-2l
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-disp-ovl-2l
> +          - enum:
> +              - mediatek,mt8183-disp-ovl-2l
> +
> +      # RDMA: read DMA / line buffer
> +      - items:
> +          - const: mediatek,mt2701-disp-rdma
> +      - items:
> +          - const: mediatek,mt8173-disp-rdma
> +      - items:
> +          - const: mediatek,mt8183-disp-rdma
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-disp-rdma
> +              - mediatek,mt2712-disp-rdma
> +          - enum:
> +              - mediatek,mt2701-disp-rdma
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-disp-rdma
> +          - enum:
> +              - mediatek,mt8183-disp-rdma
> +
> +      # WDMA: write DMA
> +      - items:
> +          - const: mediatek,mt8173-disp-wdma
> +
> +      # CCORR: color correction
> +      - items:
> +          - const: mediatek,mt8183-disp-ccorr
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-disp-ccorr
> +          - enum:
> +              - mediatek,mt8183-disp-ccorr
> +
> +      # COLOR: color processor
> +      - items:
> +          - const: mediatek,mt2701-disp-color
> +      - items:
> +          - const: mediatek,mt8167-disp-color
> +      - items:
> +          - const: mediatek,mt8173-disp-color
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-disp-color
> +              - mediatek,mt2712-disp-color
> +          - enum:
> +              - mediatek,mt2701-disp-color
> +      - items:
> +          - enum:
> +              - mediatek,mt8183-disp-color
> +              - mediatek,mt8192-disp-color
> +          - enum:
> +              - mediatek,mt8173-disp-color
> +
> +      # DITHER
> +      - items:
> +          - const: mediatek,mt8183-disp-dither
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-disp-dither
> +          - enum:
> +              - mediatek,mt8183-disp-dither
> +
> +      # AAL: adaptive ambient light controller
> +      - items:
> +          - const: mediatek,mt8173-disp-aal
> +      - items:
> +          - enum:
> +              - mediatek,mt2712-disp-aal
> +              - mediatek,mt8183-disp-aal
> +              - mediatek,mt8192-disp-aal
> +          - enum:
> +              - mediatek,mt8173-disp-aal
> +
> +      # GAMMA: gamma correction
> +      - items:
> +          - const: mediatek,mt8173-disp-gamma
> +      - items:
> +          - const: mediatek,mt8183-disp-gamma
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-disp-gamma
> +          - enum:
> +              - mediatek,mt8183-disp-gamma
> +
> +      # MERGE: merge streams from two RDMA sources
> +
> +      # POSTMASK: control round corner for display frame
> +      - items:
> +          - const: mediatek,mt8192-disp-postmask
> +
> +      # SPLIT: split stream to two encoders
> +
> +      # UFOE: data compression engine
> +      - items:
> +          - const: mediatek,mt8173-disp-ufoe
> +
> +      # DSI: see Documentation/devicetree/bindings/display/mediatek/medi=
atek,dsi.txt for details.
> +      - items:
> +          - const: mediatek,mt2701-disp-dsi
> +      - items:
> +          - const: mediatek,mt8173-disp-dsi
> +      - items:
> +          - const: mediatek,mt8183-disp-dsi
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-disp-dsi
> +              - mediatek,mt2712-disp-dsi
> +          - enum:
> +              - mediatek,mt2701-disp-dsi
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-disp-dsi
> +          - enum:
> +              - mediatek,mt8183-disp-dsi
> +
> +      # DPI: see Documentation/devicetree/bindings/display/mediatek/medi=
atek,dpi.yaml for details.
> +      - items:
> +          - const: mediatek,mt2701-disp-dpi
> +      - items:
> +          - const: mediatek,mt8173-disp-dpi
> +      - items:
> +          - const: mediatek,mt8183-disp-dpi
> +      - items:
> +          - const: mediatek,mt8192-disp-dpi
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-disp-dpi
> +              - mediatek,mt2712-disp-dpi
> +          - enum:
> +              - mediatek,mt2701-disp-dpi
> +
> +      # MUTEX: display mutex
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
> +      - items:
> +          - const: mediatek,mt8192-disp-mutex
> +
> +      # OD: overdrive
> +      - items:
> +          - const: mediatek,mt2712-disp-od
> +      - items:
> +          - const: mediatek,mt8173-disp-od
> +

I think you should follow Rob's suggestion [1] to split each function
block into one schema.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/2021071517375=
0.10852-2-jason-jh.lin@mediatek.com/

Regards,
Chun-Kuang.
