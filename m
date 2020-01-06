Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6B3130F6F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 10:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73BB6E210;
	Mon,  6 Jan 2020 09:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB81A6E210
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 09:28:49 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 59so70939847otp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 01:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+vmYhiLoRG/NgQRQrZPsXjrV365H8hEN68ARUw4CIQ=;
 b=HYtvuHWJgRZf1VC6gCjJKOgQAO5HXOAJupsOjhS3wnypxt3jk0QvAGpJT+TBw/bdye
 ib9UVLy+SvN0da9NLpMnbYtCUxw0wFyO4AxQQm2OZWMATn4R2KFEx7+MSi0CYdY8RXKb
 w3AF5Sk96mFQNklkKSX2jiy/r2vO1337l8CjEm8AGEoB0zQMHUoztskgQxAoT3JPN0Gb
 b+UEAEJ4ec43t5Vn3ynNjdGd9qBMdIyTgWoHt+miDWVCplKFiFdDBfrcJGMpIk8pLT5T
 X2KeY79iDmsvcTo7Ke89w8EQifRfcJN0lf2CKopcp6GA62ppl8pf3l9DkQq/fuksgXCu
 Zi9g==
X-Gm-Message-State: APjAAAWjXzzK4Xaaf8UKprdsCO5HeOZNiaRFUXDQIS8SAXN2f9PFd5r9
 5Bm1DP1AXJItIHrm/RegeT+yUCMlFYw6yjAllRw=
X-Google-Smtp-Source: APXvYqydoa68HpndthaKYQ+8Q+Y7RAZToNChUskpMjnwO3n/K3vgBjeO5XSKtohC/HCShM8R0EGzQ3tA4+SdMZ+80tw=
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr107563805otf.107.1578302928931; 
 Mon, 06 Jan 2020 01:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20200102141246.370-1-geert+renesas@glider.be>
 <20200102141246.370-4-geert+renesas@glider.be>
 <20200105091303.GB29102@ravnborg.org>
In-Reply-To: <20200105091303.GB29102@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jan 2020 10:28:37 +0100
Message-ID: <CAMuHMdUL3tCZzCDyJkmqYT5n+-t+Z-Ubo4=+NJpHpZU1w5C07g@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: tiny: st7735r: Add support for Okaya RH128128T
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
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, Jan 5, 2020 at 10:13 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> Good to see we add more functionality to the smallest driver in DRM.
> The patch triggered a few comments - see below.
> Some comments relates to the original driver - and not your changes.

Thanks for your comments!

> On Thu, Jan 02, 2020 at 03:12:46PM +0100, Geert Uytterhoeven wrote:
> > Add support for the Okaya RH128128T display to the st7735r driver.
> >
> > The RH128128T is a 128x128 1.44" TFT display driven by a Sitronix
> > ST7715R TFT Controller/Driver.  The latter is very similar to the
> > ST7735R, and can be handled by the existing st7735r driver.
>
> As a general comment - it would have eased review if this was split
> in two patches.
> One patch to introduce the infrastructure to deal with another set of
> controller/display and one patch introducing the new combination.

I had thought about that, but didn't pursue as the new combination is
just 7 added lines.  If you prefer a split, I can do that.

> > --- a/drivers/gpu/drm/tiny/st7735r.c
> > +++ b/drivers/gpu/drm/tiny/st7735r.c
> > @@ -1,8 +1,9 @@
> >  // SPDX-License-Identifier: GPL-2.0+
> >  /*
> > - * DRM driver for Sitronix ST7735R panels
> > + * DRM driver for Sitronix ST7715R/ST7735R panels
>
> This comment could describe the situation a little better.
> This is a sitronix st7735r controller with a jianda jd-t18003-t01
> display.
> Or a sitronix st7715r controller with a okaya rh128128t display.

Indeed. It is currently limited to two controller/display combos.
But I expect more combos to be added over time.
Hence does it make sense to describe all of that in the top comments?

> > @@ -37,12 +39,28 @@
> >  #define ST7735R_MY   BIT(7)
> >  #define ST7735R_MX   BIT(6)
> >  #define ST7735R_MV   BIT(5)
> > +#define ST7735R_RGB  BIT(3)
> > +
> > +struct st7735r_cfg {
> > +     const struct drm_display_mode mode;
> > +     unsigned int left_offset;
> > +     unsigned int top_offset;
> > +     unsigned int write_only:1;
> > +     unsigned int rgb:1;             /* RGB (vs. BGR) */
> > +};
> > +
> > +struct st7735r_priv {
> > +     struct mipi_dbi_dev dbidev;     /* Must be first for .release() */
> > +     unsigned int rgb:1;
> > +};
>
> The structs here uses "st7735r" as the generic prefix.
> But the rest of this file uses "jd_t18003_t01" as the generic prefix.
>
> It would help readability if the same prefix is used for the common
> stuff everywhere.

Agreed.
So I think it makes most sense to rename jd_t18003_t01_pipe_{enable,funcs}
to sh7735r_pipe_{enable,funcs}?
If needed, the display-specific parts (e.g. gamma parameters) could be
factored out in st7735r_cfg later, if neeeded.

> struct st7735r_priv includes "rgb" which is copied from struct
> st7735r_cfg.
> Maybe just add a const pointer to struct st7735r_cfg,
> so when we later add more configuration items we do not need to have two
> copies. And then ofc drop st7735r_priv.rgb.

I thought about that, but didn't do so, as the rgb field is the only
parameter used outside the probe function.  Can be changed, of course.

> > @@ -136,13 +167,14 @@ static struct drm_driver st7735r_driver = {
> >  };
> >
> >  static const struct of_device_id st7735r_of_match[] = {
> > -     { .compatible = "jianda,jd-t18003-t01" },
> > +     { .compatible = "jianda,jd-t18003-t01", .data = &jd_t18003_t01_cfg },
> > +     { .compatible = "okaya,rh128128t", .data = &rh128128t_cfg },
> >       { },
> { /* sentinel },
>
> Also - which is not a new thing - this fails to check that we have the
> correct combination of two compatibles.
> From the binding:
>
>     Must be one of the following combinations:
>     - "jianda,jd-t18003-t01", "sitronix,st7735r"
>     - "okaya,rh128128t", "sitronix,st7715r"

That will be checked by "make dtbs_check", once I have converted the DT
bindings to yaml ;-)

In reality, there are lots of different ways to communicate with an
ST77[13]5R display controller (3/4-wire SPI, or 6800/8080 bus, ...), and
lots of different ways to wire a display to the controller.  Ideally,
this should be described in DT.  As I don't have schematics for the
display board, doing so is difficult, and will miss important details,
which may lead to DTB ABI compatibility issues later.
I understand using these compatible combinations was a pragmatic solution
to this problem.

> >  };
> >  MODULE_DEVICE_TABLE(of, st7735r_of_match);
> >
> >  static const struct spi_device_id st7735r_id[] = {
> > -     { "jd-t18003-t01", 0 },
> > +     { "jd-t18003-t01", (uintptr_t)&jd_t18003_t01_cfg },
> >       { },
> { /* sentinel */ },
>
> Do we need an entry for "okaya,rh128128t" here?
>
> Note: I have not fully understood how MODULE_DEVICE_TABLE()
> works - so forgive me my ignorance.

st7735r_id[] is used for matching based on platform device name.
Hence an entry is needed only to use the display on non-DT systems.
Can be added later, if ever needed.

Note that there is a separate MODULE_DEVICE_TABLE() for DT-based matching,
so the driver module will be auto-loaded on DT-based systems.

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
