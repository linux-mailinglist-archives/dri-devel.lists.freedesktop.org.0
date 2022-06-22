Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 175B0554D57
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C34611339E;
	Wed, 22 Jun 2022 14:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF3C11339E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0D3D032009B9;
 Wed, 22 Jun 2022 10:34:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 10:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908495; x=1655994895; bh=q4
 O3Q1xmO1Cl7CkgKWzjoPOfjWOscweqd7XlBYbMwUM=; b=SNwGCTobKBXTUzhR31
 5xUMdAyQUcCQSaDUqc6fiWEX/eFVEQv2FFphbPXUpbKSOWiBbzwTeP2TmIRmjisA
 uPgYzvhydZLeZtLd4c447nhZjQb88KkcnlkeP7UUeuhVo/Olh2K7czLD/xxWz7UV
 WhLJZe115vZGUSNe6vNops5p0KVI0T3k4yNI4Q2MmuSjuVo93y/K0Kjs5FaZN3gq
 B/V4PFQU16EVe0LS1nRkJhUKPwoh7cSWqaUvoCAv6tYxy29YvsMrlem8C3wHijHC
 AdFjrDaFNIYUKuORzTLwT1Aq7PyjwPb7m3ix9VjLUr8DKlLw3uU6OImt841jVUkC
 jUTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908495; x=1655994895; bh=q4O3Q1xmO1Cl7
 CkgKWzjoPOfjWOscweqd7XlBYbMwUM=; b=qFl/99sq9ktou+tA60cu6jT1IhEqI
 D5aKvt8Ebt7dI2mIlY8TZ5CegjWWFMGQy8W/5JUim//5pbwzqNYjFj3ZJxW8ikmx
 V78/ZiLb+R4wj2xFFDRcEnU3czMFbF83sg5taoTD9am9ulee0OhWFQq3Wn5cbZhc
 PPdeBff5Zy5AL7DQ4zi9YNoPvQyV/Hx2Q764PZVeyG81tESxHaJsEg+gwZoTSnAM
 fmZabDNeEvkmCz+wg553GydHuEGS3RbrVJs73uby/zoJ+ebfaB58MmTjgL4rRpc5
 Xvd4KYgTPReyLFbp2/cWIA92O7j3oKG/hgh1/eFpEneF8YkBo+BItT9og==
X-ME-Sender: <xms:jyizYiZKWTcVgipPj8PoHWOnXOkafrXqYybsOG_i_KIzK83yO5gN8Q>
 <xme:jyizYlbSoGCVIKqqHzw4uDu6JeY15JZydKbT0FTpbg1lWoo-k1OnPb1L2z9J1cXpf
 YmhxissB0o_thOipcc>
X-ME-Received: <xmr:jyizYs8qGxSFRxgj9z59j6oofZo3Q_lZdNgMKaGGViFzaaCVF_RxZNE7b72nPVZIxH-2Yiq0slFjnSwTgZEMjuec16UaqBQq_w99tOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jyizYkqgvjVKQBN0Fj3xmZpF2nB8UXd91KhAhbwRR18b6ax1zzg2nQ>
 <xmx:jyizYtp_qFLkYCMfeGbvmLbwJtuYTcGLqyKEBjHVYocAIZwUFBWYcw>
 <xmx:jyizYiToev672ghPNL00YFnajW0P_BP-y2LmFWYjvHA7F_7rn1QisA>
 <xmx:jyizYunQRWnOzGPiHq-PzE3pHxteEJpTUvmK3XvqCNc0wmEJQdIOzg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 51/68] drm/vc4: txp: Remove call to
 drm_connector_unregister()
Date: Wed, 22 Jun 2022 16:31:52 +0200
Message-Id: <20220622143209.600298-52-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 93576b2d9ba6..0976d29adc7f 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -335,16 +335,10 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
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
@@ -531,7 +525,7 @@ static void vc4_txp_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_txp *txp = dev_get_drvdata(dev);
 
-	vc4_txp_connector_destroy(&txp->connector.base);
+	drm_connector_cleanup(&txp->connector.base);
 }
 
 static const struct component_ops vc4_txp_ops = {
-- 
2.36.1

