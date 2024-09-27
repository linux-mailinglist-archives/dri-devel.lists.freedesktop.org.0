Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8422987F04
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 08:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581D610EC26;
	Fri, 27 Sep 2024 06:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="FsuOPIlr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-97.freemail.mail.aliyun.com
 (out30-97.freemail.mail.aliyun.com [115.124.30.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28B510EC26;
 Fri, 27 Sep 2024 06:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1727420273; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=lm4phqS7A6HguwH5oHc4wZl+h617qLTjcXj+ufu38W8=;
 b=FsuOPIlrfughAV1cbzFrIxc4Q90x6N+4qzGEoX3XtNDvGNfL8Qj+3ESXp47fTJRysxvw6uJGrC5exZmdi5iHMPIZGPpx9EZAkGQaMPpiWSkdRUeJ3wz8qZ+2t2tG6PRO7pmtPUPdGv7YZ2ZXq0p4jv13LdrbIn8/tLKXO/x69kQ=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WFpiDnj_1727420263) by smtp.aliyun-inc.com;
 Fri, 27 Sep 2024 14:57:52 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: Felix.Kuehling@amd.com
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/amdkfd: Remove the redundant parameter comments in
 function get_wave_count
Date: Fri, 27 Sep 2024 14:57:42 +0800
Message-Id: <20240927065742.126124-1-jiapeng.chong@linux.alibaba.com>
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

This commit updates described non-existent parameters 'wave_cnt' and
'vmid', and failed to describe the existing 'queue_cnt' parameter.

drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Excess function parameter 'vmid' description in 'get_wave_count'.
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Excess function parameter 'wave_cnt' description in 'get_wave_count'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11144
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 3bc0cbf45bc5..247d927438e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -944,9 +944,7 @@ static void unlock_spi_csq_mutexes(struct amdgpu_device *adev)
  *
  * @adev: Handle of device whose registers are to be read
  * @queue_idx: Index of queue in the queue-map bit-field
- * @wave_cnt: Output parameter updated with number of waves in flight
- * @vmid: Output parameter updated with VMID of queue whose wave count
- *        is being collected
+ * @queue_cnt: Output parameter updated with number of waves in flight
  * @inst: xcc's instance number on a multi-XCC setup
  */
 static void get_wave_count(struct amdgpu_device *adev, int queue_idx,
-- 
2.32.0.3.g01195cf9f

