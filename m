Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDBB55779C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 12:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ECC113DCB;
	Thu, 23 Jun 2022 10:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05580113CAC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 10:15:07 +0000 (UTC)
X-QQ-mid: bizesmtp80t1655979295tq1gavlg
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 23 Jun 2022 18:14:50 +0800 (CST)
X-QQ-SSF: 01000000008000B0C000B00A0000000
X-QQ-FEAT: qpGeUh0uYB9S1TzaUBc1+BFLhEgoP88Y8lak3PyjSnXOH66GM4RrMOqIgHykO
 ErGJfCB20o+zSjTY6lHkeKoiYQlLIL66dJ3AeJivoSvBmbp/e0rkw5VGOxBpo8vvj/9bHGR
 qvyJGXa0RKmx6iFqjkZu/hQ/ICSBWpTPCbBhUW37n6/lPKzYKAZp3V1XQ7uxx4Nom/wLn9Q
 AXC3ZzzqoRWdpPvil9xcdqtenONfOn/JVgK/Z7dqT/tsI7ObL1kQrBdDOCYwNzcEv9PUmMu
 QIfsjn0Pv+TS9efMQaiFBCjZvhnvUQisgGSDWxmQr2+C0ca5EqWAo8vhORlIh6xgYYqEQWP
 FhzDiVza4CtcfJ5k5TBrIxVtT4uqA==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: drop unexpected word 'for' in comments
Date: Thu, 23 Jun 2022 18:14:48 +0800
Message-Id: <20220623101448.30188-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
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
Cc: Philip.Yang@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jiang Jian <jiangjian@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word 'for' in the comments that need to be dropped

file - drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
line - 245

 * position and also advance the position for for Vega10

changed to:

 * position and also advance the position for Vega10

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
index 3df146579ad9..1d5af50331e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
@@ -242,7 +242,7 @@ int amdgpu_ih_process(struct amdgpu_device *adev, struct amdgpu_ih_ring *ih)
  * @entry: IV entry
  *
  * Decodes the interrupt vector at the current rptr
- * position and also advance the position for for Vega10
+ * position and also advance the position for Vega10
  * and later GPUs.
  */
 void amdgpu_ih_decode_iv_helper(struct amdgpu_device *adev,
-- 
2.17.1

