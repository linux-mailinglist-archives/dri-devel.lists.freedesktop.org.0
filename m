Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9E4493D23
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F8D10E25A;
	Wed, 19 Jan 2022 15:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532EC10E25A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:30:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE538B81A12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1A9C004E1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642606252;
 bh=OLrV/mw6WcIgeLQa2HMwTaMX8b3pt7TE+xb2FHEMCV8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sVIsUUmrPVu8MuItu1slmlptH0cP/cfPabtLrYlZrw2zjdxQL7S3zVhNjru4LCGvm
 g0s2DApy0fhkU/zotrjucdtnkDIj88R2/fJo3oXM43wnHM7+a8wyKFNiY1R4tTqvTE
 VG9ttH8CKmNVEHbrHmxPGwhAOF4AqduPbf4lR2LZZmSVXDMNVTt99+N8bJjPvo/d61
 KUhw9QwA325ONzS0Of+Bo/i2fxccsGVVJSrDJGEZRgLVpkuHuDMMPHrCYrWBClXfhi
 9hJT68GRXCN6b+xVp9bLXr7mVlwBAnyzXx1QEHQk7x/NkSDzdarslFl1c9OWgYwmGa
 UzE0//z0eNEdw==
Received: by mail-ed1-f52.google.com with SMTP id p12so13749211edq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:30:52 -0800 (PST)
X-Gm-Message-State: AOAM530aiB5yprq31pVNNNsNbXafn0Yf8U1qy6wSOa0P9ymbSrz4BV6M
 5fDhKmHHPnSe1UfXdXfta43DlRJ7Vo4i5reWHA==
X-Google-Smtp-Source: ABdhPJyPYQrXxNSnCkTl5v8yMxjogVTk6EpzYA73WuLgFBNs1oJt1pAj6k4kUcCi7ejRXOlSTI1mdHZMJ5Kr9aWFF9o=
X-Received: by 2002:aa7:c587:: with SMTP id g7mr27455803edq.109.1642606240687; 
 Wed, 19 Jan 2022 07:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20220119015038.2433585-1-robh@kernel.org>
 <de35edd9-b85d-0ed7-98b6-7a41134c3ece@foss.st.com>
In-Reply-To: <de35edd9-b85d-0ed7-98b6-7a41134c3ece@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Jan 2022 09:30:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLzuYxpsNDNPXF1C=kG6HJea650iRzg1YxvNPDToeBC-A@mail.gmail.com>
Message-ID: <CAL_JsqLzuYxpsNDNPXF1C=kG6HJea650iRzg1YxvNPDToeBC-A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Linux USB List <linux-usb@vger.kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Georgi Djakov <djakov@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Joerg Roedel <joro@8bytes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 9:22 AM Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Rob,
>
> On 1/19/22 2:50 AM, Rob Herring wrote:
> > The 'phandle-array' type is a bit ambiguous. It can be either just an
> > array of phandles or an array of phandles plus args. Many schemas for
> > phandle-array properties aren't clear in the schema which case applies
> > though the description usually describes it.
> >
> > The array of phandles case boils down to needing:
> >
> > items:
> >   maxItems: 1
> >
> > The phandle plus args cases should typically take this form:
> >
> > items:
> >   - items:
> >       - description: A phandle
> >       - description: 1st arg cell
> >       - description: 2nd arg cell
> >
> > With this change, some examples need updating so that the bracketing of
> > property values matches the schema.
> >
> > Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Georgi Djakov <djakov@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Wolfgang Grandegger <wg@grandegger.com>
> > Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Vivien Didelot <vivien.didelot@gmail.com>
> > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > Cc: Vladimir Oltean <olteanv@gmail.com>
> > Cc: Kalle Valo <kvalo@kernel.org>
> > Cc: Viresh Kumar <vireshk@kernel.org>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Kevin Hilman <khilman@kernel.org>
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Zhang Rui <rui.zhang@intel.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: linux-ide@vger.kernel.org
> > Cc: linux-crypto@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: dmaengine@vger.kernel.org
> > Cc: linux-pm@vger.kernel.org
> > Cc: iommu@lists.linux-foundation.org
> > Cc: linux-leds@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Cc: linux-can@vger.kernel.org
> > Cc: linux-wireless@vger.kernel.org
> > Cc: linux-phy@lists.infradead.org
> > Cc: linux-gpio@vger.kernel.org
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-remoteproc@vger.kernel.org
> > Cc: alsa-devel@alsa-project.org
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
>
> [...]
>
> >  .../bindings/remoteproc/st,stm32-rproc.yaml   | 33 ++++++--
>
> [...]
>
> > diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> > index b587c97c282b..be3d9b0e876b 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> > @@ -29,17 +29,22 @@ properties:
> >
> >    st,syscfg-holdboot:
> >      description: remote processor reset hold boot
> > -      - Phandle of syscon block.
> > -      - The offset of the hold boot setting register.
> > -      - The field mask of the hold boot.
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > -    maxItems: 1
> > +    items:
> > +      - items:
> > +          - description: Phandle of syscon block
> > +          - description: The offset of the hold boot setting register
> > +          - description: The field mask of the hold boot
> >
> >    st,syscfg-tz:
> >      description:
> >        Reference to the system configuration which holds the RCC trust zone mode
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > -    maxItems: 1
> > +    items:
> > +      - items:
> > +          - description: Phandle of syscon block
> > +          - description: FIXME
> > +          - description: FIXME
>
>          - description: The offset of the trust zone setting register
>          - description: The field mask of the trust zone state
>
> >
> >    interrupts:
> >      description: Should contain the WWDG1 watchdog reset interrupt
> > @@ -93,20 +98,32 @@ properties:
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> >      description: |
> >        Reference to the system configuration which holds the remote
> > -    maxItems: 1
> > +    items:
> > +      - items:
> > +          - description: Phandle of syscon block
> > +          - description: FIXME
> > +          - description: FIXME
>
>          - description: The offset of the power setting register
>          - description: The field mask of the PDDS selection
>
> >
> >    st,syscfg-m4-state:
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> >      description: |
> >        Reference to the tamp register which exposes the Cortex-M4 state.
> > -    maxItems: 1
> > +    items:
> > +      - items:
> > +          - description: Phandle of syscon block with the tamp register
> > +          - description: FIXME
> > +          - description: FIXME
>
>          - description: The offset of the tamp register
>          - description: The field mask of the Cortex-M4 state
>
> >
> >    st,syscfg-rsc-tbl:
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> >      description: |
> >        Reference to the tamp register which references the Cortex-M4
> >        resource table address.
> > -    maxItems: 1
> > +    items:
> > +      - items:
> > +          - description: Phandle of syscon block with the tamp register
> > +          - description: FIXME
> > +          - description: FIXME
>
>          - description: The offset of the tamp register
>          - description: The field mask of the Cortex-M4 resource table address
>
> Please tell me if you prefer that I fix this in a dedicated patch.

Thanks! I'll fold this into this patch.

Rob
