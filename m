Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70103534614
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 23:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645E210E600;
	Wed, 25 May 2022 21:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC7710E710
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 21:53:23 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id q8so94462oif.13
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=04OjMw2JMyuIJljrrmu099/55pxpfAsMDeUb49afxG0=;
 b=SjyPuA0QC1kxxE4E+mU7isGXjd294S4bs1nVurchs/W33aNYEVRx9fkjR0xk5Bhgt5
 MImcNPzLEUGRMelW9mOkwXh8lrxPFfuhfj9bwT0S8QtzfW0XI4brePUsfv73BMIOkExS
 ZIZnfYs73+DyaggSaUTiYYy41OPEl/XSOJsgwaztAUovCQItl6QqfOaQJpfIChltjMk5
 WS0zNs2bemOUBLMd2ReMqCoTKq9hRhl76m9qSvvhufFOeHIMuVFoiSUN7Epk6QjEf1u4
 sZmpzQmkT1ecfGE+/KGzsF30ZO8Tinx/FBR4eaBDlenHZoSZX/fhp85MYa7DuADPL2fZ
 En0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=04OjMw2JMyuIJljrrmu099/55pxpfAsMDeUb49afxG0=;
 b=4Hb8Uvv8YGPb0hyFPhNC98IiISEvueEzrSzlrJG9lDuw2+HKpaWra4EwegedvrOb43
 ETvCs5WV5L0g3ekYM+x29nvUC+QmYdeOtJtPP5YzTiQmNh4NX6cPb3WjBFVXaFr3tRVX
 YE6hG8rJFPpEDOexTqSyOHHjWs42m/DoFjo1N5lgA/Qx631RSN6iMToF//LaOrM9oRVg
 9VTHMjfR+qrHHqUFP734JIf8R/XNIJsZ/pdjT99iyPTrXxK5gQ0QOMJVXYegf/J3W8d7
 abYN6N+mHPBxgwSMjzGCn0Vy5HCTH4w3YSW+Teqo1li520Ehk3yl8dd1CTgDDyPyFuja
 ROEw==
X-Gm-Message-State: AOAM531Qz+HejzwUJGvA8FrWvAvDDe56YD9nI8+yzA6kj6Lnqxpmhy+Y
 niHFsE6rW6ZyD3amn6qI7Dv5ZSpFspJ4Vg==
X-Google-Smtp-Source: ABdhPJwu7pnNPbHIj7TqO0MW7jH+BuQXhSIlTz0+Gh1KcWfFoMNroRdWZvJvDgF2+h27MYudQeccGg==
X-Received: by 2002:a05:6808:148f:b0:32b:a86b:3cb8 with SMTP id
 e15-20020a056808148f00b0032ba86b3cb8mr1866067oiw.243.1653515602907; 
 Wed, 25 May 2022 14:53:22 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:8e74:fc8e:b11f:9d42])
 by smtp.gmail.com with ESMTPSA id
 t192-20020acaaac9000000b00325cda1ffa6sm25017oie.37.2022.05.25.14.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 14:53:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robert.foss@linaro.org
Subject: [PATCH] drm: bridge: adv7511: Move CEC definitions to adv7511_cec.c
Date: Wed, 25 May 2022 18:53:16 -0300
Message-Id: <20220525215316.1133057-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 alsi@bang-olufsen.dk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ADV7511_REG_CEC_RX_FRAME_HDR[] and ADV7511_REG_CEC_RX_FRAME_LEN[]
are only used inside adv7511_cec.c.

Move their definitions to this file to avoid the following build
warnings when CONFIG_DRM_I2C_ADV7511_CEC is not selected:

drivers/gpu/drm/bridge/adv7511/adv7511.h:229:17: warning: 'ADV7511_REG_CEC_RX_FRAME_HDR' defined but not used [-Wunused-const-variable=]
drivers/gpu/drm/bridge/adv7511/adv7511.h:235:17: warning: 'ADV7511_REG_CEC_RX_FRAME_LEN' defined but not used [-Wunused-const-variable=]

Reported-by: kernel test robot <lkp@intel.com>
Fixes: ab0af093bf90 ("drm: bridge: adv7511: use non-legacy mode for CEC RX")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 12 ------------
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 9e3bb8a8ee40..a031a0cd1f18 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -226,18 +226,6 @@
 #define ADV7511_REG_CEC_CLK_DIV		0x4e
 #define ADV7511_REG_CEC_SOFT_RESET	0x50
 
-static const u8 ADV7511_REG_CEC_RX_FRAME_HDR[] = {
-	ADV7511_REG_CEC_RX1_FRAME_HDR,
-	ADV7511_REG_CEC_RX2_FRAME_HDR,
-	ADV7511_REG_CEC_RX3_FRAME_HDR,
-};
-
-static const u8 ADV7511_REG_CEC_RX_FRAME_LEN[] = {
-	ADV7511_REG_CEC_RX1_FRAME_LEN,
-	ADV7511_REG_CEC_RX2_FRAME_LEN,
-	ADV7511_REG_CEC_RX3_FRAME_LEN,
-};
-
 #define ADV7533_REG_CEC_OFFSET		0x70
 
 enum adv7511_input_clock {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index 399f625a50c8..0b266f28f150 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -15,6 +15,18 @@
 
 #include "adv7511.h"
 
+static const u8 ADV7511_REG_CEC_RX_FRAME_HDR[] = {
+	ADV7511_REG_CEC_RX1_FRAME_HDR,
+	ADV7511_REG_CEC_RX2_FRAME_HDR,
+	ADV7511_REG_CEC_RX3_FRAME_HDR,
+};
+
+static const u8 ADV7511_REG_CEC_RX_FRAME_LEN[] = {
+	ADV7511_REG_CEC_RX1_FRAME_LEN,
+	ADV7511_REG_CEC_RX2_FRAME_LEN,
+	ADV7511_REG_CEC_RX3_FRAME_LEN,
+};
+
 #define ADV7511_INT1_CEC_MASK \
 	(ADV7511_INT1_CEC_TX_READY | ADV7511_INT1_CEC_TX_ARBIT_LOST | \
 	 ADV7511_INT1_CEC_TX_RETRY_TIMEOUT | ADV7511_INT1_CEC_RX_READY1 | \
-- 
2.25.1

