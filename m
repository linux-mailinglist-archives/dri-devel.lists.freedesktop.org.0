Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E55245D0E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E67C6E461;
	Mon, 17 Aug 2020 07:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D33D6E8DA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 15:31:57 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t11so2781493plr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1LEusT9oa0L+q3BIsPrMMq4pG+6qT2ZmHiLBsZn4HGE=;
 b=FGbnnhSH6cfKYN3u4+YOy8mBz3vPAnoWPkXX0A8ALZqSEW7UkJRXmyNT3Rey0B5EbS
 D0wLgqb7vd7CXUxNgq0Ffv3zwFFbcyruuZNss8A+6md3fCyAZr9GZSlC+7l8RBjSuRob
 217twVJaBLKu6evVJ1ntryGbbJJ8TXo5s+kV8DH2bT9biH7dw2KzM9/AbIAlP1QSvjdT
 BVUByhWWjshyUXgIYvJFrWe+Txrf/CRgIzA/xQ06yPcpKSONbhQPEp2KaR5rZRczzZH4
 Fls7ABA+AW/6Y3rB93hLkeL3CIYWEOYQJKz69AqKs6rDabIUtSsg99ZVs1ebenBEgkum
 4sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1LEusT9oa0L+q3BIsPrMMq4pG+6qT2ZmHiLBsZn4HGE=;
 b=AGbTPvaOJh2GYtoJgRe0n+zalttlG691JOurJHd48yPTtm4Niu6Z/FESoGrEoN+5KK
 4SUi0rHaSU09YGmAfccGVXSDP0ALJw2UUdOYHa8DNdH02+keD84hP7MKyikyual38GFh
 Rpjetbopgk4t6kezj5BEEAG4egw9EQK0VNX80Js7Rva1Eio1DUwOOCxa9h9IXT+6DlzM
 NEYUPOZH6eOLD4+BUOPJAFKdno1CF6wbG/y92svkEWq8cuP2XIChXHYh8fCPRgqOeXUa
 fQQuhgfhNhllW51qJLVTsLVUTN/7jVVz+va3VtUYmrehvpa1hE41JipuLwcADPvoOSd7
 htxw==
X-Gm-Message-State: AOAM533cfR1wDhGirGJfCGdlrFUorG9tlkI9BTu18lSuS2SIkqmj5iIW
 DwDuXHTta/DYvnr9gU9Y7lM=
X-Google-Smtp-Source: ABdhPJxQDSrZyCASJdEXe4r1OePxEki+gNmooht0uyTMPChsOUS8l0VZpXPidd7yAIoUVJa9u5yf7w==
X-Received: by 2002:a17:902:40a:: with SMTP id
 10mr4553478ple.260.1597332716468; 
 Thu, 13 Aug 2020 08:31:56 -0700 (PDT)
Received: from inforce-server-Z9PE-D8-WS.routereb3c90.com ([106.51.138.45])
 by smtp.gmail.com with ESMTPSA id s8sm5532689pju.54.2020.08.13.08.31.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Aug 2020 08:31:55 -0700 (PDT)
From: Vinay Simha BN <simhavcs@gmail.com>
To: 
Subject: [PATCH v2] drm/bridge/tc358775: Fixes bus formats read
Date: Thu, 13 Aug 2020 21:01:26 +0530
Message-Id: <1597332687-23938-1-git-send-email-simhavcs@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

- atomic_check removed
- video data input and output formats added
- bus formats read from drm_bridge_state.output_bus_cfg.format
  and .atomic_get_input_bus_fmts() instead of connector

Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>

---
v1:
 * Laurent Pinchart review comments incorporated
   drm_bridge_state.output_bus_cfg.format
   instead of connector
v2:
 * Laurent Pinchart review comments incorporated
   atomic_check removed
   video data input and output formats added
---
 drivers/gpu/drm/bridge/tc358775.c | 75 ++++++++++++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 7da15cd..58f87ec 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -271,6 +271,20 @@ struct tc_data {
 	struct gpio_desc	*stby_gpio;
 	u8			lvds_link; /* single-link or dual-link */
 	u8			bpc;
+	u32			output_bus_fmt;
+};
+
+static const u32 tc_lvds_in_bus_fmts[] = {
+	MEDIA_BUS_FMT_RGB565_1X16,
+	MEDIA_BUS_FMT_RGB666_1X18,
+	MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
+	MEDIA_BUS_FMT_RBG888_1X24,
+};
+
+static const u32 tc_lvds_out_bus_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
 };
 
 static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
@@ -359,19 +373,6 @@ static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
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
@@ -380,7 +381,10 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	u32 val = 0;
 	u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
 	struct drm_display_mode *mode;
-	struct drm_connector *connector = get_connector(bridge->encoder);
+	struct drm_bridge_state *state =
+			drm_priv_to_bridge_state(bridge->base.state);
+
+	tc->output_bus_fmt = state->output_bus_cfg.format;
 
 	mode = &bridge->encoder->crtc->state->adjusted_mode;
 
@@ -451,14 +455,13 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
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
@@ -590,6 +593,40 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 	return 0;
 }
 
+static u32 *
+tc_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
+			     struct drm_bridge_state *bridge_state,
+			     struct drm_crtc_state *crtc_state,
+			     struct drm_connector_state *conn_state,
+			     u32 output_fmt,
+			     unsigned int *num_input_fmts)
+{
+	u32 *input_fmts = NULL;
+	u8 i;
+
+	*num_input_fmts = 0;
+
+	for (i = 0 ; i < ARRAY_SIZE(tc_lvds_out_bus_fmts) ; ++i) {
+		if (output_fmt == tc_lvds_out_bus_fmts[i])
+			break;
+	}
+
+	if (i == ARRAY_SIZE(tc_lvds_out_bus_fmts))
+		return NULL;
+
+	*num_input_fmts = ARRAY_SIZE(tc_lvds_in_bus_fmts);
+
+	input_fmts = kcalloc(*num_input_fmts, ARRAY_SIZE(tc_lvds_in_bus_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
+		input_fmts[i] = tc_lvds_in_bus_fmts[i];
+
+	return input_fmts;
+}
+
 static int tc_bridge_attach(struct drm_bridge *bridge,
 			    enum drm_bridge_attach_flags flags)
 {
@@ -639,6 +676,10 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs tc_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = tc_bridge_get_input_bus_fmts,
 	.attach = tc_bridge_attach,
 	.pre_enable = tc_bridge_pre_enable,
 	.enable = tc_bridge_enable,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
