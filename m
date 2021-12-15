Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD6847590A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4018710ECB4;
	Wed, 15 Dec 2021 12:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9E210ECAD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:37 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 9DACD2B0024D;
 Wed, 15 Dec 2021 07:44:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 15 Dec 2021 07:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=eofzFVhjLGPKI
 lBpxuss7ejLHBp/T+YzglhuAb0FeCE=; b=WLpZsV+5k3DsPgQ8pXpL9IqFByejK
 pn+YCkFkz3LToWBxvlfb0y4dTYDfvIn2wXUTqKBICQnPtnhnpXPEdI88yRgjmVvJ
 REYRGQLhtfO/ESDcccvEJfzdPe4w7ukks0BDHcMieqh8y1LJ0Yp7HNnlbpqBa7rp
 lYMRwRpYWulyq3Zo43Epi9DtN9tyAwwdCEZMw9K0foXQQ2KPxYmRWmAd6SFEz4XB
 Cu5qsxvMCRB+ScYlBl1CHa7WvE9hD3qnqf6PICVeu+q5uvbh5U/ASkAziuo50Ibe
 9ehp2o5os3eKgVYO56S1LPxvMxSj3Y8mShUzn3dRIAyucfVPm3f+RVOQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=eofzFVhjLGPKIlBpxuss7ejLHBp/T+YzglhuAb0FeCE=; b=AU8Vm69I
 nkG0npWe4mg7saPXVW2m9L4hbND973kYmLJ1ct2ZBgtHw2h3gmJwf3vG9IGk+l8K
 D249j8EEgQlP4/Py0wqgQJMLk26sMuBhG4+qzc9/sDnd7XkUbvkfszUqTlVJLPQv
 7hYqOj1hF4rp8GAOoq7fyu3iKVDVrFAON4N9PFNTFR8ePkgQgfzRjdo6NPAZakBi
 UdNdoNS0s6mdOIkeuL9Jqat3SlEw63LM0kQe9qJNXVqIJ7zXaTCY0jSsL5s1qiQA
 HLLHOeHRQkGOT7fpUzoofKaVzAkgL9ByC9gco0UvJpBxMjKgRU0fkxwNAQNZnFtR
 sCgRKAdUoGPg+g==
X-ME-Sender: <xms:M-O5YSsVUHq5pRgKhdOW7ijTRcqvxrGy6rqAIrBB5cYFQ65gjaBmog>
 <xme:M-O5YXfBtxy1xqB7ha7vVtIBL1WpYi4qsvhLJoaj-7lfDyXNBE0jQmaiqucCzw2Ds
 wz-Yg9lr8wHazQgCcA>
X-ME-Received: <xmr:M-O5YdyhItXZYj5rI4Yq8faiE2sepggPQ-YlC96K4nAfofhGB1ybjKM4Q6x67prnPNgWKKMTadCKIPCya8gSUd8p6Bgar6Ozg69Tn7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:M-O5YdP-3SAR9hwWtKa54fQhwYu7pY9Lb0aZWZMrMsiBW-RY9ZYWfg>
 <xmx:M-O5YS_WPpLLd1WIOdFlcpMn-5pdJMMCYnR2dFt7pK451s3-oe6M9g>
 <xmx:M-O5YVUIam8F4Wbw8KnerTOINmq8JV4Yvny8EIZyT6YMlSCuMxCxSg>
 <xmx:M-O5YT1SU933UDTV8tOHmScSMSwNAFMs45MX7bHsePk7-8OLvSMWNiZyLjI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 06/14] drm/vc4: hdmi: Replace CSC_CTL hardcoded value by
 defines
Date: Wed, 15 Dec 2021 13:43:58 +0100
Message-Id: <20211215124406.340180-7-maxime@cerno.tech>
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

On BCM2711, the HDMI_CSC_CTL register value has been hardcoded to an
opaque value. Let's replace it with properly defined values.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 drivers/gpu/drm/vc4/vc4_regs.h | 3 +++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0f8b1e907fae..682c3c907cbe 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -779,9 +779,8 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       const struct drm_display_mode *mode)
 {
 	unsigned long flags;
-	u32 csc_ctl;
-
-	csc_ctl = 0x07;	/* RGB_CONVERT_MODE = custom matrix, || USE_RGB_TO_YCBCR */
+	u32 csc_ctl = VC5_MT_CP_CSC_CTL_ENABLE | VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
+							       VC5_MT_CP_CSC_CTL_MODE);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 489f921ef44d..952f2aad0785 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -774,6 +774,9 @@ enum {
 # define VC4_HD_CSC_CTL_RGB2YCC			BIT(1)
 # define VC4_HD_CSC_CTL_ENABLE			BIT(0)
 
+# define VC5_MT_CP_CSC_CTL_ENABLE		BIT(2)
+# define VC5_MT_CP_CSC_CTL_MODE_MASK		VC4_MASK(1, 0)
+
 # define VC4_DVP_HT_CLOCK_STOP_PIXEL		BIT(1)
 
 /* HVS display list information. */
-- 
2.33.1

