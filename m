Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83881546226
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A01B11A386;
	Fri, 10 Jun 2022 09:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E213E11A386
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 44F785C0181;
 Fri, 10 Jun 2022 05:29:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853388; x=1654939788; bh=KA
 ZPd6m+Avy8ONd+AxBEcQuBxV6COH+fIHp80L8Be5w=; b=zGeMJPuo+6mhm3Mbqd
 bLAgbDo40bMO1gLbZYIwYF9M7pAd0EL2YRyfziGMK54w/5wQmELl6y0SGTuCXHTv
 4+75zR5WC2pQ5PtgqD2TS9A+r/aRLivPIiPGle5IQQPOOUADVpO27r9AeUT2c/94
 +v2+IS+KhA4AOVkglOKj/n6mggL8K4K//qK7WfhYQJ/WujfhNscJDasBT/SH1joM
 b2poEccZ28J5e8hHltHfGxjXEOYQIqZRKqqbjifRQGOfXXvl2X/2lIBCp7kEclHP
 xecnMCaQldoWfAv64hwFLKechhCIcNfnqM19vvuPsSsG1QX/ZJp/nlyGvg3Ym5F0
 U2MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853388; x=1654939788; bh=KAZPd6m+Avy8O
 Nd+AxBEcQuBxV6COH+fIHp80L8Be5w=; b=ntXj69dGzQK/2awggN9x2vUFpsEwt
 Sjrxyze2S7NcBtPFEG4MteNA3ymajAVnGvcPq+erfE0FGihrJxblfUVPci/QQZK4
 H3SbEVCLNp575LhpNuZ0CuZV4PSaUFbC6fg+whACaws4XZf8yxGQVthMDQ111vPP
 vNFYDCW9yqt+SaXPUqVfDd0kO2wQxQIkj5WerfzM+NdrFK9Uvu+YAhOqaR25pJjg
 gTk7IRX0NVc/n76nM5uGrlCTTB20H5WRwo4BIttloq0rt4BbbMkR7v4ZMSBLjLNq
 lsW3IoldKWhrDvIMOvXxMdn/4Ui3vtNyu68T9vv/5lXf2RGZPLUYuS9VA==
X-ME-Sender: <xms:DA-jYj52uhJOq-Gw7Ua1Zmrdrt2WBY7ujGA2swYFxZYvQ1C-3YOQ-g>
 <xme:DA-jYo4ovowo4NvuFWtpGYwV5L-9NqfaL2yDunkFocRKzCsVVC-4AwypzVgf48dNF
 NrDto-Yzb3g6ZnAC4M>
X-ME-Received: <xmr:DA-jYqcwr0NCyd8qltLISuV-K1bMeK_ROYcxNPYemr9TvSTO2ljBzT1N1zRogjD2Rd1yVahYuBrHppFF7vmfwsiIBl7M1nW3BNaeiQM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DA-jYkItJSj2G4c6--ZEiq6pqNChVglaqz5E3W-l3CwHGmsBetblqw>
 <xmx:DA-jYnJVma-O5ytGffiwIKf_7yJisSlSkv8TJpuLWl9PeLcFUfuu3Q>
 <xmx:DA-jYtxpDKmX4e38mYS9VNJ0T0tUpDQHeSQKs08qz88pLufm2SZGng>
 <xmx:DA-jYkFvmlCWvukTQhwEmtpnSw4OB4DB4QUhj4g1yDmFc8KqXTeVAQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 11/64] drm/bridge: panel: Introduce drmm_of_get_bridge
Date: Fri, 10 Jun 2022 11:28:31 +0200
Message-Id: <20220610092924.754942-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike what can be found for other DRM entities, we don't have a
DRM-managed function equivalent to devm_drm_of_get_bridge().

Let's create it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/panel.c | 35 ++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 07d720aa38c6..0bf824ca1f25 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -425,4 +425,39 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	return bridge;
 }
 EXPORT_SYMBOL(devm_drm_of_get_bridge);
+
+/**
+ * drmm_of_get_bridge - Return next bridge in the chain
+ * @dev: device to tie the bridge lifetime to
+ * @np: device tree node containing encoder output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ *
+ * Given a DT node's port and endpoint number, finds the connected node
+ * and returns the associated bridge if any, or creates and returns a
+ * drm panel bridge instance if a panel is connected.
+ *
+ * Returns a pointer to the bridge if successful, or an error pointer
+ * otherwise.
+ */
+struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
+					  struct device_node *np,
+					  u32 port, u32 endpoint)
+{
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(np, port, endpoint,
+					  &panel, &bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (panel)
+		bridge = drmm_panel_bridge_add(drm, panel);
+
+	return bridge;
+}
+EXPORT_SYMBOL(drmm_of_get_bridge);
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8100a15dd9c2..ddb92e745b2e 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -935,6 +935,8 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
 struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
 					  u32 port, u32 endpoint);
+struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
+					  u32 port, u32 endpoint);
 #else
 static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 							struct device_node *node,
-- 
2.36.1

