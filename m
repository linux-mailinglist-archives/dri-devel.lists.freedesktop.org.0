Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B743C5F34
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 17:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7FD898B6;
	Mon, 12 Jul 2021 15:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA57D89872
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 15:23:40 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id hr1so35377778ejc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VA3yp4yZWDVxCC+ZLuEwER2TrK+o/mFjvWm7UpsSPIY=;
 b=NnYB8MzvR3bWYuv07pdYMOpvxr7ZdT5X5LJILgCRSWZa6lYStLwh1aVJo2KvQyrbp4
 07/iNnTJKcR7XYGQJpOCCQ7X70rHvWg7n+W8gkVzWxH2wQDH/PiQzdZoA9ELdENxMI0B
 GHtT+7zthyIEJ7kQGJxYi4iA+Uga6sZ0/5rH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VA3yp4yZWDVxCC+ZLuEwER2TrK+o/mFjvWm7UpsSPIY=;
 b=ZdLmuXYxRhjiwB55r4jPxqilXSpjoHQGfb+XDPUXkQcVsr+CmyIA9byHVDlje/NB7R
 b1j4gJ3IOcz8sjNUnZdcx6p4wI6N4tYrDFdiZ0uZJ+eX3IVa2kD4wxfDKgY/lNTsnWCP
 AmYC54aiN2Zv6jnI2//bi0fLHsB5kWJ5HH6rDg9H6rv14pCZOKEBYbOAMelxKmZ4sTnq
 gF7FGBDaxWZAiTssTCz1AcKyCJ7EX2fxS4h74MOaTYNRZbXn83yi0KvdDrBMd5UCsTQg
 QUcXFBeWpq+OjA9V26HzEYs+7oManuDQXxfeoA/MxhzqNRBBkz7MNVhBsbM2LMJxGWwo
 4H3g==
X-Gm-Message-State: AOAM533IASzoaP4TfVIpoeSDYFLFT2YARha0lKWHYBryzzM5G5HsQubz
 klk0ptI851LlaXSGDhksa95TstbfbCaKuVY3yWs1SA==
X-Google-Smtp-Source: ABdhPJyh9uaWNvwE5VjJ4T2AJwMVEx/AiAZFwRgxIv+sj2fMKlHmDiozU9MZIqUPGmhK9A7ZHvT8/z/mDn3SdE6EjpA=
X-Received: by 2002:a17:906:38f:: with SMTP id
 b15mr27458618eja.186.1626103419313; 
 Mon, 12 Jul 2021 08:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-9-jagan@amarulasolutions.com>
 <20210712151322.GA1931925@robh.at.kernel.org>
In-Reply-To: <20210712151322.GA1931925@robh.at.kernel.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 12 Jul 2021 20:53:28 +0530
Message-ID: <CAMty3ZCa6sDKGvsJ3o8h6BX6CpPAuv_L17ErMcQ25-of-XNMVg@mail.gmail.com>
Subject: Re: [RFC PATCH 08/17] dt-bindings: display: bridge: Add Samsung MIPI
 DSIM bridge
To: Rob Herring <robh@kernel.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 8:43 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Jul 04, 2021 at 02:32:21PM +0530, Jagan Teki wrote:
> > Samsing MIPI DSIM bridge can be found on Exynos and NXP's
> > i.MX8M Mini and Nano SoC's.
> >
> > This dt-bindings replaces legacy exynos_dsim.txt.
> >
> > Used the example node from latest Exynos SoC instead of
> > the one used in legacy exynos_dsim.txt.
> >
> > Add dt-bingings for it.
>
> typo
>
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  .../display/bridge/samsung,mipi-dsim.yaml     | 278 ++++++++++++++++++
> >  .../bindings/display/exynos/exynos_dsim.txt   |  90 ------
> >  MAINTAINERS                                   |   1 +
> >  3 files changed, 279 insertions(+), 90 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> > new file mode 100644
> > index 000000000000..b2970734ffd7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> > @@ -0,0 +1,278 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung MIPI DSIM bridge controller
> > +
> > +maintainers:
> > +  - Inki Dae <inki.dae@samsung.com>
> > +  - Joonyoung Shim <jy0922.shim@samsung.com>
> > +  - Seung-Woo Kim <sw0312.kim@samsung.com>
> > +  - Kyungmin Park <kyungmin.park@samsung.com>
> > +  - Andrzej Hajda <a.hajda@samsung.com>
> > +  - Jagan Teki <jagan@amarulasolutions.com>
> > +
> > +description: |
> > +  Samsung MIPI DSIM bridge controller can be found it on Exynos
> > +  and i.MX8M Mini and Nano SoC's.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - samsung,exynos3250-mipi-dsi
> > +      - samsung,exynos4210-mipi-dsi
> > +      - samsung,exynos5410-mipi-dsi
> > +      - samsung,exynos5422-mipi-dsi
> > +      - samsung,exynos5433-mipi-dsi
>
> What about i.MX compatibles?

I have added in the next patch since this is yml conversation for
existing .txt bindings.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 5
> > +
> > +  clock-names:
> > +    minItems: 2
> > +    maxItems: 5
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: phandle to the phy module representing the DPHY
>
> Drop
>
> > +
> > +  phy-names:
> > +    items:
> > +      - const: dsim
> > +
> > +  samsung,phy-type:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: phandle to the samsung phy-type
> > +
> > +  power-domains:
> > +    description: phandle to the associated power domain
>
> Drop
>
> > +    maxItems: 1
> > +
> > +  samsung,power-domain:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the associated samsung power domain
> > +    maxItems: 1
> > +
> > +  vddcore-supply:
> > +    description: MIPI DSIM Core voltage supply (e.g. 1.1V)
> > +
> > +  vddio-supply:
> > +    description: MIPI DSIM I/O and PLL voltage supply (e.g. 1.8V)
> > +
> > +  samsung,burst-clock-frequency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      DSIM high speed burst mode frequency.
> > +
> > +  samsung,esc-clock-frequency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      DSIM escape mode frequency.
> > +
> > +  samsung,pll-clock-frequency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      DSIM oscillator clock frequency.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
>
> If there are no extra endpoint properties, then use
> '/schemas/graph.yaml#/properties/port'.

Okay.

>
> > +        description:
> > +          Input port node to receive pixel data from the
> > +          display controller. Exactly one endpoint must be
> > +          specified.
> > +        properties:
> > +          endpoint@0:
> > +            $ref: /schemas/graph.yaml#/properties/endpoint
> > +            description: sub-node describing the input from MIC
>
> I'd assume i.MX has a different input than MIC?

Yes, updated in next patch.

Thanks,
Jagan.
