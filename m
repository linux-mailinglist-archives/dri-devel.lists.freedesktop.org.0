Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EDE4A6F3A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 11:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D5E10E941;
	Wed,  2 Feb 2022 10:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036AD10E941
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 10:55:48 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id m90so18378744uam.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 02:55:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DNMiBPAokm6B+Md/914T5KDvXk5STANjp7/fM4StjiM=;
 b=ZVMXgTHzCRYHGDFTTCmNO8jZciIFXrCZzCv59psgNO6UhmPntH0NAAz1vYXtCT4IzI
 wKzBgNAur9F4saIEX7aQhibpRqhoNRNM0JD98iA8qoqNOWHnOMA4Nuz/IZ9iDiueqQXs
 9d0HY5Ul4V2IqbdDNlcYoGtD4cbdoAaVfMUt0lc/1nGF3A6e0r4HVjA3emucqd/za8oV
 sQuXgCu6/N4UDQ/0JcbwWgA0YY9YVLMBm8tb4hux/Jf5Nqh9gQuKbXHKjAJLO+qsiULd
 YQof8HvnRPiEWjvVfayZUMWAbveSDAfzOCNtaq/0PcyITdT0j6osB5M2m0+MPNi2ENpI
 wjvQ==
X-Gm-Message-State: AOAM5314oRJiQquWenOwlvOa0LnW74M35HNX1DS6RvijzyA9LNQFJX3x
 dApc+nGA0BayqIb3pFP8ZVwQpiRjsZJVUA==
X-Google-Smtp-Source: ABdhPJyly4ushHA18jlZ1Bg2/Zdd6juvUKyoAKeKZgqdMnQthsWzjg1dc2XHagTkyfU2bte+z8xamg==
X-Received: by 2002:a05:6102:282d:: with SMTP id
 ba13mr11310962vsb.5.1643799346865; 
 Wed, 02 Feb 2022 02:55:46 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id g25sm4799470vsj.6.2022.02.02.02.55.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 02:55:46 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id e17so18296082uad.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 02:55:45 -0800 (PST)
X-Received: by 2002:ab0:6cf9:: with SMTP id l25mr11903238uai.122.1643799345531; 
 Wed, 02 Feb 2022 02:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20220131201225.2324984-1-javierm@redhat.com>
 <tIMIWqepcZGntnez-1ss4Kn4K8btXnzDRL7EWd19-745WK90YIC19E_4di9RNvB3gtx-PzWEjBEGQLPNJE_x0T1yyyaWFCoFcCiG4StR9RU=@emersion.fr>
 <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
 <CAMuHMdXKZ=BkvVqdpiNPNJgxm9SzQ3Z0n4SqV2-4oPRveybd6g@mail.gmail.com>
 <qmhzv6kqs6QdAOP3bNB39glOpc8eeJ6flgjfjcaBniT-shDKZkxo5uB71weGOUKxPE6dq_WBhtHmY5vMmuYwqMoHgtMWnX0ESE5R1Y5g5F8=@emersion.fr>
 <CAKMK7uGPuhrDf8fdDgfuPt5rzO30Rm54T7GvWb203NRbVoVDgw@mail.gmail.com>
 <b0788b3d-9c77-0e96-0969-380d21663909@redhat.com>
 <20220201124208.39c31e59@eldfell>
 <CAMuHMdX_uyEznHy5vYwS8Q=+bBKPddeJa41KTWi4Fwh3tjX+zQ@mail.gmail.com>
 <20220202111954.6ee9a10c@eldfell>
In-Reply-To: <20220202111954.6ee9a10c@eldfell>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Feb 2022 11:55:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVvUO3rWfvM0M0EdTNdJ4AabT_cN--T9Kv5ZZx5u1U2=g@mail.gmail.com>
Message-ID: <CAMuHMdVvUO3rWfvM0M0EdTNdJ4AabT_cN--T9Kv5ZZx5u1U2=g@mail.gmail.com>
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

