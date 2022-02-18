Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB514BBB45
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB4D10ED02;
	Fri, 18 Feb 2022 14:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C59710ED02
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so6602188wml.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dyf8Lgz3CGRP90NmEMFSmZ4sowvuSJF2fJjaNq/1oHo=;
 b=3+Bgb08C7VBTeMDKtyxnSNW4MTo/FoqcRvsKM9o7sBdCQrffwQDuUiUHTeQiT0zV7D
 SdsU02OPg8z0wKAdUnpsdvJ13iRHqFyB4izp0ejqW1Cdh1393CxCWGgE7YWJpQU1tFSL
 wpllP/eMvXlWGjt3TU52UJa9wfTMMFy4hZSgNC0wegAkbURh+udXbuodP36LyGD+QK4v
 cAOEYI8S33XeahoHUhCfEHNkcXL+subtTrgzrEdW5EDOewi2aKibwAe9AZcXEzL8Vuc0
 EdWur2NsIb5dKx4Mt/a6LxePfco6A7jeJJp9M/u5c6aSJ394dGN4BGOe6EHp+XFjnRRa
 G4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyf8Lgz3CGRP90NmEMFSmZ4sowvuSJF2fJjaNq/1oHo=;
 b=dLc3XQCAFXsiBYejc7sldbT32f1/9dHCgERcSVy7lqXZ7atm393w1S2SSjMNj/uir1
 XpfFtycZj/nZlU0V7HH9MvuANVnrOeDzmo+aTfbv6Id/qMP1rwRMUslWo9inqsxNhCdb
 yDp8cDTfKO+63sUgEBJZw70CKqJlTayb9e7ds4vmeDJ+Hp6TU43Tlzy4sUoakHPwYHTR
 uZv1SdEnKhrbB+tKBYvx5kPseI5oI/eS8RYf1dCgy+Rh9ALra6CpioSQBZzYklO6XP6X
 Mltl15qqmBJ5E6nssZb5cc5MzG9MaTbNAOWrPO6/Mzo2j208UhJEff4SxE2eUv5C4oii
 PdpQ==
X-Gm-Message-State: AOAM531P1XMtLEAXyFweHCK8JmP239LPL5nOqwoAEZTgunQRLv1TNOXZ
 BTCNygnZfV5Do1DmjtvMpJsO4Q==
X-Google-Smtp-Source: ABdhPJx6rXykt2bBihoV1EGcUO8vEHbX7rmGjB/O/cyCDfQdLOoG+5xvSnvWdYVaVgsxH15CXqrdFw==
X-Received: by 2002:a05:600c:3b1d:b0:37c:2d38:945e with SMTP id
 m29-20020a05600c3b1d00b0037c2d38945emr11411054wms.60.1645196194799; 
 Fri, 18 Feb 2022 06:56:34 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:34 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH v8 17/19] drm/mediatek: add hpd debounce
Date: Fri, 18 Feb 2022 15:54:35 +0100
Message-Id: <20220218145437.18563-18-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jitao Shi <jitao.shi@mediatek.com>

Implement the DP HDP debounce described in DP 1.4a 3.3.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2a3d5f15b651b..fe91ab8b2fd89 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -178,6 +178,8 @@ struct mtk_dp {
 	struct device *codec_dev;
 	u8 connector_eld[MAX_ELD_BYTES];
 	struct drm_connector *conn;
+	bool need_debounce;
+	struct timer_list debounce_timer;
 };
 
 static struct regmap_config mtk_dp_regmap_config = {
@@ -1698,6 +1700,9 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 	if (event < 0)
 		return IRQ_HANDLED;
 
+	if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
+		msleep(100);
+
 	if (mtk_dp->drm_dev) {
 		dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
 		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
@@ -1776,6 +1781,13 @@ static irqreturn_t mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
 	}
 	train_info->cable_state_change = true;
 
+	if (train_info->cable_state_change) {
+		if (!train_info->cable_plugged_in) {
+			mod_timer(&mtk_dp->debounce_timer, jiffies + msecs_to_jiffies(100) - 1);
+			mtk_dp->need_debounce = false;
+		}
+	}
+
 	return IRQ_WAKE_THREAD;
 }
 
@@ -2239,6 +2251,13 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.detect = mtk_dp_bdg_detect,
 };
 
+static void mtk_dp_debounce_timer(struct timer_list *t)
+{
+	struct mtk_dp *mtk_dp = from_timer(mtk_dp, t, debounce_timer);
+
+	mtk_dp->need_debounce = true;
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2319,6 +2338,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	else
 		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
+	mtk_dp->need_debounce = true;
+	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
@@ -2332,6 +2354,7 @@ static int mtk_dp_remove(struct platform_device *pdev)
 	platform_device_unregister(mtk_dp->phy_dev);
 
 	mtk_dp_video_mute(mtk_dp, true);
+	del_timer_sync(&mtk_dp->debounce_timer);
 
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.34.1

