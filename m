Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18586728924
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 22:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADF010E013;
	Thu,  8 Jun 2023 20:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864D810E013
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 20:05:56 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-777ac4344f9so47849639f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 13:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686254755; x=1688846755;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/sR8/S11r6POKJwJKZdRyyXC9EYM0/cQxZIkmiJzsI=;
 b=B2WD68oOWXSTz8ZfiGhQnl5WFekDRv6vhzceEQWAH6oqTlMYJzmxndZN8TfhjStCkX
 vp+PY4PNl+3PoN7Rl23NJn2pJWh80IOcHW5rAESW8LBOsgbDdmYLWxYj2pV5aZvAbyPN
 TlvETO+AnB+H1XhV2kEB5CPWhxet8kphjii4mRNFZrZcRuElhQyap6Go19XJ7V5UbZ5p
 Wz6xU4ecuaXz/73nQ1JJ3VhQNHZcw6rx/rghA30UWveHGzLv8g2lkfwKS1ryDCZtgjsR
 Fi5sfU2BN79+ydnpkyc9U/CyvpVW3oo46ypi3zGrn3xlmnK2NMAoSW9EfDxhw2V3hfqn
 bM9w==
X-Gm-Message-State: AC+VfDzNHDrVp9A4W4XHlgJf0WKYQ31pBD+uVFCSfgT28XANh3XKzuBG
 0Y5j4usgvLadbRRg13pedw==
X-Google-Smtp-Source: ACHHUZ4Z/oQrytUoNlri3g8lDHCGhsb5liDnpSpmhO6hxn9vEvVy6hx4AJ8tUzV/0PRd4R7ABah0Qg==
X-Received: by 2002:a05:6602:218c:b0:777:b4b7:f6ac with SMTP id
 b12-20020a056602218c00b00777b4b7f6acmr10471093iob.10.1686254755522; 
 Thu, 08 Jun 2023 13:05:55 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a02c953000000b0041672c963b3sm483509jao.50.2023.06.08.13.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 13:05:54 -0700 (PDT)
Received: (nullmailer pid 3315825 invoked by uid 1000);
 Thu, 08 Jun 2023 20:05:52 -0000
Date: Thu, 8 Jun 2023 14:05:52 -0600
From: Rob Herring <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: add mediatek MIPI CD-PHY module
 v0.5
Message-ID: <20230608200552.GA3303349-robh@kernel.org>
References: <20230524083033.486490-1-jstephan@baylibre.com>
 <20230524083033.486490-3-jstephan@baylibre.com>
 <f92c39c8-177a-e18d-c3b0-79e7349ea4db@collabora.com>
 <2jfgupyvtuenvm7x52l6bo5xzzpva7u6njeg3ecd52wwj4spv6@y3nsq7j2hl2u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2jfgupyvtuenvm7x52l6bo5xzzpva7u6njeg3ecd52wwj4spv6@y3nsq7j2hl2u>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, khilman@baylibre.com, mkorpershoek@baylibre.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 04:05:03PM +0200, Julien Stephan wrote:
> On Wed, May 24, 2023 at 11:45:30AM +0200, AngeloGioacchino Del Regno wrote:
> > Il 24/05/23 10:30, Julien Stephan ha scritto:
> > > From: Florian Sylvestre <fsylvestre@baylibre.com>
> > >
> > > This adds the bindings, for the MIPI CD-PHY module v0.5 embedded in
> > > some Mediatek soc, such as the mt8365
> > >
> > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > ---
> > >   .../bindings/phy/mediatek,mt8365-csi-rx.yaml  | 67 +++++++++++++++++++
> > >   MAINTAINERS                                   |  6 ++
> > >   2 files changed, 73 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> > > new file mode 100644
> > > index 000000000000..a1bd96a98051
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> > > @@ -0,0 +1,67 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +# Copyright (c) 2023 MediaTek, BayLibre
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/mediatek,mt8365-csi-rx.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Mediatek Sensor Interface MIPI CSI CD-PHY
> > > +
> > > +maintainers:
> > > +  - Julien Stephan <jstephan@baylibre.com>
> > > +  - Andy Hsieh <andy.hsieh@mediatek.com>
> > > +
> > > +description:
> > > +  The SENINF CD-PHY is a set of CD-PHY connected to the SENINF CSI-2
> > > +  receivers. The number of PHYs depends on the SoC model.
> > > +  Depending on the SoC model, each PHYs can be either CD-PHY or D-PHY only
> > > +  capable.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt8365-csi-rx
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#phy-cells':
> > > +    const: 0
> > > +
> > > +  mediatek,phy-type:
> >
> > Instead of declaring a phy-type here like this, can't we instead declare that in
> > the phy cells, like we're doing with MTK TPHY and like other non-MediaTek PHYs are
> > already doing?
> >
> > device {
> > 	...
> > 	phys = <&csi0_rx PHY_TYPE_CDPHY>;
> > 	...
> > }
> >
> > Regards,
> > Angelo
> >
> >
> 
> Hi Angelo,
> 
> This is a hardware property that is not dynamic, so IMHO it doesn't make sense
> to use phy argument for that. 

Why? Interrupt numbers are fixed hardware properties which go in arg 
cells.

> Some driver already use a 'phy-type'
> property (such as phy-cadence-torrent.yaml).
> 
> I was thinking of using phy argument on future upgrade when driver will
> support D-PHY and C-PHY modes so the phy user will be able to choose the
> mode.

Once you design the binding, you don't get to change it.

Rob
