Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A94B82317C4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 04:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B84A6E432;
	Wed, 29 Jul 2020 02:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080326E430;
 Wed, 29 Jul 2020 02:48:36 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id bo3so81778ejb.11;
 Tue, 28 Jul 2020 19:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sImaCTa8JHQawO5OG0a6DgsglV/UDKEm57m9pucyyPc=;
 b=sC1dUkANVzXCf0OWrjd0XqNS93SKs4auvCisHNI/Z1FbxnSQYGrZDN6XUcZC0q5OrY
 qArQ43gkJR8SAhkv9ItuySiTbbzk4gStuH7+fLH3WdPItCVcW56fuUfG+BiF6KXMKbsx
 DEO8d8/69/0zVwQ8cFbFkazBlBEvCki8Go+TsJI4FvnOzVqxe5xowOOQnjv5OFfNpg3p
 uilHHE2iMRv71KdLnpv7I+5jFSMPsaIGeLSRh7eJlJsQiURyYVfmPvfvzIyujIs9XRc3
 v49Cl6Qwbfok02WoF4lsWXH4n5EK5fgRbTJCHqMTbAnL5n72a1ZK4ovN/+SilwSTueBS
 YhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sImaCTa8JHQawO5OG0a6DgsglV/UDKEm57m9pucyyPc=;
 b=kVrm3OZIAnACOSXl39SzRqKH5Tg/RgrQcMgxjxOO4v/y2clOhpkhljbkEFIjMvQ+Lj
 FrNjbtpd/A5EdGixUb11UBJ4VHs9RWT6oLZqlVzOhahFeUNoX3FX5m0hHTSwkol+UR6T
 B3BvVu236zEublJ3+woP4ZGfjoNJf6DaTN41VEwgwAgwndEo0/63gfvbYvrTftxfpbOF
 2FOtFeXwZglfrWl8NPq8kWcZTzurkLxW8IPTSQKhq//TUMYRw17Un79sOAW2P91cratA
 LJcMB42n2Z39dfFVACgw/aEHr5/7Ly81QIb7C/Roa2shh9nNGZt6GntyvpArM45gg8NO
 GttQ==
X-Gm-Message-State: AOAM5337lQ5Y7kK97hTKK5+9d9ZNuytZGqnqNfBEoA3NqLM5cLuBhaqB
 hhua3IAUb3TNOSSGaqvcCJQANt5lVEBFaCaNL14=
X-Google-Smtp-Source: ABdhPJzYLXI+6uLxwxEpbSJOMQdbEZYT8/XYILnce0JcOj4aT9dEvdS+7Q3RFf1y/zvVe39BozgL12LB1UsiVLp2zX0=
X-Received: by 2002:a17:906:f905:: with SMTP id
 lc5mr12106650ejb.340.1595990915386; 
 Tue, 28 Jul 2020 19:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200718033352.1810-1-jajones@nvidia.com>
 <CACAvsv6a6Td=igGXwrpPUASMfYPCH9VvWdEY6PBaY+0cybJNxA@mail.gmail.com>
 <561f3a10-82af-cff5-b771-2e56b6eb973a@nvidia.com>
In-Reply-To: <561f3a10-82af-cff5-b771-2e56b6eb973a@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 29 Jul 2020 12:48:23 +1000
Message-ID: <CAPM=9twQfg6QiiL2fn=qaBRrWCsnoByoch+1vAN94ZwqzYDFxg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: Accept 'legacy' format modifiers
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
Cc: Ben Skeggs <skeggsb@gmail.com>, Nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Jul 2020 at 04:51, James Jones <jajones@nvidia.com> wrote:
>
> On 7/23/20 9:06 PM, Ben Skeggs wrote:
> > On Sat, 18 Jul 2020 at 13:34, James Jones <jajones@nvidia.com> wrote:
> >>
> >> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
> >> family of modifiers to handle broken userspace
> >> Xorg modesetting and Mesa drivers. Existing Mesa
> >> drivers are still aware of only these older
> >> format modifiers which do not differentiate
> >> between different variations of the block linear
> >> layout. When the format modifier support flag was
> >> flipped in the nouveau kernel driver, the X.org
> >> modesetting driver began attempting to use its
> >> format modifier-enabled framebuffer path. Because
> >> the set of format modifiers advertised by the
> >> kernel prior to this change do not intersect with
> >> the set of format modifiers advertised by Mesa,
> >> allocating GBM buffers using format modifiers
> >> fails and the modesetting driver falls back to
> >> non-modifier allocation. However, it still later
> >> queries the modifier of the GBM buffer when
> >> creating its DRM-KMS framebuffer object, receives
> >> the old-format modifier from Mesa, and attempts
> >> to create a framebuffer with it. Since the kernel
> >> is still not aware of these formats, this fails.
> >>
> >> Userspace should not be attempting to query format
> >> modifiers of GBM buffers allocated with a non-
> >> format-modifier-aware allocation path, but to
> >> avoid breaking existing userspace behavior, this
> >> change accepts the old-style format modifiers when
> >> creating framebuffers and applying them to planes
> >> by translating them to the equivalent new-style
> >> modifier. To accomplish this, some layout
> >> parameters must be assumed to match properties of
> >> the device targeted by the relevant ioctls. To
> >> avoid perpetuating misuse of the old-style
> >> modifiers, this change does not advertise support
> >> for them. Doing so would imply compatibility
> >> between devices with incompatible memory layouts.
> >>
> >> Tested with Xorg 1.20 modesetting driver,
> >> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
> >> gnome & KDE wayland desktops from Ubuntu 18.04,
> >> and sway 1.5
> >>
> >> Reported-by: Kirill A. Shutemov <kirill@shutemov.name>
> >> Fixes: fa4f4c213f5f ("drm/nouveau/kms: Support NVIDIA format modifiers")
> >> Link: https://lkml.org/lkml/2020/6/30/1251
> >> Signed-off-by: James Jones <jajones@nvidia.com>
> >> ---
> >>   drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
> >>   1 file changed, 24 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> >> index 496c4621cc78..31543086254b 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> >> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
> >>                     uint32_t *tile_mode,
> >>                     uint8_t *kind)
> >>   {
> >> +       struct nouveau_display *disp = nouveau_display(drm->dev);
> >>          BUG_ON(!tile_mode || !kind);
> >>
> >> +       if ((modifier & (0xffull << 12)) == 0ull) {
> >> +               /* Legacy modifier.  Translate to this device's 'kind.' */
> >> +               modifier |= disp->format_modifiers[0] & (0xffull << 12);
> >> +       }
> > I believe this should be moved into the != MOD_LINEAR case.
>
> Yes, of course, thanks.  I need to re-evaluate my testing yet again to
> make sure I hit that case too.  Preparing a v3...

Going to need something here in the next day, two max.

Linus may wait for another week, but it's not guaranteed.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
