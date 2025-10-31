Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D2CC249CD
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A903610EBAE;
	Fri, 31 Oct 2025 10:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kBAAmDw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D96B10EBAB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:49:58 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-475dd559b0bso27501835e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761907797; x=1762512597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zzdi8nfSSs1sZofLN+Os1wqi0upcCWxbMTjLpxylR+I=;
 b=kBAAmDw/rGfFdEdUmlaAApLUUs4L0ufz90yWVyDIGTk/yB9zuc/DI+dxHogIrHGi9F
 hc8wCNll8grzJVmFAYwGqh2YMaHHo25deR3+lAMNHnWVdtl7tx8T5RCaeJ4FROgkeQun
 eBieXjmjj0vZX2A+VPLtCN1GMCJJ6vto3vyia7xOWlR8IPk0MxrbS1uqC0feVYRBOYdR
 8A+1b/vlRkQ2Lcs1q3LqwixHr0aJ+zN9YwWYDBKyi/xsdYCYfXo3mEt/oMOVdV4Rf/dA
 AhS9YH3OnQh9TkxyWBnY3ia1/jaqYvjbE5xPyfo7NP2xZaRwnTfp3EY7YvVASG8r61zM
 k3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907797; x=1762512597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zzdi8nfSSs1sZofLN+Os1wqi0upcCWxbMTjLpxylR+I=;
 b=w0q/0fpXqfAOggUPElUuPQYZvK0QEPyl/Kb4UTwNhSaiu//bMMCmid/Dp4WvrEAjhB
 MtO12WVJVDTdRJ4v0XvkYopE3L9aKwO6S4MHZanXRH/+30zbD2ah30b6PC39dsDzus+l
 QjYFmdA2Sbvhtw9MHHe6g5vR22JqEDKivvOrrRFZAjyvDGGMbPK9M/Br6fC0SWyz/M+V
 q6HCsookYIb+3RmVkMUbIIhWkyBxZeN6NFWdQ5/5ja92YNTsH//MnC0vseYwRrN5QsZm
 yUhO3y6svzUyTnacrjuN6vFTN5e7j1xM9LDuXhGAsyp0Npb5ooAvV6R3VyK4MpEQSrjw
 FXLw==
X-Gm-Message-State: AOJu0YwqfikKrBJXh4o/baXkmXSvYyw+Y3oCT1lRnBOB8U8WBIWaXnmR
 DAiFSf+4hUG6sTXpEc6KBP/Ixec3l96WzxNyEK8a8R/7kkK7tT2BVa4I
X-Gm-Gg: ASbGncuzQOvCUkLepTFg00YnYtiGrkXTa2RgnjplUeBYnxjBwVnH7xi0vAF7IrRt3hv
 9NeZ3/IY3CHAIevDVXDbqV15VcUOA3xTAjQ9SVDkufMjiuW3Z4rLKCmAISLUk1J23lJtHoZR4Vo
 ix6wwEPLlm+gy+EVTPZxeUF5umqEkVs+hjono6qGq0DZAMEW0YlQ4w0ZoRsslkYZLIBQ6nSO7Lq
 Soysvwjh6NQKji/iarqxulpoDhD2UnZB3SKIwWByF/aeQEL6ECHuPDevWIUa+Cu0nlaoPu40aEG
 A6Xzh8KdiYcsjIO7NENkexzOrumr6GfvI0IxKfbkvEv0yV8uzcPosTxMYItzRNvg/q01+4sL9Pm
 T70F3CQAOxgLjU01wpnytMEhTjANoBpUhElUIPi8a8w/xXpRSBZcUXGqmt2DPWol7AXVNmNJuco
 zihUm04W14uIIYIM3+AoZf8A==
X-Google-Smtp-Source: AGHT+IExqiXaV3tY1QYgyp3Vb/lFXZy9Ed+LjlywLCtsIPMBbB1MZkrDAGvWrVtUBRa7sksEKHFBPg==
X-Received: by 2002:a05:600c:4e44:b0:45f:2cb5:ecff with SMTP id
 5b1f17b1804b1-477308ce7b2mr30226905e9.31.1761907796910; 
 Fri, 31 Oct 2025 03:49:56 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fcf7d07sm19498025e9.9.2025.10.31.03.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:49:56 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@nvidia.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v4 4/5] drm/nouveau/mmu/tu102: Add support for compressed kinds
Date: Fri, 31 Oct 2025 12:49:23 +0200
Message-ID: <20251031104924.10631-5-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
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

From: Ben Skeggs <bskeggs@nvidia.com>

Allow compressed PTE kinds to be written into PTEs when GSP-RM is
present, rather than reverting to their non-compressed versions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 46 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index ecff1096a1bb..ed15a4475181 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -109,12 +109,34 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 	nvkm_done(pt->memory);
 }
 
+static inline u64
+gp100_vmm_comptag_nr(u64 size)
+{
+	return size >> 16; /* One comptag per 64KiB VRAM. */
+}
+
+static inline u64
+gp100_vmm_pte_comptagline_base(u64 addr)
+{
+	/* RM allocates enough comptags for all of VRAM, so use a 1:1 mapping. */
+	return (1 + gp100_vmm_comptag_nr(addr)) << 36; /* NV_MMU_VER2_PTE_COMPTAGLINE */
+}
+
+static inline u64
+gp100_vmm_pte_comptagline_incr(u32 page_size)
+{
+	return gp100_vmm_comptag_nr(page_size) << 36; /* NV_MMU_VER2_PTE_COMPTAGLINE */
+}
+
 static inline void
 gp100_vmm_pgt_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		  u32 ptei, u32 ptes, struct nvkm_vmm_map *map, u64 addr)
 {
 	u64 data = (addr >> 4) | map->type;
 
+	if (map->ctag)
+		data |= gp100_vmm_pte_comptagline_base(addr);
+
 	while (ptes--) {
 		VMM_WO064(pt, vmm, ptei++ * 8, data);
 		data += map->next;
@@ -195,6 +217,9 @@ gp100_vmm_pd0_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 {
 	u64 data = (addr >> 4) | map->type;
 
+	if (map->ctag)
+		data |= gp100_vmm_pte_comptagline_base(addr);
+
 	while (ptes--) {
 		VMM_WO128(pt, vmm, ptei++ * 0x10, data, 0ULL);
 		data += map->next;
@@ -440,9 +465,26 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 		return -EINVAL;
 	}
 
+	/* Handle compression. */
 	if (kindm[kind] != kind) {
-		/* Revert to non-compressed kind. */
-		kind = kindm[kind];
+		struct nvkm_device *device = vmm->mmu->subdev.device;
+
+		/* Compression is only supported when using GSP-RM, as
+		 * PMU firmware is required in order to initialise the
+		 * compbit backing store.
+		 */
+		if (nvkm_gsp_rm(device->gsp)) {
+			/* Turing GPUs require PTE_COMPTAGLINE to be filled,
+			 * in addition to specifying a compressed kind.
+			 */
+			if (device->card_type < GA100) {
+				map->ctag  = gp100_vmm_pte_comptagline_incr(1 << map->page->shift);
+				map->next |= map->ctag;
+			}
+		} else {
+			/* Revert to non-compressed kind. */
+			kind = kindm[kind];
+		}
 	}
 
 	map->type |= BIT(0);
-- 
2.51.1

