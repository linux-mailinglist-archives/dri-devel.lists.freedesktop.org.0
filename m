Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F1B26A53
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 17:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A9210E8A1;
	Thu, 14 Aug 2025 15:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="N2l/BSJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7071910E8A1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 15:02:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b9e4193083so897843f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755183724; x=1755788524;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TcuRZv2dxfNNVAgPVxq0ce4wCvWQ90BLeB/gbg8f4Hw=;
 b=N2l/BSJKyIgxnnpS3+LnvP7UfczzOwRsaC2C2YYpMwtLor4Hi7EZ+Nww5ZmHXtG2ic
 Q27GnDx5svnAd1NKw4Dx98WlAGvkCwxAPfYfccBwyE1JCkZ+4OD36fLt08IPX1E6fLqP
 ymWCvFi9ZGHXQSb5rnf1X9Pzh8F6CAa4exxJLUgDV2mp+AP0+9NvF4E+jzFvoHTF72zK
 G56xFoheL5gPqqlvWQjl+IYMgE2PgCfADH59BHKAkVns4abJHdgypxZCREcsVNP7YA5O
 sEP8VKVtWTWkOkoJHGEfesD5YeSZRC8JVIxdYgc4iIGed4VnVo8OTYBNQwBx/qWkKz1H
 uZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755183724; x=1755788524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TcuRZv2dxfNNVAgPVxq0ce4wCvWQ90BLeB/gbg8f4Hw=;
 b=ChSMwLGHPnl02UM6Pvw99S31Yh08cQEsndqt7recZXJ0REJb/CC3S1kl024WSBet0I
 rKN3JC25Foof0RsSdUv2m2cG7UdbgccJFWFbc8nVoxP769yXWnAr1bwwv9ZRFOQ/W5n1
 y27jdardWitJLuC0+eDu8m2L6ytxITUzFiVXLP0pdONwsktMSoIQVTadnxmRYIWvU91k
 S4MResQPdReM5uD+aMHjjcDhw8GmbsVr67KaFl8RQsxhjd1aCMPfyM0P+8kr9YsDZe6H
 mhOmy+r/66thFK5hQYJroYsqTFGPAte5AV6AbTv6fa/geuWuORP2i82qOjjFDgdzQk9M
 bSTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs1G2hTwoBmMisu93n6ANoPRPj0enr05M3KES7VeU0RAsCfpljHDj3rIE3XIIairW/0Ev2zGDF7kA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeNWz2ieAo95fjI3KjnmzBCvSOwahTsYv8Bpf+Dj41/xSVL941
 a8/et+8AwUlzsggY1hNwHHAgpg24XGF2FEUz0m/Q3jriPo7bPMR6930G3f0rrwX68U0sjWLI5qo
 4BNgYA9KqnYa31SHfxbMwpCqfEfOJPCFdok9IcaX/
X-Gm-Gg: ASbGncvcCg9C5pbU0nWCsyfuaVMVpNQLHyLaYutqQMfoe0HRNi5G1K7v3iFt+9uCi2O
 tnTdFKoPZXzARfkgkRCng21mNMDRWouz8kO79X21hBoi0uFhPG4EnuOs9oXdBx7tNF+rb/wEYvZ
 seahtqhr54bb0uEhTHSuqZSfLTgv/udVLnlhp25Q+eswpBNjMpHnOcuZ2dIoDO4qhdHvrP0BI2P
 lMv1knxPJmX/1aroxpCrQbkyA==
X-Google-Smtp-Source: AGHT+IE7EXoosHtxV7R65IJYN3Plv7OfZd1tC3+cfWluvO9mZ6grkYNTfqzMOOGzvX51YBZIfQCmGDddptSMYzWYiIo=
X-Received: by 2002:a05:6000:2c0f:b0:3ab:27f9:e51 with SMTP id
 ffacd0b85a97d-3b9edf2dee3mr2863105f8f.31.1755183723260; Thu, 14 Aug 2025
 08:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com>
 <20250814-gpuva-mutex-in-gem-v1-1-e202cbfe6d77@google.com>
 <DC28NIMIPF5I.2P17OZFA06GXL@kernel.org>
