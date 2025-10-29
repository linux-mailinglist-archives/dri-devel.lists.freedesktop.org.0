Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDBAC18B1D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9F410E6F8;
	Wed, 29 Oct 2025 07:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hf/93c7P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF8810E6F8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:30:57 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cxJnT6ZF8z9tSV;
 Wed, 29 Oct 2025 08:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761723053; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dc/nHQJ01/k3r4k37WvJJ6sn+d52mPfesqmqjpSbQFU=;
 b=hf/93c7PuLW8msZp53XX2GgIOcde7vWqwZCDjevZDuox54GHsQcAGLizWY2LJy//9wp11H
 5F/3eNrBC+E4lJ+nzFrmv+1miVPGMXmCAmAcw+u89yzFDhHopvrM9UqpaRWtdDJ6+Jd5Fl
 Sm2WZRSmFwboyRaCScCGey7n1klbdre2BSqyeJrfVaj3ML7HpYsbYmPUIYY6W6wFDZbqQl
 kHGqKsoozkEys2IR7QWMtuJl/UBlOYqaidFtMe01YL1BULrqVfreed6HRe7jfFuPWCt/HS
 buRHmRR58Xzt5Wqeq5y88yz7kj6k1RhA86LWH4SQGxUFSx9q+SB5vBR2ZDoaxw==
Message-ID: <2e08b320a9d81faee6d1ec2a3fe8a1df6773c8f6.camel@mailbox.org>
Subject: Re: [PATCH 2/2] drm/sched: Add FIXME detailing potential hang
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  tursulin@ursulin.net,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Wed, 29 Oct 2025 08:30:48 +0100
In-Reply-To: <aQEc5eUR8bq+XNG1@lstrano-desk.jf.intel.com>
References: <20251028134602.94125-2-phasta@kernel.org>
 <20251028134602.94125-4-phasta@kernel.org>
 <aQEc5eUR8bq+XNG1@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 231303fb3b5f76a16db
X-MBO-RS-META: qtg7zkqcp5wj9caew7eose6iunjn1qdi
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2025-10-28 at 12:43 -0700, Matthew Brost wrote:
> On Tue, Oct 28, 2025 at 02:46:02PM +0100, Philipp Stanner wrote:
> > If a job from a ready entity needs more credits than are currently
> > available, drm_sched_run_job_work() (a work item) simply returns and
> > doesn't reschedule itself. The scheduler is only woken up again when th=
e
> > next job gets pushed with drm_sched_entity_push_job().
> >=20
> > If someone submits a job that needs too many credits and doesn't submit
> > more jobs afterwards, this would lead to the scheduler never pulling th=
e
> > too-expensive job, effectively hanging forever.
> >=20
> > Document this problem as a FIXME.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++++++
> > =C2=A01 file changed, 10 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 492e8af639db..eaf8d17b2a66 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1237,6 +1237,16 @@ static void drm_sched_run_job_work(struct work_s=
truct *w)
> > =C2=A0
> > =C2=A0	/* Find entity with a ready job */
> > =C2=A0	entity =3D drm_sched_select_entity(sched);
> > +	/*
> > +	 * FIXME:
> > +	 * The entity can be NULL when the scheduler currently has no capacit=
y
> > +	 * (credits) for more jobs. If that happens, the work item terminates
> > +	 * itself here, without rescheduling itself.
> > +	 *
> > +	 * It only gets started again in drm_sched_entity_push_job(). IOW, th=
e
> > +	 * scheduler might hang forever if a job that needs too many credits
> > +	 * gets submitted to an entity and no other, subsequent jobs are.
> > +	 */
>=20
> drm_sched_job_done frees the credits, which triggers
> drm_sched_free_job_work, and that in turn triggers
> drm_sched_run_job_work.

Sounds correct to me.

We can still merge #1, though, for a bit more clearness.

P.
