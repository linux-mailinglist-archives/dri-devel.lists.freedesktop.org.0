Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44B4A33143
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 22:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14BA10E0E4;
	Wed, 12 Feb 2025 21:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GaVmb1Qm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07F110E0E4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 21:07:22 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3cf880d90bdso339395ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 13:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739394442; x=1739999242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7m2BC0PlpLZ3PvBNk1lJNnbfheS8gB4DKKdxAHYzcP4=;
 b=GaVmb1Qmn3IQ6i0xAQG7GIgqSBc6pGadZeG4ZnOrH/758txBLPspPlFSmInu1AvuVv
 NminF8BSLYgZXOEDrRG44lT61Fg0IN3ilS0bAgFlPXxQw9HvhSFGbjqt5+W7E2NGueTk
 GMLeOo/ZwxakPavbfxUsdYJdr65rDV6PGWbrJXoBVoU4TT4HW8nep432WdtvANBVFKPS
 s/oIi2KlrSitQOAYF+GNMg+Z5Gbh1QK4UqTeqSad1JuhrrrM5xCtzSSL6J8NtrTCm7pC
 Gi3+ogCxqr4GX2fZe2OO/33+ton1LvP0h9AyEKhbClVqe4fh5YIm3Rczq8UQBGdyAgDi
 KjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739394442; x=1739999242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7m2BC0PlpLZ3PvBNk1lJNnbfheS8gB4DKKdxAHYzcP4=;
 b=RU+UL4m0KuC0t+bnKRnsHD0zL+Vk19WcjtoxuNsIyCS1RO6bHYcEQKyuOsfjn4A04b
 /SwVqkJyRFAByLN87YZPdZsrHzKeDcG7KeBFnglaUPSBGT2Ja6zbqOcG3Pbj/y5jokgY
 CDEpkh8cnfLbrCf5lS9uCgkBIiKMlzXF54c3LqwFlyJY3psB3izi3j9VF8IcOLiPrZa8
 AmYvbq2AJ5R57jaxu6YvpTnTwjuG0r0poKxuqQ3zvt45S/NcauVjEvKFcotkN6GdPVj4
 Y9Akw5AJST3cVaiJXmQAZSpFwBp4/qz/VFPK8ongOpo5LL528u7RPaDeJOnGFekgsw6f
 6xyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXWHFqCKi9YdLfKTXOCb8JHs+dSkuZMImIU1UZ5rmKGwiu8+O4O72X0EhIP+jtfjJucait+wlriR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywq0QWx3yjanO/7bDR4BQdiiZEABHq1qbO+O+DZdBA6TQUjn4oj
 seJ/hl6MWYgb3JmRlY1TVun5y8jTm7cwmxxkfDjjTTbLv8NCm7FENhpHeJStU+n9JCzI3wjQtvj
 kDiN/Qo5UQ6tg56mQEpfMNMhVq0M=
X-Gm-Gg: ASbGncvr8RNe225FYZ4fqRE41zBL/nnc+mhwsl/j5PJGP7RukVW3duM8pvti54xbU04
 T3bTaPi+94qUaphKVcG0XJ63YUZsns87jHhotFbg575nSGNn3PP0CgHuA/pGS079bkwkUw/WNh7
 dn6eDyVb8jLMPsgXJz0Y1FvV/QnHE=
X-Google-Smtp-Source: AGHT+IEto3QwYzrpOOb39TT9wusT7oiYBviqDLiw7Xnxk0Go+s385w1whVmNsbgrd9myoMThLMp+uZwQjNnH/c18b1A=
X-Received: by 2002:a05:6e02:338a:b0:3d0:4a82:3f40 with SMTP id
 e9e14a558f8ab-3d17be2216fmr45576995ab.7.1739394441825; Wed, 12 Feb 2025
 13:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20250124-virtgpu-mixed-page-size-v1-1-480403790bac@gmail.com>
 <a55eecdc-76cc-432e-a4b3-90e8753088ac@collabora.com>
