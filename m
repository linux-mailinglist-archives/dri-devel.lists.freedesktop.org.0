Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD14ACC91
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 00:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B705010E142;
	Mon,  7 Feb 2022 23:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488FA10E142
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 23:21:01 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 f11-20020a4abb0b000000b002e9abf6bcbcso15558564oop.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 15:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KTjBO+D6w51lndsehH7eTffqqV1R65NE8mNByUSg+rQ=;
 b=H/R+A2eXgqyRG/UMfYKII/NBu0s+oYpww0nlgEKXf78gdiAbPBW2f18NkSjB0cdNyk
 iC4FZXDujXWFLXIpSe/anvhocmnfO8QA1IFQJBs93FE4v9n5786kb0wDFa45mHFcffNu
 MY6Z1VAL96s76PwNpZsWYsoodVmUpyW2YiUY9SH7INlhGMQ2S/nU7varMERe2Sejgmoj
 3EenzLwAHLk6f9yEXt5hDbWlMSdh4L6p3GfZTKYOgAOV44LFthGpKVM15oJbRhf1BKOO
 56QRnZU+DUoHbmXSFAe9JCw76GaIokIjTKV2nhQbWiDHnLwQtkO53xKOqrJh/HlPImYG
 kYeQ==
X-Gm-Message-State: AOAM53251w3kTj6Rjv/tvuS4cF/ptwr652YjW7bY0balJUkvMgteqLkp
 5jO2g+xnCMdp1p5/BrpLqO410n6zZA==
X-Google-Smtp-Source: ABdhPJy+cQ2hkA1Dm4VG+Ydq/wSJxDHBBmLy0jg6LEw1cMa5lAFvpNYjiXp41aiAt5BOnXDXylKtgA==
X-Received: by 2002:a05:6870:9884:: with SMTP id
 eg4mr436317oab.80.1644276060289; 
 Mon, 07 Feb 2022 15:21:00 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bg10sm332272oib.33.2022.02.07.15.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 15:20:59 -0800 (PST)
Received: (nullmailer pid 1117233 invoked by uid 1000);
 Mon, 07 Feb 2022 23:20:58 -0000
Date: Mon, 7 Feb 2022 17:20:58 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Message-ID: <YgGpWo80TvfTknhx@robh.at.kernel.org>
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-2-noralf@tronnes.org>
 <20220127093722.hsed3ny3gzk55o7w@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220127093722.hsed3ny3gzk55o7w@houat>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 10:37:22AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Jan 25, 2022 at 06:56:58PM +0100, Noralf Trønnes wrote:
> > Add binding for MIPI DBI compatible SPI panels.
> > 
> > v2:
> > - Fix path for panel-common.yaml
> > - Use unevaluatedProperties
> > - Drop properties which are in the allOf section
> > - Drop model property (Rob)
> > 
> > Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> > ---
> >  .../display/panel/panel-mipi-dbi-spi.yaml     | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> > new file mode 100644
> > index 000000000000..b7cbeea0f8aa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MIPI DBI SPI Panels Device Tree Bindings
> > +
> > +maintainers:
> > +  - Noralf Trønnes <noralf@tronnes.org>
> > +
> > +description:
> > +  This binding is for display panels using a MIPI DBI controller
> > +  in SPI mode.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: panel-mipi-dbi-spi
> 
> You need contains here, otherwise it will error out if you have two compatibles.

Shouldn't it always have 2?

Either way, this has to be split up between a common, shareable schema 
and specific, complete schema(s). Like this:

- A schema for everything common (that allows additional properties)

- A schema for 'panel-mipi-dbi-spi' referencing the common schema plus 
  'unevaluatedProperties: false'

- Schemas for panels with their own additional properties (regulators, 
  GPIOs, etc.)

LVDS was restructured like this IIRC.

> > +  write-only:
> > +    type: boolean
> > +    description:
> > +      Controller is not readable (ie. MISO is not wired up).
> > +
> > +  dc-gpios:
> > +    maxItems: 1
> > +    description: |
> > +      Controller data/command selection (D/CX) in 4-line SPI mode.
> > +      If not set, the controller is in 3-line SPI mode.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    spi {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            display@0{
> > +                    compatible = "panel-mipi-dbi-spi";
> 
> We should have two compatibles in the example too
> 
> Maxime


