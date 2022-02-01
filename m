Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573CD4A5ADE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F9810E590;
	Tue,  1 Feb 2022 11:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DED610E590
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:07:22 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id az20so15546103vsb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 03:07:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UFAIMQcU3dCvJZn8Zuan8C8Op7u0lxfrOEd/qthi1mk=;
 b=LPONDFv4t4s21dRdVJMCkkuNmYybTMQsa+d9/tJvGPlz6x8ts8IVPGIcNkhYkK0818
 EAoRpn69W7f/b72Uo3cJI7Tck3JmjjV3KHbycpGofkJW7xGYcG670ymBNl80qMP9gTSN
 DDsveWjira6sd63jckrZbO/zQjUtb0XjL8MpQpJiAHNIJ4CHj+P/Iao5yC9gMs4VNojO
 6ry27DpYjSpuYrUSM+sgcjVLtYZHlF3lsaPO9bWXgWGtMd7VTCGVKc3NaJDilTkvFA7u
 y51HvSx/0M4zFyyv9kTH1Zq5/eukiSTSu9q4cXUFgNbKlRyIcLjzMMfuXfAd8+Hf53Pj
 ToQA==
X-Gm-Message-State: AOAM531ORhnjrHP9GSlM4ds3XTANGCY9CXFwmAk3gGpFtI1ApFfpOZZt
 APU2rpTmUU/sHRub3AOJ+5GmvpqRsNceGkL+
X-Google-Smtp-Source: ABdhPJySbjlLQTOn9mIdsqv8RU70rn8D6s95MaM53hdLs4e6AYogcaQLaByfp1nJ/t4rp/rG9T46Yw==
X-Received: by 2002:a67:cb87:: with SMTP id h7mr9700055vsl.67.1643713641016;
 Tue, 01 Feb 2022 03:07:21 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id w3sm4681148vkd.5.2022.02.01.03.07.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 03:07:20 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id b2so15526934vso.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 03:07:19 -0800 (PST)
X-Received: by 2002:a67:b00e:: with SMTP id z14mr9303063vse.57.1643713639387; 
 Tue, 01 Feb 2022 03:07:19 -0800 (PST)
MIME-Version: 1.0
References: <20220131201225.2324984-1-javierm@redhat.com>
 <tIMIWqepcZGntnez-1ss4Kn4K8btXnzDRL7EWd19-745WK90YIC19E_4di9RNvB3gtx-PzWEjBEGQLPNJE_x0T1yyyaWFCoFcCiG4StR9RU=@emersion.fr>
 <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
 <CAMuHMdXKZ=BkvVqdpiNPNJgxm9SzQ3Z0n4SqV2-4oPRveybd6g@mail.gmail.com>
 <qmhzv6kqs6QdAOP3bNB39glOpc8eeJ6flgjfjcaBniT-shDKZkxo5uB71weGOUKxPE6dq_WBhtHmY5vMmuYwqMoHgtMWnX0ESE5R1Y5g5F8=@emersion.fr>
 <CAKMK7uGPuhrDf8fdDgfuPt5rzO30Rm54T7GvWb203NRbVoVDgw@mail.gmail.com>
 <b0788b3d-9c77-0e96-0969-380d21663909@redhat.com>
 <20220201124208.39c31e59@eldfell>
In-Reply-To: <20220201124208.39c31e59@eldfell>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Feb 2022 12:07:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_uyEznHy5vYwS8Q=+bBKPddeJa41KTWi4Fwh3tjX+zQ@mail.gmail.com>
Message-ID: <CAMuHMdX_uyEznHy5vYwS8Q=+bBKPddeJa41KTWi4Fwh3tjX+zQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Tue, Feb 1, 2022 at 11:42 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Tue, 1 Feb 2022 10:49:03 +0100
> Javier Martinez Canillas <javierm@redhat.com> wrote:
> > On 2/1/22 09:38, Daniel Vetter wrote:
> > > On Tue, Feb 1, 2022 at 9:34 AM Simon Ser <contact@emersion.fr> wrote:
> > >> On Tuesday, February 1st, 2022 at 09:26, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >>> What's the story with the Rn formats?
> > >>>
> > >>> The comments say "n bpp Red", while this is a monochrome (even
> > >>> inverted) display?
> > >>
> > >> I don't think the color matters that much. "Red" was picked just because it was
> > >> an arbitrary color, to make the difference with e.g. C8. Or am I mistaken?
> > >
> > > The red comes from gl, where with shaders it really doesn't matter
> > > what meaning you attach to channels, but really just how many you
> > > have. So 2-channel formats are called RxGx, 3-channel RxGxBx,
> > > 4-channel RxGxBxAx and single-channel Rx. And we use drm_fourcc for
> > > interop in general, hence why these exist.
> > >
> > > We should probably make a comment that this really isn't a red channel
> > > when used for display it's a greyscale/intensity format. Aside from
> > > that documentation gap I think reusing Rx formats for
> > > greyscale/intensity for display makes perfect sense.
> > > -Daniel
> >
> > To sump up the conversation in the #dri-devel channel, these drivers
> > should support the following formats:
> >
> > 1) Dx (Daniel suggested that for darkness, but inverted mono)
>
> Did you consider format C1 instead?

That would be a 2-color display, which is not necessarily black
and white. Cfr. Amiga or Atari bit planes with bpp=1.
That's why fbdev has separate visuals for monochrome.

> I have no idea how this would map to fbdev API though.

    #define FB_VISUAL_MONO01                0       /* Monochr.
1=Black 0=White */
    #define FB_VISUAL_MONO10                1       /* Monochr.
1=White 0=Black */
    #define FB_VISUAL_TRUECOLOR             2       /* True color   */

The above is RGB (or grayscale, see below).

    #define FB_VISUAL_PSEUDOCOLOR           3       /* Pseudo color
(like atari) */

Palette

    #define FB_VISUAL_DIRECTCOLOR           4       /* Direct color */

Usually used as RGB with gamma correction, but the actual hardware
is more flexible.

    #define FB_VISUAL_STATIC_PSEUDOCOLOR    5       /* Pseudo color readonly */

Fixed palette

And:

    struct fb_var_screeninfo {
            ...
            __u32 grayscale;                /* 0 = color, 1 = grayscale,    */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
