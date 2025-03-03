Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B8A4C43F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2BF10E447;
	Mon,  3 Mar 2025 15:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="elETcbPU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E800D10E447
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:07:53 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Z62HT1VSpz9smd;
 Mon,  3 Mar 2025 16:07:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741014469; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iBPG7n3y2ClZ2gcQ+yvlN/v5j78/gLYozFYU3F5P0Y0=;
 b=elETcbPUqQjzpuHyP6HpebsY9gnWeh3HERipnbBAhNYo9sQstsrwakLHdSTDKKp16wdTo8
 qeL3DWFbwyrneUCCk3OYiFu4V3PhGceZXbOoc9nLnDa3O9CORAcNb7OA6klv3k3XNhuxVg
 bfGHf2cF00+Z4cwdx5c/077twrzjpHKsWNvh4UDjyACWgStQQcbqwd0+AXwCRheHiLyCJ4
 LuYtA49atdNOWRYAsmxsqkWtC0T7tClSM37rjsurV+eDxvXMR4p2yCToKsMCQnbWPm/6Dh
 ywR/ZWfrpe3UqiiESoUf7N7IU0v7oh7zQ6npAm+8j3SGzsS1Nu9U15PgERDGlg==
Message-ID: <3d4fc7d979ef0b22422f18de073be87e69ad92b5.camel@mailbox.org>
Subject: Re: [RFC PATCH] drm/sched: Fix preprocessor guard
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 03 Mar 2025 16:07:45 +0100
In-Reply-To: <20250218124149.118002-2-phasta@kernel.org>
References: <20250218124149.118002-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: jomof6fq3cjhps7rdk5urqj9ef731461
X-MBO-RS-ID: 56e81f524ec96604943
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

On Tue, 2025-02-18 at 13:41 +0100, Philipp Stanner wrote:
> When writing the header guard for gpu_scheduler_trace.h, a typo,
> apparently, occurred.
>=20
> Fix the typo and document the scope of the guard.
>=20
> Fixes: 353da3c520b4 ("drm/amdgpu: add tracepoint for scheduler (v2)")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Applied to drm-misc-fixes with Tvrtko's RB

> ---
> I just discovered this. But I have little understanding of what is
> going
> on in this header in the first place, so I kindly ask for comments on
> this entire guard line with its logical or ||
>=20
> The code hasn't been touched since 2015. So it seems it at least
> didn't
> cause bugs.
>=20
> P.
> ---
> =C2=A0drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index c75302ca3427..f56e77e7f6d0 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -21,7 +21,7 @@
> =C2=A0 *
> =C2=A0 */
> =C2=A0
> -#if !defined(_GPU_SCHED_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#if !defined(_GPU_SCHED_TRACE_H_) ||
> defined(TRACE_HEADER_MULTI_READ)
> =C2=A0#define _GPU_SCHED_TRACE_H_
> =C2=A0
> =C2=A0#include <linux/stringify.h>
> @@ -106,7 +106,7 @@ TRACE_EVENT(drm_sched_job_wait_dep,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->seqno)
> =C2=A0);
> =C2=A0
> -#endif
> +#endif /* _GPU_SCHED_TRACE_H_ */
> =C2=A0
> =C2=A0/* This part must be outside protection */
> =C2=A0#undef TRACE_INCLUDE_PATH

