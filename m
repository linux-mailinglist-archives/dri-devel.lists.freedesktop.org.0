Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B00A2913FD
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9569E6E220;
	Sat, 17 Oct 2020 19:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D556EC44
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 08:59:45 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D4D048F5487FF12A17A7;
 Thu, 15 Oct 2020 16:59:38 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 15 Oct 2020 16:59:30 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon v2 2/2] drm/hisilicon: Use the same style of
 variable type in hibmc_drm_drv
Date: Thu, 15 Oct 2020 17:00:17 +0800
Message-ID: <1602752417-20598-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602752417-20598-1-git-send-email-tiantao6@hisilicon.com>
References: <1602752417-20598-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Consistently Use the same style of variable type in hibmc_drm_drv.c and
hibmc_drm_drv.h.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 13 ++++++-------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h |  8 ++++----
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 5632bce..0c1b40d 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -121,12 +121,11 @@ static void hibmc_kms_fini(struct hibmc_drm_private *priv)
 /*
  * It can operate in one of three modes: 0, 1 or Sleep.
  */
-void hibmc_set_power_mode(struct hibmc_drm_private *priv,
-			  unsigned int power_mode)
+void hibmc_set_power_mode(struct hibmc_drm_private *priv, u32 power_mode)
 {
-	unsigned int control_value = 0;
+	u32 control_value = 0;
 	void __iomem   *mmio = priv->mmio;
-	unsigned int input = 1;
+	u32 input = 1;
 
 	if (power_mode > HIBMC_PW_MODE_CTL_MODE_SLEEP)
 		return;
@@ -144,8 +143,8 @@ void hibmc_set_power_mode(struct hibmc_drm_private *priv,
 
 void hibmc_set_current_gate(struct hibmc_drm_private *priv, unsigned int gate)
 {
-	unsigned int gate_reg;
-	unsigned int mode;
+	u32 gate_reg;
+	u32 mode;
 	void __iomem   *mmio = priv->mmio;
 
 	/* Get current power mode. */
@@ -170,7 +169,7 @@ void hibmc_set_current_gate(struct hibmc_drm_private *priv, unsigned int gate)
 
 static void hibmc_hw_config(struct hibmc_drm_private *priv)
 {
-	unsigned int reg;
+	u32 reg;
 
 	/* On hardware reset, power mode 0 is default. */
 	hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_MODE0);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index 6a63502..5c4030d 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -33,8 +33,8 @@ struct hibmc_drm_private {
 	/* hw */
 	void __iomem   *mmio;
 	void __iomem   *fb_map;
-	unsigned long  fb_base;
-	unsigned long  fb_size;
+	u64  fb_base;
+	u64  fb_size;
 
 	/* drm */
 	struct drm_device  *dev;
@@ -56,9 +56,9 @@ static inline struct hibmc_drm_private *to_hibmc_drm_private(struct drm_device *
 }
 
 void hibmc_set_power_mode(struct hibmc_drm_private *priv,
-			  unsigned int power_mode);
+			  u32 power_mode);
 void hibmc_set_current_gate(struct hibmc_drm_private *priv,
-			    unsigned int gate);
+			    u32 gate);
 
 int hibmc_de_init(struct hibmc_drm_private *priv);
 int hibmc_vdac_init(struct hibmc_drm_private *priv);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
