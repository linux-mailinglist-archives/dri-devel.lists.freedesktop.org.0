Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDtCHnQLqWnC0gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 05:49:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCC720AE70
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 05:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E8410EB02;
	Thu,  5 Mar 2026 04:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iaz6AujF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F99A10EB02
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 04:49:51 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2ae43042ea7so49705325ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 20:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772686190; x=1773290990; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wtRLYVacjU+FLKQcuDOYdF2aeBusQOEEXCWfIih9meM=;
 b=Iaz6AujFoXTCrMxz+dI+ATMf5tLLCj3b9sTVdDvUmf0e/hf8bzLokEwN2JEdYYlIlj
 o1HN26ONYF2lq31fd/G28pmQ8xzNlX1yYnSPKFikZTRANKTsiZJUNayfHcsu++DRwOjv
 rrO7k9zkpm2wv3Lj+1zP+8qnnPWtcHnG7bjacvz+c/29K+SCLb3EAAicEWHn4vsmPLB5
 06eAC9kuCsBsBr2omvWt1DQ1duYwCb5+7LJHiHqmrM8KWrC8fiErvlTzfVz1uCw2Mkqb
 egCoRppDlPPBrjlfeJzHp7FJV2KcBYP64cVCBKgZGxuKJkJb8MuOjTy96ZRz7lhVeZ/7
 9fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772686190; x=1773290990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtRLYVacjU+FLKQcuDOYdF2aeBusQOEEXCWfIih9meM=;
 b=TEiUGWgQ8SVbaITy09TS3aU0IbaEHPMhzeUf2NfMDAzu3bvhDBp4GhlU5QBkeSL+q5
 R+n8eGDMuF17n7O2ixc2th17v2VsaTd3yexP+/R0s6rA/aogPTdpDtE517Yi1/AXMBG/
 50x9x2lB2SYHXDJLmP0AAGqxVMPY44fZEUBeAQhXQ9nzvadIvnDimEJRY4+mnrrhsNXE
 2cxZ15KDU6+flDLpeGinuYRq4o+APdRgcMsNsE6yuawVyMingznxhIp+5lffY7Nvxvhd
 6CJ2CSIQxrNVd3mXrJ8xylfv+j2p8O6lPzayjPJYvg0I9S4Y9zLRD3ofZhcgOT/c8t73
 6VSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQu8DnHNvvubjYLVjKIFHRTxMfHDIsBbxrQPVHV1toJftfTpQsjXVoWYB1OxHQYlti/J1TP4/y1mQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydQbtSjK3on3uUQ/qsc/lAEzDDsg39Eq4p9nqW45+smzgAhGrq
 BYa2+fb+JJVdDGf347pViOw7BXqm5Dt2xXkGDQ3ATxKDmdMXpRF+/dam
X-Gm-Gg: ATEYQzwM8Q65Lik7sY68BM3inLo1pnrvSZg/OUWpkax2NY+QApovchcP+zI3WJBjRY9
 tXScKS1Eftnr4Sj7JJ0mP5sH7cWCHwmd/TKxAL6Zwv3c/Z1dy6bgz/KLcs99OLiQLXPNn8mrfOH
 PSq6blx1o3rfB4n6CUkamd8N+gu7Sky4ijWdC7lscDE2H/REj2FOCMYYwXDTO2om/V7aBqxRIVO
 qT7OJOBKyKnOZZSDyCeAo6RDzB5Ppj+Oy2rsOkhLX3Jo42JKidWQ6FJ9dQkUsfGO8bTDI45ug3z
 QN3yxiv2P7PItJ9GdGWVa8gK7KGSp/kmCQnxtr4ZOq+0qxa8PFi9mnqxu+dRErNPZ5AdJab/T0s
 2ZM11hHVMmkZ9sGq9yyevPTKfEUF7cjxEWOKg/WLtOXUR9mO4LhtCxrpofz7IND5dBxLK3Flj4+
 LUMu5yzHfklBqNtlRIDVCPmwHVC2DtaHxfa/bnlAz4SxzG/rIHjox4BA4ky9BwSPyUjq02An5+W
 BtddLGHfsV6yzQ0xmmkS/Bv82jHjku3fOBS02p3LRzCbHZRPVoNVx+ELarT
