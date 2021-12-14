Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B51474B14
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 19:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F14710E12F;
	Tue, 14 Dec 2021 18:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 448 seconds by postgrey-1.36 at gabe;
 Tue, 14 Dec 2021 14:02:35 UTC
Received: from smtpbg501.qq.com (smtpbg501.qq.com [203.205.250.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3CD10E119;
 Tue, 14 Dec 2021 14:02:35 +0000 (UTC)
X-QQ-mid: bizesmtp46t1639489947t4knmgn0
Received: from wangx.lan (unknown [171.221.148.2])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 14 Dec 2021 21:52:19 +0800 (CST)
X-QQ-SSF: 0100000000200090C000B00A0000000
X-QQ-FEAT: eTtJes0duVuCV5I93GIB5ZyjA1+F5l2Dnf6qN24mxYOihzHztWcvdOgxEkCCa
 xz1TlrTAmtFmvsa8csE4t08n5PSZFY5PmMgyImpBqir0QDkeLuBClrnFH0HcxFArQ/5XG1H
 QTdrX0k+6hpRSWIecxKu5GlelLBat3YCEI9fTBJCp6nI05Jx1gSAkFFP1mpZIYlvEK7l9B9
 cGQtGI2mRNodkr7MHyBDQWWNTm33hhKZygr5phkqN15CQehSMJQv6AYpIYx5siCGFTc5XSY
 bZcIFptTIGFbZiJshCv4cP3bSLhOEWjsKT9efdu8J7U3mYGzQshagYGSlhbKZY3tjo9Pl5r
 Coo7DllVHSccTqgKsWe3Z0aHtse2A==
X-QQ-GoodBg: 0
From: Xiang wangx <wangxiang@cdjrlc.com>
To: airlied@linux.ie
Subject: [PATCH] drm/radeon: Fix syntax errors in comments
Date: Tue, 14 Dec 2021 21:52:17 +0800
Message-Id: <20211214135217.24444-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam2
X-Mailman-Approved-At: Tue, 14 Dec 2021 18:40:39 +0000
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'we'.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/gpu/drm/radeon/radeon_vce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon/radeon_vce.c
index 511a942e851d..ca4a36464340 100644
--- a/drivers/gpu/drm/radeon/radeon_vce.c
+++ b/drivers/gpu/drm/radeon/radeon_vce.c
@@ -513,7 +513,7 @@ int radeon_vce_cs_reloc(struct radeon_cs_parser *p, int lo, int hi,
  * @allocated: allocated a new handle?
  *
  * Validates the handle and return the found session index or -EINVAL
- * we we don't have another free session index.
+ * we don't have another free session index.
  */
 static int radeon_vce_validate_handle(struct radeon_cs_parser *p,
 				      uint32_t handle, bool *allocated)
-- 
2.20.1

