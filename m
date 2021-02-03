Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33BD30DF07
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 17:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFD06EB20;
	Wed,  3 Feb 2021 16:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A5E6EB20
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 16:03:05 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id h192so396045oib.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 08:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BcE4ZZBKyxCDLDrYAu9i4Md6o808j4TR1LnI5e2y0b0=;
 b=QJ5N5PX+rBo4zIavOJcuE+8zJmqoRtZALHWy9wIzi6fz2+EeIiFGwos/LjZRV3c0Mu
 4chDpt59guBuVt+xyXJSZuXwdfltQsfk4UqL+TJNZI82PcPpnzXnkD0cpYPMc2ptxGDt
 hbk10frBNAwTvJWnA7XRuUKZlFdH1CMHk5Pxby5rtITZsHs7XI/Wr+A89OhCTlihxJGE
 PKHyXhyAzSu2HXi52DVGJqwR6b0rFBwB8c0/44WtDGp7l69FFQnyJAKmaShm8skENyzI
 fa+TLEqOG3S8S/1YDZOT19LhKDbpwF4JnSvUWifCCcK0Uixlzi13veYU/flstPAPMLtw
 /eCg==
X-Gm-Message-State: AOAM530Ru0bZ0Y1nrZKC2UN0MLRxRf7a2du9IzbiCOZD1Qr/tsh8ZHUF
 XuR6nyRMCOQRV/1vsubf0RePnxfOHTgNtqcSZNI=
X-Google-Smtp-Source: ABdhPJy5RnEli5EScDsGGPC/30HmbHWChMG7KZn1WeCaaLseFVr6EQuBii7Iq7M5O8vzqs7BmEy6ag0EovkF5KtgUsQ=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr2343251oiy.148.1612368184741; 
 Wed, 03 Feb 2021 08:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20210202205544.24812-1-robh@kernel.org>
 <20210202205544.24812-3-robh@kernel.org>
 <CAMuHMdVvtUvrQh3-3kxaqqWvHnF_UOQmt-6jq_GkX8g=cszUug@mail.gmail.com>
 <20210203155517.GC3706951@robh.at.kernel.org>
In-Reply-To: <20210203155517.GC3706951@robh.at.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Feb 2021 17:02:53 +0100
Message-ID: <CAMuHMdVp-YXtMBPistV0XPDHoSbW6Rz4c7=t3y2JB7B56LniBg@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: Fix errors in 'if' schemas
To: Rob Herring <robh@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vincent Cheng <vincent.cheng.xh@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tali Perry <tali.perry1@gmail.com>, Daniel Palmer <daniel@thingy.jp>,
 Linux I2C <linux-i2c@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Will Deacon <will@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds <linux-leds@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Joerg Roedel <joro@8bytes.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Ray Jui <rjui@broadcom.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Avi Fishman <avifishman70@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Wed, Feb 3, 2021 at 4:55 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Feb 03, 2021 at 09:01:23AM +0100, Geert Uytterhoeven wrote:
> > On Tue, Feb 2, 2021 at 9:55 PM Rob Herring <robh@kernel.org> wrote:
> > > Properties in if/then schemas weren't getting checked by the meta-schemas.
> > > Enabling meta-schema checks finds several errors.
> > >
> > > The use of an 'items' schema (as opposed to the list form) is wrong in
> > > some cases as it applies to all entries. 'contains' is the correct schema
> > > to use in the case of multiple entries.
> >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > > @@ -81,9 +81,8 @@ properties:
> > >  if:
> > >    properties:
> > >      compatible:
> > > -      items:
> > > -        enum:
> > > -          - renesas,usb2-phy-r7s9210
> > > +      contains:
> > > +        const: renesas,usb2-phy-r7s9210
> >
> > Single entry, so "contains" not needed?
>
> No, you are misunderstanding how these work. 'contains' means at least
> one entry in an array passes with the subschema. In this case,
> 'renesas,usb2-phy-r7s9210' must appear somewhere in the 'compatible'
> values. (Before, it said *every* entry must be
> 'renesas,usb2-phy-r7s9210'.) As there is a fallback compatible, we need
> 'contains'.
>
> > > --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > > @@ -76,11 +76,10 @@ required:
> > >  if:
> > >    properties:
> > >      compatible:
> > > -      items:
> > > -        enum:
> > > -          - renesas,pfc-r8a73a4
> > > -          - renesas,pfc-r8a7740
> > > -          - renesas,pfc-sh73a0
> > > +      enum:
> > > +        - renesas,pfc-r8a73a4
> > > +        - renesas,pfc-r8a7740
> > > +        - renesas,pfc-sh73a0
> >
> > Missing "contains"?
>
> No. In this case, 'compatible' is always a single entry, so no
> 'contains' needed (but would work). If compatible is one of these 3
> strings, then the 'if' is true.
>
> The original way would actually work in this case (i.e. is valid
> json-schema), but we require 'items' to have a size (maxItems/minItems)
> in our meta-schema.

Thanks for the explanation!
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
