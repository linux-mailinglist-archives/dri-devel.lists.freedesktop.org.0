Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4089487F7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 05:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4E410E2E2;
	Tue,  6 Aug 2024 03:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ssPitwwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B4D10E2E2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 03:40:33 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-26875acdf72so80458fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 20:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1722915633; x=1723520433; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7g7Rn/0nBEnOSdb7NUINlkrq1mPIlMOw+Ici/CNGJ3o=;
 b=ssPitwwdYn+MjvA539qaH/Usllghyk3/9lD0IUX1pXiXgF+3MUw0jCVF/lOYbhK1sa
 h0W0QeIXG3WblxW40OB9XLLhgIuA36sySE7KT7/kxHbBd/Ickf9hWJYfy3ET59cEsIdd
 4dQVPQ0CLErOY8KmmD3AqW2e3eOLATMZ0Np/U+qxaX9Ypy8V8zX2u/b023vy4QIcOZk5
 UiKPLgB2M4Rn3H0IiT/2qUrpPy+in9VHkiqP2CdZf4dkSSABXpDwxivl+1wrvpKn36m4
 edL+yH9R5NHyJkK3/9JR7DB/q2c1C/TlK4IT4w08yVbDyyqD3T2P0uawKX5kUBM8rAIw
 Yrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722915633; x=1723520433;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7g7Rn/0nBEnOSdb7NUINlkrq1mPIlMOw+Ici/CNGJ3o=;
 b=gNG0uh5KJn2XV2Lhtl42fkBUNpjUs8ptLDtT5+gTqU2JThPnEqEO8hUtDR3JXWio8f
 h8BpU7m+CSISxhk5d9C7TiKKfvAP5nLpd8z/MxZEVT08Za7DkqSqBB/i60nt5CNAFVv5
 fCmWhL3NzypQZYcLqtT7yILWKwDzWOgP1xBkFN/w47D4iiC6EMhN3MaDGeWiMz7XynrG
 VI19XOe59zU2DwIl7I662F/ZGQ/ex/OxniiNdkd3hhsb+VZ2vc1hdHS8Lpp39cnwBphZ
 5FjIHe6Jdt+fbwGMmpylUYaEzEjdl+0+H9qOfgWxEJprx2O7E4i4TnSMsaQqWdgZduaT
 pFnw==
X-Gm-Message-State: AOJu0Yx19o8+buFOPqPqvjbrSkSmiwFu5tyTVOFm/pxDKOdTYFYJycZi
 n5tr4dfsvDwUevudhGrjTYZPSYAPx56VcvAJCThEGW2ml0jyG/NyyN5Z+WYJuQ0=
X-Google-Smtp-Source: AGHT+IEXS4uphEZSt1HPL6ILB7ufCnZhPr9rx1rEfeIbg92mrrgsgYnXwPin7gyyEXuCW+WlA7X3pA==
X-Received: by 2002:a05:6870:4714:b0:261:52d:1aef with SMTP id
 586e51a60fabf-26891ecfc52mr17884291fac.49.1722915632845; 
 Mon, 05 Aug 2024 20:40:32 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7106ec49486sm6134074b3a.55.2024.08.05.20.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 20:40:32 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, airlied@gmail.com,
 daniel@ffwll.ch, jagan@edgeble.ai, dmitry.baryshkov@linaro.org,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/2] drm/panel: jd9365da: Move the location of "exit sleep
 mode" and "set display on" commands
Date: Tue,  6 Aug 2024 11:40:14 +0800
Message-Id: <20240806034015.11884-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240806034015.11884-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240806034015.11884-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Move the "exit sleep mode" and "set display on" command from
enable() to init() function.

As mentioned in the patch:
https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Our DSI host has different modes in prepare() and enable()
functions. prepare() is in LP mode and enable() is in HS mode.
Since the "exit sleep mode" and "set display on" command must
also be sent in LP mode, so we also move "exit sleep mode" and
"set display on" command to the init() function.

