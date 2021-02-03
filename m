Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D7A30DECA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 16:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB4B6EB2D;
	Wed,  3 Feb 2021 15:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15BF6EB2A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 15:55:21 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id h192so366791oib.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 07:55:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qT9vhKEcJnv2UxHfk3LsH4oahpbnsqDoYZLdzv8tkwQ=;
 b=E+POGdeEfy4cxYsdfXjI2ckwzY0QeyuJkn2I1P/HG8m7VgVu3o6HpF6W4UOcHC68sR
 2rIjQDFi6FTbBDeZC0NXbHVrnjMDnRzacZlHZVhrzhkkOwya2j/c1UUk9LGY7r/LIFUT
 K/AXfAgSK2e9bGGNmj+dZZa903rmSz2EHxg7lzWCptyC5PoFx1xaoTLp5e0G1klDMKpu
 Sweu8fGTTL3lL/lVIm/CaKSZatN4u8RU4KUSLai7PjtmhvgMiGKolv34XEgSn8TvVZvw
 C/0OdMqBY+BVAoME3lOAZ5Ra5WBOkp8a27y87ykM7zvTvlNjPz/QPSGj84sKadKJFvaG
 EnOw==
X-Gm-Message-State: AOAM532fXXcLArHx5pojH8gqUlAKcyD+f7h/uM/oRV9QNBDtGTF+yz4n
 sDE3ACTe0MiaE5Ia6MDSb9w6VVr36w==
X-Google-Smtp-Source: ABdhPJxmOBQcH5R+lFiUlGBqVbuj5kwZxcJFcUI25C3II5lOgKlwz+nfG7ePzMnfdKQ5jcv5RyiyOg==
X-Received: by 2002:aca:4e13:: with SMTP id c19mr2424431oib.66.1612367721055; 
 Wed, 03 Feb 2021 07:55:21 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o14sm481868oof.38.2021.02.03.07.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 07:55:19 -0800 (PST)
Received: (nullmailer pid 1895243 invoked by uid 1000);
 Wed, 03 Feb 2021 15:55:17 -0000
Date: Wed, 3 Feb 2021 09:55:17 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] dt-bindings: Fix errors in 'if' schemas
Message-ID: <20210203155517.GC3706951@robh.at.kernel.org>
References: <20210202205544.24812-1-robh@kernel.org>
 <20210202205544.24812-3-robh@kernel.org>
 <CAMuHMdVvtUvrQh3-3kxaqqWvHnF_UOQmt-6jq_GkX8g=cszUug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVvtUvrQh3-3kxaqqWvHnF_UOQmt-6jq_GkX8g=cszUug@mail.gmail.com>
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

On Wed, Feb 03, 2021 at 09:01:23AM +0100, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Tue, Feb 2, 2021 at 9:55 PM Rob Herring <robh@kernel.org> wrote:
> > Properties in if/then schemas weren't getting checked by the meta-schemas.
> > Enabling meta-schema checks finds several errors.
> >
> > The use of an 'items' schema (as opposed to the list form) is wrong in
> > some cases as it applies to all entries. 'contains' is the correct schema
> > to use in the case of multiple entries.
> 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > @@ -81,9 +81,8 @@ properties:
> >  if:
> >    properties:
> >      compatible:
> > -      items:
> > -        enum:
> > -          - renesas,usb2-phy-r7s9210
> > +      contains:
> > +        const: renesas,usb2-phy-r7s9210
> 
> Single entry, so "contains" not needed?

No, you are misunderstanding how these work. 'contains' means at least 
one entry in an array passes with the subschema. In this case, 
'renesas,usb2-phy-r7s9210' must appear somewhere in the 'compatible' 
values. (Before, it said *every* entry must be 
'renesas,usb2-phy-r7s9210'.) As there is a fallback compatible, we need 
'contains'.

> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > @@ -76,11 +76,10 @@ required:
> >  if:
> >    properties:
> >      compatible:
> > -      items:
> > -        enum:
> > -          - renesas,pfc-r8a73a4
> > -          - renesas,pfc-r8a7740
> > -          - renesas,pfc-sh73a0
> > +      enum:
> > +        - renesas,pfc-r8a73a4
> > +        - renesas,pfc-r8a7740
> > +        - renesas,pfc-sh73a0
> 
> Missing "contains"?

No. In this case, 'compatible' is always a single entry, so no 
'contains' needed (but would work). If compatible is one of these 3 
strings, then the 'if' is true.

The original way would actually work in this case (i.e. is valid 
json-schema), but we require 'items' to have a size (maxItems/minItems) 
in our meta-schema.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