In-Reply-To: <DC28NIMIPF5I.2P17OZFA06GXL@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 14 Aug 2025 17:01:50 +0200
X-Gm-Features: Ac12FXzjZb-o6IiSoOWAEBNWjMzAt4oFDe3uthj89CFgBZYwNtbe7anUeIl0O0E
Message-ID: <CAH5fLgiYqQA-jcz=S_u8EjHkpr65m6nU9DHRkRWs3js8v3Uadg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm_gem: add mutex to drm_gem_object.gpuva
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Thu, Aug 14, 2025 at 4:59=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu Aug 14, 2025 at 3:53 PM CEST, Alice Ryhl wrote:
> > There are two main ways that GPUVM might be used:
> >
> > * staged mode, where VM_BIND ioctls update the GPUVM immediately so tha=
t
> >   the GPUVM reflects the state of the VM *including* staged changes tha=
t
> >   are not yet applied to the GPU's virtual address space.
> > * immediate mode, where the GPUVM state is updated during run_job(),
> >   i.e., in the DMA fence signalling critical path, to ensure that the
> >   GPUVM and the GPU's virtual address space has the same state at all
> >   times.
> >
> > Currently, only Panthor uses GPUVM in immediate mode, but the Rust
> > drivers Tyr and Nova will also use GPUVM in immediate mode, so it is
> > worth to support both staged and immediate mode well in GPUVM. To use
> > immediate mode, the GEMs gpuva list must be modified during the fence
> > signalling path, which means that it must be protected by a lock that i=
s
> > fence signalling safe.
> >
> > For this reason, a mutex is added to struct drm_gem_object that is
> > intended to achieve this purpose. Adding it directly in the GEM object
> > both makes it easier to use GPUVM in immediate mode, but also makes it
> > possible to take the gpuva lock from core drm code.
> >
> > As a follow-up, another change that should probably be made to support
> > immediate mode is a mechanism to postpone cleanup of vm_bo objects, as
> > dropping a vm_bo object in the fence signalling path is problematic for
> > two reasons:
> >
> > * When using DRM_GPUVM_RESV_PROTECTED, you cannot remove the vm_bo from
> >   the extobj/evicted lists during the fence signalling path.
> > * Dropping a vm_bo could lead to the GEM object getting destroyed.
> >   The requirement that GEM object cleanup is fence signalling safe is
> >   dubious and likely to be violated in practice.
> >
> > Panthor already has its own custom implementation of postponing vm_bo
> > cleanup.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  drivers/gpu/drm/drm_gem.c | 2 ++
> >  include/drm/drm_gem.h     | 4 +++-
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 6a44351e58b7741c358406c8a576b6660b5ca904..24c109ab3fadd5af2e5d9de=
3fe330b105217a9ce 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -187,6 +187,7 @@ void drm_gem_private_object_init(struct drm_device =
*dev,
> >       kref_init(&obj->refcount);
> >       obj->handle_count =3D 0;
> >       obj->size =3D size;
> > +     mutex_init(&obj->gpuva.lock);
> >       dma_resv_init(&obj->_resv);
> >       if (!obj->resv)
> >               obj->resv =3D &obj->_resv;
> > @@ -1057,6 +1058,7 @@ drm_gem_object_free(struct kref *kref)
> >       if (WARN_ON(!obj->funcs->free))
> >               return;
> >
> > +     mutex_destroy(&obj->gpuva.lock);
> >       obj->funcs->free(obj);
>
> I really can't think of a valid case where we need to access this mutex f=
rom the
> GEM's free() callback, yet it probably doesn't hurt to mention it in the
> documentation of struct drm_gem_object_funcs.

I had wanted to move it below free(), but we can't do that since
free() also performs the kfree() call.

> >  }
> >  EXPORT_SYMBOL(drm_gem_object_free);
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index d3a7b43e2c637b164eba5af7cc2fc8ef09d4f0a4..5934d8dc267a65aaf62d2d0=
25869221cd110b325 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -403,11 +403,13 @@ struct drm_gem_object {
> >        * Provides the list of GPU VAs attached to this GEM object.
> >        *
> >        * Drivers should lock list accesses with the GEMs &dma_resv lock
> > -      * (&drm_gem_object.resv) or a custom lock if one is provided.
> > +      * (&drm_gem_object.resv) or a custom lock if one is provided. Th=
e
> > +      * mutex inside this struct may be used as the custom lock.
> >        */
> >       struct {
> >               struct list_head list;
> >
> > +             struct mutex lock;
> >  #ifdef CONFIG_LOCKDEP
> >               struct lockdep_map *lock_dep_map;
> >  #endif
>
> We should remove this and the corresponding functions (i.e.
> drm_gem_gpuva_set_lock(), drm_gem_gpuva_assert_lock_held()) in a subseque=
nt
> patch and let GPUVM assert for this mutex directly rather than for the
> lockdep_map.

Agreed.

Alice
