Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E192A26EE2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 10:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D418110E2B4;
	Tue,  4 Feb 2025 09:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hefdWeL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE4D10E2B4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738663161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wGv2FsoKufVcLbYy1/87/ZPdb2v6fo4T2VRc/m1Duk=;
 b=hefdWeL3EWD7nwa6+cS96ZK5loSQw6cBI+DaUHmbuuBYvAUoUAPp/ZgSPF87xSdYgv4c5r
 m+1X06hpc56uGd6VThIQWwupbe69ow+d43qYNck01XYqqjYLNjRE9b/esiRPkLqfC7r8QF
 WPqgmsHVd0ofQmPWtbsB7rQUOmRwCGc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-YvAyAEisMFaGelXs8EO7zw-1; Tue, 04 Feb 2025 04:59:20 -0500
X-MC-Unique: YvAyAEisMFaGelXs8EO7zw-1
X-Mimecast-MFC-AGG-ID: YvAyAEisMFaGelXs8EO7zw
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab6d5363a4bso687511366b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 01:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738663159; x=1739267959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8wGv2FsoKufVcLbYy1/87/ZPdb2v6fo4T2VRc/m1Duk=;
 b=kP3cT2NN3APW/juZciY4nlT9Ny/MESMxWQHbjgBmy0r9h1CxStr1Bj6ltIi+1bu7OF
 6g5gnWcCLQtnSq5BzhHkfeEBwtxzGkmGZNGD7YSbP4A3X2a5y/+lI9E4aHBOp+ghkbUI
 R2TEF1aNXYTyfS1sqXQF50Y3C3dg0gPRs1Q1yqHZraUN5vGElWQFrThoo/yjaPk0niyJ
 rbGyy+iPwFQhJ+okEhJGzhF8S2YaqT2ZRCjAGed8J3mYpvPfYPUo211VXns77BlaXQO3
 OdF0VGmKB4mu3XZE1kX9aEhv/by/j8j/eh5XJNmDHNG1+/t635FM7d97jD5MRqiiSX5u
 JCEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqMHm3hWFIYDWmOZ6vkgoh3Sh5O1RYdw3716Hc5MIwgwgKhH8xzZO5298Df6hrVoIW3vjidYEB+dg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpOs5Oktw/1FVGJsI+8hJ0EBShvistTny36xHc2Tpkudu6h2xw
 guayJN9V0xGwqMd6BmyEarbsAnJ68kBWBOa3otJ1tPp7vjReDqH3RVBjPLANB6VDdKoK4/EW0pm
 NMY1VJYA0JnyIbkfU2TYD+3CZUjuRbl2JR3v98PHgZlsIxu/kZUmQrYXFfxMcSlQ/hLKHKdrAlL
 5FA6FTQbMRm33jI6/G0yDnVUqqLmWTllSGCCWzzeZC
X-Gm-Gg: ASbGncv+vod5NItnUQgCH+HwXnNrch0AMco1qGabzwNWYzq/hRPpIC9SRypG1RqYNSC
 nljNpFgO9owfbCmwXw+gdgtmnBh5aBd9pHgAb+wMBFlShF6TzyLZS+qU0nzwTi7fQY/O2FhLxA0
 5WEci7N91iiEc1xZrO6g==
X-Received: by 2002:a17:907:6d26:b0:aac:4324:977e with SMTP id
 a640c23a62f3a-ab6cfd076admr3317237466b.27.1738663159052; 
 Tue, 04 Feb 2025 01:59:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXtRcEnuU6oA06Z0ReFSRWzAHGLOtGcVBMkSs7QVLQN14Wwp3N7kI/IyVUADKD48QX2iJ3nCKN8Er+Pj17+XI=
X-Received: by 2002:a17:907:6d26:b0:aac:4324:977e with SMTP id
 a640c23a62f3a-ab6cfd076admr3317235066b.27.1738663158657; Tue, 04 Feb 2025
 01:59:18 -0800 (PST)
MIME-Version: 1.0
References: <20250130090517.201356-1-ryasuoka@redhat.com>
 <75cf3adc-400e-44a6-b653-bee1f0cb43ec@collabora.com>
In-Reply-To: <75cf3adc-400e-44a6-b653-bee1f0cb43ec@collabora.com>
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
Date: Tue, 4 Feb 2025 18:59:07 +0900
X-Gm-Features: AWEUYZl1gCs8i_nghDi3JecpQ0sWd8PMYpAqhqfVffZeODkRQxTx-IAv0cYMK8k
Message-ID: <CAHpthZo=R=Csru2P8NVY8YKaasb2RTyrMYni-=8ri4K=xd8abA@mail.gmail.com>
Subject: Re: [PATCH v6] drm/virtio: Add drm_panic support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org, 
 olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, daniel@ffwll.ch, jfalempe@redhat.com, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HMLH0Iaq5jC8Ht50U03bJA-ccltLMkhTJbXM5GGpl60_1738663159
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

Hi,

On Mon, Feb 3, 2025 at 2:18=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Hi,
>
> On 1/30/25 12:05, Ryosuke Yasuoka wrote:
> ...
> > +static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
> > +                                      struct drm_scanout_buffer *sb)
> > +{
> > +     struct virtio_gpu_object *bo;
> > +
> > +     if (!plane->state || !plane->state->fb || !plane->state->visible)
> > +             return -ENODEV;
> > +
> > +     bo =3D gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
> > +     if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach)
> > +             return -ENODEV;
> > +
> > +     /* try to vmap it if possible */
> > +     if (!bo->base.vaddr) {
> > +             int ret;
> > +
> > +             ret =3D drm_gem_shmem_vmap(&bo->base, &sb->map[0]);
>
> drm_gem_shmem_vmap() requires BO resv to be locked, it also may invoke
> drm_gem_shmem_get_pages() that sleeps. This function can't be used in
> atomic context.
>
> For the starter, let's reject !bo->base.vaddr BOs. Normally, shmem FB
> BOs are always vmapped.

OK. I'll reject !bo->base.vaddr BO in the next patch. I think this panic
feature won't work when I call panic in GUI environment (I test in Gnome)
without vmap(). It is OK as the first version but I think I should mention
it somewhere. Where should I mention, in a commit message or in code like b=
elow?

~~~
static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
struct drm_scanout_buffer *sb)
{
struct virtio_gpu_object *bo;

if (!plane->state || !plane->state->fb || !plane->state->visible)
return -ENODEV;

bo =3D gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);

/* Only support mapped shmem bo */
if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach || !bo->base.vadd=
r)
return -ENODEV;
~~~

> --
> Best regards,
> Dmitry
>

Thank you for your comment.
Ryosuke

