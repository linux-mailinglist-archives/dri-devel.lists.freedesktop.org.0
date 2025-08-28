Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5402BB39667
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B4F10E6CE;
	Thu, 28 Aug 2025 08:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Er8Ad8wu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C2E10E6CE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:10:28 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cCDbj3FFNz9syn;
 Thu, 28 Aug 2025 10:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1756368625; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIxjFAPIogHydW3kXnoKlWrzkt5c513vQ+eN/FvHh7k=;
 b=Er8Ad8wut3uk9QyFhXXr2Osrls5yFoMuZRBi22dUimNwdtyRzEkSpWDYT505QxFemmibwh
 hNTTxIeUlMWoAkWVnuhKFbI6bhxzB6ox0WIqV2Y6KUaruXiGkNF0TYsQMFKWTDnktv/6k1
 4moTpQLtM3FQFIDh+owp8C9m0dIL2buPiWlleXE5/ZB+/4xIbi/W4DfA05k9fNkX3GMiEF
 MADzLf9m4w+hJ8/Lal+noAGuhLtDzoYHVZNcM8UBnU256ciWviTj2yQ2t2oFSXVwDBcQD2
 tz1ilJ/GqJmnIGM+Pf4glo/vVr+yvQifFG6mkET0/00RFOWh7a7bK7CUjpqNdg==
Message-ID: <1b47130e1718a2b42e68a62dd469b81591d78901.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Remove mention of indirect buffers
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Thu, 28 Aug 2025 10:10:21 +0200
In-Reply-To: <20250814133627.2550-1-tvrtko.ursulin@igalia.com>
References: <20250814133627.2550-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 83eb379c75448be6f7a
X-MBO-RS-META: 7bwinfmjgtxbbm4nkgf19n4a679n3g9d
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

On Thu, 2025-08-14 at 14:36 +0100, Tvrtko Ursulin wrote:
> Indirect buffers are an AMD term describing essentialy a job submitted to
> the scheduler, just a lower level one. Since scheduler was promoted to be
> generic long ago, lets replace those references with jobs.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>

Applied to drm-misc-next

Thx
P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 14 +++++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 8867b95ab089..254932b9050e 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -285,9 +285,9 @@ long drm_sched_entity_flush(struct drm_sched_entity *=
entity, long timeout)
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	sched =3D entity->rq->sched;
> -	/**
> -	 * The client will not queue more IBs during this fini, consume existin=
g
> -	 * queued IBs or discard them on SIGKILL
> +	/*
> +	 * The client will not queue more jobs during this fini - consume
> +	 * existing queued ones, or discard them on SIGKILL.
> =C2=A0	 */
> =C2=A0	if (current->flags & PF_EXITING) {
> =C2=A0		if (timeout)
> @@ -300,7 +300,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *=
entity, long timeout)
> =C2=A0				=C2=A0=C2=A0=C2=A0 drm_sched_entity_is_idle(entity));
> =C2=A0	}
> =C2=A0
> -	/* For killed process disable any more IBs enqueue right now */
> +	/* For a killed process disallow further enqueueing of jobs. */
> =C2=A0	last_user =3D cmpxchg(&entity->last_user, current->group_leader, N=
ULL);
> =C2=A0	if ((!last_user || last_user =3D=3D current->group_leader) &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 (current->flags & PF_EXITING) && (current->exit=
_code =3D=3D SIGKILL))
> @@ -324,9 +324,9 @@ EXPORT_SYMBOL(drm_sched_entity_flush);
> =C2=A0void drm_sched_entity_fini(struct drm_sched_entity *entity)
> =C2=A0{
> =C2=A0	/*
> -	 * If consumption of existing IBs wasn't completed. Forcefully remove
> -	 * them here. Also makes sure that the scheduler won't touch this entit=
y
> -	 * any more.
> +	 * If consumption of existing jobs wasn't completed forcefully remove
> +	 * them. Also makes sure that the scheduler won't touch this entity any
> +	 * more.
> =C2=A0	 */
> =C2=A0	drm_sched_entity_kill(entity);
> =C2=A0

