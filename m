Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4318C17CB
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 22:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8DC10F41F;
	Thu,  9 May 2024 20:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JGvZJILJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0055210F41F;
 Thu,  9 May 2024 20:44:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41b9dff6be8so10303085e9.3; 
 Thu, 09 May 2024 13:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715287466; x=1715892266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TFnrhs8qbyMrXLDs1SkHJ+Oc5VBjQBEfIG44vO26wpU=;
 b=JGvZJILJRPWUxNL4epCdRC+CUc8fDGzWikEsHje6WperN0OKadWLbdTlN5dUjqkxmd
 6QjdJctVsfnDxawKfszF2nkHBJ2QFZ8EMSXNSkLvkbDg0TE9ByohXIaAskTfMgoJNkqN
 fvAchpXoD9LSIX1TE1ew/zBtxUChKZEvJH4acexlnvp2MoHgi/NRsB3+/V5B+XNeIih2
 q+lMDYPgf5QfK+DzooioJuEG0+tvKMXPR7Mu928xs9hoicuT/oT+OMHlJ/yjbvJQCPZH
 JbuGXsYEtTYblM7F4BTi9vrFICeHsAT5ie/w47UxjYrOY++Ps/k9WMZinJnS1obT+10o
 Ku6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715287466; x=1715892266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TFnrhs8qbyMrXLDs1SkHJ+Oc5VBjQBEfIG44vO26wpU=;
 b=Tj/h5v/jEq+Dr5a/JsCnKhlSLn2I+x9LCt/MgFzbguzCffyPguuDGRw1fVGRQEDiCO
 glQ6AQExrcJtQdLJc2t18gcwyIqplUVcvWfLRNy98E8GZfZwdR/qvHJpT6LM12mYpEcw
 fJKD3vaso+/x2Br/ujoW/NMkvxVLz0T3vhmnYc334C4qxOqDmLATewzxq55y+1wFRWbu
 88ytiUaax0Dw2kPPuxE1U2k1xgDtRV/tFjTS2EUf+fOELsmbCXn9EMMhlQ5br0eb4pP1
 I9pKVKLlmzwsId0IMnYzZbMeFiO675A53Js5QO5kSH7sRptKp96MJr1kFteAxhS7Ohuq
 aXkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUptc4tktW3MFoTfkCqr2xi8vf7leqUQgnbQrXQXuAgT64eHUCK12vLaxMKRZN5AS9OKrep030sQ2qM0f3OpQSEcjELV46LIFm3zcqkA==
X-Gm-Message-State: AOJu0YzzBuyIaMwytNKrAusBmWdAqaqOu2kFzddzbbxDEuRGPBgxZMdA
 LXbCc8B94htio8+UV2WhY1IcA1NvhKJNbs7qgiVOVH5YS+WM4uMi50IPOQ==
X-Google-Smtp-Source: AGHT+IGZfwfqgivNWtzN84BpDnUlXhiU2EVaWxcXnrcYGGgHTGeX5et2PfomBGJTXXugANG+a18y5g==
X-Received: by 2002:a05:600c:3b86:b0:41a:a521:9699 with SMTP id
 5b1f17b1804b1-41fea93a0edmr5853025e9.4.1715287465411; 
 Thu, 09 May 2024 13:44:25 -0700 (PDT)
Received: from fedora.domain.name ([156.200.207.193])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fe518a8fasm14662785e9.33.2024.05.09.13.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 13:44:25 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v4] drm/nouveau: use tile_mode and pte_kind for VM_BIND bo
 allocations
Date: Thu,  9 May 2024 23:43:52 +0300
Message-ID: <20240509204352.7597-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.44.0
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

Allows PTE kind and tile mode on BO create with VM_BIND,
and adds a GETPARAM to indicate this change. This is needed to support
modifiers in NVK and ensure correctness when dealing with the nouveau
GL driver.

The userspace modifiers implementation this is for can be found here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24795

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c |  3 ++
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 44 +++++++++++--------------
 include/uapi/drm/nouveau_drm.h          |  7 ++++
 3 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 80f74ee0f..47e53e17b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -272,6 +272,9 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 		getparam->value = (u64)ttm_resource_manager_usage(vram_mgr);
 		break;
 	}
+	case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:
+		getparam->value = 1;
+		break;
 	default:
 		NV_PRINTK(dbg, cli, "unknown parameter %lld\n", getparam->param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index db8cbf615..186add400 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -241,28 +241,28 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	}
 
 	nvbo->contig = !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
-	if (!nouveau_cli_uvmm(cli) || internal) {
-		/* for BO noVM allocs, don't assign kinds */
-		if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
-			nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
-			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
-				kfree(nvbo);
-				return ERR_PTR(-EINVAL);
-			}
 
-			nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
-		} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
-			nvbo->kind = (tile_flags & 0x00007f00) >> 8;
-			nvbo->comp = (tile_flags & 0x00030000) >> 16;
-			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
-				kfree(nvbo);
-				return ERR_PTR(-EINVAL);
-			}
-		} else {
-			nvbo->zeta = (tile_flags & 0x00000007);
+	if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
+		nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
+		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+			kfree(nvbo);
+			return ERR_PTR(-EINVAL);
+		}
+
+		nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
+	} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+		nvbo->kind = (tile_flags & 0x00007f00) >> 8;
+		nvbo->comp = (tile_flags & 0x00030000) >> 16;
+		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+			kfree(nvbo);
+			return ERR_PTR(-EINVAL);
 		}
-		nvbo->mode = tile_mode;
+	} else {
+		nvbo->zeta = (tile_flags & 0x00000007);
+	}
+	nvbo->mode = tile_mode;
 
+	if (!nouveau_cli_uvmm(cli) || internal) {
 		/* Determine the desirable target GPU page size for the buffer. */
 		for (i = 0; i < vmm->page_nr; i++) {
 			/* Because we cannot currently allow VMM maps to fail
@@ -304,12 +304,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 		}
 		nvbo->page = vmm->page[pi].shift;
 	} else {
-		/* reject other tile flags when in VM mode. */
-		if (tile_mode)
-			return ERR_PTR(-EINVAL);
-		if (tile_flags & ~NOUVEAU_GEM_TILE_NONCONTIG)
-			return ERR_PTR(-EINVAL);
-
 		/* Determine the desirable target GPU page size for the buffer. */
 		for (i = 0; i < vmm->page_nr; i++) {
 			/* Because we cannot currently allow VMM maps to fail
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index cd84227f1..5402f77ee 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -68,6 +68,13 @@ extern "C" {
  */
 #define NOUVEAU_GETPARAM_VRAM_USED 19
 
+/*
+ * NOUVEAU_GETPARAM_HAS_VMA_TILEMODE
+ *
+ * Query whether tile mode and PTE kind are accepted with VM allocs or not.
+ */
+#define NOUVEAU_GETPARAM_HAS_VMA_TILEMODE 20
+
 struct drm_nouveau_getparam {
 	__u64 param;
 	__u64 value;
-- 
2.44.0

