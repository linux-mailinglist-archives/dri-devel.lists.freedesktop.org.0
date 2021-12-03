Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4704675AE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BFC73377;
	Fri,  3 Dec 2021 10:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F5273377
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:54:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id EC83458019A;
 Fri,  3 Dec 2021 05:54:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 03 Dec 2021 05:54:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=iEaYipaLpMgI1
 Lv30r4jyymNFm1hIDTRXVDWp47IyrA=; b=GEIonYUiknjNRgOw2ssf0VYTO9cRF
 P3SeYkpCvCIhXzJpsC1AHE60NnuwVq5aSJc6JFjJ2XctYbvkUp8pSY1PWT0XoJ7Y
 q4tGcrWzSLb+6jp0gCztANfhVvpro50mXVrcapN9EUheZcaiZL+yjB45rEJDneZ9
 s+Ar6DxcJhBg2NxqzGS2tUZonj+UWjrQXFEjXyVMvocK6qbRYRospifioZ7JaVM1
 CNOgY1xTHkx69w80AOMh7814ZmauR6O0t+YPbFxGOmhw6KEoYJoCYoqeMmbXZIHA
 QRw+D8YRiPzFgWI8ESscyebfjdLCTNVZIkR4HK21INLl4GCyNr7VYKqDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=iEaYipaLpMgI1Lv30r4jyymNFm1hIDTRXVDWp47IyrA=; b=VJJXbx3q
 uIM7d4HhWxYpq6nDjBkno73UasNWmFcbXi0zg+eGh3Q4akbr6mBUWX4CxUQr0rHI
 rkwfG7hE1a4TQQ8WlC6n+JuXNyKOJa34cYQuz7zWfdQwqKNdk1/brcd2O8eshm7b
 LZio5ucmick4PSW7F4iNLEUAd2B6ufXaVfBV2A5khUsorpEkjnwGqyGVT68GLEVr
 4jh9aPBIKqNQew677d5k2ys2a5R/iwR+08n3L/uUAfxjx/cDrtvXgibcHMTLwDoM
 9ix4wRQl9SLnyrQGPddmyQuiF3nUlFCsFs5sRlcy5e2TTR0t2ORZVh9W8WLaFeKQ
 EZNFrx7MZskxuA==
X-ME-Sender: <xms:Z_epYYZoWLYtCxXWbmvkpI_0zTVXphdmc6CwS813Z6VP7nDPgnkSVg>
 <xme:Z_epYTYBC-mKWg4-Y9DN2K3Sc63vdHA4fL35yhlE7D761GKxlMJ25D13Ts7VMHr-5
 CmNNdkYGDIuT5N_FBc>
X-ME-Received: <xmr:Z_epYS9g7gXbCNF_TxRBo5RFpXP01LyoCWkgcdR0F-075PLFImeRxhoBNLTJl_3qPv6Tsm1ycIs24GiludJyK5wh-BAw4JSIMfEM6GHroC3J-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Z_epYSqaIGNEPTIeJMgwmm-DRqMbJJHdt0K0m6u9K6EdcT2kF-UoaQ>
 <xmx:Z_epYTokX0ZZHh3fVmQsu-XImx5aZ5pqgvN1sV5YkeOUe3I4z7_efw>
 <xmx:Z_epYQQlbaNXn0TsG2JQ6EH-chJ7dFPt45ciySCQSDDgEot_wA5kug>
 <xmx:Z_epYW2ZmCRA6663Vm5_956UA1QgRdGWEBgGx04qfBpGI4C634GRnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:54:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 04/11] drm/vc4: hdmi: Move XBAR setup to csc_setup
Date: Fri,  3 Dec 2021 11:54:13 +0100
Message-Id: <20211203105420.573494-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203105420.573494-1-maxime@cerno.tech>
References: <20211203105420.573494-1-maxime@cerno.tech>
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

