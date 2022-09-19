Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2925BD229
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 18:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E7710E042;
	Mon, 19 Sep 2022 16:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B3A10E042;
 Mon, 19 Sep 2022 16:26:14 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-11e9a7135easo144647fac.6; 
 Mon, 19 Sep 2022 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=B79VNmtksFZCxxDMaKm5/f3GDhn1sPWt9TTqsHjBc44=;
 b=p4KBBtjPK5F6KjhfBxOotM/kEf99VqLGvag9iPunX57HEavFuYwQ0Gtr4amfWbjcWh
 jt1cAKnoH/x09ARebwlsO6Tot4ODwrwH35uTlEqt1p5PSaTMUsaoOe9NgqMAikbvX2+z
 qhca/cOrPTbArKoxRZmGe9Zk1eykZbYcrfPnXc6xnMU7d8ajY5o/vag9Jug+zD12uAWS
 flj2v9wTuVQ46qrR7ITj+hG6acIg70QwC9PoDNu1c3GaM1a0oDpRx6lhZUDD1uw7XZkV
 1ArvlG5ixJKONjKXgPTpCh7KZM0blxlfw4ucY9uqP5SxcyxiwRmQaSevilZmz9GSwLfA
 O7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=B79VNmtksFZCxxDMaKm5/f3GDhn1sPWt9TTqsHjBc44=;
 b=kO5WJE+ej3aLFEVKMJSmUfENlKPtRc9oyQb0MEpvlcK/rpCKrq94px0xnMsCKh+i/9
 vLRB5KAKx7EZPgPsB9RDAW5UOzTk18Fh8rHhKVmRombz9J3OEWEvP6A5NHp7+KqCmTUP
 aAJ2sp3Hw3RfEgcDH0uGi5gA/wLLk0oGo2Q6NTNRmtVqn1THjYm2aneo8XgqzJ1Ap727
 tr9cCoDMtnD0RmdG2TvoZm/qDA+sQNR99Eo3qcrRtrXYpcDjs2QwNW3eot8UYdtEakOk
 C4iBItwtpTrDn1kPEKHupTM6SnH+6IcJ4GMYmYYWrXNfkPtymfIvRPDdWJH4sbLYJWEm
 Fy/Q==
X-Gm-Message-State: ACgBeo2zd5pbshLDvrclivDwUXPW76ZKUWj+wlvdqudOz/LhedyY0+xq
 /lhLXXaptVJvsFKZIS1aoVbR6vpMyQBnf9SicBs=
X-Google-Smtp-Source: AA6agR5UC2hT2uHICYAa0FQGITGaDgBaOc17kIMj80rW+6ebrWUDYWUju/qs8MgQ/D1Q5xmjL6PdkqT7LmmDeG5Z+/I=
X-Received: by 2002:a05:6870:1783:b0:12a:f442:504d with SMTP id
 r3-20020a056870178300b0012af442504dmr16904152oae.46.1663604773291; Mon, 19
 Sep 2022 09:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220906195721.143022-1-hamza.mahfooz@amd.com>
 <99314fcf-b886-a7bd-3866-241af6ac9831@suse.de>
In-Reply-To: <99314fcf-b886-a7bd-3866-241af6ac9831@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Sep 2022 12:26:01 -0400
Message-ID: <CADnq5_MBF2j1Zwe2gFxN-bwe62Yo-RbOepUBwzYDR0APc=T0Zw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use dirty framebuffer helper
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 19, 2022 at 2:44 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 06.09.22 um 21:57 schrieb Hamza Mahfooz:
> > Currently, we aren't handling DRM_IOCTL_MODE_DIRTYFB. So, use
> > drm_atomic_helper_dirtyfb() as the dirty callback in the amdgpu_fb_func=
s
> > struct.
>
> drm_atomic_helper_dirtyfb() creates a new atomic commit for the
> frambuffer's planes. Drivers can then updates these planes' output
> (e.g., writeback to video memory). I thought that amdgpu simply scans
> out from the framebuffer's memory regions in VRAM. So I'm curious why
> this patch is necessary.

I think in this particular case, the problem is that there are still
some asic which default to non-atomic code which is what is causing
the problem here.  Something like this would fix that:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 5b09c8f4fe95..f5e9dd454c54 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -497,6 +497,11 @@ bool amdgpu_display_ddc_probe(struct
amdgpu_connector *amdgpu_connector,
 static const struct drm_framebuffer_funcs amdgpu_fb_funcs =3D {
        .destroy =3D drm_gem_fb_destroy,
        .create_handle =3D drm_gem_fb_create_handle,
+};
+
+static const struct drm_framebuffer_funcs amdgpu_fb_funcs_atomic =3D {
+       .destroy =3D drm_gem_fb_destroy,
+       .create_handle =3D drm_gem_fb_create_handle,
        .dirty =3D drm_atomic_helper_dirtyfb,
 };

@@ -1102,7 +1107,10 @@ static int
amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
        if (ret)
                goto err;

-       ret =3D drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
+       if (drm_drv_uses_atomic_modeset(adev_to_drm(adev)))
+               ret =3D drm_framebuffer_init(dev, &rfb->base,
&amdgpu_fb_funcs_atomic);
+       else
+               ret =3D drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_fu=
ncs);
        if (ret)
                goto err;

As for why we need the dirty callback, I think it's used for PSR.

Alex

>
> Best regards
> Thomas
>
> >
> > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_display.c
> > index c20922a5af9f..5b09c8f4fe95 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > @@ -38,6 +38,7 @@
> >   #include <linux/pci.h>
> >   #include <linux/pm_runtime.h>
> >   #include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_damage_helper.h>
> >   #include <drm/drm_edid.h>
> >   #include <drm/drm_gem_framebuffer_helper.h>
> >   #include <drm/drm_fb_helper.h>
> > @@ -496,6 +497,7 @@ bool amdgpu_display_ddc_probe(struct amdgpu_connect=
or *amdgpu_connector,
> >   static const struct drm_framebuffer_funcs amdgpu_fb_funcs =3D {
> >       .destroy =3D drm_gem_fb_destroy,
> >       .create_handle =3D drm_gem_fb_create_handle,
> > +     .dirty =3D drm_atomic_helper_dirtyfb,
> >   };
> >
> >   uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
