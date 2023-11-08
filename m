Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 849937E596F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 15:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE9410E78C;
	Wed,  8 Nov 2023 14:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A7C10E78C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 14:46:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0EDA61630
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 14:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F6FC433CB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 14:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699454761;
 bh=OUSDazv29stLF+DMuwXV+H17lDj4qzXwkBfxryDzQ8E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hfWXmEyBwB3wDMugbuv8PT1iH4A3eHTNKmwSEsPK3KSA+uVPgflWmDJK+miCN9bBy
 KIKoiWY41763pW1F1dbz5lQaoobdbaKsHapDNvp/jZA7MzNz+MTfBp6DnQbmYPnWmD
 kkKYQsFdz3fr7lgKXux2bVF9gm0PrAUDQi0yoCkUUjJwf8bslR66MHGKoYTbgXd/ds
 8I65ALhVfGfNcWz+a3QfFDRh76C1qA8yYveW2hiFFVKtUeG20+w6b6yD+5XelaAovx
 38cbiri/0LETktN3SK6jYf5tEHsYzoC8Zlu3g2AU8OLJ48GvdLrl7hBgUH0R9bE1/2
 WwKcZQviUQkZQ==
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-9c773ac9b15so1064643066b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 06:46:01 -0800 (PST)
X-Gm-Message-State: AOJu0YwxNOJh12PDJFbbj/1aOwgTwW2byDqHFnC6V8XWvVM8hf/5RRp6
 0i3Uv99/89FgboLUHfogxad23J562bzXLadoREA=
X-Google-Smtp-Source: AGHT+IG/0cl2xdf/1Vz5s24dyT2lJKTWB74HJEtnVc1ZNlhM+8V3Php2U8zo3/Gz0NzeVswSIUocnUEUKolGt4z23Xw=
X-Received: by 2002:a17:906:6a12:b0:9ad:df85:97ae with SMTP id
 qw18-20020a1709066a1200b009addf8597aemr1718455ejc.66.1699454760122; Wed, 08
 Nov 2023 06:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
In-Reply-To: <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 8 Nov 2023 22:45:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6ptOvm3oYW7fw+qd9QLsyaJnd2dbnO-KU5T9j3Grhd-A@mail.gmail.com>
Message-ID: <CAAhV-H6ptOvm3oYW7fw+qd9QLsyaJnd2dbnO-KU5T9j3Grhd-A@mail.gmail.com>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thomas,

On Wed, Nov 8, 2023 at 4:14=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi,
>
> thanks for the patch.
>
> Am 08.11.23 um 03:46 schrieb Huacai Chen:
> > After commit 60aebc9559492cea ("drivers/firmware: Move sysfb_init() fro=
m
> > device_initcall to subsys_initcall_sync") some Lenovo laptops get a bla=
nk
> > screen until the display manager starts.
> >
> > This regression occurs with such a Kconfig combination:
> > CONFIG_SYSFB=3Dy
> > CONFIG_SYSFB_SIMPLEFB=3Dy
> > CONFIG_DRM_SIMPLEDRM=3Dy
> > CONFIG_DRM_I915=3Dy      # Or other native drivers such as radeon, amdg=
pu
> >
> > If replace CONFIG_DRM_SIMPLEDRM with CONFIG_FB_SIMPLE (they use the sam=
e
> > device), there is no blank screen. The root cause is the initialization
> > order, and this order depends on the Makefile.
> >
> > FB_SIMPLE is before native DRM drivers (e.g. i915, radeon, amdgpu, and
> > so on), but DRM_SIMPLEDRM is after them. Thus, if we use FB_SIMPLE, I91=
5
> > will takeover FB_SIMPLE, then no problem; and if we use DRM_SIMPLEDRM,
> > DRM_SIMPLEDRM will try to takeover I915, but fails to work.
>
> But what exactly is the problem? From the lengthy discussion threat, it
> looks like you've stumbled across a long-known problem, where the
> firmware driver probes a device that has already been taken by a native
> driver. But that should not be possible.
Yes, it is a long-known problem but only exposed after commit
60aebc9559492cea ("drivers/firmware: Move sysfb_init() from
device_initcall to subsys_initcall_sync"), because the platform device
for simpledrm was not created as early as possible in old kernels.

>
> As you know, there's a platform device that represents the firmware
> framebuffer. The firmware drivers, such as simpledrm, bind to it. In
> i915 and the other native drivers we remove that platform device, so
> that simpledrm does not run.
>
> We call the DRM aperture helpers at [1]. It's implemented at [2]. The
> function contains a call to sysfb_disable(), [3] which should be invoked
> for the i915 device and remove the platform device.
Yes, this looks a little strange, which I haven't investigated before.
Jaak, could you please try to see whether sysfb_disable() is called in
bad kernels?

>
> [1]
> https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/i915/i915_dr=
iver.c#L489
> [2]
> https://elixir.bootlin.com/linux/v6.5/source/drivers/video/aperture.c#L34=
7
> [3]
> https://elixir.bootlin.com/linux/v6.5/source/drivers/firmware/sysfb.c#L63
>
> Can you investigate why this does not work? Is sysfb_disable() not being
> called? Does it remove the platform device?
>
> >
> > So we can move the "tiny" directory before native DRM drivers to solve
> > this problem.
>
> Relying on linking order is just as unreliable. The usual workaround is
> to build native drivers as modules. But first, please investigate where
> the current code fails.
Yes, native drivers are usually built as modules, but Jaak tries to
built-in, and then reports this bug. :)

Huacai

>
> Best regards
> Thomas
>
> >
> > Fixes: 60aebc9559492cea ("drivers/firmware: Move sysfb_init() from devi=
ce_initcall to subsys_initcall_sync")
> > Closes: https://lore.kernel.org/dri-devel/ZUnNi3q3yB3zZfTl@P70.localdom=
ain/T/#t
> > Reported-by: Jaak Ristioja <jaak@ristioja.ee>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   drivers/gpu/drm/Makefile | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 8e1bde059170..db0f3d3aff43 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -141,6 +141,7 @@ obj-y                     +=3D arm/
> >   obj-y                       +=3D display/
> >   obj-$(CONFIG_DRM_TTM)       +=3D ttm/
> >   obj-$(CONFIG_DRM_SCHED)     +=3D scheduler/
> > +obj-y                        +=3D tiny/
> >   obj-$(CONFIG_DRM_RADEON)+=3D radeon/
> >   obj-$(CONFIG_DRM_AMDGPU)+=3D amd/amdgpu/
> >   obj-$(CONFIG_DRM_AMDGPU)+=3D amd/amdxcp/
> > @@ -182,7 +183,6 @@ obj-$(CONFIG_DRM_FSL_DCU) +=3D fsl-dcu/
> >   obj-$(CONFIG_DRM_ETNAVIV) +=3D etnaviv/
> >   obj-y                       +=3D hisilicon/
> >   obj-y                       +=3D mxsfb/
> > -obj-y                        +=3D tiny/
> >   obj-$(CONFIG_DRM_PL111) +=3D pl111/
> >   obj-$(CONFIG_DRM_TVE200) +=3D tve200/
> >   obj-$(CONFIG_DRM_XEN) +=3D xen/
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
