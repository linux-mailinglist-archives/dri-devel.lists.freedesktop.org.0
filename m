Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41028DA40
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194C66EA18;
	Wed, 14 Oct 2020 07:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C706E928
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 18:19:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s9so435745wro.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DtmadPtoPcokiIT8ReATg1pXkhzL2SuRBo5LddIMSVk=;
 b=XaJ/M1ab0sb3wmangM5YA2nqcNI4cEEK4J6J89RdjZa7KK4sbY6rvX6VV/uDqCY7eO
 BprKBVKFXAG30XVHwS7YwvDUaWfw0dXOKYgetZjYxpT/n+Ia5D7O55KZihuxApT5Pyki
 sbzNbcI3uvDJ1ZBR/KYTICZUnQS/SlRcHS2ZEM/N2HSx665DzSjuHKS7vc8cWnrAYct8
 SbiI2gfLvKdP5sLgqQkcgjoxbuFtBm2XSjhdOeuz/kSJa1/HQIiF84fRT+s+N35dz+dn
 Bl/jOSnjWmGuofs/y0yw1TpV3mHyL/6vgt+zExdqElnlh3fGLf8nFLMl9Vf6SuTYbn3h
 SIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DtmadPtoPcokiIT8ReATg1pXkhzL2SuRBo5LddIMSVk=;
 b=ERIg+9YyfgSM+LXhvOkmh7anm4oJUAx+nffMaA9f7dSbstVn1pEV93exg0FbfTP5ui
 4HRukqpBG0LHeCGWc13Kwz4SzaLipmwxaZRkMsFxlnIam2dIo+TpAXaqeS1b9idJEAXc
 d1swv59LGkGdsrBo3gSRxNZbaxOU2wMDTv+mF+04oElO+MeBu5IzL/P1OqJ3zyKE6WYy
 LgHMbANjj/o8bF2ubmW7FpfN7EQ8TGwLXW5sxM6PIPOTm5JDQUERvRIwW8uoOppgDxHC
 njhzc+p79jmqrt/UuV5wW30pkKa9UgtpaXOE/FY7wBBlQmINze0J/uyoHIvfaeYQ6+b3
 ocbA==
X-Gm-Message-State: AOAM533h5YCQR2uphpNQSZbRObfwKmW5xf5zvazi+JPosqeSVfQi3vbr
 mPkemmE8f4C2benR83kjwdDc5A==
X-Google-Smtp-Source: ABdhPJyYKFgxPBtvreY/bLMuxhTn3K88Do7E39RQO4MJweOu72cwzI7cuyOtwYsoYixEPS6WFk3dGg==
X-Received: by 2002:adf:8541:: with SMTP id 59mr1042100wrh.61.1602613177428;
 Tue, 13 Oct 2020 11:19:37 -0700 (PDT)
Received: from localhost.localdomain (26.165.185.81.rev.sfr.net.
 [81.185.165.26])
 by smtp.gmail.com with ESMTPSA id w11sm490261wrs.26.2020.10.13.11.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 11:19:36 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
Date: Tue, 13 Oct 2020 20:19:24 +0200
Message-Id: <20201013181924.4143303-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013181924.4143303-1-fparent@baylibre.com>
References: <20201013181924.4143303-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for HDMI on MT8167. HDMI on MT8167 is similar to
MT8173/MT2701 execpt for the two registers: SYS_CFG1C and SYS_CFG20

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

Changelog:
v2: fix name of pdata structure

 drivers/gpu/drm/mediatek/mtk_hdmi.c      | 7 +++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 57370c036497..484ea9cd654a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1835,9 +1835,16 @@ static struct mtk_hdmi_data mt8173_hdmi_driver_data = {
 	.sys_cfg20 = HDMI_SYS_CFG20,
 };
 
+static struct mtk_hdmi_data mt8167_hdmi_driver_data = {
+	.sys_cfg1c = MT8167_HDMI_SYS_CFG1C,
+	.sys_cfg20 = MT8167_HDMI_SYS_CFG20,
+};
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt8173-hdmi",
 	  .data = &mt8173_hdmi_driver_data },
+	{ .compatible = "mediatek,mt8167-hdmi",
+	  .data = &mt8167_hdmi_driver_data },
 	{}
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
index 2050ba45b23a..a0f9c367d7aa 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
@@ -195,6 +195,7 @@
 #define GEN_RGB				(0 << 7)
 
 #define HDMI_SYS_CFG1C		0x000
+#define MT8167_HDMI_SYS_CFG1C	0x800
 #define HDMI_ON				BIT(0)
 #define HDMI_RST			BIT(1)
 #define ANLG_ON				BIT(2)
@@ -211,6 +212,7 @@
 #define HTPLG_PIN_SEL_OFF		BIT(30)
 #define AES_EFUSE_ENABLE		BIT(31)
 #define HDMI_SYS_CFG20		0x004
+#define MT8167_HDMI_SYS_CFG20	0x804
 #define DEEP_COLOR_MODE_MASK		(3 << 1)
 #define COLOR_8BIT_MODE			(0 << 1)
 #define COLOR_10BIT_MODE		(1 << 1)
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
