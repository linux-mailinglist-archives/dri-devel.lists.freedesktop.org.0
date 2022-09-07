Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B95B02DC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 13:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4208910E5AC;
	Wed,  7 Sep 2022 11:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BF110E5C5;
 Wed,  7 Sep 2022 11:27:10 +0000 (UTC)
X-QQ-mid: bizesmtp70t1662550025tjf5rbk4
Received: from localhost.localdomain ( [182.148.14.0])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Sep 2022 19:27:03 +0800 (CST)
X-QQ-SSF: 01000000002000D0F000B00A0000000
X-QQ-FEAT: tyV+f0f3wWeQiR6EYZ3U6gcbzZzTNIw1jhLYW1neIWk2Dze/dTI9mm0Js0y0w
 40J2DsHskt8+GcB+WaxWWkWGpbGut8Zdjo7kRU7KpqeiWBOJTsTjOP0048iTBrcqWwjRh6Y
 5GEqgiBPNCiR9R/5DMlndFyTfiPfuccw0o/wtB3nSHiMswA9xqwpAkLCiRR2K73frFU4YBM
 o/XJKQe9lAU0u8kBhbBgZ9/UpxNIiPJGcD8EVRXB0NDEp5Pw2jlHkFn/2qMTCXYNRzg4K99
 6+X1HQ4odbZ3XWMb+eytYqV62VLuv8OAppF5eODOk2hkkA2Ocd7sP6P1K8mAk9kWx1LaLeb
 5NgbLIg15oEiE5ArTtgfbFjyJ71mwT+Jo+gnuZs8XMV32j+7OzuGw8/h03E9g==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	isabbasso@riseup.net
Subject: [PATCH] drm/amdgpu: fix repeated words in comments
Date: Wed,  7 Sep 2022 19:26:57 +0800
Message-Id: <20220907112657.25150-1-yuanjilin@cdjrlc.com>
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

Delete the redundant word 'we'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 02cb3a12dd76..6d6cc4637d41 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -694,7 +694,7 @@ static int amdgpu_vce_cs_reloc(struct amdgpu_cs_parser *p, struct amdgpu_ib *ib,
  * @allocated: allocated a new handle?
  *
  * Validates the handle and return the found session index or -EINVAL
- * we we don't have another free session index.
+ * we don't have another free session index.
  */
 static int amdgpu_vce_validate_handle(struct amdgpu_cs_parser *p,
 				      uint32_t handle, uint32_t *allocated)
-- 
2.36.1

