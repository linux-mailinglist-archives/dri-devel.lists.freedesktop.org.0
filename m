Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADA636680
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 18:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDD610E5BB;
	Wed, 23 Nov 2022 17:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5C210E5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 17:05:27 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id l2so11596331qtq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZaUOlJ3sjB7IWYce0/bjUUBOp0Vg9o09HXSbd2ZFOCw=;
 b=uADIdbBNIWvZTAndhpEkMhoEIiQbx20tmlpC3h6QnWa/ip82BrBdBsWEdI4URDP4iM
 iOGrxWROtlZ9+Snbei6/Mrt/z8gbb0uWWobFolc2MxSfWbsBj40w06rl6ZCFaqy5rruq
 qvw2/gW49Z5eMoE8AtC/PSi/HKwy/M2OoPn6VCfaoQ+LVLq7llykM1/gdoUyFoNy5V7t
 IDujq8FtQJwz/fmYyNAeIpxWhyfh7beQwZy2AI8HZtLSrZxeeGAG/LYoVbHrWSyTBtW7
 fAYJvP4YyVp9xiwBdJdT2lweowpqtGaLbfWqGLAOsWgxDe+Xxx29LoeBM2hWaMWESO40
 Dt5A==
X-Gm-Message-State: ANoB5pm7a20t7jMFEzFCNEJs/HAAIzYabVtnZM7ybveUkhxCYdU45oTk
 4CBg+eZaECpIQ06StoUpgegU5J0sV52hQg==
X-Google-Smtp-Source: AA0mqf5OmvbWgfeZlGcr2mlVVaB2ytMj6uVC67WfqB3TmwYaLfwDCFaQwLwSFsc6hyPSHr5CWIXLNQ==
X-Received: by 2002:a05:622a:1c11:b0:3a5:13b0:e040 with SMTP id
 bq17-20020a05622a1c1100b003a513b0e040mr9209512qtb.625.1669223126075; 
 Wed, 23 Nov 2022 09:05:26 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 r12-20020ac87eec000000b003a57eb7f212sm9942878qtc.10.2022.11.23.09.05.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 09:05:25 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id k84so21581016ybk.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:05:24 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr9395618ybq.89.1669223124469; Wed, 23 Nov
 2022 09:05:24 -0800 (PST)
MIME-Version: 1.0
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <Y35RCaEP0icg6San@phenom.ffwll.local>
In-Reply-To: <Y35RCaEP0icg6San@phenom.ffwll.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Nov 2022 18:05:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgqwHjm8Hxms04rg6YXiQacEwKiaRV80nNA_OM9mvZpA@mail.gmail.com>
Message-ID: <CAMuHMdVgqwHjm8Hxms04rg6YXiQacEwKiaRV80nNA_OM9mvZpA@mail.gmail.com>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Nov 23, 2022 at 5:57 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Nov 23, 2022 at 05:43:10PM +0100, Geert Uytterhoeven wrote:
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
> >   - Use "DRM_FORMAT_foo | DRM_FORMAT_BIG_ENDIAN" instead of
> >     "DRM_FORMAT_HOST_foo",
> >   - Turn into a lone patch, as all other patches from series
> >     https://lore.kernel.org/r/cover.1657300532.git.geert@linux-m68k.org
> >     were applied to drm-misc/for-linux-next.

> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -190,6 +190,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >               { .format = DRM_FORMAT_BGRA5551,        .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >               { .format = DRM_FORMAT_RGB565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> >               { .format = DRM_FORMAT_BGR565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +#ifdef __BIG_ENDIAN
>
> Why do we need the #ifdef here? Iirc some hw has big endian flags in the
> scanout registers, so could supprt this unconditionally if there's no
> #ifdef around the format defines. Some drivers might then also want a
> DRM_FORMAT_FOO_BE define to simplify tables and stuff, but that's more a
> bikeshed.

 "Limit this to big-endian platforms, as there is currently no need
 to support these formats on little-endian platforms."

Will anyone make use of this? In theory, all of the 16-bpp formats
can have a big-endian counterpart.

I seem to be the first one running into this ;-)

> > +             { .format = DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +             { .format = DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +#endif
> >               { .format = DRM_FORMAT_RGB888,          .depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
> >               { .format = DRM_FORMAT_BGR888,          .depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
> >               { .format = DRM_FORMAT_XRGB8888,        .depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
