Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA5B493D5F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6417510E394;
	Wed, 19 Jan 2022 15:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 170676 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jan 2022 15:39:35 UTC
Received: from zg8tmtyylji0my4xnjqunzqa.icoremail.net
 (zg8tmtyylji0my4xnjqunzqa.icoremail.net [162.243.164.74])
 by gabe.freedesktop.org (Postfix) with SMTP id 3035188830
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=4QbeHj/mFxJ/v8fgqCZQeYHZiwI5/cy8jAzM9NG4I58=; b=d
 Nd/jNdsIacO8SRJmfAqrH6lbLiZZkSJsrcLG4CSzABDY7NK63PmcTEOIvJ/xe5Tp
 avqni9Xd1/71yMZbYKT4IR0aLNAkiT3IIryRCCNKfFNqpRsX8hOkTbW6wZ7SyrPP
 lF97qAd7DfljiMwru5b75dhPbLIzW9mWAcJjdT6ws4=
Received: from localhost (unknown [10.129.21.144])
 by front02 (Coremail) with SMTP id 54FpogCHjfXiL+hh9uF+AA--.10415S2;
 Wed, 19 Jan 2022 23:36:02 +0800 (CST)
From: Yongzhi Liu <lyz_cs@pku.edu.cn>
To: a.hajda@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/bridge: Add missing pm_runtime_put_sync
Date: Wed, 19 Jan 2022 07:36:00 -0800
Message-Id: <1642606560-32287-1-git-send-email-lyz_cs@pku.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: 54FpogCHjfXiL+hh9uF+AA--.10415S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4Utw48CF4DAr45GrWkCrg_yoW8CFWfpF
 4Ig34YyrW0vFZ7Kw4xAr1DZryru3s3tFW8CrW2qwn7Zw1Yy3Wqqr43AFWaqFyFgFy5Ar1U
 Jr4ktFyfuFy0qr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
 vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxE
 wVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26w4UJr1UMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUb0D73UUUUU==
X-CM-SenderInfo: irzqijirqukmo6sn3hxhgxhubq/1tbiAwEKBlPy7uA+KwAssY
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
Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pm_runtime_get_sync() will increase the rumtime PM counter
even it returns an error. Thus a pairing decrement is needed
to prevent refcount leak. Fix this by replacing this API with
pm_runtime_resume_and_get(), which will not change the runtime
PM counter on error. Besides, a matching decrement is needed
on the error handling path to keep the counter balanced.

Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 9282e61..e7dce5a 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -862,18 +862,19 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	memcpy(&dsi->mode, adjusted_mode, sizeof(dsi->mode));
 	drm_mode_debug_printmodeline(adjusted_mode);
 
-	pm_runtime_get_sync(dev);
+	if (pm_runtime_resume_and_get(dev) < 0)
+		return;
 
 	if (clk_prepare_enable(dsi->lcdif_clk) < 0)
-		return;
+		goto runtime_put;
 	if (clk_prepare_enable(dsi->core_clk) < 0)
-		return;
+		goto runtime_put;
 
 	/* Step 1 from DSI reset-out instructions */
 	ret = reset_control_deassert(dsi->rst_pclk);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to deassert PCLK: %d\n", ret);
-		return;
+		goto runtime_put;
 	}
 
 	/* Step 2 from DSI reset-out instructions */
@@ -883,13 +884,17 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	ret = reset_control_deassert(dsi->rst_esc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to deassert ESC: %d\n", ret);
-		return;
+		goto runtime_put;
 	}
 	ret = reset_control_deassert(dsi->rst_byte);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to deassert BYTE: %d\n", ret);
-		return;
+		goto runtime_put;
 	}
+
+runtime_put:
+	pm_runtime_put_sync(dev);
+	return;
 }
 
 static void
-- 
2.7.4

