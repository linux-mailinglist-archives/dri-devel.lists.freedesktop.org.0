Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4D9495136
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D730310E463;
	Thu, 20 Jan 2022 15:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E0310E475
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:17:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 1246F2B00152;
 Thu, 20 Jan 2022 10:17:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 Jan 2022 10:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=4s8GiS9ekkyxstdX+49TQvYtxHUu1V
 c7OsYplQb9SPE=; b=ikX6MsYfHiTwpWuwTlPfYYyZseTBR6xHXrV1+ZmWt7x4sc
 DSIQYYLpfU919byT8z4Trs3VxFO42zWB72dLeHq/S/rYVmnKGilERnW9OZDjbRKJ
 Jt/o82NhvX+OOFpuZKtXsvYnuinpz5HN8OOWVwBfzijMUUSGxaeKDN9OF9XpOMLb
 atTd9z7y5Y/OdVv5NjAbkYkOuc+McXaDXX2D+FSwEPYPrfTlkRKOr6YngY9EcKne
 5t01m+RxbXtZo0Faqw26YQalxDD7qtB/c9UGQFGRsAk1CcaqghxBSmw7WDDg7Iek
 a6F6xYzRg0pggZfZMQCXQp8C7lrNz6HFgLUhx6VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4s8GiS
 9ekkyxstdX+49TQvYtxHUu1Vc7OsYplQb9SPE=; b=HqGZUhYUQbWc55sKKDjuhP
 CYZrvZYjNMHEzKCJvdeDUJkLinLGor5bbgj8XYHEQAkEEzvn+wqH2TzKzWr9xsRu
 1AjYuKqjrkNT4QF7YIDLOh9ZeBxa0eojKDxnl045rnqJK/jJvvkgtownneKaNBzy
 5uHE2/skWmvlqLUxSKMl+f+bmSZvKuvGdZ49VOmsm/TiNMc1sDJ8iTaQp9Tg0EMh
 KmVTQ9L4NoO/uDHTuKFyHSjNcmv+uRm24ZWPd3Afz6o01jaz7RiJcqXB8v9taavu
 /rEtTuh1h5JDfJe9wC9lrp4L0qYB4JWfjQoUDvCsnPP4ziX0A1K6qBF5xtzuB98g
 ==
X-ME-Sender: <xms:7XzpYX7uJ8r_zcCaY4C9E-71XQjBY9nchrnjeTPNzWC3t4tE-GYg3Q>
 <xme:7XzpYc7bY1uPzERUl2-F4vURtwz2ijbMHEQzgmRm3f4ASlOj3Et9i4ZKD1V1Z2b5Z
 Yw-PbqD2D_Hu1P5tmU>
X-ME-Received: <xmr:7XzpYecCSN73kBSEIfblFHJaf_KSOK_jCBFcMw6EWGhuOh4uSdQp0x8GPRRioz9RPkt-IZPu0nFMWuqkm5EuOI9Igrxs29-SikE2Hdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7XzpYYIyHJtN1WuKhWxB4DLD6Ck_lP25HqzmSsX9w75Ozc2Z-XlzEA>
 <xmx:7XzpYbIRfujMZRf_3l8ENgKN9guX4FP_AdTEydkgVjcZXDmTdb-ykQ>
 <xmx:7XzpYRwRkm4MD0rptX8sgVKhO34H8ef35hhbEMXQUg-_0l3wVM2uLA>
 <xmx:7XzpYYB0NFn-C-kPt2sV3MTY8GtwGszLuLlXiUbjKCW7dzDZRB2NWCJHfLk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:17:00 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 08/16] drm/vc4: hdmi: Replace CSC_CTL hardcoded value by
 defines
Date: Thu, 20 Jan 2022 16:16:17 +0100
Message-Id: <20220120151625.594595-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
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
index 7538b84a6dca..33410718089e 100644
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
2.34.1

