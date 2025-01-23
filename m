Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFEDA1A2CF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F5910E7DD;
	Thu, 23 Jan 2025 11:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="1zcXafTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC9A10E7DD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:21:02 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2164b662090so13175185ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 03:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737631262; x=1738236062; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W91SrMCt+JrpVsQgepGwBGomdO/kP4mHVAdiLbEPvck=;
 b=1zcXafTWND/lc+Qi06IV7fkZLkAnQIahEmgJxwMbaVoLHEW3BWp1/fuP/2QjDHdOt2
 PQ5edybGC31KzcJ5dPGfwUpxE0eFMuzItGAYDSPEvSxEu1EpAUlYXu2pQs8/V71bcfTt
 pixw143jANVrDMLZAsnhzcSP4xFE4zv3owrbfRopFUVin+b4QV3BxjmQ+IKiFuy3KDiK
 /toX01sQT6lybenrWpBnGRJP6af3+gg8PcCeh055lUMtAyZ4wNn7Hm1nbUUGlbJLaeDd
 fpFN6C+v7xWC7zXvDYPDqF9ByjZc8Aw6BZx/126441ZblIS6lZ0prHzRPN010U62LV9E
 3Brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737631262; x=1738236062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W91SrMCt+JrpVsQgepGwBGomdO/kP4mHVAdiLbEPvck=;
 b=aoCRjMNqWX6MO5YQ51l93jQFMsbD8Qg5U8AVTTV7Gz4QE0hRiBACO9bsL60nFP5w74
 rBmTf96dJwtFYI2pZdBSLPx118RYYI6eFg1rcQCFB4sViKP5Y2/14V5HRL1rjBskpiUB
 STF/3AvBcKvt1rzsZ5DYVg6uxQqG4UZ74RaqcuUK8pqtUTIie2eHj8qmJMs5q6LteB2e
 UEMzKK0DiexT5HhiydITrplLmZscbRDG7x93gLOVAc+QaDAZArcVooEtoOxkY4U23cRu
 bPQeYUWwp9gJoAyEuMtDMxn+SRePh2d3gRvyzKOINzOP3F3xNIndgKi0mukDN1XnEQa/
 HKgg==
X-Gm-Message-State: AOJu0Yz+EiW4RzolokyWLvVNmD53Ceudo71pdbFDHNybQYG9xezYrF1b
 50BwXAVvGAgQ6RQcyxw0XXEcmG2jDRCUew5JK9ufiKmKjp2/OGKoZ8XPLkKvrUw=
X-Gm-Gg: ASbGncudC5m0+gKdj9OQepoJrd1D4+vm9SmVUmV5NH2feJzJ6TgoEsWEWecUj8y4N1T
 9wACfTxQbMyD0T7uRauRCNGHzC9rJF/jpclgbWUPRmJMu0W0Cp6EQAO/Imuiji6lQ6mr50dIYWZ
 f7I1s5X5QlTMxqrXYYIE6mvzjkvpJctqsWuU22p5JZuHfIIDagRkL0YSoapgIIL74GrMI83lYeA
 cPaeE0Jqpfg+CAsomBn5ddt5r7du/aJPIvsLH2sG248V3luY+Bs5WczGZ8CNRHj21xMj5wDOqZs
 IOa2eiBowpPheGt38c8gI1PowoRvE7PVcwRLw6+dghvNuDciZj3i
X-Google-Smtp-Source: AGHT+IHjboJK+td3LYHK/0W7XnFirtBRkK7s/tVzbVok7WMdDfSJW0teLk4t0AGgTnQ0YmLXyg5wtA==
X-Received: by 2002:a17:902:f690:b0:216:2a5a:89d3 with SMTP id
 d9443c01a7336-21c35558fabmr324219845ad.25.1737631262358; 
 Thu, 23 Jan 2025 03:21:02 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3a8845sm111108025ad.153.2025.01.23.03.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:21:01 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add STA 116QHD024002
Date: Thu, 23 Jan 2025 19:20:55 +0800
Message-Id: <20250123112055.1521471-1-yelangyan@huaqin.corp-partner.google.com>
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

Add support for the STA 116QHD024002, pleace the EDID here for
subsequent reference.

00 ff ff ff ff ff ff 00 4e 81 09 00 00 00 00 00
26 21 01 04 a5 1a 0e 78 02 1e b5 9a 5f 57 94 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 8e 1c 56 a0 50 00 1e 30 28 20
55 00 00 90 10 00 00 18 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 20
20 20 20 20 20 0a 20 20 20 20 20 20 00 00 00 fe
00 31 31 36 51 48 44 30 32 34 30 30 32 0a 00 3b

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 1721a3397dbf..25bb7e454fc9 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1808,6 +1808,12 @@ static const struct panel_delay delay_200_150_e50 = {
 	.enable = 50,
 };
 
+static const struct panel_delay delay_200_500_e250 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 250,
+};
+
 #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
 	.ident = { \
@@ -1998,6 +2004,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
 
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0004, &delay_200_500_e200, "116KHD024006"),
+	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0009, &delay_200_500_e250, "116QHD024002"),
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
 
 	{ /* sentinal */ }
-- 
2.34.1

