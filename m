Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD43B34896
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3EC10E515;
	Mon, 25 Aug 2025 17:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g5/laq1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B043C10E514;
 Mon, 25 Aug 2025 17:23:31 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b4717593371so621010a12.3; 
 Mon, 25 Aug 2025 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756142611; x=1756747411; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqS4cexHLHnWD7Uo3Tw+31RDP79iEewYyIROYQwr5zY=;
 b=g5/laq1j0zUhu/U7Pldg3rk8JsJohNtXwQjiex1pQYp77lxUTUQqtTMls/Z/QPENxU
 Nei7f+NVbPHPVfpvjH2owUbEyiNHS37jQQI5cKI9gWgqYSnGoL2hmtMakcMSqswzV8iG
 mU3mDxWrGxuDTTeQdxF4U8cdy+aLCWjl0TvRp+mUQwiuUDHl27XoJfujCMK5XQ2RkMh8
 JtNtouVDLwFv6fX+yrHipqwutxF+qxWT4Vha81VXmBaNg4UD4iNicBeFUBI8CPCSnR9U
 BLDN2p2ph6YygWHyctCeuf+O7xmU/zkUwYur5u0RxpEsiW/OwwIvx/okw3WikMfTaC0y
 GNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756142611; x=1756747411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aqS4cexHLHnWD7Uo3Tw+31RDP79iEewYyIROYQwr5zY=;
 b=ujIIpCy7xnprddC8+JCp2hXHaDjpj/wT+NDxPc6YP+DDhIoUhotpZmDdgVOWt29kqW
 M1/+4AiDK0g87lNzV6QPwQ+ZhpQvlftSGyH2wJ/ZD2YotN/NJDGURp8+d2+Big4ittok
 I212kLG2I4EWo3A2vU2QLJE3qLLn6L+QGZrzQfVYZcmw5eIiOf3mE/WwV/9YllK5XzNh
 QZcr/oeTfCDxnJ/s6lzWQgL8NCGqy/5Dp6oOU9MLtMGIVv5Q1OuBgE6eYdBYO7oFAO5a
 658vhFtR+qaxcQaGU2bvfvy3TzHYev/TG2giRRNDIRhP1c/jY1CpgFBvGqxsGCXGJ9wY
 Iq5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Kptp7tczPxoC/mWqkg4K0c6GzpZVsNMfZrsFYqHmHr5NIfACXM5gr/dv/CjCHnISloNlrSHc@lists.freedesktop.org,
 AJvYcCXNMIubvkyr4uBUsr6E+s+rEK+JuTwQYWd0JrNBRVnUZ450v126wfb6CYiBlpE3A6c+GKTv3ye2oxkl@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvnv7SOvi/1e50NkLSuRsiNYBsUZjh+xda1OZk3XGFHfaXfzSd
 xF+zY1fN3g37bZdir66nJYRGVGyG1RrL2kyrmJcJv/sr3cWaHSBUA0BNsGZcNnZwUGA85G+xDnm
 mF46CfayWrY5QZqUO6E50Zaw0DAdYO30=
X-Gm-Gg: ASbGncvoM0BDiegqKzHEax5LZPJ+G+XcXeBiaNROtDubV4RyZuSDC76IrUMKlFVMyV8
 6G+2qJEJAGqy1GA4toliKVPsigq+aE47IIBZSvMvtUpKwzAsso4767BlJw916KgpzLl7Q+iGSla
 az+USXpYTtm4/RUS8s9BaYWk8zf+vbA/JEc3OFh8sffsUapGgQ2G4+qSUGFyYNx1s58RHubT3zO
 PX0ko2ab7tFBERhXA==
X-Google-Smtp-Source: AGHT+IE1UbyOG0uQaMwMqK+bQHsoYXV61D8Hg2qSkndUelszKfzs1G1pDPlfdTtbfqZSK6K7FyJUNQL6bEXJHKvrfFM=
X-Received: by 2002:a17:902:d508:b0:246:cc19:17de with SMTP id
 d9443c01a7336-246cc19233cmr31752245ad.4.1756142611139; Mon, 25 Aug 2025
 10:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250822215950.243504-1-alex.t.tran@gmail.com>
