Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D59C5A4E79
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ED810F2A2;
	Mon, 29 Aug 2022 13:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3352810F299
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:48:10 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C645732008FF;
 Mon, 29 Aug 2022 09:48:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 09:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661780888; x=1661867288; bh=+V
 u0JfFoiGj5Z+L/KY/8aA2OwSfUcDXLZzz5vJutAKE=; b=No6frr9SoWY9ba7zWQ
 9RkuMrt/F3ba4fG4SH7SSuFszlV31jHObvUT6IIGklrJxldrBLFcRiPGMpYfMcQA
 TU2Xf0Fso84Zo2ZbklDQ6txK4PTOZHkxbQtiCfhsY3EgZEbrVxNMCuTen0wDbpau
 YkOOCnudezzEDt0CkOsF2lNFRcQYh8Fp9Ru3sUZD9x3k8tIXD8KFhezCCJUbGEt7
 qbJG4+8R3057MBoMNXJBAE8KW6AAk/ackoV1Qx7yb13+bwr7WRRFV4wkzzfVaFmT
 Limu9EZH+AIAbQWk0sRJX6KHncxTDljLe7/Gnys3u7UiflWPRhvMTzgokOze4xLP
 tcZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661780888; x=1661867288; bh=+Vu0JfFoiGj5Z
 +L/KY/8aA2OwSfUcDXLZzz5vJutAKE=; b=PyhSw9DBQe7/2iWZ6hO/gOKGCY791
 6yfNpZHrSHwTSfAARI9pyusii+S7qxTRQ15U2415X6Toj6h3TmrDa3BK/p4l2Kng
 pXLOUlQsXPh05fk5QEnl92/Gp7tRgExbVbemlXplzTL7bdd25hUhfwCE3tO60xU5
 lKJdmEtc1zuLShwTMof5/jnt43h0fklxJq+w3YYVr4hsVXLbSPt/bSt+434R9D4B
 9G8slOa56p/TcFClz1Md8UrSPgufIQ4gmt5bBJGsPuChmkrmxHPJPGnkUDkrRQNI
 3ctDv1beBC7AeixJBDMyS54gKpNkHvZN4p5pkrlc2AnefRUsV/J+XVyNA==
X-ME-Sender: <xms:mMMMYyCcNaX30cbr69qx6sG0oGIZdSkIpff5sR6DCdhb756wu47McA>
 <xme:mMMMY8hVjnfXrPW4A8S22UD_qAiTXPlL9wpUw4YD3Ct_I8vH2b7thsZcsNiEJYtim
 v6il-rJ4RZyfmVgG3E>
X-ME-Received: <xmr:mMMMY1mObERmr-iSqG51NGCYC-Cvdq3rnL8qvEof2HdM-Ane5Makz8C4-VX7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mMMMYwz-C1cWytKJJXmNHCB9TgMUTz5n4pvcgAPquJJktGCYQi_Sdw>
 <xmx:mMMMY3S3ra3AzLbQJbVWLo02yq2S7iK-ACfkzcG6cbU5z8WHTbJqsw>
 <xmx:mMMMY7bwnz0H-RTVjQS3434Q0uu5ao9oFFANyhtusslG1vRZc6zfwQ>
 <xmx:mMMMY8-5jOwsLAWzdxqV7cgEa3s_YeYl5DE24SIZfaXfWDGHNebLAg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:48:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 5/8] drm/vc4: hdmi: Switch to detect_ctx
Date: Mon, 29 Aug 2022 15:47:28 +0200
Message-Id: <20220829134731.213478-6-maxime@cerno.tech>
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

We'll need the locking context in future patch, so let's convert .detect
to .detect_ctx.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9fad57ebdd11..d385003d7f42 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -309,8 +309,9 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
 }
 
-static enum drm_connector_status
-vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
+static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
+					 struct drm_modeset_acquire_ctx *ctx,
+					 bool force)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	enum drm_connector_status status = connector_status_disconnected;
@@ -452,7 +453,6 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
-	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
@@ -460,6 +460,7 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 };
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
+	.detect_ctx = vc4_hdmi_connector_detect_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
 };
-- 
2.37.1

