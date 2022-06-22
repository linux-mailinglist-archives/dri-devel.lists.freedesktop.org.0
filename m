Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A047D554D60
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEB71133A5;
	Wed, 22 Jun 2022 14:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7666B1133A8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 428F532009BD;
 Wed, 22 Jun 2022 10:35:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908510; x=1655994910; bh=yp
 bQn/2c++MmKvQEg2ijRQCaBqMa34WUGD5zewh0ICw=; b=hzxLHoTberxPMsEhoh
 aI4rFIDdi9+6/R9GQU4Jg4/CHrz+JSoVtND0WntkLG8BS08eQbueIV2DYeoQFSln
 MhGDj+k4zr/W1pvNf08YHe0U/J2BF2ymKzHuxWo2MpyI4Hmk+zJLr2jOFOitbelV
 /I1yeUS9+r4wp0F2lVTDlVbMsfBhCfdFabF0KRqvQ+RheP06aDaKpoZpgbbSPYkG
 MxLH/oiGEtOg+JrwWm+ROrgSYT1lCN9+q4TwqAZhSc60+p5JBBQWvbpK/wvFkkgJ
 TGBSeHIiVc0wQNkqgPCWrnIdE6itpletXgnOxXo/31E9P2+K3S5XNSz9b1zRCxou
 1B1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908510; x=1655994910; bh=ypbQn/2c++MmK
 vQEg2ijRQCaBqMa34WUGD5zewh0ICw=; b=kxlwj8UJ6NMszXNQdqtGX0SWCm3K2
 I0QhmC4q1020krGBWLfEpnARGJkUJFD6lONuVLxAlBlFQazybBeVWZ6V7EpcJhhJ
 up2LHRD9U1Y4yI7yz8rqwUWMCdEwYxhNIeEFXdZuelQdtD7fhi+WIzexpEhBqjln
 rt9wuvBcixJ/S0YwU9HSBc0U4pPZjt4/iPhrbKPkhYpXmFwScHBDUhhh9+/JV8ZT
 X7yqKt7u25Uqdeuikwh/IYrgq7Q0V0vyoajchpSCMLyoWU3qQrZ9kG0/RxSHPxE9
 sgFHD4KC1aT9pule6B8A8V8aETl5YuB53qQKjqLt0Xhv7/aTNcewH1jMA==
X-ME-Sender: <xms:niizYn-A5Yafg5uI8DDWvPJx0dlM6MSXWO5kyj0EEtj2Q4KBZj3nBg>
 <xme:niizYjvsM4BXPrR-3Wra4Kl1GLlImMVSbbodwyLgY33rXhCJo_KvlzTJfAwSzIPGT
 g9xczTFOlLQyW_rz3Q>
X-ME-Received: <xmr:niizYlDvHCQOmvNVvm3K1Pcdf80lb4VdLyBE9qeYKrnWFXkS2WPiN1PRTuCWSTWrfm1l6PqBdolIZjbE5F4yD18Hp_iLWjy5tqw6CCM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:niizYjcx96HEjsQc8b1kCDJuLG8bNEzYgy4CnmLAHK8loUSYm6DkiA>
 <xmx:niizYsMib1kDT-IRnVDxnY-iAVegpUs3oT_88oiFzWkvimtYPkx_sg>
 <xmx:niizYlmbN5RC6-VEt5q0S4bgnhNkC5e5u3ikZ42w-pDLTcuhvtXLpQ>
 <xmx:niizYpo9fR1t_5MxECBRhzoST6kq7qVgb5ntQSjWsuSAWW7iQo4T4w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 56/68] drm/vc4: vec: Remove call to
 drm_connector_unregister()
Date: Wed, 22 Jun 2022 16:31:57 +0200
Message-Id: <20220622143209.600298-57-maxime@cerno.tech>
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

