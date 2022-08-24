Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C3E59FDFA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CF0B6C2D;
	Wed, 24 Aug 2022 15:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A22B4BBA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 13:05:05 +0000 (UTC)
X-QQ-mid: bizesmtp81t1661346298tp843bcd
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 24 Aug 2022 21:04:56 +0800 (CST)
X-QQ-SSF: 01000000002000C0E000B00A0000000
X-QQ-FEAT: +ynUkgUhZJkLxFtXN86+G8go8a45t2aO+VokbAhAjSgUtoGyXv/Qd8qE9QoS3
 L1pRXk+dh45bkdtBatHvkWSfwpxIxM8DydQz9CmG2HEYMWJCYI9gklWbE5OjFHpgfhC5gPi
 QVw8xjWaVB3m+SDybAMqTWaXiY6abH+hv2lFB4u92s/NJUM9uKQHl++CPgKUe5dcOBbQ+CM
 uRw99H/h+YoiuaGowC/BqE2fDL5swpgPU1jqnjM/Tq+76Y9myTWFmUvxflT2j80DHpyfn0q
 1U0k2oYhBOOSkPU5Bs20RqlWpgfUUpHozruy32co459sHcNHrSZoqSLkgaS++jLW7TCuX9S
 oju0GFtUBTtMhatIC6qhMtRA+90n0gFgumNAdN47rX01wLKXCXppMUZRng/oN4Lfz52R7Kl
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: jyri.sarha@iki.fi,
	tomba@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/tidss: fix repeated words in comments
Date: Wed, 24 Aug 2022 21:04:50 +0800
Message-Id: <20220824130450.41703-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Wed, 24 Aug 2022 15:12:28 +0000
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

 Delete the redundant word 'to'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/tidss/tidss_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 666e527a0acf..7de3a5ffe5bc 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -71,7 +71,7 @@ static int tidss_atomic_check(struct drm_device *ddev,
 	 * changes. This is needed for updating the plane positions in
 	 * tidss_crtc_position_planes() which is called from
 	 * crtc_atomic_enable() and crtc_atomic_flush(). We have an
-	 * extra flag to to mark x,y-position changes and together
+	 * extra flag to mark x,y-position changes and together
 	 * with zpos_changed the condition recognizes all the above
 	 * cases.
 	 */
-- 
2.36.1

