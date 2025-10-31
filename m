Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F69C245DE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4837910EAED;
	Fri, 31 Oct 2025 10:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="k88e6phy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163F210EAED
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:10:46 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cycDy4PDqz9srd;
 Fri, 31 Oct 2025 11:10:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761905442; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oX/fzg/n5SwFz0Vlx5NQrJ0TysuKtNx7wJbpBrBb7Gc=;
 b=k88e6phyFxYs99l4k8KsioLz4O6ef0gXmbm7ITVuJtXtCZFyS6hh5TuF2Wy4FSI47MQ7Qs
 BojqW1hz38sMglZAjHmtgA5sjHCPmPZpIQACSUq3b2X1E9qCbpGn8of51w3XJ+6K71rikJ
 wTZIflBggUbfO8UJAZsvA0eVsj4cUZQ+8f4ErjEwIxtlBzS89ZNupA3/pSaw9yAPDitzkC
 Xi9F/4ib5T4bDtLSlh+df9wQWuHntf0FxccAqK7meDkTwJUhNw8zObwVifxfhR2ZWTBiOW
 UYbTrs6EThAQDGrh4oJr6Oy7eH6cMqKqaH1SDLpw9Parot2qehFDrs8imKTr1g==
Message-ID: <a243e68704eda067bd18458aa41452d1da220d68.camel@mailbox.org>
Subject: Re: [PATCH 1/2] drm/sched: Fix comment in drm_sched_run_job_work()
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  tursulin@ursulin.net,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Fri, 31 Oct 2025 11:10:38 +0100
In-Reply-To: <aQJG1/izCBbNnX0a@lstrano-desk.jf.intel.com>
References: <20251028134602.94125-2-phasta@kernel.org>
 <20251028134602.94125-3-phasta@kernel.org>
 <aQJG1/izCBbNnX0a@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: d0c2776e058c22ecbae
X-MBO-RS-META: yjw8d48kozfrob7ej5igbn3qmsdok7rq
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

On Wed, 2025-10-29 at 09:54 -0700, Matthew Brost wrote:
> On Tue, Oct 28, 2025 at 02:46:01PM +0100, Philipp Stanner wrote:
> > drm_sched_run_job_work() contains a comment which explains that an
> > entity being NULL means that there is no more work to do. It can,
> > however, also mean that there is work, but the scheduler doesn't have
> > enough credits to process the jobs right now.
> >=20
> > Provide this detail in the comment.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Applied to drm-misc-next.
Dropped the other patch.

Thx
P.

>=20
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 9 +++++++--
> > =C2=A01 file changed, 7 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index c39f0245e3a9..492e8af639db 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1237,8 +1237,13 @@ static void drm_sched_run_job_work(struct work_s=
truct *w)
> > =C2=A0
> > =C2=A0	/* Find entity with a ready job */
> > =C2=A0	entity =3D drm_sched_select_entity(sched);
> > -	if (!entity)
> > -		return;	/* No more work */
> > +	if (!entity) {
> > +		/*
> > +		 * Either no more work to do, or the next ready job needs more
> > +		 * credits than the scheduler has currently available.
> > +		 */
> > +		return;
> > +	}
> > =C2=A0
> > =C2=A0	sched_job =3D drm_sched_entity_pop_job(entity);
> > =C2=A0	if (!sched_job) {
> > --=20
> > 2.49.0
> >=20

