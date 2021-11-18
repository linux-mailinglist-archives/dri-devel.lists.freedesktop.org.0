Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEBA45593C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0026EA47;
	Thu, 18 Nov 2021 10:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6476EA25
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 59B98580912;
 Thu, 18 Nov 2021 05:38:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 18 Nov 2021 05:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jHyA8Y5c5G7NG
 1srcuRrrPWlcMapfuRgZ8TVI5U1sjQ=; b=ZdWhygQ5BQUHbtj1LPHKecJwKLMkd
 WtOjevV9hxJFAsR3h0ScKnSEQcx3x8xeP7rATRgfOZ90BNOzc/n2hhVrpoe5Qqff
 2aL+7VYjv4MphXXtShcPRb8iZVizvhEeW8puiVDiH/AvDWa2pfaY9R2mEvojArMW
 +FCVZh+N2VrHzB7zokh22hc0k9c5XgIl2J0FNS9UmR2wjup/Zb/3X0fAdEo/tinX
 CTJbs/j4WYFdhB6oFX/VoCLpFMhBXXhNUg0pLaq6s3zCnwt2LVzP7ywY6E2graEy
 4i96JCG93S8nPII6JtkpMriwBfS979dyemcZDE586sVx+8J9BbRZ0AQQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=jHyA8Y5c5G7NG1srcuRrrPWlcMapfuRgZ8TVI5U1sjQ=; b=meGlrfBd
 Hs9QIYnt/kfo6C60AM40+rk0tSRan65zkLahfnLNsvN6B5HpkUba2Dp/b63FSeRK
 PH8/qzx2KbbmXHQfOflDJZFHaDA+/T4QRqCtMbgr8uN/ouqUR9SJ3P7LDNY3M4GC
 GfKbhU4xiEhpxOrzjVdHa2FoHtBeKo5zUSZuWEG2G7oFktbIlibUPTsv7LtxtGLM
 0njbYWvm8/amkdrIxT7bmRRj302IAZWEnhR4pqHSt/ZsyTL2uJLzI5DPSDYWu7eQ
 T+VUxKNO9i4SH0C5uJpSt6bmfrN2w53eF7ZPCQq+gNdGojnFv+CwKxW24kMnAS4U
 fElbW/8YMvupTg==
X-ME-Sender: <xms:LS2WYfckeMJEoNRpvVY4M_0wY3PFsnKlNuD2R8m58v7nN9o25MdsOg>
 <xme:LS2WYVPDB0zjxVt1BdrFLnRbdsW91gzFH2oeQKpZty9pVhC7NbPeNxc7vQjvdCBnZ
 6tjR36lP29XeaLbKDA>
X-ME-Received: <xmr:LS2WYYgUr1q1RbnMoKEFZ2Rt178VZZvymGGhln_VJQ_EIsvfB-zDcm2Grh8ZhEVFu0mSG6AIcx5w3dtaroiiXxi2UncdBPMUco0hZ6lFOfk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LS2WYQ9aQQthwDw3VUm-Hh3FEKTmrGApzHGQ0CKvQm5I4XZQ3DMdrA>
 <xmx:LS2WYbuW1MUN7lQCw3dXRishwhBhSyFbJGEf_-vCv07M0dbqU1fDvQ>
 <xmx:LS2WYfHLOtp2pIv1VhGdZydKyUeZnZor5iVPHNKWaLC4sBbI_FL40g>
 <xmx:LS2WYZIcLep-bpGI7uRO-_VxUCCe8MUXfokN9RgNPH0YvxbhOMyIcg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 09/13] drm/vc4: hdmi: Simplify the hotplug handling
Date: Thu, 18 Nov 2021 11:38:10 +0100
Message-Id: <20211118103814.524670-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
References: <20211118103814.524670-1-maxime@cerno.tech>
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
index 98f15b11f135..7f44ef08f83a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -182,17 +182,53 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 
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
@@ -203,7 +239,7 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 	if (vc4_hdmi->hpd_gpio) {
 		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
-			connected = true;
+			status = connector_status_connected;
 	} else {
 		unsigned long flags;
 		u32 hotplug;
@@ -213,27 +249,13 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
 		if (hotplug & VC4_HDMI_HOTPLUG_CONNECTED)
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
-		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
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
2.33.1

