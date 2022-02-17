Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E674BA57C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B3B10EF2A;
	Thu, 17 Feb 2022 16:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B767C10EF25
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 16:13:06 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id 102so735764uag.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:13:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ch9MypWpUQnZM5wHecAMH9Z6WzfQjeMjydR9fNyA8WE=;
 b=DSXkTgrZG8oJp/VcTufSCSYluOku+18LpsFmTu5oa/8yw/y4ga2kJNQ25fNQXqv/tB
 v0Ur0rROXK4JZen+m/vKPf8pB2ZMsNBbP6Lexki/0Vn1/yeCLD3N46EsoeWL+Ao4pa39
 NG43be9yB5zYudvV2VqCURPpYBXv/a3EIBIbWvx3VrdX2Aj5VYv6euRWeAtKsOF/8OpP
 at1KLhGbpZFT4Y5xegME7JK5qfkaMjG4jHO9TyTZzRhMYUn105MEK5tbdGAyKrLhlV9K
 cHRIzEqNko5OfjrqNFjnruNk/Z6C00zsA0P+F0C5RkW93Jydm38Uq41bKq3e0ayMn3Us
 biSA==
X-Gm-Message-State: AOAM532738OXcxCMzmwNRZdOLWBMy2szIb7kxEtcmavzvt9O9NjkOTUt
 20kgGrSgLffbxL4++rFhi3Wld4b8EvdzGg==
X-Google-Smtp-Source: ABdhPJyUUWjdTB6WalFZ+1NPpZIh+sbto2bQHQZJyvnr7B/4UckGZUslGQjZyrQB7sPQYDVnDcAvJQ==
X-Received: by 2002:ab0:36e4:0:b0:33d:1245:f20d with SMTP id
 x4-20020ab036e4000000b0033d1245f20dmr1363540uau.6.1645114385236; 
 Thu, 17 Feb 2022 08:13:05 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179])
 by smtp.gmail.com with ESMTPSA id f124sm116990vkc.19.2022.02.17.08.13.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 08:13:04 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id j201so3321087vke.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:13:04 -0800 (PST)
X-Received: by 2002:a05:6122:8c7:b0:32d:7e3:96c8 with SMTP id
 7-20020a05612208c700b0032d07e396c8mr1649377vkg.7.1645114384535; Thu, 17 Feb
 2022 08:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-3-geert@linux-m68k.org>
 <4fff0c08-adab-c1d5-4a7e-1513cb2bf7ca@suse.de>
In-Reply-To: <4fff0c08-adab-c1d5-4a7e-1513cb2bf7ca@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Feb 2022 17:12:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVK7eWfod73JQAntO=7BAMEcS-ktH4NJmDjna3zUn7giw@mail.gmail.com>
Message-ID: <CAMuHMdVK7eWfod73JQAntO=7BAMEcS-ktH4NJmDjna3zUn7giw@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/fb-helper: Add support for DRM_FORMAT_C[124]
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thanks for your review!

