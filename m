Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA689B091F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 18:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9511C10EB11;
	Fri, 25 Oct 2024 16:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JyIu1exa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C700910EB11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729872272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dP1l1d3q2dS9FBR6D2BlTz8i/N26swQgIiObmqRvP8Y=;
 b=JyIu1exahJ7Ij7A3Y6U3u50DBsO2Ek47OAeeimT96E8hAIzTPErayldSIq/iJ9ETMBF/Io
 e+EWx35JrryqqmYGm8K4nwfPQcWh6p1SncALT27XCu3E57FWYHkbMHCjo/EbA2+moTJZfc
 DxqDM4nM6oaPFvi2Dgs+UOtxetZ+9PA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-HBvpEr0VMBuc2yq7cCw45Q-1; Fri, 25 Oct 2024 12:04:31 -0400
X-MC-Unique: HBvpEr0VMBuc2yq7cCw45Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5cb81481a4bso1366803a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729872270; x=1730477070;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mq0ZSPaaM4EdprorVscFmQk+8GBA3VtDTMlmBxyEmiI=;
 b=mYCSftgfziC8WgMNIKSeSxsvOhrRUzGtZllXr4skWaKSiuZoymBsS3BjHQhPSLdF/v
 mw4KhnfBTN6qh3qr0rssvKQ/nsbxGVoqeQQiFTVgF/1uEvOnK+plchNbADVMVQwo1X8b
 AhK/I5CoCu74sOQSltqdTEjEEVJ4geIAKwFHwwAE6bqDr3hhWBLFPE6q/CNk/MObGRyu
 WtjL8ml0epy6a4lisuvyKowIOynjqUi+HMQJC4SV3zgzqx0jeDUc5Ay8cP98GypLJYVm
 cf9QKcMJfWPmxt3icbRnYWuvG/3BxzSVQE3KkFMvQYP9OhYXyBe1NJM9RMcOZflwy0vQ
 9kNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmvUwNVPlsonsbljj6EtTnkCY666woL6XNvcpSAZSOdY/HGkSp1ySnQJnzAlMFVMAbMp6Q2cnOf9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+Nmy32qYZa3y4umP3M5w4zIaNBbvaD2q6wTgSo9H5T20JAJYD
 xTV6BinuGmI0kF4MKwWa+ib+erSPTXHq0K+4HwQ9uxco4NEoGMA3+Xoz+eaSxKi5af1lJkrWmH+
 1K3cPWnYHkUnazK5Y5cNvCfxVMVdKHztoBoJIqXt6DQrrP9VtPXV3TdNo8wsrQFYPcg==
X-Received: by 2002:a05:6402:5011:b0:5cb:89d0:d423 with SMTP id
 4fb4d7f45d1cf-5cba2454282mr4896962a12.12.1729872270038; 
 Fri, 25 Oct 2024 09:04:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH4gqN9URLnFTdTMFPkxRZysuH2sFVvE3nRndWn31MrN/a9M9J/HlZtU1XnwBkUGH1I+Kq5Q==
X-Received: by 2002:a05:6402:5011:b0:5cb:89d0:d423 with SMTP id
 4fb4d7f45d1cf-5cba2454282mr4896933a12.12.1729872269531; 
 Fri, 25 Oct 2024 09:04:29 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82de5ba00738ac8dadaac7543.dip.versatel-1u1.de.
 [2001:16b8:2de5:ba00:738a:c8da:daac:7543])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629c250sm761328a12.27.2024.10.25.09.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 09:04:28 -0700 (PDT)
Message-ID: <243743c08eca2da4882d1c5fb3b01b68f044ee4a.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: warn about drm_sched_job_init()'s partial init
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  Tvrtko Ursulin
 <tursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Fri, 25 Oct 2024 18:04:27 +0200
In-Reply-To: <ZxsDRWxVRt2fCKpF@DUT025-TGLU.fm.intel.com>
References: <20241023141530.113370-2-pstanner@redhat.com>
 <ZxsDRWxVRt2fCKpF@DUT025-TGLU.fm.intel.com>
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

On Fri, 2024-10-25 at 02:32 +0000, Matthew Brost wrote:
> On Wed, Oct 23, 2024 at 04:15:31PM +0200, Philipp Stanner wrote:
> > drm_sched_job_init()'s name suggests that after the function
> > succeeded,
> > parameter "job" will be fully initialized. This is not the case;
> > some
> > members are only later set, notably drm_sched_job.sched by
> > drm_sched_job_arm().
> >=20
> > Document that drm_sched_job_init() does not set all struct members.
> >=20
> > Document the lifetime of drm_sched_job.sched.
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20

Applied to drm-misc-next, thank you.

P.


> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
> > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 ++++++++
> > =C2=A02 files changed, 12 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index dab8cca79eb7..8c1c4739f36d 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -771,6 +771,10 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
> > =C2=A0 * Drivers must make sure drm_sched_job_cleanup() if this functio=
n
> > returns
> > =C2=A0 * successfully, even when @job is aborted before
> > drm_sched_job_arm() is called.
> > =C2=A0 *
> > + * Note that this function does not assign a valid value to each
> > struct member
> > + * of struct drm_sched_job. Take a look at that struct's
> > documentation to see
> > + * who sets which struct member with what lifetime.
> > + *
> > =C2=A0 * WARNING: amdgpu abuses &drm_sched.ready to signal when the
> > hardware
> > =C2=A0 * has died, which can mean that there's no valid runqueue for a
> > @entity.
> > =C2=A0 * This function returns -ENOENT in this case (which probably
> > should be -EIO as
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index ab161289d1bf..95e17504e46a 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -340,6 +340,14 @@ struct drm_sched_fence
> > *to_drm_sched_fence(struct dma_fence *f);
> > =C2=A0struct drm_sched_job {
> > =C2=A0=09struct spsc_node=09=09queue_node;
> > =C2=A0=09struct list_head=09=09list;
> > +
> > +=09/**
> > +=09 * @sched:
> > +=09 *
> > +=09 * The scheduler this job is or will be scheduled on. Gets
> > set by
> > +=09 * drm_sched_job_arm(). Valid until
> > drm_sched_backend_ops.free_job()
> > +=09 * has finished.
> > +=09 */
> > =C2=A0=09struct drm_gpu_scheduler=09*sched;
> > =C2=A0=09struct drm_sched_fence=09=09*s_fence;
> > =C2=A0
> > --=20
> > 2.47.0
> >=20
>=20

