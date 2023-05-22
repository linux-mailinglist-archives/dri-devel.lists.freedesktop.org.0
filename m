Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2846070BC46
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD7E10E2E5;
	Mon, 22 May 2023 11:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783D710E2E5;
 Mon, 22 May 2023 11:51:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDAB7612C9;
 Mon, 22 May 2023 11:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550AAC433A4;
 Mon, 22 May 2023 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684756264;
 bh=szmrPmHTQLnRtVQcOtk/x9k4n4WQpP8KG9U8nQyW8HE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mHh8Co7FjWQjIRcRi1Dv1AMZ4QS23p4Dzcc5qSVyLgs2GvEFnQHeR2HtI4JHfYo0S
 yUlj6JHcwUASFNh5a/ZhrJj8mZJD0vSKOWblNid56d1XKirRmIa9YZA0HRm3bh3/nj
 9HOd7yEU/cEhwRDTpoTXY00qhqaJYCp45YBnV1p4l5qAjuTe5g3YV2T0E59i0tmJt0
 AT50TXu871r/yZ9Ey8iAnJSIE7vHbf7dGTTfXgOnC5Y4lZRAWRJieeU/MAbeTF90kn
 M+ajfKqdwQYmjU4z7tPH62TeFUltAnUl2lq0VGBDDmfb3lh2pb+SvDvNPNPqsgInYb
 NA0Mew3LL64Ew==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mukul Joshi <mukul.joshi@amd.com>
Subject: [PATCH 2/5] drm/amdkfd: mark local functions as static
Date: Mon, 22 May 2023 13:50:29 +0200
Message-Id: <20230522115047.1169839-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522115047.1169839-1-arnd@kernel.org>
References: <20230522115047.1169839-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Amber Lin <Amber.Lin@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Le Ma <Le.Ma@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The file was newly added and causes some -Wmissing-prototype warnings:

drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c:57:5: error: no previous prototype for 'kgd_gfx_v9_4_3_hqd_sdma_load' [-Werror=missing-prototypes]
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c:126:5: error: no previous prototype for 'kgd_gfx_v9_4_3_hqd_sdma_dump' [-Werror=missing-prototypes]
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c:163:6: error: no previous prototype for 'kgd_gfx_v9_4_3_hqd_sdma_is_occupied' [-Werror=missing-prototypes]
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c:181:5: error: no previous prototype for 'kgd_gfx_v9_4_3_hqd_sdma_destroy' [-Werror=missing-prototypes]

Mark these all as 'static' since there are no outside callers.

Fixes: 09a95a85cf3e ("drm/amdkfd: Update SDMA queue management for GFX9.4.3")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c
index 81dfbe39fd8e..5b4b7f8b92a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c
@@ -54,7 +54,7 @@ static uint32_t get_sdma_rlc_reg_offset(struct amdgpu_device *adev,
 	return retval;
 }
 
-int kgd_gfx_v9_4_3_hqd_sdma_load(struct amdgpu_device *adev, void *mqd,
+static int kgd_gfx_v9_4_3_hqd_sdma_load(struct amdgpu_device *adev, void *mqd,
 				 uint32_t __user *wptr, struct mm_struct *mm)
 {
 	struct v9_sdma_mqd *m;
@@ -123,7 +123,7 @@ int kgd_gfx_v9_4_3_hqd_sdma_load(struct amdgpu_device *adev, void *mqd,
 	return 0;
 }
 
-int kgd_gfx_v9_4_3_hqd_sdma_dump(struct amdgpu_device *adev,
+static int kgd_gfx_v9_4_3_hqd_sdma_dump(struct amdgpu_device *adev,
 				 uint32_t engine_id, uint32_t queue_id,
 				 uint32_t (**dump)[2], uint32_t *n_regs)
 {
@@ -160,7 +160,7 @@ int kgd_gfx_v9_4_3_hqd_sdma_dump(struct amdgpu_device *adev,
 	return 0;
 }
 
-bool kgd_gfx_v9_4_3_hqd_sdma_is_occupied(struct amdgpu_device *adev, void *mqd)
+static bool kgd_gfx_v9_4_3_hqd_sdma_is_occupied(struct amdgpu_device *adev, void *mqd)
 {
 	struct v9_sdma_mqd *m;
 	uint32_t sdma_rlc_reg_offset;
@@ -178,7 +178,7 @@ bool kgd_gfx_v9_4_3_hqd_sdma_is_occupied(struct amdgpu_device *adev, void *mqd)
 	return false;
 }
 
-int kgd_gfx_v9_4_3_hqd_sdma_destroy(struct amdgpu_device *adev, void *mqd,
+static int kgd_gfx_v9_4_3_hqd_sdma_destroy(struct amdgpu_device *adev, void *mqd,
 				    unsigned int utimeout)
 {
 	struct v9_sdma_mqd *m;
-- 
2.39.2