On Thu, Feb 17, 2022 at 3:57 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 15.02.22 um 17:52 schrieb Geert Uytterhoeven:
> > Add support for color-indexed frame buffer formats with two, four, and
> > sixteen colors to the DRM framebuffer helper functions:
> >    1. Add support for depths 1/2/4 to the damage helper,
> >    2. For color-indexed modes, the length of the color bitfields must be
> >       set to the color depth, else the logo code may pick a logo with too
> >       many colors.  Drop the incorrect DAC width comment, which
> >       originates from the i915 driver.
> >    3. Accept C[124] modes when validating or filling in struct
> >       fb_var_screeninfo, and  use the correct number of bits per pixel.
> >    4. Set the visual to FB_VISUAL_PSEUDOCOLOR for all supported
> >       color-indexed modes.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -376,12 +376,34 @@ static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
> >                                          struct iosys_map *dst)
> >   {
> >       struct drm_framebuffer *fb = fb_helper->fb;
> > -     unsigned int cpp = fb->format->cpp[0];
> > -     size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
> > -     void *src = fb_helper->fbdev->screen_buffer + offset;
> > -     size_t len = (clip->x2 - clip->x1) * cpp;
> > +     size_t offset = clip->y1 * fb->pitches[0];
> > +     size_t len = clip->x2 - clip->x1;
> >       unsigned int y;
> > +     void *src;
> >
> > +     switch (fb->format->depth) {
>
> The depth field is deprecated. It's probably better to use
> fb->format->format and test against 4CC codes.

The reason I checked for depth instead of a 4CC code is that the only
thing that matters here is the number of bits per pixel.  Hence this
function won't need any changes to support R1, R2, R4, and D1 later.
When we get here, we already know that we are using a format that
is supported by the fbdev helper code, and thus passed the 4CC
checks elsewhere.

Alternatively, we could introduce drm_format_info_bpp() earlier in
the series, and use that?

>
> > +     case 1:
> > +             offset += clip->x1 / 8;
> > +             len = DIV_ROUND_UP(len + clip->x1 % 8, 8);
> > +             break;
> > +
>
> Style: no empty lines here.

OK.

> > +     case 2:
> > +             offset += clip->x1 / 4;
> > +             len = DIV_ROUND_UP(len + clip->x1 % 4, 4);
> > +             break;
> > +
> > +     case 4:
> > +             offset += clip->x1 / 2;
> > +             len = DIV_ROUND_UP(len + clip->x1 % 2, 2);
> > +             break;
> > +
>
> Can we handle case C8 like C[124]? Seems cleaner to me.

The cases above are purely to handle bpp < 8; they are not
about color-indexed vs. truecolor modes.
XRGB1111 mode would need to be handled above, too.

> > @@ -1231,19 +1253,30 @@ static bool drm_fb_pixel_format_equal(const struct fb_var_screeninfo *var_1,
> >   }
> >
> >   static void drm_fb_helper_fill_pixel_fmt(struct fb_var_screeninfo *var,
> > -                                      u8 depth)
> > -{
> > -     switch (depth) {
> > -     case 8:
> > +                                      const struct drm_format_info *format)
> > +{
> > +     u8 depth = format->depth;
> > +
> > +     switch (format->format) {
> > +     // FIXME Perhaps
> > +     // #define DRM_FORMAT_C0 fourcc_code('C', '0', ' ', ' ')
>
> What is C0?

A non-existing color-indexed mode with zero colors ;-)
Introduced purely to make a check like in the comment below work.
What we really want to check here is if the mode is color-indexed
or not...

> > +     // if ((format & fourcc_code(0xff, 0xf8, 0xff, 0xff) == DRM_FORMAT_C0) ...
> > +     case DRM_FORMAT_C1:
> > +     case DRM_FORMAT_C2:
> > +     case DRM_FORMAT_C4:
> > +     case DRM_FORMAT_C8:
> >               var->red.offset = 0;
> >               var->green.offset = 0;
> >               var->blue.offset = 0;
> > -             var->red.length = 8; /* 8bit DAC */
> > -             var->green.length = 8;
> > -             var->blue.length = 8;
> > +             var->red.length = depth;
> > +             var->green.length = depth;
> > +             var->blue.length = depth;
> >               var->transp.offset = 0;
> >               var->transp.length = 0;
> > -             break;
> > +             return;
> > +     }
> > +
> > +     switch (depth) {
> >       case 15:
> >               var->red.offset = 10;
> >               var->green.offset = 5;
> > @@ -1298,7 +1331,9 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
> >   {
> >       struct drm_fb_helper *fb_helper = info->par;
> >       struct drm_framebuffer *fb = fb_helper->fb;
> > +     const struct drm_format_info *format = fb->format;
> >       struct drm_device *dev = fb_helper->dev;
> > +     unsigned int bpp;
> >
> >       if (in_dbg_master())
> >               return -EINVAL;
> > @@ -1308,22 +1343,34 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
> >               var->pixclock = 0;
> >       }
> >
> > -     if ((drm_format_info_block_width(fb->format, 0) > 1) ||
> > -         (drm_format_info_block_height(fb->format, 0) > 1))
> > -             return -EINVAL;
> > +     switch (format->format) {
> > +     case DRM_FORMAT_C1:
> > +     case DRM_FORMAT_C2:
> > +     case DRM_FORMAT_C4:
> > +             bpp = format->depth;
> > +             break;
>
> Added C8 here would be more consistent.

Again, this is not about color-indexed vs. truecolor, but about bpp.
drm_format_info_bpp()?

 > +
> > +     default:
> > +             if ((drm_format_info_block_width(format, 0) > 1) ||
> > +                 (drm_format_info_block_height(format, 0) > 1))
> > +                     return -EINVAL;
> > +
> > +             bpp = format->cpp[0] * 8;
> > +             break;
> > +     }

> > @@ -1680,11 +1727,20 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
> >   }
> >
> >   static void drm_fb_helper_fill_fix(struct fb_info *info, uint32_t pitch,
> > -                                uint32_t depth)
> > +                                uint32_t format)
> >   {
> >       info->fix.type = FB_TYPE_PACKED_PIXELS;
> > -     info->fix.visual = depth == 8 ? FB_VISUAL_PSEUDOCOLOR :
> > -             FB_VISUAL_TRUECOLOR;
> > +     switch (format) {

This one is about color-indexed vs. truecolor.

> > +     case DRM_FORMAT_C1:
> > +     case DRM_FORMAT_C2:
> > +     case DRM_FORMAT_C4:
> > +     case DRM_FORMAT_C8:
> > +             info->fix.visual = FB_VISUAL_PSEUDOCOLOR;
> > +             break;
> > +     default:
> > +             info->fix.visual = FB_VISUAL_TRUECOLOR;
> > +             break;
> > +     }
> >       info->fix.mmio_start = 0;
> >       info->fix.mmio_len = 0;
> >       info->fix.type_aux = 0;
> > @@ -1701,19 +1757,29 @@ static void drm_fb_helper_fill_var(struct fb_info *info,
> >                                  uint32_t fb_width, uint32_t fb_height)
> >   {
> >       struct drm_framebuffer *fb = fb_helper->fb;
> > +     const struct drm_format_info *format = fb->format;
> >
> > -     WARN_ON((drm_format_info_block_width(fb->format, 0) > 1) ||
> > -             (drm_format_info_block_height(fb->format, 0) > 1));
> >       info->pseudo_palette = fb_helper->pseudo_palette;
> >       info->var.xres_virtual = fb->width;
> >       info->var.yres_virtual = fb->height;
> > -     info->var.bits_per_pixel = fb->format->cpp[0] * 8;
> > +     switch (format->format) {
> > +     case DRM_FORMAT_C1:
> > +     case DRM_FORMAT_C2:
> > +     case DRM_FORMAT_C4:
> > +             info->var.bits_per_pixel = format->depth;
> > +             break;
>
> C8.

Again, this is not about color-indexed vs. truecolor, but about bpp.
Here I do check the 4CC codes, as this controls which modes can be
handled by the fbdev emulation, and we do not want to let random
modes with depth or bpp < 8 pass.

> The fbdev helpers look correct to me.  I'm not so sure about the usage
> of the format info; especially the depth field.  The docs say that the
> field is deprecated and should be 0. Maybe depth can be handled within
> fbdev?

Perhaps. I don't know enough about DRM to know what the depth field
is used for.

Note that true fbdev supports all values of depth < bpp (e.g. a
32-color mode (depth = 5) where each pixel is stored in one byte).
I do not suggest adding support for that, though ;-)

> > +
> > +     default:
> > +             WARN_ON((drm_format_info_block_width(format, 0) > 1) ||
> > +                     (drm_format_info_block_height(format, 0) > 1));

BTW, probably this WARN_ON() (which existed before, but got moved)
should be converted into returning an error instead.

> > +             info->var.bits_per_pixel = format->cpp[0] * 8;
> > +     }
> >       info->var.accel_flags = FB_ACCELF_TEXT;
> >       info->var.xoffset = 0;
> >       info->var.yoffset = 0;
> >       info->var.activate = FB_ACTIVATE_NOW;
> >
> > -     drm_fb_helper_fill_pixel_fmt(&info->var, fb->format->depth);
> > +     drm_fb_helper_fill_pixel_fmt(&info->var, format);
> >
> >       info->var.xres = fb_width;
> >       info->var.yres = fb_height;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