We have no other actions in the enable() function after moves
"exit sleep mode" and "set display on", and we checked the call
of the enable() function during the "startup" process. It seems
that only one judgment was made in drm_panel_enabel(). If the
panel does not define enable(), the judgment will skip the 
enable() and continue execution. This does not seem to have 
any other effects,and we found that some drivers also seem 
to have no enable() function added, for example:
panel-asus-z00t-tm5p5-n35596 / panel-boe-himax8279d ...
In addition, we briefly tested the kingdisplay_kd101ne3 panel and
melfas_lmfbx101117480 panel, and it seems that there is no garbage
on the panel, so we delete enable() function.

After moving the "exit sleep mode" and "set display on" command
to the init() function, we no longer need additional delay
judgment, so we deletevariables "exit_sleep_to_display_on_delay_ms"
and "display_on_delay_ms".

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V2 and V1:
-  1. The code has not changed, Modify the commit information.
v1: https://lore.kernel.org/all/20240725083245.12253-2-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 59 ++++++++++---------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 04d315d96bff..ce73e8cb1db5 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -31,8 +31,6 @@ struct jadard_panel_desc {
 	bool reset_before_power_off_vcioo;
 	unsigned int vcioo_to_lp11_delay_ms;
 	unsigned int lp11_to_reset_delay_ms;
-	unsigned int exit_sleep_to_display_on_delay_ms;
-	unsigned int display_on_delay_ms;
 	unsigned int backlight_off_to_display_off_delay_ms;
 	unsigned int display_off_to_enter_sleep_delay_ms;
 	unsigned int enter_sleep_to_reset_down_delay_ms;
@@ -66,26 +64,6 @@ static inline struct jadard *panel_to_jadard(struct drm_panel *panel)
 	return container_of(panel, struct jadard, panel);
 }
 
-static int jadard_enable(struct drm_panel *panel)
-{
-	struct jadard *jadard = panel_to_jadard(panel);
-	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
-
-	msleep(120);
-
-	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
-
-	if (jadard->desc->exit_sleep_to_display_on_delay_ms)
-		mipi_dsi_msleep(&dsi_ctx, jadard->desc->exit_sleep_to_display_on_delay_ms);
-
-	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
-
-	if (jadard->desc->display_on_delay_ms)
-		mipi_dsi_msleep(&dsi_ctx, jadard->desc->display_on_delay_ms);
-
-	return dsi_ctx.accum_err;
-}
-
 static int jadard_disable(struct drm_panel *panel)
 {
 	struct jadard *jadard = panel_to_jadard(panel);
@@ -202,7 +180,6 @@ static const struct drm_panel_funcs jadard_funcs = {
 	.disable = jadard_disable,
 	.unprepare = jadard_unprepare,
 	.prepare = jadard_prepare,
-	.enable = jadard_enable,
 	.get_modes = jadard_get_modes,
 	.get_orientation = jadard_panel_get_orientation,
 };
@@ -382,6 +359,12 @@ static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
 
 	jd9365da_switch_page(&dsi_ctx, 0x00);
 
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
 	return dsi_ctx.accum_err;
 };
 
@@ -608,6 +591,12 @@ static int cz101b4001_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE6, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE7, 0x0C);
 
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
 	return dsi_ctx.accum_err;
 };
 
@@ -831,6 +820,16 @@ static int kingdisplay_kd101ne3_init_cmds(struct jadard *jadard)
 
 	jd9365da_switch_page(&dsi_ctx, 0x00);
 
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
 	return dsi_ctx.accum_err;
 };
 
@@ -859,8 +858,6 @@ static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
 	.reset_before_power_off_vcioo = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 10,
-	.exit_sleep_to_display_on_delay_ms = 120,
-	.display_on_delay_ms = 20,
 	.backlight_off_to_display_off_delay_ms = 100,
 	.display_off_to_enter_sleep_delay_ms = 50,
 	.enter_sleep_to_reset_down_delay_ms = 100,
@@ -1074,6 +1071,16 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe7, 0x06);
 
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
 	return dsi_ctx.accum_err;
 };
 
@@ -1102,8 +1109,6 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
 	.reset_before_power_off_vcioo = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 10,
-	.exit_sleep_to_display_on_delay_ms = 120,
-	.display_on_delay_ms = 20,
 	.backlight_off_to_display_off_delay_ms = 100,
 	.display_off_to_enter_sleep_delay_ms = 50,
 	.enter_sleep_to_reset_down_delay_ms = 100,
-- 
2.17.1

