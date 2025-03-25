Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A3A6ECED
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F9E10E530;
	Tue, 25 Mar 2025 09:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XJurNFjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6534910E530
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:47:19 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-22401f4d35aso110310125ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742896039; x=1743500839; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KhJlowFE0BCTZgFwXQVnrLWzQtFejAOffegD1qT+lVM=;
 b=XJurNFjt9i/KXoJS/6DPvelAl1wk9F2lWnaU9qZeChBcYQ/exm9C9ax+G8c0qlm8sx
 UOFKFIDziG56I82dxb0T09Yt9Bsh+3hdH4K4H5uuDHS4q8WzLyGbe5qEfuIZ1KCmdNJf
 2UF00usU+XEchlNkJ/iFbwaqBOSYmiyMRIzUngWma7tpJTtnns9zgqW1oqUY2X9WO2HI
 ZwLY/4n2Ynda2KV7IO84Ui4fbP9IEQtAdbWNIAJm6i35WDjiL+ZhYG67IpXgXOPeczA3
 Eii5ZJso1v6fQIzfEeIEdEl3zkWsB3rzDqGmrMe+53cAAy6owcrv3HiQGgjrOuEPyvlp
 3w/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742896039; x=1743500839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KhJlowFE0BCTZgFwXQVnrLWzQtFejAOffegD1qT+lVM=;
 b=UIvjY+Hu3gZOTGB/AXNFbuqFfz31kvRmql9pCBAqLygLuDfCZ0alubMvpK9h0K/Igm
 lOtMt5HtRpw8TfqnMzbGvqYcJOkIPk2DJOu18Sb06O9W1J4vIRpsP66jBtOPAoYxuBYw
 YeMtrjo/w9iWhqJjbapkeO0T3oZJMXh5klCcQTNeTqxnt6TYBF99XLNE2cEgr7EoJ0g8
 tFtgIWv/qTM2iIuvt2pO1QWfX8IzvktyJvecAk6AmvGn3x6Sk3WELzyEZ8cReTDtAEWZ
 oUAZWF6QLDlv7Tpax4El7QEsMJREETdJZ1ee55ws2tl1isUMt6y29OjqAv8PC8ObANpz
 r+5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgIt+DeXHI+CjUxZ3s5cJV5fx2+cBrk6Uktgv0NfEeH3YF2Ml/uVtMhvlAFkVm3Z1OuxAZXS2j3OM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVQgQU8i1c3iz8eKCijEURgcM5Ry1F9SvYiHrqhPHJzLOlAh1W
 3XIgKC3ALgyUQP9qb2MY2yY0ARoC226qS5wbAG+VBnK9eX5R8GtN
X-Gm-Gg: ASbGnctluk514Gg13O8Fc0K7GHKHx5KG1flmitlbPwkOa2h0LzaCQ8d2wRK7yvbZ+nd
 CwoCXQIHkYyL9kvqm6qKmmkv4oyie2vb4YJ/C2U31OZc30LVlbzL6HieOkNFgEk83MHS8j6YmYs
 J13ta5K6HZS1oGh+vIsYjGVxqW1JHQEEifdGIkWyURlDDQ9WBERO3bgBMnHv76bxslLeyvuJETs
 lIcWsu1O6poZo7SevEXLKyqG+WiXXWS5dTsmLRgciSHm+yg/1WUDoElnp7ak3AKIEpJf3skCqhk
 6m9qBsDrTXaOxZ7N1ME/B2XrdpzL0Cl6pS8zg4N1QeMFQlxLNGg1rYlEbIXEiMPn7g==
X-Google-Smtp-Source: AGHT+IETsvw6Rm5mWW/ql/I12bMlRRKlBdgbhCcMBWix26ySp3Z/Yj9vqpHFcOroRKyQOjwyx9ALSw==
X-Received: by 2002:a17:902:d504:b0:215:bc30:c952 with SMTP id
 d9443c01a7336-22780c68a03mr220550775ad.6.1742896038499; 
 Tue, 25 Mar 2025 02:47:18 -0700 (PDT)
