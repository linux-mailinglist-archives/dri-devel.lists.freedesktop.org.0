Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6792B30D482
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826C26E9C9;
	Wed,  3 Feb 2021 08:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D00C6E9C9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 08:01:35 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id d20so10075369oiw.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 00:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GUaHpRuxDtXxAFdZvqP757XADeBZ3LieB9iSp5HePYo=;
 b=Mfc2C5lDRpT1WT7DVXHVmAbdiOskWw040PH+VhDvtxSDRC6+Yw1UQI0Lmle475z3to
 MA4cagqwWWTyy72Ia2k2yoCqBYJEWwRjzIcfYl8IJFxhgaHrH5uzmiCdeiiaWOLo3N7b
 wVJd+MhR40gXapHjU81Ps/B/zqyCLHLgh6VriVS44cU5ALP3KrOv3PVwCXJeZ/zoOhqU
 U+dNgThYp1BMRlzcEJsJwVgeaokdN2BBoDnq9ht+SO+9zDwLe87G1QYlg6nHnnrcmzU1
 C3uXSC7rmD3nhGxqFqOmPWN04zP5H7jhbdBRUS2Q90266ITR25jO29eA5l5uSzy8N8OA
 Sdmg==
X-Gm-Message-State: AOAM531J6RXtZzfN3mHPQvWRr2rPWC74rtoltIgEV6ZkWuruDSYkUimP
 yms8PFhaNWf3JbKcAARCx00YzHZ2xtALzShjpI8=
X-Google-Smtp-Source: ABdhPJwqsuDHPLo5fOlX0wowinMiQhY3VwM6kpoW5w0c8+SrgPYoxRUVXo5rAHqaZ3aooghGfjdJuw8T8GflSuyMMQU=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr1200640oiy.148.1612339294830; 
 Wed, 03 Feb 2021 00:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20210202205544.24812-1-robh@kernel.org>
 <20210202205544.24812-3-robh@kernel.org>
In-Reply-To: <20210202205544.24812-3-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Feb 2021 09:01:23 +0100
Message-ID: <CAMuHMdVvtUvrQh3-3kxaqqWvHnF_UOQmt-6jq_GkX8g=cszUug@mail.gmail.com>
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

On Tue, Feb 2, 2021 at 9:55 PM Rob Herring <robh@kernel.org> wrote:
> Properties in if/then schemas weren't getting checked by the meta-schemas.
> Enabling meta-schema checks finds several errors.
>
> The use of an 'items' schema (as opposed to the list form) is wrong in
> some cases as it applies to all entries. 'contains' is the correct schema
> to use in the case of multiple entries.

> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> @@ -81,9 +81,8 @@ properties:
>  if:
>    properties:
>      compatible:
> -      items:
> -        enum:
> -          - renesas,usb2-phy-r7s9210
> +      contains:
> +        const: renesas,usb2-phy-r7s9210

Single entry, so "contains" not needed?

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> @@ -76,11 +76,10 @@ required:
>  if:
>    properties:
>      compatible:
> -      items:
> -        enum:
> -          - renesas,pfc-r8a73a4
> -          - renesas,pfc-r8a7740
> -          - renesas,pfc-sh73a0
> +      enum:
> +        - renesas,pfc-r8a73a4
> +        - renesas,pfc-r8a7740
> +        - renesas,pfc-sh73a0

Missing "contains"?

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
