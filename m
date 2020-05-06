Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C041C7BEE
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 23:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF4A6E8E2;
	Wed,  6 May 2020 21:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1952B6E8E2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 21:05:29 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id s11so1975642vsm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 14:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DbG3gx1nov18ZF9OivrbC97qSSzMco18O7zWYm3eR5c=;
 b=Hyl6RtwnTMb8q8VCar5V3J6/SYeT4cHB3ePoizRu1S0Aq4kvoXdK4tew5iBcqCIVBz
 Eror3fGvoP7xkha8aBipm+P5yxcGXbiVM78O+HatzYLizfDZ8kF6pN5qTtgCOkmlPHTe
 S+1LJYyQiI9Wbq8rBiv4dpZq1knF7rXiOZn4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DbG3gx1nov18ZF9OivrbC97qSSzMco18O7zWYm3eR5c=;
 b=bd8pPXCwtSmxmvj7Cal/T/6/1iDfx+pBpMx7GJYoiXSO2iLd2wOhmGT5R8NnOm3ELF
 MxX3x+FI54f/zhusDyxq9J1enH6HI8BxuRjv/pDzSMOic6soHor0/4cFRiplUH8uEIw1
 eSCBF+KgoAmxzzy+AvSKicDWG/uO6FkV2iONpo6Of77Oc4DsjXEcrux1ukdaJVtlzrYQ
 i5gTuxSUHfM/yR6IZ6uwNacPdy3DCxT1Fca2FnnpVnIjZsImFguzdAnzDVzBXYgHvFN1
 yCilyox8HPs0zcZRHp1SejEbzlqEcLtxtgIO7omNDeIvUTa19NAbSxVnWQHI5UzHchcv
 EVlg==
X-Gm-Message-State: AGi0PuZ+A/5q5u08XMlo9gHLX1LWIdI1SB9aCMfiAdkR5sLHCcvv5Rrn
 egiOiGhzlkO8u6S5jNgaijy7O4TNpFQ=
X-Google-Smtp-Source: APiQypJRQBsIZnNpeOSw6HSZGzHgtuzt180tt1zm9XS2WXkIuAP0KsGxHH/t4hvznnZVsK385Ud8WQ==
X-Received: by 2002:a05:6102:72d:: with SMTP id
 u13mr9696560vsg.1.1588799127735; 
 Wed, 06 May 2020 14:05:27 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43])
 by smtp.gmail.com with ESMTPSA id d205sm1625056vkd.36.2020.05.06.14.05.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 14:05:26 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id e10so1965713vsp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 14:05:26 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr10016333vsq.109.1588799125882; 
 Wed, 06 May 2020 14:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200430194617.197510-1-dianders@chromium.org>
 <20200430124442.v4.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
 <20200505213450.GA8640@pendragon.ideasonboard.com>
 <CAD=FV=VZKJg0TE4nyJY8LifFzMPR3XPzdbY=NuSOBBHBeUmtNw@mail.gmail.com>
