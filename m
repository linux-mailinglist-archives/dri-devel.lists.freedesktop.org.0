Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4COBEcB1fWn+SAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 04:23:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C620C080D
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 04:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B6410E220;
	Sat, 31 Jan 2026 03:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nbFghdZ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA8710E1D9
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 03:23:40 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a7b23dd036so13409305ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 19:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769829820; x=1770434620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fb5TlTnvI6KGifi3UIljVd7X8aloyriFgviWVutVtk8=;
 b=nbFghdZ5KfAhHy2DVI7piEca0K2LjzmiZUkWwiAXoKqoiA6r/EjbT9mbGVZMVFzHo0
 xLOBsPHu35uup7YZkUiDP4+r9z1MPz/aHqmbD0k8zAHny19O95ChaXGo3QhtKswjjEhk
 G4cIcZJzAJqA2NeGv51DiaZZMvdNa0fZkO5UrTXAGP2NTJSMeNqqhTFCQOXU1uPbPfxE
 Ix+cvZLXtOjN/miIHL+IZibrxW9fkCpJbXvkqgonv2QJOKe1fSRHk1bMnecQk1pW3fKu
 vduPpgGP0hPSTIq5sBCq3bYaPoT3LJctAy5cZG8tIi1KWYyyl5/E8SUGOfz4ZODtVljB
 n2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769829820; x=1770434620;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fb5TlTnvI6KGifi3UIljVd7X8aloyriFgviWVutVtk8=;
 b=W8MKV80IG2jUQDcgWtngg/yeiTox8oswgoL7nyvUNJM3HnHaheSTuAfiono/3Gr2uR
 0YC+HQKR0DREFh+Cz1ILAeAJQh9rAwOCBw7DYPy0/ecI4wDnNHpisg6TkGSBZS+50tfM
 3osqJWNqSpIrngjkSm/tg3uaVRWXlDcgV8Xwg5QN/A9zHsjqLK2ztqA5PL75oyPVO8ey
 GwYfh3D+vD0xIJVLqGjPI+PFvPvBVhgiZPPzkhO8Cw7PWu9TiK40htygimsh2nEj3eh6
 O/jOH2ODsRbyFtps16fOGOuCxVi8aEPcORn+ql6pBGImjlAw1odGeuxaTBbOB96OVH52
 p9Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxEm35fy6wvmFICioRhSoeladzL8/VANoRnhd+zWcRdjsCXftMc55I/L158bso6w8z/QTYKAsQjVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8Q07t5wLWx2IPWCbw7W1xcFnHOdJaz04hPdpKsRfK7o2haCXG
 rM3p4Y3JiI/ogWfKjtTxm4zbdQWbAtGR5DYgNRVXrQNXNwBZWqwyDHf6
X-Gm-Gg: AZuq6aKe3DsTFDnLvpNLJnfhwMzfn3+u+3uPWD/eenhLY2kGRyc4JCuRvKhupKMbhzP
 jvlTkBvR+0JXE0GxgEqGc9UbsJiu0pQ1Mfb2mQH0+pf6GxaLAdKEZpN3/eEqp3xC5Z8m+WvRA8S
 CQGzDaXZ1Xk4u0xVOy7ExxzdVmfwJtydcegTpc11Jb8MmQhisLRW6utHnlM9eX6T3yWnqRIlbd/
 wRwL8Wkr1jJB44CDE0Hq39wQ4Eo0XmDwaPwtUlrePLQXOhext46vrtWrvEcH9qdalB+a0koZu01
 SUJeDm2ApvbSVdT+xY1ThPwsgOMoNeu6djKq7EtBevpf5H6Ocr6a4YpuMkQYXsoWtL7IdABLW+L
 PbPXWQSouwfD8o/AIZ54sJ1HGt2wtr/poAoFFUaKkBQGypGUQVdd6kMFQgUzVqj3daCnOWGCrZ/
 X25Ea1bUdJy15p5tsAYcPVKZVE6YvBS8FmO/Ph3XRkrV4=
X-Received: by 2002:a17:903:b48:b0:2a8:7814:47d0 with SMTP id
 d9443c01a7336-2a8d7ed6d32mr47355535ad.22.1769829819595; 
 Fri, 30 Jan 2026 19:23:39 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:5a43:d240:8ceb:9a37])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c4665sm87609455ad.64.2026.01.30.19.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 19:23:39 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: neil.armstrong@linaro.org
