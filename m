Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6D93E472E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 16:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE2E89C05;
	Mon,  9 Aug 2021 14:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E9989C05
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:06:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E667860FF2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628517973;
 bh=KK7jjN23raVktev4HSd9TJQBS5GWAZQ4yGJxFG4+9Iw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OHUehvXIa1FZYr4a2yi0pVIC09VMRpoM7tdRrK0Eb1ZnRpjkodBRrkuZsg6GkMwIz
 tlMgfAKZd3FzLXdeUqgq75gp4Q5pHiZyakQFz5eEZ7sFzDepYkvaTwnIXqSVP0l9PT
 dbF2GEpLcLvJl+9fkrj+jID60N/MyoFGmINUS+9exxtfVpgq8JXlDHi/eop83Fm9cv
 3+ihLcWUWJboEU1qLPlNW9LXGvXnkLOHdNw7L4gknZGxB7+dO7V+b/PpxCVXtAy3p/
 ODaVmzSfBPFEy5nL2Ymq30Ahg6kPskptBvi3Zroz8ygh6g7Ra6ZWPNnPXmurh0kopv
 rlK3UViL7qCwg==
Received: by mail-ed1-f53.google.com with SMTP id g21so24805898edb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 07:06:13 -0700 (PDT)
X-Gm-Message-State: AOAM532bK5TWX2JJiLJHf72wbTmyCc6PjcojB1RFUdRI3VKqAzyZdocm
 +nbxADtdLSqX/7QwNsgDT7T4STWBbjqF4EhrOA==
X-Google-Smtp-Source: ABdhPJy8JViocynBWXM9L3xsiyYJiSRcSybIkGik7L3z/aNO5GB4LmezUH2JyaLyyG+6uSQVvQ4XXt4q4R0gt+0l8RM=
X-Received: by 2002:a05:6402:718:: with SMTP id
 w24mr29623490edx.49.1628517972496; 
 Mon, 09 Aug 2021 07:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-3-fparent@baylibre.com>
In-Reply-To: <20201023133130.194140-3-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Aug 2021 22:06:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__-E19JJiw=0X=Kdm9afWSTCeoYFKJAVJObrikfhV=BVA@mail.gmail.com>
Message-ID: <CAAOTY__-E19JJiw=0X=Kdm9afWSTCeoYFKJAVJObrikfhV=BVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: mediatek: dsi: add
 documentation for MT8167 SoC
To: Fabien Parent <fparent@baylibre.com>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
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

Hi, Fabien:

Fabien Parent <fparent@baylibre.com> =E6=96=BC 2020=E5=B9=B410=E6=9C=8823=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:31=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Add binding documentation for the MT8167 SoC.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>
> Changelog:
>
> V2: removed part that added a new clock
>
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t=
xt
> index f06f24d405a5..6a10de812158 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -7,7 +7,7 @@ channel output.
>
>  Required properties:
>  - compatible: "mediatek,<chip>-dsi"
> -- the supported chips are mt2701, mt7623, mt8173 and mt8183.
> +- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
>  - reg: Physical base address and length of the controller's registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clocks
> @@ -26,7 +26,7 @@ The MIPI TX configuration module controls the MIPI D-PH=
Y.
>
>  Required properties:
>  - compatible: "mediatek,<chip>-mipi-tx"
> -- the supported chips are mt2701, 7623, mt8173 and mt8183.
> +- the supported chips are mt2701, 7623, mt8167, mt8173 and mt8183.
>  - reg: Physical base address and length of the controller's registers
>  - clocks: PLL reference clock
>  - clock-output-names: name of the output clock line to the DSI encoder
> --
> 2.28.0
>
