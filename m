Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FE69AEAB0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5797210E969;
	Thu, 24 Oct 2024 15:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fbUeTpIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED4510E964
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729784153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4NZF8/bs+vu0Kkuk8ifz5Ec7BVfb01ZqQ5W8OsPstM=;
 b=fbUeTpIfFO9y6Y54JgCWL4hz2PzkuljKvRe8dwyo3rOOLB9j7yFdgVj1oxNPL3ABkWUB5D
 XZdqz2xCQeD1SkH0qzO+SjgnKbgIT2K88WKSRVfOrFAyLDnmRbFETHNqlfXRjBRmCaZgRl
 QgM8CX0oyXEesR6Df7bvhPOQ8UQi8jo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-Nf4Paw-9PEKvQeVsvxxJoA-1; Thu, 24 Oct 2024 11:35:51 -0400
X-MC-Unique: Nf4Paw-9PEKvQeVsvxxJoA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4316ac69e6dso8806125e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 08:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729784149; x=1730388949;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4XHA5y9pXsuyiZijcWa6Y104RyTQrImtABY3rWqXeDQ=;
 b=CAbdHJGO6ZKov0jAxl40KqBMRjzSIlKgT5E6HXW33vo59tyM//TBhH2+1h3cNOq8h/
 Ukx10Muo0W9C0J/0uteLqYwplQDvmTwpNy0YEUqv7wQBsVIART4GUsrigc0Kdy28lNJN
 uYO08MKerSJ4jMUkQKXQvsRUIVLLiveey4l/+98/IDyByB1368qteDtsvH4gxnCt83Sd
 Ep+48IvmMfoTze/p53X4UnZmGqckN4FQeDJsPpgi7Q1PeaXlgIo99L6ZCGM/F9jjfLjX
 Tex8s70BsrP1TsUziPKsn8H0Xxyt6QQ86pLajdmAlmJ1ot1ZQYBGEj9yCg6T0lXHp94H
 4PiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+WNuLE/17TCvdaokfnpJaY+FApfyapQIZB8QiKHOu1JHs1QwQRjkrAfkCSbOuqnQ4MCg6/3YeXcw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2/Znb+ms0YhRIrth8hwXO8l+I9ktW49WWzyY0GarsBMkK1TPx
 UklEjbFvwO7f0Xjk+gZOyHmyr7ivgwS+pmfLrYe8GC0X9h+rvqTuHwlaqhaGTSJe4582RF/MjWy
 Lrh/bPPpJ8YwwYEj4xRb9HBc8hzVLUkFJjpX5BQn+leN35NkNJnTYTf1dDOsmx3gceQ==
X-Received: by 2002:a05:600c:1552:b0:42c:b750:1a1e with SMTP id
 5b1f17b1804b1-4318beb62e6mr21588125e9.0.1729784149187; 
 Thu, 24 Oct 2024 08:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQIGl94tHwG/Emnz8l7XEWUupX4uA5SZbIzVOXuAA62Ha/Qm5zJGncyBGFc7PBnWa0i/sIYA==
X-Received: by 2002:a05:600c:1552:b0:42c:b750:1a1e with SMTP id
 5b1f17b1804b1-4318beb62e6mr21587895e9.0.1729784148778; 
 Thu, 24 Oct 2024 08:35:48 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a5c529sm11567974f8f.62.2024.10.24.08.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 08:35:48 -0700 (PDT)
Message-ID: <eb625699d08db636e19c5141f681759849ff4a63.camel@redhat.com>
Subject: Re: [PATCH v2] drm/sched: Mark scheduler work queues with
 WQ_MEM_RECLAIM
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org, ltuikov89@gmail.com
Date: Thu, 24 Oct 2024 17:35:47 +0200
In-Reply-To: <20241023235917.1836428-1-matthew.brost@intel.com>
References: <20241023235917.1836428-1-matthew.brost@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

On Wed, 2024-10-23 at 16:59 -0700, Matthew Brost wrote:
> drm_gpu_scheduler.submit_wq is used to submit jobs, jobs are in the
> path
> of dma-fences, and dma-fences are in the path of reclaim. Mark
> scheduler
> work queue with WQ_MEM_RECLAIM to ensure forward progress during
> reclaim; without WQ_MEM_RECLAIM, work queues cannot make forward
> progress during reclaim.
>=20
> v2:
> =C2=A0- Fixes tags (Philipp)
> =C2=A0- Reword commit message (Philipp)
>=20
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: stable@vger.kernel.org
> Fixes: 34f50cc6441b ("drm/sched: Use drm sched lockdep map for
> submit_wq")
> Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work
> queue rather than kthread")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 540231e6bac6..df0a5abb1400 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1283,10 +1283,11 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched,
> =C2=A0=09=09sched->own_submit_wq =3D false;
> =C2=A0=09} else {
> =C2=A0#ifdef CONFIG_LOCKDEP
> -=09=09sched->submit_wq =3D
> alloc_ordered_workqueue_lockdep_map(name, 0,
> +=09=09sched->submit_wq =3D
> alloc_ordered_workqueue_lockdep_map(name,
> +=09=09=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 WQ_MEM_RECLAIM,
> =C2=A0=09=09=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 &drm_sched_lockdep_map);
> =C2=A0#else
> -=09=09sched->submit_wq =3D alloc_ordered_workqueue(name, 0);
> +=09=09sched->submit_wq =3D alloc_ordered_workqueue(name,
> WQ_MEM_RECLAIM);
> =C2=A0#endif
> =C2=A0=09=09if (!sched->submit_wq)
> =C2=A0=09=09=09return -ENOMEM;


Cool, thx =E2=80=93 looks good from my POV.

Since you now sent this patch as a single one, what would be the
preferred merge plan for this? Your XE-Series doesn't depend on this
IIUC, so should we take this patch here separately into drm-misc-next?


Regards,
P.

