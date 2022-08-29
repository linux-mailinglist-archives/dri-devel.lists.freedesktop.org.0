Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A075A4E77
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893AD10F29A;
	Mon, 29 Aug 2022 13:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AF510F291
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:48:05 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6C2913200645;
 Mon, 29 Aug 2022 09:48:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 29 Aug 2022 09:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661780883; x=1661867283; bh=I2
 b3Wjoi+fjtr1qsrkUB1/vE+ZYD2/aTPMqsMdAzbSQ=; b=E4poHCoFHJ7V47VFcG
 SPr2asEP273HePApTupwZjJuNSFHjMio1LCV0gifrYQpPodS7bhFKPr9jjOl/a0g
 wMZFYU6VddGKCYBIIyxFdAbxotn7QDsiWRNqpD4O10REko7AuHvHFdK/6WE50Tse
 sDoSfBOXroxKzCXxTFhkJEOguLfe7OaYWY1luMBDt7pTsjPSpc4o6+q1Li+/Pru1
 kZHzBOE8ENDjqbIqcXDcRzP3gxpXEeWP2WJLlSD+D9GuZYxHIT76UrLCK2I7GaQV
 T4hyNqY5qQpDUj6QlPXf16mh3mMlCUEfzNwvefD7xGczxQxlw775mWgNnAvK9Gw/
 bQ8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661780883; x=1661867283; bh=I2b3Wjoi+fjtr
 1qsrkUB1/vE+ZYD2/aTPMqsMdAzbSQ=; b=dJpYieWSSXC0xQ6CjTRu+bCeYCvuI
 nKcOd6e7jhOE/QbZ6svk9aUs4aYu3lJyDz7VATvkkA3yTSB1S1Q+hRKDXSdxF+6Y
 ER1S3pPnkiuMC+cXcAPPXt1bGh22eqPnFuRHTDMAqU0t5YdFH4VkbzutYl3Zml3L
 TjXni3/wLhGwEgHs2rk3Ggb7eepk5LbdVlqUzi324QYJDUrW0u7vZSNjqXgfn/Qj
 6P+dCSf7Q+Qkfobdm/Mmux/xBbe4w0KIEq5pnzbxMQy4SOiCEoFfblvjodCA7jJL
 v227EAP/FHHtLP5+5EbmuTTed9Yvgf2UYs52PXj6R9ROpaYBF/4es2kxg==
X-ME-Sender: <xms:k8MMY_2WkhRQb_IZzQCv8VT8CqJmNXwmR_eB1IoDK92YtH3C3qk6ww>
 <xme:k8MMY-GzQ1VJmHuv7KC6o4QlI_LnzxFxCCJxSYAAqNDHJOXfg6hZVkxcbViW_H3ew
 a0KKT8aP9OIXwi1xQo>
X-ME-Received: <xmr:k8MMY_4UPApmjRz2TUMI4rxxp6Qosy6Z9VKgnDu_lNovrH5BUJ9Y19KOh9qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:k8MMY02QfDmYpFuAqhe6v8fMzgPYJPqVNJnWarLgCJDtOx3VK3KLww>
 <xmx:k8MMYyFj7mw8bRw0w0OWwDupyeKnHQEbiOWU7Oi1iUKrzTiKDCZs-Q>
 <xmx:k8MMY1934g_YnYihwXb93Hr_xGYtuU8yRbQIUwshYKTbJ0qBVeoDGw>
 <xmx:k8MMY1BeuvGwLsgVBTWpn52P2KNrFd82cct4OX1uSNORWv0LDQhaig>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:48:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 4/8] drm/vc4: hdmi: Simplify the hotplug handling
Date: Mon, 29 Aug 2022 15:47:27 +0200
Message-Id: <20220829134731.213478-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220829134731.213478-1-maxime@cerno.tech>
References: <20220829134731.213478-1-maxime@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our detect callback has a bunch of operations to perform depending on
the current and last status of the connector, such a setting the CEC
physical address or enabling the scrambling again.

This is currently dealt with a bunch of if / else statetements that make
it fairly difficult to read and extend.

Let's move all that logic to a function of its own.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 66 ++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b786645eaeb7..9fad57ebdd11 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -273,17 +273,53 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
 
+static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
+				    enum drm_connector_status status)
+{
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct edid *edid;
+
+	/*
+	 * NOTE: This function should really be called with
+	 * vc4_hdmi->mutex held, but doing so results in reentrancy
+	 * issues since cec_s_phys_addr_from_edid might call
+	 * .adap_enable, which leads to that funtion being called with
+	 * our mutex held.
+	 *
+	 * Concurrency isn't an issue at the moment since we don't share
+	 * any state with any of the other frameworks so we can ignore
+	 * the lock for now.
+	 */
+
+	if (status == connector->status)
+		return;
+
+	if (status == connector_status_disconnected) {
+		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
+		return;
+	}
+
+	edid = drm_get_edid(connector, vc4_hdmi->ddc);
+	if (!edid)
+		return;
+
+	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
+	kfree(edid);
+
+	vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
+}
+
 static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
-	bool connected = false;
+	enum drm_connector_status status = connector_status_disconnected;
 
 	/*
 	 * NOTE: This function should really take vc4_hdmi->mutex, but
 	 * doing so results in reentrancy issues since
-	 * cec_s_phys_addr_from_edid might call .adap_enable, which
-	 * leads to that funtion being called with our mutex held.
+	 * vc4_hdmi_handle_hotplug() can call into other functions that
+	 * would take the mutex while it's held here.
 	 *
 	 * Concurrency isn't an issue at the moment since we don't share
 	 * any state with any of the other frameworks so we can ignore
@@ -294,31 +330,17 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 	if (vc4_hdmi->hpd_gpio) {
 		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
-			connected = true;
+			status = connector_status_connected;
 	} else {
 		if (vc4_hdmi->variant->hp_detect &&
 		    vc4_hdmi->variant->hp_detect(vc4_hdmi))
-			connected = true;
+			status = connector_status_connected;
 	}
 
-	if (connected) {
-		if (connector->status != connector_status_connected) {
-			struct edid *edid = drm_get_edid(connector, vc4_hdmi->ddc);
-
-			if (edid) {
-				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-				kfree(edid);
-			}
-		}
-
-		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base);
-		pm_runtime_put(&vc4_hdmi->pdev->dev);
-		return connector_status_connected;
-	}
-
-	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
+	vc4_hdmi_handle_hotplug(vc4_hdmi, status);
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
-	return connector_status_disconnected;
+
+	return status;
 }
 
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
-- 
2.37.1

