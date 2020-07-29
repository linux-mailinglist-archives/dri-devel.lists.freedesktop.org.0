Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642E4231838
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 05:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A34E6E3FC;
	Wed, 29 Jul 2020 03:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FEA6E3FC;
 Wed, 29 Jul 2020 03:40:25 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id c18so4370054ybr.1;
 Tue, 28 Jul 2020 20:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xm0tWfZSHH+hBx37xPeSvZkiGd5W6L1mbHE84FEiJm8=;
 b=Jo0cRY8Gli+foOVlFRUSXhxO3kt+I2nQZQmJBaZi7Zzq59mzQtXzBDXslkOCBs3zsd
 2/Uc7Ro7J5roLVDnsnWaLaE6AFwjj9OAwdT5bm0TvAa/qQuI7jdsYzJVOK4glzSHYAJ1
 x0x504FuY96Q841Q4h8/g2CxnUt9wN1MgU5KAf1QH0ssAfspJsPh3WHVUTMiGpYqdUCF
 irRC0BkaSjs05WzKs4B5hXWwJWzvOJe2J7UFJJvGjqpE2VrAjpgUWPqqzL7II5tQDe7n
 m6JtIwG9wPi9RtXmz9wzJ+/cZLuflwiadYOjyuOBhz9E7FF+7T/7Vl2MeMfCSpJtWP4e
 N+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xm0tWfZSHH+hBx37xPeSvZkiGd5W6L1mbHE84FEiJm8=;
 b=q2BymmuSUoA8oODMCodn4qU23sjdLvXQfpypGikiR0VOOB+VRNnWGO55+WGMwyHK38
 b/unttCRgE2FSk4dXu7XCmN0YuwGLCCv5wvyUtrrAyVnNigMiORQOntPUANGtaiYFDGL
 ot1GRl5AbL4qdLfriqspccAjWId8AyfqjGyQ/5v768n4MRYSiehYRcW37j32d9w3A2AO
 rOODM24QcnIkaQE5+T6CUDiORCotiPy4Kq1qrU0u3WgDZNjk1Vsckoo0yzmDSHwRUuID
 1LOJ95KkvuYDroSjM1HXuPihsLZRtFRcstAMbi7s+OUVeVJ+NM+2EKsiyaGgXZzIrGxF
 xoug==
X-Gm-Message-State: AOAM532YpVB4QBAGE5lmp62vkuC8+XOYg0HRaE4pLY7tsxwuO3D81o5Z
 9eAAK9ZhiPX4rQwqw54NFBn3zMa6kh7IF3hPe18=
X-Google-Smtp-Source: ABdhPJz4NWv2rywj1Om6Gh+IuTPiIxYUUDw/ey6TMPhwH7n2la5YAqR386ECO+8fHTCkhxwBM2B+asNy/aIK+O2lSpw=
X-Received: by 2002:a25:cf08:: with SMTP id f8mr12517685ybg.435.1595994024145; 
 Tue, 28 Jul 2020 20:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200718033352.1810-1-jajones@nvidia.com>
 <CACAvsv6a6Td=igGXwrpPUASMfYPCH9VvWdEY6PBaY+0cybJNxA@mail.gmail.com>
 <561f3a10-82af-cff5-b771-2e56b6eb973a@nvidia.com>
 <CAPM=9twQfg6QiiL2fn=qaBRrWCsnoByoch+1vAN94ZwqzYDFxg@mail.gmail.com>