Received: from distilledx.localdomain
 ([2401:4900:6284:2aee:cc35:9d5:d0e6:da4c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227811daa2dsm86030465ad.171.2025.03.25.02.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 02:47:18 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, megi@xff.cz, javierm@redhat.com
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2] drm/panel: himax-hx8394: transition to mipi_dsi wrapped
 functions
Date: Tue, 25 Mar 2025 15:17:07 +0530
Message-ID: <20250325094707.961349-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.49.0
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

Changes the himax-hx8394 panel to use multi style functions for
improved error handling.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v2:
    - Revert behavior change in hx8394_enable
    - Move variable declaration to top of function

Link to v1: https://lore.kernel.org/all/20250323053007.681346-1-tejasvipin76@gmail.com/
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 441 ++++++++++-----------
 1 file changed, 210 insertions(+), 231 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index 92b03a2f65a3..ff994bf0e3cc 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -80,7 +80,7 @@ struct hx8394_panel_desc {
 	unsigned int lanes;
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
-	int (*init_sequence)(struct hx8394 *ctx);
+	void (*init_sequence)(struct mipi_dsi_multi_context *dsi_ctx);
 };
 
 static inline struct hx8394 *panel_to_hx8394(struct drm_panel *panel)
@@ -88,98 +88,94 @@ static inline struct hx8394 *panel_to_hx8394(struct drm_panel *panel)
 	return container_of(panel, struct hx8394, panel);
 }
 
