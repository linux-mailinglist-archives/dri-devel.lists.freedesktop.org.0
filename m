Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BCB38E745
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B4F89DFA;
	Mon, 24 May 2021 13:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595B489363
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 13:19:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 01FB441FB;
 Mon, 24 May 2021 09:19:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 24 May 2021 09:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fuDtBAgTxfRRs
 uyiHlaCiOfs3SONm3r054MQGPMRRUY=; b=XxvgFUkz2aWr5l2is4drQF7faLYdr
 w+dS80w6gSL/2Ll5fqL9auUmv7BR70la607qX8Ngz2NZmbcVdwmPjCHEKMbZHUIi
 Rj9ldDb4DZ9VLlvXo8tcEwICHO7awZ3mN/xMrVgGY4sr/bK6UCvuGNn54P0J7O9H
 lXwWpwpj9xj/4gwWiqrPZfeGUH1+bLh2TbUD/rWSGU9tOY8gsc++9V2or/ktVV9m
 bN3n1cNYJTfkHVpuRM+IkthFeslCZ3kfj0TbNqGsxi4uHCDguqP19tlW2JENQ5r9
 cMHgbLQHXKlZzHz4bYrWcQcDkowxkzHBnNGKc/TTayJCOPsjOde+iprbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fuDtBAgTxfRRsuyiHlaCiOfs3SONm3r054MQGPMRRUY=; b=RAB2wBaX
 Qwg/7bHVXxBBs9/SndDvot7NezO38EvTuNqQbzPGKna/9XlBsmXcqvwAg53zFUQs
 evwu/gPmA6Q+NScYCURz0PTNpM8wJGRtf5TNbCGr7jblEncO6GuE+Fuh84e7yXQc
 azDrY4B4vRMi5kG2aTihTEE3ACSzQbFKh56ivyj5N63+w096M17v431PZYV6W5+V
 9PZWfTXXxivBinlV32PHIop5c7oyFzBQJG80B5nHG4qiWLX8r3dD9aAT58p68f90
 g2bIywED44ACDY8QRWiA18IqFvCDBh/y0jQkuEBQET3q6ecTNaEkHB0UMmWCNu34
 BHYCfRI5Zd7QZg==
X-ME-Sender: <xms:xKerYFEsNyclnpGV5lJxsjMUWape7M4WCYOPjr7yrIMt8hl8UjQ2lw>
 <xme:xKerYKXA8KQzAxbQp7uNnFZgyRCLOjQu4RFYKBiWC65NRtyYE3tRRGc-zWsaaqOCE
 IkTk8I6g1f-uVoGxb8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejledgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xKerYHKcEi3gwderZ-kJC-0aJMnjdQ4AQ65vFXc45zaTEyUiuN8QFA>
 <xmx:xKerYLF0dkMKYRJYnVznuscy19XMIh1P7HmQkN587O4SI7loZKDByw>
 <xmx:xKerYLV5tnMfKmJnU9XM1h9bllgQ0w_WlZ5cWfyijRWGD4laTc0x-w>
 <xmx:xKerYIXgrdT9hfmSlwe7fn6AhZE3-N1B3omnUO3CXETtVcXnzEK92P-KYYg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 24 May 2021 09:19:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/2] drm/vc4: hdmi: Convert to gpiod
Date: Mon, 24 May 2021 15:18:52 +0200
Message-Id: <20210524131852.263883-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524131852.263883-1-maxime@cerno.tech>
References: <20210524131852.263883-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans.verkuil@cisco.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new gpiod interface takes care of parsing the GPIO flags and to
return the logical value when accessing an active-low GPIO, so switching
to it simplifies a lot the driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 24 +++++++-----------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +--
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ccc6c8079dc6..34622c59f6a7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -159,10 +159,9 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	bool connected = false;
 
-	if (vc4_hdmi->hpd_gpio) {
-		if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
-		    vc4_hdmi->hpd_active_low)
-			connected = true;
+	if (vc4_hdmi->hpd_gpio &&
+	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
+		connected = true;
 	} else if (drm_probe_ddc(vc4_hdmi->ddc)) {
 		connected = true;
 	} else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
@@ -1993,7 +1992,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_hdmi *vc4_hdmi;
 	struct drm_encoder *encoder;
 	struct device_node *ddc_node;
-	u32 value;
 	int ret;
 
 	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
@@ -2031,18 +2029,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	/* Only use the GPIO HPD pin if present in the DT, otherwise
 	 * we'll use the HDMI core's register.
 	 */
-	if (of_find_property(dev->of_node, "hpd-gpios", &value)) {
-		enum of_gpio_flags hpd_gpio_flags;
-
-		vc4_hdmi->hpd_gpio = of_get_named_gpio_flags(dev->of_node,
-							     "hpd-gpios", 0,
-							     &hpd_gpio_flags);
-		if (vc4_hdmi->hpd_gpio < 0) {
-			ret = vc4_hdmi->hpd_gpio;
-			goto err_put_ddc;
-		}
-
-		vc4_hdmi->hpd_active_low = hpd_gpio_flags & OF_GPIO_ACTIVE_LOW;
+	vc4_hdmi->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
+	if (IS_ERR(vc4_hdmi->hpd_gpio)) {
+		ret = PTR_ERR(vc4_hdmi->hpd_gpio);
+		goto err_put_ddc;
 	}
 
 	vc4_hdmi->disable_wifi_frequencies =
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 060bcaefbeb5..2688a55461d6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -146,8 +146,7 @@ struct vc4_hdmi {
 	/* VC5 Only */
 	void __iomem *rm_regs;
 
-	int hpd_gpio;
-	bool hpd_active_low;
+	struct gpio_desc *hpd_gpio;
 
 	/*
 	 * On some systems (like the RPi4), some modes are in the same
-- 
2.31.1

