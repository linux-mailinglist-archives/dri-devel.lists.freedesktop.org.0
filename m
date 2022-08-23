Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E9E5A02CA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667B6A1A72;
	Wed, 24 Aug 2022 20:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254A814A022
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 12:16:00 +0000 (UTC)
X-QQ-mid: bizesmtp83t1661256953tey1azri
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 20:15:51 +0800 (CST)
X-QQ-SSF: 01000000002000C0D000B00A0000000
X-QQ-FEAT: XBN7tc9DADKOu7nqgEn/xfy1ddb7BNa8BsdiV45GuuyAjUHAfmb3VhwZRoVY6
 PGj/QHiiaJX0zblpPzgPPoVCIfjPDCuT5+5SyPVeqczjxvxlvSg7mmVk8EVLuiIxeaSkQIX
 YtU89wfeK4/D/9jwOWgNA9UZFukNGpJIWb5tx962ANkF+0exmusw8ZfvG57TdRh+Uz4J3JZ
 Hxs8JfKCkzlAUvP1pRDQwSHgw5QtXCRR1xh1sUmECJVlevMdaxnhURSdJvT8YucasJHAGhI
 J+Ix95SaLzIoAeDPUzZJa/zUKRlCFCfyVqeTbY7u/6av/zCE/fmWye68vapIASTi1THtjgk
 DyGt7NHNAujs64dxBzOYY1xvXwkgrk6ablIRkUj7FfJ2wGc5iail7bttd2OulRhikMMhFed
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu/drm: fix repeated words in comments
Date: Tue, 23 Aug 2022 20:15:44 +0800
Message-Id: <20220823121544.9082-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'old'.
 Delete the redundant word 'new'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/drm_context.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
index c6e6a3e7219a..2d871159162b 100644
--- a/drivers/gpu/drm/drm_context.c
+++ b/drivers/gpu/drm/drm_context.c
@@ -267,8 +267,8 @@ int drm_legacy_setsareactx(struct drm_device *dev, void *data,
  * Switch context.
  *
  * \param dev DRM device.
- * \param old old context handle.
- * \param new new context handle.
+ * \param old context handle.
+ * \param new context handle.
  * \return zero on success or a negative number on failure.
  *
  * Attempt to set drm_device::context_flag.
@@ -294,7 +294,7 @@ static int drm_context_switch(struct drm_device * dev, int old, int new)
  * Complete context switch.
  *
  * \param dev DRM device.
- * \param new new context handle.
+ * \param new context handle.
  * \return zero on success or a negative number on failure.
  *
  * Updates drm_device::last_context and drm_device::last_switch. Verifies the
-- 
2.36.1

