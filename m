Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E43D13CFAD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 23:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD566EB65;
	Wed, 15 Jan 2020 22:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8A26EB74
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 22:06:57 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i15so17550870oto.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 14:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QA72jMIQiIcv6qKeAvOBZo5//ESBp/sElxNZhuRd/aw=;
 b=K2wAyc1Sua2ik5WtW5OtZO3gYRFzD2tj13aQiYI44X+efoEauCKVGvdNfvtE6mXeru
 p0cEZMv0Q3fDTAPcRx+M3xIPkkvxrVO7RwYvXej5aIO1wq74kvO6TEDMAf79Xsa2eFij
 Ce04DEZV+lDFQ9NqRinmG7gbBZCp3N+mLb+Wg1xgbKWpNHqNFnzNoR6tKU4Nc5OxalGQ
 8VCCqzZMCpfX7K5MuO79/nuNyHMHaW8jI859XwonlOAldJA3ELu8whQJlW4rOTQLOn1Z
 4pwH2iPAsDyVw/1A/y1Mbldt0ttCWG3VLSZpT07+sJzSEfvyzvKxBZGAL8AcToMadyot
 Y+9g==
X-Gm-Message-State: APjAAAX0fxgswyGvLe672REZeTIoRCrynghwKJ1prulyRG6Nx7byhu1V
 DjWGdUWt1eYSG36Xbl4vwic9gJt3012WYt0tZE0=
X-Google-Smtp-Source: APXvYqwUReB61qJ2CDHEnYmnlWNvkGwBGaJEh4v0341plcso6oNlKga1A3x3SDtLiNVKbUvoihUE/WDHebZDXkh8m9k=
X-Received: by 2002:a05:6830:2141:: with SMTP id
 r1mr4374295otd.39.1579126016415; 
 Wed, 15 Jan 2020 14:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-2-geert+renesas@glider.be>
 <20200115210104.GA28904@ravnborg.org>
In-Reply-To: <20200115210104.GA28904@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2020 23:06:45 +0100
Message-ID: <CAMuHMdUEqWWKS_85pNSbAdFBUuGTEzgwE1bd9+x_mN_uzd254Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: sitronix, st7735r: Convert to
 DT schema
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Wed, Jan 15, 2020 at 10:01 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Jan 15, 2020 at 01:45:44PM +0100, Geert Uytterhoeven wrote:
> > Convert the DT binding documentation for Sitronix ST7735R displays to DT
> > schema.
> >
> > Add a reference to the Adafruit 1.8" LCD while at it.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
>
> > diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> > new file mode 100644
> > index 0000000000000000..21bccc91f74255e1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> Use (GPL-2.0-only OR BSD-2-Clause) for new binding files.

I used GPL-2.0-only, as this is a conversion of an existing binding file,
covered by the default GPL-2.0-only of the Linux kernel source tree.

> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/sitronix,st7735r.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sitronix ST7735R Display Panels Device Tree Bindings
> > +
> > +maintainers:
> > +  - David Lechner <david@lechnology.com>
> > +
> > +description:
> > +  This binding is for display panels using a Sitronix ST7735R controller in
> > +  SPI mode.
> > +
> > +allOf:
> > +  - $ref: panel/panel-common.yaml#
>
> I am no binding expert so I do not know how to add it.
> But the old binding described that this MUST be a child of spi.
> This is missing here.
>
> Other panels using spi does not have it - so it is probarly OK.

Yeah, I couldn't find any examples of expressing that requirement in yaml.

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
