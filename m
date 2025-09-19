Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D1CB89955
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C6C10E9E5;
	Fri, 19 Sep 2025 13:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="hD7i7dmE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD12910E98B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 11:11:11 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-77b2e3169dcso2773392b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1758280271; x=1758885071; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=npFWPkSgKvY9va+Ulw2zXaAW/hma517DGdAo/O6uPe8=;
 b=hD7i7dmEmP1ea+ZbWEQGueKBcGQtPdd3T/WSpENnm5GqyfH7sx/jZHFAjUll/Y26HB
 1q4k2LXR2i4wntfmp2oNCvX8agveATaWJSBvQxSORQW9emgWDVqb1EkYp9kB+6cU4O3W
 LZWyXaLjJncRhCS6VLfO+s2ffx1EGZtFGfGZzjFH2TrtfiIULao/2FTOrtBZIREQfgot
 jyOD2NveNb82R5bomF0wwbXL1u97EmXB5xzYkrHkM1rsW0WMiFZ7XP63KwH6DaV1Hnxs
 IERfn+1Ed8YOLEPNQqYnd+KOeKuFwetKgfiCQlkrGpV0crTC0A+TPFZz5s0SNg5P2LIc
 1TUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758280271; x=1758885071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=npFWPkSgKvY9va+Ulw2zXaAW/hma517DGdAo/O6uPe8=;
 b=SO2immggPgjEVX7tU9CrD2jpRUmDRXABVgvHudrLLJMRXWbOECFEFDlZTpJp1chqKG
 ElsyukH8gNIGM009fIr+jMNDG1y365LUqer6vs5nxIbkljcLo5PNoV5gLJYqiTgXCz5e
 yC29HpuT9RjSzmHNU1M+23yQAXvUg0AEZ1f4u9j8LzV14bnFHsf1I6lEwN8Uc2prgC1a
 v4HBXfFYjDzbkUVNg4014jfULrKTfxh4TASHN+fMCi1BAr3SA/65yOesNoIr2JeAplPC
 KILCkTFCWTaVfknrzBbuTudENABBBqvjw3um6WVB8DsmCnn4kQYwzhgSEs3V7saNzJgJ
 HVnw==
X-Gm-Message-State: AOJu0YwFeLvfmamy1dqUz7fvh7uJ3adX7ZpEdmO/Zo8u+WwvHzTwVjIU
 pEBXAUaWmK0IoEbvaDT8QCj5YunQZlYZ1Gdz5HvAixuF5p42vLhNDUv2ts8tQYNg2yw=
X-Gm-Gg: ASbGncu2kinU2m3ptM8OEDgtE+6KLd3aT4GBNdOuZD7VDdRM+HbxwYW8dV3UZasJRJ3
 ljV8O1O9JN83p6VfoUW5xhuCw0NKmBkLCOLaHz0LJjDeBs4lhRxuB3FDoMAY1NxKj3gPidozPoo
 iSKYYYIUx79Lf91knTpdFjIFQ7G+oIR9PYCdTpUg4SHBUWKlaGVOYyzlBPdSWab56Zqbo2SywzI
 pxZ8G/JyQYYbkJVcCFLkCvVjNLm6DTVPsU5rnmPHUveBQ1tHFaW/rPWlKQFsh/df3fviRpJig27
 jujE2spsKA8Dldi7coeNPeESfcwB03DP+Y3C5JXHhRtxqDtG2qvoaJE6TUR6Hl3tZl7VJ5VCgEz
 aODxLSO8fxzzEH3zlRtMSQgRzvJ25RMCJGPFXWWo23Q0aoT8jYolDHftLtEA=
X-Google-Smtp-Source: AGHT+IH4wTPZqP62XLgmItR38Arrzxl1FUIuRLUNqJycfG24LHcBBRnY/kef0LLseIR49zemaYNLmg==
X-Received: by 2002:a05:6a00:4b52:b0:776:9d99:e3f1 with SMTP id
 d2e1a72fcca58-77e4eac3772mr3472892b3a.26.1758280271258; 
 Fri, 19 Sep 2025 04:11:11 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc24614dsm5028971b3a.31.2025.09.19.04.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 04:11:10 -0700 (PDT)
From: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel: Add support for KD116N3730A12
Date: Fri, 19 Sep 2025 19:11:01 +0800
Message-ID: <20250919111101.2955536-1-yanzhijian@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Sep 2025 13:06:01 +0000
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

Add panel driver support for the KD116N3730A12 eDP panel.
This includes initialization sequence and compatible string, the
enable timimg required 50ms.

KD116N3730A12:
edid-decode (hex):

00 ff ff ff ff ff ff 00 2c 83 97 03 00 00 00 00
02 23 01 04 95 1a 0e 78 03 3a 75 9b 5d 5b 96 28
19 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
36 00 00 90 10 00 00 1a 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
00 4b 44 31 31 36 4e 33 37 33 30 41 31 32 00 a9

Signed-off-by: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 2c8536c64c19..555e0e2a36ea 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2047,6 +2047,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1707, &delay_200_150_e50, "KD116N2130B12"),
 
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0110, &delay_200_500_e50, "KD116N3730A07"),
+	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0397, &delay_200_500_e50, "KD116N3730A12"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x044f, &delay_200_500_e50, "KD116N9-30NH-F3"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x05f1, &delay_200_500_e80_d50, "KD116N5-30NV-G7"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116N2930A15"),
-- 
2.48.1

