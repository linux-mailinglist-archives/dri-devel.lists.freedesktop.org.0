Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08875BE935F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 16:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10E210EC42;
	Fri, 17 Oct 2025 14:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="fKwyg7Xy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAF210EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 14:33:06 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-28e7cd6dbc0so24057715ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 07:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1760711586; x=1761316386;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2Nr786zhxlmvY/x0JO+gbNQDCCCASPcyb/5bd0X6kI=;
 b=fKwyg7Xy1PtggSpA5Hy+BM4QoWB8M+FKalNGJimsU6P6ImhH26OfotUA2FX2Is7QEe
 yCLxOG99vjNvX6+pBgwhnO2gKvyzj8VdUjsMhchQUUtT5B6txjIsoIocHaCN3boAXKy6
 /R7MjMDRBc9h+k5vdxa9YUlgMiVqve29a/R4JYDoiFp3EmPgZG7oDMbYritc2OnRWlSf
 gueGLZtnIez6xzALwy8E1ffl3DTGd68l34vQJyWccDdb8koOOxMraLXJC4uK6lqbnLom
 MNzxERL2pmAJ1Qexx1J2gosbibvBGsKieHJ7HJNwIBitcx0z19BTo0fN05jP02Lze5dN
 ZfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760711586; x=1761316386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W2Nr786zhxlmvY/x0JO+gbNQDCCCASPcyb/5bd0X6kI=;
 b=V4UBEcFsH6FO3GHzcw2z0EccVZSiPKOXMP4N/+e5mjtsxPNDz7t1i5JNq0m++sSuuj
 +/0T/IQq4FqgEc8qtt/i19s0Xvm5chtdgy1Z5r69R3eBOaJGIAyJyVoiyIaHDBdzvVfp
 kQ9wy1KCuJDbfeyYovteu7JD0N5CL15jlHlTq1EhNRO+wQ/wv4+Ge1g7Qd5tRkjXXQje
 UnElr0Ipwae7LkOM/yroUKsN4wWrm/I6ssr643KXl/XQTrJpqshosofg/tUzN5Yjjev1
 PREE7x/lpIYcCrzCYWlSSueAoeQB2pkEv4gIWq58mBamsR+TJuBhL+QYnOU4Fk65AZ7N
 GbrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWle6lENflHvMuCwHLRnKSk9QW0DmWZyarBOCXvmh2q9s5Uj79CdYtmkeHk8dmDnecUgszLV6zwstE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwYfvCgfdk4dThdiHFw3IliTpBslWv3GAeP75EPpkjKRCJV01k
 RPjIfQeu9GF7NeuRr3z08NGEF0hRVqbIpNd+U/UYJhStuJYrowJF6FnQ1bPxnktz1udA4JsaaCm
 AqcN3oSs4UBOO3vwdyqRxLHJ9hTFYespse3auiIrJxA==
X-Gm-Gg: ASbGnctatPka4EtJJKyjmoUWCIDSNVjOOh7n+4Gaq1TAd62MQp1XoBqbdqCas0UbpdA
 dRqXX9q4R7fgXUyqF0GkjfBWa9v6dYnhIRpC/QXrV7zUV+Saro7CRPQePRLvDjR3RneAkvEMwJG
 RP+Bo3sf90C4hwt+KX+zmB/txWqCvo7TZsgRjflAIluZcqVSJo3BX/emDILrzs/PLtHstC+/jG8
 2d5dNx5c0VmOZAivebUpoO1SIAToOsZ+mT7eQE0T7Jjk2tMp5jlsbPFJrnlxeYONsBviQGIlINc
 xDZ1fNk=
X-Google-Smtp-Source: AGHT+IH+mIYXbC2jYxrIMo/eLZEPL3Q1l2b0mu0ulGobGlaTtrWJAUE7VyXRMOAqBcBvcYhCIzWo2mDEiV0Oz7TGpl8=
X-Received: by 2002:a17:902:d4c4:b0:269:9ae5:26af with SMTP id
 d9443c01a7336-290c9d1b4d0mr50219075ad.13.1760711585681; Fri, 17 Oct 2025
 07:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
In-Reply-To: <20251015160326.3657287-3-boris.brezillon@collabora.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 17 Oct 2025 10:32:53 -0400
X-Gm-Features: AS18NWAki7SVHg1rtuG0gWfE1rLJ3eILwz-at_pcmXliFBWuI-SMbQrZ33k2KHk
Message-ID: <CAOFGe96trw17pWKv4-Bbh9bvCz8ANTwAcL-croQQw24800fLbQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync() and
 a drm_gem_sync() helper
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
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

