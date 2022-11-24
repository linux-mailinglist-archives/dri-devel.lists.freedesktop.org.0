Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2562763748E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 09:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E7510E6B4;
	Thu, 24 Nov 2022 08:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D50A10E6B4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 08:55:32 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id n12so595418qvr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ltDWhcn3gZTnH4uku4/njf53RbMuOe2j1J0ZvvamyfA=;
 b=N5smQijrNtkObKpZ9ibs9Y9O1VMUuFgz6i+IC8MEqlhJXuvEqIVkBfHM3al7ROwSHL
 Ba4kavLUYlFbJI0LSspU2d6xmGlNtWLAqs/zjIRQ9NmzPpc+jLLschW8sazMKk0RMpLH
 fHZ1jTZfQRvW3IpTCM9yvs4MBOafWt35ABc5oYMRomCYQ6Hs7WS3ISTNpE7ttOMThr1T
 Mq6evv2qLT4pRzpXuv30WykG6tk+P42BTc3H0SooLE8vLXvL6X0P19iC5sBbE5WIS1R3
 ufJ9eDc3795CbJS1y5+/MHuPwndP1ueX6Ne63PYrpBZHJgOsPyzloPiFGVK/bwrw0oBC
 343A==
X-Gm-Message-State: ANoB5pm5udiCfDQjQJv0L10kdspwZpHUVBwhS8yd9Y0BHbKVQO43BtDm
 OVWU71GZeOHa0d1OtmTZ5yA150XsSOFUUw==
X-Google-Smtp-Source: AA0mqf63rXEFZldl4hvuYhJqigFmtQGxOyOdFP82W0rX9z61C6u1E4+crATh/bREK5eIvM7+PubqGA==
X-Received: by 2002:a0c:ff28:0:b0:4bb:798d:879c with SMTP id
 x8-20020a0cff28000000b004bb798d879cmr12238212qvt.7.1669280131227; 
 Thu, 24 Nov 2022 00:55:31 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a084c00b006ee949b8051sm520530qku.51.2022.11.24.00.55.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 00:55:30 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id z192so1160410yba.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:55:30 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr12337016ybq.89.1669280130150; Thu, 24
 Nov 2022 00:55:30 -0800 (PST)
MIME-Version: 1.0
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <e2ef753e-8527-1fc6-f2f0-bc10aa744463@suse.de>
In-Reply-To: <e2ef753e-8527-1fc6-f2f0-bc10aa744463@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Nov 2022 09:55:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHOGz6Q9jsp9+Y6Op5qw3E-qUnHzYv3rxkVO5Bd2bKjw@mail.gmail.com>
Message-ID: <CAMuHMdXHOGz6Q9jsp9+Y6Op5qw3E-qUnHzYv3rxkVO5Bd2bKjw@mail.gmail.com>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Nov 24, 2022 at 9:47 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 23.11.22 um 17:43 schrieb Geert Uytterhoeven:
> > As of commit eae06120f1974e1a ("drm: refuse ADDFB2 ioctl for broken
> > bigendian drivers"), drivers must set the
> > quirk_addfb_prefer_host_byte_order quirk to make the drm_mode_addfb()
> > compat code work correctly on big-endian machines.
> >
> > While that works fine for big-endian XRGB8888 and ARGB8888, which are
> > mapped to the existing little-endian BGRX8888 and BGRA8888 formats, it
> > does not work for big-endian XRGB1555 and RGB565, as the latter are not
> > listed in the format database.
> >
> > Fix this by adding the missing formats.  Limit this to big-endian
> > platforms, as there is currently no need to support these formats on
> > little-endian platforms.
> >
> > Fixes: 6960e6da9cec3f66 ("drm: fix drm_mode_addfb() on big endian machines.")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > v2:
> >    - Use "DRM_FORMAT_foo | DRM_FORMAT_BIG_ENDIAN" instead of
> >      "DRM_FORMAT_HOST_foo",
> >    - Turn into a lone patch, as all other patches from series
> >      https://lore.kernel.org/r/cover.1657300532.git.geert@linux-m68k.org
> >      were applied to drm-misc/for-linux-next.
> > ---
> >   drivers/gpu/drm/drm_fourcc.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index e09331bb3bc73f21..265671a7f9134c1f 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -190,6 +190,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >               { .format = DRM_FORMAT_BGRA5551,        .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >               { .format = DRM_FORMAT_RGB565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> >               { .format = DRM_FORMAT_BGR565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +#ifdef __BIG_ENDIAN
> > +             { .format = DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +             { .format = DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
>
> Getting back to the discussion on endianess, I don't understand why the
> BIG_ENDIAN flag is set here.  AFAIK these formats are always little
> endian.  And the BE flag is set by drivers/userspace if a framebuffer
> has a BE ordering.
>
> It would be better to filter the BE flag in __drm_format_info() before
> the function does the lookup.

I mentioned that alternative in [2], but rejected it because of the
disadvantages:
  - {,__}drm_format_info() returns a pointer to a const object,
    whose .format field won't have the DRM_FORMAT_BIG_ENDIAN flag set,
    complicating callers,
  - All callers need to be updated,
  - It is difficult to know which big-endian formats are really
    supported, especially as only a few are needed.

[2] [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and RGB565 formats
https://lore.kernel.org/all/0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