On Wed, Feb 2, 2022 at 10:20 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Tue, 1 Feb 2022 12:07:07 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Feb 1, 2022 at 11:42 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > On Tue, 1 Feb 2022 10:49:03 +0100
> > > Javier Martinez Canillas <javierm@redhat.com> wrote:
> > > > On 2/1/22 09:38, Daniel Vetter wrote:
> > > > > On Tue, Feb 1, 2022 at 9:34 AM Simon Ser <contact@emersion.fr> wrote:
> > > > >> On Tuesday, February 1st, 2022 at 09:26, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > >>> What's the story with the Rn formats?
> > > > >>>
> > > > >>> The comments say "n bpp Red", while this is a monochrome (even
> > > > >>> inverted) display?
> > > > >>
> > > > >> I don't think the color matters that much. "Red" was picked just because it was
> > > > >> an arbitrary color, to make the difference with e.g. C8. Or am I mistaken?
> > > > >
> > > > > The red comes from gl, where with shaders it really doesn't matter
> > > > > what meaning you attach to channels, but really just how many you
> > > > > have. So 2-channel formats are called RxGx, 3-channel RxGxBx,
> > > > > 4-channel RxGxBxAx and single-channel Rx. And we use drm_fourcc for
> > > > > interop in general, hence why these exist.
> > > > >
> > > > > We should probably make a comment that this really isn't a red channel
> > > > > when used for display it's a greyscale/intensity format. Aside from
> > > > > that documentation gap I think reusing Rx formats for
> > > > > greyscale/intensity for display makes perfect sense.
> > > > > -Daniel
> > > >
> > > > To sump up the conversation in the #dri-devel channel, these drivers
> > > > should support the following formats:
> > > >
> > > > 1) Dx (Daniel suggested that for darkness, but inverted mono)
> > >
> > > Did you consider format C1 instead?
> >
> > That would be a 2-color display, which is not necessarily black
> > and white. Cfr. Amiga or Atari bit planes with bpp=1.
> > That's why fbdev has separate visuals for monochrome.
>
> Yes, that is exactly what I was aiming at: to draft a plan for panels
> that have a fixed and arbitrary palette. From the discussions I
> understood that the panel in question here requires somehow reversed
> colors ("inverted mono"), which didn't really sound to be like "normal
> monochrome".
>
> > > I have no idea how this would map to fbdev API though.
> >
> >     #define FB_VISUAL_MONO01                0       /* Monochr.
> > 1=Black 0=White */
> >     #define FB_VISUAL_MONO10                1       /* Monochr.
> > 1=White 0=Black */
> >     #define FB_VISUAL_TRUECOLOR             2       /* True color   */
> >
> > The above is RGB (or grayscale, see below).
> >
> >     #define FB_VISUAL_PSEUDOCOLOR           3       /* Pseudo color
> > (like atari) */
> >
> > Palette
> >
> >     #define FB_VISUAL_DIRECTCOLOR           4       /* Direct color */
> >
> > Usually used as RGB with gamma correction, but the actual hardware
> > is more flexible.
> >
> >     #define FB_VISUAL_STATIC_PSEUDOCOLOR    5       /* Pseudo color readonly */
> >
> > Fixed palette
> >
> > And:
> >
> >     struct fb_var_screeninfo {
> >             ...
> >             __u32 grayscale;                /* 0 = color, 1 = grayscale,    */
>
> DRM has pixel formats, but no visuals so far. Maybe it needs to grow
> the concept of visuals in some form? However, care should be taken to
> not clash with existing colorimetry features. I would hope that the
> colorimetry feature set could be extended to cover the above as well.
> Well, only if there would be any users for it.

Fbdev has separate (orthogonal) settings for
  1. Frame buffer layout (FB_TYPE_*),
  2. Pixel format (depth and fb_bitfields),
  3. Visual.
DRM combines all of the above in a fourcc value.

Nowadays most frame buffer layouts are packed, so using a shadow
frame buffer to support other layouts is very helpful, as it means
applications no longer have to care about legacy frame buffer layouts.

> My silly attempt with Cx formats (e.g. DRM_FORMAT_C8) was a stab in that
> direction, but maybe not flexible enough for the above.
>
> If on the other hand the panel is "grayscale" but with an arbitrary
> color (white, green, orange or other on black), the IRC consensus seems
> to be that one should use Rx formats (e.g. DRM_FORMAT_R8) for it,
> regardless of the actual color. That would convey that the pixel value
> has a monotonic (increasing) mapping to brightness, unlike with
> paletted formats. I agree with this, but wonder how reversed brightness

Agreed, the only thing that matters is a monotonic mapping, and
whether it's increasing or decreasing.

> should be dealt with - or just have the driver invert the pixel values
> before sending them to display?

That's an option. If the data has to be copied anyway, inversion is
a cheap operation. Else I think you need new fourcc types.

> Cx formats with a read-only palette could be used to represent
> "grayscale" and "reversed grayscale" too, but people seem to think that
> is too complicated to analyse and use for KMS userspace.

Yeah, it's complicated, but rather rare. Most desktop hardware
(even from the nineties ;-) does support a programmable palette.
Exceptions are CGA, the C64 (no Linux support yet ;-), and eInk
displays that support e.g. white, black, and red.

If you do want to support it, perhaps introduce Fx (F = fixed)
fourcc types?

> Other #dri-devel IRC mumblings were about maybe adding a DRM pixel
> format for grayscale or intensity or luminance so that one would not
> need to use "red" color channel for something that doesn't look red.
> That is, do not use Cx formats because those produce completely
> arbitrary colors, and do not use Rx formats because the display is not
> redscale. Personally I'd be fine with Rx formats.

Fine, as said above, monotonic mapping is what matters.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