On Wed, Oct 15, 2025 at 12:04=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Prepare things for standardizing synchronization around CPU accesses
> of GEM buffers. This will be used to provide default
> drm_gem_dmabuf_{begin,end}_cpu_access() implementations, and provide
> a way for drivers to add their own ioctls to synchronize CPU
> writes/reads when they can't do it directly from userland.
>
> v2:
> - New commit
>
> v3:
> - No changes
>
> v4:
> - Add Steve's R-b
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 10 +++++++++
>  include/drm/drm_gem.h     | 45 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index a1a9c828938b..a1431e4f2404 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1333,6 +1333,16 @@ void drm_gem_vunmap(struct drm_gem_object *obj, st=
ruct iosys_map *map)
>  }
>  EXPORT_SYMBOL(drm_gem_vunmap);
>
> +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t size,
> +                enum drm_gem_object_access_flags access)
> +{
> +       if (obj->funcs->sync)
> +               return obj->funcs->sync(obj, offset, size, access);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_gem_sync);
> +
>  /**
>   * drm_gem_lock_reservations - Sets up the ww context and acquires
>   * the lock on an array of GEM objects.
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 8d48d2af2649..1c33e59ab305 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -66,6 +66,33 @@ enum drm_gem_object_status {
>         DRM_GEM_OBJECT_ACTIVE    =3D BIT(2),
>  };
>
> +/**
> + * enum drm_gem_object_status - bitmask describing GEM access types to p=
repare for
> + */
> +enum drm_gem_object_access_flags {
> +       /** @DRM_GEM_OBJECT_CPU_ACCESS: Prepare for a CPU access. */
> +       DRM_GEM_OBJECT_CPU_ACCESS =3D 0,
> +
> +       /** @DRM_GEM_OBJECT_DEV_ACCESS: Prepare for a device access. */
> +       DRM_GEM_OBJECT_DEV_ACCESS =3D BIT(0),
> +
> +       /** @DRM_GEM_OBJECT_ACCESSOR_MASK: Mask used to check the entity =
doing the access. */
> +       DRM_GEM_OBJECT_ACCESSOR_MASK =3D BIT(0),
> +
> +       /** @DRM_GEM_OBJECT_READ_ACCESS: Prepare for read-only accesses. =
*/
> +       DRM_GEM_OBJECT_READ_ACCESS =3D BIT(1),
> +
> +       /** @DRM_GEM_OBJECT_WRITE_ACCESS: Prepare for write-only accesses=
. */
> +       DRM_GEM_OBJECT_WRITE_ACCESS =3D BIT(2),
> +
> +       /** @DRM_GEM_OBJECT_RW_ACCESS: Prepare for a read/write accesses.=
 */
> +       DRM_GEM_OBJECT_RW_ACCESS =3D DRM_GEM_OBJECT_READ_ACCESS |
> +                                  DRM_GEM_OBJECT_WRITE_ACCESS,
> +
> +       /** @DRM_GEM_OBJECT_ACCESS_TYPE_MASK: Mask used to check the acce=
ss type. */
> +       DRM_GEM_OBJECT_ACCESS_TYPE_MASK =3D DRM_GEM_OBJECT_RW_ACCESS,
> +};
> +
>  /**
>   * struct drm_gem_object_funcs - GEM object functions
>   */
> @@ -191,6 +218,21 @@ struct drm_gem_object_funcs {
>          */
>         int (*mmap)(struct drm_gem_object *obj, struct vm_area_struct *vm=
a);
>
> +       /**
> +        * @sync:
> +        *
> +        * Prepare for CPU/device access. This can involve migration of
> +        * a buffer to the system-RAM/VRAM, or for UMA, flushing/invalida=
ting
> +        * the CPU caches. The range can be used to optimize the synchron=
ization
> +        * when possible.

This has gone in a very different direction from the version I sent
out and the added generality makes me really nervous. The idea of sync
involving migration and that the range is a mere hint are antithetical
with Vulkan. It's a very GLish design that assumes that a BO is
exclusively used by one of the CPU or the GPU at the same time. This
simply isn't the case in modern APIs. Older DRM uAPIs (as well as
dma-buf itself) are littered with such ioctls and we're in the process
of deleting them all.

If the BO needs to be migrated in order to be accessed from the CPU,
that needs to happen on map, not on some sort of begin/end. Or better
yet, just disallow mapping such buffers. Once the client has a map,
they are free to access from the CPU while stuff is running on the
GPU. They have to be careful, of course, not to cause data races, but
accessing the same BO from the CPU and GPU or even the same range is
totally okay if you aren't racing.

As a corollary, just don't map PRIME buffers.

And the range really shouldn't be just a hint. With Vulkan, clients
are regularly sub-allocating from larger memory objects. If they ask
to flush 64B and end up flushing 64M, that's pretty bad.

All we need is something which lets us trap through to the kernel for
CPU cache management. That's all we need and that's really all it
should do.

~Faith

> +        *
> +        * Returns 0 on success, -errno otherwise.
> +        *
> +        * This callback is optional.
> +        */
> +       int (*sync)(struct drm_gem_object *obj, size_t offset, size_t siz=
e,
> +                   enum drm_gem_object_access_flags access);
> +
>         /**
>          * @evict:
>          *
> @@ -559,6 +601,9 @@ void drm_gem_unlock(struct drm_gem_object *obj);
>  int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>  void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>
> +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t size,
> +                enum drm_gem_object_access_flags access);
> +
>  int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handle=
s,
>                            int count, struct drm_gem_object ***objs_out);
>  struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 =
handle);
> --
> 2.51.0
>
