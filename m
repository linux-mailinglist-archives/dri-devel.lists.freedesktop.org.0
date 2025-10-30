Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A737C22A09
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 00:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35DC10EA78;
	Thu, 30 Oct 2025 23:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lsVAkaPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB3510EA97
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 23:04:28 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47112a73785so12408465e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761865466; x=1762470266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=46N0aWvp8oKX6Nu5qfDL/f1CreothHImB8SyXqy9PMU=;
 b=lsVAkaPP8vgf3/gaplMj7gUL58+9bnqX0yv/g0s2ChPzVL0NWZ1dTVrTcENK3xFN41
 eSXKbR9GLZnXxSz7C3gJymRCNCT3pIPXQ1jvnOGm+MTG0OYKMDNTtASI+pklVmkyqtDv
 kngysCqrTuWodbWtWPEq/AL+IA9dgpUPkznn2tBONLPv1i6YTbeVFyqGNxwjDaizPU6/
 9mQUB1Fn0+SRhVLLGyGymCnqJOHiNUBr6CWTIshzmThddmn+fmkjKb+gA/YzxOMWyzZv
 HIiGg6IldcfiFmx4hr3usO1TySpCemZ7mX235Gr9LewaGIUKp2YSeni5Eeut6gTJWHru
 XPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761865466; x=1762470266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=46N0aWvp8oKX6Nu5qfDL/f1CreothHImB8SyXqy9PMU=;
 b=XpKb2rGCcA7FwE5Dp4YJRBRknUtHK7ZXmbRfRrnIpPZQbUsVeHuCDq2PEMDS1y8ic/
 a48B7a5xuN5U8RncgcHvaSkQt1qxxn/ULYjsqA/QW4FmSZxPjiKVxVfxKgh8aFgL4IDf
 87C16M/laCGaXy3fawi4kOfCwY9cuXLQJFJGebvYyK1flYwMPgJmj5WmnLBCyoOv1w4r
 Q6HEqJ2KkdRuvmc7iucUubIkKMsAICxhxJgE/wsjK3vQbESpaCKueRX0MHyXKTkEk8VO
 V3/kJcGR7af2ztGzhxH+J6PXB5G5protGSKfc/EL+jNlry5M0Qc3eW16bYRQiTpfzoLf
 GEEA==
X-Gm-Message-State: AOJu0Yxm+M5RJZbxrzMgZqcPM5vOOC9aGUj+pU2VcaSOGEbTd0tavorB
 AC4D70sRN8i/VC3nZnKnEtZBPLZ6lj2V8CKtRoDGWC4sYJqzw5GIkrwk
X-Gm-Gg: ASbGncsAluYy/4UpgITPL08oCVw+1mlF7TgSylX9Z38Wyasm4DQSsHQFFiDSqauTtFr
 JmRI1fnTP/5SDv4fqCiiyrrdTGd6y2MRFn9tepL+d2e0juY1BsbZsbUKG9p6c5SXh0XBb+CNAfg
 O2j8yAs639UWKp+xrhxZeZQmURBAl56wM5OQR+0CQ4QXFq+b88aEj/U3GzvcujnsPUcqGPCsCOx
 sRPxKurTn34l4IHRgS2ayNZLqRXUFPehEhVY02YdERWLA3kVvuB/06IrE2ZGQKBdApZjw3tTVHA
 WlhbMYEtBlY17+7PPfCU/90uldIK+6wYFu50w+eYsRdhrz6Q5FVe5rtx3vEWTsTzqd1DlUsigca
 Y6YAUqL4jyMHAb1GFfhmLdubN3CC5d0AfU6/tZxKYTjTUERTgdvoZ/I7gaHXYTy8h1uF1LIN0Pe
 D80J51v3vMxMg=
X-Google-Smtp-Source: AGHT+IF3V0g/eQ/lGtV/ew84nrHC/EHi1TJv4zNBhbsESiTddZuJ6+lmPFHjfgPrS32IKMq22nTyGg==
X-Received: by 2002:a05:600c:83ce:b0:471:989:9d85 with SMTP id
 5b1f17b1804b1-47730871fa6mr13632455e9.19.1761865466296; 
 Thu, 30 Oct 2025 16:04:26 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732ff8235sm2227025e9.14.2025.10.30.16.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 16:04:25 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v3 2/5] drm/nouveau/uvmm: Allow larger pages
Date: Fri, 31 Oct 2025 01:03:54 +0200
Message-ID: <20251030230357.45070-3-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
References: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
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

Now that everything in UVMM knows about the variable page shift, we can
select larger values.

The proposed approach relies on nouveau_bo::page unless if it would cause
alignment issues (in which case we fall back to searching for an
appropriate shift)

Signed-off-by: Mary Guillemard <mary@mary.zone>
Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 60 +++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 2cd0835b05e8..f2d032f665e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -454,6 +454,62 @@ op_unmap_prepare_unwind(struct drm_gpuva *va)
 	drm_gpuva_insert(va->vm, va);
 }
 
+static bool
+op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 page_shift)
+{
+	u64 non_page_bits = (1ULL << page_shift) - 1;
+
+	return op->va.addr & non_page_bits == 0 &&
+	       op->va.range & non_page_bits == 0 &&
+	       op->gem.offset & non_page_bits == 0;
+}
+
+static u8
+select_page_shift(struct nouveau_uvmm *uvmm, struct drm_gpuva_op_map *op)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(op->gem.obj);
+
+	/* nouveau_bo_fixup_align() guarantees that the page size will be aligned
+	 * for most cases, but it can't handle cases where userspace allocates with
+	 * a size and then binds with a smaller granularity. So in order to avoid
+	 * breaking old userspace, we need to ensure that the VA is actually
+	 * aligned before using it, and if it isn't, then we downgrade to the first
+	 * granularity that will fit, which is optimal from a correctness and
+	 * performance perspective.
+	 */
+	if (op_map_aligned_to_page_shift(op, nvbo->page))
+		return nvbo->page;
+
+	struct nouveau_mem *mem = nouveau_mem(nvbo->bo.resource);
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+	int i;
+
+	/* If the given granularity doesn't fit, let's find one that will fit. */
+	for (i = 0; i < vmm->page_nr; i++) {
+		/* Ignore anything that is bigger or identical to the BO preference. */
+		if (vmm->page[i].shift >= nvbo->page)
+			continue;
+
+		/* Skip incompatible domains. */
+		if ((mem->mem.type & NVIF_MEM_VRAM) && !vmm->page[i].vram)
+			continue;
+		if ((mem->mem.type & NVIF_MEM_HOST) &&
+		    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
+			continue;
+
+		/* If it fits, return the proposed shift. */
+		if (op_map_aligned_to_page_shift(op, vmm->page[i].shift))
+			return vmm->page[i].shift;
+	}
+
+	/* If we get here then nothing can reconcile the requirements. This should never
+	 * happen.
+	 */
+	WARN_ON(1);
+
+	return PAGE_SHIFT;
+}
+
 static void
 nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			       struct nouveau_uvma_prealloc *new,
@@ -506,7 +562,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			if (vmm_get_range)
 				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
 						     vmm_get_range,
-						     PAGE_SHIFT);
+						     select_page_shift(uvmm, &op->map));
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP: {
@@ -599,7 +655,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
 
 	uvma->region = args->region;
 	uvma->kind = args->kind;
-	uvma->page_shift = PAGE_SHIFT;
+	uvma->page_shift = select_page_shift(uvmm, op);
 
 	drm_gpuva_map(&uvmm->base, &uvma->va, op);
 
-- 
2.51.1

