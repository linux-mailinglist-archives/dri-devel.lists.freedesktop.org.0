Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0B994F6E8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 20:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D6310E27F;
	Mon, 12 Aug 2024 18:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I1DGGMlV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1417A10E27E;
 Mon, 12 Aug 2024 18:48:13 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7afd1aeac83so4041417a12.0; 
 Mon, 12 Aug 2024 11:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723488492; x=1724093292; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24X/ba2PlJTPK4pArpGUj8rmgVxLiXNjj3YjbEHmdHk=;
 b=I1DGGMlVSWEgHbpbsULLfm/3uFCxPOi6dle7LqrA6gkrZjPqNrezPqSu+NIOIC7YL2
 QwWyCA8tuDJIGPa6sYNY63LKC/sKZymAFHGqpn/UumaZx4Zq1oYF1+Y7oRjlZSVonX13
 tAV82E1XS7yQ8sUS8VuZH6PWL8xW86my7RYa+Y8wPWFYtrbFtZ/1KBZ61SIT+/c9GHIv
 lyL1kyAsTP5CVRks/MbRIlunn86xKQ/py2mR1uOIW76RlaSH9DUlzTu75mEMvFRK/pcW
 1CzuQfySDDP4ajrVUSENziCyXDQgyBgpxjpOBr+TXaLOWRAwmOjpYKmIE/ref5DObMIp
 wjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723488492; x=1724093292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=24X/ba2PlJTPK4pArpGUj8rmgVxLiXNjj3YjbEHmdHk=;
 b=drmrm5izuBpFE7oeeaQ6baS7ee79jQnH1aIsnyqYTImVFgnbO5b6cJKCflCgjI47BB
 NZ6c8aXV9OmtgU2CqSW1GY1zOUmIwvSuOTW1pfocefmqMQ1bw21hgZgJtfRpArUR4bhu
 NrfxUYGkVCQr2Wy+2Vp/dIPkxfv0KWI0Zx6SJsM4C8WuXyp8gYcG38dT027mv2hl5lrO
 j0ts+BEYcpcEWRKLD5O8wxlBvv3dSn3/C0wcw3vfjwgub8QKyxjNmtlPDRSM+LSHIpHe
 V5bMPLn3Ok3XZyJJVc7MtKitSlH4Ph2/I21dwkWFIEcGmdK5dzIKxaCW2vTMrOLVjWx6
 6f9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgb4HgEm8y+Y9v553thD9DGVeBML1yeqdi+ZHu1x4PglV/fUTTbitgWvzy9T1uNLJh+zT1lQKMAR3XPzJgwil7xjKtHkFgSSUtp5NiRE6Sgo2mmInGV5MYuC73mhDnSyZTX0+nhovWW4xPG+L0hI9N9F9xNSDm+o4v7IsKTr6mSlpNHl/POLfL4Gqvs+I=
X-Gm-Message-State: AOJu0Yz0BfsIrZxNeG/7n+1kfY6goL39zHKHhAKj7mk/q7gFxnv1dcw7
 xrFL2mgGIvBgfE+wUcsIYGC1m1ICHCq/zxztummnyZHo+hLjDlehaEYkG4zG3Gysy1L0g944EKR
 LUWJeCiQoZjlmEXRG/o30ZfM2exk=
X-Google-Smtp-Source: AGHT+IEqrho8jonZBtND7qKymcCx6SLI9tlCfQz8hrLFGJ+AV8nueiSPHUsay7pmXREN0noKqLF6NvIql8sLQlDi06M=
X-Received: by 2002:a17:90a:ee8e:b0:2c9:5a71:1500 with SMTP id
 98e67ed59e1d1-2d3940e2d04mr877487a91.0.1723488492291; Mon, 12 Aug 2024
 11:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-2-tzimmermann@suse.de>
 <ZrnUoPuYv0v-yx79@phenom.ffwll.local> <ZrnhiTofu_L3hLzA@phenom.ffwll.local>
 <c8228a22-9a8c-4eca-bf09-d72208fe007b@suse.de>
 <Zroe8pi1pRRhdIW8@phenom.ffwll.local>
In-Reply-To: <Zroe8pi1pRRhdIW8@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 Aug 2024 14:47:59 -0400
Message-ID: <CADnq5_O+zYgWXTPqdDXwdJOM6bPbzWmGCEZOHpvKNU4gka_MZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] drm: Do delayed switcheroo in drm_lastclose()
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 12, 2024 at 10:40=E2=80=AFAM Daniel Vetter <daniel.vetter@ffwll=
.ch> wrote:
>
> On Mon, Aug 12, 2024 at 12:41:39PM +0200, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 12.08.24 um 12:18 schrieb Daniel Vetter:
> > > On Mon, Aug 12, 2024 at 11:23:44AM +0200, Daniel Vetter wrote:
> > > > On Mon, Aug 12, 2024 at 10:28:22AM +0200, Thomas Zimmermann wrote:
> > > > > Amdgpu and nouveau call vga_switcheroo_process_delayed_switch() f=
rom
> > > > > their lastclose callbacks. Call it from drm_lastclose(), so that =
the
> > > > > driver functions can finally be removed. Only PCI devices with en=
abled
> > > > > switcheroo do the delayed switching. The call has no effect on ot=
her
> > > > > hardware.
> > > > >
> > > > > v2:
> > > > > - move change to drm_lastclose() (Sima)
> > > > > - update docs for vga_switcheroo_process_delayed_switch()
> > > > >
> > > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > A bit an aside: The entire vgaswitcheroo code is still a midlayer m=
ess,
> > > > where the locking is at the wrong layers resulting in the can_switc=
h check
> > > > potentially being racy. But that's a different can of worms.
> > > Ok I got a bit annoyed about this mess again, and I think I have a
> > > reasonable idea for how to address it. Not sure why this took a decad=
e,
> > > and definitely only pick this up if you're really bored.
> >
> > No, definitely not. :) I don't think I have hardware for testing
> > vga_switcheroo. Does this still exist? It seemed to be a thing of the 2=
000s.
>
> Yeah good chances the old style switcheroo doesn't have many, if any user=
s
> left ...