In-Reply-To: <CAD=FV=VZKJg0TE4nyJY8LifFzMPR3XPzdbY=NuSOBBHBeUmtNw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 May 2020 14:05:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WG=Qujrh4uovGigPOZsVWuLuRtY=VD5-MddEcwRMYs7g@mail.gmail.com>
Message-ID: <CAD=FV=WG=Qujrh4uovGigPOZsVWuLuRtY=VD5-MddEcwRMYs7g@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to
 yaml
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stephen Boyd <swboyd@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 5, 2020 at 3:21 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Laurent,
>
> On Tue, May 5, 2020 at 2:35 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Doug,
> >
> > Thank you for the patch.
> >
> > On Thu, Apr 30, 2020 at 12:46:15PM -0700, Douglas Anderson wrote:
> > > This moves the bindings over, based a lot on toshiba,tc358768.yaml.
> > > Unless there's someone known to be better, I've set the maintainer in
> > > the yaml as the first person to submit bindings.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >
> > > Changes in v4: None
> > > Changes in v3: None
> > > Changes in v2:
> > > - specification => specifier.
> > > - power up => power.
> > > - Added back missing suspend-gpios.
> > > - data-lanes and lane-polarities are are the right place now.
> > > - endpoints don't need to be patternProperties.
> > > - Specified more details for data-lanes and lane-polarities.
> > > - Added old example back in, fixing bugs in it.
> > > - Example i2c bus is just called "i2c", not "i2c1" now.
> > >
> > >  .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 ------
> > >  .../bindings/display/bridge/ti,sn65dsi86.yaml | 279 ++++++++++++++++++
> > >  2 files changed, 279 insertions(+), 87 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
> > > deleted file mode 100644
> > > index 8ec4a7f2623a..000000000000
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
> > > +++ /dev/null
> > > @@ -1,87 +0,0 @@
> > > -SN65DSI86 DSI to eDP bridge chip
> > > ---------------------------------
> > > -
> > > -This is the binding for Texas Instruments SN65DSI86 bridge.
> > > -http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
> > > -
> > > -Required properties:
> > > -- compatible: Must be "ti,sn65dsi86"
> > > -- reg: i2c address of the chip, 0x2d as per datasheet
> > > -- enable-gpios: gpio specification for bridge_en pin (active high)
> > > -
> > > -- vccio-supply: A 1.8V supply that powers up the digital IOs.
> > > -- vpll-supply: A 1.8V supply that powers up the displayport PLL.
> > > -- vcca-supply: A 1.2V supply that powers up the analog circuits.
> > > -- vcc-supply: A 1.2V supply that powers up the digital core.
> > > -
> > > -Optional properties:
> > > -- interrupts-extended: Specifier for the SN65DSI86 interrupt line.
> > > -
> > > -- gpio-controller: Marks the device has a GPIO controller.
> > > -- #gpio-cells    : Should be two. The first cell is the pin number and
> > > -                   the second cell is used to specify flags.
> > > -                   See ../../gpio/gpio.txt for more information.
> > > -- #pwm-cells : Should be one. See ../../pwm/pwm.yaml for description of
> > > -               the cell formats.
> > > -
> > > -- clock-names: should be "refclk"
> > > -- clocks: Specification for input reference clock. The reference
> > > -       clock rate must be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
> > > -
> > > -- data-lanes: See ../../media/video-interface.txt
> > > -- lane-polarities: See ../../media/video-interface.txt
> > > -
> > > -- suspend-gpios: specification for GPIO1 pin on bridge (active low)
> > > -
> > > -Required nodes:
> > > -This device has two video ports. Their connections are modelled using the
> > > -OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> > > -
> > > -- Video port 0 for DSI input
> > > -- Video port 1 for eDP output
> > > -
> > > -Example
> > > --------
> > > -
> > > -edp-bridge@2d {
> > > -     compatible = "ti,sn65dsi86";
> > > -     #address-cells = <1>;
> > > -     #size-cells = <0>;
> > > -     reg = <0x2d>;
> > > -
> > > -     enable-gpios = <&msmgpio 33 GPIO_ACTIVE_HIGH>;
> > > -     suspend-gpios = <&msmgpio 34 GPIO_ACTIVE_LOW>;
> > > -
> > > -     interrupts-extended = <&gpio3 4 IRQ_TYPE_EDGE_FALLING>;
> > > -
> > > -     vccio-supply = <&pm8916_l17>;
> > > -     vcca-supply = <&pm8916_l6>;
> > > -     vpll-supply = <&pm8916_l17>;
> > > -     vcc-supply = <&pm8916_l6>;
> > > -
> > > -     clock-names = "refclk";
> > > -     clocks = <&input_refclk>;
> > > -
> > > -     ports {
> > > -             #address-cells = <1>;
> > > -             #size-cells = <0>;
> > > -
> > > -             port@0 {
> > > -                     reg = <0>;
> > > -
> > > -                     edp_bridge_in: endpoint {
> > > -                             remote-endpoint = <&dsi_out>;
> > > -                     };
> > > -             };
> > > -
> > > -             port@1 {
> > > -                     reg = <1>;
> > > -
> > > -                     edp_bridge_out: endpoint {
> > > -                             data-lanes = <2 1 3 0>;
> > > -                             lane-polarities = <0 1 0 1>;
> > > -                             remote-endpoint = <&edp_panel_in>;
> > > -                     };
> > > -             };
> > > -     };
> > > -}
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > new file mode 100644
> > > index 000000000000..6d7d40ad45ac
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > @@ -0,0 +1,279 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi86.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SN65DSI86 DSI to eDP bridge chip
> > > +
> > > +maintainers:
> > > +  - Sandeep Panda <spanda@codeaurora.org>
> > > +
> > > +description: |
> > > +  The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs eDP.
> > > +  http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ti,sn65dsi86
> > > +
> > > +  reg:
> > > +    const: 0x2d
> > > +
> > > +  enable-gpios:
> > > +    maxItems: 1
> > > +    description: GPIO specifier for bridge_en pin (active high).
> > > +
> > > +  suspend-gpios:
> > > +    maxItems: 1
> > > +    description: GPIO specifier for GPIO1 pin on bridge (active low).
> > > +
> > > +  vccio-supply:
> > > +    description: A 1.8V supply that powers the digital IOs.
> > > +
> > > +  vpll-supply:
> > > +    description: A 1.8V supply that powers the DisplayPort PLL.
> > > +
> > > +  vcca-supply:
> > > +    description: A 1.2V supply that powers the analog circuits.
> > > +
> > > +  vcc-supply:
> > > +    description: A 1.2V supply that powers the digital core.
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +    description:
> > > +      Clock specifier for input reference clock. The reference clock rate must
> > > +      be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
> > > +
> > > +  clock-names:
> > > +    const: refclk
> > > +
> > > +  gpio-controller: true
> > > +  '#gpio-cells':
> > > +    const: 2
> > > +    description:
> > > +      First cell is pin number, second cell is flags.  GPIO pin numbers are
> > > +      1-based to match the datasheet.  See ../../gpio/gpio.txt for more
> > > +      information.
> > > +
> > > +  '#pwm-cells':
> > > +    const: 1
> > > +    description: See ../../pwm/pwm.yaml for description of the cell formats.
> > > +
> > > +  ports:
> > > +    type: object
> >
> > Maybe
> >
> >     additionalProperties: false
> >
> > here ?
>
> Ah, this is to keep people from adding "additionalProperties" under
> the ports node.  I will hold off on sending v5 for now.  If there
> happens to be nothing else wrong I'm happy for this to be added by a
> maintainer when landing or I can quickly spin a v5.
>
>
> > > +
> > > +    properties:
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +      port@0:
> > > +        type: object
> > > +        additionalProperties: false
> > > +
> > > +        description:
> > > +          Video port for MIPI DSI input
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +
> > > +          endpoint:
> > > +            type: object
> > > +            additionalProperties: false
> > > +
> > > +            properties:
> > > +              remote-endpoint: true
> > > +
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +                items:
> > > +                  enum:
> > > +                    - 0
> > > +                    - 1
> > > +                    - 2
> > > +                    - 3
> > > +                description: See ../../media/video-interface.txt
> >
> > And maybe
> >                 uniqueItems: true
> >
> > ? Same for port@1.
>
> Sounds good.  Again, I'll hold off on sending v5 for now and (if no
> other problems) happy if this gets done when applied.
>
>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I didn't want to churn the whole series, so I ended up posting a patch
that addressed the issues you mentioned and a few others.  It could be
squashed into this patch if desired.  I'm also happy to re-post this
series with that patch squashed in.  See:

https://lore.kernel.org/r/20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
