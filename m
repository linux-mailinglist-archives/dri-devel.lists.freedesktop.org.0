Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DF2C478F3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E8710E408;
	Mon, 10 Nov 2025 15:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="VavqiA5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB53110E400
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:33:05 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b3e7cc84b82so586892266b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 07:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1762788784; x=1763393584; darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dV8HTrWRbKTwEKdId5EYrcLWXepKsv72Ez8s7uKyCdc=;
 b=VavqiA5RgCFZoGDYSfbu7UgPJyOdRb5xgRpcVONad/VEg+QlK9ggsQUiMkzAPGF4m7
 W42d2Qw2I66zagY2JvGK9kYOtwEA6WaQutTC9m2vmIvSgZDnLUUdlJc2G/l/DrXg7z+H
 vg7oZQ9FI2OUkJDZBNs0J4sHk7BgK3X9vlqYWWSTaklmQhJ2ZtDJvVgwNazgfs4FTxJH
 vQUobQpxQOwe7yF708TrgX+QC9vRz7w6yu/D2YwF7iumiJ+X90NxKLx8Th7/8RJnEfK1
 r5hgswEt/SBzIS61nGWOSw+KVkuycszdUu3i3w6exml0SWGj242bRuTyy1MWNz+pMgG1
 I44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762788784; x=1763393584;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dV8HTrWRbKTwEKdId5EYrcLWXepKsv72Ez8s7uKyCdc=;
 b=igsbuTBWcu7Qg5/z9dsMxLO1vtyOyw7mXKcx68JRvJhK7M7pjRa+N9UMdar3ZhEh/h
 x7/W2eoLi6tghE0jaA+ki+CaQaugOm/ZAuvcr0PFVe2RMNNsTpz+KGsmw7cSt+XHQuS1
 MT+opzsKv5Hxl4CxGtqW8GC02LYapiAXsCc0+tukOJc14VlPJcdcdf+3r50zw75PcM++
 QCycfk8YXPgQJmyJj213/WeXOWKDeTXe+mTxBrUAmmF3LcmBVuE6r6mNmsuctEk/ArGS
 EX9vmkS3mxwy1WJz4Zdk1WYvd0g3KaDC/eSVkjG3pTQZK1xN/ScMjvNRvYXMHl1fwpxq
 dMmA==
X-Gm-Message-State: AOJu0YxYtHA4UMsCTYBa7MWFiXP6HnQPiFrQRsmBq0fi+mhT/syIb+uA
 3QoV2sqQdC2X9CxwZiO6LOjtCzc4WuArD0OOOxuXTL/LUOVOeVBsIUg5zSm2NoOIUzk=
X-Gm-Gg: ASbGncuDUAiNH+AxOp3tMvs8JTJjE1FC3n7HP5BkxdmPcP3UNSiGff2brkym2IQGLve
 X6kiH0/rv/QnAaLTVVd/MIpu8LX0iInNCwJpRnZRuHiWdnocDNxQmXaKOMvrkYH32ZHsL3uHeRZ
 WhVhJCw7aSGy76jaJm1w5ybbmKYh4B4DJx7GhQWLO3shtwNotS89uBOhCBkAS0hDn7dtg6ikW1i
 yLqZ0e9ip7HL+xLUGiwqyCQYbYWpMcESYuB8OZqsWeYAEOU5u9owDYZfnulr/8pgZfObN/DCXBe
 2McEoLKdANUiHoenWdgb7x3C85s3uqFrKDl6DLquh73nWdDRP0qyLNVshMA47O3vsVNXfgzYPL4
 vtgV4bM4TBhiliFKAXAksk0q9wfF9nHJL+aZ0QDdMlzkCsLRA/6cuKssX9mG75GVqCvbrz6H/po
 gZpzjFBptVipyX3osiPLNjxFRAUxPMg/k+PWPF90jL9CHMDL8su5mjEeAgEceT
X-Google-Smtp-Source: AGHT+IH1eO/pAsWGf3irlTOolQfuNePb26vDKwUgGAjxaSNbydnFYBUagX4wozVeTRQgUFJmawwuYQ==
X-Received: by 2002:a17:907:9619:b0:b72:5d08:486c with SMTP id
 a640c23a62f3a-b72e0476fa5mr966079566b.27.1762788784221; 
 Mon, 10 Nov 2025 07:33:04 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf7231dcsm1115978466b.31.2025.11.10.07.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 07:33:03 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Date: Mon, 10 Nov 2025 16:32:58 +0100
Subject: [PATCH v6 3/5] drm/nouveau/mmu/gp100: Remove unused/broken support
 for compression
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-nouveau-compv6-v6-3-83b05475f57c@mary.zone>
References: <20251110-nouveau-compv6-v6-0-83b05475f57c@mary.zone>
In-Reply-To: <20251110-nouveau-compv6-v6-0-83b05475f57c@mary.zone>
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, 
 James Jones <jajones@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>, 
 Ben Skeggs <bskeggs@nvidia.com>
X-Mailer: b4 0.14.3
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

From: Ben Skeggs <bskeggs@nvidia.com>

From GP100 onwards it's not possible to initialise comptag RAM without
PMU firmware, which nouveau has no support for.

