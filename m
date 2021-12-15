Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C16475907
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B5610EC95;
	Wed, 15 Dec 2021 12:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BA410EC81
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 0F7332B0024D;
 Wed, 15 Dec 2021 07:44:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 15 Dec 2021 07:44:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=DG+yeIQKjB6EE
 98K86r/BHe6N6NOBTc1vzSbn/iTDvw=; b=TbxwV+Fz0LGOZV7Tz9YuELev96pcD
 TCKorALV4+ZsPNDsIYkimBT/gd5dmc5ID0mi/kQFc09WUXPpWI1GcN1H9o9dJqZ9
 b9x4Um2+3RK2orcgTxEwsPF9cSn81AkqUTXPLC74sGbSNGDFj7Ahz1T0JRLZ2peZ
 zMoPH6JciwZezpE9g3egvJs5mBpqFzRdiUXBnnGaaE0saRGp2cmtz8smSGtDFtJW
 c/4XCH4bDbdAO0G2JdIgNZZtpGu9KA1NWr9mxJXocHrk0lvoiOBQFuIGxc7NJuC/
 wGWfFrQBOLPhmth5pjdVLQTqUmwreIY3mFmA9zNSip/l+Xd3TLLyoeo8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=DG+yeIQKjB6EE98K86r/BHe6N6NOBTc1vzSbn/iTDvw=; b=iCfSfoYx
 dX8j7iQbwQtwPlgFEfcC7bLpf9wem3ShUzq6D5WEoykW9307N2k5xp+o/7Sa+4s7
 2ZjaXVmE1PJp/qvdkB7/tsixQ5pLAqTl4U76Nnzh18cb4JhW+QK88Yz8f/Occgdq
 GyVxbd3ciHQ8icY2s9+esrGxPCAcrSNX4b60vr0MTtcpS4BbsjkapiItFIZOX5lw
 zaGVwMXrii03+a+2pnwqstwSxY2sPLoVDk+navNhjTS2/a1ZWJKcplKyP9S8BQPG
 +JYOvMGhLqL7eCor3j8hNCe/2SrunKgkWtEjcReh4YVOyaVO/P8FNDdEyVXJMckR
 abMx5h8aU8H15Q==
X-ME-Sender: <xms:J-O5YawblLytiiWW9LjF2UCxzkJhcC3eE1OO0aWFr-JjjPy0apcJAA>
 <xme:J-O5YWRsck5ZPXbmsbUcpnkZgZj1tzb6Fa0VSj2G4LpYAFqSvdR088Ipbfx3cOqkr
 WN2Y09-d-NrMRaOntg>
X-ME-Received: <xmr:J-O5YcVWqs9m-55tQAI8e_xNqpXZvUwtg2CupBb3eCPvyvDmH2atUB1lhjxCLMLi02ufLREaHRemANKQo0dVczv55xT1Nwi6Rjr_-EQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:J-O5YQhc-40jBNn_yfEbVAQOOKnNJQZKHpHFsR_XmIs_1hAOeppG_w>
 <xmx:J-O5YcAjWUwKVFILJ6c9nkh_i2gtFvyLYR6hmhZUf_SBmv9SylW5jg>
 <xmx:J-O5YRJV-Y3OigGHtgLX0q51bdc9T7TGykCePduuuoaE5ofCJVNr9Q>
 <xmx:J-O5YQ4mUNjpUCThV0AKjdshy36UxWUIGqq6dzAwFkcAMeM_H0c73ifroBY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 03/14] drm/vc4: hdmi: Add full range RGB helper
Date: Wed, 15 Dec 2021 13:43:55 +0100
Message-Id: <20211215124406.340180-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215124406.340180-1-maxime@cerno.tech>
References: <20211215124406.340180-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to need to tell whether we want to run with a full or
limited range RGB output in multiple places in the code, so let's create
a helper that will return whether we need with full range or not.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index be39e55ae113..7966e3b00332 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -104,6 +104,15 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
 	return (mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK;
 }
 
+static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
+				       const struct drm_display_mode *mode)
+{
+	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
+
+	return !vc4_encoder->hdmi_monitor ||
+		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
+}
+
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
@@ -1119,8 +1128,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 
 	mutex_lock(&vc4_hdmi->mutex);
 
-	if (vc4_encoder->hdmi_monitor &&
-	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		if (vc4_hdmi->variant->csc_setup)
 			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
 
-- 
2.33.1

