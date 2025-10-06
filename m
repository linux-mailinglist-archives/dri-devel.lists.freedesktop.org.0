Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A50ABBF138
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 21:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8FC10E450;
	Mon,  6 Oct 2025 19:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QV4iTuRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F73710E44E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 19:14:20 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso4000062f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759778059; x=1760382859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hAYO5exGw5pBpJwPfJWxaone+f+36yTg5sQQrnulw7c=;
 b=QV4iTuRp6qLDoDQ+RAYLpbcFXWnnoij1wo5sh0CFYUVR/CqGxJPkIn7C2ZK5FW4HRL
 NpnTcg1Z7UyvHA0R1z9WT53DAOn2rraxZT70HmwRzw2s5b1mVRSxr8b9NU+ThjeMuB3s
 99ZYfBWiopyZHwa8U9ZwNP0E6Z/biZMFEdfhqd4Q9UZyGrvEtMBgKPwKtPNR6rlO6dED
 bhmY9E7uHDKberEfLrun+1TNQPBl34WT7oezk8zzO7SVRCS8pIHdS6eLI1IZIFVGnCwe
 BcZqADLX9l/wEk75znr+O+ydCdvytHM0MaZVavKq6SknmUwTnGCSe5iSwvwjR50xPCtp
 riIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759778059; x=1760382859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hAYO5exGw5pBpJwPfJWxaone+f+36yTg5sQQrnulw7c=;
 b=wZ1N9wNEQr4WDGsA7ED+y+goYyoQojKiXBFZIIc8XgctwoeNGPmCcP7JTnYoGWTnXV
 GVGTVNIDBhCHxyOh//cs2FzkjiDw++7bPeu3be9L9buMS1lO3cURfInH6W7FJYiYtiSu
 vrrGuQa/z9YQl4Gw8w8XryB9BKzuEgyJhtRRZBRMGUUm27++8IKBZlUWb1x0gjrS/jIk
 JLnJonWXrjOMcH+UWCgcMkDP7K9FFyJcsiit9OSMX7/lCUsgK6SA/M5levT7OK9yeE6q
 RJ4xf5EzlgyAAhL8yA8C95lQ0yyJQMtsDsSpbq4c7dDbN8Tb0RWA+MQ23KOZw2X8qgHN
 drCQ==
X-Gm-Message-State: AOJu0YxXuoOcDBxA/nwlPL+IDwKBgrUKBukG0mrtjNE1iJXS6wmfMV+3
 AulFQCmu7tYeFop+PG8CSgCJQ6hFHCCgZmqsddkO4EjM0dG3fi+tDg8d
X-Gm-Gg: ASbGncvlH5hhEbFvOsoCInjUfAoKOrNShfF2tro+I1ilKkp67MHj9GZYDcnVf1edD5z
 u7j27Igt6UYA26p/hgeEVqxuxYQNtimvfpoKezqVlec0/PVUPNvGEMZWOwsdcLniLS2YCmT68dL
 sSwknU5+q+WeY047AZWBVu1UXePGeUHJlDOoFCOhJpODvhOEKynCJqeRDJCXDY6iU10f9LIh4W6
 9SsTHhIkENoIr0jL7ztI3ZcMqsHh2CD+ZA1Uh0RiTTmUw1VDPuq0wH0M3qlfSgRNQiFz7enl3IQ
 vDbnKhjpTHNwVZfMTR9EcHO4SeEykKwfGL1lF92x+LId5mD922aL5fZ/kzAJ38RbcarQO1zKsUE
 fUIymbvAMP/g47a2dg8efqCCTeCFBN7t4kWP6BICnMg0meB57HANY7o614p/kzduZuyHj
X-Google-Smtp-Source: AGHT+IFgnvCVizHV0NE+PuzB7sBbTSTfTggo6zyJ+bMeG0+kpzGpMjfhHGaPgBdZXpGwvw+NuYnnuQ==
X-Received: by 2002:a05:6000:1883:b0:3ec:42f9:952b with SMTP id
 ffacd0b85a97d-425829b61f3mr502699f8f.4.1759778058786; 
 Mon, 06 Oct 2025 12:14:18 -0700 (PDT)
Received: from fedora ([154.182.208.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4256866060fsm16646435f8f.14.2025.10.06.12.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 12:14:18 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
Subject: [PATCH 3/5] drm/nouveau/mmu/gp100: Remove unused/broken support for
 compression
Date: Mon,  6 Oct 2025 22:13:26 +0300
Message-ID: <20251006191329.277485-4-mohamedahmedegypt2001@gmail.com>
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

From: Ben Skeggs <bskeggs@nvidia.com>

From GP100 onwards it's not possible to initialise comptag RAM without
PMU firmware, which nouveau has no support for.

As such, this code is essentially a no-op and will always revert to the
equivalent non-compressed kind due to comptag allocation failure.  It's
also broken for the needs of VM_BIND/Vulkan.

Remove the code entirely to make way for supporting compression on GPUs
that support GSM-RM.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 39 ++-----------------
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |  4 +-
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
2.51.0

