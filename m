Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5605BCA3F24
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 15:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A287D10E029;
	Thu,  4 Dec 2025 14:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="B8+o1niV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C206E10E029;
 Thu,  4 Dec 2025 14:10:36 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dMby10gV1z9tV8;
 Thu,  4 Dec 2025 15:10:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764857433; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETFPcwGc/J2gqxbT5eNzy5JQ7vh5rybLlhQczEy0HVs=;
 b=B8+o1niVzxQD7p2rFN3T9F93gW94B6fyBYvTVWNbzRp9/C8r5mhaT1J1aETTXwAwnh7tzE
 zmpFQQ/DeaZ5t6zd9AmJk5Mhar5qihcJqpcqZk1qFLr6WImByk/iA39iQoyXLtBTxQT5TY
 iYfiggT/0Zi9qF/iYFKoTBHGv18jC83gNUUXz79P5Vz6p8NY8DWX7Eb4NkBb26haaNgNRk
 BKI8JM/cc0X/flp4oSoFnR0NAktiaBUZRQBUsXPf/CGQkcOObo0/v3DGftTe6PTX2l8eBV
 RB6zemkjeNOAAi7TgMACkk42o2kDGraRnxK5hMUj9ORbOkPQ2sgbLJFadbZ21A==
Message-ID: <53354e12b55d7c558b4418d876598641d862737f.camel@mailbox.org>
Subject: Re: [PATCH 0/6] dma-fence: Remove return code of dma_fence_signal()
 et al.
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Gustavo Padovan <gustavo@padovan.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Felix
 Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>,  Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Thu, 04 Dec 2025 15:10:11 +0100
In-Reply-To: <20251201105011.19386-2-phasta@kernel.org>
References: <20251201105011.19386-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: b1b04ac58f4f528a2cf
X-MBO-RS-META: xix6kpmj83m8hwiqzjwsu31pur87u4tw
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

On Mon, 2025-12-01 at 11:50 +0100, Philipp Stanner wrote:
> Tested this with dma_buf selftests and drm_sched tests.
>=20
> Changes in v2:
> =C2=A0 - Fix bug and don't turn the kernel into a smoking pile of ashes b=
y
> =C2=A0=C2=A0=C2=A0 not setting the signaled-bit=E2=80=A6
> =C2=A0 - Add functions (dma_fence_check_and_signal()) preserving the old
> =C2=A0=C2=A0=C2=A0 behavior of dma_fence_signal() & Co. (Felix)
> =C2=A0 - Use those new functions in amdkfd, xe, ttm and st-dma-fence.
> =C2=A0 - Be a bit less aggressive and keep the git-diff smaller.
> =C2=A0 - Add a patch using the flag-helper in Xe. (Matthew)
>=20
> Barely anyone uses dma_fence_signal()'s (and similar functions') return
> code. Checking it is pretty much useless anyways, because what are you
> going to do if a fence was already signal it? Unsignal it and signal it
> again? ;p
>=20
> Removing the return code simplifies the API and makes it easier for me
> to sit on top with Rust DmaFence.
>=20
> Philipp Stanner (8):
> =C2=A0 dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
> =C2=A0 dma-buf/dma-fence: Add dma_fence_check_and_signal()
> =C2=A0 amd/amdkfd: Use dma_fence_check_and_signal()
> =C2=A0 drm/xe: Use dma_fence_check_and_signal_locked()
> =C2=A0 dma-buf: Don't misuse dma_fence_signal()
> =C2=A0 drm/ttm: Use dma_fence_check_and_signal()
> =C2=A0 dma-buf/dma-fence: Remove return code of signaling-functions

Applied those 7 patches to drm-misc-next. Had to do a tiny rebase
because 033559473dd3b55558b535aa37b8848c207b5cbb is not yet in drm-
misc-next (dma-fence series was based on master at first, which
contains that commit).

> =C2=A0 drm/xe: Use dma_fence_test_signaled_flag()

Left for Matthow to pick up whenever he wishes.


P.

>=20
> =C2=A0drivers/dma-buf/dma-fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 100=
 +++++++++++-------
> =C2=A0drivers/dma-buf/st-dma-fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/amd/amdkfd/kfd_process.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0.../gpu/drm/ttm/tests/ttm_bo_validate_test.c=C2=A0 |=C2=A0=C2=A0 2 =
+-
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0drivers/gpu/drm/xe/xe_hw_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 35 ++++--
> =C2=A09 files changed, 102 insertions(+), 63 deletions(-)
>=20