-static int hsd060bhw4_init_sequence(struct hx8394 *ctx)
+static void hsd060bhw4_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-
 	/* 5.19.8 SETEXTC: Set extension command (B9h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
-			       0xff, 0x83, 0x94);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETEXTC,
+				     0xff, 0x83, 0x94);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x48, 0x11, 0x71, 0x09, 0x32, 0x24, 0x71, 0x31, 0x55, 0x30);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x48, 0x11, 0x71, 0x09, 0x32, 0x24, 0x71, 0x31, 0x55, 0x30);
 
 	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
-			       0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETMIPI,
+				     0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
 
 	/* 5.19.3 SETDISP: Set display related register (B2h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
-			       0x00, 0x80, 0x78, 0x0c, 0x07);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETDISP,
+				     0x00, 0x80, 0x78, 0x0c, 0x07);
 
 	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
-			       0x12, 0x63, 0x12, 0x63, 0x12, 0x63, 0x01, 0x0c, 0x7c, 0x55,
-			       0x00, 0x3f, 0x12, 0x6b, 0x12, 0x6b, 0x12, 0x6b, 0x01, 0x0c,
-			       0x7c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETCYC,
+				     0x12, 0x63, 0x12, 0x63, 0x12, 0x63, 0x01, 0x0c, 0x7c, 0x55,
+				     0x00, 0x3f, 0x12, 0x6b, 0x12, 0x6b, 0x12, 0x6b, 0x01, 0x0c,
+				     0x7c);
 
 	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
-			       0x00, 0x00, 0x00, 0x00, 0x3c, 0x1c, 0x00, 0x00, 0x32, 0x10,
-			       0x09, 0x00, 0x09, 0x32, 0x15, 0xad, 0x05, 0xad, 0x32, 0x00,
-			       0x00, 0x00, 0x00, 0x37, 0x03, 0x0b, 0x0b, 0x37, 0x00, 0x00,
-			       0x00, 0x0c, 0x40);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP0,
+				     0x00, 0x00, 0x00, 0x00, 0x3c, 0x1c, 0x00, 0x00, 0x32, 0x10,
+				     0x09, 0x00, 0x09, 0x32, 0x15, 0xad, 0x05, 0xad, 0x32, 0x00,
+				     0x00, 0x00, 0x00, 0x37, 0x03, 0x0b, 0x0b, 0x37, 0x00, 0x00,
+				     0x00, 0x0c, 0x40);
 
 	/* 5.19.20 Set GIP Option1 (D5h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
-			       0x19, 0x19, 0x18, 0x18, 0x1b, 0x1b, 0x1a, 0x1a, 0x00, 0x01,
-			       0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x20, 0x21, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x24, 0x25, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP1,
+				     0x19, 0x19, 0x18, 0x18, 0x1b, 0x1b, 0x1a, 0x1a, 0x00, 0x01,
+				     0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x20, 0x21, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x24, 0x25, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
 
 	/* 5.19.21 Set GIP Option2 (D6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
-			       0x18, 0x18, 0x19, 0x19, 0x1b, 0x1b, 0x1a, 0x1a, 0x07, 0x06,
-			       0x05, 0x04, 0x03, 0x02, 0x01, 0x00, 0x25, 0x24, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP2,
+				     0x18, 0x18, 0x19, 0x19, 0x1b, 0x1b, 0x1a, 0x1a, 0x07, 0x06,
+				     0x05, 0x04, 0x03, 0x02, 0x01, 0x00, 0x25, 0x24, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
 
 	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
-			       0x00, 0x04, 0x0c, 0x12, 0x14, 0x18, 0x1a, 0x18, 0x31, 0x3f,
-			       0x4d, 0x4c, 0x54, 0x65, 0x6b, 0x70, 0x7f, 0x82, 0x7e, 0x8a,
-			       0x99, 0x4a, 0x48, 0x49, 0x4b, 0x4a, 0x4c, 0x4b, 0x7f, 0x00,
-			       0x04, 0x0c, 0x11, 0x13, 0x17, 0x1a, 0x18, 0x31,
-			       0x3f, 0x4d, 0x4c, 0x54, 0x65, 0x6b, 0x70, 0x7f,
-			       0x82, 0x7e, 0x8a, 0x99, 0x4a, 0x48, 0x49, 0x4b,
-			       0x4a, 0x4c, 0x4b, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGAMMA,
+				     0x00, 0x04, 0x0c, 0x12, 0x14, 0x18, 0x1a, 0x18, 0x31, 0x3f,
+				     0x4d, 0x4c, 0x54, 0x65, 0x6b, 0x70, 0x7f, 0x82, 0x7e, 0x8a,
+				     0x99, 0x4a, 0x48, 0x49, 0x4b, 0x4a, 0x4c, 0x4b, 0x7f, 0x00,
+				     0x04, 0x0c, 0x11, 0x13, 0x17, 0x1a, 0x18, 0x31,
+				     0x3f, 0x4d, 0x4c, 0x54, 0x65, 0x6b, 0x70, 0x7f,
+				     0x82, 0x7e, 0x8a, 0x99, 0x4a, 0x48, 0x49, 0x4b,
+				     0x4a, 0x4c, 0x4b, 0x7f);
 
 	/* 5.19.17 SETPANEL (CCh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
-			       0x0b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPANEL,
+				     0x0b);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
-			       0x1f, 0x31);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN1,
+				     0x1f, 0x31);
 
 	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
-			       0x7d, 0x7d);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETVCOM,
+				     0x7d, 0x7d);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
-			       0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN3,
+				     0x02);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x01);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x00);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
-			       0xed);
-
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN3,
+				     0xed);
 }
 
 static const struct drm_display_mode hsd060bhw4_mode = {
@@ -205,114 +201,110 @@ static const struct hx8394_panel_desc hsd060bhw4_desc = {
 	.init_sequence = hsd060bhw4_init_sequence,
 };
 
-static int powkiddy_x55_init_sequence(struct hx8394 *ctx)
+static void powkiddy_x55_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-
 	/* 5.19.8 SETEXTC: Set extension command (B9h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
-			       0xff, 0x83, 0x94);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETEXTC,
+				     0xff, 0x83, 0x94);
 
 	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
-			       0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETMIPI,
+				     0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x48, 0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71, 0x57, 0x47);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x48, 0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71, 0x57, 0x47);
 
 	/* 5.19.3 SETDISP: Set display related register (B2h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
-			       0x00, 0x80, 0x64, 0x2c, 0x16, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETDISP,
+				     0x00, 0x80, 0x64, 0x2c, 0x16, 0x2f);
 
 	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
-			       0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 0x86, 0x75,
-			       0x00, 0x3f, 0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c,
-			       0x86);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETCYC,
+				     0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 0x86, 0x75,
+				     0x00, 0x3f, 0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c,
+				     0x86);
 
 	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
-			       0x6e, 0x6e);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETVCOM,
+				     0x6e, 0x6e);
 
 	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
-			       0x00, 0x00, 0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 0x08, 0x10,
-			       0x08, 0x00, 0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a, 0x02, 0x15,
-			       0x06, 0x05, 0x06, 0x47, 0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
-			       0x07, 0x0c, 0x40);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP0,
+				     0x00, 0x00, 0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 0x08, 0x10,
+				     0x08, 0x00, 0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a, 0x02, 0x15,
+				     0x06, 0x05, 0x06, 0x47, 0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
+				     0x07, 0x0c, 0x40);
 
 	/* 5.19.20 Set GIP Option1 (D5h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
-			       0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
-			       0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25, 0x18, 0x18,
-			       0x26, 0x27, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x21,
-			       0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP1,
+				     0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
+				     0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25, 0x18, 0x18,
+				     0x26, 0x27, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x21,
+				     0x18, 0x18, 0x18, 0x18);
 
 	/* 5.19.21 Set GIP Option2 (D6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
-			       0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02,
-			       0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20, 0x18, 0x18,
-			       0x27, 0x26, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x25, 0x24,
-			       0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP2,
+				     0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02,
+				     0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20, 0x18, 0x18,
+				     0x27, 0x26, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x25, 0x24,
+				     0x18, 0x18, 0x18, 0x18);
 
 	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
-			       0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56,
-			       0x65, 0x66, 0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d, 0x98, 0xa8,
-			       0xb9, 0x5d, 0x5c, 0x61, 0x66, 0x6a, 0x6f, 0x7f, 0x7f, 0x00,
-			       0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56, 0x65,
-			       0x65, 0x6e, 0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99, 0xa8, 0xba,
-			       0x5d, 0x5d, 0x62, 0x67, 0x6b, 0x72, 0x7f, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGAMMA,
+				     0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56,
+				     0x65, 0x66, 0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d, 0x98, 0xa8,
+				     0xb9, 0x5d, 0x5c, 0x61, 0x66, 0x6a, 0x6f, 0x7f, 0x7f, 0x00,
+				     0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56, 0x65,
+				     0x65, 0x6e, 0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99, 0xa8, 0xba,
+				     0x5d, 0x5d, 0x62, 0x67, 0x6b, 0x72, 0x7f, 0x7f);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
-			       0x1f, 0x31);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN1,
+				     0x1f, 0x31);
 
 	/* 5.19.17 SETPANEL (CCh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
-			       0x0b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPANEL,
+				     0x0b);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
-			       0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN3,
+				     0x02);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x02);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN4,
-			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-			       0xff, 0xff);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN4,
+				     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+				     0xff, 0xff);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x01);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x00);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN5,
-			       0x40, 0x81, 0x50, 0x00, 0x1a, 0xfc, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN5,
+				     0x40, 0x81, 0x50, 0x00, 0x1a, 0xfc, 0x01);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN2,
-			       0xed);
-
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN2,
+				     0xed);
 }
 
 static const struct drm_display_mode powkiddy_x55_mode = {
@@ -339,131 +331,127 @@ static const struct hx8394_panel_desc powkiddy_x55_desc = {
 	.init_sequence = powkiddy_x55_init_sequence,
 };
 
-static int mchp_ac40t08a_init_sequence(struct hx8394 *ctx)
+static void mchp_ac40t08a_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-
 	/* DCS commands do not seem to be sent correclty without this delay */
