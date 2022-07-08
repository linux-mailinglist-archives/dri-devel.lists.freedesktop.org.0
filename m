Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E756B6C2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD40C1138BD;
	Fri,  8 Jul 2022 09:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2ED112ED2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:45 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A65F632009DD;
 Fri,  8 Jul 2022 05:59:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274384; x=1657360784; bh=AR
 TIP0jeT52FuGAuxeKswKSUp3sQTVLi6JWp/gJwkIo=; b=I9NFKJS229sw4AaBpo
 RXxaPwps7ycd4HE4Jf2kj9REmThnvSBB74Q3N6daDzA0aX6WTV2yjTlStKLEOwwq
 n2RW15r3lEDeAJgPluISrxgkZqHqBmdjAFOqFNa3wM1SB0IwGaQz7ZV7qoAl5TAz
 NLN8MoaU4KoMxvi5L+XVTGV0zHxLLTUu8lMXSglHCjrcWgVaQxKOuQ8QWsNpd4dj
 UbcKiL6+o20Ud2NzPbmbUMKnHlH/nm7Fmn3KkfRG6npxci525uxi5tYHq4l3w1Ts
 YP+1lDzhWg0UAj25HzyRTqed3APGYUttlwg6dKdFfcYP2D9nXbUiagkFOATIeyOK
 QBcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274384; x=1657360784; bh=ARTIP0jeT52Fu
 GAuxeKswKSUp3sQTVLi6JWp/gJwkIo=; b=h/kfRRrCylwlZA1fxDx/p4en7KCyg
 vBRpDINKIovaYerILB44jFJqT9Uf/W1rsEGXFxFT/+Y9s3bJJ16CxdCV9G+/j5mZ
 4DZB5VMyDLvIu2w0FSC6LnMjGKLcJdw1PpXqOqHHDBzHtIfP6uKhh9k7XxxADo8l
 8iFqVSeGawcN4RByaCDEmdS6VdaPPhIadrZk8GlQDGaJM7sXwBCO6c9XBo52ZwHY
 qnv35a5YVxrCO5buyYyueT3hpB3oh6br5if0HJGpnJw6Cd6bfre1JkjBzKXu8329
 nqYdsl49PeRNWbLEBE46TgWB2NxDqwsIwTnyVdlXavfqfpOIBYIRW++sA==
X-ME-Sender: <xms:EADIYpXs-hAazx3vZZ--sBj7kMgueLIrqsjO4I7csmzCFQkz9UKKIA>
 <xme:EADIYpm1tkIwu1yQ4OH6B4WsLvf-7afyjU6cMyvNjqSAuQUICmtv5Bu1yq-w5x-G4
 mz_Y0_z7Lxjp4sG_pE>
X-ME-Received: <xmr:EADIYlYgX52FeFDTqEjvAlPJQkDXmzbl6deeJHFK5aSn2c0VPu8j95J3Vqv_lqKrI3IwRPrRswbGFp3FM5UZQpM0hElyLE-55kDkYIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EADIYsV0uSDbAcZk-KPDiyjbzlIwMrHiDyeX7HANK15dTK5wfeVEZA>
 <xmx:EADIYjl6v0VHly5TMhwdNoTLBdr5vp1oNVPlTjq3oAp9DOzJWAgfJw>
 <xmx:EADIYpfcyFWc9jny6syLOxF59mrLKgyq-o69of8KI2xix6-COifr3g>
 <xmx:EADIYsB_TSSZ_WQHnDDjDsD-9qd_4m-6W7LoGlL6q9qQAh0W3xlfFQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 52/69] drm/vc4: txp: Remove call to
 drm_connector_unregister()
Date: Fri,  8 Jul 2022 11:56:50 +0200
Message-Id: <20220708095707.257937-53-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

