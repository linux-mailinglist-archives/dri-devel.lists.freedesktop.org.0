Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAC6225448
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 23:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046576E170;
	Sun, 19 Jul 2020 21:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F03A6E170
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 21:29:03 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id z23so2811325ood.8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 14:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6TpyyzhZ8psE8pd2+bNUPTCvIN+XJE2xc6LtU/y3YpU=;
 b=j/deQFoM6v3m86N1zMHx4LFn+XlVMAjz/nNql9VF8JrUPH2HrV5VGQIxU3zYE8pWcJ
 IFJD9B79N1aEFuVstXN4N6GyYjPrUufmk5mtzdWjPNAqqp5bRL0u23avDNqFs95s9MzZ
 yi2jtMQiQ2lKi9UMojDcF9gU9UhxWnADkpqBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6TpyyzhZ8psE8pd2+bNUPTCvIN+XJE2xc6LtU/y3YpU=;
 b=jkncPufvncxqLnufTZwJ/fIjLM/k5GkNHCogAqAAxYxsA52vjeA2rvj58WymDKt0Tv
 2rU+dyIaz7oOT88a1nOEmouAQSFJ9tTXtGKPwJ91OgMkiuXFe4KJBV1B8h2u0Rt6TKwh
 SYnCSU7D+PLlc0Ir6IDuWyOlD3Eicrc0gXxyt69KTiCUjzBlPhh7r1jH+I8Dtl+PnVX/
 hjqhGiPv+tDcY/K6YP4tw3CN5cZmvl8/5GcL6f4BEXfe06tY5ZWZl6JRrIKbYQppg9Hd
 jsTuw8nCETCyWfPeqpsGkLzW8Bc7sieS//A7t4i8q6oENTYjIdL+XtjBqp6qioDQ0+fl
 q81Q==
X-Gm-Message-State: AOAM531O9mVe2JScM54OKR0g1WCKXywVMZkKLi9+jMBoaSqcB/MafKcH
 HU7gZ3PKNK/3QB3hqwd2iynb6ddI7oYzfivTXzXuwA==
X-Google-Smtp-Source: ABdhPJxwXm1uomZ8b7Jb0vvqsM2QkgiPgNQZ+kT6yvMQJxVdIzyG3qvEC2B4KO+ZwPfxEt+YFyjFTt7A5C92owDBIsI=
X-Received: by 2002:a4a:a685:: with SMTP id f5mr6913138oom.85.1595194142398;
 Sun, 19 Jul 2020 14:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200717185757.2786-1-jajones@nvidia.com>
 <20200717194751.GS3278063@phenom.ffwll.local>
 <279b4b06-3f1e-9a5d-6bd8-c2518629bee1@nvidia.com>
In-Reply-To: <279b4b06-3f1e-9a5d-6bd8-c2518629bee1@nvidia.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 19 Jul 2020 23:28:51 +0200
Message-ID: <CAKMK7uH-5m64_oukqxo1VDjpPxvcmhE-v-aLZTKQyfA2Ti5s1Q@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Accept 'legacy' format modifiers
To: James Jones <jajones@nvidia.com>
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
Cc: Nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 18, 2020 at 5:43 AM James Jones <jajones@nvidia.com> wrote:
>
> On 7/17/20 12:47 PM, Daniel Vetter wrote:
> > On Fri, Jul 17, 2020 at 11:57:57AM -0700, James Jones wrote:
> >> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
> >> family of modifiers to handle broken userspace
> >> Xorg modesetting and Mesa drivers.
> >>
> >> Tested with Xorg 1.20 modesetting driver,
> >> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
> >> gnome & KDE wayland desktops from Ubuntu 18.04,
> >> and sway 1.5
> >
> > Just bikeshed, but maybe a few more words on what exactly is broken and
> > how this works around it. Specifically why we only accept these, but don't
> > advertise them.
>
> Added quite a few words.
>
> >>
> >> Signed-off-by: James Jones <jajones@nvidia.com>
> >
> > Needs Fixes: line here. Also nice to mention the bug reporter/link.
>
> Done in v2.
>
> >> ---
> >>   drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
> >>   1 file changed, 24 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> >> index 496c4621cc78..31543086254b 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> >> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
> >>                 uint32_t *tile_mode,
> >>                 uint8_t *kind)
> >>   {
> >> +    struct nouveau_display *disp = nouveau_display(drm->dev);
> >>      BUG_ON(!tile_mode || !kind);
> >>
> >> +    if ((modifier & (0xffull << 12)) == 0ull) {
> >> +            /* Legacy modifier.  Translate to this device's 'kind.' */
> >> +            modifier |= disp->format_modifiers[0] & (0xffull << 12);
> >> +    }
> >
> > Hm I tried to understand what this magic does by looking at drm_fourcc.h,
> > but the drm_fourcc_canonicalize_nvidia_format_mod() in there implements
> > something else. Is that function wrong, or should we use it here instead?
> >
>  > Or is there something else going on entirely?
>
> This may be slightly clearer with the expanded change description:
>
> Canonicalize assumes the old modifiers are only used by certain Tegra
> revisions, because the Mesa patches were supposed to land and obliterate
> all uses beyond that.  That assumption means it can assume the specific
> page kind (0xfe) used by the display-engine-compatible layout on those
> specific devices.  There is no way to generally canonicalize a legacy
> modifier without referencing a specific device type, as is indirectly
> done here.
>
> This code does a limited device-specific canonicalization: It
> substitutes the display-appropriate page kind used by this specific
> device, ensuring we derive this correct page kind later in the function.
>   I iterated on the best way to accomplish this a few times, and this
> was the least-invasive thing I came up with, but it does require a
> pretty thorough understanding of the NVIDIA modifier macros.
>
> Thanks for the quick review.

Ah yes this makes a ton more sense with your explanation of what's all
going on. Thanks for all the explaining, but probably better if
someone with real nouveau clues takes a look too. Fwiw (i.e. not much)

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

>
> -James
>
> >
> > Cheers, Daniel
> >
> >> +
> >>      if (modifier == DRM_FORMAT_MOD_LINEAR) {
> >>              /* tile_mode will not be used in this case */
> >>              *tile_mode = 0;
> >> @@ -227,6 +233,16 @@ nouveau_framebuffer_get_layout(struct drm_framebuffer *fb,
> >>      }
> >>   }
> >>
> >> +static const u64 legacy_modifiers[] = {
> >> +    DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
> >> +    DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
> >> +    DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
> >> +    DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
> >> +    DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
> >> +    DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
> >> +    DRM_FORMAT_MOD_INVALID
> >> +};
> >> +
> >>   static int
> >>   nouveau_validate_decode_mod(struct nouveau_drm *drm,
> >>                          uint64_t modifier,
> >> @@ -247,8 +263,14 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
> >>           (disp->format_modifiers[mod] != modifier);
> >>           mod++);
> >>
> >> -    if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
> >> -            return -EINVAL;
> >> +    if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID) {
> >> +            for (mod = 0;
> >> +                 (legacy_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
> >> +                 (legacy_modifiers[mod] != modifier);
> >> +                 mod++);
> >> +            if (legacy_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
> >> +                    return -EINVAL;
> >> +    }
> >>
> >>      nouveau_decode_mod(drm, modifier, tile_mode, kind);
> >>
> >> --
> >> 2.17.1
> >>
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
