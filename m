Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A0D33F422
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA0E6E828;
	Wed, 17 Mar 2021 15:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE256E828
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:23 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 53836580A4F;
 Wed, 17 Mar 2021 11:44:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 17 Mar 2021 11:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=22VBMYiRqaWaZ
 YYbr0aF8h4xBWeIQHqDpJAREftxzUM=; b=LA7QHyMg4xl3ThuZNNh4/s2RbXBXU
 NyAJ90vqy1mJDTBSaC1oKpqIWjLXRqRno4XyOr3sehxgvSD3DpPYGO9zrjUpSWoa
 DHqQFvRbbit/ZXw+7s/AM/FEiSgbcppp05v5dRdPmW3BbGwZh4jUPifM8z3y5DoJ
 PrRnH+mDQ2KMYUG+Uz810dRdcgQevqcKeZ27OihJsYfB3cNrpEa3S4hLheGeRkDC
 FdKQqek4NezZtTCeML4uZQM5lh/bdWzH8PUJKIVVx2auc3I2VtM1IleB+67lH6Wk
 bRn4z/w/eh/gByS3ADcrfR+GHzD4SgxebxHR1RVDhewMf0ALRujHN4PdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=22VBMYiRqaWaZYYbr0aF8h4xBWeIQHqDpJAREftxzUM=; b=jsWpQD7G
 iwRB5i7GvoLR1ifDa9GuCmYX/DORfKythrVkPdOI3w9AYpTAn3NKyxDDC2+eBBZF
 k3FpVe1TYtla7lEvRZJzSgL7LatIAa6dj0tQ/GlTQgIwx0cM0SPTFh7fW/nmC54M
 bcojTxTinFYsE5eloz0nAdhjNDOl2Uccx69FY8/wJtWy1INLbkWo93aOMnfu77BK
 8KcxZ/1psKxzcvlfrcP49LkF7JtfzrKEAmPAAuKUuWgcmUljbu0j6qraize0BGgL
 14ZypURvc7QIL07CkqNw7UKtcjGJmznYzYhKjwSRkY2zuEEb26v/9oJmq+WxWGDu
 bwbLEgWnpOFroA==
X-ME-Sender: <xms:1yNSYOqbf67x3koIXSDKRatoUm42IsPsh3Y346YyqTQpDYT4iL80DQ>
 <xme:1yNSYHWTA29n3t7Iq9vpJL2bqF9spevGf90G37msfsUPpF8MBeb6sP93uXNHA42ca
 rIBnlgFBBQ8_L2hfG4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1yNSYHNpp4JXCzCr2geDIcbfZhodmzgztK9xFuWJURxnS2jZlIUT9Q>
 <xmx:1yNSYOmDpTYqInUTweLjS6NSAKUVicvDBf4toixUnqQTmuHh-LvBXA>
 <xmx:1yNSYMrl6EX9-xXIRR1QxQdWkINx0hh6hSt7-0mkd_0q1J39SvIk2w>
 <xmx:1yNSYN6VBWWlEUvZDqfgQYsa2ZZQFwTk_Mz8f6tczg3t7K4MjeMKAQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 15997240069;
 Wed, 17 Mar 2021 11:44:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 17/18] drm/vc4: hdmi: Move the pixel rate calculation to a
 helper
Date: Wed, 17 Mar 2021 16:43:51 +0100
Message-Id: <20210317154352.732095-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to implement a fallback mechanism to YUV422 when the pixel rate
is too high, let's move the pixel rate computation to a function of its
own that will be shared across two functions.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 36 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 407b468dab67..c4f91d39d91c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -991,22 +991,16 @@ static void vc4_hdmi_bridge_post_crtc_enable(struct drm_bridge *bridge,
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
-static int vc4_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
-					struct drm_bridge_state *bridge_state,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
+static unsigned long vc4_hdmi_calc_pixel_rate(struct drm_bridge *bridge,
+					      struct drm_bridge_state *bridge_state,
+					      struct drm_crtc_state *crtc_state,
+					      struct drm_connector_state *conn_state)
 {
-	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	struct vc4_hdmi *vc4_hdmi = bridge_to_vc4_hdmi(bridge);
 	unsigned long long pixel_rate = mode->clock * 1000;
+	struct vc4_hdmi *vc4_hdmi = bridge_to_vc4_hdmi(bridge);
 	unsigned long long tmds_rate;
 
-	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
-	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
-	     (mode->hsync_end % 2) || (mode->htotal % 2)))
-		return -EINVAL;
-
 	/*
 	 * The 1440p@60 pixel rate is in the same range than the first
 	 * WiFi channel (between 2.4GHz and 2.422GHz with 22MHz
@@ -1032,6 +1026,26 @@ static int vc4_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		pixel_rate = pixel_rate * 2;
 
+	return pixel_rate;
+}
+
+static int vc4_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct vc4_hdmi *vc4_hdmi = bridge_to_vc4_hdmi(bridge);
+	struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(conn_state);
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	unsigned long long pixel_rate;
+
+	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
+	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
+	     (mode->hsync_end % 2) || (mode->htotal % 2)))
+		return -EINVAL;
+
+	pixel_rate = vc4_hdmi_calc_pixel_rate(bridge, bridge_state, crtc_state, conn_state);
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
