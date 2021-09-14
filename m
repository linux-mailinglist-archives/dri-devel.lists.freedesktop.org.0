Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CB840AAFA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 11:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3EB6E457;
	Tue, 14 Sep 2021 09:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366BB6E455
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 09:35:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id C7EF62B012CF;
 Tue, 14 Sep 2021 05:35:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 14 Sep 2021 05:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=KZiZWdvJgbm8A
 O9dULU9dYb4KpiNbFD2SCZXSHEueLQ=; b=ajC70K3lqeOyYZmSGxc4Lt6XcQohF
 vEeMGVa582IsocEEMobTkI3uc8XYsxtH4wOHznN+SZeFDn/T9H3NH7vUc3tnOQln
 9StAP8PkUcMgJ9MKX5hPwBvaBx1EeIdae/9sg1zisOvutrqJ5D9eWhivq/Q/9+qj
 ZnA9KOEJoPldXjEITevNfz3t2pQaWwp+Y+3+qDqPqtJa2borAKPw+RtmjxwrG5ET
 aiPDbhsFEsYRaAPERU68NiBhYlI8ZkGq8BO679I7nGzTSEyymW2a45lm/bBLNIQx
 s7R4TEScqxATE3xecZ/MgMCy37cy1clEJKc7qo2TUW0gnRKOENs7PWVzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=KZiZWdvJgbm8AO9dULU9dYb4KpiNbFD2SCZXSHEueLQ=; b=Riu3p86K
 KWS3saB5R0tzxx+3YXDroSZYqfXkHITrlTH4CLHxt+wFndfqFJe5r8w/UPmiyYI1
 26vvnpSm1rysNhL0esg4EALs0xfMLj7FqhY/yHGkQiSCfNEzAoM7rpDYAgsQt7JM
 52U68i75oG124puVtSof+dR68oIOwHKHoDPQ1XIvtyHN+PLaLGzv73HIwAoohK4m
 p2rW8WW1XD0QcfPOV3Bx9CVK3AbTK9EVGe2iSxn37MTgEoDDcnvMMKTM5hlCvM7G
 eBe4pTjBCysPQeykOcfX01+nOtdfeDyKw/VDs5yLmmGZilBdxOw3pWN0o5lBjk7g
 tGk/ePK+XKK5Ig==
X-ME-Sender: <xms:4mxAYeoEoX8ftxADMukZawuupQUOb8Ruityvyx9NJleXOS0VUwO_wQ>
 <xme:4mxAYcpvp73chl79V2EUKbbXQeA0SPuZ-NmuqwqE1cuMyX7UtehoxQZTzS0NaTF88
 oAtnFaHNWtzjeNL7Vk>
X-ME-Received: <xmr:4mxAYTNtUmCyM5MDgcOSpZehkdRyIcFmrT8y2csXfOKcVENjI0U4P-HxPt48h5A0hg9bv-6SbnkW3uqtkQl4a3fOBZpOKe6UqZix>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4mxAYd68GztJGyZDn412B-rtsxy_7qrKkGkJ9rCKrwkuKx9-SqauuQ>
 <xmx:4mxAYd6iavMZuXWCEYJIoJ6YS5bFMB6VeytozvEmB-3PQ896J1KAgA>
 <xmx:4mxAYdhoSZx0FsX9geo33a_YXjpjArIc6_zdDTriHtXCoS1Xq5NZww>
 <xmx:4mxAYRrnpdEEynnxTJ3fmIk_WxAgJT3NDKhmP35PhagtIb4XTXm019f9Ta4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 05:35:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Dom Cobley <popcornmix@gmail.com>
Subject: [PATCH v2 3/3] drm/vc4: hvs: Convert to the new clock request API
Date: Tue, 14 Sep 2021 11:35:15 +0200
Message-Id: <20210914093515.260031-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914093515.260031-1-maxime@cerno.tech>
References: <20210914093515.260031-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

The new clock request API allows us to increase the rate of the
core clock as required during mode set while decreasing it when
we're done, resulting in a better power-efficiency.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index f0b3e4cf5bce..3550ae9f782e 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -341,6 +341,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
 	struct vc4_hvs_state *old_hvs_state;
+	struct clk_request *core_req;
 	int i;
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
@@ -354,7 +355,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	}
 
 	if (vc4->hvs->hvs5)
-		clk_set_min_rate(hvs->core_clk, 500000000);
+		core_req = clk_request_start(hvs->core_clk, 500000000);
 
 	old_hvs_state = vc4_hvs_get_old_global_state(state);
 	if (!old_hvs_state)
@@ -399,7 +400,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	drm_atomic_helper_cleanup_planes(dev, state);
 
 	if (vc4->hvs->hvs5)
-		clk_set_min_rate(hvs->core_clk, 0);
+		clk_request_done(core_req);
 }
 
 static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
-- 
2.31.1

