Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4523BB03A5
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 13:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D7B10E34C;
	Wed,  1 Oct 2025 11:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WZVfZ7c0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9ED10E34C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 11:45:51 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so4831882f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 04:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759319149; x=1759923949;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VviCcFP3Jcgv6/FMyDDvQbhSqrw1FId3gqaJAc0zZRY=;
 b=WZVfZ7c0ApIC8BYEw5jCdUAWkMOBUn5N7VAy+rwaM6g9PkVTqooeHLrr7rO1hV7eqH
 HYKZMNicFn1Q9kMfw3jgyrwqILUQcmnurforND79fzGCad7o33v9uN+IEJWD87eELSjF
 sTdnTY1aQVLRa547ZT8AY+NG1a+LXzuiO6ixpCe39947N26b8c72DXeCZWgzdbSvuDr9
 tOrn/+1CC1DBfZZ2QmxyxpcR69C/5REDr976NiOogFmw74yON6VuEhKYS8QY5iOd6j4g
 sU5ikZI5lQPtvUG2d2JvaAqy2tj/myEhKuJvCF3UFN4Ssr0mcqfw8b3OJBDrmbVDHExV
 wKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759319149; x=1759923949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VviCcFP3Jcgv6/FMyDDvQbhSqrw1FId3gqaJAc0zZRY=;
 b=vsLq0Rd0DcF9Ls8+/vlP8gLglIr9sAJW59itIFJwkocRKjljIafqlCN/WLmcBsktze
 qcoczWqcHRM7sj/kjPjNGSaC6Do25XjyBsnOKRqa0VHfaY9ylZFohR5aBeZ8nTWquUm3
 fb08aOJb95neh2Ue0avnPrYzaMl5ZApIgFGtqoGJ+pFRXwY3DJuOTEh7btoRhgHPdoWi
 b3gif5SWqUGoVOLnthZ+VH0r/dpo4583wuKzqdkMzZxi4ZBKGC4sOFEEeuoQOfZ91gG/
 AUtszHlUUZh+S2alHjdTJKhxuDl4bZl5snBc2ZEzTwJEQC3SILu2GfvZx0E7vswxRcxX
 MsGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt09mjI2ObKia47Pj1DvrzwKXLb9Lkusfr9LSEOxFqeEeWCFV5MPUfVEcRaIT32xGZ5Bv+e3AnaiI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2AE04w0XE8xEq0MNO0+qeLhbbr9spwQVlMF7ODXETPaQu2K6K
 BqwvPym5MiHOxaVv14IkoucJZj8W2mRWwTtyv+wcoyWzPfDf77imIcpbpfiMmu8P6TECgKKbZik
 +8DirtItrtt3B2E8AdWf1H5WYEtjFknTtdGAX/PdY
X-Gm-Gg: ASbGncsclffLa2DqHMc6judApbttKbERZCRrfDVaMJtgf39YIDKzY6Npl60Fcs3HBCI
 ebvb8fXxBFyvtZh32QUfl5XksB6sH/PNEHZug+Dknw85b0Hyr1XHIqoIV0HkDF9oIDTz4VsHaa2
 ZiYW7gVb9VJSr+tZI6dCRAIkkFKfph/GLjaHcZ3MLqkEaQoeGnfAn70/5RFRc6R300jhhT058EH
 umiRlCoiFfcGyEd+ehaZPhBYcwO7XVbRCwoh0acUvo20Fm0Lq5l25ggosAxnC8CYwpN
X-Google-Smtp-Source: AGHT+IH2YWNMKHFi6t5kKvcv1ZOzoaYRa805PT2+7dBFyjV52rsAx9pBNC4BGfFbOqvAMUG1FgAm/Wijr9S7daE4QzA=
X-Received: by 2002:a05:6000:186e:b0:3e9:b208:f2d2 with SMTP id
 ffacd0b85a97d-42557a15a22mr2477227f8f.50.1759319149319; Wed, 01 Oct 2025
 04:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
 <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
 <20251001132739.41575fa5@fedora>