In-Reply-To: <20250822215950.243504-1-alex.t.tran@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Aug 2025 13:23:19 -0400
X-Gm-Features: Ac12FXzIvfANo75GNyfElwuZ2CjDPGmbgojBz3IdrFU8y7KVuLQulMTIo6uaxbc
Message-ID: <CADnq5_NzpnnKPxV2RFX=TVAw9JbRByQbDbCZBaNHhXVjK4fWSw@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/amd/amdkfd/kdf_queue.c: removal of
 kfd_queue_buffer_put
To: Alex Tran <alex.t.tran@gmail.com>
Cc: Felix.Kuehling@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sat, Aug 23, 2025 at 6:11=E2=80=AFAM Alex Tran <alex.t.tran@gmail.com> w=
rote:
>
> Removed kfd_queue_buffer_put to call amdgpu_bo_unref directly.
>
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h            |  1 -
>  .../drm/amd/amdkfd/kfd_process_queue_manager.c   |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_queue.c           | 16 +++++-----------
>  3 files changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/=
amdkfd/kfd_priv.h
> index 67694bcd9464..2bc0365b2ce9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -1312,7 +1312,6 @@ void print_queue_properties(struct queue_properties=
 *q);
>  void print_queue(struct queue *q);
>  int kfd_queue_buffer_get(struct amdgpu_vm *vm, void __user *addr, struct=
 amdgpu_bo **pbo,
>                          u64 expected_size);
> -void kfd_queue_buffer_put(struct amdgpu_bo **bo);
>  int kfd_queue_acquire_buffers(struct kfd_process_device *pdd, struct que=
ue_properties *properties);
>  int kfd_queue_release_buffers(struct kfd_process_device *pdd, struct que=
ue_properties *properties);
>  void kfd_queue_unref_bo_va(struct amdgpu_vm *vm, struct amdgpu_bo **bo);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/dri=
vers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index 7fbb5c274ccc..b13817e4a829 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -610,7 +610,7 @@ int pqm_update_queue_properties(struct process_queue_=
manager *pqm,
>                 }
>
>                 kfd_queue_unref_bo_va(vm, &pqn->q->properties.ring_bo);
> -               kfd_queue_buffer_put(&pqn->q->properties.ring_bo);
> +               amdgpu_bo_unref(&pqn->q->properties.ring_bo);
>                 amdgpu_bo_unreserve(vm->root.bo);
>
>                 pqn->q->properties.ring_bo =3D p->ring_bo;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_queue.c
> index a65c67cf56ff..dd529e37c0e6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
> @@ -224,12 +224,6 @@ int kfd_queue_buffer_get(struct amdgpu_vm *vm, void =
__user *addr, struct amdgpu_
>         return -EINVAL;
>  }
>
> -/* FIXME: remove this function, just call amdgpu_bo_unref directly */

Despite what this comment says, I think it makes sense to keep this
around so that we have a matching set of put and get functions so it's
clear why we are putting the reference.  That said if Felix and Harish
are ok with it, that's fine with me.

Alex

> -void kfd_queue_buffer_put(struct amdgpu_bo **bo)
> -{
> -       amdgpu_bo_unref(bo);
> -}
> -
>  int kfd_queue_acquire_buffers(struct kfd_process_device *pdd, struct que=
ue_properties *properties)
>  {
>         struct kfd_topology_device *topo_dev;
> @@ -343,11 +337,11 @@ int kfd_queue_release_buffers(struct kfd_process_de=
vice *pdd, struct queue_prope
>         struct kfd_topology_device *topo_dev;
>         u32 total_cwsr_size;
>
> -       kfd_queue_buffer_put(&properties->wptr_bo);
> -       kfd_queue_buffer_put(&properties->rptr_bo);
> -       kfd_queue_buffer_put(&properties->ring_bo);
> -       kfd_queue_buffer_put(&properties->eop_buf_bo);
> -       kfd_queue_buffer_put(&properties->cwsr_bo);
> +       amdgpu_bo_unref(&properties->wptr_bo);
> +       amdgpu_bo_unref(&properties->rptr_bo);
> +       amdgpu_bo_unref(&properties->ring_bo);
> +       amdgpu_bo_unref(&properties->eop_buf_bo);
> +       amdgpu_bo_unref(&properties->cwsr_bo);
>
>         topo_dev =3D kfd_topology_device_by_id(pdd->dev->id);
>         if (!topo_dev)
> --
> 2.50.1
>
