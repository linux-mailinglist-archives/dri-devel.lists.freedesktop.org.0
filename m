Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D17455937
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE6C6EA3E;
	Thu, 18 Nov 2021 10:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8886EA25
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 67316580810;
 Thu, 18 Nov 2021 05:38:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 18 Nov 2021 05:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=le/ByS7UPkg9l
 0Ii8ZgIqgYSqrbDHL3uhANHzR7HfXo=; b=bg5OQaTSbNktgegnjkTCY3Ew/fVE4
 OrsU8Hl35HEMPqsP55Z5ChxzhBpFNkrcgynw5JFT6BTJAYSqOUIzNkBta0kQrBSo
 q1vdytcm4kxSOf+idPTNXpWt36NurEIgP/swb3/UzY5ZIQdONZfMfi1QthZe99aH
 3o487zfrEQi4QzN08cFmqfhMBQyvyZKMaO3OCDldJ/hLJXzAF2WX9O+EzUfvau+t
 QF7A8fUXvHmSv8Azkhkru/MwVMx9Lb96brK438te99jKm7SyzxRVMt8vtxwligOy
 QqlTp2jkpSRsDN8ICi/gjzdHAcmC2WMwZinn7+rZGiScfRL0ekVCD08Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=le/ByS7UPkg9l0Ii8ZgIqgYSqrbDHL3uhANHzR7HfXo=; b=e+B84iHr
 HHT7pZM2a5oUAuY8I2NOgHuadKHFG1MFSLevNKGq3O83bqiet+OSZvoyukwHcOvJ
 L9Dmm6pjm2IkHOdQPYJZOWb0I1g/ikXv0cluZT2kih15gr03x/yG++VvA6T/X5gr
 P3JHa45JtSCbJCrfwHu/2WH+A3caM8A98jye8hXKCMzf3Y2WZfE7p9nORj4pNSxV
 oJ7nqSzJD9bLUsnXLM9BDHSd765iJavYAwc2Bj9X6C5a3JhQ5qnSvKuMJM/kJmOB
 8joIoy1kj9j4RnPq3e3GJYM9Yh/3dT94JTICup0jwQXwIrzELO2fre3pO6Favd57
 XOq5uqyaWwtQOg==
X-ME-Sender: <xms:MS2WYX2vHkyP8Bn7_3eAuF88WH_F1ODro3ehVa1CAQr5osV5okuCXg>
 <xme:MS2WYWEi7W9DkGI0C-jYfGLs6Meh-3stHRyKA7dIP6GvNh78OE8kBD3tZdd1h5l2y
 1dPxGOD3YI33-pDXJE>
X-ME-Received: <xmr:MS2WYX4hp3t-Kpnqf6C9LkG79InZkEcNm3Nxp6_mX12hq7E4KSLEFFCqABF36Jj64iyvUgRKiO7d-7OmoXQzIplaYjxAQsqRjpihk3sWXBU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MS2WYc3iSzeuU6-8Z7jB3pe9aD24nUOJ0eq17LrjyUF2no0ohcMOlw>
 <xmx:MS2WYaGDU9CGDXR6tklNKsbfJqrGAuWoAQ4LX6tfvk6lvX1tzwE1sQ>
 <xmx:MS2WYd9NJDMj_l_8ZN1eRyDzFsHVh4wwQTkqaZtAcfYjfphEijzDpw>
 <xmx:MS2WYdBQA2TTGYiQM4d7Mi6JX-sZt4mxv0jwS3VedBwdrKxreX5ipg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:40 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 11/13] drm/vc4: hdmi: Switch to detect_ctx
Date: Thu, 18 Nov 2021 11:38:12 +0100
Message-Id: <20211118103814.524670-12-maxime@cerno.tech>
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

We'll need the locking context in future patch, so let's convert .detect
to .detect_ctx.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index db647c01dc0a..5858058165a2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -218,8 +218,9 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
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
@@ -370,7 +371,6 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
-	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = vc4_hdmi_connector_destroy,
 	.reset = vc4_hdmi_connector_reset,
@@ -379,6 +379,7 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 };
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
+	.detect_ctx = vc4_hdmi_connector_detect_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
 };
-- 
2.33.1

