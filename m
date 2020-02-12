Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D6515A2E2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059876E935;
	Wed, 12 Feb 2020 08:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427546E935
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 08:08:04 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id a142so1194124oii.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 00:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gxq+7Sc2rUn1eaXQOPvDb63UOLOu7jeHo0xijtFEwKY=;
 b=kn9rPXOT1whe6uN3EofpUNeGG8rwlc4DBGp7qUoTVhuwR7/1Yl0mUuy3tgm8pImHH7
 qhpdXo44fELV2aQWZJ/43UhmNY1hqBmnNEUsA+m/I1/iUtNCENr1KKyxCtx1CUAABxBf
 StRyj2HuCA4rY8qCF9HCTnvzo6v4SE0Yn8S4gf8/Gx+2QWxKFviQ9yz/USyno+qiAQON
 DsxTJPzpRKz2iHCRpMpixGeDUb3tjuT0chCD3PnX3/6XSZwEHcQoFJZvquMwDMcjx3A8
 WgxY+GQPKcWMxlv527BOfdqG4+7CMAHAwYgKTfMLu4VkF/P1XrtJGJnjNNFTmn4puzqw
 y4bA==
X-Gm-Message-State: APjAAAVuclkPTzKYqTUIE/DNCVN4xdMuODxeiKMMwKX2KkjoFtZMbhUT
 Sg31v5ZQTWBJIKtDyclLpTuDfE5sYnLR/8XvKKg=
X-Google-Smtp-Source: APXvYqwuciUD6vwdUq4CPbVsyvYm1qjVrqqXMQjb87WUGx79yOvkcjnbAhitCFpK3ey7L0Tzueo+r4X+s+cf+LPG7uM=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr5626851oia.102.1581494883264; 
 Wed, 12 Feb 2020 00:08:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581457290.git.hns@goldelico.com>
 <4e11dd4183da55012198824ca7b8933b1eb57e4a.1581457290.git.hns@goldelico.com>
 <20200211222506.GP19213@lunn.ch>
In-Reply-To: <20200211222506.GP19213@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2020 09:07:52 +0100
Message-ID: <CAMuHMdX6f+aGZjQSQqVjT=npojq5xH2k2Js8qxG5=n26Z4uFBw@mail.gmail.com>
Subject: Re: [PATCH 03/14] net: davicom: dm9000: allow to pass MAC address
 through mac_addr module parameter
To: Andrew Lunn <andrew@lunn.ch>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Richard Fontana <rfontana@redhat.com>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alex Smith <alex.smith@imgtec.com>, James Hogan <jhogan@kernel.org>,
 =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 Allison Randal <allison@lohutok.net>, netdev <netdev@vger.kernel.org>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 11:25 PM Andrew Lunn <andrew@lunn.ch> wrote:
> On Tue, Feb 11, 2020 at 10:41:20PM +0100, H. Nikolaus Schaller wrote:
> > This is needed to give the MIPS Ingenic CI20 board a stable MAC address
> > which can be optionally provided by vendor U-Boot.
> >
> > For get_mac_addr() we use an adapted copy of from ksz884x.c which
> > has very similar functionality.
> >
> > Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>
> Hi Nikolaus
>
> Please split these patches by subsystem. So this one patch needs to go
> via netdev.
>
> > +static char *mac_addr = ":";
> > +module_param(mac_addr, charp, 0);
> > +MODULE_PARM_DESC(mac_addr, "MAC address");
>
> Module parameters are not liked.
>
> Can it be passed via device tree? The driver already has code to get
> it out of the device tree.

Yep, typically U-Boot adds an appropriate "local-mac-address" property to the
network device's device node, based on the "ethernet0" alias.

However, the real clue here may be "vendor U-Boot", i.e. no support for the
above?

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
