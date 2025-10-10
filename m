Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD29BCD002
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 14:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942C410EB5F;
	Fri, 10 Oct 2025 12:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sibVjNwJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF61110EB5F;
 Fri, 10 Oct 2025 12:57:03 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cjmwX0WxCz9sxM;
 Fri, 10 Oct 2025 14:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760101020; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NL5X1tBaJ9jPKPIL3oNlgWi45ET2UE+XY381u8nAaC4=;
 b=sibVjNwJzbVJpj46UWewdpvffOCkt1wVxLi5UhpsLDkYCuCLhXmWZYAFpxF6be0X/RhbZB
 nSXmDj1UaERYmX6oX7rEcIPHDJE5nE6K91rfv4oSGrKI+VozdyxUmaSmjq3OHm/L6UNUnr
 hdxxdS0XDYH6k3havGxGg1nVxhXTkPCy88dpilX83BW74ZyGdfoj4LJGQFq+pgmAhwKomF
 Qku46Rm0qm02Hc+I2+Z0f5JjqpuawEQ4dXU+WjzZ0J1NY7klJK5a27zfJAUUEJCsD7LgoG
 L+Qf8KgMtN2oMC4Hyfkj2t1O4E25eMvKVHnFUOcj+OUDhagWxMZ/G4GuqknM5A==
Message-ID: <e4c766549e0e627cfc81cf44914a157d2a881112.camel@mailbox.org>
Subject: Re: [PATCH 12/28] drm/sched: Switch default policy to fair
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>
Date: Fri, 10 Oct 2025 14:56:56 +0200
In-Reply-To: <20251008085359.52404-13-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-13-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: f1c3fefa1933db853de
X-MBO-RS-META: j5ia4bs33owhskeyqe4gz9poxn76fc3b
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

s/fair/FAIR

On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
> Fair policy works better than FIFO for all known use cases and either

s/Fair/FAIR

> matches or gets close to RR. Lets make it a default to improve the user
> experience especially with interactive workloads competing with heavy
> clients.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

I hope that we'll see an a-b or two here from some of the driver folks
to see that they're aware of this coming.

@Christian, @Alex (+Cc)
Your driver is the main benefactor from this series, so your blessing
for FAIR would be neat.

P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 204d99c6699f..858fc28e91e4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -84,7 +84,7 @@
> =C2=A0#define CREATE_TRACE_POINTS
> =C2=A0#include "gpu_scheduler_trace.h"
> =C2=A0
> -int drm_sched_policy =3D DRM_SCHED_POLICY_FIFO;
> +int drm_sched_policy =3D DRM_SCHED_POLICY_FAIR;
> =C2=A0
> =C2=A0/**
> =C2=A0 * DOC: sched_policy (int)

