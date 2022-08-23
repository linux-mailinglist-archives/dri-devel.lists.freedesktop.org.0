Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2991C59F43A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9390310E576;
	Wed, 24 Aug 2022 07:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889F410FF3B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 12:24:44 +0000 (UTC)
X-QQ-mid: bizesmtp72t1661257477tdz1ih66
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 20:24:35 +0800 (CST)
X-QQ-SSF: 01000000002000C0D000B00A0000000
X-QQ-FEAT: QityeSR92A3zzuGSIzJAtcdxbIqL34B1PehVthBKRy5VFFSs1nL1t8s0bbUJX
 Yj9cRUAKJ++nuEdSE+zGOySzq1CIBygZ7M7n/P0G6aoBPxdv/7niZjdKF8DjSQH/5Kp7U4y
 cLI8exuULS+NAv8sUnmC9/qI4x7qrjhgkM5b2ZLAM+4M8MY2r3JvShfhIRzGnFj8IpQaqsX
 GpyVoCowXeNFt8VPXKtH2WzZ/B57Er4gJ7yVdcfXWWKYmi4eUEZgZ2U7j0i5WCzINTZbHDJ
 qI9tFz+oxO8ufl6+6o5ASUnLCzSevLNTRnteFMJapsxvPUPlZV9yLdxa6mZVKeC//FEk7wc
 PvkdXc2/0KSWYPp+e4tZWfPqYPbV0jN/fvgirFX1Tzh9M5eE0Gc64Q/bJfjOoME2MwwNmGt
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/gma500: fix repeated words in comments
Date: Tue, 23 Aug 2022 20:24:27 +0800
Message-Id: <20220823122427.18762-1-yuanjilin@cdjrlc.com>
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

 Delete the redundant word 'the'.
 Delete the redundant word 'for'.
 Delete the redundant word 'really'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c  | 2 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c | 2 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 9ee99a7d4fbe..a286861ffa3f 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -114,7 +114,7 @@ i2c_algo_dp_aux_stop(struct i2c_adapter *adapter, bool reading)
 
 /*
  * Write a single byte to the current I2C address, the
- * the I2C link must be running or this returns -EIO
+ * I2C link must be running or this returns -EIO
  */
 static int
 i2c_algo_dp_aux_put_byte(struct i2c_adapter *adapter, u8 byte)
diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index 22398d34853a..407ce948bf68 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -309,7 +309,7 @@ static void oaktrail_crtc_dpms(struct drm_crtc *crtc, int mode)
 						   temp & ~PIPEACONF_ENABLE, i);
 				REG_READ_WITH_AUX(map->conf, i);
 			}
-			/* Wait for for the pipe disable to take effect. */
+			/* Wait for the pipe disable to take effect. */
 			gma_wait_for_vblank(dev);
 
 			temp = REG_READ_WITH_AUX(map->dpll, i);
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index b5946a1cdcd5..6b6f2e162ebd 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -225,7 +225,7 @@ static void scu_busy_loop(void __iomem *scu_base)
 }
 
 /*
- *	You don't want to know, you really really don't want to know....
+ *	You don't want to know, you really don't want to know....
  *
  *	This is magic. However it's safe magic because of the way the platform
  *	works and it is necessary magic.
-- 
2.36.1

