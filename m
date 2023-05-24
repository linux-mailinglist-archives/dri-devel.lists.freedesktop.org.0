Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 154BC70F838
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2AA10E05E;
	Wed, 24 May 2023 14:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC38B10E025
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 14:05:11 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3093a778089so604683f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684937109; x=1687529109; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gYK7qPs3K1mFYFt83RxjkD5ObwozLtF5ga5amIDsihk=;
 b=4ZafKxfGLJdkPWBsxlTVtT+cEWZgHCeBAVxIB1Yj/ajbUZXdejKUVx11UN31nSk161
 pCLnKBPkgeIZryb+Q6Fi1k6sqDcPorkF5vUQsAjAHaI8GD7DXGa0hPWHrEgEUPnKzRUA
 CNzODjz6k+O76u81KJS7gBPhfaFPGXNwsd0gqtIEmvkelhzBSVy40S+5aGozdCCPbY3W
 T+ebSUBLH6iDUmZlgQ/Bqkb/Tuo9drKd8oBgi1JjlYIzXfz1vcdgrfv1oWMdIsV3FRkX
 FPGwAXkqnrlGOy1anD8KfMUrZOO8hxQy/qJEggfYxOK6IqPLxrppkpwbBGU9GvM/lHrW
 kTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684937109; x=1687529109;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gYK7qPs3K1mFYFt83RxjkD5ObwozLtF5ga5amIDsihk=;
 b=hDCUHWE/Uuj6JQTLShXjn9HRLzciF7btbeXtL4jxT/yBLKbocVz9IYBasECBdqxskc
 pCv5dqL/9cPPYO2V+gBK3NnVn9DHXoYfsOMX42+afzNYYUjO0l2wXQL+Rg6SNq6Xdt/1
 xitMV3bb44wsqb58k0zEJx4UA7EGyqkIdGzzDUROjZ/31UPmdM8y6O2WMXAnKF8TRRtj
 lC4TqPD3t++uYcLBhgurpzIIzLyMHRYGtzmenzYqu4vpPRfvmLiotDNqqs0Kr/AIErzh
 RSuLo9ELdiZ8nVwhhk+VQwzIi70cMAA0S9FyDdzB3aB56VYHGmtSnt12pq4cQFRY9UZF
 WFog==
X-Gm-Message-State: AC+VfDx8HLMi7riNgweN7RyubNQPAn5ofBG/eNTHFuPN5aJj00IdBe/A
 +o8nMDKhAQjRsKKHn8+BiKXLDg==
X-Google-Smtp-Source: ACHHUZ7DY/QLV/yoCNKc+5pHRfJJcvT+0JwdYcgh8jA6/pQw2WsZyH/SczX7hjf76cberK5A66uMnQ==
X-Received: by 2002:adf:e8ce:0:b0:306:34d6:6dfc with SMTP id
 k14-20020adfe8ce000000b0030634d66dfcmr12451544wrn.37.1684937109015; 
 Wed, 24 May 2023 07:05:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d6a41000000b003063176ef09sm14849411wrw.6.2023.05.24.07.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 07:05:08 -0700 (PDT)
Date: Wed, 24 May 2023 16:05:03 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: add mediatek MIPI CD-PHY module
 v0.5
Message-ID: <2jfgupyvtuenvm7x52l6bo5xzzpva7u6njeg3ecd52wwj4spv6@y3nsq7j2hl2u>
References: <20230524083033.486490-1-jstephan@baylibre.com>
 <20230524083033.486490-3-jstephan@baylibre.com>
 <f92c39c8-177a-e18d-c3b0-79e7349ea4db@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f92c39c8-177a-e18d-c3b0-79e7349ea4db@collabora.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 11:45:30AM +0200, AngeloGioacchino Del Regno wrote:
> Il 24/05/23 10:30, Julien Stephan ha scritto:
> > From: Florian Sylvestre <fsylvestre@baylibre.com>
> >
> > This adds the bindings, for the MIPI CD-PHY module v0.5 embedded in
> > some Mediatek soc, such as the mt8365
> >
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >   .../bindings/phy/mediatek,mt8365-csi-rx.yaml  | 67 +++++++++++++++++++
> >   MAINTAINERS                                   |  6 ++
> >   2 files changed, 73 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> > new file mode 100644
> > index 000000000000..a1bd96a98051
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2023 MediaTek, BayLibre
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/mediatek,mt8365-csi-rx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek Sensor Interface MIPI CSI CD-PHY
> > +
> > +maintainers:
> > +  - Julien Stephan <jstephan@baylibre.com>
> > +  - Andy Hsieh <andy.hsieh@mediatek.com>
> > +
> > +description:
> > +  The SENINF CD-PHY is a set of CD-PHY connected to the SENINF CSI-2
> > +  receivers. The number of PHYs depends on the SoC model.
> > +  Depending on the SoC model, each PHYs can be either CD-PHY or D-PHY only
> > +  capable.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8365-csi-rx
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#phy-cells':
> > +    const: 0
> > +
> > +  mediatek,phy-type:
>
> Instead of declaring a phy-type here like this, can't we instead declare that in
> the phy cells, like we're doing with MTK TPHY and like other non-MediaTek PHYs are
> already doing?
>
> device {
> 	...
> 	phys = <&csi0_rx PHY_TYPE_CDPHY>;
> 	...
> }
>
> Regards,
> Angelo
>
>

Hi Angelo,

This is a hardware property that is not dynamic, so IMHO it doesn't make sense
to use phy argument for that. Some driver already use a 'phy-type'
property (such as phy-cadence-torrent.yaml).

I was thinking of using phy argument on future upgrade when driver will
support D-PHY and C-PHY modes so the phy user will be able to choose the
mode.

Does it makes sense?

Best
Julien
