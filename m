Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F099AB0AF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 16:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E43A10E334;
	Tue, 22 Oct 2024 14:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TNrWCYYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C306510E334
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729606762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y98CrFQDkXNy/UAa9BjJgvPTjzbP0v4IYXWhWTBzEbE=;
 b=TNrWCYYNaPRnIPYq1Vg5WOCNh8HFgLVn5/SAaKKg5VyxpruwhJ1bqe23DrYCW9h01MUTwT
 xw276Wa/4MlvXiEchOyL5FgX3+1TrksDdasVdQ1hYuKMrlCYrSxqg7VacZucVVdjUGwXYw
 CwlEeMhnRgGIgjW2877EpY25/PkFMXY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-LO1OGLsgMNu1b8yVMbAwBw-1; Tue, 22 Oct 2024 10:19:21 -0400
X-MC-Unique: LO1OGLsgMNu1b8yVMbAwBw-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7ac8f684d9bso334590285a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 07:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729606761; x=1730211561;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y98CrFQDkXNy/UAa9BjJgvPTjzbP0v4IYXWhWTBzEbE=;
 b=u2vejG6hMgoH0ey7Unr4jD1Z0LxDS2IBi3v3yWvyMrU0kKnqGX6W/O+N9VxRdSIAue
 Fx9SRS2ndekFfQ9BSO5CBbniMWtkhnkyaNSQvXXCw5StbAm6Es2ceITdC6cIN4R4vKQA
 1x/mCkl9oPXpXltQxniZKhIdxqVvPE/i327dXBnbwjHbwLKal4l2zSkEzgsp9n1DRIPl
 d//sp4+L1aNvpLK9JafdRWU5MycNHkKoJpvbVuVovEuAdX3ZCyF3Gqe7Y2H4e19nBIbK
 IjV9rXifyAByeDPRcj6mBAy6eFbbLOf3SyWDSuj7TH4Pb+SdbjfTEXcZHyt+Nm2T373R
 mjDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8RVQj/y0FcIoilfwbV7F5x4+wq2WFETKzm2TJLRI02be9kJAezIOwNBzr/vI2UyOoGNIHFiez2ak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysZQmyjRlTKkFBTJdP/NSjRrE/63QaVIgrCv/uZ4MdPwhvcagP
 daCnRVoTQzRe4BHOZ0ycjvWqr79nzA8ov/kRbsdC8HaJ0iddt7tkIFfZN0k0zB8j1zhpKQrUVJB
 7nNyOIhrzjS8vfQuA9WjKJZMVPFys1u5qmlJ9oZVllTqCSwbynszeoMEqS7QTMAVmUw==
X-Received: by 2002:a05:620a:1a28:b0:7b1:49ae:ee04 with SMTP id
 af79cd13be357-7b157b66f59mr1786854485a.26.1729606761068; 
 Tue, 22 Oct 2024 07:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY8/mopR2C491/PNaDbJE7YMzIVfSCkHtU+lG8+iK/YoPd6tqBhKTvET36l9kMpOvhnmevbA==
X-Received: by 2002:a05:620a:1a28:b0:7b1:49ae:ee04 with SMTP id
 af79cd13be357-7b157b66f59mr1786851785a.26.1729606760611; 
 Tue, 22 Oct 2024 07:19:20 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b165a71023sm283242385a.105.2024.10.22.07.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 07:19:20 -0700 (PDT)
Message-ID: <a5dd3b1d6b8da184ed16f5653faca95163b79340.camel@redhat.com>
Subject: Re: [PATCH 1/4] drm/sched: Mark scheduler work queues with
 WQ_MEM_RECLAIM
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org, Luben Tuikov <ltuikov89@gmail.com>
Date: Tue, 22 Oct 2024 16:19:18 +0200
In-Reply-To: <20241021175705.1584521-2-matthew.brost@intel.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
 <20241021175705.1584521-2-matthew.brost@intel.com>
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

On Mon, 2024-10-21 at 10:57 -0700, Matthew Brost wrote:
> DRM scheduler work queues are used to submit jobs, jobs are in the
> path

"scheduler work queues" is very generic, how about
"drm_gpu_scheduler.submit_wq is used to submit jobs, [...]"

> or dma-fences, and dma-fences are in the path of reclaim. Mark

s/or/of

> scheduler
> work queues with WQ_MEM_RECLAIM so these work queues can continue to
> make forward progress during reclaim.

It is just *one* queue (per scheduler) really, isn't it?

If the change above is applied, could just say: "Create the work queue
with WQ_MEM_RECLAIM so it can continue [...]"

So for my understanding: is this a performance optimization or is it a
bug? IOW, would forward progress just be delayed or entirely prevented?
Would be cool to state that a bit more clearly in the commit message.

Work-queue docu says "MUST":

``WQ_MEM_RECLAIM`` All wq which might be used in the memory reclaim
paths **MUST** have this flag set. The wq is guaranteed to have at
least one execution context regardless of memory pressure.

So it seems to me that this fixes a bug? Should it be backported in
your opinion?


>=20
> Cc: Luben Tuikov <ltuikov89@gmail.com>

btw., how did you send this email? I couldn't find Luben on CC. Added
him.

Thx,
P.

> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 6e4d004d09ce..567811957c0f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1275,10 +1275,10 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched,
> =C2=A0 sched->own_submit_wq =3D false;
> =C2=A0 } else {
> =C2=A0#ifdef CONFIG_LOCKDEP
> - sched->submit_wq =3D alloc_ordered_workqueue_lockdep_map(name, 0,
> + sched->submit_wq =3D alloc_ordered_workqueue_lockdep_map(name,
> WQ_MEM_RECLAIM,
> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm_sched_lockdep_map);
> =C2=A0#else
> - sched->submit_wq =3D alloc_ordered_workqueue(name, 0);
> + sched->submit_wq =3D alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
> =C2=A0#endif
> =C2=A0 if (!sched->submit_wq)
> =C2=A0 return -ENOMEM;

