Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F411475909
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0EE10ECA7;
	Wed, 15 Dec 2021 12:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E70910ECA6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:33 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 9B92E2B0024D;
 Wed, 15 Dec 2021 07:44:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 15 Dec 2021 07:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=iEaYipaLpMgI1
 Lv30r4jyymNFm1hIDTRXVDWp47IyrA=; b=BDnjd5ZmSoAGax0eqEufEVxzOhMRq
 fPQMsXha7jJoEX3adKblSD/b8DKwQCnhWpOSFYyZXK3loFRzH3JF6Oby6IMXE2y8
 FAdN6dIYgnoUkpWj330dzXsAqyTqkXvvvbb5iPOCTFWSk+0iGhSLmZEO4gw3yQ7v
 RyfQnUJm3qbYILvWPWW2XCahXa3JFVt/wVsluHIdobe+mwS8bXQxJaeGbhjNjlM5
 TylkC3ZT9dF1HEkfXMiP+N757Fgt2QiWEx6gmXYWcGdpv4X3o2kGsnURdloPfhAg
 Nohce4Rxu07577gmxTbYpIEtsSeAKqKvd3Y28gMWF6nvctGqy1ck2ujTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=iEaYipaLpMgI1Lv30r4jyymNFm1hIDTRXVDWp47IyrA=; b=LHngsBwy
 NksOhUzuYvTR2S1hE+Oph2ntdst38HzUm9+Zj/095WdNDn36vvfssYZyjweDp+sf
 Gz66xu34/rNuka95tGficN53xL64LI70tLQ5tWRA5LsYUMVJ+CorGtiqAF1uvO5n
 Fc6djSBcFZkjO1vYNUpc1KyfwnO98reIw9A+Hk8TgME2ipEnV690KdK2olmFxwhS
 i80xaZzzXyf+exyD6L845MxOpSJ09pPc1CJIiUDS2djCOW+H1F5SsgL4tFj0Qkr2
 qPSUUgj3dRjl8DGOmJbwGg1R43XIEiug0bB89ifadSkUnPu6gm0zJUr5g9fTQpGT
 YQY3stPd81Szyw==
X-ME-Sender: <xms:LuO5YcTvnqe5qpvguPelVNHytZTlvf3158jrWFzxZvWwfhSXhUa3Sw>
 <xme:LuO5YZxKvHKUDOiHW4qnwanzqiuydrhDrXKy2uwQiYnP7-ZtT2x1-lByUVp_VOJSp
 Uzp73DSqsYu_C6LMzc>
X-ME-Received: <xmr:LuO5YZ1EZAxA8aU7UxU24kgfpGBIol3fYGDNaQWwdzGqr6ye6TowJw-HGkSQYdyKJlk842jujchWJQRn_sGvZCaUyMgfzx0gPf-Ldgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LuO5YQCx9QfW4NvS1TzXVL_gvGpt8tJf_oez8AF14GlQY3ANzZGYMg>
 <xmx:LuO5YVgh5ojzu85S2qxpH82cgv8gQ-u-pDf4wSZ3TsJPKLNO_8E5iQ>
 <xmx:LuO5Ycre95k__fcgNTcBSh1iTZR2vr5mO7wVYCl3A_40IBZC30C1Kg>
 <xmx:L-O5Yaa59zozMN5IbDHKHPOjK3dhEPxuAMePLiJ0fgzNd5MSjtL1q1WKWf8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 05/14] drm/vc4: hdmi: Move XBAR setup to csc_setup
Date: Wed, 15 Dec 2021 13:43:57 +0100
Message-Id: <20211215124406.340180-6-maxime@cerno.tech>
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

On the BCM2711, the HDMI_VEC_INTERFACE_XBAR register configuration
depends on whether we're using an RGB or YUV output. Let's move that
configuration to the CSC setup.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 47ff4507f017..0f8b1e907fae 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -785,6 +785,8 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
+	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
+
 	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
@@ -899,7 +901,6 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
-	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 	HDMI_WRITE(HDMI_HORZA,
 		   (vsync_pos ? VC5_HDMI_HORZA_VPOS : 0) |
 		   (hsync_pos ? VC5_HDMI_HORZA_HPOS : 0) |
-- 
2.33.1

