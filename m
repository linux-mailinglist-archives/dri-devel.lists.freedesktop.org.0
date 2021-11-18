Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3D945593A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F166EA48;
	Thu, 18 Nov 2021 10:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021676EA3D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 60924580810;
 Thu, 18 Nov 2021 05:38:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 18 Nov 2021 05:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=tayFwsDnUBWMs
 wEb+i/6L3hJodQbULsNzhskj7Czkwo=; b=aRTFrg9C8yAm25gUnI9CvNf25Inla
 mfh0aREMXSEcqJdn1KqCbge/0KZnMoj9UtmBUGUkxY2B+S6TnCGMiqFjl9KTGzsb
 hi5ug4LSjaq106fkn82kKcA53urpn5dghky9e7AqNYwkq1DnM4FPzQptNQxJbesg
 hGyrx+ZQuq8YYdr9ZE8bvPkbqyj5iq69xms4KweII98Ra4G5Sf/pEUjUSy07+HkV
 hRlB3eRxEGyAU1tWj5mtEM/Hr8+2pKzilQ1q1p76dQyVSvjfdPz5Vd2abOdoU1mu
 IlXrtf27eVDOI478JZRMEdWW85TuCl7qSQHw+LirIkJUjfbWKVJdGX2gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=tayFwsDnUBWMswEb+i/6L3hJodQbULsNzhskj7Czkwo=; b=GL9KWAwh
 15dv4GcxgiOoNUAtG5t+tM/tOe6paJOR0RX3wvLJoAT5fpsL2aIHih3SCVaho1QO
 zDPryiKzVnVPPfTZhR1JGK9C7n62jF8zm8q8fzk264Q0SBbrMEzAcFbPuI8eo6AX
 5HNWpdFZfMb5vfILvl4ghXicThZOgs+26lpBTjYza99/Osr0HVJ+RuXJOoUdq3mr
 9soVYcWr38dCLOx2XdFkVPUp7kCM7SwMugpd5BG+zMKqDZUV3XNdSWcab+GjNYp7
 YK8/jOzmZUsGEcCZ/DZxiDJ3FIpbPINJh0ewUye1qiqXbMweuLdnQjdPb3+oEfMN
 zFNmdcF65t+3kQ==
X-ME-Sender: <xms:NS2WYWMs317Pj53lt2k8H9-p_7GjDWkUj8G_FZHB1C4RrzRHbrVMVA>
 <xme:NS2WYU_0IPS_6FRFSUAoMYJElOU9NNNIWsaA0mMCzu3CQf9BYQgaxHfY82c1J292b
 uUsmAjm2TbECFsD3Io>
X-ME-Received: <xmr:NS2WYdRXuz_cXXj2SZmB4CsmYj7spDG1A476jLduVFp-SQ49czn4-0UPzhQ-iQQc3tz35BKBXkYB_6wOTYbevNs_BjIMAlrcAdmQSiT03WQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NS2WYWtJAIimJtKReT-yW6mHp71fKwn51nEQV6PbPbbNA1kuIm2KmQ>
 <xmx:NS2WYeco_d75XWlnVEHjfmZ524McXtLtlpBST6rAJk-v2_shsWvYMg>
 <xmx:NS2WYa2QZOzMRtM5WZr4FfTwBpXBST4GuvGlkhqS1O1gGIlnWZEeoA>
 <xmx:NS2WYe6aNgppQaow_dIEfNNWnJr9B0bGWTRaLTQwKQZrMUWMrZ_EyQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 13/13] drm/vc4: hdmi: Reset link on hotplug
Date: Thu, 18 Nov 2021 11:38:14 +0100
Message-Id: <20211118103814.524670-14-maxime@cerno.tech>
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

Enabling the scrambling on reconnection seems to work so far but breaks
the HDMI2.0 specification and has introduced some issues in the past
with i915.

Let's do a mode set on the connector instead to follow the
specification.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ba939dab35c0..57310756d2cc 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -175,9 +175,8 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 #endif
 
-static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
-
 static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
+				    struct drm_modeset_acquire_ctx *ctx,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
@@ -190,6 +189,10 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	 * .adap_enable, which leads to that funtion being called with
 	 * our mutex held.
 	 *
+	 * A similar situation occurs with
+	 * drm_atomic_helper_connector_hdmi_reset_link() that will call
+	 * into our KMS hooks if the scrambling was enabled.
+	 *
 	 * Concurrency isn't an issue at the moment since we don't share
 	 * any state with any of the other frameworks so we can ignore
 	 * the lock for now.
@@ -210,7 +213,7 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
 	kfree(edid);
 
-	vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
+	drm_atomic_helper_connector_hdmi_reset_link(connector, ctx);
 }
 
 static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
@@ -248,7 +251,7 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 			status = connector_status_connected;
 	}
 
-	vc4_hdmi_handle_hotplug(vc4_hdmi, status);
+	vc4_hdmi_handle_hotplug(vc4_hdmi, ctx, status);
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
 	return status;
-- 
2.33.1

