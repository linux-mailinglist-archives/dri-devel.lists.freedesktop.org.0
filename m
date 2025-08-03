Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2A4B19C62
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 09:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4835C10E343;
	Mon,  4 Aug 2025 07:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e6RyKTTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D5510E075
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 10:33:08 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-af934d7c932so302067366b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 03:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754217187; x=1754821987; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4oRnuP4jSrdJzDgvqaR3lx1iHlupn4sHr1B/8K6MSts=;
 b=e6RyKTTuyx503lCX6HseeMqFebI6+70qXHqVivSoGETRCt2kRmJwk7gbsnwMy2ABje
 lZFnGX0fFhO0F2jOUh+OaX0ENN6PAvBTsis0C1WcMi5eJh8g5QSKS1zNLhQYk3J9iMhJ
 2DMSLE07WJ8qJuUG8Bi8hGbQMm1uUvmDAD/bm7X3/MgI1BDeeJE1xzeY6kQIfrUR+Omu
 m90Fp8Na/zYzVgY3dnI5IpWG9NLZ8Rd8jDmmqk8NR0Y6GABksQSRd64bWxJS5hXVTsKL
 cdBYSH0k8TFolhUgpcEa88uuKauXjqCESA5S51xO/5pm7IxpeVscJqWhXvyY/EVXiSRt
 YEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754217187; x=1754821987;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4oRnuP4jSrdJzDgvqaR3lx1iHlupn4sHr1B/8K6MSts=;
 b=gwYveI9P09ONTgG8oXpOtSoV93k8UFAvEyq7NNrLg6EaAKJtI2E/c1o5hBgp+elLx5
 3aTi9VnX7veMIMTk8wLAe1kW5Jy3DvoIL/u/3WLDnqxhvcmUXUh9jZWv/dRfLvL5LjVe
 5HTo8QdzQW+gMwp0Mam6dvWyCRwkcKoCdqvkyToYx88+4Kpz+5cW6ght9RGKFw5NNRB+
 Kf7CB1Mv2ZLyd2nO2zGcifrPgFKSZFBbqq0g4e5oAGkZ10GZwxx54sgB9DZ7cQA8SGC8
 AZT8dUyJwElmMP+o6mkLZSXmfQ/zmaXhGvxW7bAMl/aIaB1WKtpy7RZJIljtmJl5s8ni
 p1Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO7dOXwectsFeOSsCUe/30+OVl6NVqlNAcD5zV+HuK1rx2dS/CDXLSKbQp/nKmMbEy9SHae1BBSd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2GboX0vvw4/Kr/9lD3CQMwx/derB67DbBvX7LXsJ99L9YuT8x
 HPMbUeUCVvNIIho9VbIra2BtAG51Cokxp8MNw/E6Vldb2FKBxnbR1E3cqb/hlUKcrEl5A8thh7E
 LKnB0kQruKQxnI4qlZ+q60PyDi9iJ1r8=
X-Gm-Gg: ASbGncsakQEy2aOxKZ/RtOcZZMXxWcS2GaUOctSTeaPKJEWD554Cv7WS8hxTZJfHu6b
 5gcb3MN9n+a7O5dCra+QmXY6XJ6cVirIwMcuLbLjZXFGscL8sdblyoxnjUW7OoqvuWI8i7dZu1t
 wgr9BrGG1EC2qQ2nz+8eJxYabgasTVLkfUEvsVzmUUZfcl7xJq4dZjv00QtyGXMgl1eq5dMo2b9
 wA3bBEEqufh6uZCXIzppTBt6PR93yOrg+y93ZkSOw==
X-Google-Smtp-Source: AGHT+IEsiLjMRyXYhncxuci92btZ+xh5rvmcRX5wKkTyopgH/WMz7bhDERZr/gb2/fxeD2QWq8Haa1xO8DxrAysRNyE=
X-Received: by 2002:a17:907:7fa3:b0:af9:3d0a:f38f with SMTP id
 a640c23a62f3a-af93fd64bf3mr624693166b.0.1754217186911; Sun, 03 Aug 2025
 03:33:06 -0700 (PDT)
