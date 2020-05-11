Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334521CE8F6
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 01:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E5A6E7EC;
	Mon, 11 May 2020 23:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B376E7EC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 23:15:57 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id i13so16654586oie.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 16:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=WzMRJJiJS3jDKX4S6UKZJHW30saEkCLvSAVigDiDovQ=;
 b=DS2DP+n4055qKcuvXiTWw0AedOlm9/mdr429flNW99UsHDAP2gzlA4OjtIjfDfUA4f
 DZOTeg0PDdIptLmRM5AruTBF0htRpOniFad8RnM2F6uxpGHe4ZsgVcDj0mQKgXI5UKEx
 hc9iXqlIAIjEc0//dxuMYT+yM4XSJOLxrfrYpLM/xxe/MbIg4VUiGluzMaKc9PiD7sXk
 NLkUhles4mAhel/mVSRdMmo4Nk6X6jhrfhlXXKNRsq7ny5q3qKRRiq2jW4g7QPeEsNov
 dALKnH3gNLo517VzVUErx2NyKtRJsDogasBjUliDXCwHYE2FEAWTbPoNzImtWi+fuepn
 /xwg==
X-Gm-Message-State: AGi0PuZaenguO/45PIZxpyJ8kAkPHSYPY2ilIltEdYGw4nyQK08Nee1C
 1SJxjpDZicZ9WOzXiAKTyA==
X-Google-Smtp-Source: APiQypLm7tq7BIUCDIvc1psG46O7o0EE7PfK0l+06rc9tI2PZnMBjqKgzAYy/l5gUlzlKgNaz05R5Q==
X-Received: by 2002:aca:75c3:: with SMTP id q186mr20355965oic.41.1589238956239; 
 Mon, 11 May 2020 16:15:56 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 33sm2827163otx.31.2020.05.11.16.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:15:55 -0700 (PDT)
Received: (nullmailer pid 18639 invoked by uid 1000);
 Mon, 11 May 2020 23:15:54 -0000
Date: Mon, 11 May 2020 18:15:54 -0500
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v3] dt-bindings: display: anx7814.txt: convert to yaml
Message-ID: <20200511231554.GA12152@bogus>
References: <20200427100908.11809-1-ricardo.canuelo@collabora.com>
 <676aaa45-b4cb-104e-de37-2508f0ab634d@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <676aaa45-b4cb-104e-de37-2508f0ab634d@collabora.com>
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
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 27, 2020 at 03:52:44PM +0200, Enric Balletbo i Serra wrote:
> Hi Ricardo,
> =

> Thank you for your patch.
> =

> On 27/4/20 12:09, Ricardo Ca=F1uelo wrote:
> > This converts the Analogix ANX7814 bridge DT binding to yaml. Port
> > definitions and descriptions were expanded, apart from that it's a
> > direct translation from the original binding.
> > =

> > Signed-off-by: Ricardo Ca=F1uelo <ricardo.canuelo@collabora.com>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> > Changes in v3 (suggested by Sam Ravnborg):
> >   - Rename example node i2c0 to i2c.
> > =

> > Changes in v2 (suggested by Enric Balletbo):
> >   - File name change: use full compatible string.
> >   - Binding description removed.
> >   - #address-cells and #size-cells properties removed from ports node.
> >   - Example node renamed: anx7814 -> bridge.
> > =

> > Tested with:
> > make dt_binding_check ARCH=3Darm64 DT_SCHEMA_FILES=3D<.../analogix,anx7=
814.yaml>
> > make dtbs_check ARCH=3Darm64 DT_SCHEMA_FILES=3D<.../analogix,anx7814.ya=
ml>
> > =

> >  .../display/bridge/analogix,anx7814.yaml      | 124 ++++++++++++++++++
> >  .../bindings/display/bridge/anx7814.txt       |  42 ------
> >  2 files changed, 124 insertions(+), 42 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/an=
alogix,anx7814.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/an=
x7814.txt
> > =

> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,=
anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,an=
x7814.yaml
> > new file mode 100644
> > index 000000000000..13f0b52edefd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814=
.yaml
> > @@ -0,0 +1,124 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/analogix,anx7814.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analogix ANX7814 SlimPort (Full-HD Transmitter)
> > +
> > +maintainers:
> > +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - analogix,anx7808
> > +      - analogix,anx7812
> > +      - analogix,anx7814
> > +      - analogix,anx7818
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C address of the device.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: Should contain the INTP interrupt.
> > +
> > +  hpd-gpios:
> > +    maxItems: 1
> > +    description: Which GPIO to use for hpd.
> > +
> > +  pd-gpios:
> > +    maxItems: 1
> > +    description: Which GPIO to use for power down.
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: Which GPIO to use for reset.
> > +
> > +  dvdd10-supply:
> > +    maxItems: 1
> > +    description: Regulator for 1.0V digital core power.
> > +
> > +  ports:
> > +    type: object
> > +    description:
> > +      A node containing input and output port nodes with endpoint
> > +      definitions as documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +      Documentation/devicetree/bindings/graph.txt
> > +
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: Video port for HDMI input.
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +      port@1:
> > +        type: object
> > +        description:
> > +          Video port for SlimPort, DisplayPort, eDP or MyDP output.
> > +
> > +        properties:
> > +          reg:
> > +            const: 1
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> =

> See below ...
> =

> > +  - hpd-gpios
> > +  - pd-gpios
> > +  - reset-gpios
> =

> I know that these gpio attributes were required in the old binding and the
> driver handles these gpios as required, but assuming that we should really
> describe the hardware _not_ the driver, strictly talking, none of these g=
pios
> are really required. The same happens with the interrupt, you can left th=
e pin
> floating and poll the registers.
> =

> So I am wondering if you should remove interrupts, *-gpios from required.=
 Maybe
> Rob Herring can give us more light on this?

Agreed.

One step further is hpd-gpios should be deprecated as it should be in a =

connector node.

> =

> Other than that:
> =

> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> =

> Thanks,
>  Enric
> =

> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        anx7814: bridge@38 {
> > +            compatible =3D "analogix,anx7814";
> > +            reg =3D <0x38>;
> > +            interrupt-parent =3D <&gpio0>;
> > +            interrupts =3D <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
> > +            hpd-gpios =3D <&pio 36 GPIO_ACTIVE_HIGH>;
> > +            pd-gpios =3D <&pio 33 GPIO_ACTIVE_HIGH>;
> > +            reset-gpios =3D <&pio 98 GPIO_ACTIVE_HIGH>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +                    anx7814_in: endpoint {
> > +                        remote-endpoint =3D <&hdmi0_out>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg =3D <1>;
> > +                    anx7814_out: endpoint {
> > +                        remote-endpoint =3D <&edp_out>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
