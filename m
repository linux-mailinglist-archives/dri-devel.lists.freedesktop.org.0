Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N5uMAP7Ym2km8QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 05:35:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39D171C7B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 05:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C37910E217;
	Mon, 23 Feb 2026 04:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Do1qge4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BABC10E217
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 04:35:05 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-354a7b089bbso2287239a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 20:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771821305; x=1772426105; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GI3iRUIh5GHrKKs0FAr5rYUViIfZVlMQDjQ0Q0XmmjQ=;
 b=Do1qge4Ks7t7ypBLKchVDxdp78KiLuHgveSPTKOTzePghvkHRjHaMorW8ZPF9iA0rO
 DNVxt57rH7a2ypmXIdyRhNGn7SEF2Dc0YGqXdw8xv30v9W0FUBVNkmHaquFZhY3DwglS
 7pzAiVeryxNgCdBd14Hu7lpjhbDhU5zQPc9wRmwevZTGYdxEMJ9FwTMnPzfhrUB2/gj/
 8phmwLYHLlBpfX6XUO/S40xO8U0L3I2brZFOetMLApqSg8dU2tFnEkAGhYkCWR+pUKqQ
 pBE2v3BmCn8fT2HJ9ZWikG6ikoxZsEPRGN7APsFFKyqs2urCzy36gZb5hVVFlhbnQICt
 QZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771821305; x=1772426105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GI3iRUIh5GHrKKs0FAr5rYUViIfZVlMQDjQ0Q0XmmjQ=;
 b=OmA4abSTSCcsDUTMPbZaMzSHAKyUrzsT79oOZguDEkHyHIJWmVRte9qYH7wOhZqPb8
 H7uZfCSB0l/wRnkklBOgz9OpsnoUhrIjg+yYJo9K2dUCmXaBW+LXE9yQtaiv/b7MR3CH
 vrS23qla1q4lh/jbGH/2D4iyfwQBTsYRJcI0n4nKLEMEunwmZUZNb/2RI0EJm3ptlnjW
 6nfjMp9mrYQcfhf7w1sgPNYQGPR5AmVz7SfDalL3roRtSJQgJ/xZI2/pc4MmARuoaM2R
 lULHVcKVdrRS0zV9el3sYr1DIcFXxWWO7pZJPDj5DyFOv5TBBiQ+/3UY8ekfdJu6CeQg
 qXmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnj4+cOt1968Hs9rK5CXMW0WOVj3m/XAldRY0OZH6PWsVbsYMXCIrjP+LOsiJtKLQeFsn99MCI4k8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSav+7mye8om8iS4KDmLO/guS5BamgvhCbA2/P8gl8EfyVKNXH
 wfU5SmG6Q+1coMqzzJy96MuUdre2lfgBx6UIyj0tRMJcBkvyxx1y1t4M
X-Gm-Gg: ATEYQzwAkJL16k3av2JHMDTPVl6SjFKYHgJYyS7m1ysAQmafcW4a0g6kTFAYwQIY2R+
 iYXxHPwusLqE3pFV/w9fIAz+HZdJHFzA14aOJOmGKWcIe2ym8UobuBwcostw+nwsVogHiIs3tFu
 8NNsk5wEhDNtyqoWcKJU4hgUlSFHRHjs3pZ648vboiTrSN5JnRaf2ezGQzqWfDpAor8kcuXM5gR
 nTFEjzIUktfxiMR9wfIvq22NcBWfLg1DWfWK0Im7cTXTQNe0PANYT5PD3NQ9jOliNbqJKP7K+S2
 x0IKeRZ6Ew/4wQJ/EJArZx/rHLqGDk/HatOW3kuWSQPzisfYM3QP/JH5Z4ZCVs5iX70ZCOxk8/7
 iKLose0GbkEQvw7A9iASz+4KT4A9zfMyC1G8xhAgvRkjAs8YqDLFQR0sI5ufSBbfgaKxSlXIl3M
 WJATxWRSHbakqw6Cjx6BeG4r8zF2uwTdG8ddb1FsuU6T48tM4l3rWQcC8=
X-Received: by 2002:a17:90b:558b:b0:352:d59a:b28 with SMTP id
 98e67ed59e1d1-358ae8a87d8mr6149084a91.19.1771821304991; 
 Sun, 22 Feb 2026 20:35:04 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:c33a:e011:aa68:c72a])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-358af93b9ddsm5141447a91.14.2026.02.22.20.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 20:35:04 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: sumit.semwal@linaro.org,
	neil.armstrong@linaro.org
Cc: dianders@chromium.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH] drm/panel: novatek-nt36672a: Convert to mipi_dsi_*_multi()
 helpers
Date: Sun, 22 Feb 2026 20:34:41 -0800
Message-ID: <20260223043441.5295-1-chintanlike@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:neil.armstrong@linaro.org,m:dianders@chromium.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:chintanlike@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4A39D171C7B
X-Rspamd-Action: no action

