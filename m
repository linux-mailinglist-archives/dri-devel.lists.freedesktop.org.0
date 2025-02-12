Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F534A3262C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 13:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A919D10E323;
	Wed, 12 Feb 2025 12:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="j5pBgvZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DD810E323
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 12:48:33 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YtJ5T3Wp4z9sS2;
 Wed, 12 Feb 2025 13:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1739364509; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDhW1xwyL7isb9C2EmKd1PTwPrB+uBSZBAvwvbLxlsU=;
 b=j5pBgvZCJxV57HJTeE5y2LPp56nXHIwxZvfgLlKWmkys1ydTVzWJfzON5zgpGilZdlArp3
 rM3s/1WXQZAXcYlZftjqV2NmRMyPXh5OYim9lkb7Rhv9458jFeas8V/s7iemMO2jdZLyBD
 iZwg4EoadKFcSWldNTTmJPYn8A3kv7CIcgg8onJ8o/yGo1k2WivmsqZa7tJt757sCLfhQ7
 T+tGLnR3bPcwtPVD+mCVbNPaMYtQ0+lFxpVbZcp6/VZNTXa2UqZEjdblIvom6SG88kdB9d
 8sgUYqjBQjLJogg9rQSJP5u7/aVvZKNudWR0SqneomklpOur0COijAj1kSwbcQ==
Message-ID: <25ea7d23e7b778a0c2372cc2bbc87fc2b3742dca.camel@mailbox.org>
Subject: Re: [PATCH v3 0/3] drm/sched: Documentation and refcount improvements
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 12 Feb 2025 13:48:25 +0100
In-Reply-To: <20250207123652.27677-2-phasta@kernel.org>
References: <20250207123652.27677-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: hthkmhf8qheg5okcazx6mxy5af9jigei
X-MBO-RS-ID: ed3e673e6865dc3df69
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

On Fri, 2025-02-07 at 13:36 +0100, Philipp Stanner wrote:
> Changes in v3:
> =C2=A0 - timedout_job(): various docu wording improvements. (Danilo)
> =C2=A0 - Use the term "ring" consistently. (Danilo)
> =C2=A0 - Add fully fledged docu for enum drm_gpu_sched_stat. (Danilo)
>=20
> Changes in v2:
> =C2=A0 - Document what run_job() is allowed to return. (Tvrtko)
> =C2=A0 - Delete confusing comment about putting the fence. (Danilo)
> =C2=A0 - Apply Danilo's RB to patch 1.
> =C2=A0 - Delete info about job recovery for entities in patch 3. (Danilo,
> me)
> =C2=A0 - Set the term "ring" as fix term for both HW rings and FW rings. =
A
> =C2=A0=C2=A0=C2=A0 ring shall always be the thingy on the CPU ;) (Danilo)
> =C2=A0 - Many (all) other comments improvements in patch 3. (Danilo)
>=20
> This is as series succeeding my previous patch [1].
>=20
> I recognized that we are still referring to a non-existing function
> and
> a deprecated one in the callback docu. We should probably also point
> out
> the important distinction between hardware and firmware schedulers
> more
> cleanly.
>=20
> Please give me feedback, especially on the RFC comments in patch3.
>=20
> (This series still fires docu-build-warnings. I want to gather
> feedback
> on the opion questions first and will solve them in v2.)
>=20
> Thank you,
> Philipp
>=20
> [1]
> https://lore.kernel.org/all/20241220124515.93169-2-phasta@kernel.org/
>=20
> Philipp Stanner (3):
> =C2=A0 drm/sched: Document run_job() refcount hazard
> =C2=A0 drm/sched: Adjust outdated docu for run_job()
> =C2=A0 drm/sched: Update timedout_job()'s documentation

I would like to pull this in soonish, since I think pushback is
unlikely?

RBs for the last two patches by someone would be nice, though.

P.


>=20
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c |=C2=A0=C2=A0 5 +-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 109 ++++++++++++++++-------
> --
> =C2=A02 files changed, 74 insertions(+), 40 deletions(-)
>=20

