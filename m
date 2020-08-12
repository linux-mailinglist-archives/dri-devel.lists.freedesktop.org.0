Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B542434A1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454BF6E56D;
	Thu, 13 Aug 2020 07:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE2B6E8BE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 07:25:57 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id q19so716406pll.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 00:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=am/paBIRBoe+TlJ53IdaKYgaEqNB1eUlysXKpuKQLNk=;
 b=C25vs753EXXXsK5OqNG2Ui+XT2YUKx+jtCvtGRutfG4Abx+VojyxZMvuklwDs1vqRb
 Q6FrjM0fP/wVcMDvvXOYuQVj52+Mufbub+vWq2NiR2cTIjOByTCza8r+IOinLFNp+nmC
 KbKUQ9gL8hDJI3Yna8G1I66e8qHJngeddNOJpnEPnFcrhkAgjE1oAfttTl6ZGNM7pgDH
 +J3FriGhWmdGQwmW4wwxep723I3os1EUF076ymoALS4MvPZn5fj7aP2fxkIRPjV0DkvT
 QKhWXEMFknTsNfzvrU2zIAB6sPTIanJcrliCJA1lTgIUXqp9x0VOxdhU9so8LFZhO0eO
 vwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=am/paBIRBoe+TlJ53IdaKYgaEqNB1eUlysXKpuKQLNk=;
 b=SCwxVUuYlqwtdVaQsXz+e+UTsB0iytBhispGuAcPhCPnei/K6uYUc8aZtdEhKWDv/0
 W6WlrzEZEy+TydilfSlLmxGn7uk98PZd42guTJFJxcgcG0qRCbaWY5u+vUo22rJI2qcu
 espD2PXV/h+lsXfL0LiSSJn7MP5gVvk9qQK5u7r6vt0B4IoxtIbCRgHRj7w/P3bRqGb2
 ZUxYWybJ3OUC57efpo/P/NlkJT1UwbEvYIz0aCPfwZAcean4hYP1gKltCJ9seM+o9C5x
 TzneI04Iw2G5utZKzhWRyBkvUiKDRj1hlFzaRxl/MyOsvApO8yLc8J8AIj7G3Ni10sYb
 UvDA==
X-Gm-Message-State: AOAM533myxeMlg2hIKwYGf4RGVxeLNgul+VoDZb96BSz461yTPU2VNyO
 DVlKKykMAMqOWba3+n1Is6LvLJ54V3I=
X-Google-Smtp-Source: ABdhPJzFkJSt4zJGUvYGM5u7r3BGcsolIu2PvXSH3uAPyLDlQcexWsaVHAklvW72GugqcO1CQRUbLA==
X-Received: by 2002:a17:902:9a06:: with SMTP id
 v6mr4369543plp.57.1597217157333; 
 Wed, 12 Aug 2020 00:25:57 -0700 (PDT)
Received: from inforce-server-Z9PE-D8-WS.routereb3c90.com ([106.51.138.45])
 by smtp.gmail.com with ESMTPSA id a24sm1336533pfg.113.2020.08.12.00.25.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Aug 2020 00:25:56 -0700 (PDT)
From: Vinay Simha BN <simhavcs@gmail.com>
To: 
Subject: [PATCH] drm/bridge/tc358775: Fixes bus formats read
Date: Wed, 12 Aug 2020 12:55:50 +0530
Message-Id: <1597217150-22911-1-git-send-email-simhavcs@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Vinay Simha BN <simhavcs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- bus formats read from drm_bridge_state.output_bus_cfg.format
  and .atomic_get_input_bus_fmts() instead of connector

Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>

---
 v1:
 * Laurent Pinchart review comments incorporated
   drm_bridge_state.output_bus_cfg.format
   instead of connector
---
 drivers/gpu/drm/bridge/tc358775.c | 76 ++++++++++++++++++++++++++++++---------
 1 file changed, 59 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 7da15cd..5d8714a 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -271,6 +271,13 @@ struct tc_data {
 	struct gpio_desc	*stby_gpio;
 	u8			lvds_link; /* single-link or dual-link */
 	u8			bpc;
+	u32			output_bus_fmt;
+};
+
+static const u32 tc_lvds_out_bus_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
 };
 
 static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
@@ -359,19 +366,6 @@ static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
 			ret, addr);
 }
 
-/* helper function to access bus_formats */
-static struct drm_connector *get_connector(struct drm_encoder *encoder)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_connector *connector;
-
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
-		if (connector->encoder == encoder)
-			return connector;
-
-	return NULL;
-}
-
 static void tc_bridge_enable(struct drm_bridge *bridge)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
@@ -380,7 +374,6 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	u32 val = 0;
 	u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
 	struct drm_display_mode *mode;
-	struct drm_connector *connector = get_connector(bridge->encoder);
 
 	mode = &bridge->encoder->crtc->state->adjusted_mode;
 
@@ -451,14 +444,13 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
 
 	dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
-		connector->display_info.bus_formats[0],
+		tc->output_bus_fmt,
 		tc->bpc);
 	/*
 	 * Default hardware register settings of tc358775 configured
 	 * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format
 	 */
-	if (connector->display_info.bus_formats[0] ==
-		MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
+	if (tc->output_bus_fmt == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
 		/* VESA-24 */
 		d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));
 		d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_R7, LVI_R5, LVI_G0));
@@ -590,6 +582,51 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 	return 0;
 }
 
+static int tc_bridge_atomic_check(struct drm_bridge *bridge,
+				  struct drm_bridge_state *bridge_state,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+
+	tc->output_bus_fmt = bridge_state->output_bus_cfg.format;
+
+	dev_dbg(tc->dev, "output_bus_fmt %04x\n", tc->output_bus_fmt);
+
+	return 0;
+}
+
+static u32 *
+tc_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
+			     struct drm_bridge_state *bridge_state,
+			     struct drm_crtc_state *crtc_state,
+			     struct drm_connector_state *conn_state,
+			     u32 output_fmt,
+			     unsigned int *num_input_fmts)
+{
+	u32 *input_fmts = NULL;
+	int i;
+
+	*num_input_fmts = 0;
+
+	for (i = 0 ; i < ARRAY_SIZE(tc_lvds_out_bus_fmts) ; ++i) {
+		if (output_fmt == tc_lvds_out_bus_fmts[i]) {
+			*num_input_fmts = 1;
+			input_fmts = kcalloc(*num_input_fmts,
+					     sizeof(*input_fmts),
+					     GFP_KERNEL);
+			if (!input_fmts)
+				return NULL;
+
+			input_fmts[0] = output_fmt;
+
+			break;
+		}
+	}
+
+	return input_fmts;
+}
+
 static int tc_bridge_attach(struct drm_bridge *bridge,
 			    enum drm_bridge_attach_flags flags)
 {
@@ -639,6 +676,11 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs tc_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = tc_bridge_get_input_bus_fmts,
+	.atomic_check = tc_bridge_atomic_check,
 	.attach = tc_bridge_attach,
 	.pre_enable = tc_bridge_pre_enable,
 	.enable = tc_bridge_enable,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
