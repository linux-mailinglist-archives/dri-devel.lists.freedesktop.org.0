Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262FE3B1DC4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 17:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34736E940;
	Wed, 23 Jun 2021 15:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85426E940
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 15:44:31 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id hz1so4768741ejc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 08:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pWTQT9hqz+DhdHnOIzqiipB68pLsb96pnxhgmji3vzI=;
 b=X9VJDJSMEjzSv5poRhninV0Ko6KwWKOuAF5hxrAzwbxUtKkcPOumHqjO3c1VmRbsDM
 qICfLsc8OPQEzKrrAzOxlQtrnL1nG5MCwKYxpCozXGTwyuWw8Ap1bD00/G2en4x8mRKi
 Eps/Bl6EXlrpDJ+lEJWC49zq7b/WBPVrzLUgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pWTQT9hqz+DhdHnOIzqiipB68pLsb96pnxhgmji3vzI=;
 b=PUc2fRNWqvrEkIBSfy2R2HuziinpgMwHE6sQ4HGkhIZx/jahOjhS4FH230GK/VXUAW
 ydq+rP8f2vBSpUFfXzMQjwXRURCbGmXsuu7F773Pu2HK62Qx0CpHNOa2c0AURnOkDxKR
 jv4Wf8xhbcsLKrFNe0EtaLGRa8Mi6XcSQlKagR6rIDMoor1/UzgsmJUjLK9L6rFxa+oo
 AweAt/PEq+CWIPZ2dky39LTj/plbB8I8oLsgmYJJZzDGSTeHuTAL1fE52h4qdLkHglo0
 tXnJbLUbtZXt/rO9He7CTrkP1kpA/i/jTk7WbVK0GFZAwv5x/9zmo/43qavJFKQ4Aoz6
 klCg==
X-Gm-Message-State: AOAM531nAnDDDXy2LEvyXuDLKyuj0SIN4a/508BBsu1FilJHysKYlVb4
 R+yD11YgIZaLgERgjWBOxwbvZ9/Vlw760aieIZQCh/Swtjk=
X-Google-Smtp-Source: ABdhPJxs1ynO88wXheyf2VPD1FkNJ7s8VcqhwpyUGgxU32FDfbf4AgGMZjAswMZGjJH+ka9QUIvnYyYkKU9gCG/7UDQ=
X-Received: by 2002:a17:906:b887:: with SMTP id
 hb7mr709041ejb.252.1624463070457; 
 Wed, 23 Jun 2021 08:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-2-jagan@amarulasolutions.com>
 <YNDSpAJdI3OKugSL@pendragon.ideasonboard.com>
In-Reply-To: <YNDSpAJdI3OKugSL@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 23 Jun 2021 21:14:19 +0530
Message-ID: <CAMty3ZDy+zAFgRW2OA5srsYNc-Qd8JCp3uLTWWkLRZJQKEMpAA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/9] dt-bindings: display: bridge: Add Samsung SEC
 MIPI DSIM bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Tomasz Figa <t.figa@samsung.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Robert Foss <robert.foss@linaro.org>, Fancy Fang <chen.fang@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Jun 21, 2021 at 11:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> Thank you for the patch.
>
> On Mon, Jun 21, 2021 at 12:54:16PM +0530, Jagan Teki wrote:
> > Samsung SEC MIPI DSIM Bridge controller is MIPI DSI bridge
> > available in NXP's i.MX8M Mini and Nano Processors.
> >
> > Add dt-bingings for it.
> >
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  .../display/bridge/samsung,sec-dsim.yaml      | 184 ++++++++++++++++++
> >  1 file changed, 184 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml
> > new file mode 100644
> > index 000000000000..32f67f313dfd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml
> > @@ -0,0 +1,184 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/samsung,sec-dsim.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung SEC MIPI DSIM Bridge controller on i.MX8M Mini and Nano SoCs
> > +
> > +maintainers:
> > +  - Jagan Teki <jagan@amarulasolutions.com>
> > +
> > +description: |
> > +  NWL MIPI-DSI host controller found on i.MX8 platforms. This is a dsi bridge for
> > +  the SOCs NWL MIPI-DSI host controller.
> > +
> > +allOf:
> > +  - $ref: ../dsi-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mm-sec-dsim
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
> > +  assigned-clock-parents: true
> > +  assigned-clock-rates: true
> > +  assigned-clocks: true
> > +
> > +  clocks:
> > +    items:
> > +      - description: DSI bus clock
> > +      - description: PHY_REF clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: phy_ref
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: phandle to the phy module representing the DPHY
> > +
> > +  phy-names:
> > +    items:
> > +      - const: dphy
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +    description: phandle to the associated power domain
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
>
> Why do you need those three properties ? They look like configuration
> information to me, not system description. If they are needed, their
> description needs to explain how to set them. Looking at the three
> descriptions above I have no idea what to select for those frequencies.

DSIM PLLOutput PMS values are computed based on these clock values as
per exynos dsi code is concern. Look like there is other way to
compute PMS in SEC DSIM(at least on i.MX8MM) unlike exynos. Let me
come back with new changes, thanks!

Jagan.
