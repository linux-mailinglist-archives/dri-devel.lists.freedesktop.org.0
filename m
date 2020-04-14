Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E51A8A2A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AF36E52C;
	Tue, 14 Apr 2020 18:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF6C6E52C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:50:18 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 8so1128729oiy.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kJLKdHg7KIg/aTBSlFX54Ej5jM2zmSmmce3CtEkyB7I=;
 b=enR/kIwS7ZbQVDPFNCIfJnrXTdurigFbhsbP2SplRVhT6oz84gL1hSXssxnRhLGjAj
 u0wTwQiytv6bmcVhRUgjZfP6BCOc/nWyabRDFEoLc0RwOjc8cDW57aGUf/9oZ1hrjDFs
 T2o3VdY11qaB2SrWgNm5D+mz9Jj9KYiN6o97U1BNseSGPrkaKkyvqPV8pC9qKhg53Ri9
 Ghn2kQGgyT5mBUtV639VyoY0VnWgmmH/wJXn9hBw8H10R6gAH7TVuDrvKon6sgYTIfMU
 6/XTV4u5ag0+FKhMGXaS3IBKOZOTiQ5G3amlaDxVCXMUhqROwtBZ7NfQDkGRYLhEXQBC
 6qwg==
X-Gm-Message-State: AGi0PuYR3V6FyukTh0q0sMCfpoW7nFWmDRS/YS1YAqSMQtT1Y0m3ho8v
 ctTaDpb+yo4YUkR8JkOs4g==
X-Google-Smtp-Source: APiQypLtzcCchzUOXF79zl2rruN1jX08r+ZXPGNG5bSH7kuzpzTlmA+Lg4AZoqfdULLBgml6tPBQTg==
X-Received: by 2002:aca:b382:: with SMTP id c124mr15504007oif.64.1586890217621; 
 Tue, 14 Apr 2020 11:50:17 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o128sm5788648oih.41.2020.04.14.11.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:50:16 -0700 (PDT)
Received: (nullmailer pid 3195 invoked by uid 1000);
 Tue, 14 Apr 2020 18:50:16 -0000
Date: Tue, 14 Apr 2020 13:50:16 -0500
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 24/36] dt-bindings: display: convert toppoly panels to
 DT Schema
Message-ID: <20200414185016.GA31449@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-25-sam@ravnborg.org>
 <981A14FA-AFB0-47B6-9EEF-E1C09828976F@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <981A14FA-AFB0-47B6-9EEF-E1C09828976F@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Marek Belisko <marek@goldelico.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 08:21:16AM +0200, H. Nikolaus Schaller wrote:
> Hi Sam,
> 
> > Am 08.04.2020 um 21:50 schrieb Sam Ravnborg <sam@ravnborg.org>:
> > 
> > v2:
> >  - dropped use of spi-slave.yaml (Maxime)
> >  - added unevaluatedProperties (Maxime)
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Marek Belisko <marek@goldelico.com>
> > Cc: H. Nikolaus Schaller <hns@goldelico.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> > .../bindings/display/panel/tpo,td.yaml        | 65 +++++++++++++++++++
> > .../bindings/display/panel/tpo,td028ttec1.txt | 32 ---------
> > .../bindings/display/panel/tpo,td043mtea1.txt | 33 ----------
> > 3 files changed, 65 insertions(+), 65 deletions(-)
> > create mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> > delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
> > delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> > new file mode 100644
> > index 000000000000..4aa605613445
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/tpo,td.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Toppoly TD Panels
> > +
> > +description: |
> > +  The panel must obey the rules for a SPI slave device as specified in
> > +  spi/spi-controller.yaml
> > +
> > +maintainers:
> > +  - Marek Belisko <marek@goldelico.com>
> > +  - H. Nikolaus Schaller <hns@goldelico.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +        # Toppoly TD028TTEC1 Panel
> > +      - tpo,td028ttec1
> > +        # Toppoly TD043MTEA1 Panel
> > +      - tpo,td043mtea1
> > +
> > +  reg: true
> > +  label: true
> > +  reset-gpios: true
> > +  backlight: true
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - port
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    spi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        panel: panel@0 {
> > +            compatible = "tpo,td043mtea1";
> > +            reg = <0>;
> > +            spi-max-frequency = <100000>;
> > +            spi-cpol;
> > +            spi-cpha;
> > +
> > +            label = "lcd";
> > +
> > +            reset-gpios = <&gpio7 7 0>;
> > +
> > +            port {
> > +                lcd_in: endpoint {
> > +                    remote-endpoint = <&dpi_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> 
> I think it is possible to add two examples (the one for tpo,td028ttec1)
> as well. The reason is that it must also have spi-cs-high; which isn't
> documented anywhere else and wasn't in tpo,td028ttec1.txt.

I don't think we need another example because examples are not a 
enumeration for what's allowed. There should be an if/then schema though 
for this. That can be a follow-up IMO.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
