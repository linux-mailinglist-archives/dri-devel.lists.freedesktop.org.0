Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15DEA73E4C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 20:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FF910E943;
	Thu, 27 Mar 2025 19:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0TwIh1fC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5E910E93E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 19:02:22 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-abf3d64849dso209401466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 12:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1743102141;
 x=1743706941; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t01uOc+dKD9m8pHt78XkgjVSzMgtIiWN6r92eFZcqFI=;
 b=0TwIh1fCHJuRBB4fH06mi3y6AV6toj1V4UKVdwAcOdRnL1EyWLy1fnSlp4YdA0I1F1
 eFGd8G7graaj/lvGvIF2d0fSys86KGtl8+gvVaJLGgof7meSVHUstLsOHO7e0+S4c/JJ
 EqE4TLjcT6B1bqumHgAyYdDK7yq22yPrbUZDT0FhaeZA980Xmc+ixwSMllfjApR/PVZ1
 /PU2xDr7XRA887su9CjvAjOvY6tPh4IcMvlbvPpDfVuUmRg1pI+9hnZk9+5zL3fmozf1
 Os37lzjJS/gjGuGt9bcG/PwX+QIqyYjUAWxLHSnl6niyNbpYr9PBMM9h4Z5DHpWBRWAN
 AsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743102141; x=1743706941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t01uOc+dKD9m8pHt78XkgjVSzMgtIiWN6r92eFZcqFI=;
 b=r/u9gq99P7Eh7/xeiLrwqBlIKPOknlHSKf3YgfNsex3pBoV6LHouO338TGCqusnvBE
 VEQD2ZGsFKpDvhN1oywimkgAHv5ve1pXfpiNDmif/uTJkSkLh8mQCpa7Lex8pBhqD9n/
 xNSJ1OWha1VeLy6OjiwRpDQajRSBWn+d0GnndHW2Plxtrfx6YdjBmEx0J9fLWKTqaWUv
 BC/1pXA1nwhxb9Q5A62PLlCpeLJm+xpHew+etBqNPGOLDrTTmG8bqNv1pLXc9zMAoXt/
 oZMlecq96qdIY5pZbZFXM6xVU0ZkaxCePf4gp29f3fyPvZg90X7wi1RZYylYhbSNVBjQ
 1+fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHu1x3Xm2U7bsGcmBVayNGawfbv8Apoq48l8GvDVW9oiD+hwkULYK+kwEcDYP+r+nXwCz9hbSn5x4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSwDJ5zFvm4nB9xdYBvITVxA7k8jpPNgWXkrNGmHysE7xvr9q/
 CIZt/gerLcc6f1MjILvPh6GklVNTApdbgPcsFHmOCmjBamp6Esy9IAoshejs5JmelbQoPsIGqWR
 PilZGFdwksRp5jl52QpsfkHjuSwLBO78HRd3ygw==
X-Gm-Gg: ASbGncumTFnOyDW6BVPOCXQA1UKctk+WyohjKd1n5BXpiU5rKaHOBqqQGCyF0WWcykI
 1Rldv6CJRSB1JFoR2y2PuFd27hFeTTNV88cy2k3X6HmJgqUnRUrYafln1/hurAhNXq4Z6tJ3kRP
 T70BMdwFgVo9m8yNtwjZR456V/qxcWqxIKDCfIXIEkd9TJiX3YGBCr1DcNfQ==
X-Google-Smtp-Source: AGHT+IFdAriu33TeMlfQtOemQZ156y3VpXNsrgytu4hyNzGPMxzNiqF61n78Yv6Jx/sursoj3lVdJ7K5H65m6DZ9YSU=
X-Received: by 2002:a17:907:9410:b0:ac2:cf0b:b806 with SMTP id
 a640c23a62f3a-ac6fb1bdeb6mr368891266b.56.1743102140953; Thu, 27 Mar 2025
 12:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-3-mhenning@darkrefraction.com>
 <Z9xfoS89yimS1Sb3@pollux>
 <CAAgWFh2RtCwaKNinX9X4BjwNiaBj5BF_ypzbqoqV4LJgN4cPvg@mail.gmail.com>
 <Z-VZlIc3E8ZQQmXa@cassiopeiae>
In-Reply-To: <Z-VZlIc3E8ZQQmXa@cassiopeiae>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 27 Mar 2025 15:01:54 -0400
X-Gm-Features: AQ5f1JrCSLT7wmMfX_bBZIXEHu0KcL2uFmLp74llm2T31nXsEw2JHxFsuNCAqvM
Message-ID: <CAAgWFh2F-MH_U1V6SY_Z3nWz0_meyvAcWjfUiEoXzpW697oi7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER
To: Danilo Krummrich <dakr@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, dri-devel@lists.freedesktop.org,
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

