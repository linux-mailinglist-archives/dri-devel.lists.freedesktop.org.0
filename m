Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ACBA7D40D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 08:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0380410E176;
	Mon,  7 Apr 2025 06:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="dCfQ19ol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Mon, 07 Apr 2025 06:31:31 UTC
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E67C10E176;
 Mon,  7 Apr 2025 06:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1744007488; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=DObvmwmunJaaAhLjmCutZTbFoMNGkv4Jl5PNPWs0lKw=;
 b=dCfQ19olUFh1wG7+ihVrn2FsRxOkkDY/I0JXUkAZuF9fnstr2cyYWYLvvAr8yB9hFcnXgY4exya85S0tr9NC9m1eQHzTk5PaXcTbL72egcFgnUTMplLkB0WcKQUm8mRSduUiQOkCt+AnCFnFjg8999YxYRqqzY4prl2BZgo9GrY=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0WVoemxs_1744007180 cluster:ay36) by smtp.aliyun-inc.com;
 Mon, 07 Apr 2025 14:26:21 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch,
 christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/amdgpu: Improve documentation for
 amdgpu_sdma_register_on_reset_callbacks
Date: Mon,  7 Apr 2025 14:26:19 +0800
Message-Id: <20250407062619.62026-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
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

The function amdgpu_sdma_register_on_reset_callbacks lacked detailed
parameter descriptions in its documentation. This patch improves the
documentation by adding specific details about the parameters and their
usage, enhancing clarity for developers.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=20167
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 529c9696c2f3..add252368dc2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -539,6 +539,7 @@ bool amdgpu_sdma_is_shared_inv_eng(struct amdgpu_device *adev, struct amdgpu_rin
 
 /**
  * amdgpu_sdma_register_on_reset_callbacks - Register SDMA reset callbacks
+ * @adev: Pointer to the amdgpu_device structure representing the GPU device
  * @funcs: Pointer to the callback structure containing pre_reset and post_reset functions
  *
  * This function allows KFD and AMDGPU to register their own callbacks for handling
-- 
2.32.0.3.g01195cf9f

