Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FD4574802
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862B7A3B49;
	Thu, 14 Jul 2022 09:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCC0A3A90
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:13:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id BE1EC32008C3;
 Thu, 14 Jul 2022 05:13:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 14 Jul 2022 05:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657789990; x=1657876390; bh=fv
 Ry4qD36X0TdyF4QiE5D/qvJKkF4aGu4tpcX1+BpFM=; b=Ffhjpl0Ax4vEziUZLE
 99JmgY0Y4W34Cw4YwD0BiteNWsaqXBKKwcaaeInShJKEsW+PGTQnCyt2zvTs0NYz
 RajvXDdP+cr7j9BBfuzuB+QVaqVfw+GuYVmJSz6VDcPtkJBcyWf/7tsWpmnUObVx
 3T1KarSjZmKI+HZpmSP5o1LszuKl8C3xO2IOCJ2vYJDHt0WKkfs7Uk0RXypKVNLF
 J1AfPT686ZtpHWXhAQw4V0QLLFBWjxzEf6sLKkuVJ1fnypRlaP4fzrgg8ph56Ex2
 TPrQS/13c02Ug9I+EOKCezYuJeGif97zrBsrC/JgrN4Ct4MRry3nlB0XgAZoNr03
 x0vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657789990; x=1657876390; bh=fvRy4qD36X0Td
 yF4QiE5D/qvJKkF4aGu4tpcX1+BpFM=; b=i0mniM0qAZUdiE3Y6cO88BctRcUcv
 rGzgPZYHqYxg/zoD3m7e81kWf6847+AePcGtA5xVnJpfRxqp+UJrmryuhJby+QDr
 0MSPawBfRZfGC1XTjSFw+mX+o6RJEjw2whRvvorlBzeo1pY3ta8ERYHCo6EvXYfw
 mEHm0sC3UIdfjFcg3gb2cTjZP505E0Q9vDzXva+J7e5XZOVBpbolPxm5ypG/dxb+
 qtSOXyZ4E7o7dH+dUUbrU8IN+a0/UDRyjexxm0P2v7gxlaI788gkzEtXA0WpNwZy
 IBlxk1d9aDcMTr01DUfplH7veAH1iJwjJ39uS9Odz/s0NWa5bdagwWj5w==
X-ME-Sender: <xms:Jt7PYqxb_Xw5gYfyvOQFdq0TkPZ6EicIVpxEr0YZQvJVFf9yRpxWuA>
 <xme:Jt7PYmSswsobjFF4PBEF-5ZyOgpgQ0zWAGi9WYSR7jWDJtP4mondlT8csLOvnaVWo
 jnRCbNiH63NFRCbyik>
X-ME-Received: <xmr:Jt7PYsWWVdfswyqq-YKdBL820wJ8Q7a91sP22s-xb1XY-9XiC0j-n9X6HZawKvWY1_QR-HE5FwNhonp4Sk3qK9Qkk0n2hecH9yztY-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Jt7PYgicZa0B9DvjzVFpYBf4h-Kj2ni7a4DTFF4VvJSF9Ii1t8oHKA>
 <xmx:Jt7PYsBjFiLWwrpZKnlivRlkMm0UCxVXuUb1rzHlkQf9PTxNZaj5kA>
 <xmx:Jt7PYhKVDZcDAaq4iKoolgpUtnyqNs_bcfpcpKyHRgvO4UBEDhrnBQ>
 <xmx:Jt7PYsvOuaKBt709dG7d-hgNpq1VS0O7Ayyz-TCCCN598U09AkKBIw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 05:13:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 4/8] drm/vc4: hdmi: Simplify the hotplug handling
Date: Thu, 14 Jul 2022 11:12:48 +0200
Message-Id: <20220714091252.2089015-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714091252.2089015-1-maxime@cerno.tech>
References: <20220714091252.2089015-1-maxime@cerno.tech>
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
index aacc94d593f0..6d84f3b96654 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -227,17 +227,53 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 
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
@@ -248,31 +284,17 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
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
 
 static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
-- 
2.36.1

