Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C27AE30F77D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 17:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A61B6E9CC;
	Thu,  4 Feb 2021 16:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BA96E9CC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 16:18:24 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id 63so3970729oty.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 08:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8lBqeXR6rTdMQBt1HulQWvi6I6HuqFc6RWLlh/bExKw=;
 b=FjZg/h+SS1h6XlFs3sCfuln/gScKn79rXM70KWTUsJYNNzVoUrkV7pnxSbOMva+bLM
 ciSlmM5qzcx9gi/fTUVb9yOzQl01dsSwdf6jne3G26RZP6ZpYuQDQd5SHbSBPBEM7N/R
 yqoTOq6Cahe3Adzm9D1eLEv7ugCPUf4sf3MF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8lBqeXR6rTdMQBt1HulQWvi6I6HuqFc6RWLlh/bExKw=;
 b=oI/BESQ4ZJuHFWborI3XXs3p7OKB/KgADOpHOQybH/RrPYAly+0HqxWQ5/aOTEflFy
 qZRsHfEXvkFMgsiKvGKXMBgaRZYcMM1Eb9n8RLj/Zvbuhto7CcfCoYQmjWx1BGhGl6HU
 ORM4HMA0hdyIKXqGnInk1hwyyd9KCEtGkM+3hL78oRz05MuuZvBTtyLCUjGG3hMjwgnc
 W2F+K37fKMDsowRiXwzBD/XdVYB6aik0J1VbmkXSQ2Nf0oV2IAmJeV8KAZWhaBz9VY7n
 gM3PgR6lYSyPWHWYtvcuD2i9J1IOIdCKaPFMusm6eTwRHxFHY//lQz9UkRPU+pFwsbJ4
 OF3A==
X-Gm-Message-State: AOAM532VSuS7pVoCEE2oz1MkhihX7esDZOx9WJIok5pSZmaJrhaFoiMi
 dhtW8bPNKbzw2PwrV+Smkep9pI55Gm/rGSbvuaPZ9Q==
X-Google-Smtp-Source: ABdhPJxW+Kdac9zL/J4GMG4yvxUiyuj33lU/mvm+h/OtrdvsTndxuit7InPE6s5vI6Dy7bsHfQUX+aVK8KuEwpbv2Fc=
X-Received: by 2002:a9d:2265:: with SMTP id o92mr84355ota.188.1612455503401;
 Thu, 04 Feb 2021 08:18:23 -0800 (PST)
MIME-Version: 1.0
References: <CAM+GfYH16EhimL6pYpgD1jutMoL6Ai2dAWQs=j71GqXbrm9J=A@mail.gmail.com>
 <YBwQpjdpzHy6ImxQ@phenom.ffwll.local>
 <CAM+GfYHyMCsGGJ7bMyjX4eGOCaC=euYMxVdUcLherj6v-t227w@mail.gmail.com>
In-Reply-To: <CAM+GfYHyMCsGGJ7bMyjX4eGOCaC=euYMxVdUcLherj6v-t227w@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 4 Feb 2021 17:18:12 +0100
Message-ID: <CAKMK7uFkVvwDaqD5uYJ2vDHu7Ooz6zZ8xuGEuKod-f4GqnTGAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: remove atomic helper dirtyfb
To: Toni Spets <toni.spets@iki.fi>
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 5:03 PM Toni Spets <toni.spets@iki.fi> wrote:
>
>
>
> On Thu, Feb 4, 2021, 17:20 Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Wed, Feb 03, 2021 at 09:53:40PM +0200, Toni Spets wrote:
>> > The blocking implementation of the dirtyfb ioctl is extremely slow when
>> > used for damage tracking on RK3399. If this implementation is in place Xorg
>> > will default to using it and will slow down considerably when doing a lot
>> > of small draws. This is most apparent with the fvwm window manager on
>> > startup where it will almost lock up for many seconds seconds on RK3399.
>> >
>> > Removing this implementation did not cause any visible issues on RK3399 but
>> > it did fix the performance issues on Xorg as it will disable damage
>> > tracking when the ioctl returns it's not supported.
>>
>> Then you don't have a manual update panel.
>>
>> Iirc there were patches to make this faster in recent kernels, on what
>> kernels did you try this?
>
>
> Latest was 5.10.12. If there are fixes for this in later kernels I will definitely try it out.

Hm I thought it landed already. But checking it the optimization was
for fbdev to batch up updates more (because that one doesn't even
try), not direct X usage. So your X should work faster if you use
fbdev as backend (just as an experiment).

>> Also X should only call this in the blocker handler, not all the time.
>
>
> It does but fvwm is an example that forces it to be called a lot and it's slow enough to cause significant issues.
>
>>
>> So yeah we need to make this faster, not break manual update panels.
>
>
> Pardon my ignorance but while making this operation faster will indeed make it better wouldn't the correct behavior be to know if a panel requires this or not?

Not impossible, but there's a pile of layers in the way. And generally
frontbuffer rendering doesn't see a lot of love, since aside from
bootloaders and old sckool X window systems without compositors,
they're not really seeing any use. Everything Wayland or composited
desktops is double-buffered and fast.

For fbdev we're also doing the dirty tracking now at a driver level
(using the helpers), unconditionally whether the given hw actually
needs it or not.

More pragmatic approach would be to throw a kernel thread at this
problem. Will be tricky since we need to make sure that from
userspace's pov nothing breaks, which is always a bit an issue when
making things more asynchronous. Specifically we need to make sure
that userspace doesn't get ahead of the kernel, so might need to
require that we only batch up updates for the same framebuffer object,
but stall when we switch.

The locking for this will get interesting.

Cheers, Daniel

> Making a low performance device wait any extra time for no reason doesn't sound like the correct fix either.
>
> I'm not defending the patch itself as I don't have enough understanding of the drm or kernel so if it's indeed definitely breaking something then of course it can't be used as is.
>
> Thanks.
>
>
>> -Daniel
>>
>> >
>> > --
>> > Toni Spets
>>
>> > From 79984ee67c801f552e9eaf4d0cfb62101d1f0f2e Mon Sep 17 00:00:00 2001
>> > From: Toni Spets <toni.spets@iki.fi>
>> > Date: Wed, 3 Feb 2021 21:14:50 +0200
>> > Subject: [PATCH] drm/rockchip: remove atomic helper dirtyfb
>> >
>> > ---
>> >  drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 1 -
>> >  1 file changed, 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
>> > index 3aa37e177667..2554fd1c8aeb 100644
>> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
>> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
>> > @@ -21,7 +21,6 @@
>> >  static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
>> >       .destroy       = drm_gem_fb_destroy,
>> >       .create_handle = drm_gem_fb_create_handle,
>> > -     .dirty         = drm_atomic_helper_dirtyfb,
>> >  };
>> >
>> >  static struct drm_framebuffer *
>> > --
>> > 2.27.0
>> >
>>
>> > _______________________________________________
>> > dri-devel mailing list
>> > dri-devel@lists.freedesktop.org
>> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
