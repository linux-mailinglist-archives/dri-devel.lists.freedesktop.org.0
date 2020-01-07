Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E461326A9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 13:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6116E05C;
	Tue,  7 Jan 2020 12:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3736E05C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 12:46:59 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id a67so17607182oib.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 04:46:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vf/wP9IVDV4Hl6f1lzWr98u8m3GuJl26OsoEjxDSC+g=;
 b=E1FqeNaK3YFM2QLYIVRNXGqJQIPnANsEGvHj5/v6objgp9L7XI48yh3Kj/nfBC95dW
 FGsxYnF+/awbZiz8SHX/qrcyHDOfJc1A1WIUNhtHtA8D+cSA9vy3l1aCUDa3fHVtpSfL
 vlHqYz724bg08HTQEp6F8+YswCpwhi/ng5a/TU0Bf3nfk0cBjAd0c5b3QNIBeh/tq7eK
 kgQG+kMx51XaRn2rkTmhl8MMQzinGTIQ41b/TeZ70RIIxf7O04igbGP6UjJeTqVuVkGv
 4fq6Q+0P02mfuJ0E2rnxCUr96BPA67jhWHbnFcHMiBv67q3mUid0UqN1gkWX3rysqcDg
 As0A==
X-Gm-Message-State: APjAAAUuopGeJQl/v6KgHh9wloUGVWQAPvtHpYrwWr/9ILMSvWseOjes
 eTZLznDeYCY9xDdpffGb7omp79EdYLkacS77Fwo=
X-Google-Smtp-Source: APXvYqxA0Ir0h8IUX7YSNxseIUU1PobEpQXNKjYgoTrMgiMQwt3o9H2jAlIFDg4si3GQJ6t0pjmhx39BhXHXf9WoKjk=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr6541881oia.148.1578401218279; 
 Tue, 07 Jan 2020 04:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20200102141246.370-1-geert+renesas@glider.be>
 <20200102141246.370-4-geert+renesas@glider.be>
 <20200105091303.GB29102@ravnborg.org>
 <CAMuHMdUL3tCZzCDyJkmqYT5n+-t+Z-Ubo4=+NJpHpZU1w5C07g@mail.gmail.com>
 <893b059c-fd7d-3c21-384c-da33af595ffb@lechnology.com>
In-Reply-To: <893b059c-fd7d-3c21-384c-da33af595ffb@lechnology.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jan 2020 13:46:47 +0100
Message-ID: <CAMuHMdXxwSR6D_tzg9iqwwLYEJZg6DEonvvvC_TigtG0PAvn+w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: tiny: st7735r: Add support for Okaya RH128128T
To: David Lechner <david@lechnology.com>
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
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David,

On Mon, Jan 6, 2020 at 6:12 PM David Lechner <david@lechnology.com> wrote:
> On 1/6/20 3:28 AM, Geert Uytterhoeven wrote:
> > On Sun, Jan 5, 2020 at 10:13 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >> On Thu, Jan 02, 2020 at 03:12:46PM +0100, Geert Uytterhoeven wrote:
> >>> Add support for the Okaya RH128128T display to the st7735r driver.
> >>>
> >>> The RH128128T is a 128x128 1.44" TFT display driven by a Sitronix
> >>> ST7715R TFT Controller/Driver.  The latter is very similar to the
> >>> ST7735R, and can be handled by the existing st7735r driver.

> >>> --- a/drivers/gpu/drm/tiny/st7735r.c
> >>> +++ b/drivers/gpu/drm/tiny/st7735r.c

> >>> @@ -37,12 +39,28 @@
> >>>   #define ST7735R_MY   BIT(7)
> >>>   #define ST7735R_MX   BIT(6)
> >>>   #define ST7735R_MV   BIT(5)
> >>> +#define ST7735R_RGB  BIT(3)
> >>> +
> >>> +struct st7735r_cfg {
> >>> +     const struct drm_display_mode mode;
> >>> +     unsigned int left_offset;
> >>> +     unsigned int top_offset;
> >>> +     unsigned int write_only:1;
> >>> +     unsigned int rgb:1;             /* RGB (vs. BGR) */
> >>> +};
> >>> +
> >>> +struct st7735r_priv {
> >>> +     struct mipi_dbi_dev dbidev;     /* Must be first for .release() */
> >>> +     unsigned int rgb:1;
> >>> +};
> >>
> >> The structs here uses "st7735r" as the generic prefix.
> >> But the rest of this file uses "jd_t18003_t01" as the generic prefix.
> >>
> >> It would help readability if the same prefix is used for the common
> >> stuff everywhere.
> >
> > Agreed.
> > So I think it makes most sense to rename jd_t18003_t01_pipe_{enable,funcs}
> > to sh7735r_pipe_{enable,funcs}?
> > If needed, the display-specific parts (e.g. gamma parameters) could be
> > factored out in st7735r_cfg later, if neeeded.
>
> IIRC, the original intention here is that functions/structs with the
> jd_t18003_t01_ prefix are specific to the panel, not the controller.

Makes sense.

> E.g. things like power settings and gamma curves.
>
> The idea is that it is much easier to write and understand the init sequence
> as a function rather than trying to make a generic function that can parse
> a any possible init sequence from a data structure.

I believe the init sequence is the same.  The init parameters may not be.
What happened to the separation of code and data? ;-)

> This new panel really has all of the same settings as the existing one?

I went through all the ST77[13]5R-specific register settings in the pipe
enable function. All these registers exist on both ST7715R and ST7735R.
Unfortunately the Okaya display documentation doesn't give any clues
w.r.t. the expected values to program.
However, my display seems to work fine.  Even the grayscale bands from
fbtest test006 look good, so the gamma parameters must be correct ;-)

> Having a separate pipe enable function for the new panel would also eliminate
> the need for the extra private rgb data.

At the expense of duplicating the whole function, for one single bit of
difference...

P.S. Note that I'm using this on an RSK+RZA1 board with 32 MiB of SDRAM.
Enabling support for this display increases kernel size by 316 KiB.
And apparently most real world users of the RZ/A1 SoC are not even using
SDRAM, but doing XIP with the builtin 10 MiB of SRAM...

Thanks!

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
