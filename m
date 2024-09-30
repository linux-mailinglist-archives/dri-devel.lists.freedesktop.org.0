Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC5B98A090
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 13:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3CC10E3ED;
	Mon, 30 Sep 2024 11:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.b="Hsrz8pTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425F110E3F0;
 Mon, 30 Sep 2024 11:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5wdreZebx+hIO6b8UfY5M+z6lqJsf400rN74nypioAc=;
 b=Hsrz8pTWfcdNzv0+3GMzM3AMEtjhgim/041sggmI8xlBA9h5Ax8l1xOv
 9XzgANw4gEAMNoZ1eaUCUgxLU3y2wB37FPzbI0VOFRwDV8V2ehYRiu2OR
 WjVmNHTF+diHPu0LQ/3qcOkEmR6o3Q7vF3j0XmzxV343BjTn5bi1Kza4i Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; d="scan'208";a="185956909"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:28 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: kernel-janitors@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 29/35] drivers/gpu/drm: Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:21:15 +0200
Message-Id: <20240930112121.95324-30-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
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

Reorganize kerneldoc parameter names to match the parameter
order in the function header.

Problems identified using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |    2 +-
 drivers/gpu/drm/radeon/radeon_ib.c     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 6005280f5f38..ad4fdd4d4d82 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2773,11 +2773,11 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
  * amdgpu_vm_handle_fault - graceful handling of VM faults.
  * @adev: amdgpu device pointer
  * @pasid: PASID of the VM
- * @ts: Timestamp of the fault
  * @vmid: VMID, only used for GFX 9.4.3.
  * @node_id: Node_id received in IH cookie. Only applicable for
  *           GFX 9.4.3.
  * @addr: Address of the fault
+ * @ts: Timestamp of the fault
  * @write_fault: true is write fault, false is read fault
  *
  * Try to gracefully handle a VM fault. Return true if the fault was handled and
diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/radeon_ib.c
index 1aa41cc3f991..8611a27dfb3d 100644
--- a/drivers/gpu/drm/radeon/radeon_ib.c
+++ b/drivers/gpu/drm/radeon/radeon_ib.c
@@ -49,8 +49,8 @@ static void radeon_debugfs_sa_init(struct radeon_device *rdev);
  *
  * @rdev: radeon_device pointer
  * @ring: ring index the IB is associated with
- * @vm: requested vm
  * @ib: IB object returned
+ * @vm: requested vm
  * @size: requested IB size
  *
  * Request an IB (all asics).  IBs are allocated using the