X-Received: by 2002:a17:902:f652:b0:2ae:524b:93de with SMTP id
 d9443c01a7336-2ae6aa0f419mr40837535ad.17.1772686190452; 
 Wed, 04 Mar 2026 20:49:50 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:50f9:a2c6:c0a6:8352])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae5229cda1sm127350025ad.23.2026.03.04.20.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 20:49:50 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: sumit.semwal@linaro.org,
	neil.armstrong@linaro.org
Cc: dianders@chromium.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v3] drm/panel: novatek-nt36672a: Convert to mipi_dsi_*_multi()
 helpers
Date: Wed,  4 Mar 2026 20:49:21 -0800
Message-ID: <20260305044921.10942-1-chintanlike@gmail.com>
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
X-Rspamd-Queue-Id: CDCC720AE70
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:neil.armstrong@linaro.org,m:dianders@chromium.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:chintanlike@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Convert the driver to use the non-deprecated mipi_dsi_*_multi() helpers and
mipi_dsi_msleep().

Switch DCS command sequences to the multi context API and
accumulate errors via struct mipi_dsi_multi_context. Replace
open-coded error handling with the multi helpers and convert
nt36672a_send_cmds() and power sequencing accordingly.

This patch is intended to functionally be a no-op, though there is one
slight change. Previously a failure in regulator_bulk_disable() would
have caused nt36672a_panel_unprepare() to return an error. Now it
won't. No other errors in nt36672a_panel_unprepare() were propagated,
so this makes things consistent.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
Changes in v3:
- Keep local ret variable in nt36672a_panel_power_off() to preserve error code in logging.
- Change mipi_dsi_msleep() back to regular msleep(60) in power-down sequence to preserve behavior.
- Reset dsi_ctx.accum_err before set_display_off_multi() and before power-down to preserve original error-tolerant shutdown behavior.

Changes in v2:
- Address alignment feedback from Doug.
- Restore original power-down ordering.
- Drop return value from nt36672a_panel_power_off().
- Consolidate error handling around dsi_ctx.accum_err.

 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 94 ++++++-------------
 1 file changed, 30 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 29e1f6aea480..7e8b5e059575 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -79,70 +79,57 @@ static inline struct nt36672a_panel *to_nt36672a_panel(struct drm_panel *panel)
 	return container_of(panel, struct nt36672a_panel, base);
 }
 
-static int nt36672a_send_cmds(struct drm_panel *panel, const struct nt36672a_panel_cmd *cmds,
-			      int num)
+static void nt36672a_send_cmds(struct mipi_dsi_multi_context *dsi_ctx,
+			       const struct nt36672a_panel_cmd *cmds, int num)
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
 
-static int nt36672a_panel_power_off(struct drm_panel *panel)
+static void nt36672a_panel_power_off(struct drm_panel *panel)
 {
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
-	int ret = 0;
+	int ret;
 
 	gpiod_set_value(pinfo->reset_gpio, 1);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
 	if (ret)
 		dev_err(panel->dev, "regulator_bulk_disable failed %d\n", ret);
-
-	return ret;
 }
 
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
+	/* Reset error to continue with display off even if send_cmds failed */
+	dsi_ctx.accum_err = 0;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	/* Reset error to continue power-down even if display off failed */
+	dsi_ctx.accum_err = 0;
 
 	/* 120ms delay required here as per DCS spec */
 	msleep(120);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->link);
-	if (ret < 0)
-		dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
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
@@ -170,52 +157,31 @@ static int nt36672a_panel_power_on(struct nt36672a_panel *pinfo)
 static int nt36672a_panel_prepare(struct drm_panel *panel)
 {
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
-	int err;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = pinfo->link };
 
-	err = nt36672a_panel_power_on(pinfo);
-	if (err < 0)
-		goto poweroff;
+	dsi_ctx.accum_err = nt36672a_panel_power_on(pinfo);
 
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
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	msleep(120);
+	if (dsi_ctx.accum_err < 0)
+		gpiod_set_value(pinfo->reset_gpio, 0);
 
-	return 0;
-
-poweroff:
-	gpiod_set_value(pinfo->reset_gpio, 0);
-	return err;
+	return dsi_ctx.accum_err;
 }
 
 static int nt36672a_panel_get_modes(struct drm_panel *panel,
-- 
2.43.0

