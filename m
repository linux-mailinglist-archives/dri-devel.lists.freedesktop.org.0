Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC248443124
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0311172E7B;
	Tue,  2 Nov 2021 15:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E693D72E8B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:00:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4789E58075B;
 Tue,  2 Nov 2021 11:00:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 02 Nov 2021 11:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=VVaT6J17UMAAO
 OozSiyl4DJ48rRfckeD7jzj2M3HwNM=; b=hexCpcgRuyv4oIttNgWoVKmPcU1Zc
 zUQMCuvvszoUEMDJ/FkgKKQIKb7mKO2ruUfgGhG+HrBqrIxK21t2NHLK+h6Oo0ji
 0YLUSQnlOcOOCJkQnE5W/zMqWA5UPqQbNfCMHaGI3jDhvYTiZKuG1mqzra+qAUle
 2oGmeMCybL495XQTtgnfzU4EFleMbVx/w6pCL+zzv6Xgt/PcZ+aD5wYxMTl4MFu7
 xxWGrT6d0jXlK61ExSKyrMWVROkZ/ahoU2GaQEDibYNe5rb5WEuULagDveT/fCvp
 7BCvraEp+715jeRvLWBv64yf/MjuThejx1IQIi6X+4cPvLYVWOb45sB7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=VVaT6J17UMAAOOozSiyl4DJ48rRfckeD7jzj2M3HwNM=; b=JFAjQsZL
 O6dGwIAkZOfJL5FFtqT6NgzbcVkOEtg2ZTZcDOkQubA4DAZHHS/uqz31NYPtR08n
 hlwJYKWwJjp294oU6LqJ5CtUixZZDz5r6LBy5NPI47cAfYd5Sz89gDF8uXIELHSL
 33RLzYGLknWnNvERrWN2rfUDLeRJlVkuZZzjVNYMeVLIakcnm4yyLA+zAVbuT5+c
 GNknM1qutLLqEJEQwCN2oTgVZKMCfIazm5BAi/UVQ3FfuOvJKdjqzLGzjzoBCyNP
 esyiC/utwyN3wgfbEhZZTLZ2r5CWKyoEhJT6Y4yFEZ7mxinb3HPC3h0HP6QxO72U
 j6bdm6UbiMLS5w==
X-ME-Sender: <xms:f1KBYRwv0kGuy63lEKwfxSpKSG6JB_ABSQKowMZCc-tOiWToU1ll9Q>
 <xme:f1KBYRRTl9rFCFUKIgCTRbRvh3sAqYwvr5C-aPOKHvdlYarK0cUIGP_0HSFO1etZg
 -EsAWk0jSNQzeZSruc>
X-ME-Received: <xmr:f1KBYbWv4uzGROy3wYyRskuq9w8GQ0CAV661xlI9L2-cgqsWhMQSGwc1OEbwrmyRIiKGcm-gl0cSAKqMUcfn6qg3Wwod6MSbtTQZnhI6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:f1KBYTjaILxiy_INQVqmt2KLzbBzHIAIL61w9qivIE_lytAjXPBFAA>
 <xmx:f1KBYTD-7pVAzwmrF7axxQs8w663aPhwNSDyNLp_EyJqxYz2VJahag>
 <xmx:f1KBYcL2RwTcaZNrUSzKBZgEBncQAjZcM2B8v8-9cGLxQCen_P1EQA>
 <xmx:f1KBYfv4gAT2BHZYpPT-TlB9BCO6qpCaXODvvtfTynpDhOEWbfCasw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 11:00:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 11/13] drm/vc4: hdmi: Switch to detect_ctx
Date: Tue,  2 Nov 2021 15:59:42 +0100
Message-Id: <20211102145944.259181-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
index 2d7c34b306c9..82878718e5fc 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -201,8 +201,9 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
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
@@ -353,7 +354,6 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
-	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = vc4_hdmi_connector_destroy,
 	.reset = vc4_hdmi_connector_reset,
@@ -362,6 +362,7 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 };
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
+	.detect_ctx = vc4_hdmi_connector_detect_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
 };
-- 
2.32.0