In-Reply-To: <a55eecdc-76cc-432e-a4b3-90e8753088ac@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Feb 2025 13:07:10 -0800
X-Gm-Features: AWEUYZlK-LtIBTV8i2bVwjobA09sMmKqOYCs2aSwHvvwvdiGzeqpfq-QqFvpdEU
Message-ID: <CAF6AEGuGWNj7dcC4DouWckaP9fOKgLyqw8iPBwKxrnr9GYXpPg@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/virtio: Align host mapping request to maximum
 platform page size
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: fnkl.kernel@gmail.com, David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Sergio Lopez <slp@redhat.com>,
 dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Rob Clark <robdclark@chromium.org>
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

On Fri, Jan 24, 2025 at 2:52=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 1/25/25 01:01, Sasha Finkelstein via B4 Relay wrote:
> > From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> >
> > This allows running different page sizes between host and guest on
> > platforms that support mixed page sizes.
> >
> > Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_vram.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/vi=
rtio/virtgpu_vram.c
> > index 25df81c027837c248a746e41856b5aa7e216b8d5..8a0577c2170ec9c12cad12b=
e57f9a41c14f04660 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_vram.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
> > @@ -138,6 +138,12 @@ bool virtio_gpu_is_vram(struct virtio_gpu_object *=
bo)
> >       return bo->base.base.funcs =3D=3D &virtio_gpu_vram_funcs;
> >  }
> >
> > +#if defined(__powerpc64__) || defined(__aarch64__) || defined(__mips__=
) || defined(__loongarch__)
> > +#define MAX_PAGE_SIZE 65536
>
> #define MAX_PAGE_SIZE SZ_64K
>
> for improved readability
>
> > +#else
> > +#define MAX_PAGE_SIZE PAGE_SIZE
> > +#endif
> > +
> >  static int virtio_gpu_vram_map(struct virtio_gpu_object *bo)
> >  {
> >       int ret;
> > @@ -150,8 +156,8 @@ static int virtio_gpu_vram_map(struct virtio_gpu_ob=
ject *bo)
> >               return -EINVAL;
> >
> >       spin_lock(&vgdev->host_visible_lock);
> > -     ret =3D drm_mm_insert_node(&vgdev->host_visible_mm, &vram->vram_n=
ode,
> > -                              bo->base.base.size);
> > +     ret =3D drm_mm_insert_node_generic(&vgdev->host_visible_mm, &vram=
->vram_node,
> > +                                      bo->base.base.size, MAX_PAGE_SIZ=
E, 0, 0);
>
> This change only reserves extra space in the memory allocator, but
> doesn't change actual size of allocated BO. Instead, you likely need to
> replace all ALIGN(size, PAGE_SIZE) occurrences in the driver code with
> ALIGN(args->size, MAX_PAGE_SIZE)
>
> >       spin_unlock(&vgdev->host_visible_lock);
> >
> >       if (ret)
>
> Note, previously a new virtio-gpu parameter was proposed to expose
> host's page size to guest [1], if you haven't seen it.
>
> [1] https://lore.kernel.org/dri-devel/20240723114914.53677-1-slp@redhat.c=
om/
>
> Aligning GEM's size to 64K indeed could be a good enough immediate
> solution. Don't see any obvious problems with that, other than the
> potential size overhead for a small BOs.
>
> We have been running into cases where a DXVK game allocates enormous
> amounts of small BOs to the point that amount reaches max number of
> mappings on QEMU with amdgpu native context. On the other hand, it
> showed that adding internal sub-allocator to RADV might be a worthwhile
> effort. We won't change alignment on x86 with this patch and on non-x86
> likely the increased size won't be noticeable, hence the proposed change
> might be acceptable.
>
> Curious what Rob Clark thinks about it. Rob, WDYT?

I think userspace needs to know the minimum "gpu" page size (ie. the
host page size) for other reasons, such as sparse binding.  As Sergio
proposes, we should add this to the virtgpu protocol

BR,
-R


>
> --
> Best regards,
> Dmitry
>
