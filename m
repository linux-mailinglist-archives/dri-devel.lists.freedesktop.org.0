Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C25B50E18
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 08:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D2210E2BE;
	Wed, 10 Sep 2025 06:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EC47QXu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0347810E2BE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 06:39:48 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b046fc9f28bso554960666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757486387; x=1758091187;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=0ZgO5jwANFMehJfMoLYUsZTxd5NY3ndlOci6BOUflzQ=;
 b=EC47QXu+iOG9xNrgcsjw1q71KsW9YzODExIqIelNkBp3TXp/0rF24T6WcJjK8rHUHy
 g0ywvtRZeRMCzreUzfSSTu1CuL+ffbT3JYaI1Ku0Tk9oziwyBAAidgZ95Q2iSzfkIlZz
 92j17HqkGg0vR/OoAz3VJwOfSKFZekR2wipoFbJDm8E+4bP2kI24Ih1hS+OVCHEuKSna
 u1RE9ZaneetILV8lne3W+j/jigNQoHM8VJj2/gijmycD4s+TFvp1LfrkrqdqzCplheWp
 a1mZDbPxIQo0eJrV4bDqff00iMyPJmtnPCV53YngkvAh0NvN9PFmFxm90HGNg14LS3Jh
 7M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757486387; x=1758091187;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0ZgO5jwANFMehJfMoLYUsZTxd5NY3ndlOci6BOUflzQ=;
 b=mtpo1MXzne2IwDvzBEwYz/KZIaKCR9UirRkvNMEwpHmWs3gKr0Jqc48W3TRUYQ09rq
 78gsy/GFheFVtdnqUB8ZQitNVmjIjx7r7IZdpxrvuaD/91VgEslMU4yz+zzBDzIVX6x5
 0vRG/tia6IgwrI9jooZYabMTuTk8LIrt4WgwgUTNwz2XKYU7Yy4EJH22nmkxTsdc4zv0
 Lp5NUuVlqRaV+BRbnIXNLx2xd101tEpVjPJKI81yO55l0Hux9qRJCpLLpk+VYIUlOOKu
 tqZeedapLqIYb3SC6rQwwF7fMWlWpS0x2XT+hdn4USEiyT/Ptr1DdDVHHYZMcRGdxS2e
 jAzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYBlyQFIHV1YSuLw0TV5hAGpEn6vbN7ye+dJ1H6loWtrDPycrkdFSIHgNWEfaPIVVtuwoex5kQ5mA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRv5Ed3KSqkwmG84M/M4fUASXYrKLgn/VATa11DCqXeVq5E8sx
 4tvcxLUbZZhcL2VysXoKYxZ5HEibd1UXdXsU/C6tMROj9LEksESE3CK2c5yLB4D47iwLFyGjyfj
 bgRDwP7XRpY5Pr9pX7w==
X-Google-Smtp-Source: AGHT+IF290sfWDJWyXR0CbzZnHAG1Yyq7SWKBAx8oPF32kqB1mi5kcbwO1hzeAGXP44801EWVIisUmt4Rpwov5g=
X-Received: from edh22.prod.google.com ([2002:a05:6402:5056:b0:62b:f094:4936])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f2a:b0:b04:9d90:a7e6 with SMTP id
 a640c23a62f3a-b04b1741ac2mr1432308366b.55.1757486387560; 
 Tue, 09 Sep 2025 23:39:47 -0700 (PDT)
Date: Wed, 10 Sep 2025 06:39:46 +0000
In-Reply-To: <c7a7aac3e82fde7a20970e6a65d200ab79804b0f.camel@linux.intel.com>
Mime-Version: 1.0
References: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
 <20250909-vmbo-defer-v2-1-9835d7349089@google.com>
 <c7a7aac3e82fde7a20970e6a65d200ab79804b0f.camel@linux.intel.com>
Message-ID: <aMEdMg_3ljC27i1-@google.com>
Subject: Re: [PATCH v2 1/2] drm/gpuvm: add deferred vm_bo cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Tue, Sep 09, 2025 at 04:20:32PM +0200, Thomas Hellstr=C3=B6m wrote:
> On Tue, 2025-09-09 at 13:36 +0000, Alice Ryhl wrote:
> > When using GPUVM in immediate mode, it is necessary to call
> > drm_gpuvm_unlink() from the fence signalling critical path. However,
> > unlink may call drm_gpuvm_bo_put(), which causes some challenges:
> >=20
> > 1. drm_gpuvm_bo_put() often requires you to take resv locks, which
> > you
> > =C2=A0=C2=A0 can't do from the fence signalling critical path.
> > 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often
> > going
> > =C2=A0=C2=A0 to be unsafe to call from the fence signalling critical pa=
th.
> >=20
> > To solve these issues, add a deferred version of drm_gpuvm_unlink()
> > that
> > adds the vm_bo to a deferred cleanup list, and then clean it up
> > later.
> >=20
> > The new methods take the GEMs GPUVA lock internally rather than
> > letting
> > the caller do it because it also needs to perform an operation after
> > releasing the mutex again. This is to prevent freeing the GEM while
> > holding the mutex (more info as comments in the patch). This means
> > that
> > the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
> >=20
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_gpuvm.c | 174
> > ++++++++++++++++++++++++++++++++++++++++++++
> > =C2=A0include/drm/drm_gpuvm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 ++++++=
+
> > =C2=A02 files changed, 200 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> > b/drivers/gpu/drm/drm_gpuvm.c
> > index
> > 78a1a4f095095e9379bdf604d583f6c8b9863ccb..5aa8b3813019705f70101950af2
> > d8fe4e648e9d0 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -876,6 +876,27 @@ __drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm,
> > spinlock_t *lock,
> > =C2=A0	cond_spin_unlock(lock, !!lock);
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * drm_gpuvm_bo_is_dead() - check whether this vm_bo is scheduled
>=20
> NIT: Is zombie a better name than dead?

I could see that name make sense.

> > =C2=A0/**
> > =C2=A0 * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
> > =C2=A0 * @__vm_bo: the &drm_gpuvm_bo
> > @@ -1081,6 +1102,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const
> > char *name,
> > =C2=A0	INIT_LIST_HEAD(&gpuvm->evict.list);
> > =C2=A0	spin_lock_init(&gpuvm->evict.lock);
> > =C2=A0
> > +	INIT_LIST_HEAD(&gpuvm->bo_defer.list);
> > +	spin_lock_init(&gpuvm->bo_defer.lock);
> > +
>=20
> This list appears to exactly follow the pattern a lockless list was
> designed for. Saves some space in the vm_bo and gets rid of the
> excessive locking. <include/linux/llist.h>

Good point.

Alice
