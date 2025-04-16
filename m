Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76EA8B31A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 10:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DDA10E87F;
	Wed, 16 Apr 2025 08:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AVbVUICr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AE310E87F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 08:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744791388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YJf0uNGMARC6l3YgNJT5XK+qkS/6/zUZJDuy3jnfdM=;
 b=AVbVUICr8i034ZyGPo77fDc3cqwRPowjGuS7XZwAOJ3Y8mWC4RFYx7eBxOubjHQkVNnZz6
 6cvjUDcZQh1ATSIudKqOVh6awDH3T3bMW9Uuq40qY8yUnCh+AE9Znv0lViZ4rS1FNh9IW2
 OMchvEQQBq8lPLHmaySfheSff6UuTl4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-RkIcmm6kNTStwKpyruPS5g-1; Wed, 16 Apr 2025 04:16:26 -0400
X-MC-Unique: RkIcmm6kNTStwKpyruPS5g-1
X-Mimecast-MFC-AGG-ID: RkIcmm6kNTStwKpyruPS5g_1744791386
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ff62f96b10so480277a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 01:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744791385; x=1745396185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1YJf0uNGMARC6l3YgNJT5XK+qkS/6/zUZJDuy3jnfdM=;
 b=N1PiKfYZB3scKztwB/RJzU4dl4ypQuDUrQS+ocRyB3Al60N411mfjgKUDn961oq8aL
 MEX9/nYt8x51gF8+v4Zf3Tm3fzdpTKN4bFyprVCl5JYBatiyXJGN9E9qzl1uaWvyJSgT
 tZwQGVHWARGvDzCjEcFuoVtfaodE1CLKCyBSfgnzZEIQ1O3X6EiLeTKkxdQZczynpvE7
 WreL2cvhQZB7AYsyigvpmMyxuPwXbGOzA51Hp9M0QVPGv12D6IpgjiUBME/+/mrT4xez
 UZ40iHmwuh2McPq0YlKODf2qlEiq7W3Pf1ZvyB+kEQXit4HvUPxzSyPSIu3mRS6hoNos
 TyVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9RxXi6DCCAjPJB+wGBtux57w+fJ8LsLYmVT1HvJ4NxPllFLlnZeQv6jtNYf66lZ3JiI0/4mcVZIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9fImzobi0rJVS/QGdXJ1/VSNLef3MjvgZz1mbnBfbZIj/m0mv
 KWiu1JNEBlQl0G5e4058Tiovku6V913BUfu9c7Zavw9LyusREyQBsZciTNDzSuJ6ZJ3MlAn5uHj
 40SD5jogkingvqPPOESVQB0P4HrhgNpj09OGU4GuScUQBQQKV2Ww9EMxcUX+50tppLFumAINkA1
 GOFsSLRYvN7H9dSzgoh/ShZIyKDWBwc+E8v3JaqdVN
X-Gm-Gg: ASbGncs7G+mmB+/fUPPUsr59jOBjrR/c+5lw6Kmrq3DzstGWxXoAE+beg/hATnYROt4
 F9TxbxrckQj465zf9rWLABFW55JLrBhZkONN7CDSA7ZKnuiaR1gKG5X1EbQz5BtZbyfdo10MrgI
 uAuXzXgsRWDuy+oHKn2dmL2LIu
X-Received: by 2002:a17:90b:51cf:b0:2fb:fe21:4841 with SMTP id
 98e67ed59e1d1-30864292d23mr1402235a91.8.1744791385682; 
 Wed, 16 Apr 2025 01:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzrUSVYztyhmSnVvzEX9NlBIbpp4wsLgkVASOIWRxXnBWQ/ej/hqFPgo7RNSvfvdKL9orQuHap7MNTBS1D2Mo=
X-Received: by 2002:a17:90b:51cf:b0:2fb:fe21:4841 with SMTP id
 98e67ed59e1d1-30864292d23mr1402204a91.8.1744791385351; Wed, 16 Apr 2025
 01:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250412132012.291837-1-ryasuoka@redhat.com>
 <d36c2ba7-52b6-4688-bb2b-70b8bd4d33c0@collabora.com>
In-Reply-To: <d36c2ba7-52b6-4688-bb2b-70b8bd4d33c0@collabora.com>
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
Date: Wed, 16 Apr 2025 17:16:12 +0900
X-Gm-Features: ATxdqUGT9jMuGYtdwMyQrqqaRquKvFEmvpodZfFuXApiY_oe8OnZKvOncC1PQXc
Message-ID: <CAHpthZqOQZuQHbTCPH4ON6bRLRkd0X8ttTnwm8Nonrg=mvsmLw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Support drm_panic with non-vmapped shmem BO
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, tzimmermann@suse.de
Cc: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org, 
 olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 simona@ffwll.ch, jfalempe@redhat.com, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vYQcqkqy5VGihaq0xZe5Mb1UizLVl85atZSDMvzo-VE_1744791386
X-Mimecast-Originator: redhat.com
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

On Wed, Apr 16, 2025 at 4:29=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 4/12/25 16:20, Ryosuke Yasuoka wrote:
> > Pass array of pages of the scanout buffer [1] to shmem BO, allowing
> > drm_panic to work even if the BO is not vmapped.
> >
> > [1] https://lore.kernel.org/all/20250407140138.162383-3-jfalempe@redhat=
.com/
> >
> > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_plane.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/v=
irtio/virtgpu_plane.c
> > index a6f5a78f436a..2ff57d559c86 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> > @@ -500,11 +500,19 @@ static int virtio_drm_get_scanout_buffer(struct d=
rm_plane *plane,
> >
> >       bo =3D gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
> >
> > -     /* Only support mapped shmem bo */
> > -     if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach || !bo-=
>base.vaddr)
> > +     if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach)
> >               return -ENODEV;
> >
> > -     iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
> > +     if (bo->base.vaddr)
> > +             iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
> > +     else {
> > +             struct drm_gem_shmem_object *shmem =3D &bo->base;
> > +
> > +             if (!shmem->pages)
> > +                     return -ENODEV;
> > +             /* map scanout buffer later */
> > +             sb->pages =3D shmem->pages;
> > +     }
> >
> >       sb->format =3D plane->state->fb->format;
> >       sb->height =3D plane->state->fb->height;
> >
> > base-commit: e7bb7d44c3b97aea1f0e354c6499900154ac67f2
>
> Rebased on top of [1], fixed checkpatch warning about braces and applied
> to misc-next. Thanks!
>
> [1] https://lore.kernel.org/all/20250414131507.566072-1-tzimmermann@suse.=
de/

Thomas,
Thank you for your comment.

Dmitry,
Thank you for fixing it and applying my patch.

> --
> Best regards,
> Dmitry
>

Best regards,
Ryosuke