In-Reply-To: <20251001132739.41575fa5@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Oct 2025 13:45:36 +0200
X-Gm-Features: AS18NWBngU-2nkqnXugLMYJ5aD04zIT_sFpqKVAk2neDLCbOKa2QWYVXO5xOGRA
Message-ID: <CAH5fLghp+4dx6-JAfbSWDLz7WOdwtnLeuxdGhmVPax+HKbTv3w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
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

On Wed, Oct 1, 2025 at 1:27=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 01 Oct 2025 10:41:36 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > When using GPUVM in immediate mode, it is necessary to call
> > drm_gpuvm_unlink() from the fence signalling critical path. However,
> > unlink may call drm_gpuvm_bo_put(), which causes some challenges:
> >
> > 1. drm_gpuvm_bo_put() often requires you to take resv locks, which you
> >    can't do from the fence signalling critical path.
> > 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often going
> >    to be unsafe to call from the fence signalling critical path.
> >
> > To solve these issues, add a deferred version of drm_gpuvm_unlink() tha=
t
> > adds the vm_bo to a deferred cleanup list, and then clean it up later.
> >
> > The new methods take the GEMs GPUVA lock internally rather than letting
> > the caller do it because it also needs to perform an operation after
> > releasing the mutex again. This is to prevent freeing the GEM while
> > holding the mutex (more info as comments in the patch). This means that
> > the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
> >
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>

> > +/*
> > + * Must be called with GEM mutex held. After releasing GEM mutex,
> > + * drm_gpuvm_bo_defer_free_unlocked() must be called.
> > + */
> > +static void
> > +drm_gpuvm_bo_defer_free_locked(struct kref *kref)
> > +{
> > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_gpuv=
m_bo,
> > +                                               kref);
> > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > +
> > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > +     }
> > +
> > +     list_del(&vm_bo->list.entry.gem);
> > +}
> > +
> > +/*
> > + * GEM mutex must not be held. Called after drm_gpuvm_bo_defer_free_lo=
cked().
> > + */
> > +static void
> > +drm_gpuvm_bo_defer_free_unlocked(struct drm_gpuvm_bo *vm_bo)
> > +{
> > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > +
> > +     llist_add(&vm_bo->list.entry.bo_defer, &gpuvm->bo_defer);
>
> Could we simply move this line to drm_gpuvm_bo_defer_free_locked()?
> I might be missing something, but I don't really see a reason to
> have it exposed as a separate operation.

No, if drm_gpuvm_bo_deferred_cleanup() is called in parallel (e.g.
from a workqueue as we discussed), then this can lead to kfreeing the
GEM while we hold the mutex. We must not add the vm_bo until it's safe
to kfree the GEM. See the comment on
drm_gpuvm_bo_defer_free_unlocked() below.

> > +}
> > +
> > +static void
> > +drm_gpuvm_bo_defer_free(struct kref *kref)
> > +{
> > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_gpuv=
m_bo,
> > +                                               kref);
> > +
> > +     mutex_lock(&vm_bo->obj->gpuva.lock);
> > +     drm_gpuvm_bo_defer_free_locked(kref);
> > +     mutex_unlock(&vm_bo->obj->gpuva.lock);
> > +
> > +     /*
> > +      * It's important that the GEM stays alive for the duration in wh=
ich we
> > +      * hold the mutex, but the instant we add the vm_bo to bo_defer,
> > +      * another thread might call drm_gpuvm_bo_deferred_cleanup() and =
put
> > +      * the GEM. Therefore, to avoid kfreeing a mutex we are holding, =
we add
> > +      * the vm_bo to bo_defer *after* releasing the GEM's mutex.
> > +      */
> > +     drm_gpuvm_bo_defer_free_unlocked(vm_bo);
> > +}

Alice
