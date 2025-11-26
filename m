Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A09C8A2D2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C1310E61B;
	Wed, 26 Nov 2025 14:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="PE/GCtNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9224B10E61B;
 Wed, 26 Nov 2025 14:09:41 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dGhJf3tP1z9tcd;
 Wed, 26 Nov 2025 15:09:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764166178; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DmRHcXHYF1BHpb8VfMZZq6dar989WGMZcrYiKm4u1P4=;
 b=PE/GCtNFXUhbjzXJdWR/gD4m00NSINuH49EL55fKe7aGFUYC4Ge/PJf2Ma4cBbhjTKNffz
 2+z9XS0g/j0UO8gNWoHsABYoMxn+fw4dgv2jLNU0+IMV7GNFw0sMUVA0ts9KFjzP5/Ax58
 +GOEkRpMlv5VeHhX6w+bpMlRzQyW74iUlKtsK55fUO/oBriC4hYyV6B2dHx8sBN7GynYxv
 tRCctxkqNU0DvqURQ+i6raZDUFihHqWeJQd7mQLFA5VG4mqWgUaK9vo9gNqwrpzEYZL7QA
 BI+K9rzzkLvUQbN8xFGbt4lovABNKLUakNT+E9q9ZNwqWxClbUY8RPelnfWfWw==
Message-ID: <f74664fdf1cf0adba9a8b19b00db4823ee3f7f1b.camel@mailbox.org>
Subject: Re: [PATCH 0/6] dma-fence: Remove return code of dma_fence_signal()
 et al.
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,  Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Date: Wed, 26 Nov 2025 15:09:26 +0100
In-Reply-To: <48352d7e-5e43-4683-9f00-b77ae571d8f6@amd.com>
References: <20251126131914.149445-2-phasta@kernel.org>
 <48352d7e-5e43-4683-9f00-b77ae571d8f6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 9184d60e51ec9d03be1
X-MBO-RS-META: ppa4nssdwpc8dthds1b9du1r4cc734jt
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

On Wed, 2025-11-26 at 15:02 +0100, Christian K=C3=B6nig wrote:
> On 11/26/25 14:19, Philipp Stanner wrote:
> > Barely anyone uses dma_fence_signal()'s (and similar functions') return
> > code. Checking it is pretty much useless anyways, because what are you
> > going to do if a fence was already signal it? Unsignal it and signal it
> > again? ;p
>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for the enti=
re series.
>=20
> Please push to drm-misc-next or leave me a note when I should pick it up.

Thx! I can push it. Let's wait a while to see if some of the other
folks have sth to say.

>=20
> > Removing the return code simplifies the API and makes it easier for me
> > to sit on top with Rust DmaFence.
>=20
> BTW, I have an rb for embedding the lock and I'm now writing test cases.
>=20
> When that is done you should be able to base the Rust DmaFence abstractio=
n on that as well.

Yeah, thank you, that will actually help since I was in the process of
solving the same life time issues in Rust.

I will give your series a review ~tomorrow, too. Or should I wait for
v4 with the tests?

P.

>=20
> Regards,
> Christian.
>=20
> >=20
> > Philipp Stanner (6):
> > =C2=A0 dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
> > =C2=A0 amd/amdkfd: Ignore return code of dma_fence_signal()
> > =C2=A0 drm/gpu/xe: Ignore dma_fenc_signal() return code
> > =C2=A0 dma-buf: Don't misuse dma_fence_signal()
> > =C2=A0 drm/ttm: Remove return check of dma_fence_signal()
> > =C2=A0 dma-buf/dma-fence: Remove return code of signaling-functions
> >=20
> > =C2=A0drivers/dma-buf/dma-fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
59 ++++++-------------
> > =C2=A0drivers/dma-buf/st-dma-fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +--
> > =C2=A0drivers/gpu/drm/amd/amdkfd/kfd_process.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 5 +-
> > =C2=A0.../gpu/drm/ttm/tests/ttm_bo_validate_test.c=C2=A0 |=C2=A0 3 +-
> > =C2=A0drivers/gpu/drm/xe/xe_hw_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
> > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 33 ++++++++---
> > =C2=A06 files changed, 53 insertions(+), 59 deletions(-)
> >=20
>=20