MIME-Version: 1.0
From: Haru Zheng <towwy321@gmail.com>
Date: Sun, 3 Aug 2025 18:32:55 +0800
X-Gm-Features: Ac12FXzIOcl_0A4Ih1a8nY3gchgr3V34vE8-EiuwlXia7lYUBWk08DLPwS9N9FI
Message-ID: <CACw2aoTa8KU-KkxqA10OeVK+yV7t-B94KDa4Odi1sbpY6qAENg@mail.gmail.com>
Subject: [PATCH] drm/mediatek: dp: Fix suspend/resume training failure
To: granquet@baylibre.com, "ck.hu@mediatek.com" <ck.hu@mediatek.com>, 
 "msp@baylibre.com" <msp@baylibre.com>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, 
 "airlied@gmail.com" <airlied@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, chunkuang.hu@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 04 Aug 2025 07:22:19 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From 4919bd858cd9cba8e4aadba7c3d1fd434ef3b09e Mon Sep 17 00:00:00 2001
From: Haru Zheng <towwy321@gmail.com>
Date: Wed, 18 Jun 2025 11:28:37 +0800
Subject: [PATCH] drm/mediatek: dp: Fix suspend/resume training failure

When suspending and resuming DisplayPort via Type-C,
link training may fail.

This patch backports the software IRQ handling for DP,
as eDP uses hardware IRQ while DP uses software IRQ.
Additionally, cable_plugged_in is flipped in
mtk_dp_hpd_event to ensure correct hotplug detection
during resume.

These changes fix the DP training failure after suspend/resume.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Tested-on: Genio G700 EVK
Signed-off-by: Haru Zheng <towwy321@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 100 ++++++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |   3 +
 2 files changed, 96 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
b/drivers/gpu/drm/mediatek/mtk_dp.c
index bef6eeb30d3e..0cfe792bc36d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1012,6 +1012,16 @@ static u32 mtk_dp_swirq_get_clear(struct mtk_dp *mtk_dp)
  return irq_status;
 }

+static void mtk_dp_swirq_enable(struct mtk_dp *mtk_dp, bool enable)
+{
+ if (enable)
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C4, 0,
+    SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK);
+ else
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C4, 0xFFFF,
+    SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK);
+}
+
 static u32 mtk_dp_hwirq_get_clear(struct mtk_dp *mtk_dp)
 {
  u32 irq_status = (mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3418) &
@@ -1751,6 +1761,8 @@ static int mtk_dp_parse_capabilities(struct
mtk_dp *mtk_dp)
      mtk_dp->train_info.sink_ssc)
  return 0;

+ memset(mtk_dp->rx_cap, 0, DP_RECEIVER_CAP_SIZE);
+
  ret = drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
  if (ret < 0)
  return ret;
@@ -2031,8 +2043,8 @@ static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
  spin_unlock_irqrestore(&mtk_dp->irq_thread_lock, flags);

  if (cable_sta_chg) {
- if (!!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
-        HPD_DB_DP_TRANS_P0_MASK))
+ if (!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
+       HPD_DB_DP_TRANS_P0_MASK))
  mtk_dp->train_info.cable_plugged_in = true;
  else
  mtk_dp->train_info.cable_plugged_in = false;
@@ -2265,6 +2277,41 @@ static ssize_t mtk_dp_aux_transfer(struct
drm_dp_aux *mtk_aux,
  return ret;
 }

