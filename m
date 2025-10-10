Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7053BCD005
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 15:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEBE10EBF5;
	Fri, 10 Oct 2025 13:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="IrxOznIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C44010EBF5;
 Fri, 10 Oct 2025 13:00:36 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cjn0c10kdz9syH;
 Fri, 10 Oct 2025 15:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760101232; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TLIhDU/p+IflmAdqbIOQxZ/XHaPTSJJIRgHYZPVXxSk=;
 b=IrxOznIyKyysWbmObTYvoiH845IbhzpA6l72vSYF2GoOagWDeXfT5TWY0spiVju4BEvGEU
 2qRQNnLEMRjOIs6Yz9VTwI2xNRaQK2pBwjaesON6jDEquBopPkNn6tRXGS37SYk7ZuA6T4
 +6cURS6Jc1RUrg8JkjrvrRa1TornwZGfspM1gYIFxGq9E+wWu2ZkTyCH7h1arIO9S1USWI
 TrlRrnipA6IWobuhPfj6IQ9dsoT3xCt1ys4SMznYFGJs81XoCpzEks7J40k89cgyfgC5j3
 LWsVC2XYgt6MovCnpXv+EPgokJiORpVBo2rM29DTDdcNkFqWENr7itd3Npvxvw==
Message-ID: <c45f98141507f25e4bf7d22a99a63ac048071bd2.camel@mailbox.org>
Subject: Re: [PATCH 28/28] drm/sched: Remove drm_sched_init_args->num_rqs
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Fri, 10 Oct 2025 15:00:25 +0200
In-Reply-To: <20251008085359.52404-29-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-29-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: rffjtbziqsi7x5p4qcm6u6iywdm7nfss
X-MBO-RS-ID: b4b61756596c27f9b73
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

On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
> Remove member no longer used by the scheduler core.

"scheduler core and all drivers."

Apart from that, very nice that we can simplify the init-interface.

P.

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0include/drm/gpu_scheduler.h | 3 ---
> =C2=A01 file changed, 3 deletions(-)
>=20
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 21129c98ce56..910c43fedcb9 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -607,8 +607,6 @@ struct drm_gpu_scheduler {
> =C2=A0 * @ops: backend operations provided by the driver
> =C2=A0 * @submit_wq: workqueue to use for submission. If NULL, an ordered=
 wq is
> =C2=A0 *	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocated and used.
> - * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORIT=
Y_COUNT,
> - *	=C2=A0=C2=A0=C2=A0=C2=A0 as there's usually one run-queue per priorit=
y, but may be less.
> =C2=A0 * @credit_limit: the number of credits this scheduler can hold fro=
m all jobs
> =C2=A0 * @hang_limit: number of times to allow a job to hang before dropp=
ing it.
> =C2=A0 *		This mechanism is DEPRECATED. Set it to 0.
> @@ -622,7 +620,6 @@ struct drm_sched_init_args {
> =C2=A0	const struct drm_sched_backend_ops *ops;
> =C2=A0	struct workqueue_struct *submit_wq;
> =C2=A0	struct workqueue_struct *timeout_wq;
> -	u32 num_rqs;
> =C2=A0	u32 credit_limit;
> =C2=A0	unsigned int hang_limit;
> =C2=A0	long timeout;

