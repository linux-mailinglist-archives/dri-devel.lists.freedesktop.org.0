Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB14C8DE2B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 12:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D12A10E7DC;
	Thu, 27 Nov 2025 11:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="oMi9F5El";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB8810E7DC;
 Thu, 27 Nov 2025 11:03:04 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dHD6r3Bzxz9v5v;
 Thu, 27 Nov 2025 12:03:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764241380; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkRMHtw9LQhelvy8nQcY+tYagsQhskeVABbtwsvV00Y=;
 b=oMi9F5El+OpUch+Gi4hytlmOMl2bv1Je1wsVIt9uEiAVz6wAiyj7CiAfraLDlzz7gZ2VRR
 PeKccneWRm9Uht4Ji7ZCgf3UADmDg0NaR5A2JKg+lUIgbm4O18NIkOrQYlyQ1S2PdEMAh9
 SSepFM0lTu/xIIWp0k3ql6+VC098HcPiNfHmyp8gMMR+oGpVXfZgzalrC33vGgD6Sazmwk
 sQA6qbJspaOvCr4hTzOKD0fPs4nnKILkMfyjLeEAUqSbe1jmf3n2dRFNw6AtgywDmSM0Ky
 5Tzg3wFb8pPlP1TR2GsKpxBaSjXBSUCNIv3g5OZqR4wuydcCbEk3zqUaavI0ww==
Message-ID: <5acfa08453fa07329191fa9cca04be0f5cc5dfc5.camel@mailbox.org>
Subject: Re: [PATCH 11/18] drm/amdgpu: independence for the
 amdgpu_eviction_fence!
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 sumit.semwal@linaro.org
Date: Thu, 27 Nov 2025 12:02:52 +0100
In-Reply-To: <20251113145332.16805-12-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-12-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 0f36c905572b1830480
X-MBO-RS-META: g5y64tcnr7qjwojf6ntt51xizdx5ftzf
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

On Thu, 2025-11-13 at 15:51 +0100, Christian K=C3=B6nig wrote:
> This should allow amdgpu_fences to outlive the amdgpu module.

amdgpu_eviction_fences you mean.

And I would drop the "should" from this and the previous patch. We're
confident it works, aren't we? ^^'

P.

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c | 3 +--
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h | 1 -
> =C2=A02 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> index 23d7d0b0d625..95ee22c43ceb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> @@ -167,9 +167,8 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_f=
ence_mgr *evf_mgr)
> =C2=A0
> =C2=A0	ev_fence->evf_mgr =3D evf_mgr;
> =C2=A0	get_task_comm(ev_fence->timeline_name, current);
> -	spin_lock_init(&ev_fence->lock);
> =C2=A0	dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
> -			 &ev_fence->lock, evf_mgr->ev_fence_ctx,
> +			 NULL, evf_mgr->ev_fence_ctx,
> =C2=A0			 atomic_inc_return(&evf_mgr->ev_fence_seq));
> =C2=A0	return ev_fence;
> =C2=A0}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
> index fcd867b7147d..fb70efb54338 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
> @@ -27,7 +27,6 @@
> =C2=A0
> =C2=A0struct amdgpu_eviction_fence {
> =C2=A0	struct dma_fence base;
> -	spinlock_t	 lock;
> =C2=A0	char		 timeline_name[TASK_COMM_LEN];
> =C2=A0	struct amdgpu_eviction_fence_mgr *evf_mgr;
> =C2=A0};

