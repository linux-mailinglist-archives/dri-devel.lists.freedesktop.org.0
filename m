Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E866D1C37
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662A610F18D;
	Fri, 31 Mar 2023 09:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B69710F190;
 Fri, 31 Mar 2023 09:27:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE4616265A;
 Fri, 31 Mar 2023 09:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DD6C433D2;
 Fri, 31 Mar 2023 09:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254827;
 bh=h8C/nCvQ95GrVt3vhY71TCmgTeCG4/uxqnWpxM7dCvc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dsTJ8rRVglkyMZumINEy8WnEYodYuNEhZ7bk1k65j6hRSt6A+H6HSIvwtd10Q7Pew
 mDw2gtHjx/Wcbcjzbkz+E4al5QovbvJmBTGuowMkfOeT3uswymaaryDuad3rt3skik
 5V5Bbv3qYCq7vivephtUFBGWG86wnCgaWebo/0f/p2rqGeM9esEDofWzKN7G+RpviI
 uGVW/qs5y+ADztJb7OtXuw83KGVnks7D3LZENOEVzA8BLUVYaq3VNB0jjOaOb5xHKz
 KUcG4WeYIOei20QDLzRmfFPg48kD4AHMaklv91+4SWntbuAwafm2Tk9Hkn2rRjV4B2
 yMfi7F7+H4KBw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 18/19] drm/amd/amdgpu/sdma_v6_0: Demote a bunch of
 half-completed function headers
Date: Fri, 31 Mar 2023 10:26:06 +0100
Message-Id: <20230331092607.700644-19-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331092607.700644-1-lee@kernel.org>
References: <20230331092607.700644-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Stanley Yang <Stanley.Yang@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:248: warning: Function parameter or member 'job' not described in 'sdma_v6_0_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:248: warning: Function parameter or member 'flags' not described in 'sdma_v6_0_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:945: warning: Function parameter or member 'timeout' not described in 'sdma_v6_0_ring_test_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:1124: warning: Function parameter or member 'ring' not described in 'sdma_v6_0_ring_pad_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:1175: warning: Function parameter or member 'vmid' not described in 'sdma_v6_0_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:1175: warning: Function parameter or member 'pd_addr' not described in 'sdma_v6_0_ring_emit_vm_flush'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Stanley Yang <Stanley.Yang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 40e6b22daa226..efea4ef30a787 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -233,7 +233,7 @@ static void sdma_v6_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 			amdgpu_ring_write(ring, ring->funcs->nop);
 }
 
-/**
+/*
  * sdma_v6_0_ring_emit_ib - Schedule an IB on the DMA engine
  *
  * @ring: amdgpu ring pointer
@@ -933,7 +933,7 @@ static int sdma_v6_0_ring_test_ring(struct amdgpu_ring *ring)
 	return r;
 }
 
-/**
+/*
  * sdma_v6_0_ring_test_ib - test an IB on the DMA engine
  *
  * @ring: amdgpu_ring structure holding ring information
@@ -1114,7 +1114,7 @@ static void sdma_v6_0_vm_set_pte_pde(struct amdgpu_ib *ib,
 	ib->ptr[ib->length_dw++] = count - 1; /* number of entries */
 }
 
-/**
+/*
  * sdma_v6_0_ring_pad_ib - pad the IB
  * @ib: indirect buffer to fill with padding
  *
@@ -1162,7 +1162,7 @@ static void sdma_v6_0_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
 			  SDMA_PKT_POLL_REGMEM_DW5_INTERVAL(4)); /* retry count, poll interval */
 }
 
-/**
+/*
  * sdma_v6_0_ring_emit_vm_flush - vm flush using sDMA
  *
  * @ring: amdgpu_ring pointer
-- 
2.40.0.348.gf938b09366-goog

