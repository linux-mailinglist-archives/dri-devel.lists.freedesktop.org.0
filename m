Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB33A919B00
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 01:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A4E10E085;
	Wed, 26 Jun 2024 23:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gytzyE9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09B310E085
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 23:07:15 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2c87a7df96eso663288a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719443235; x=1720048035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UcR50/eTiGUBsrLQ/8tPHrm4EP0Z5a7+eaFu6fbpe10=;
 b=gytzyE9HRzfi+JwfRuSao4XEATBgx143ipPyM+rW8P13YgEYge/hvNuOr9ojyJxCNs
 8Ssjwl3Skjk+070arh8ZVBD4wx8/4IlWgj8haPHzs8ZSRpIkndhE9yqgTJbdNs0Zh0BM
 9WmI/U/W/2SY0GruhTmgDRHOqbGsvditO98Qad//hWUOv8fscCnJOInt4McWMBRDBM7V
 uGYWo6Bz6kt8qnonIrkbGGunGAOAJuw8Sn9mGl+7KL4OKcR5fMlsCa8RlFQjqqMzgsHk
 YHUU1eRvWAwYGpgGPBonaIjjlPt3nQQNhiVD+zvqcjZ4UKDIjdm19UJ1SxX60JWnoY+9
 hl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719443235; x=1720048035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UcR50/eTiGUBsrLQ/8tPHrm4EP0Z5a7+eaFu6fbpe10=;
 b=Z8OMQh9vkddKF0+BldFoBoT0SUCArVkcB0TrJNqJEyFAQFXihq3RWClAgCqmDlmCe9
 yWbN+hVUWkFc4vWRb9DlkSPtYVnDwNB6Jd2svFkCQ6/jVqhdmqmpUJQQCABwCKK/BQdu
 jgHy3ci4MqbcNBQ5SEw+usL1qhTu6oQVnqQEldfUkFBLc9ICOEG76xom98cRN3lYZGwY
 J7MIx/VMRxJ+C1gzwXo+GBbeBGHMWVp0qh90mTsIQv36w/e5RzLOwFeaIT39e0sQxHDX
 IBZcmvQofFvtbUz4RePaRd82MAIBod5Ix19tLLwp+pa8Q5VUx71CmONfO2/XsppcjXoD
 Kpsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2JYWBhGPT2DMXYh4YCqmC/L0Bc6oGenYbJdnnphqJWXoifkKRfQ0jI96oBiE5o6nzLEGOlPA3zsPQCNJnpNiu7UuvFsJ6Wvt7i7kwygUF
X-Gm-Message-State: AOJu0YwUjKMKnPdlGFQUoEDv8PvbG3B6aUYpx8y4yxxU3qGpyecSm1Yp
 xmA6hu8CymzhrdIfEs5TVVyLwZGIGTsmibEVFgf5hzMZTUCMT3B+
X-Google-Smtp-Source: AGHT+IFXIZfnMoIDrnrFXhLSKC2s3BSHGsyPbwPPbJ5jM14uEfxAOcJ5BuzreSMcyW2AeTyOCpeSxQ==
X-Received: by 2002:a17:90b:4b52:b0:2c4:d7f3:fb00 with SMTP id
 98e67ed59e1d1-2c845e5e637mr12178595a91.3.1719443235070; 
 Wed, 26 Jun 2024 16:07:15 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:a460:36ee:dca1:f711])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8fead3100sm61908a91.49.2024.06.26.16.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 16:07:14 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: rfoss@kernel.org
Cc: neil.armstrong@linaro.org, victor.liu@nxp.com,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/6] drm/bridge: imx8mp-hdmi-tx: Switch to
 SYSTEM_SLEEP_PM_OPS()
Date: Wed, 26 Jun 2024 20:06:59 -0300
Message-Id: <20240626230704.708234-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Replace SET_SYSTEM_SLEEP_PM_OPS with its modern SYSTEM_SLEEP_PM_OPS()
alternative.

The combined usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()
allows the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 13bc570c5473..4a3a8a3ce250 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -111,12 +111,12 @@ static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
 	dw_hdmi_remove(hdmi->dw_hdmi);
 }
 
-static int __maybe_unused imx8mp_dw_hdmi_pm_suspend(struct device *dev)
+static int imx8mp_dw_hdmi_pm_suspend(struct device *dev)
 {
 	return 0;
 }
 
-static int __maybe_unused imx8mp_dw_hdmi_pm_resume(struct device *dev)
+static int imx8mp_dw_hdmi_pm_resume(struct device *dev)
 {
 	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
 
@@ -126,8 +126,7 @@ static int __maybe_unused imx8mp_dw_hdmi_pm_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops imx8mp_dw_hdmi_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(imx8mp_dw_hdmi_pm_suspend,
-				imx8mp_dw_hdmi_pm_resume)
+	SYSTEM_SLEEP_PM_OPS(imx8mp_dw_hdmi_pm_suspend, imx8mp_dw_hdmi_pm_resume)
 };
 
 static const struct of_device_id imx8mp_dw_hdmi_of_table[] = {
@@ -142,7 +141,7 @@ static struct platform_driver imx8mp_dw_hdmi_platform_driver = {
 	.driver		= {
 		.name	= "imx8mp-dw-hdmi-tx",
 		.of_match_table = imx8mp_dw_hdmi_of_table,
-		.pm = &imx8mp_dw_hdmi_pm_ops,
+		.pm = pm_ptr(&imx8mp_dw_hdmi_pm_ops),
 	},
 };
 
-- 
2.34.1

