Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6423A13740
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 11:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E58610E161;
	Thu, 16 Jan 2025 10:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fpab0/Hh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ECB10E161
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 10:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737021746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIsi1CBq2bx4+XCNtgDZC/ufBGOJR1JDiOKIN/p/Gzs=;
 b=fpab0/Hhivfq/E8cxVZXq7MbpjScNxuv6NcEapDUrjjT72Yb375Zo9sirw+myYnCeX/uHR
 E35WTI2+EJtKVvIEnRveqigY4ojVf3QFDT4ZLosKnoYlYcP+4QqSP+KVxHdrCRntpbZQ7Y
 3U++7hLPSxZvqqlSG0kVLxvAN3lphLo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-mmgVUZTIPOikpHTjHpIISg-1; Thu, 16 Jan 2025 05:02:24 -0500
X-MC-Unique: mmgVUZTIPOikpHTjHpIISg-1
X-Mimecast-MFC-AGG-ID: mmgVUZTIPOikpHTjHpIISg
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361fc2b2d6so3275545e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 02:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737021743; x=1737626543;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fzwyQkMJYfjuZobC5r1V51tSXwdYdpjvkYOeckIvUSg=;
 b=ZD37lUkWT91dRunzilR2Jo4kc7//vJzl1gP8MFQkEXwBjReMn6d8hi0stFg6haxbHU
 5PCRy68He1CRLqh/YTpohFEeUqIkeJ51hFBcJVV41DlcxHfDJm/kxOm2Hx+r17GV9ulL
 rvwin4/inYxrcDbkjFjelJSaEVs0Gyi3D6/U5Z1XdbcS94LQOzNsmtfmzgyFLGXbwY+2
 +lmdo6wQYKWxe5FwCpk2KuB21y6tVfBSkjwFRpdfiTvUQlgat28G2uiFbjANkYtkwGIY
 ZNa5XU0uZQAV4NTK7sw8V03EnUlj/rOSSFEFH+wyoE8puGiLQUIJlmLfjlDN7qYP8I73
 6mdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWXDsHU9Fvzt9ocYLGIjwBSo12PNyqKw2uqndemEu2jg9Ww/DQ6OMnHsvlj65G/kuZWc1hlXzYNF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4VuHWjkL/eFa1OJQxMpHHcGnxOhdIHB5ICugx2onX06Xf5Osa
 R9aBKbe8exfKrBbHK/DM8iJRj/0CA6LzoW0F0YrTj4i8/aozqUjZIPUeEs8SR5oJEGbvSR5Npxf
 xrf3bWylGYqtRyOztSeyVSdTlamthUtV+IjruZvGiuZYQFNUEXBI156MP/d/JcAEiMzTMJQD8vQ
 ==
X-Gm-Gg: ASbGncsaHcSkVAiF4Hy2isbSQXcOZFOZapB/ErFTe7LrcKVFa0INK8R+w16hw8/VAqv
 Nb+JkbwCh09drXppIxycyVrVq++t+omgrqj/HmwuVBjFl5puCE8lrcXSgKN7Wj+F+0lFaIXKMwA
 NTXua6WG8wi5d9IX1abIb+cltJCjbOGZyhg7J1dE4OlVK5QTMM15H7LJNS2h5IEQ13Ju8369T0J
 1FMW/LfmVlNUGumSidP+WUu7isQu7JvtAEfhq19iBjtlf/y8pF5kFxdvOqeRU+QyI7PRPzM6I1F
 rIaoB/8=
X-Received: by 2002:a05:600c:5698:b0:434:a7f1:6545 with SMTP id
 5b1f17b1804b1-436e2d91910mr265128465e9.27.1737021743474; 
 Thu, 16 Jan 2025 02:02:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/9M4CrA9NfHezLsa5aIN3jf8IqC4sEFhJ3f33MAKsQNmvjYTsV7U8Cy9zmNNsd9Jc9UldCg==
X-Received: by 2002:a05:600c:5698:b0:434:a7f1:6545 with SMTP id
 5b1f17b1804b1-436e2d91910mr265128115e9.27.1737021743030; 
 Thu, 16 Jan 2025 02:02:23 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74c4f85sm54596045e9.18.2025.01.16.02.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 02:02:22 -0800 (PST)
Message-ID: <3bd987218d4248cc837c37361d0f8f29fc6933ec.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/imagination: Use the
 drm_sched_job_has_dependency helper
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>, Matthew
 Brost <matthew.brost@intel.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>
Date: Thu, 16 Jan 2025 11:02:21 +0100
In-Reply-To: <20250113103341.43914-2-tvrtko.ursulin@igalia.com>
References: <20250113103341.43914-1-tvrtko.ursulin@igalia.com>
 <20250113103341.43914-2-tvrtko.ursulin@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w_RxJaePz_DFzaT77wvWAPxR1-UkJDSOSYebT1cf7eY_1737021744
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

On Mon, 2025-01-13 at 10:33 +0000, Tvrtko Ursulin wrote:
> Instead of manually peeking into the DRM scheduler implementation
> details
> lets use the previously added helper.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Matt, just to be sure, you're OK with me pulling those two into drm-
misc-next, aren't you?

P.

> ---
> =C2=A0drivers/gpu/drm/imagination/pvr_job.c | 12 +++---------
> =C2=A01 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_job.c
> b/drivers/gpu/drm/imagination/pvr_job.c
> index 618503a212a7..1cdb3cfd058d 100644
> --- a/drivers/gpu/drm/imagination/pvr_job.c
> +++ b/drivers/gpu/drm/imagination/pvr_job.c
> @@ -597,8 +597,6 @@ update_job_resvs_for_each(struct pvr_job_data
> *job_data, u32 job_count)
> =C2=A0static bool can_combine_jobs(struct pvr_job *a, struct pvr_job *b)
> =C2=A0{
> =C2=A0=09struct pvr_job *geom_job =3D a, *frag_job =3D b;
> -=09struct dma_fence *fence;
> -=09unsigned long index;
> =C2=A0
> =C2=A0=09/* Geometry and fragment jobs can be combined if they are
> queued to the
> =C2=A0=09 * same context and targeting the same HWRT.
> @@ -609,13 +607,9 @@ static bool can_combine_jobs(struct pvr_job *a,
> struct pvr_job *b)
> =C2=A0=09=C2=A0=C2=A0=C2=A0 a->hwrt !=3D b->hwrt)
> =C2=A0=09=09return false;
> =C2=A0
> -=09xa_for_each(&frag_job->base.dependencies, index, fence) {
> -=09=09/* We combine when we see an explicit geom -> frag
> dep. */
> -=09=09if (&geom_job->base.s_fence->scheduled =3D=3D fence)
> -=09=09=09return true;
> -=09}
> -
> -=09return false;
> +=09/* We combine when we see an explicit geom -> frag dep. */
> +=09return drm_sched_job_has_dependency(&frag_job->base,
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0 &geom_job->base.s_fence-
> >scheduled);
> =C2=A0}
> =C2=A0
> =C2=A0static struct dma_fence *