Convert the driver to use the non-deprecated mipi_dsi_*_multi()
helpers and mipi_dsi_msleep().

This removes open-coded error handling and relies on
mipi_dsi_multi_context for error accumulation.

In unprepare(), reset the accumulated error between
set_display_off and enter_sleep_mode to preserve the
existing power-down sequencing semantics.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 83 ++++++-------------
 1 file changed, 26 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 29e1f6aea480..2c8d67a69c7e 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -79,23 +79,17 @@ static inline struct nt36672a_panel *to_nt36672a_panel(struct drm_panel *panel)
 	return container_of(panel, struct nt36672a_panel, base);
 }
 
-static int nt36672a_send_cmds(struct drm_panel *panel, const struct nt36672a_panel_cmd *cmds,
-			      int num)
+static void nt36672a_send_cmds(struct mipi_dsi_multi_context *dsi_ctx,
+				const struct nt36672a_panel_cmd *cmds, int num)
 {
-	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
 	unsigned int i;
-	int err;
 
 	for (i = 0; i < num; i++) {
 		const struct nt36672a_panel_cmd *cmd = &cmds[i];
 
-		err = mipi_dsi_dcs_write(pinfo->link, cmd->data[0], cmd->data + 1, 1);
-
-		if (err < 0)
-			return err;
+		/* cmd->data[0] is the DCS command, cmd->data[1] is the parameter */
+		mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd->data, sizeof(cmd->data));
 	}
-
-	return 0;
 }
 
 static int nt36672a_panel_power_off(struct drm_panel *panel)
@@ -115,34 +109,26 @@ static int nt36672a_panel_power_off(struct drm_panel *panel)
 static int nt36672a_panel_unprepare(struct drm_panel *panel)
 {
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = pinfo->link };
 
 	/* send off cmds */
-	ret = nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
-				 pinfo->desc->num_off_cmds);
+	nt36672a_send_cmds(&dsi_ctx, pinfo->desc->off_cmds,
+			   pinfo->desc->num_off_cmds);
 
-	if (ret < 0)
-		dev_err(panel->dev, "failed to send DCS off cmds: %d\n", ret);
-
-	ret = mipi_dsi_dcs_set_display_off(pinfo->link);
-	if (ret < 0)
-		dev_err(panel->dev, "set_display_off cmd failed ret = %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	/* Reset error to continue power-down even if display off failed */
+	dsi_ctx.accum_err = 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	/* 120ms delay required here as per DCS spec */
 	msleep(120);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->link);
-	if (ret < 0)
-		dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
-
 	/* 0x3C = 60ms delay */
 	msleep(60);
 
-	ret = nt36672a_panel_power_off(panel);
-	if (ret < 0)
-		dev_err(panel->dev, "power_off failed ret = %d\n", ret);
+	nt36672a_panel_power_off(panel);
 
-	return ret;
+	return 0;
 }
 
 static int nt36672a_panel_power_on(struct nt36672a_panel *pinfo)
@@ -170,51 +156,34 @@ static int nt36672a_panel_power_on(struct nt36672a_panel *pinfo)
 static int nt36672a_panel_prepare(struct drm_panel *panel)
 {
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = pinfo->link };
 	int err;
 
 	err = nt36672a_panel_power_on(pinfo);
 	if (err < 0)
-		goto poweroff;
+		return err;
 
 	/* send first part of init cmds */
-	err = nt36672a_send_cmds(panel, pinfo->desc->on_cmds_1,
-				 pinfo->desc->num_on_cmds_1);
+	nt36672a_send_cmds(&dsi_ctx, pinfo->desc->on_cmds_1,
+			   pinfo->desc->num_on_cmds_1);
 
-	if (err < 0) {
-		dev_err(panel->dev, "failed to send DCS Init 1st Code: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_exit_sleep_mode(pinfo->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
 	/* 0x46 = 70 ms delay */
-	msleep(70);
+	mipi_dsi_msleep(&dsi_ctx, 70);
 
-	err = mipi_dsi_dcs_set_display_on(pinfo->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to Set Display ON: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
 	/* Send rest of the init cmds */
-	err = nt36672a_send_cmds(panel, pinfo->desc->on_cmds_2,
-				 pinfo->desc->num_on_cmds_2);
+	nt36672a_send_cmds(&dsi_ctx, pinfo->desc->on_cmds_2,
+			   pinfo->desc->num_on_cmds_2);
 
-	if (err < 0) {
-		dev_err(panel->dev, "failed to send DCS Init 2nd Code: %d\n", err);
-		goto poweroff;
-	}
-
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	return 0;
+	err = dsi_ctx.accum_err;
+	if (err < 0)
+		gpiod_set_value(pinfo->reset_gpio, 0);
 
-poweroff:
-	gpiod_set_value(pinfo->reset_gpio, 0);
 	return err;
 }
 
-- 
2.43.0

