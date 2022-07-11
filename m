Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B1F570938
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BC290350;
	Mon, 11 Jul 2022 17:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B1F90322
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A5FB5C0071;
 Mon, 11 Jul 2022 13:41:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561271; x=1657647671; bh=AR
 TIP0jeT52FuGAuxeKswKSUp3sQTVLi6JWp/gJwkIo=; b=b0qGRPq67Abq2JNI4i
 ZMINxCZXdcqVG2nYNOhvK00q1GYXJB9CKaZ2Dh5yHyHvSzR6VA+vUot/NjjXiplB
 rguyDvz7C7KOCVqWe3hoFHvUAsjG/VLUQ9vN+E7g/tKluw+eopZhjFTfjOZ5ir/W
 hvPCJBUkrhRt5mHLqQDVK84YWPefwdlnmkaUi7HCusXPVbg/oHsgAopbzo6t1nL2
 55H+wSeCi2h/51VKUgLmufHTtdX3ISllkp8Grw3Mqh9vT3jBuhmqw+xzGiEDe2XZ
 4G6VWKorLmfIhcViYrsDsgh4jimNY5ddDDY7xJJEi9biGP3Bc3UuDjg70k68KH30
 Bkvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561271; x=1657647671; bh=ARTIP0jeT52Fu
 GAuxeKswKSUp3sQTVLi6JWp/gJwkIo=; b=rILqwt9TFKEmyoTJpGndhVLO6r6QM
 DHIGHYxo3UwrsxfiIM5kkIHBQ8DyxhEzyRgHOJzOvBjnHMdzkYDRLP/10x4pgdCf
 uYvc4tj+qoW5t024U0eFt+2X/vhH8OBUQ85fy1jGPi3RagiWE3ow+KPNNfB8l1Nk
 OOMVuW6wRMAeVcUDC2DmZelYwUTYRy9GP7F5NTDsk8DtGiIYMr1uurja17uZXG3V
 NVrF4aIdnUIcEnrYyaIw1JYs87QFUSvPrXLdPQ87W1Ff1uxbSRoUQ0+5ZIbCif5u
 AMWi7Tthcnuloi7D/PMWJsiGsog+LcKokQf49W4gMKdopRaHfRiJZSxng==
X-ME-Sender: <xms:t2DMYlhODAPXrWufkwfri9VUcGhTP73jEx0oXZKigiU3t1DWqpsddw>
 <xme:t2DMYqCHtiu1IqHw2GmxRgWEBStbquIR71oQtfPYOIItb4E-04S4bS8kKp2oGbQN3
 SSawcCli6Rg2lgsX7k>
X-ME-Received: <xmr:t2DMYlHXcVlByL_oE2hbjqyHNPz3lB4nc_F1CIwjw9bNpuuk2kbgwWhg-iXl188BKvUHMSQQaQYcEaScYFXV7udJADBGhy3q5dAVV3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:t2DMYqTfel7LDsDsk7UBd6Pq6XCH6P6ByHdmtsrZU75X78NWSvNxTA>
 <xmx:t2DMYixVsj5ZhyGfDl5POPIhwD0XbkkzpsoCDN_vWsKt5OlfrCAoFQ>
 <xmx:t2DMYg5o6hcLv_r4C--eIe2TCzeABDojoBPsk5BSC7Y1H4Oq6GwebA>
 <xmx:t2DMYst1dkd_nzy7YcF3lXBUKX_GVmun4Gf-8cY4lV0TpEFsAV1dQA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 52/69] drm/vc4: txp: Remove call to
 drm_connector_unregister()
Date: Mon, 11 Jul 2022 19:39:22 +0200
Message-Id: <20220711173939.1132294-53-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

drm_connector_unregister() is only to be used for connectors that have been
registered through drm_connector_register() after drm_dev_register() has
been called. This is our case here so let's remove the call.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 160f9d0ec6f0..7e5212bcf8e6 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -336,16 +336,10 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
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
+	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -532,7 +526,7 @@ static void vc4_txp_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_txp *txp = dev_get_drvdata(dev);
 
-	vc4_txp_connector_destroy(&txp->connector.base);
+	drm_connector_cleanup(&txp->connector.base);
 }
 
 static const struct component_ops vc4_txp_ops = {
-- 
2.36.1

