Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF89C00F6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 10:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0D510E0C0;
	Thu,  7 Nov 2024 09:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LsvRykuf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E64410E7C6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 09:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730971088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CmVphk5HnzRr9iFL/NZcM2i71JfryJy3cZgbIgsnpNw=;
 b=LsvRykuf/5hSeteCBYPA9c4bNfyUG/XOyAF5u+66By3RDtyLbVcpEC+CQrYUpWOH1Wve4e
 4NBr6gxtdaT7wTgU1qjPMkdvMv5sM3aPb2sszarWIF1voVIQzbNIXv/2wTOK8sGI4XRL1G
 HhP1ObM+al5zpNYvI6h9SOKoP0bg6Rs=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-3O30N6d1NzS6jZY7rUamNQ-1; Thu, 07 Nov 2024 04:18:06 -0500
X-MC-Unique: 3O30N6d1NzS6jZY7rUamNQ-1
X-Mimecast-MFC-AGG-ID: 3O30N6d1NzS6jZY7rUamNQ
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-288c0ddb462so632012fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 01:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730971086; x=1731575886;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CmVphk5HnzRr9iFL/NZcM2i71JfryJy3cZgbIgsnpNw=;
 b=bHUNERxJXnjBfRfZqgl809S/LUDBFK9Pd7eJSG8/N4JJ4AdHwrY8sQdDsoRvYaV0s+
 FWjZ5rP/nlHc12IawNVE0Xo0oGZQ2adtBFtr+lKolftJu2k3bk9QSx4ewqgt9B93GoAT
 vtPo2NwXNr2+q1zkk94aNCuCi/bBWe3T/6Yx/wUNJxAP+1vt98nM0vLbGwqWUEMTRn/H
 fh16Fx1a5VQYR0tUDTzzgtjdzucVKVQZ2+fTJ5MBFvGCByozJHvWzo43o8Nv7b2gzxp3
 vtK+IRO4rdXTppQIJ1YzsSQwaTAQySBDGBkDST8t6P/5BuA1Q9nGZuhfYT9Qw6AdNrNt
 pS5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMf4k8jdruhTkB9hBa/ttHPd84eiJDHHzmKF+YJLCMhzV5K3WpUegs0dXZDrVKxe/5ZRk+TW89mvI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmnWJeQifXF3zt0Jvt40YGCDL7mP6FC5T6+Q6YYDbhH21Z8L4v
 jCIz+liImcyKWBaKQsJu1J20Sop+Fv1FuCEdGFhLAdqqziz0bJcaSr5J9zMaPVaFwx0Wd/RoOkV
 ljRtK1dTJEUOIaS+XVgV7vtyr1gpAiJ0nuy7nEMzkTML5v8adLsVAd1ix22YEq9NTLQ==
X-Received: by 2002:a05:6871:7a5:b0:270:4d48:6be2 with SMTP id
 586e51a60fabf-29051c581bemr38495152fac.26.1730971085924; 
 Thu, 07 Nov 2024 01:18:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxVuDCN+kUd2BLd1VEmyXUjRDGkSSx/KgtfiR0mwWkoNFmy2UU8+iWUjMXBXD7zPGbuSVtYw==
X-Received: by 2002:a05:6871:7a5:b0:270:4d48:6be2 with SMTP id
 586e51a60fabf-29051c581bemr38495122fac.26.1730971085599; 
 Thu, 07 Nov 2024 01:18:05 -0800 (PST)
Received: from [10.32.64.113] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29546ce5938sm253621fac.20.2024.11.07.01.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 01:18:05 -0800 (PST)
Message-ID: <1c27295862e10dd958c01ef3ab5ef2f3757e446b.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Improve teardown documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Thu, 07 Nov 2024 10:18:01 +0100
In-Reply-To: <20241105143137.71893-2-pstanner@redhat.com>
References: <20241105143137.71893-2-pstanner@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6PF5bGiS_7k5IFU8l3YY_cAa2iE5sxWrQ-3VfkFqFTs_1730971086
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

On Tue, 2024-11-05 at 15:31 +0100, Philipp Stanner wrote:
> If jobs are still enqueued in struct drm_gpu_scheduler.pending_list
> when drm_sched_fini() gets called, those jobs will be leaked since
> that
> function stops both job-submission and (automatic) job-cleanup. It
> is,
> thus, up to the driver to take care of preventing leaks.
>=20
> The related function drm_sched_wqueue_stop() also prevents automatic
> job
> cleanup.
>=20
> Those pitfals are not reflected in the documentation, currently.
>=20
> Explicitly inform about the leak problem in the docstring of
> drm_sched_fini().
>=20
> Additionally, detail the purpose of drm_sched_wqueue_{start,stop} and
> hint at the consequences for automatic cleanup.
>=20
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Got an off-list (mail from dri-devel apparently got lost) RB from
Christian.

Applied to drm-misc-next.

P.

> ---
> Hi,
>=20
> in our discussion about my proposed waitque-cleanup for this problem
> Sima suggested [1] that we document the problems first and by doing
> so get
> to a consenus what the problems actually are and how we could solve
> them.
>=20
> This is my proposal for documenting the leaks on teardown. Feedback
> very
> welcome.
>=20
> P.
>=20
> [1]
> https://lore.kernel.org/dri-devel/ZtidJ8S9THvzkQ-6@phenom.ffwll.local/
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++++++++++--
> =C2=A01 file changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index e97c6c60bc96..3dfa9db89484 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1333,6 +1333,19 @@ EXPORT_SYMBOL(drm_sched_init);
> =C2=A0 * @sched: scheduler instance
> =C2=A0 *
> =C2=A0 * Tears down and cleans up the scheduler.
> + *
> + * This stops submission of new jobs to the hardware through
> + * drm_sched_backend_ops.run_job(). Consequently,
> drm_sched_backend_ops.free_job()
> + * will not be called for all jobs still in
> drm_gpu_scheduler.pending_list.
> + * There is no solution for this currently. Thus, it is up to the
> driver to make
> + * sure that
> + *=C2=A0 a) drm_sched_fini() is only called after for all submitted jobs
> + *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has been cal=
led or that
> + *=C2=A0 b) the jobs for which drm_sched_backend_ops.free_job() has not
> been called
> + *=C2=A0=C2=A0=C2=A0=C2=A0 after drm_sched_fini() ran are freed manually=
.
> + *
> + * FIXME: Take care of the above problem and prevent this function
> from leaking
> + * the jobs in drm_gpu_scheduler.pending_list under any
> circumstances.
> =C2=A0 */
> =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched)
> =C2=A0{
> @@ -1428,8 +1441,10 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
> =C2=A0
> =C2=A0/**
> =C2=A0 * drm_sched_wqueue_stop - stop scheduler submission
> - *
> =C2=A0 * @sched: scheduler instance
> + *
> + * Stops the scheduler from pulling new jobs from entities. It also
> stops
> + * freeing jobs automatically through
> drm_sched_backend_ops.free_job().
> =C2=A0 */
> =C2=A0void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
> =C2=A0{
> @@ -1441,8 +1456,12 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
> =C2=A0
> =C2=A0/**
> =C2=A0 * drm_sched_wqueue_start - start scheduler submission
> - *
> =C2=A0 * @sched: scheduler instance
> + *
> + * Restarts the scheduler after drm_sched_wqueue_stop() has stopped
> it.
> + *
> + * This function is not necessary for 'conventional' startup. The
> scheduler is
> + * fully operational after drm_sched_init() succeeded.
> =C2=A0 */
> =C2=A0void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
> =C2=A0{

