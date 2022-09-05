Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B105AD634
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA7810E99A;
	Mon,  5 Sep 2022 15:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E37A10E99A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:22:19 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id g21so6477572qka.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=+ZiqcY4iwW4z7/E7mCAKrjs2qkOwesFoeuU+408Ac8o=;
 b=VFmGFDTElC9gVBP4IH125hq51A7FGr51vQ9KGLGqsDH5FAEMbMbUXIVHi85ww+a0fI
 GziSfVv/AV96vVMyihm0a9WLMAOVaqURD6Z6C0QYsgp+rD6u9b5XKuySpRwB9/4ukD5r
 ntRcngBKUZIdj1p7dnKxVpS61IIJC70YsoWsdaYgU3yQ1OeaPC6Dp8pG57kfBWmOL/93
 L/IFFf00dHT3zgOp5UKnif6AxMU2wmHM+SIXzgJwfA+idsrUzSPhTV0Cy8bk19HNDekI
 +ldaJp7J0Y+v4fVjKkwUglDoR826zDL6l5uW2KrYqW3xGquKc2bpuTp1y4lh/YVJ6mAK
 GUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=+ZiqcY4iwW4z7/E7mCAKrjs2qkOwesFoeuU+408Ac8o=;
 b=wKSX/GIx1ju7EZ2+z5TSv1z4H56w4fMEzetzEWRRN3S79qhVFjtYqm2AXI14H6Nncs
 6eMnzYJKxrPt21S2heaw0EwDcg5nn8LQ7f8dFBz+fBfYkRntVlP9NJ+p3r5kJVf26af4
 ntAhBLmMcc3tCW0jK8jl8Q2J9Sc9pehuC8MWmxW11c50IFR5htMNAZgGspVJyzuZosMw
 2PhPLSp2qxkF6V6Z21O/CFxadYfP4S8x74sA7E1GxYHMSttf268FxTwZGt0Wz39P9DK6
 MXonrgsfQTF3SaSB3EInt2GWax9zLfGojXmsiLHGtj0pYn6s2O2chd7860qiXxNBwP/g
 I0IA==
X-Gm-Message-State: ACgBeo08tzS3/bSv3qTjUUvVb2eDgjZfiBlOn5pIWfLHyms2/z44MMVI
 MEMyK67L1s/EkP34tJEwPZXIXunoWABhsQ38Z8U=
X-Google-Smtp-Source: AA6agR6eqDleGJQNbmaUKo+DXkG0Owzp6XfxQg6gg92/7A34V7uBDxuh7YdkC5fcKcuRE7T6e8KsWIJlWSuvkZ2TzuU=
X-Received: by 2002:a05:620a:410e:b0:6bc:5cdc:88ec with SMTP id
 j14-20020a05620a410e00b006bc5cdc88ecmr33187504qko.734.1662391338268; Mon, 05
 Sep 2022 08:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
 <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
In-Reply-To: <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 18:21:42 +0300
Message-ID: <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using
 devm_fwnode_gpiod_get()
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 USB <linux-usb@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, linux-pci <linux-pci@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 6:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 9/5/22 04:09, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:

...

> >> +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
> >> +       if (count < 0 && count != -EINVAL)
> >> +               return count;
> >> +
> >> +       if (count > 0) {
> >
> >> +               if (count > ARRAY_SIZE(hw_margin))
> >> +                       return -EINVAL;
> >
> > Why double check? You may move it out of the (count > 0).
>
> Two checks will always be needed, so I don't entirely see
> how that would be better.

But not nested. That's my point:

if (count > ARRAY_SIZE())
  return ...
if (count > 0)
  ...

> >> -       if (ret == 1)
> >> -               hw_margin_max = hw_margin[0];
> >
> >> +               ret = device_property_read_u32_array(dev->parent,
> >> +                                                    "rohm,hw-timeout-ms",
> >> +                                                    hw_margin, count);
> >> +               if (ret < 0)
> >> +                       return ret;
> >
> > So, only this needs the count > 0 check since below already has it implicitly.
> >
> Sorry, I don't understand this comment.

if (count > 0) {
  ret = device_property_read_u32_array(...);
  ...
}
if (count == 1)
 ...
if (count == 2)
 ...

But here it might be better to have the nested conditionals.

> >> -       if (ret == 2) {
> >> -               hw_margin_max = hw_margin[1];
> >> -               hw_margin_min = hw_margin[0];
> >> +               if (count == 1)
> >> +                       hw_margin_max = hw_margin[0];
> >> +
> >> +               if (count == 2) {
> >> +                       hw_margin_max = hw_margin[1];
> >> +                       hw_margin_min = hw_margin[0];
> >> +               }
> >>          }

-- 
With Best Regards,
Andy Shevchenko
