Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7AF557771
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 12:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E21910E045;
	Thu, 23 Jun 2022 10:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACB710E733
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 10:08:54 +0000 (UTC)
X-QQ-mid: bizesmtp87t1655978798t8sle0bp
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 23 Jun 2022 18:06:34 +0800 (CST)
X-QQ-SSF: 01000000008000B0C000B00A0000000
X-QQ-FEAT: ZHWZeLXy+8eUD0dPq5rRcARw3pLgA6H09Lxnt1o2JBg/eohDc8FS3FblIESZR
 qS8NiowP/Lmo8sxgVOHBKFAiKqahVpcbmQb12cB+A6xMB3DhP55L+uGwcKo25/sbKK907Bc
 zQYsYSIrdrffT6uX3Bw5EipEEfkSkbUfjn4Q7scKlf214gGAerW053TITGK7nhIGhZdaCzk
 kfe1XsJ518N5tjtis4k3dq/l4bxzo4SSjMsuRk2df6e6kK9ctEBtbNsqyno9K3aQT4PvKSv
 Rlkb3+mCyx8zB1ZXcAmtUfB7U5xeoiu6ol8n5Xq/y9dmE0HPqt7mDiE9ujVta3KrbfXeYWw
 IeywhgjrwmTO30twNhTcWAiztvlRg==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] gpu: drm: selftests: drop unexpected word 'for' in comments
Date: Thu, 23 Jun 2022 18:06:32 +0800
Message-Id: <20220623100632.27056-1-jiangjian@cdjrlc.com>
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangjian@cdjrlc.com, alexander.deucher@amd.com,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word 'for' in the comments that need to be dropped

file - ./drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
line - 3

* Test cases for for the DRM DP MST helpers

changed to:

* Test cases for the DRM DP MST helpers

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
index 967c52150b67..4caa9be900ac 100644
--- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Test cases for for the DRM DP MST helpers
+ * Test cases for the DRM DP MST helpers
  */
 
 #define PREFIX_STR "[drm_dp_mst_helper]"
-- 
2.17.1

