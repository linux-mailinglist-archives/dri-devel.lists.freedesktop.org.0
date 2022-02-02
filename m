Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D89DE4A7B13
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 23:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BA310E11A;
	Wed,  2 Feb 2022 22:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Wed, 02 Feb 2022 22:25:42 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316AC10E11A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 22:25:42 +0000 (UTC)
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MFsdD-1n0K5L2Ejn-00HP59 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb
 2022 23:20:36 +0100
Received: by mail-wr1-f44.google.com with SMTP id m14so1153508wrg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 14:20:36 -0800 (PST)
X-Gm-Message-State: AOAM533f89YB/x3/7b3JvFccsUhaw9HjNiz5X9czu4HHW0lvtld72Wyj
 dua+HFnQUAiGq+eNtWqozPX3+L69caGqiVAUis4=
X-Google-Smtp-Source: ABdhPJyS0pXYjoI1KSj8v4HS5DRpiR5z8Z+MmivHV59Rfz0qHTXBAOHLhOORnhnqrVG7qMP59ls3cQTx3h8P+oStNX4=
X-Received: by 2002:a05:6000:3c6:: with SMTP id
 b6mr26662700wrg.12.1643836901999; 
 Wed, 02 Feb 2022 13:21:41 -0800 (PST)
MIME-Version: 1.0
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <20220202175635.GC2091156@minyard.net>
 <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
In-Reply-To: <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 2 Feb 2022 22:21:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3itj=nshdRCoFQQh5fg-RsEaqj1PdBxfeN2-TzqmoPpQ@mail.gmail.com>
Message-ID: <CAK8P3a3itj=nshdRCoFQQh5fg-RsEaqj1PdBxfeN2-TzqmoPpQ@mail.gmail.com>
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
To: "Verdun, Jean-Marie" <verdun@hpe.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:amjOxCSewNNy4jkv9NqI/+89q6kZyC/cgOvwjDsr0+8bxJ44yz+
 4AdRPqVv8PLV91KKR2Z/jk7tEUtnrG3eaG3MzK84T7z9FSLjB35ncgOPRGLTbBHDFF6s25I
 B5vw+m0M1V2KijoHVN05zoSOqgaWpIUz6VD4HoELKotVQKq3M3XoS4G5wPe+FnQG1ksUy9b
 utMMeIGW6n+2aIX7GcMOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:riN9VhALXAc=:lGtGBOkIE1fBbau5T7kyvO
 XDwfADU4xseadZiO72t+8su/1OjBxr5/oevd1SbRevgZ5WoWmURca/E/3hkXDjusdesTNAcam
 ZkIapz1eKiit1M+zpG4YA3Eqcv6n7hljrm9M8kPWdfFaWSxwEEBD6JqNmuJj/yNKV7YhZHvqV
 TbXwqtxHkPCJF0Det1zSOVal4YBBCyNAh9l4pPVmK+O6mBtnuAoCS8M2m/bSk+VEg9hAemjT2
 o6iPkEJf8gi+DxTLhq6H6GJzTKeTqoa+LtmUxsOHI7X5I7w1iNMvasjXaylhSmOm2CuHxsmA3
 HZzY63yE7lbc9kCa+YkdRMjKTEAawkOA6ROObI+wxCvyJqCVKYbUudSpAtGftGTrVZskSvaSx
 LJqveyglaYIthziF1lL7n66T6U4SUHELFxKcXibR1DD+FA/Bldjv4xe/5SBBcIAA/GXwDG5hR
 IZo+0ZY3wHK1uJ+vrEKaskUDoqSQ6Dq8jBeMz0+eC+dXwYJuSpVrpFEvbCsy9uEddKca9l05f
 Gw08+IF0vAyC0MQXq2UJqEsK4tmH7+1SG2zb7dCaGDz/UUfboiFyiRJ9vromeS5q7auQUSnUa
 Voz57VYZ1ijU3nNqaA7m1WzgnQLjpOr2cAMHU6qdokYPdgiBMmUITz+CD/CkS/3BTI9B6IPin
 GYgbwPQ3jAm8HYi1OHAE9rHqMrKy+XAX290eB8plGc+YRWvma7q30heR73kQGomCBBgggfU3M
 Go+Z3UsR5N0CkOJshCT42bAlpHPiZpJczxV25ej6ho16Bpz8FZYq09+AOoOYnM8gM3cHRKtbv
 WKRBf/gTwVFEANhznyZU5p/jWo4Gzedl0gsgRc3rUhGfV69j1s=
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
 Wang Kefeng <wangkefeng.wang@huawei.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Amit Kucheria <amitk@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, Hao Fang <fanghao11@huawei.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "minyard@acm.org" <minyard@acm.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Hawkins,
 Nick" <nick.hawkins@hpe.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 2, 2022 at 7:14 PM Verdun, Jean-Marie <verdun@hpe.com> wrote:
>
> > This is far too big for a single patch.  It needs to be broken into
> > functional chunks that can be reviewed individually.  Each driver and
> > each device tree change along with it's accompanying code need to be
> > done in individual patches.  The way it is it can't be reviewed in any
> > sane manner.
>
> > -corey
>
> Thanks for your feedback. We are getting a little bit lost here, as our plan was to submit initial
>
> - bindings
> - dts for SoC and 1 board
> - initial platform init code
>
> Then drivers code avoiding to send many dts updates which might complexify the
> review. We wanted to send all drivers code to relevant reviewers by tomorrow.
>
> So, what you are asking ( do not worry I am not trying to negotiate, I just want
> to avoid English misunderstandings as I am French) is to send per driver
>
> - binding
> - dts update
> - driver code
>
> For each driver through different submission (with each of them containing the
> 3 associated parts) ?
>
> What shall be the initial one in our case as we are introducing a platform ?
> An empty dts infrastructure and then we make it grow one step at a time ?

Ideally, what I prefer to see is a series of patches for all "essential" drivers
and the platform code that includes:

- one patch for each new binding
- one patch for each new driver
- one patch that hooks up arch/arm/mach-hpe/, MAINTAINERS
  and any other changes to arch/arm/ other than dts
- one patch that adds the initial .dts and .dtsi files, with all the
  devices added that have a valid binding, no need to split this
  up any further

This should include everything you need to boot into an initramfs
shell, typically cpu, serial, timer, clk, pinctrl,  gpio, irqchip. We will
merge these as a git branch in the soc tree.

In parallel, you can work with subsystem maintainers for the
"non-essential" drivers to review any other driver and binding,
e.g. drm/kms, network, i2c, pci, usb, etc. The patches for
the corresponding .dts additions also go through the soc tree,
but to make things simpler, you can send those in for a later
release.

          Arnd
