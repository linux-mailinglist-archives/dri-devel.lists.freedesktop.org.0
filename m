Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAC27868A3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E2A10E4B0;
	Thu, 24 Aug 2023 07:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCCB10E496
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 07:38:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2276A65AF5;
 Thu, 24 Aug 2023 07:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69CD6C433CA;
 Thu, 24 Aug 2023 07:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692862698;
 bh=qTc11hboeB2aZlOqkN91NN/Dw5CZWbyrOr80wSzYNm4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JvZadWCEBYotqkspkGwfoN/lfsikJ/T6fYB+lxsBQ4+b/7xuDAS+euYAqFWJjjorV
 nJaf7bDOyNhZLRm3jEvgi+JdXdxxzS9roTINN1HfZo41vRV8EC4z/4GLmh1r3q/RAT
 gwV4hMG5CwA6dEYGxHZe7CV7AYsnuIf7L1K2fVUfHwsFcPxScxjf8LE9ya9ZtVuewB
 7I8t1tgs8gXolFV3dApvgXNSvl5c9lqSMMkqraj0/2d3Werd/kFOz6G6cKvASlNYXe
 uJw42JOzUyihKE3BMX638v9Uw9GDCzksJVdFaGOIElhLbpHTxhaocarxF+4KPLuNti
 pOPqUkbedTifg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 18/20] drm/drm_gpuva_mgr: Remove set but unused variable 'prev'
Date: Thu, 24 Aug 2023 08:37:03 +0100
Message-ID: <20230824073710.2677348-19-lee@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824073710.2677348-1-lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/drm_gpuva_mgr.c: In function ‘__drm_gpuva_sm_map’:
 drivers/gpu/drm/drm_gpuva_mgr.c:1079:39: warning: variable ‘prev’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Lee Jones <lee@kernel.org>
---
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/drm_gpuva_mgr.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index f86bfad74ff8a..ad99c9cfedac7 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -1076,7 +1076,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 		   u64 req_addr, u64 req_range,
 		   struct drm_gem_object *req_obj, u64 req_offset)
 {
-	struct drm_gpuva *va, *next, *prev = NULL;
+	struct drm_gpuva *va, *next;
 	u64 req_end = req_addr + req_range;
 	int ret;
 
@@ -1106,7 +1106,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
 					return ret;
-				goto next;
+				continue;
 			}
 
 			if (end > req_end) {
@@ -1151,7 +1151,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 				ret = op_remap_cb(ops, priv, &p, NULL, &u);
 				if (ret)
 					return ret;
-				goto next;
+				continue;
 			}
 
 			if (end > req_end) {
@@ -1184,7 +1184,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
 					return ret;
-				goto next;
+				continue;
 			}
 
 			if (end > req_end) {
@@ -1205,8 +1205,6 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 				break;
 			}
 		}
-next:
-		prev = va;
 	}
 
 	return op_map_cb(ops, priv,
-- 
2.42.0.rc1.204.g551eb34607-goog

