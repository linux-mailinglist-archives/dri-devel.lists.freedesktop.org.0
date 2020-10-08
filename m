Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2DA28838D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081576EC56;
	Fri,  9 Oct 2020 07:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC9E6E342
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 11:25:28 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AB0F258030A;
 Thu,  8 Oct 2020 07:25:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 08 Oct 2020 07:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=1uE/y6qWYjWBu
 HT8bbCHWGrd+L+3jtTQYJt5dXItMeM=; b=E5VGXmLLMIIWIj3z8FOiBgBz2uWci
 s8qPbngvzJlpcUu/6Crr8Dg4bBUC0OsE4pUznOuiSP5Ah8fgxBuLbe57WIlU3Lpv
 RRbupP15RB4fbg9dgasiggnAIWVXt8nwVWTms+XgOlPS/zLEd0OtoR9NIpnI50Eb
 9asrR5fsKdlhDORcmNnGPvF8lYIFj/T23DrOzpxWU4tC7kuUAkI0apDSsEl1gabb
 Xmbuq/hi11iv2SjQbqfNuzNSL6WFyfT1HXP3CoM1XoOjeCQPCdD/6LcXwLHb5rXB
 Pt7M1ZSSukhGuz97dHwrciQ4znIni3i287cZ8ktBW3XDcDWkcJC07ViWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=1uE/y6qWYjWBuHT8bbCHWGrd+L+3jtTQYJt5dXItMeM=; b=BmPweSVA
 pl4woEMEkOVHThSqs2v9nR3dgNYGuWBasX9dTYFNdo9qjm8YzPrzJH9KSpwUBRoO
 TBKqWoqxii4IEF/zX0qg1ttGh6JVeY8F2NDgSW9PDUCl58QP6/6+pynj4O8KVf+N
 kkwgnp9c//w5R97Da914F5SfCAr+eTEAU4R2Lfvbk32K6vwG6OUmv8VBXH9mH/Fm
 h8Dc9Gc5L3q8MZk5Y5yomc3lShu7J9pEH6b2O/L2XhL+el/SrvEwslJQ4qyJpuHq
 9ju5otXiGWKpm3vwVSVe/+sfnQqEpaJQLb61S/NIEX8hnfVHxMg6SOpr8YRByyCr
 YhPmdm0XNT8G/A==
X-ME-Sender: <xms:Jfd-X1DRxj-v6gODzD1xQF8HDV8h3mmUYeHVrekiebJCqGAN-LeLDQ>
 <xme:Jfd-Xzgba2WNFL0rqA9OGxwxuPPd9D3OF2zOqi15I6FZZcpNgjHa8zE8mJjibIhkj
 9NCS7ypC91reIeMofU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Jfd-Xwk_DwjjgBM6lTSCZlJ6OKLWyZjaJZObphdZ_EOn5b4EfjUuZg>
 <xmx:Jfd-X_xYT1AAOwIBbV_-94hD3ViWCJAaeD5cjT5_tkMIjnr6XT7_tA>
 <xmx:Jfd-X6QPT0h2GgG0ONcf5a5XB9kIb7NynPrdgdxGSKraviZKUmX78Q>
 <xmx:Jfd-X_hpVZRuVgedkFdJSt9yrv45v0Sin-vb5J-gVJ7VQrrXdbVMcA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C03373280059;
 Thu,  8 Oct 2020 07:25:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 3/4] drm/vc4: kms: Don't disable the muxing of an active CRTC
Date: Thu,  8 Oct 2020 13:25:18 +0200
Message-Id: <20201008112519.43691-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201008112519.43691-1-maxime@cerno.tech>
References: <20201008112519.43691-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current HVS muxing code will consider the CRTCs in a given state to
setup their muxing in the HVS, and disable the other CRTCs muxes.

However, it's valid to only update a single CRTC with a state, and in this
situation we would mux out a CRTC that was enabled but left untouched by
the new state.

Fix this by considering all the CRTCs in the state and the ones with a
state and active.

Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 3b5e62842901..c9dfd5535a7e 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -185,6 +185,23 @@ static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	}
 }
 
+static struct drm_crtc_state *
+drm_atomic_get_new_or_current_crtc_state(struct drm_atomic_state *state,
+					 struct drm_crtc *crtc)
+{
+	struct drm_crtc_state *crtc_state;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (crtc_state)
+		return crtc_state;
+
+	return crtc->state;
+}
+
+#define for_each_new_or_current_crtc_state(__state, crtc, crtc_state)	\
+	list_for_each_entry(crtc, &__state->dev->mode_config.crtc_list, head) \
+		for_each_if(crtc_state = drm_atomic_get_new_or_current_crtc_state(__state, crtc))
+
 static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 				     struct drm_atomic_state *state)
 {
@@ -194,16 +211,16 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	unsigned char dsp3_mux = 3;
 	unsigned char dsp4_mux = 3;
 	unsigned char dsp5_mux = 3;
-	unsigned int i;
 	u32 reg;
 
-	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
-		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
+	for_each_new_or_current_crtc_state(state, crtc, crtc_state) {
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+		struct vc4_crtc_state *vc4_state;
 
 		if (!crtc_state->active)
 			continue;
 
+		vc4_state = to_vc4_crtc_state(crtc_state);
 		switch (vc4_crtc->data->hvs_output) {
 		case 2:
 			dsp2_mux = (vc4_state->assigned_channel == 2) ? 0 : 1;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
