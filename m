Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D464EBBF12F
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 21:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394C410E110;
	Mon,  6 Oct 2025 19:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OThpHShg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD3010E110
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 19:14:09 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3f44000626bso3396202f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759778048; x=1760382848; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D1fg5U/GyUHEUoYSW2uLA1ee/vFWzHy3xrE05+0l8NM=;
 b=OThpHShgpxfy9H2yL25ZSkGJKnK/xn9E4SPJm90hE3IiI5ibSuEuPWLy1wVWpvD+dl
 yalpBIlRLCNgOFlT2Utpy7NzqHPav+0FxA/UywmZh/rzUSs2CThWaF+UwG3mRt9VUxFY
 7zn7QxgxOr6Dqoo9M6iPWB7JlpD9VwsNhgo47fDHFyeYCTbaoXBsqnQHL1LgWDE63zGB
 zxWOCDbMRorUeDmFlolG1n+N70VXkLSWXPjwp8ho9g0rOTw7nERcBHW1dskDpg1bZbC2
 /tyL3WTxi8LxAQgI9iJjZZniycXHSavnjSbA9nxzlcDsEgJ+AUKucslN4kIkZJzpAF/P
 YqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759778048; x=1760382848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1fg5U/GyUHEUoYSW2uLA1ee/vFWzHy3xrE05+0l8NM=;
 b=kuWu3k0H1YIWjkC13ljXSAX2amajPsKmnbbznecbQMaYH9Kwi9QdkIhtqMWbMbp/LU
 tlPU71Nm3CbAPBGrejSdIyorU1EExcOiTXTrRR0Y7Dw6Bgu9t1GKCP0wwnuum8XPJCsi
 vRIXnreU6tAL/+jGMUq5P+qCH3EfnO2+nJnb11Gju+rEYPidhh8yMqnJfZsVk+oSdJdo
 MLrZk/zdkPWoQUcJ+IusYB4UePQ4eViFgvRL6vIBRY9Su13Uc/hRVXqZ87pHgKPE+1eZ
 lnoWfIdlgbJR8EXeKwvI+CcSn9znmdVKFILotdyFepalyg2bcCU8vDMFeL59NchQPoWW
 J79A==
X-Gm-Message-State: AOJu0YwurTP+sQkqcegNMbhSOHJNhtyYiWE+LV2V3bCcyAyoWXypWcZc
 dIndZE6woMS097EgCwp6VYkxkbObQMFcyu9esHz+rJUVwEHX0Re8b/NS
X-Gm-Gg: ASbGncuQatE6XVu5Zys/n3ISuTof5Pyg32+O8Lghd2XXinMvKtshDpcTHhb02XTMzs0
 R6/1Jy9LgDcz2osMMSxC89CQlOpmzIFA/eKhNVLZjLP+4j0t78GsLZZwKrsSPrLrj5VTDkCtXVJ
 qmygM1tsqQjv8ib10Xjf0db9y8xyLvT5xghDTYjfcNlOhucQ3jMyPm6+vSRSUHF9lff4RhEVjzd
 k9B+rOk+ORafyU5x+Tow3S+vVPS1XEzm6z6Nex15qpmKw1YlO84w5YrxPrtw0l0KAp0qtuLiO1r
 j7bfni4tfK6dcZzY1xnTph2WkK+2s+ONNlCebSRKTGedqqY/wMhdF+CHLlX8qBxR5kPnNClVzmz
 oh6indjWE0cUE4B14iZz4hvtiZbg0tfoDNoDSvfT+6UELcSKnBM3EA2YMlbJxQbWDXvcu
X-Google-Smtp-Source: AGHT+IF6rR0frEg/vaEMe0ANf9gzsCwVmoWQdq/B0a+98WReh9cKA0vT6dOHdfdyl59Refztc7ueSw==
X-Received: by 2002:a05:6000:2410:b0:3ff:d5c5:6b03 with SMTP id
 ffacd0b85a97d-425671952ecmr8137394f8f.35.1759778047749; 
 Mon, 06 Oct 2025 12:14:07 -0700 (PDT)
