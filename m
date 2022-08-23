Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B64D759F462
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC2C10E493;
	Wed, 24 Aug 2022 07:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFAD113A94
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:13:13 +0000 (UTC)
X-QQ-mid: bizesmtp83t1661263987tvsjyje9
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 22:13:05 +0800 (CST)
X-QQ-SSF: 0100000000200040B000B00A0000000
X-QQ-FEAT: 7jw2iSiCazoxMSclW6PN5wLbkkpq/R/rMTmC0eGoqLvPIJxpBnLVIzRsLMAg/
 upG5xdRWhzuj9O0nPaTVSO+OI3lrvUEnp9WpqnqTthEkrwUURNEGbpaYoCZ7rtwovfvk+d0
 sDnB8ApoYGIhjNvKFOtxLg9yLays9Ruy2jmZLSPxUOufAhRnywTbUqFWtxt+UHZwSW+d4qT
 Tr4WE5j+9d8c1Xmb3EgV+EglZn3gQBWC0AaKk2JC+DhOZ7plUL9CB2zHD7Vt+8xiRaxf7fB
 XPqmCOUnLMqzfHxndgC80hitO3yB3cNr7JL+hlvtMkGrW1jo2ac9y6JKpqq3L2rQAY/zqCY
 rMa19kO8NGxjxOqjF7pFpAsgkojSVwxAlqYaVri4P2Mg9Fn/rEN5i0ebm4/5Q==
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 irlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu/drm: fix repeated words in comments
Date: Tue, 23 Aug 2022 22:12:59 +0800
Message-Id: <20220823141259.10668-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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
Cc: wangjianli <wangjianli@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'the'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/drm_rect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_rect.c b/drivers/gpu/drm/drm_rect.c
index 0460e874896e..8873922d6dee 100644
--- a/drivers/gpu/drm/drm_rect.c
+++ b/drivers/gpu/drm/drm_rect.c
@@ -81,7 +81,7 @@ static u32 clip_scaled(int src, int dst, int *clip)
  * @clip: clip rectangle
  *
  * Clip rectangle @dst by rectangle @clip. Clip rectangle @src by the
- * the corresponding amounts, retaining the vertical and horizontal scaling
+ * corresponding amounts, retaining the vertical and horizontal scaling
  * factors from @src to @dst.
  *
  * RETURNS:
-- 
2.36.1

