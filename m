Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94292546255
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8109E11B4A4;
	Fri, 10 Jun 2022 09:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E9011B8BF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E75E35C00AE;
 Fri, 10 Jun 2022 05:30:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853452; x=1654939852; bh=Ke
 rbckCPIM8QN7Bt7ltW57Ppwc+3mlrH2QIu0nUn3Eo=; b=sPeedbjdyGzYzkyriQ
 wvMqBqtFxjcPPu7Pb+E+cPPtaghJ4OhsZq/HsiO/tx6yekPHAG9thOnn54iMRq62
 PPopLj2nGPlwy9GNtVrHaBzDl0kfnbjQH2ypj6cgsVYb8SZ0Q8m2pvYpq4YFPstP
 K3ZFSoGVkPWvlDAZEtbJhrBONhmE8HKOUE3qUtcy0blNH+F1dI2VAkE4IsjQU/SI
 pVM51NTgT1Avf3iT7qbN5CfXSCaGi8mHSQ76jJhhH8cRX0D6t7GjS0PLVj39sa5z
 y8itpprSAIg7omTGnO9sbbvvTuBAGFEYmwNsRAll6jInbzlTWz0/4gBa2MdW8sds
 AnvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853452; x=1654939852; bh=KerbckCPIM8QN
 7Bt7ltW57Ppwc+3mlrH2QIu0nUn3Eo=; b=tZeSCPj8bSrmA4UGE2+SiLCpXnHRw
 iNPR12cGVembEt699QkVtFTXHUXj8TNn1gqwGCprRuSBebGNFAK8QvZbScPqwvLf
 HeZpDFQo1X1+Iind1ZBc5YPbbM6gV20qFkQuCaKOVSZjrBMrYJ/BzMC9gr2ceG7U
 ycql/XVXThEfIUZSet5S1L2yiytENOynjKERoms3BJcF40IxxYc3wcYJFXET/GdJ
 96HrD3d7oVdsCZgIL/lpv7UKADCRBFbSHzgHp/DKPVxhhsf0sAlgiUUl9FPGMBt6
 CHZBwCdzTJleL3YtDy9xU19ACWVg17jOgszDOHrcOtV6BHA5JbmT3ur6w==
X-ME-Sender: <xms:TA-jYpinZ5gSZdAo4XSNKBYRzT-dVrnI6K9nmICb_l422xmzC4KTiA>
 <xme:TA-jYuAHy5wIg7OsD_yzBBLqRWlHjFJELXTBoX50kHeIedM8LFJkDufB9z3d6Zn_j
 1dxpkjnkUHIlofryt0>
X-ME-Received: <xmr:TA-jYpHyZaW2OWBVXkwbrRMaXj14wCVuBUxpcpBN2x8SLWAxRX7ElWJrEsPCQnidHW1yDaF5GnctlOirjJnHkVMzNFwLELzODe20wfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TA-jYuT55aQLhgW5CygY5jrc-4vtqlla6oclgvPUXsKt4pE7g1ceFA>
 <xmx:TA-jYmwC4iY4jMKFp2lZkq7THxXtjLYz0lNcaOlYUxHfi0E_h0Ms_A>
 <xmx:TA-jYk6s3gCPyHYfYAf1J9q4I6pTqAAp5yZj7Jb9WLnm5j6wRPiJRQ>
 <xmx:TA-jYgutUx3Ix3dd2v8vjaiL-GJMNa6LtnSkL-2uK88wnbv5yDpx6g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 48/64] drm/vc4: txp: Switch to DRM-managed writeback
 initialization
Date: Fri, 10 Jun 2022 11:29:08 +0200
Message-Id: <20220610092924.754942-49-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code will call drm_connector_unregister() and
drm_connector_cleanup() when the device is unbound. However, by then, there
might still be some references held to that connector, including by the
userspace that might still have the DRM device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 6a16b2798724..3f214b702c47 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -335,16 +335,9 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
-static void vc4_txp_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 	.detect = vc4_txp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vc4_txp_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -498,10 +491,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init(drm, &txp->connector,
-					   &vc4_txp_connector_funcs,
-					   &vc4_txp_encoder_helper_funcs,
-					   drm_fmts, ARRAY_SIZE(drm_fmts));
+	ret = drmm_writeback_connector_init(drm, &txp->connector,
+					    &vc4_txp_connector_funcs,
+					    &vc4_txp_encoder_helper_funcs,
+					    drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret)
 		return ret;
 
@@ -525,17 +518,8 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 }
 
-static void vc4_txp_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	struct vc4_txp *txp = dev_get_drvdata(dev);
-
-	vc4_txp_connector_destroy(&txp->connector.base);
-}
-
 static const struct component_ops vc4_txp_ops = {
 	.bind   = vc4_txp_bind,
-	.unbind = vc4_txp_unbind,
 };
 
 static int vc4_txp_probe(struct platform_device *pdev)
-- 
2.36.1