Received: from fedora ([154.182.208.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4256866060fsm16646435f8f.14.2025.10.06.12.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 12:14:06 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
Subject: [PATCH 1/5] drm/nouveau/uvmm: Prepare for larger pages
Date: Mon,  6 Oct 2025 22:13:24 +0300
Message-ID: <20251006191329.277485-2-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
References: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mary Guillemard <mary@mary.zone>

Currently memory allocated by VM_BIND uAPI can only have a  granuality
matching PAGE_SIZE (4KiB in common case)

To have a better memory management and to allow big (64KiB) and huge
(2MiB) pages later in the serie, we are now passing the page shift all
around the internals of UVMM.

Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mary Guillemard <mary@mary.zone>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 55 ++++++++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  1 +
 2 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 79eefdfd08a2..a92c729600d6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -107,34 +107,34 @@ nouveau_uvmm_vmm_sparse_unref(struct nouveau_uvmm *uvmm,
 
 static int
 nouveau_uvmm_vmm_get(struct nouveau_uvmm *uvmm,
-		     u64 addr, u64 range)
+		     u64 addr, u64 range, u8 page_shift)
 {
 	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
 
-	return nvif_vmm_raw_get(vmm, addr, range, PAGE_SHIFT);
+	return nvif_vmm_raw_get(vmm, addr, range, page_shift);
 }
 
 static int
 nouveau_uvmm_vmm_put(struct nouveau_uvmm *uvmm,
-		     u64 addr, u64 range)
+		     u64 addr, u64 range, u8 page_shift)
 {
 	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
 
-	return nvif_vmm_raw_put(vmm, addr, range, PAGE_SHIFT);
+	return nvif_vmm_raw_put(vmm, addr, range, page_shift);
 }
 
 static int
 nouveau_uvmm_vmm_unmap(struct nouveau_uvmm *uvmm,
-		       u64 addr, u64 range, bool sparse)
+		       u64 addr, u64 range, u8 page_shift, bool sparse)
 {
 	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
 
-	return nvif_vmm_raw_unmap(vmm, addr, range, PAGE_SHIFT, sparse);
+	return nvif_vmm_raw_unmap(vmm, addr, range, page_shift, sparse);
 }
 
 static int
 nouveau_uvmm_vmm_map(struct nouveau_uvmm *uvmm,
-		     u64 addr, u64 range,
+		     u64 addr, u64 range, u8 page_shift,
 		     u64 bo_offset, u8 kind,
 		     struct nouveau_mem *mem)
 {
@@ -163,7 +163,7 @@ nouveau_uvmm_vmm_map(struct nouveau_uvmm *uvmm,
 		return -ENOSYS;
 	}
 
-	return nvif_vmm_raw_map(vmm, addr, range, PAGE_SHIFT,
+	return nvif_vmm_raw_map(vmm, addr, range, page_shift,
 				&args, argc,
 				&mem->mem, bo_offset);
 }
@@ -182,8 +182,9 @@ nouveau_uvma_vmm_put(struct nouveau_uvma *uvma)
 {
 	u64 addr = uvma->va.va.addr;
 	u64 range = uvma->va.va.range;
+	u8 page_shift = uvma->page_shift;
 
-	return nouveau_uvmm_vmm_put(to_uvmm(uvma), addr, range);
+	return nouveau_uvmm_vmm_put(to_uvmm(uvma), addr, range, page_shift);
 }
 
 static int
@@ -193,9 +194,11 @@ nouveau_uvma_map(struct nouveau_uvma *uvma,
 	u64 addr = uvma->va.va.addr;
 	u64 offset = uvma->va.gem.offset;
 	u64 range = uvma->va.va.range;
+	u8 page_shift = uvma->page_shift;
 
 	return nouveau_uvmm_vmm_map(to_uvmm(uvma), addr, range,
-				    offset, uvma->kind, mem);
+				    page_shift, offset, uvma->kind,
+				    mem);
 }
 
 static int
@@ -203,12 +206,13 @@ nouveau_uvma_unmap(struct nouveau_uvma *uvma)
 {
 	u64 addr = uvma->va.va.addr;
 	u64 range = uvma->va.va.range;
+	u8 page_shift = uvma->page_shift;
 	bool sparse = !!uvma->region;
 
 	if (drm_gpuva_invalidated(&uvma->va))
 		return 0;
 
-	return nouveau_uvmm_vmm_unmap(to_uvmm(uvma), addr, range, sparse);
+	return nouveau_uvmm_vmm_unmap(to_uvmm(uvma), addr, range, page_shift, sparse);
 }
 
 static int
@@ -501,7 +505,8 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 
 			if (vmm_get_range)
 				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
-						     vmm_get_range);
+						     vmm_get_range,
+						     PAGE_SHIFT);
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP: {
@@ -528,6 +533,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			u64 ustart = va->va.addr;
 			u64 urange = va->va.range;
 			u64 uend = ustart + urange;
+			u8 page_shift = uvma_from_va(va)->page_shift;
 
 			/* Nothing to do for mappings we merge with. */
 			if (uend == vmm_get_start ||
@@ -538,7 +544,8 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 				u64 vmm_get_range = ustart - vmm_get_start;
 
 				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
-						     vmm_get_range);
+						     vmm_get_range,
+						     page_shift);
 			}
 			vmm_get_start = uend;
 			break;
