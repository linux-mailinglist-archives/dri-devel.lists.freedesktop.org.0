Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92E6BE30E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D6A10E3B1;
	Fri, 17 Mar 2023 08:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC5910E3B1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:22:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB4A562226;
 Fri, 17 Mar 2023 08:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C360DC4339E;
 Fri, 17 Mar 2023 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041350;
 bh=8O4QuVXZ8A7FPD2U3Nkc5z3et0F4wiZvDMcIjCSnRrM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eFRtBGLRKjUcF/Fmcq6iLIf9PZnd5LDpEdzQ9XUtmPUJ6sRagbrGGRXpHaG3imHGH
 Bq3kM6SuDzu3PbLQKYsvXgQ9ZJBXzvILzNflaVdYCFPjyb8eSaZC8pxiVXApiPx0g4
 McOn9BZAEk+AUF2P5lJvaWoLBUqz1ssWQ5etAFp2Wwz/ADI/wifmPBDzTXscksQkQ/
 yFjpejbFkT/DFTau934rCipSLC8TGVDmvUnPK6fVA8+qNQ3AUJdPd3tZNwQf/zgbrk
 U84/OY2UlThW72APAY69ocE46xCcN/HptNhEl0IySSBcRxOliPNW79TLQtGTfA/zA5
 gjipHLcERZYyw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/37] drm/ttm/ttm_bo: Provide a missing 'bulk' description
 and correct misnaming of 'placement'
Date: Fri, 17 Mar 2023 08:16:46 +0000
Message-Id: <20230317081718.2650744-6-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Huang Rui <ray.huang@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'bulk' description taken from another in the same file.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/ttm/ttm_bo.c:98: warning: Function parameter or member 'bulk' not described in 'ttm_bo_set_bulk_move'
 drivers/gpu/drm/ttm/ttm_bo.c:768: warning: Function parameter or member 'placement' not described in 'ttm_bo_mem_space'
 drivers/gpu/drm/ttm/ttm_bo.c:768: warning: Excess function parameter 'proposed_placement' description in 'ttm_bo_mem_space'

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 459f1b4440daa..d056d28f8758a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -84,6 +84,7 @@ EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
  * ttm_bo_set_bulk_move - update BOs bulk move object
  *
  * @bo: The buffer object.
+ * @bulk: bulk move structure
  *
  * Update the BOs bulk move object, making sure that resources are added/removed
  * as well. A bulk move allows to move many resource on the LRU at once,
@@ -748,7 +749,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
  *
  * @bo: Pointer to a struct ttm_buffer_object. the data of which
  * we want to allocate space for.
- * @proposed_placement: Proposed new placement for the buffer object.
+ * @placement: Proposed new placement for the buffer object.
  * @mem: A struct ttm_resource.
  * @ctx: if and how to sleep, lock buffers and alloc memory
  *
-- 
2.40.0.rc1.284.g88254d51c5-goog