-	msleep(20);
+	mipi_dsi_msleep(dsi_ctx, 20);
 
 	/* 5.19.8 SETEXTC: Set extension command (B9h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
-			       0xff, 0x83, 0x94);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETEXTC,
+				     0xff, 0x83, 0x94);
 
 	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
-			       0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETMIPI,
+				     0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x48, 0x12, 0x72, 0x09, 0x32, 0x54,
-			       0x71, 0x71, 0x57, 0x47);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x48, 0x12, 0x72, 0x09, 0x32, 0x54,
+				     0x71, 0x71, 0x57, 0x47);
 
 	/* 5.19.3 SETDISP: Set display related register (B2h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
-			       0x00, 0x80, 0x64, 0x0c, 0x0d, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETDISP,
+				     0x00, 0x80, 0x64, 0x0c, 0x0d, 0x2f);
 
 	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
-			       0x73, 0x74, 0x73, 0x74, 0x73, 0x74,
-			       0x01, 0x0c, 0x86, 0x75, 0x00, 0x3f,
-			       0x73, 0x74, 0x73, 0x74, 0x73, 0x74,
-			       0x01, 0x0c, 0x86);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETCYC,
+				     0x73, 0x74, 0x73, 0x74, 0x73, 0x74,
+				     0x01, 0x0c, 0x86, 0x75, 0x00, 0x3f,
+				     0x73, 0x74, 0x73, 0x74, 0x73, 0x74,
+				     0x01, 0x0c, 0x86);
 
 	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
-			       0x6e, 0x6e);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETVCOM,
+				     0x6e, 0x6e);
 
 	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
-			       0x00, 0x00, 0x07, 0x07, 0x40, 0x07,
-			       0x0c, 0x00, 0x08, 0x10, 0x08, 0x00,
-			       0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a,
-			       0x02, 0x15, 0x06, 0x05, 0x06, 0x47,
-			       0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
-			       0x07, 0x0c, 0x40);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP0,
+				     0x00, 0x00, 0x07, 0x07, 0x40, 0x07,
+				     0x0c, 0x00, 0x08, 0x10, 0x08, 0x00,
+				     0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a,
+				     0x02, 0x15, 0x06, 0x05, 0x06, 0x47,
+				     0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
+				     0x07, 0x0c, 0x40);
 
 	/* 5.19.20 Set GIP Option1 (D5h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
-			       0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01,
-			       0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
-			       0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25,
-			       0x18, 0x18, 0x26, 0x27, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x20, 0x21, 0x18, 0x18,
-			       0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP1,
+				     0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01,
+				     0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+				     0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25,
+				     0x18, 0x18, 0x26, 0x27, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x20, 0x21, 0x18, 0x18,
+				     0x18, 0x18);
 
 	/* 5.19.21 Set GIP Option2 (D6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
-			       0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06,
-			       0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
-			       0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20,
-			       0x18, 0x18, 0x27, 0x26, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x25, 0x24, 0x18, 0x18,
-			       0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP2,
+				     0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06,
+				     0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
+				     0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20,
+				     0x18, 0x18, 0x27, 0x26, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x25, 0x24, 0x18, 0x18,
+				     0x18, 0x18);
 
 	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
-			       0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21,
-			       0x24, 0x22, 0x47, 0x56, 0x65, 0x66,
-			       0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d,
-			       0x98, 0xa8, 0xb9, 0x5d, 0x5c, 0x61,
-			       0x66, 0x6a, 0x6f, 0x7f, 0x7f, 0x00,
-			       0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24,
-			       0x22, 0x47, 0x56, 0x65, 0x65, 0x6e,
-			       0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99,
-			       0xa8, 0xba, 0x5d, 0x5d, 0x62, 0x67,
-			       0x6b, 0x72, 0x7f, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGAMMA,
+				     0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21,
+				     0x24, 0x22, 0x47, 0x56, 0x65, 0x66,
+				     0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d,
+				     0x98, 0xa8, 0xb9, 0x5d, 0x5c, 0x61,
+				     0x66, 0x6a, 0x6f, 0x7f, 0x7f, 0x00,
+				     0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24,
+				     0x22, 0x47, 0x56, 0x65, 0x65, 0x6e,
+				     0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99,
+				     0xa8, 0xba, 0x5d, 0x5d, 0x62, 0x67,
+				     0x6b, 0x72, 0x7f, 0x7f);
 
 	/* Unknown command, not listed in the HX8394-F datasheet (C0H) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
-			       0x1f, 0x73);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN1,
+				     0x1f, 0x73);
 
 	/* Set CABC control (C9h)*/
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCABC,
-			       0x76, 0x00, 0x30);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETCABC,
+				     0x76, 0x00, 0x30);
 
 	/* 5.19.17 SETPANEL (CCh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
-			       0x0b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPANEL,
+				     0x0b);
 
 	/* Unknown command, not listed in the HX8394-F datasheet (D4h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
-			       0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN3,
+				     0x02);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x02);
 
 	/* 5.19.11 Set register bank (D8h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN4,
-			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN4,
+				     0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+				     0xff, 0xff, 0xff, 0xff, 0xff, 0xff);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x01);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x00);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
 
 	/* Unknown command, not listed in the HX8394-F datasheet (C6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN2,
-			       0xed);
-
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN2,
+				     0xed);
 }
 
 static const struct drm_display_mode mchp_ac40t08a_mode = {
@@ -493,35 +481,31 @@ static int hx8394_enable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	int ret;
 
-	ret = ctx->desc->init_sequence(ctx);
-	if (ret) {
-		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
-		return ret;
-	}
+	ctx->desc->init_sequence(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret) {
-		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
 	/* Panel is operational 120 msec after reset */
 	msleep(120);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret) {
-		dev_err(ctx->dev, "Failed to turn on the display: %d\n", ret);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
 		goto sleep_in;
-	}
 
 	return 0;
 
 sleep_in:
+	ret = dsi_ctx.accum_err;
+	dsi_ctx.accum_err = 0;
+
 	/* This will probably fail, but let's try orderly power off anyway. */
-	if (!mipi_dsi_dcs_enter_sleep_mode(dsi))
-		msleep(50);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
 
 	return ret;
 }
@@ -530,17 +514,12 @@ static int hx8394_disable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret) {
-		dev_err(ctx->dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	msleep(50); /* about 3 frames */
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50); /* about 3 frames */
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int hx8394_unprepare(struct drm_panel *panel)
-- 
2.49.0

