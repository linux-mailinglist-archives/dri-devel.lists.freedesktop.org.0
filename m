Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D2D82A96F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F7310E82F;
	Thu, 11 Jan 2024 08:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7190E10E028;
 Thu, 11 Jan 2024 02:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=SALJLRmBOXzxBM8mcf
 sgEpWIGewiMx1rbO76aYGKWys=; b=IqhOuiAf9hGx6agbB6/LPBHc2iIGlyGfD9
 edcTWvkWsZI2jtKzWjJbu5asdpmnqV4Xw5hz/vjTwD0jCig6j0YIxl15oT0uteXT
 q7rGeqUW9EuQ0ZtAWD4FgYE9NlqgRYEU4H3iKDbO5O71Ls9g7MNsneqOB4WBRb/f
 0S9ArffuY=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-5 (Coremail) with SMTP id _____wD3f1IHUp9lQUUtAA--.20942S2;
 Thu, 11 Jan 2024 10:27:20 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: christian.koenig@amd.com, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: Clean up errors in amdgpu.h
Date: Thu, 11 Jan 2024 02:27:18 +0000
Message-Id: <20240111022718.6415-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3f1IHUp9lQUUtAA--.20942S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DCF48KF1fuF4rZr15CFg_yoWkXFb_CF
 WUAF98Wr43GFnYqr13uw4fZ3yqvr1YvF1kWw1agF9ayr9rZrW5ArWDCryxXw4fua1xWF1D
 u39Ygr15C3ZakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRt8nDUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHA5ixWV2zz6dAAAAsK
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 616b6c911767..189bf62076f3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -114,14 +114,12 @@
 
 #define MAX_GPU_INSTANCE		64
 
-struct amdgpu_gpu_instance
-{
+struct amdgpu_gpu_instance {
 	struct amdgpu_device		*adev;
 	int				mgpu_fan_enabled;
 };
 
-struct amdgpu_mgpu_info
-{
+struct amdgpu_mgpu_info {
 	struct amdgpu_gpu_instance	gpu_ins[MAX_GPU_INSTANCE];
 	struct mutex			mutex;
 	uint32_t			num_gpu;
@@ -140,8 +138,7 @@ enum amdgpu_ss {
 	AMDGPU_SS_DRV_UNLOAD
 };
 
-struct amdgpu_watchdog_timer
-{
+struct amdgpu_watchdog_timer {
 	bool timeout_fatal_disable;
 	uint32_t period; /* maxCycles = (1 << period), the number of cycles before a timeout */
 };
-- 
2.17.1

