Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E996374B5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 10:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA74110E6B5;
	Thu, 24 Nov 2022 09:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A747E10E6B5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 09:04:34 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id fy37so2665061ejc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 01:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pcMMrNexMg7uk5V07y6ofHZRaGMFOJAdVNWM7NvAom8=;
 b=c6ZFFMxPziWGEih6OnzFHJWQjimPOB+VTcv7M55W96qIhRsMA9iYuK2Zne80r9r8Te
 ghZefKeRzP2yj2a0TGWmlmzZNCl8sijGM9rSs3aGaFrDv39pwcxFPvxveLiJApl5ZYwd
 kUQi4nvT0r1sn4RfbaeCZgTsM3mxERsLLq1P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pcMMrNexMg7uk5V07y6ofHZRaGMFOJAdVNWM7NvAom8=;
 b=TMdIXiYPbfTtQAVLuymufbaXJrzvKf6IQVxU6WHBKdGjIKgaG5VnzZxNbCzSgSSZkx
 rMbHSeKQXAHpxMUzdMew7iXG/TlCFGbxpvCJdZXr8hrXiIVISThz/CbokERL2XWVX6Uq
 Js6qMMoiSK2pJ1eGUmIyPfBRpJnO5dz2Y1RrIUsHY2YXp+9I76UqWtMfOW7bFe6B8Fua
 MismcdreNoK7fO9dT8jswMZjrOYL+QGLJ9A5ZJrawvFQImCyYuGfy86y6P6Y3TAd2nZK
 +QUhqRn/XQ5QpMLDB/x+uh+lymeCN3g6Q2IoN7nBjjMuqenXhnvhsvverSPJsNcRvO+A
 1I8g==
X-Gm-Message-State: ANoB5pn3WyuUA3RqgKRhIaSfGbmsb9eTmx7Ibe3Li3XesR9CgKKW00iI
 XpDt2QAIaa1LiZ1CpV3wToDoZw==
X-Google-Smtp-Source: AA0mqf5YqGkNGskmrDFzq3+eFN3Y6OY0f7bSR7ohOOG2Q/QaVAUliYK9jJg4fzmfR/0SXkM+XsDyhw==
X-Received: by 2002:a17:907:8c0d:b0:7ae:70f9:114 with SMTP id
 ta13-20020a1709078c0d00b007ae70f90114mr26594367ejc.44.1669280672953; 
 Thu, 24 Nov 2022 01:04:32 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 i25-20020a056402055900b0046730154ccbsm271694edx.42.2022.11.24.01.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 01:04:32 -0800 (PST)
Date: Thu, 24 Nov 2022 10:04:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555
 and RGB565 formats
Message-ID: <Y38znirlUpFoQRqX@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-fbdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <e2ef753e-8527-1fc6-f2f0-bc10aa744463@suse.de>
 <CAMuHMdXHOGz6Q9jsp9+Y6Op5qw3E-qUnHzYv3rxkVO5Bd2bKjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXHOGz6Q9jsp9+Y6Op5qw3E-qUnHzYv3rxkVO5Bd2bKjw@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 24, 2022 at 09:55:18AM +0100, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> On Thu, Nov 24, 2022 at 9:47 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Am 23.11.22 um 17:43 schrieb Geert Uytterhoeven:
> > > As of commit eae06120f1974e1a ("drm: refuse ADDFB2 ioctl for broken
> > > bigendian drivers"), drivers must set the
> > > quirk_addfb_prefer_host_byte_order quirk to make the drm_mode_addfb()
> > > compat code work correctly on big-endian machines.
> > >
> > > While that works fine for big-endian XRGB8888 and ARGB8888, which are
> > > mapped to the existing little-endian BGRX8888 and BGRA8888 formats, it
> > > does not work for big-endian XRGB1555 and RGB565, as the latter are not
> > > listed in the format database.
> > >
> > > Fix this by adding the missing formats.  Limit this to big-endian
> > > platforms, as there is currently no need to support these formats on
> > > little-endian platforms.
> > >
> > > Fixes: 6960e6da9cec3f66 ("drm: fix drm_mode_addfb() on big endian machines.")
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > v2:
> > >    - Use "DRM_FORMAT_foo | DRM_FORMAT_BIG_ENDIAN" instead of
> > >      "DRM_FORMAT_HOST_foo",
> > >    - Turn into a lone patch, as all other patches from series
> > >      https://lore.kernel.org/r/cover.1657300532.git.geert@linux-m68k.org
> > >      were applied to drm-misc/for-linux-next.
> > > ---
> > >   drivers/gpu/drm/drm_fourcc.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > > index e09331bb3bc73f21..265671a7f9134c1f 100644
> > > --- a/drivers/gpu/drm/drm_fourcc.c
> > > +++ b/drivers/gpu/drm/drm_fourcc.c
> > > @@ -190,6 +190,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
> > >               { .format = DRM_FORMAT_BGRA5551,        .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> > >               { .format = DRM_FORMAT_RGB565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > >               { .format = DRM_FORMAT_BGR565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > > +#ifdef __BIG_ENDIAN
> > > +             { .format = DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > > +             { .format = DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> >
> > Getting back to the discussion on endianess, I don't understand why the
> > BIG_ENDIAN flag is set here.  AFAIK these formats are always little
> > endian.  And the BE flag is set by drivers/userspace if a framebuffer
> > has a BE ordering.
> >
> > It would be better to filter the BE flag in __drm_format_info() before
> > the function does the lookup.
> 
> I mentioned that alternative in [2], but rejected it because of the
> disadvantages:
>   - {,__}drm_format_info() returns a pointer to a const object,
>     whose .format field won't have the DRM_FORMAT_BIG_ENDIAN flag set,
>     complicating callers,
>   - All callers need to be updated,
>   - It is difficult to know which big-endian formats are really
>     supported, especially as only a few are needed.

fwiw this last point is why I think this is the right approach. Long term
we might want to add _BE variants of these #defines so that they can be
used everywhere and are easy to grep. As long as it's just a handful of
places then the very verboy | DRM_FORMAT_BIG_ENDIAN is ok too.

With this approach we can make it _very_ explicit what big endian formats
are supported by a driver or other piece in the stack (like fbdev
emulation), and I think explicit is what we want with be because it's
become such an exception. Otherwise we'll just end up with more terrible
cruft like the host endian hacks in the addfb compat code.
-Daniel
> 
> [2] [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and RGB565 formats
> https://lore.kernel.org/all/0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
