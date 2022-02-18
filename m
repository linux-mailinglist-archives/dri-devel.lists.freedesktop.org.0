Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 103C14BB49C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 09:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E3E10F0BB;
	Fri, 18 Feb 2022 08:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D8F10F0C1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 08:53:33 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id g21so9181951vsp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 00:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3IIIM8aS689yU8psbZYAY0WKVYVp4V9dRKA9Ow9rLTc=;
 b=RpxKaMIpU7zW9SdLvRSjR726OafWz2gIjlK8ML9ny7nSO96ByG3iFdwX8Z6UBuxK6+
 A3qO+K/SRAZTFNsITzowgvDLCLfYcdN8YvhkyDlu3cfc3ezs4eEd+sVSCE5dQinLxpnv
 bl3t2NyC9W0xtFYjQL9cYUwr2jGRJnGdOGZZKLjTGt/27EysTlqf/6Xd/fr8IErI+5mR
 jXVwcFu7xPJM0KZVPphyWwiTblcFKF+b6lHRD8BgcWvJp/RfgOirrsW+L0LXIorL39oE
 BbUtuAUCWFFQmgBP5AckxGr+RwbuO4S9T0wNX7N5FJ9VocI8BgV2fXczlSsJd+OZ9hOo
 Ji9A==
X-Gm-Message-State: AOAM5324FPC78mOSnuG6+7CKjMi/5YVk9Se2TrcFhdDj06vg1l2xzRjT
 tJ02JVwfb9mIKqqCcPVHkkFvxDEtgJDMNA==
X-Google-Smtp-Source: ABdhPJwaLfIYbJxH/TgAqBwtwedr92a8FBaDIXEziUJFC/lIbKjHVHSnCGKwS0yqOM+3O9VwqEezag==
X-Received: by 2002:a05:6102:3913:b0:31b:b386:e467 with SMTP id
 e19-20020a056102391300b0031bb386e467mr3054813vsu.8.1645174412481; 
 Fri, 18 Feb 2022 00:53:32 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169])
 by smtp.gmail.com with ESMTPSA id r2sm1944844vka.52.2022.02.18.00.53.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 00:53:31 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id n14so4426473vkk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 00:53:31 -0800 (PST)
X-Received: by 2002:a05:6122:130c:b0:330:e674:ec91 with SMTP id
 e12-20020a056122130c00b00330e674ec91mr2843712vkp.33.1645174411496; Fri, 18
 Feb 2022 00:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-3-geert@linux-m68k.org>
 <4fff0c08-adab-c1d5-4a7e-1513cb2bf7ca@suse.de>
 <CAMuHMdVK7eWfod73JQAntO=7BAMEcS-ktH4NJmDjna3zUn7giw@mail.gmail.com>
 <4ed13232-bee3-0bea-9abb-51bf9d0bf84b@suse.de>
In-Reply-To: <4ed13232-bee3-0bea-9abb-51bf9d0bf84b@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Feb 2022 09:53:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjXdfNSvy4tvTgxe16EHoZ1CnXKNXRoP4SVpHnSFLvAQ@mail.gmail.com>
Message-ID: <CAMuHMdXjXdfNSvy4tvTgxe16EHoZ1CnXKNXRoP4SVpHnSFLvAQ@mail.gmail.com>
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

On Fri, Feb 18, 2022 at 9:14 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 17.02.22 um 17:12 schrieb Geert Uytterhoeven:
> > On Thu, Feb 17, 2022 at 3:57 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> Am 15.02.22 um 17:52 schrieb Geert Uytterhoeven:
> >>> Add support for color-indexed frame buffer formats with two, four, and
> >>> sixteen colors to the DRM framebuffer helper functions:
> >>>     1. Add support for depths 1/2/4 to the damage helper,
> >>>     2. For color-indexed modes, the length of the color bitfields must be
> >>>        set to the color depth, else the logo code may pick a logo with too
> >>>        many colors.  Drop the incorrect DAC width comment, which
> >>>        originates from the i915 driver.
> >>>     3. Accept C[124] modes when validating or filling in struct
> >>>        fb_var_screeninfo, and  use the correct number of bits per pixel.
> >>>     4. Set the visual to FB_VISUAL_PSEUDOCOLOR for all supported
> >>>        color-indexed modes.
> >>>
> >>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> >>> --- a/drivers/gpu/drm/drm_fb_helper.c
> >>> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >>> @@ -376,12 +376,34 @@ static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
> >>>                                           struct iosys_map *dst)
> >>>    {
> >>>        struct drm_framebuffer *fb = fb_helper->fb;
> >>> -     unsigned int cpp = fb->format->cpp[0];
> >>> -     size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
> >>> -     void *src = fb_helper->fbdev->screen_buffer + offset;
> >>> -     size_t len = (clip->x2 - clip->x1) * cpp;
> >>> +     size_t offset = clip->y1 * fb->pitches[0];
> >>> +     size_t len = clip->x2 - clip->x1;
> >>>        unsigned int y;
> >>> +     void *src;
> >>>
> >>> +     switch (fb->format->depth) {
> >>
> >> The depth field is deprecated. It's probably better to use
> >> fb->format->format and test against 4CC codes.
> >
> > The reason I checked for depth instead of a 4CC code is that the only
> > thing that matters here is the number of bits per pixel.  Hence this
> > function won't need any changes to support R1, R2, R4, and D1 later.
> > When we get here, we already know that we are using a format that
> > is supported by the fbdev helper code, and thus passed the 4CC
> > checks elsewhere.
>
> At some point, we will probably have to change several of these tests to
> 4cc. C8 and RGB332 both have 8-bit depth/bpp; same for C4 and RGB121; or
> whatever low-color formats we also want to add.
>
> It's not a blocker now, but maybe something to keep in mind.
>
> >
> > Alternatively, we could introduce drm_format_info_bpp() earlier in
> > the series, and use that?
>
> Having a helper for this might indeed be useful. We use depth for the
> number of color bits and bpp for the number of bits in he pixel.  That's
> important for XRGB8888, where depth is 24, or XRGB555 where depth is 15.
>
> If that makes sense, maybe have a helper for depth and one for bpp, even
> if they return the same value in most of the cases.

The helper for bpp is introduced in "[PATCH 3/8] drm/fourcc: Add
drm_format_info_bpp() helper".
I don't think we need a helper for depth, there's already the .depth
field.  It might be deprecated, but it's still used?
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