@@ -581,7 +588,8 @@ static int
 op_map_prepare(struct nouveau_uvmm *uvmm,
 	       struct nouveau_uvma **puvma,
 	       struct drm_gpuva_op_map *op,
-	       struct uvmm_map_args *args)
+	       struct uvmm_map_args *args,
+	       u8 page_shift)
 {
 	struct nouveau_uvma *uvma;
 	int ret;
@@ -592,6 +600,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
 
 	uvma->region = args->region;
 	uvma->kind = args->kind;
+	uvma->page_shift = page_shift;
 
 	drm_gpuva_map(&uvmm->base, &uvma->va, op);
 
@@ -627,13 +636,14 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 		case DRM_GPUVA_OP_MAP: {
 			u64 vmm_get_range = vmm_get_end - vmm_get_start;
 
-			ret = op_map_prepare(uvmm, &new->map, &op->map, args);
+			ret = op_map_prepare(uvmm, &new->map, &op->map, args, PAGE_SHIFT);
 			if (ret)
 				goto unwind;
 
 			if (vmm_get_range) {
 				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
-							   vmm_get_range);
+							   vmm_get_range,
+							   new->map->page_shift);
 				if (ret) {
 					op_map_prepare_unwind(new->map);
 					goto unwind;
@@ -657,7 +667,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 
 			if (r->prev) {
 				ret = op_map_prepare(uvmm, &new->prev, r->prev,
-						     &remap_args);
+						     &remap_args, uvma_from_va(va)->page_shift);
 				if (ret)
 					goto unwind;
 
@@ -667,7 +677,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 
 			if (r->next) {
 				ret = op_map_prepare(uvmm, &new->next, r->next,
-						     &remap_args);
+						     &remap_args, uvma_from_va(va)->page_shift);
 				if (ret) {
 					if (r->prev)
 						op_map_prepare_unwind(new->prev);
@@ -689,6 +699,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 			u64 ustart = va->va.addr;
 			u64 urange = va->va.range;
 			u64 uend = ustart + urange;
+			u8 page_shift = uvma_from_va(va)->page_shift;
 
 			op_unmap_prepare(u);
 
@@ -704,7 +715,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 				u64 vmm_get_range = ustart - vmm_get_start;
 
 				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
-							   vmm_get_range);
+							   vmm_get_range, page_shift);
 				if (ret) {
 					op_unmap_prepare_unwind(va);
 					goto unwind;
@@ -799,10 +810,11 @@ op_unmap_range(struct drm_gpuva_op_unmap *u,
 	       u64 addr, u64 range)
 {
 	struct nouveau_uvma *uvma = uvma_from_va(u->va);
+	u8 page_shift = uvma->page_shift;
 	bool sparse = !!uvma->region;
 
 	if (!drm_gpuva_invalidated(u->va))
-		nouveau_uvmm_vmm_unmap(to_uvmm(uvma), addr, range, sparse);
+		nouveau_uvmm_vmm_unmap(to_uvmm(uvma), addr, range, page_shift, sparse);
 }
 
 static void
@@ -882,6 +894,7 @@ nouveau_uvmm_sm_cleanup(struct nouveau_uvmm *uvmm,
 			struct drm_gpuva_op_map *n = r->next;
 			struct drm_gpuva *va = r->unmap->va;
 			struct nouveau_uvma *uvma = uvma_from_va(va);
+			u8 page_shift = uvma->page_shift;
 
 			if (unmap) {
 				u64 addr = va->va.addr;
@@ -893,7 +906,7 @@ nouveau_uvmm_sm_cleanup(struct nouveau_uvmm *uvmm,
 				if (n)
 					end = n->va.addr;
 
-				nouveau_uvmm_vmm_put(uvmm, addr, end - addr);
+				nouveau_uvmm_vmm_put(uvmm, addr, end - addr, page_shift);
 			}
 
 			nouveau_uvma_gem_put(uvma);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index 9d3c348581eb..51925711ae90 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -33,6 +33,7 @@ struct nouveau_uvma {
 
 	struct nouveau_uvma_region *region;
 	u8 kind;
+	u8 page_shift;
 };
 
 #define uvmm_from_gpuvm(x) container_of((x), struct nouveau_uvmm, base)
-- 
2.51.0

