Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3A196A575
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 19:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE15910E0A0;
	Tue,  3 Sep 2024 17:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fz2xUZbN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B84910E0A0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 17:32:20 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-714187df604so3857663b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 10:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725384739; x=1725989539; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HiLJoUgwiPwqGNm0lpObn/bqZI0GgOcal7bzp7/tmt0=;
 b=Fz2xUZbN/4eAVfIY/5i0vXeKqsyMIgtX6G6kmSBR678x46eDb7PJo5ncTbqOyNIkyE
 pWWqu3aNDP6PAQTUuRCuivIv9bu5IYpIPs5M6qKDg0z70NSxf474rK3X8u19HDCADDOD
 BqVykMceYSdog9s2CxtR3BYpIPhjVvPSNriPqs0+UjPpdzeKzZ3J2XLKJJNLunYDb068
 xLjYktgLcI73ak9k3ncSYQpdZkJtoJVadN5qvTThz1yKiZ0vaHDE3Tm1EkwBP8XMEj09
 i334lNse392j398DXCsquB8KQAvtsl+IupB/irM798Y1/ibmc3cRbsdkNX0GJbK9JKKz
 GmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725384739; x=1725989539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HiLJoUgwiPwqGNm0lpObn/bqZI0GgOcal7bzp7/tmt0=;
 b=UjVn+UWFChLDCEAAaKEUFb0SccO31zBCEc5MpOcrvIDwfUYfXtptWsVPWjM6g+SWzv
 EKG9QhOCTGN09PsF+pewc7E0fkCZ9XMGZbEaP5YlefrrMnKZC81E5xVCeWDDzr82ylRX
 8rGq8ThBWdNEJEwxzvRrKcNu3SDCdioNGL55zqIYZTBhFUmcmoKoOFkMrOKamblMiTXh
 doXVjWfm30+6V5kbZVuVw5aeTnwlpMmmzno/ptaNEaTgT6ujRzohM9QChkkYCfFO3YK6
 Jn5nRlaSsBoMubBKslP5fusPcqxt20E3Xowk6crt3JxiheawZB9XMUQSndlShPrVqCI9
 skUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAQ+RsoR2rS8A1fAE7YUk43BAy4GHso11X8I562WOYycP33o711v/gY4SgAlZPaGXRArs4WItJk+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6fIxPZftWgqw77To23H4M4PVWMR7VrX3/naGyLkk1BonHFABO
 D8lh+KApDNDsG8c7DtLW2Vi2qZqDRgG3JdCkR6ek62yBizo466cI
X-Google-Smtp-Source: AGHT+IGdRQdOkVQPkh7f2Sk8ELepHXS+iAMlvClTHLu6I1uh9McKj94RRlPbaPEesRcO8TQ72q997A==
X-Received: by 2002:a17:902:e54e:b0:205:6c15:7b75 with SMTP id
 d9443c01a7336-2056c157df2mr137582805ad.7.1725384739290; 
 Tue, 03 Sep 2024 10:32:19 -0700 (PDT)
Received: from embed-PC.. ([106.222.229.246]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206ae9558cfsm1092315ad.101.2024.09.03.10.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 10:32:18 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v2] drm/panel: hx83112a: Transition to wrapped mipi_dsi
 functions
Date: Tue,  3 Sep 2024 23:01:30 +0530
Message-Id: <20240903173130.41784-1-abhishektamboli9@gmail.com>
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

Transition to mipi_dsi_dcs_write_seq_multi() macros for initialization
sequences. The previous mipi_dsi_dcs_write_seq() macros were
non-intuitive and use other wrapped MIPI DSI functions in the
driver code to simplify the code pattern.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409040049.2hf8jrZG-lkp@intel.com/
Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Update the commit message to explain the reason for the change.
- Correct the code by changing 'dsi->mode_flags' to 'dsi_ctx.dsi->mode_flags'
This change addresses a build error in v1 reported by kernel test robot
caused by using an undeclared variable 'dsi'.
[v1] : https://lore.kernel.org/all/20240902170153.34512-1-abhishektamboli9@gmail.com/

 drivers/gpu/drm/panel/panel-himax-hx83112a.c | 140 ++++++++-----------
 1 file changed, 60 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83112a.c b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
index 466c27012abf..6c457d17fd11 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83112a.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
@@ -58,30 +58,28 @@ static void hx83112a_reset(struct hx83112a_panel *ctx)

 static int hx83112a_on(struct hx83112a_panel *ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = ctx->dsi};