As such, this code is essentially a no-op and will always revert to the
equivalent non-compressed kind due to comptag allocation failure.  It's
also broken for the needs of VM_BIND/Vulkan.

Remove the code entirely to make way for supporting compression on GPUs
that support GSM-RM.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mary Guillemard <mary@mary.zone>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 39 +++-------------------
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c |  4 +--
 2 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index 851fd847a2a9..ecff1096a1bb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -21,9 +21,7 @@
  */
 #include "vmm.h"
 
-#include <core/client.h>
 #include <subdev/fb.h>
-#include <subdev/ltc.h>
 #include <subdev/timer.h>
 #include <engine/gr.h>
 
@@ -117,8 +115,6 @@ gp100_vmm_pgt_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 {
 	u64 data = (addr >> 4) | map->type;
 
-	map->type += ptes * map->ctag;
-
 	while (ptes--) {
 		VMM_WO064(pt, vmm, ptei++ * 8, data);
 		data += map->next;
@@ -142,7 +138,6 @@ gp100_vmm_pgt_dma(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		while (ptes--) {
 			const u64 data = (*map->dma++ >> 4) | map->type;
 			VMM_WO064(pt, vmm, ptei++ * 8, data);
-			map->type += map->ctag;
 		}
 		nvkm_done(pt->memory);
 		return;
@@ -200,8 +195,6 @@ gp100_vmm_pd0_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 {
 	u64 data = (addr >> 4) | map->type;
 
-	map->type += ptes * map->ctag;
-
 	while (ptes--) {
 		VMM_WO128(pt, vmm, ptei++ * 0x10, data, 0ULL);
 		data += map->next;
@@ -411,8 +404,6 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 		struct gp100_vmm_map_vn vn;
 		struct gp100_vmm_map_v0 v0;
 	} *args = argv;
-	struct nvkm_device *device = vmm->mmu->subdev.device;
-	struct nvkm_memory *memory = map->memory;
 	u8  kind, kind_inv, priv, ro, vol;
 	int kindn, aper, ret = -ENOSYS;
 	const u8 *kindm;
@@ -450,30 +441,8 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 	}
 
 	if (kindm[kind] != kind) {
-		u64 tags = nvkm_memory_size(memory) >> 16;
-		if (aper != 0 || !(page->type & NVKM_VMM_PAGE_COMP)) {
-			VMM_DEBUG(vmm, "comp %d %02x", aper, page->type);
-			return -EINVAL;
-		}
-
-		if (!map->no_comp) {
-			ret = nvkm_memory_tags_get(memory, device, tags,
-						   nvkm_ltc_tags_clear,
-						   &map->tags);
-			if (ret) {
-				VMM_DEBUG(vmm, "comp %d", ret);
-				return ret;
-			}
-		}
-
-		if (!map->no_comp && map->tags->mn) {
-			tags = map->tags->mn->offset + (map->offset >> 16);
-			map->ctag |= ((1ULL << page->shift) >> 16) << 36;
-			map->type |= tags << 36;
-			map->next |= map->ctag;
-		} else {
-			kind = kindm[kind];
-		}
+		/* Revert to non-compressed kind. */
+		kind = kindm[kind];
 	}
 
 	map->type |= BIT(0);
@@ -592,8 +561,8 @@ gp100_vmm = {
 		{ 47, &gp100_vmm_desc_16[4], NVKM_VMM_PAGE_Sxxx },
 		{ 38, &gp100_vmm_desc_16[3], NVKM_VMM_PAGE_Sxxx },
 		{ 29, &gp100_vmm_desc_16[2], NVKM_VMM_PAGE_Sxxx },
-		{ 21, &gp100_vmm_desc_16[1], NVKM_VMM_PAGE_SVxC },
-		{ 16, &gp100_vmm_desc_16[0], NVKM_VMM_PAGE_SVxC },
+		{ 21, &gp100_vmm_desc_16[1], NVKM_VMM_PAGE_SVxx },
+		{ 16, &gp100_vmm_desc_16[0], NVKM_VMM_PAGE_SVxx },
 		{ 12, &gp100_vmm_desc_12[0], NVKM_VMM_PAGE_SVHx },
 		{}
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
index e081239afe58..5791d134962b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
@@ -34,8 +34,8 @@ gp10b_vmm = {
 		{ 47, &gp100_vmm_desc_16[4], NVKM_VMM_PAGE_Sxxx },
 		{ 38, &gp100_vmm_desc_16[3], NVKM_VMM_PAGE_Sxxx },
 		{ 29, &gp100_vmm_desc_16[2], NVKM_VMM_PAGE_Sxxx },
-		{ 21, &gp100_vmm_desc_16[1], NVKM_VMM_PAGE_SxHC },
-		{ 16, &gp100_vmm_desc_16[0], NVKM_VMM_PAGE_SxHC },
+		{ 21, &gp100_vmm_desc_16[1], NVKM_VMM_PAGE_SxHx },
+		{ 16, &gp100_vmm_desc_16[0], NVKM_VMM_PAGE_SxHx },
 		{ 12, &gp100_vmm_desc_12[0], NVKM_VMM_PAGE_SxHx },
 		{}
 	}

-- 
2.51.1

