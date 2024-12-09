Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B49E8C0F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 08:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C72310E2B0;
	Mon,  9 Dec 2024 07:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ICx2dc+S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE9C10E2B0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 07:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FJFL04ANZY+UZvX//HiuWN5r5fRG4Nk8rKwyHcCcTb0=; b=ICx2dc+SentmqCYApYGE3JhEGE
 oNJCd4rc8XX7ydtBTETt69LS1iGdOjlIZZKhuQyJG3OodpWD9LRxBzipA7PyWUoDV4zxfFqqLqMeA
 EO/tj6FsoOfTT3GqXYt7pJvOMuoe78WznCNz8ArHA7n/Dbpt0jHqmpn5XAS35He9zcsTS1wdfgZAX
 UqHiY0bTG1UnOLOQaFeL2EUnjVmBSnPAzqXkK2+jcZCvnBQlP+SXam9LoFQGRwKjEFV7bMEds0nEM
 m7zRtb3iEHeR8KsAV54jDo+Y+1e5f2j8Yw0vGO1mshi6tci9/Sz7pNXaDvdb1wzFrxS9cx0BQGdwU
 E5rrhfow==;
Received: from static-165-28-84-188.ipcom.comunitel.net ([188.84.28.165]
 helo=[192.168.0.17]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tKY4D-000qZW-9F; Mon, 09 Dec 2024 08:20:29 +0100
Message-ID: <ad7573333e20629b09dcf8fa321f5ed5f90adf10.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Fix miscellaneous documentation errors
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Mon, 09 Dec 2024 08:20:18 +0100
In-Reply-To: <20241206153908.62429-1-mcanal@igalia.com>
References: <20241206153908.62429-1-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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

Thanks Ma=C3=ADra!

Acked-by: Iago Toral Quiroga <itoral@igalia.com>

El vie, 06-12-2024 a las 12:39 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> This commit fixes several miscellaneous documentation errors. Mostly,
> delete/update comments that are outdated or are leftovers from past
> code
> changes. Apart from that, remove double-spaces in several comments.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 ----
> =C2=A0drivers/gpu/drm/v3d/v3d_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
8 ++++----
> =C2=A0drivers/gpu/drm/v3d/v3d_performance_counters.h | 12 +++++-------
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++------
> =C2=A0drivers/gpu/drm/v3d/v3d_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++----
> =C2=A05 files changed, 20 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c
> b/drivers/gpu/drm/v3d/v3d_bo.c
> index 73ab7dd31b17..bb7815599435 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -13,10 +13,6 @@
> =C2=A0 * Display engines requiring physically contiguous allocations
> should
> =C2=A0 * look into Mesa's "renderonly" support (as used by the Mesa pl111
> =C2=A0 * driver) for an example of how to integrate with V3D.
> - *
> - * Long term, we should support evicting pages from the MMU when
> under
> - * memory pressure (thus the v3d_bo_get_pages() refcounting), but
> - * that's not a high priority since our systems tend to not have
> swap.
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/dma-buf.h>
> diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c
> b/drivers/gpu/drm/v3d/v3d_mmu.c
> index 0f564fd7160c..a25d25a8ae61 100644
> --- a/drivers/gpu/drm/v3d/v3d_mmu.c
> +++ b/drivers/gpu/drm/v3d/v3d_mmu.c
> @@ -4,7 +4,7 @@
> =C2=A0/**
> =C2=A0 * DOC: Broadcom V3D MMU
> =C2=A0 *
> - * The V3D 3.x hardware (compared to VC4) now includes an MMU.=C2=A0 It
> has
> + * The V3D 3.x hardware (compared to VC4) now includes an MMU. It
> has
> =C2=A0 * a single level of page tables for the V3D's 4GB address space to
> =C2=A0 * map to AXI bus addresses, thus it could need up to 4MB of
> =C2=A0 * physically contiguous memory to store the PTEs.
> @@ -15,14 +15,14 @@
> =C2=A0 *
> =C2=A0 * To protect clients from each other, we should use the GMP to
> =C2=A0 * quickly mask out (at 128kb granularity) what pages are available
> to
> - * each client.=C2=A0 This is not yet implemented.
> + * each client. This is not yet implemented.
> =C2=A0 */
> =C2=A0
> =C2=A0#include "v3d_drv.h"
> =C2=A0#include "v3d_regs.h"
> =C2=A0
> -/* Note: All PTEs for the 1MB superpage must be filled with the
> - * superpage bit set.
> +/* Note: All PTEs for the 64KB bigpage or 1MB superpage must be
> filled
> + * with the bigpage/superpage bit set.
> =C2=A0 */
> =C2=A0#define V3D_PTE_SUPERPAGE BIT(31)
> =C2=A0#define V3D_PTE_BIGPAGE BIT(30)
> diff --git a/drivers/gpu/drm/v3d/v3d_performance_counters.h
> b/drivers/gpu/drm/v3d/v3d_performance_counters.h
> index d919a2fc9449..2bc4cce0744a 100644
> --- a/drivers/gpu/drm/v3d/v3d_performance_counters.h
> +++ b/drivers/gpu/drm/v3d/v3d_performance_counters.h
> @@ -2,11 +2,12 @@
> =C2=A0/*
> =C2=A0 * Copyright (C) 2024 Raspberry Pi
> =C2=A0 */
> +
> =C2=A0#ifndef V3D_PERFORMANCE_COUNTERS_H
> =C2=A0#define V3D_PERFORMANCE_COUNTERS_H
> =C2=A0
> -/* Holds a description of a given performance counter. The index of
> performance
> - * counter is given by the array on v3d_performance_counter.h
> +/* Holds a description of a given performance counter. The index of
> + * performance counter is given by the array on
> `v3d_performance_counter.c`.
> =C2=A0 */
> =C2=A0struct v3d_perf_counter_desc {
> =C2=A0	/* Category of the counter */
> @@ -20,15 +21,12 @@ struct v3d_perf_counter_desc {
> =C2=A0};
> =C2=A0
> =C2=A0struct v3d_perfmon_info {
> -	/*
> -	 * Different revisions of V3D have different total number of
> +	/* Different revisions of V3D have different total number of
> =C2=A0	 * performance counters.
> =C2=A0	 */
> =C2=A0	unsigned int max_counters;
> =C2=A0
> -	/*
> -	 * Array of counters valid for the platform.
> -	 */
> +	/* Array of counters valid for the platform. */
> =C2=A0	const struct v3d_perf_counter_desc *counters;
> =C2=A0};
> =C2=A0
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index a6c3760da6ed..da08ddb01d21 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -5,16 +5,16 @@
> =C2=A0 * DOC: Broadcom V3D scheduling
> =C2=A0 *
> =C2=A0 * The shared DRM GPU scheduler is used to coordinate submitting
> jobs
> - * to the hardware.=C2=A0 Each DRM fd (roughly a client process) gets it=
s
> - * own scheduler entity, which will process jobs in order.=C2=A0 The GPU
> - * scheduler will round-robin between clients to submit the next
> job.
> + * to the hardware. Each DRM fd (roughly a client process) gets its
> + * own scheduler entity, which will process jobs in order. The GPU
> + * scheduler will schedule the clients with a FIFO scheduling
> algorithm.
> =C2=A0 *
> =C2=A0 * For simplicity, and in order to keep latency low for interactive
> =C2=A0 * jobs when bulk background jobs are queued up, we submit a new jo=
b
> =C2=A0 * to the HW only when it has completed the last one, instead of
> - * filling up the CT[01]Q FIFOs with jobs.=C2=A0 Similarly, we use
> - * drm_sched_job_add_dependency() to manage the dependency between
> bin and
> - * render, instead of having the clients submit jobs using the HW's
> + * filling up the CT[01]Q FIFOs with jobs. Similarly, we use
> + * `drm_sched_job_add_dependency()` to manage the dependency between
> bin
> + * and render, instead of having the clients submit jobs using the
> HW's
> =C2=A0 * semaphores to interlock between them.
> =C2=A0 */
> =C2=A0
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c
> b/drivers/gpu/drm/v3d/v3d_submit.c
> index 9e439c9f0a93..4ff5de46fb22 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -11,10 +11,11 @@
> =C2=A0#include "v3d_trace.h"
> =C2=A0
> =C2=A0/* Takes the reservation lock on all the BOs being referenced, so
> that
> - * at queue submit time we can update the reservations.
> + * we can attach fences and update the reservations after pushing
> the job
> + * to the queue.
> =C2=A0 *
> =C2=A0 * We don't lock the RCL the tile alloc/state BOs, or overflow
> memory
> - * (all of which are on exec->unref_list).=C2=A0 They're entirely privat=
e
> + * (all of which are on render->unref_list). They're entirely
> private
> =C2=A0 * to v3d, so we don't attach dma-buf fences to them.
> =C2=A0 */
> =C2=A0static int
> @@ -55,11 +56,11 @@ v3d_lock_bo_reservations(struct v3d_job *job,
> =C2=A0 * @bo_count: Number of GEM handles passed in
> =C2=A0 *
> =C2=A0 * The command validator needs to reference BOs by their index
> within
> - * the submitted job's BO list.=C2=A0 This does the validation of the
> job's
> + * the submitted job's BO list. This does the validation of the
> job's
> =C2=A0 * BO list and reference counting for the lifetime of the job.
> =C2=A0 *
> =C2=A0 * Note that this function doesn't need to unreference the BOs on
> - * failure, because that will happen at v3d_exec_cleanup() time.
> + * failure, because that will happen at `v3d_job_free()`.
> =C2=A0 */
> =C2=A0static int
> =C2=A0v3d_lookup_bos(struct drm_device *dev,

