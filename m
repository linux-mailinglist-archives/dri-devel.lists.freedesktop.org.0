Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id V+Z6LJ19gWnkGgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 05:46:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA698D4768
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 05:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5BC10E14C;
	Tue,  3 Feb 2026 04:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MBK8jSzA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED7810E14C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 04:46:16 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-34c708702dfso2763869a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 20:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770093976; x=1770698776; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZobJJVk0tGhhuV5Q0krVd0tD0RSKYKDKRZ6H7tjSRA0=;
 b=MBK8jSzALSD3jnGw3QErd1zNHIvRGKSB5KRfHSlC26IeJQerU2BK0rW87GuvoGImuA
 qX6kdoEV9eoFFvStxAF+5Jy0dRcOi8l0dlXqI12zeZ6xeIVqLweABHUihKT8GipDdbxz
 LciLwXAPGBL6k/ye0NAj3XqVNQYP0sp9kM47F4iBi7UbItO7zwsMelhaDj8YBNWCLBRk
 mMa0iiBtHSmVgoGdyKqYo5ePH6vz4gGnwjVnbqMrJLpBVxZTofvzLNqFa6zkE6HZrVT/
 wpa/U/+bvdrceix/qLmUluCCrCSD73vg9o67EYUqURdi9gzsePfPilYCztRe4U5gESJG
 Oong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770093976; x=1770698776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZobJJVk0tGhhuV5Q0krVd0tD0RSKYKDKRZ6H7tjSRA0=;
 b=VKh7yMdpb4N0n5uB6C60+FtORuUM+WPqq7/wPJhuVb4LiZahIDizK/x5rhJ1sz/eeF
 9TqrJLi3xqdilI6Jss2MTdrr+guGFr/kZGOiZra7venKms6OMHwUxWUTwHGWdaNfuplx
 9u9ogY0yHW08uhwSwvotX9Skx4+GqoBNN+YO1LQg3xxNlIpBTFsW3X33uySolAK49EL6
 mlbUu/FcUv3Pe9L+cJzkRDEqpOP4sduTSEt1p7lW6jHhS7I3PVXQRFW8f8mNJ4C+hsJv
 Thr9m/JXD2lBqUipn5pcGHpfUoln2h2DUs+Br8yWXYgI0VX9iyV7pdaEGdvEAC/SwZzG
 i7kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwOoSAHlr3lIhXdLdBKL3+eYMYc5nqfb1GHDbpGykM2/jgfBqJMvB1Ud9Noav16qi/o2Pjs5UXPJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGimb0TP93uC1Nx8CM2hMF0t5bl74qadVlcIzt1r9kX7ZC7QwY
 m5Yh7kn5CVMV4Qe63k/0hxQ0dxp7rmn+0TAZp2kzIV0rN5mYwuX2Eb/E
X-Gm-Gg: AZuq6aLMiWmT4poyngQwECrUeJLKgzGqhnv+bguC7pQiUcYtVR52MVLhXVXhoLgL8c/
 w2Fo7rokhzUujGsO4doJAz4PalwsEzgwXVar5/Yv6NWcjsHKbBTuNI+gARqXCWU8TwrDvUE3kW8
 g+/qs1LIxOmIT3cqRfsfqC5r78gkvDR3czTsfIkwgey73kt+Xv95PX64gSbWr/brtMNTy58g1oD
 zerOlCsJYIfhIGJwQ6UKByailr0n31CJEUwpFTvE9Gz6qAjSPixr/fjuC0lwvNG76vyydIh5K7n
 PzpYSih5FqtZKb5NpGK07OQblR72uYoY83xwZPMPTdW0x8kDG5ECYMPvVQQltVF7HKdNeyz5iSK
 ji99YBSWh8alS25fSrFA4JiISTe2lE2SPUHzbOl2WisiW3ygtYO1sEy3X8iAu80GGzIv4910NE/
 mqR4CBXMLu9GJoEGzfvO4QufMh8D1Lr1EiSSc2surhKUc=
X-Received: by 2002:a17:90b:3f85:b0:341:8b2b:43c with SMTP id
 98e67ed59e1d1-3543b3d65e2mr13610103a91.18.1770093975751; 
 Mon, 02 Feb 2026 20:46:15 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:e2db:5e08:8a06:99b5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379bfd8b7sm16029409b3a.31.2026.02.02.20.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 20:46:15 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: neil.armstrong@linaro.org
Cc: dianders@chromium.org, jesszhan0024@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v2] drm/panel: jdi-lt070me05000: Use MIPI DSI multi functions
Date: Mon,  2 Feb 2026 20:46:04 -0800
Message-ID: <20260203044605.5890-1-chintanlike@gmail.com>
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
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DA698D4768
X-Rspamd-Action: no action

Convert to the non-deprecated mipi_dsi_*_multi() helpers per the TODO
list. This reduces boilerplate error checking while providing proper
error accumulation.

Use mipi_dsi_msleep() and mipi_dsi_usleep_range() macros for delays.
Replace mdelay(10) and mdelay(20) with mipi_dsi_usleep_range() calls
using tighter slop (10-11ms and 20-21ms respectively) since these
functions aren't run often and don't need large timing windows.

In jdi_panel_off(), reset the error context between display_off and
enter_sleep_mode to preserve the original behavior of continuing power-down
even if display_off fails. This ensures enter_sleep_mode executes before
GPIO/regulator control, which is critical for proper power sequencing.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---

Changes in v2:
- Replaced mdelay() with mipi_dsi_usleep_range() for timing (tighter bounds per review)
- Switched to mipi_dsi_generic_write_seq_multi() for cleaner varargs syntax
- Applied lowercase hex notation per kernel style guide
- Added error accumulator reset in jdi_panel_off() to preserve power-down behavior
- Kept final msleep(100) outside multi context for safety 

 .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 105 ++++--------------
 1 file changed, 24 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 3513e5c4dd8c..01bd748aecec 100644
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
@@ -83,88 +65,49 @@ static int jdi_panel_init(struct jdi_panel *jdi)
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
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
 
 	/* Interface setting, video mode */
-	ret = mipi_dsi_generic_write(dsi, (u8[])
-				     {0xB3, 0x26, 0x08, 0x00, 0x20, 0x00}, 6);
-	if (ret < 0) {
-		dev_err(dev, "failed to set display interface setting: %d\n"
-			, ret);
-		return ret;
-	}
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb3, 0x26, 0x08, 0x00, 0x20, 0x00);
+	mipi_dsi_usleep_range(&dsi_ctx, 20000, 21000);
 
-	mdelay(20);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
 
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
+	/* Reset error to continue power-down even if display off failed */
+	dsi_ctx.accum_err = 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	msleep(100);
 }
-- 
2.43.0