On Thu, Mar 27, 2025 at 9:58=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri, Mar 21, 2025 at 07:00:57PM -0400, M Henning wrote:
> > This is a pointer in the gpu's virtual address space. It must be
> > aligned according to ctxsw_align and be at least ctxsw_size bytes
> > (where those values come from the nouveau_abi16_ioctl_get_zcull_info
> > structure). I'll change the description to say that much.
> >
> > Yes, this is GEM-backed. I'm actually not entirely sure what the
> > requirements are here, since this part is reverse-engineered. I think
> > NOUVEAU_GEM_DOMAIN_VRAM and NOUVEAU_GEM_DOMAIN_GART are both okay. The
> > proprietary driver allocates this buffer using
> > NV_ESC_RM_VID_HEAP_CONTROL and sets attr =3D NVOS32_ATTR_LOCATION_ANY |
> > NVOS32_ATTR_PAGE_SIZE_BIG | NVOS32_ATTR_PHYSICALITY_CONTIGUOUS, attr2
> > =3D NVOS32_ATTR2_GPU_CACHEABLE_YES | NVOS32_ATTR2_ZBC_PREFER_NO_ZBC.
>
> (Please do not top post.)
>
> What I mean is how do you map the backing GEM into the GPU's virtual addr=
ess
> space? Since it's bound to a channel, I assume that it must be ensured it=
's
> properly mapped when work is pushed to the channel. Is it mapped through
> VM_BIND?

Yes. The userspace code for this is here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33861/diffs?commi=
t_id=3D0c4baab863730f9fc8b417834ffcbb400f11d617
It calls into the usual function for driver internal allocations
(nvkmd_dev_alloc_mem) which calls VM_BIND internally.

I don't understand: why is this line of questioning important?

> >
> > On Thu, Mar 20, 2025 at 2:34=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Wed, Mar 12, 2025 at 05:36:15PM -0400, Mel Henning wrote:
> > > > diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouv=
eau_drm.h
> > >
> > > Same here, please split the uAPI change in a separate commit.
> > >
> > > > index 33361784eb4e..e9638f4dd7e6 100644
> > > > --- a/include/uapi/drm/nouveau_drm.h
> > > > +++ b/include/uapi/drm/nouveau_drm.h
> > > > @@ -448,6 +448,20 @@ struct drm_nouveau_get_zcull_info {
> > > >       __u32 ctxsw_align;
> > > >  };
> > > >
> > > > +struct drm_nouveau_set_zcull_ctxsw_buffer {
> > > > +     /**
> > > > +      * @ptr: The virtual address for the buffer, or null to bind =
nothing
> > > > +      */
> > > > +     __u64 addr;
> > >
> > > What is this buffer? Is this a GEM object backed buffer? How is it ma=
pped?
> > >
> > > > +
> > > > +     /**
> > > > +      * @channel: the channel to set the buffer on
> > > > +      */
> > > > +     __u32 channel;
> > > > +
> > > > +     __u32 pad;
> > > > +};
> > > > +
> > > >  #define DRM_NOUVEAU_GETPARAM           0x00
> > > >  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
> > > >  #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
> > > > @@ -462,6 +476,7 @@ struct drm_nouveau_get_zcull_info {
> > > >  #define DRM_NOUVEAU_VM_BIND            0x11
> > > >  #define DRM_NOUVEAU_EXEC               0x12
> > > >  #define DRM_NOUVEAU_GET_ZCULL_INFO     0x13
> > > > +#define DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER 0x14
> > > >  #define DRM_NOUVEAU_GEM_NEW            0x40
> > > >  #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
> > > >  #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> > > > @@ -532,6 +547,7 @@ struct drm_nouveau_svm_bind {
> > > >  #define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_=
BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
> > > >
> > > >  #define DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO     DRM_IOR (DRM_COMMAND_=
BASE + DRM_NOUVEAU_GET_ZCULL_INFO, struct drm_nouveau_get_zcull_info)
> > > > +#define DRM_IOCTL_NOUVEAU_SET_ZCULL_CTXSW_BUFFER  DRM_IOW (DRM_COM=
MAND_BASE + DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER, struct drm_nouveau_set_zcul=
l_ctxsw_buffer)
> > > >  #if defined(__cplusplus)
> > > >  }
> > > >  #endif
> > > > --
> > > > 2.48.1
> > > >
