Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B36F5485DE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FD310E84D;
	Mon, 13 Jun 2022 14:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242FE10E861
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:43 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D422B3200931;
 Mon, 13 Jun 2022 10:49:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 13 Jun 2022 10:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131781; x=1655218181; bh=8F
 6zTrhXZO9CMnNQKkBNlR+lmxnGJcDI+0cIyYYVWvM=; b=wecFjtyDBm1uYgrXvr
 ed47myV8TVVIVsDqYyqNQLYRagRE93Med8/F5XqMuaKXtIEKkQcFpTcUdh3fSh3U
 pd+JpwXSrm5ydET2WhNVewFbt/b7obYFuV/wwkj/b15Tq14rAyQqC+t4bqcEXwcU
 LHBjk0PjZO8/h0Fzccyhzl4t2Cho6ODQXuf9h0PoRwWVa9lQKm23Q1sNGvGfgL8M
 UUvQOhwXt9RoBav5BxxxElIACqZEJYVFdWjbD2f1olxRly27lITjCBHPBLRN4+mV
 xfBoc2xyTViHgY/2HXcPtseO6DbtjQpZLZQBQKiv6VjaOSxht9QmDtj2XN+0PFAT
 DpkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131781; x=1655218181; bh=8F6zTrhXZO9CM
 nNQKkBNlR+lmxnGJcDI+0cIyYYVWvM=; b=WqABCgl49fHJEw39eT8mXVbpRy5Vy
 hzezSpFahcW6eM7CwmaWDMkV2BHgDQ4O29jno1N4yo3/VzadMvuflXrZft3Tz9PG
 dlnzsvpnnihMvCJLhYUc6YHct1FYQtiCb+wazJrXp20nmAAvRXh7yCDncyynas7j
 wKIZ3TkLugelX300hJHZ/gGJW6MpYayhS33eSRnjslzbFblWTHeSDPzWRov1uMKg
 CUbdc0mNIZ1YBiBSbnIzvLUULWBMHRALhQpdNu5suSMQunv6MMLuNVmjAQwraFjv
 1RVydACJvGpk2fxThy7FXdJlmKP0sktdPZnr2TRl597EP6GuroKexKIyg==
X-ME-Sender: <xms:hU6nYpeGQ6-4nU1RFDVYnXJxn2SaZNz22hcqyeo16tcS1nn0OPZ2CA>
 <xme:hU6nYnMU1pfXtejywVNXOuzP5CYhJt9TJ0YPvgJt-uSBI7Anop69WBjb0fsJp7TpQ
 f1Kq8oiOp8Yh1MdQbk>
X-ME-Received: <xmr:hU6nYihf6ocb20K-lmZUiAZ7IaKYWmQ2jwt4DGQtqxSuOma0bpxCfnHGHAMQuhZydLpufs1HO9PWo9SEx74gXQV2iExa6zcwp-NXmQk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hU6nYi_gCx4R1raK3f1vRtjFJw3_VB5RLezNz5QRly83oIEGqaBRIw>
 <xmx:hU6nYltyECAE6_j-vuth3eOIB-spmOl36wDxT95mWqETTEvrdwHiRQ>
 <xmx:hU6nYhEPiURYCQxgUmnJStGPR7jjaG7RJZ7Z7wwOp7QjtCVSdReasA>
 <xmx:hU6nYjWKS7JxOru9IC9WPOqheCPwonjS9UczqLkfHs5vaC7BV0A0Dg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 31/33] drm/vc4: hdmi: Force modeset when bpc or format changes
Date: Mon, 13 Jun 2022 16:47:58 +0200
Message-Id: <20220613144800.326124-32-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

Whenever the maximum BPC is changed, vc4_hdmi_encoder_compute_config()
might pick up a different BPC or format depending on the display
capabilities.

That change will have a number of side effects, including the clock
rates and whether the scrambling is enabled.

However, only drm_crtc_state.connectors_changed will be set to true,
since that properly only affects the connector.

This means that while drm_atomic_crtc_needs_modeset() will return true,
and thus drm_atomic_helper_commit_modeset_enables() will call our
encoder atomic_enable() hook, mode_changed will be false.

So crtc_set_mode() will not call our encoder .atomic_mode_set() hook. We
use this hook in vc4 to set the vc4_hdmi_connector_state.output_bpc (and
output_format), and will then reuse the value in .atomic_enable() to select
whether or not scrambling should be enabled.

However, since our clock rate is pre-computed during .atomic_check(), we
end up with the clocks properly configured, but the scrambling disabled,
leading to a blank screen.

Let's set mode_changed to true in our HDMI driver to force the update of
output_bpc, and thus prevent the issue entirely.

Fixes: ba8c0faebbb0 ("drm/vc4: hdmi: Enable 10/12 bpc output")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 305807791ebd..03fa2d4c1827 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1604,9 +1604,14 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector_state *old_conn_state =
+		drm_atomic_get_old_connector_state(conn_state->state, connector);
+	struct vc4_hdmi_connector_state *old_vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(old_conn_state);
 	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long tmds_char_rate = mode->clock * 1000;
 	unsigned long long tmds_bit_rate;
 	int ret;
@@ -1635,6 +1640,11 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (ret)
 		return ret;
 
+	/* vc4_hdmi_encoder_compute_config may have changed output_bpc and/or output_format */
+	if (vc4_state->output_bpc != old_vc4_state->output_bpc ||
+	    vc4_state->output_format != old_vc4_state->output_format)
+		crtc_state->mode_changed = true;
+
 	return 0;
 }
 
-- 
2.36.1

