Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F097EC80
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 15:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFCD10E3F8;
	Mon, 23 Sep 2024 13:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="VUB4+NPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1172410E3F8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 13:42:47 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-718ef6a26dbso412745b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1727098966; x=1727703766; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rPhqRjNNh/t9DBBH4x5Du2CMHjjsRIVHlcU5KXqqEs0=;
 b=VUB4+NPktWzQUSloPx2NeBV+nMO01zpiqTuKsFqO8kixFeYmjQ1phrja8it7RiKdzw
 umi0m5yJqM3wxmFbQUS3FKlTDRRbM4pHLXCyD1BHfaH9Kp/ovTdi3GkZl6gpG1obLP7o
 E4jAeM4Gc+rWerBqvJszM1q64LfhiF3/ZQYUwOq2aFYx5pZjKrLpnlNQwjiQbCZIJNTm
 az4gjvEWQfRmGSyY+SN6qBxVZnBcrIUGT/MTSm02ezLfLJgemuDXq5vX7R7c0qoHCd+Q
 OVGruwcY5CIUcdZBF0ZSZhZCZXlmhxBckjG2qtNhWjet7uxW6Og2V5SemOeGFyy6ts/y
 BuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727098966; x=1727703766;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rPhqRjNNh/t9DBBH4x5Du2CMHjjsRIVHlcU5KXqqEs0=;
 b=f+urczq027wtJvDIT3lItQixJ1CvodUqLP3peYJt5RkSKIpwOQNcR1wCgTmLKcOCcg
 SMG/cf5/AecAtq+lRDAsK1r78GnZSblw40zCKiUbvARI6vI8mQSAMpq9bG4cGMZB2fVV
 S5lY+Mt6WILwzSz550eKyAg6VB5eRr+sN9LDZ1pNYNkPifzC06kYllPtvTW2tHPZjAIo
 35GhHlr5QQlePzOga/Vk6Pox6c1i+L46YDgp8vTW6GZswCVYbOtQPSnnmw8jlH7j96sI
 gxytQeCqH86O8PD260oz/xprD2TD4h760767wsHhILwBe9sWdXA3LVbzfHBInhJC8F51
 hJHQ==
X-Gm-Message-State: AOJu0YwEdfjUecuXLKwWpv5bdeVYgBvdj1fg9l4CUooaICorR851Zitg
 UROXAUDnlpSwV3Syc2HCp7KS5UHaSI082OHQA2f3DUeewz2Ma07nVde1qLPQC0E=
X-Google-Smtp-Source: AGHT+IFUaJAwMUGDJFH9Es4pl65+q0d8XrzZ89GzAkgl6X5XV1I6vVd20Bxg+YXdCaCdc9bgokljqQ==
X-Received: by 2002:a05:6a00:3e17:b0:70e:acd0:d8b6 with SMTP id
 d2e1a72fcca58-7199c8456d1mr6828766b3a.0.1727098966486; 
 Mon, 23 Sep 2024 06:42:46 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944b97302sm14376009b3a.147.2024.09.23.06.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 06:42:46 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org,
 hsinyi@google.com, awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/2] drm/panel: jd9365da: Modify Kingdisplay and Melfas
 panel timing
Date: Mon, 23 Sep 2024 21:42:26 +0800
Message-Id: <20240923134227.11383-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240923134227.11383-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240923134227.11383-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

In MTK chips, if the system starts suspending before the DRM runtime 
resume has not completed, there is a possibility of a black screen 
after waking the machine. Reduce the disable delay resolves this issue, 

The "backlight_off_to_display_off_delay_ms" was added between
"backlight off" and "display off"  to prevent "display off" from being
executed when the backlight is not fully powered off, which may cause
a white screen. However, we removed this
"backlight_off_to_display_off_delay_ms" and found that this situation
did not occur. Therefore, in order to solve the problem mentioned
above, we We reduced it from 100ms to 3ms (tCMD_OFF >= 1ms).

This is the timing specification for the two panels:
1. Kingdisplay panel timing spec:
https://github.com/KD54183/-JD9365DA_Power-On-Off-Sequence_V0120240923
2. LMFBX101117480 timing spec: https://github.com/chiohsin-lo/TDY-JD_LIB


Fixes: 2b976ad760dc ("drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel")
Fixes: c4ce398cf18a ("drm/panel: jd9365da: Support for Melfas lmfbx101117480 MIPI-DSI panel")

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V2 and V1:
-  1. Modify the commit message 
-  2. Modify the value of backlight_off_to_display_off_delay_ms.
v1: https://lore.kernel.org/all/20240915080830.11318-2-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 44897e5218a6..486aa20e5518 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -858,7 +858,7 @@ static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
 	.reset_before_power_off_vcioo = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 10,
-	.backlight_off_to_display_off_delay_ms = 100,
+	.backlight_off_to_display_off_delay_ms = 3,
 	.display_off_to_enter_sleep_delay_ms = 50,
 	.enter_sleep_to_reset_down_delay_ms = 100,
 };
@@ -1109,7 +1109,7 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
 	.reset_before_power_off_vcioo = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 10,
-	.backlight_off_to_display_off_delay_ms = 100,
+	.backlight_off_to_display_off_delay_ms = 3,
 	.display_off_to_enter_sleep_delay_ms = 50,
 	.enter_sleep_to_reset_down_delay_ms = 100,
 };
-- 
2.17.1