Cc: dianders@chromium.org, jesszhan0024@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH] drm/panel: jdi-lt070me05000: Use MIPI DSI multi functions
Date: Fri, 30 Jan 2026 19:23:21 -0800
Message-ID: <20260131032321.6332-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:dianders@chromium.org,m:jesszhan0024@gmail.com,m:linux-kernel@vger.kernel.org,m:chintanlike@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 9C620C080D
X-Rspamd-Action: no action

Convert to the non-deprecated mipi_dsi_*_multi() helpers per the TODO
list. These reduce boilerplate error checking while providing proper
error accumulation via mipi_dsi_multi_context.

Also use mipi_dsi_msleep()/mipi_dsi_usleep_range() macros for all
delays, which automatically skip on error.

Suggested-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 105 ++++--------------
 1 file changed, 23 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 3513e5c4dd8c..50272364d9d4 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -48,34 +48,16 @@ static inline struct jdi_panel *to_jdi_panel(struct drm_panel *panel)
 static int jdi_panel_init(struct jdi_panel *jdi)
 {
 	struct mipi_dsi_device *dsi = jdi->dsi;
-	struct device *dev = &jdi->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_soft_reset(dsi);
-	if (ret < 0)
-		return ret;
-
-	usleep_range(10000, 20000);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, MIPI_DCS_PIXEL_FMT_24BIT << 4);
-	if (ret < 0) {
-		dev_err(dev, "failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0, jdi->mode->hdisplay - 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to set column address: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 20000);
 
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0, jdi->mode->vdisplay - 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to set page address: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, MIPI_DCS_PIXEL_FMT_24BIT << 4);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, jdi->mode->hdisplay - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, jdi->mode->vdisplay - 1);
 
 	/*
 	 * BIT(5) BCTRL = 1 Backlight Control Block On, Brightness registers
@@ -83,90 +65,49 @@ static int jdi_panel_init(struct jdi_panel *jdi)
 	 * BIT(3) BL = 1    Backlight Control On
 	 * BIT(2) DD = 0    Display Dimming is Off
 	 */
-	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
-				 (u8[]){ 0x24 }, 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to write control display: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
 
 	/* CABC off */
-	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_POWER_SAVE,
-				 (u8[]){ 0x00 }, 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to set cabc off: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "failed to set exit sleep mode: %d\n", ret);
-		return ret;
-	}
-
-	msleep(120);
-
-	ret = mipi_dsi_generic_write(dsi, (u8[]){0xB0, 0x00}, 2);
-	if (ret < 0) {
-		dev_err(dev, "failed to set mcap: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	mdelay(10);
+	mipi_dsi_generic_write_multi(&dsi_ctx, (u8[]){0xB0, 0x00}, 2);
+	mipi_dsi_msleep(&dsi_ctx, 10);
 
 	/* Interface setting, video mode */
-	ret = mipi_dsi_generic_write(dsi, (u8[])
-				     {0xB3, 0x26, 0x08, 0x00, 0x20, 0x00}, 6);
-	if (ret < 0) {
-		dev_err(dev, "failed to set display interface setting: %d\n"
-			, ret);
-		return ret;
-	}
+	mipi_dsi_generic_write_multi(&dsi_ctx, (u8[]){0xB3, 0x26, 0x08, 0x00, 0x20, 0x00}, 6);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
-	mdelay(20);
+	mipi_dsi_generic_write_multi(&dsi_ctx, (u8[]){0xB0, 0x03}, 2);
 
-	ret = mipi_dsi_generic_write(dsi, (u8[]){0xB0, 0x03}, 2);
-	if (ret < 0) {
-		dev_err(dev, "failed to set default values for mcap: %d\n"
-			, ret);
-		return ret;
-	}
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int jdi_panel_on(struct jdi_panel *jdi)
 {
 	struct mipi_dsi_device *dsi = jdi->dsi;
-	struct device *dev = &jdi->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to set display on: %d\n", ret);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static void jdi_panel_off(struct jdi_panel *jdi)
 {
 	struct mipi_dsi_device *dsi = jdi->dsi;
-	struct device *dev = &jdi->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to set display off: %d\n", ret);
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to enter sleep mode: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	msleep(100);
+	mipi_dsi_msleep(&dsi_ctx, 100);
 }
 
 static int jdi_panel_disable(struct drm_panel *panel)
-- 
2.43.0

