Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131555E98C3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 07:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433A510E229;
	Mon, 26 Sep 2022 05:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898BE10E229
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 05:24:33 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id h194so4347369iof.4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 22:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=jEvurfgQn31+MuQ9PuCNa1QSbNB9nuSrakYO01iDa0I=;
 b=PBDYoF0ic9Mb/1mI1YKRHy9Z0n5FU2etf3En+x15fDRZoG29HSFX6c/LhtSQ2gawAx
 HUQ/P7WZ/S2t8ezXnuwLGzOntikDVgIRixZEGHOeG4xWJ1+hllfLvuURJO4X71TgFlKA
 4nCik36ImKTv6m/gJcOmL5NIpO/qmKGTCTeds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=jEvurfgQn31+MuQ9PuCNa1QSbNB9nuSrakYO01iDa0I=;
 b=ulWqw42CmPKbxh6f688yiD454sr5buboVsnGrKyMslrDW2DnqXABcnnCTgqUhQcZwe
 SGXValDpYL/o4dpFTBqMhea6pQF0lTspqVWxckmhaen1UmAkTEmFHhMaaZQoMQ/eENfM
 yYmXJleCeNq1cSTi4PGICuhHV1osWpH5pXf1Kw/+QVwKC0vnLiA7ShmTD9aw3NcX3qyZ
 CAUTlfIrjiLYXI8OzfXoWyl6YTIrl2OOT89nKWlfH0vbJilOl1pMfJXYgF82Nb5AmTKe
 /HJ+H0rlr+/ExOGXXWOwlSG5zerUo8sLJAnV7Rx3fcI9OvLxADyHLwXQ63YOdH0vpUon
 RW9A==
X-Gm-Message-State: ACrzQf2p/nNt2YlsSFjVd+X/PHfSE1njHpb+AqayjG9dDbYenmwxYdiJ
 iRT7avM+tFd+ui5HHhkIaoWYClPoiWt4AfFXNpTUiw==
X-Google-Smtp-Source: AMsMyM7De/9dx5rvLkUXiEMENOXrcabNaS46duo0p3ODzyDJhzzbtcEstux2UW5Xef0qQZaCHX+iifRVf5LNG1hnmFw=
X-Received: by 2002:a05:6638:12c2:b0:35a:6dc2:891 with SMTP id
 v2-20020a05663812c200b0035a6dc20891mr10221862jas.316.1664169872766; Sun, 25
 Sep 2022 22:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-15-4844816c9808@baylibre.com>
 <e993c25e-f334-e1ca-73f8-58cf141c521e@linaro.org>
In-Reply-To: <e993c25e-f334-e1ca-73f8-58cf141c521e@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 13:24:20 +0800
Message-ID: <CAGXv+5FYjj6=WHWBvNRDmpw2Ux8RJ4a2fT1gXk3+eXSqt9poeQ@mail.gmail.com>
Subject: Re: [PATCH v1 15/17] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8195
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Guillaume Ranquet <granquet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 3:20 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 19/09/2022 18:56, Guillaume Ranquet wrote:
> > Add dt-binding documentation of dpi for MediaTek MT8195 SoC.
> >
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > index 5bb23e97cf33..2c7ecef54986 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > @@ -24,6 +24,7 @@ properties:
> >        - mediatek,mt8183-dpi
> >        - mediatek,mt8186-dpi
> >        - mediatek,mt8192-dpi
> > +      - mediatek,mt8195-dpi
> >        - mediatek,mt8195-dp-intf
>
> Aren't these the same?

*-dpi are MIPI DPI (as in parallel data with DDR modes) encoders.
*-dp-intf are Display Port encoder.

Totally distinguishable. :)

The hardware blocks seem similar upon cursory comparison of the register
tables, with the base layout being the same, and sharing registers for
basic settings such as the display timings.

The DPI ones have some extra registers, presumably to control the signals
or output width. The DP one has some registers of its own that only make
sense for Display Port.


ChenYu