+static void mtk_dp_swirq_hpd(struct mtk_dp *mtk_dp, u8 conn)
+{
+ u32 data;
+
+ data = mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414);
+
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+    HPD_OVR_EN_DP_TRANS_P0_MASK,
+    HPD_OVR_EN_DP_TRANS_P0_MASK);
+
+ if (conn)
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+    HPD_SET_DP_TRANS_P0_MASK,
+    HPD_SET_DP_TRANS_P0_MASK);
+ else
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+    0,
+    HPD_SET_DP_TRANS_P0_MASK);
+}
+
+static void mtk_dp_swirq_hpd_interrupt_set(struct mtk_dp *mtk_dp, u8 status)
+{
+ dev_info(mtk_dp->dev, "[DPTX] status:%d [2:DISCONNECT, 4:CONNECT]\n", status);
+
+ if (status == MTK_DP_HPD_CONNECT) {
+ mtk_dp_init_port(mtk_dp);
+ mtk_dp_swirq_hpd(mtk_dp, TRUE);
+ } else {
+ mtk_dp_swirq_hpd(mtk_dp, FALSE);
+ }
+
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C0, status,
+    SW_IRQ_SET_DP_TRANS_P0_MASK);
+}
+
 static int mtk_dp_poweron(struct mtk_dp *mtk_dp)
 {
  int ret;
@@ -2534,7 +2581,7 @@ static int mtk_dp_bridge_atomic_check(struct
drm_bridge *bridge,

  dev_dbg(mtk_dp->dev, "input format 0x%04x, output format 0x%04x\n",
  bridge_state->input_bus_cfg.format,
- bridge_state->output_bus_cfg.format);
+ bridge_state->output_bus_cfg.format);

  if (input_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
  mtk_dp->info.format = DP_PIXELFORMAT_YUV422;
@@ -2552,6 +2599,30 @@ static int mtk_dp_bridge_atomic_check(struct
drm_bridge *bridge,
  return 0;
 }

+static void mtk_dp_bridge_hpd_notify(struct drm_bridge *bridge,
+      enum drm_connector_status status)
+{
+ struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+ struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
+
+ if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
+ if (mtk_dp->hpd_state != status) {
+ if (status == connector_status_disconnected) {
+ train_info->cable_plugged_in = false;
+ } else {
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+    HPD_OVR_EN_DP_TRANS_P0_MASK,
+    HPD_OVR_EN_DP_TRANS_P0_MASK);
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+    HPD_SET_DP_TRANS_P0_MASK,
+    HPD_SET_DP_TRANS_P0_MASK);
+ train_info->cable_plugged_in = true;
+ }
+ mtk_dp->hpd_state = status;
+ }
+ }
+}
+
 static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
  .atomic_check = mtk_dp_bridge_atomic_check,
  .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
@@ -2801,7 +2872,8 @@ static int mtk_dp_probe(struct platform_device *pdev)
  mtk_dp_power_enable(mtk_dp);

  /* Disable HW interrupts: we don't need any for eDP */
- mtk_dp_hwirq_enable(mtk_dp, false);
+ mtk_dp_hwirq_enable(mtk_dp, true);
+ mtk_dp_swirq_enable(mtk_dp, false);

  /*
  * Power on the AUX to allow reading the EDID from aux-bus:
@@ -2829,6 +2901,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
  }
  }
  } else {
+ mtk_dp_swirq_enable(mtk_dp, false);
+ mtk_dp_hwirq_enable(mtk_dp, false);
+ mtk_dp_swirq_enable(mtk_dp, true);
  mtk_dp->bridge.ops = DRM_BRIDGE_OP_DETECT |
       DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
  ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
@@ -2861,10 +2936,15 @@ static int mtk_dp_suspend(struct device *dev)
  struct mtk_dp *mtk_dp = dev_get_drvdata(dev);

  mtk_dp_power_disable(mtk_dp);
- if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
+
+ if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
  mtk_dp_hwirq_enable(mtk_dp, false);
- pm_runtime_put_sync(dev);
+ } else {
+ mtk_dp_swirq_hpd_interrupt_set(mtk_dp, MTK_DP_HPD_DISCONNECT);
+ mtk_dp_swirq_enable(mtk_dp, false);
+ }

+ pm_runtime_put_sync(dev);
  return 0;
 }

@@ -2874,8 +2954,14 @@ static int mtk_dp_resume(struct device *dev)

  pm_runtime_get_sync(dev);
  mtk_dp_init_port(mtk_dp);
- if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
+
+ if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
  mtk_dp_hwirq_enable(mtk_dp, true);
+ } else {
+ mtk_dp_swirq_hpd_interrupt_set(mtk_dp, MTK_DP_HPD_CONNECT);
+ mtk_dp_swirq_enable(mtk_dp, true);
+ }
+
  mtk_dp_power_enable(mtk_dp);

  return 0;
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 8ad7a9cc259e..7c97e230be50 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -286,7 +286,10 @@
 #define POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_MASK BIT(9)
 #define POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_MASK BIT(10)
 #define POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_MASK BIT(11)
+#define MTK_DP_TRANS_P0_35C0 0x35c0
+#define MTK_DP_TRANS_P0_35C4 0x35c4
 #define MTK_DP_TRANS_P0_35C8 0x35c8
+#define SW_IRQ_SET_DP_TRANS_P0_MASK GENMASK(15, 0)
 #define SW_IRQ_CLR_DP_TRANS_P0_MASK GENMASK(15, 0)
 #define SW_IRQ_STATUS_DP_TRANS_P0_MASK GENMASK(15, 0)
 #define MTK_DP_TRANS_P0_35D0 0x35d0
-- 
2.45.2
