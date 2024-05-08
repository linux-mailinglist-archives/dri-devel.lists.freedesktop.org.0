Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D88F8C0782
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 01:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26B11131FF;
	Wed,  8 May 2024 23:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lwDjWqSz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0851131FF;
 Wed,  8 May 2024 23:06:51 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2df848f9325so3154061fa.1; 
 Wed, 08 May 2024 16:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715209609; x=1715814409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nhxtaEbxipmWI1uIiVmUb0n+4XQE2lW/tiI1yKzWmUM=;
 b=lwDjWqSzidnSDu45mRaTKn29yTL4d8QsUErBSluepO9sWyyT8jd/cw9fPu08hj56Vp
 GnDZWPITwR/09jhc8Uqz8G8A2jnh37HC7UuBxb/R/OzTOdmHnu3IFO093y1i3+rC/wx6
 NwAkSszwZxL/7nMyp7LtEk/ssY7o1/+2ily6NpzFIRWM0LRxMj9F7IMeZKNalTUpTsKF
 vvZglVaQTKOj/I1Z4RHkJY3gB0poZS18ZENWUDqw33c6/hYCQWAXNDRh7ZJ3HW+8mQI8
 ArAY0KuU/XGFzeomtW1oeGvXw9hTTMDuEaMXTYQHC1D9vAQEz7egzoOtHU3Kp30kMSyX
 cKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715209609; x=1715814409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nhxtaEbxipmWI1uIiVmUb0n+4XQE2lW/tiI1yKzWmUM=;
 b=hJ6dPmSogUvABMG67JwXMVkRsaWtMoTAzIaiLIe6t6M6Eh+jLdPDLyPH9A5df+/OzA
 LJ44xF03FBarkJAQbjlBUxKltWRfZXvRIcuvuZKO4QWEk6/lqnTgwSPb4CrCsP0QfnD2
 ZFm0eLnnaF1Q5jm80d6q/+NKm6QS+Bqi5d/hxnmvuhdN/53Y/bbKpEKV95zbKNIhPpWV
 xGCYwzrkcoQVyCgukc2vfLOBkzqjYK3LZU2HRuha8oUhkj5NqjrUcBrrCajQeIVmpZ8h
 XTdCRHR697pQ6K8+BjrM6eYKdKChdjARTLbYAl0wZk4KU8fALQdxiYjf3U5ZPgJsHj8E
 2GLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7l8HbVlqLEU9XKOvS6kyziicqoSm6kp3ZAtV609sWfj28dlCcxZiNsixGTRndwlzZEe5pApyhzGB+9K75Ikkw+k2zbKUeVpdN+okqLA==
X-Gm-Message-State: AOJu0YyODd+4RNVqSYUt7RStViLUDhTGZDeSWP+o/k7L3QoypOQkrB+q
 /vZ8c8XdDknaAQwnuV9uC2x0wbXPyH3OcUzR7LJCb5tUKtl1sQZoqWfJaQ==
X-Google-Smtp-Source: AGHT+IHvYw2kSLwhFXkAbOmJn0GTlgrmpEwuDWSlfPY2hTQ0Ywhj8GORLL3dMq7Gw0YSum0VEjTR4g==
X-Received: by 2002:a2e:b790:0:b0:2e2:466b:1a51 with SMTP id
 38308e7fff4ca-2e4475a0ecemr25694721fa.37.1715209608556; 
 Wed, 08 May 2024 16:06:48 -0700 (PDT)
Received: from fedora.domain.name ([156.200.207.193])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87d2045asm37630585e9.27.2024.05.08.16.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 16:06:48 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v3] drm/nouveau: use tile_mode and pte_kind for VM_BIND bo
 allocations
Date: Thu,  9 May 2024 02:06:24 +0300
Message-ID: <20240508230624.7598-1-mohamedahmedegypt2001@gmail.com>
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
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28843

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c |  3 ++
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 45 +++++++++++--------------
 include/uapi/drm/nouveau_drm.h          |  7 ++++
 3 files changed, 30 insertions(+), 25 deletions(-)

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
index db8cbf615..583c962ef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -241,28 +241,29 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
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
+	/* for BO allocs, don't assign kinds */
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
@@ -304,12 +305,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
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