In-Reply-To: <CAPM=9twQfg6QiiL2fn=qaBRrWCsnoByoch+1vAN94ZwqzYDFxg@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 29 Jul 2020 13:40:13 +1000
Message-ID: <CACAvsv6_h95a-Gpd-=YxW0d8CoOHvO2OLCsoDpJvUx=MWzdFzw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: Accept 'legacy' format modifiers
To: Dave Airlie <airlied@gmail.com>
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
Cc: Nouveau <nouveau@lists.freedesktop.org>, James Jones <jajones@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jul 2020 at 12:48, Dave Airlie <airlied@gmail.com> wrote:
>
> On Tue, 28 Jul 2020 at 04:51, James Jones <jajones@nvidia.com> wrote:
> >
> > On 7/23/20 9:06 PM, Ben Skeggs wrote:
> > > On Sat, 18 Jul 2020 at 13:34, James Jones <jajones@nvidia.com> wrote:
> > >>
> > >> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
> > >> family of modifiers to handle broken userspace
> > >> Xorg modesetting and Mesa drivers. Existing Mesa
> > >> drivers are still aware of only these older
> > >> format modifiers which do not differentiate
> > >> between different variations of the block linear
> > >> layout. When the format modifier support flag was
> > >> flipped in the nouveau kernel driver, the X.org
> > >> modesetting driver began attempting to use its
> > >> format modifier-enabled framebuffer path. Because
> > >> the set of format modifiers advertised by the
> > >> kernel prior to this change do not intersect with
> > >> the set of format modifiers advertised by Mesa,
> > >> allocating GBM buffers using format modifiers
> > >> fails and the modesetting driver falls back to
> > >> non-modifier allocation. However, it still later
> > >> queries the modifier of the GBM buffer when
> > >> creating its DRM-KMS framebuffer object, receives
> > >> the old-format modifier from Mesa, and attempts
> > >> to create a framebuffer with it. Since the kernel
> > >> is still not aware of these formats, this fails.
> > >>
> > >> Userspace should not be attempting to query format
> > >> modifiers of GBM buffers allocated with a non-
> > >> format-modifier-aware allocation path, but to
> > >> avoid breaking existing userspace behavior, this
> > >> change accepts the old-style format modifiers when
> > >> creating framebuffers and applying them to planes
> > >> by translating them to the equivalent new-style
> > >> modifier. To accomplish this, some layout
> > >> parameters must be assumed to match properties of
> > >> the device targeted by the relevant ioctls. To
> > >> avoid perpetuating misuse of the old-style
> > >> modifiers, this change does not advertise support
> > >> for them. Doing so would imply compatibility
> > >> between devices with incompatible memory layouts.
> > >>
> > >> Tested with Xorg 1.20 modesetting driver,
> > >> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
> > >> gnome & KDE wayland desktops from Ubuntu 18.04,
> > >> and sway 1.5
> > >>
> > >> Reported-by: Kirill A. Shutemov <kirill@shutemov.name>
> > >> Fixes: fa4f4c213f5f ("drm/nouveau/kms: Support NVIDIA format modifiers")
> > >> Link: https://lkml.org/lkml/2020/6/30/1251
> > >> Signed-off-by: James Jones <jajones@nvidia.com>
> > >> ---
> > >>   drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
> > >>   1 file changed, 24 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> > >> index 496c4621cc78..31543086254b 100644
> > >> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> > >> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> > >> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
> > >>                     uint32_t *tile_mode,
> > >>                     uint8_t *kind)
> > >>   {
> > >> +       struct nouveau_display *disp = nouveau_display(drm->dev);
> > >>          BUG_ON(!tile_mode || !kind);
> > >>
> > >> +       if ((modifier & (0xffull << 12)) == 0ull) {
> > >> +               /* Legacy modifier.  Translate to this device's 'kind.' */
> > >> +               modifier |= disp->format_modifiers[0] & (0xffull << 12);
> > >> +       }
> > > I believe this should be moved into the != MOD_LINEAR case.
> >
> > Yes, of course, thanks.  I need to re-evaluate my testing yet again to
> > make sure I hit that case too.  Preparing a v3...
>
> Going to need something here in the next day, two max.
>
> Linus may wait for another week, but it's not guaranteed.
I tested a whole bunch of GPUs before sending nouveau's -next tree,
and with the change I suggested to this patch + the other stuff I sent
through -fixes already, things seemed to be in OK shape.

Ben.
>
> Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