The power management aspect would be better handled by runtime pm.
That just leaves the output muxes.  We could arguably limit
vgaswitcheroo to just systems with the old mux controls.  If and when
we come up with a proper solution for display muxes, we could migrate
to that, but I'm not sure how many systems out there with the old mux
controls are still in use.  I'm not even sure amdgpu supports any
chips which used the old mux controls.  I think those were all chips
supported by radeon.

Alex

> -Sima
>
> >
> > Best regards
> > Thomas
> >
> > >
> > > - We add a new vga_switcheroo_client_tryget, which checks the current
> > >    state, and if it's on, increments a newly added refcount (which vg=
w
> > >    switheroo maintains). Otherwise it fails. Drivers call this from t=
heir
> > >    drm_driver->open hook. This check also allows us to drop the
> > >    layer-violating checks in drm_open_helper for drm_dev->dev_power_s=
tate.
> > >
> > > - That refcount is dropped with vga_switcheroo_client_put, called fro=
m
> > >    drm_driver->close. If the refcount drops to 0 this function also d=
oes
> > >    delayed switch processing.
> > >
> > > - All the can_switch callbacks get removed and instead the vgwswr cod=
e
> > >    directly consults its own refount.
> > >
> > > With this we don't have locking inversions anymore, and the old vgw
> > > switcheroo code works a lot more like the new mode based on runtime p=
m and
> > > power domains.
> > >
> > > With a bit more shuffling I think we can also ditch
> > > drm_driver->dev_power_state:
> > >
> > > - There's one in the intel backlight code, which is annoying, since i=
t's
> > >    wants to know whether the current callchain is from a vga switcher=
oo
> > >    state change. But doable with a little helper.
> > >
> > > - Most others just want a vga_switcheroo_client_is_off() helper, whic=
h
> > >    should be easy. Some are even entirely redundant, at least from a =
cursor
> > >    callchain check. There's no races for these because they only matt=
er
> > >    during system suspend, since you should not mix both runtime and c=
lassic
> > >    vgaswitcheroo logic. We might want some checks for that in that ne=
w
> > >    helper ...
> > >
> > > - The one in the fbdev code is annoying, because it's another race.
> > >    Ideally instead of that check it needs a call to
> > >    vga_switcheroo_client_tryget/put just around the call to restore m=
odes
> > >    (we do not want fbdev to block state switches), but that probably =
means
> > >    wiring a new callback through drm_client to drivers.
> > >
> > > - Might have missed a special case ...
> > >
> > > Anyway, I got nerdsniped, had an idea, figured best to type it up. Ma=
ybe
> > > we want to add a link to this to todo.rst, I think we have a vgaswitc=
heroo
> > > entry already.
> > >
> > > Cheers, Sima
> > >
> > >
> > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > >
> > > > > ---
> > > > >   drivers/gpu/drm/drm_file.c       | 4 ++++
> > > > >   drivers/gpu/vga/vga_switcheroo.c | 3 +--
> > > > >   2 files changed, 5 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_fil=
e.c
> > > > > index 714e42b05108..513bef816ae9 100644
> > > > > --- a/drivers/gpu/drm/drm_file.c
> > > > > +++ b/drivers/gpu/drm/drm_file.c
> > > > > @@ -38,6 +38,7 @@
> > > > >   #include <linux/pci.h>
> > > > >   #include <linux/poll.h>
> > > > >   #include <linux/slab.h>
> > > > > +#include <linux/vga_switcheroo.h>
> > > > >   #include <drm/drm_client.h>
> > > > >   #include <drm/drm_drv.h>
> > > > > @@ -404,6 +405,9 @@ void drm_lastclose(struct drm_device * dev)
> > > > >         drm_dbg_core(dev, "driver lastclose completed\n");
> > > > >         drm_client_dev_restore(dev);
> > > > > +
> > > > > +       if (dev_is_pci(dev->dev))
> > > > > +               vga_switcheroo_process_delayed_switch();
> > > > >   }
> > > > >   /**
> > > > > diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/v=
ga_switcheroo.c
> > > > > index 365e6ddbe90f..18f2c92beff8 100644
> > > > > --- a/drivers/gpu/vga/vga_switcheroo.c
> > > > > +++ b/drivers/gpu/vga/vga_switcheroo.c
> > > > > @@ -926,8 +926,7 @@ static void vga_switcheroo_debugfs_init(struc=
t vgasr_priv *priv)
> > > > >   /**
> > > > >    * vga_switcheroo_process_delayed_switch() - helper for delayed=
 switching
> > > > >    *
> > > > > - * Process a delayed switch if one is pending. DRM drivers shoul=
d call this
> > > > > - * from their ->lastclose callback.
> > > > > + * Process a delayed switch if one is pending.
> > > > >    *
> > > > >    * Return: 0 on success. -EINVAL if no delayed switch is pendin=
g, if the client
> > > > >    * has unregistered in the meantime or if there are other clien=
ts blocking the
> > > > > --
> > > > > 2.46.0
> > > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> > --
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Frankenstrasse 146, 90461 Nuernberg, Germany
> > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > HRB 36809 (AG Nuernberg)
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
