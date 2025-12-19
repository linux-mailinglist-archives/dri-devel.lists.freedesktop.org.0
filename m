Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CEFCD1716
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB35910F098;
	Fri, 19 Dec 2025 18:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="LYZdEKuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2452510F073;
 Fri, 19 Dec 2025 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=iKK/Xofdd7Z8vAQtV8vVEIm8tmIup9pUtLviIA6bM3Y=; b=LYZdEKuHxtWVxSOIb5Bqtw6aHP
 sr70hP1eAiXuio+GcnKVLYEPqMv9dmZ8UNZjCrpRl3ybYs5/gyenCKyEfFkFB0v02PtT0czIyqib1
 3z6Q8IiehJeL5QUlCQYvk0tn+p4udnBZAnjHthTwMyUdTJGlyeXbWrHAappVZNt+8mycjH4t/89VW
 VJeALribRsdpb6/yWWa8yWBMcdnOIoaQnj3WDm/d1lWnYTu0L5f3v0geTc+tuwSozVXQqy144Ae2k
 Z5jPnpXQAX7/cGyaBb1iKJqgbdrJbbWfJ3AhtwMdzYhJXuYmp4/j79raX0tu+ca61VBOCHDtZiWlU
 NpMcns/Q==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUz-0000000AqkV-3asl; Fri, 19 Dec 2025 18:46:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:36 -0800
Message-ID: <20251219184638.1813181-18-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
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

Correct or add kernel-doc comments to eliminate all warnings:

Warning: ../drivers/gpu/drm/msm/msm_gem_vma.c:96 expecting prototype for
 struct msm_vma_op. Prototype was for struct msm_vm_op instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_gem_vma.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- linux-next-20251217.orig/drivers/gpu/drm/msm/msm_gem_vma.c
+++ linux-next-20251217/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -65,7 +65,7 @@ struct msm_vm_unmap_op {
 };
 
 /**
- * struct msm_vma_op - A MAP or UNMAP operation
+ * struct msm_vm_op - A MAP or UNMAP operation
  */
 struct msm_vm_op {
 	/** @op: The operation type */
@@ -798,6 +798,9 @@ static const struct drm_sched_backend_op
  * synchronous operations are supported.  In a user managed VM, userspace
  * handles virtual address allocation, and both async and sync operations
  * are supported.
+ *
+ * Returns: pointer to the created &struct drm_gpuvm on success
+ * or an ERR_PTR(-errno) on failure.
  */
 struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
