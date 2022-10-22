Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9BD6084DA
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 08:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4556010E02D;
	Sat, 22 Oct 2022 06:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E3510E013;
 Sat, 22 Oct 2022 06:02:15 +0000 (UTC)
X-QQ-mid: bizesmtp63t1666418523te9jyncr
Received: from localhost.localdomain ( [182.148.15.254])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 22 Oct 2022 14:02:02 +0800 (CST)
X-QQ-SSF: 01000000000000C0E000000A0000000
X-QQ-FEAT: bYR630AeiPiMJZJOYuUscyfpmUVYVgvXFZ1DUHC++tzvxU8bsrZ9iNVYgttE8
 BBd8CyEwzkGOYuUk1JccjvL0QWnnDMBhcYSlGa55BsdxCssnZ3TYiEQVP5ksq5kTIkHA63g
 c2EwUUMK2iJbse6aaiyZ1fP8kfQGrJyOoDyV1gPe172dwA55oP5o6c9PMGcCc6pVnjISZ1W
 eF4nIzw/ubDmnj+DEDMdL19SGn6hdfbnn0y1caH6uvPWSjwU7RgdVrYx5vm8bngbBAUg4H5
 i93UiAh9/Im9U9LCT6YBRNnHoZKp7EHhpCbkjo9j7REu499aQTVqFrsBAG8zxAe5Sgbf8e5
 fR5dDvk8Z2Qur6DsiX0q1r3AMD5v4pv+g0tQg4mXvfaJR8B9vw=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] amd/amdgpu: fix repeated words in comments
Date: Sat, 22 Oct 2022 14:01:55 +0800
Message-Id: <20221022060155.52548-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
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
Cc: wangjianli <wangjianli@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'the'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e9155dc1c30c..3de990bbbf2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1565,7 +1565,7 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
  * @pdev: pci dev pointer
  * @state: vga_switcheroo state
  *
- * Callback for the switcheroo driver.  Suspends or resumes the
+ * Callback for the switcheroo driver.  Suspends or resumes
  * the asics before or after it is powered up using ACPI methods.
  */
 static void amdgpu_switcheroo_set_state(struct pci_dev *pdev,
-- 
2.36.1

