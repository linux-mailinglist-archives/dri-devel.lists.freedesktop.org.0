Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3B5B0329
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 13:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EA110E5C6;
	Wed,  7 Sep 2022 11:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C108A10E5C6;
 Wed,  7 Sep 2022 11:34:14 +0000 (UTC)
X-QQ-mid: bizesmtp70t1662550448t7p0sw9z
Received: from localhost.localdomain ( [182.148.14.0])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Sep 2022 19:34:06 +0800 (CST)
X-QQ-SSF: 01000000002000D0F000B00A0000000
X-QQ-FEAT: tyV+f0f3wWf3mzAF6yuQD2XFCuVrWLDfbXKR9+7cPP3XEZkE/o20yVe8bxTU6
 weyb0VEV+AoU5qA3QVTolXruJk+6Jjrv7a4skhXx55wFjqrY0CqBGa19yWmoznLSwpdBvFP
 ld2ZLW7zrewWopwIAn4v7RcgE07fI3/TxxeqnuIabTORAVM42cM24jI6n0Yzask+RdpuQeY
 7UQBwDVjrZoQgJ1YGu1cP3QuHHLyaFhiFqdSO/VNkZ4SnIz+VAvMyYJartdonSezEvZHw4N
 YT5x62FDG6Z8A6Det6SPGWM+e0tt98mPguxzV16oJsQZjDhT7nf9rW+JOcHZcG8Sq/PAaYt
 VjTToQVece6xD1m5VKKsEul0H/9wN/eENneqoeuO+COQ+SAuUgaKsWtPg+uQw==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	shaoyun.liu@amd.com
Subject: [PATCH] drm/amdgpu: fix repeated words in comments
Date: Wed,  7 Sep 2022 19:34:00 +0800
Message-Id: <20220907113400.30590-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'and'.
Delete the redundant word 'in'.
Delete the redundant word 'the'.
Delete the redundant word 'are'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index afaa1056e039..71367b9dd590 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -958,7 +958,7 @@ static void amdgpu_device_vram_scratch_fini(struct amdgpu_device *adev)
  * @registers: pointer to the register array
  * @array_size: size of the register array
  *
- * Programs an array or registers with and and or masks.
+ * Programs an array or registers with and or masks.
  * This is a helper for setting golden registers.
  */
 void amdgpu_device_program_register_sequence(struct amdgpu_device *adev,
@@ -1569,7 +1569,7 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
  * @state: vga_switcheroo state
  *
  * Callback for the switcheroo driver.  Suspends or resumes the
- * the asics before or after it is powered up using ACPI methods.
+ * asics before or after it is powered up using ACPI methods.
  */
 static void amdgpu_switcheroo_set_state(struct pci_dev *pdev,
 					enum vga_switcheroo_state state)
@@ -3203,7 +3203,7 @@ static int amdgpu_device_ip_resume_phase2(struct amdgpu_device *adev)
  *
  * Main resume function for hardware IPs.  The hardware IPs
  * are split into two resume functions because they are
- * are also used in in recovering from a GPU reset and some additional
+ * also used in recovering from a GPU reset and some additional
  * steps need to be take between them.  In this case (S3/S4) they are
  * run sequentially.
  * Returns 0 on success, negative error code on failure.
-- 
2.36.1

