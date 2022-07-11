Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233E8570936
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE259034F;
	Mon, 11 Jul 2022 17:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9799D90325
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E11E15C00B0;
 Mon, 11 Jul 2022 13:41:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561279; x=1657647679; bh=GZ
 owahH53I4EfL36xeRkJs03uocoSCHPgmmwZRUWtO0=; b=wBrqH9Q/zkRCQRFVSp
 5ljTbOWCIyOumF5cnK7qlAv8hygfHdli28cEZs2knNhVX2wKPxpmnjB+p2Dk+UVe
 bSorOSTH5OHHD9mwsZDfD5WBaeJTSRq2odg50Yw+C69SLvxx7vHQICX/bXHU+KGf
 rDVbW0NQ6Rtk5dLdCt7V8caTHbjtyzPvIVKtb9vg2ms9+0y3x/m+u7LP//3FRuQ9
 y5gwmwBTSDXTPBHfdwZ2EB8mErM4wBezgaYdYApSoY2bJUoaSbFx/EVQKG/2CtyX
 wiHcSxSDY23buWjW5zgSa94y4TRiwZbP/l+q/E3XD1Q94Mdti30m0STPz2M/eOSc
 sVUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561279; x=1657647679; bh=GZowahH53I4Ef
 L36xeRkJs03uocoSCHPgmmwZRUWtO0=; b=e/3nPK9mqdUr1BTSSfFS8AJI9p1+T
 H4Vvwrod2xoz5oMDkXVWbeMaBd+OYuU8v9+tBTqa6hAVJuugjBhChJgZkAc2OiSL
 nIgp//85oI5gijtOY22K+/dVjh+mqwCGdXakDW1mPqK1q514hzagiAD7Di9mAn2R
 xYm9wmmFNKWwh8+noa6yaUxs2fTYHtvwKAZ3s3mQN/1Hb54aacN6EfG6uQxOO1AT
 143lELkix/dIV82ZelySKUbwlOJ8/c/VYFlargEUeLoaGrDmXb7vJoVOQQSwhlNi
 nUsKhKJDreSdT+L1/Axmzc9eGsDPaXLjLi2NhXnWCHH1wt1agO5m6AB1w==
X-ME-Sender: <xms:v2DMYvnG83lmEGwuLDgnYmFmYJb0An-sw13z5wPc2L9UQD6WXg80CQ>
 <xme:v2DMYi2KEZUvA74NZBWkMSQ3UDcUVEaeZ95OT5GYtU5Jyl36a1a-UOVqfTyK8sbNu
 rfiLuCyrIos2fm7Z18>
X-ME-Received: <xmr:v2DMYlqbeJkbyw3nulsrSRgHOaAkVtFXexWdARMD1MDivP5ekAu_7SBD4aFAaETaFpFGtRhez8xBSjx6jkUc7DDjRVcri0y0DKh1XX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepuddunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:v2DMYnltyDv9Sytlf1nihCgw4K4ZB_euY1yLg7pvZkeTZHzBHjgDRA>
 <xmx:v2DMYt0WgZznfhCQP_byxtvSwhKTaaFw8pEuMUo-Hmrj-sirH2xRiQ>
 <xmx:v2DMYmvmI9jYq74MQ7JMoONyiWzRX0AJcR1SRjjMXZuGpkQtAnyqPQ>
 <xmx:v2DMYoRLAeKcGjI2E4mEpaSYI5OEGzQ8SZre7NeJMeUbW2gA6M6mEA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 57/69] drm/vc4: vec: Remove call to
 drm_connector_unregister()
Date: Mon, 11 Jul 2022 19:39:27 +0200
Message-Id: <20220711173939.1132294-58-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_vec.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index a051b25337c0..2e9dc09fc6f0 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -289,12 +289,6 @@ vc4_vec_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_unknown;
 }
 
-static void vc4_vec_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_connector_state *state = connector->state;
@@ -315,7 +309,7 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
 	.detect = vc4_vec_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vc4_vec_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -559,7 +553,7 @@ static void vc4_vec_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
-	vc4_vec_connector_destroy(&vec->connector);
+	drm_connector_cleanup(&vec->connector);
 	drm_encoder_cleanup(&vec->encoder.base);
 	pm_runtime_disable(dev);
 }
-- 
2.36.1