+
+	dsi_ctx.dsi->mode_flags |= MIPI_DSI_MODE_LPM;

-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETEXTC, 0x83, 0x11, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPOWER1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETEXTC, 0x83, 0x11, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPOWER1,
 			       0x08, 0x28, 0x28, 0x83, 0x83, 0x4c, 0x4f, 0x33);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDISP,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDISP,
 			       0x00, 0x02, 0x00, 0x90, 0x24, 0x00, 0x08, 0x19,
 			       0xea, 0x11, 0x11, 0x00, 0x11, 0xa3);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDRV,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDRV,
 			       0x58, 0x68, 0x58, 0x68, 0x0f, 0xef, 0x0b, 0xc0,
 			       0x0b, 0xc0, 0x0b, 0xc0, 0x00, 0xff, 0x00, 0xff,
 			       0x00, 0x00, 0x14, 0x15, 0x00, 0x29, 0x11, 0x07,
 			       0x12, 0x00, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDRV,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDRV,
 			       0x00, 0x12, 0x12, 0x11, 0x88, 0x12, 0x12, 0x00,
 			       0x53);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
 			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
 			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
 			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
@@ -90,8 +88,8 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
 			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
 			       0x40);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
 			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
 			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
 			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
@@ -100,8 +98,8 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
 			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
 			       0x40);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
 			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
 			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
 			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
@@ -110,13 +108,13 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
 			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
 			       0x40);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTCON,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTCON,
 			       0x70, 0x00, 0x04, 0xe0, 0x33, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPANEL, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPOWER2, 0x2b, 0x2b);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP0,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPANEL, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPOWER2, 0x2b, 0x2b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP0,
 			       0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08,
 			       0x08, 0x03, 0x03, 0x22, 0x18, 0x07, 0x07, 0x07,
 			       0x07, 0x32, 0x10, 0x06, 0x00, 0x06, 0x32, 0x10,
@@ -124,105 +122,87 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x08,
 			       0x09, 0x30, 0x00, 0x00, 0x00, 0x06, 0x0d, 0x00,
 			       0x0f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP0,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP0,
 			       0x00, 0x00, 0x19, 0x10, 0x00, 0x0a, 0x00, 0x81);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP1,
 			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
 			       0xc0, 0xc0, 0x18, 0x18, 0x19, 0x19, 0x18, 0x18,
 			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
 			       0x28, 0x28, 0x24, 0x24, 0x02, 0x03, 0x02, 0x03,
 			       0x00, 0x01, 0x00, 0x01, 0x31, 0x31, 0x31, 0x31,
 			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP2,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP2,
 			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
 			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19,
 			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
 			       0x24, 0x24, 0x28, 0x28, 0x01, 0x00, 0x01, 0x00,
 			       0x03, 0x02, 0x03, 0x02, 0x31, 0x31, 0x31, 0x31,
 			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea,
 			       0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa,
 			       0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa, 0xaa, 0xaa);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0x2e, 0x28, 0x00, 0x00, 0x00, 0xaa, 0x2e,
 			       0x28, 0x00, 0x00, 0x00, 0xaa, 0xee, 0xaa, 0xaa,
 			       0xaa, 0xaa, 0xaa, 0xee, 0xaa, 0xaa, 0xaa, 0xaa);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xaa, 0xff,
 			       0xff, 0xff, 0xff, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
 			       0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xff, 0xff, 0xff,
 			       0xff, 0xff, 0xaa, 0xff, 0xff, 0xff, 0xff, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
 			       0x0e, 0x0e, 0x1e, 0x65, 0x1c, 0x65, 0x00, 0x50,
 			       0x20, 0x20, 0x00, 0x00, 0x02, 0x02, 0x02, 0x05,
 			       0x14, 0x14, 0x32, 0xb9, 0x23, 0xb9, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
 			       0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
 			       0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00,
 			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
 			       0x00, 0x00, 0x00, 0x02, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETCLOCK, 0xd1, 0xd6);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0x3f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0xc6);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPTBA, 0x37);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0x3f);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(150);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETCLOCK, 0xd1, 0xd6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPTBA, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0x3f);

-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(50);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 150);

-	return 0;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	return dsi_ctx.accum_err;
 }

 static int hx83112a_disable(struct drm_panel *panel)
 {
 	struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = ctx->dsi};

-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	dsi_ctx.dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);

-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);

-	return 0;
+	return dsi_ctx.accum_err;
 }

 static int hx83112a_prepare(struct drm_panel *panel)
--
2.34.1

