Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9D248D96C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A10610E119;
	Thu, 13 Jan 2022 14:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF0F10E119
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B6F205807F8;
 Thu, 13 Jan 2022 09:07:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 13 Jan 2022 09:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=BrE13et0eLLCZ
 74ghKagtV2SNp3FTEEFdkcyhyLiayM=; b=lSPz8ZRi14Hy5xt6MLxj7a68WZlg9
 Wwah0iQPhaBddG1rXTFbEZSZkLoac/jwEmWIS4q8x/uxswFF2MGKxBku93XkQm17
 CPT5obagIFnnhduKafZqxWZS8Mo7IZvq/aOl9CkQVuWy2kDW99GzynkTJBpiMI+o
 sEK3sP0e9q+cCOBB22xsKV2AP8ZHW01EVic5dWidTz3KcgWZAoY9JXnBaSPakORD
 OP1TRqFnt3bctzkKB2QeMFYiXK+3aDDoqH//jdpbNcH6MOQraTnUzTxDm7XwH5aC
 wMidat8lCMF1Z8eTPscBFoBedVCfUaNbMmQ3xLwV/LEWIFvTGQh3Dx6QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=BrE13et0eLLCZ74ghKagtV2SNp3FTEEFdkcyhyLiayM=; b=fjWWh0wi
 afNncW1EGsTLUTEOk2ocuQ/je/2yur0iCFaElqUXqQIJnnRBUKz9Kuvs0uhnF0ib
 zgMExgKAGOoRbF0NyKWqcoSNnZDwUnIN19Dzrmq8VfU2WMt6u6G6tq+Wy5X4pGX6
 WsroYBnmSHCnMOFvD29m5xJ3KgHqeSoY7Vb/Xa3HWZAAtDa1Eeh+8P4+evo7tZ4E
 yuHHPzi9ImGqMfks9NAbi2VAuL4u9FvVAl5DUgVYVBi7S8adQh6yTnzFVh37hRuu
 UWws94CHRv20GT2xQVxyrp17DBxW+ORPHjiUXmVFOATnGC3LBcl2YP8l+UioQLMl
 aXbbRxzyqz+H7g==
X-ME-Sender: <xms:KDLgYTw1kdBBYMOFaSp2Mn9OC2GhHGjA5m7y84CzwJ62_QBCDCKpFg>
 <xme:KDLgYbSu7aala3ZkO1VejlceC5T8DvPkoPFabxwO6OJTsR3D8-k8f4lDlTXnY-yS9
 Mbf8mtO7qeugd4rrPw>
X-ME-Received: <xmr:KDLgYdVyebvNbFfal3rSEeSN3bTeMAaZ7d2G4NT4Xwo6aVo6TsmQvE2NMsmiT-VKOVOPC1nEncOrOu9eLTxQJDYHmiH-ejnLhDf9Lho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KDLgYdiuIMdgzw-ZhePAih5s7q2dBnZqPMtxWthIRwANC7Yu0YSSFQ>
 <xmx:KDLgYVBGZOF0FN-LeJtB8GqvwgDKtUuRT0NfvTaOHPWq_gDJMU0QEA>
 <xmx:KDLgYWJshMGfzqKFTUqUBnSTNBoIZhaqz9sO5Mzh_6blF5F_QOr1MQ>
 <xmx:KDLgYZ4MqW8JVEnwR31Asuw6a_RZ_40WKDZj_lvvwB2m1eHQGxWIxw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 05/16] drm/vc4: hdmi: Add full range RGB helper
Date: Thu, 13 Jan 2022 15:07:09 +0100
Message-Id: <20220113140720.1678907-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
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
2.34.1

