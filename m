Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9936560017
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD6414A620;
	Wed, 29 Jun 2022 12:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E68114A620
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6A6C8320016F;
 Wed, 29 Jun 2022 08:37:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:37:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506233; x=1656592633; bh=BO
 M0WKdvZgjojD3ZrgMK7LoTkJCNWJUtbs3m/EhLkmU=; b=Xs7msZ0hV/6Lkjsghr
 Uzt2lj+CMkrq4AAsojZDMmMYSbU/Z+CJpQJpmavxKCqh8A00gP/nRu1myv+A8xsi
 4gVUSU5eJytqCQPo7ZR6BZaFedgubcjUeTGM4GN9uOa+QpWhpMptv5QaJ0BHYATF
 uUy2n/4S6xOmK/TQANy4tmM4OScWvdYE1Al7nincBULvYhVyC/Cx0KcVF6s603Sp
 px4Pg3qIxfV35XaeSkz4jMdfiN9yJpyadSKJI/G7vw857L5+MPaPVww1E4HqbFEA
 HQsgW3q/flzlT4IO764Be2QFBvou+2OXwQYrSFTxd+pks8p4cXAKx6SRB44VlwhU
 6lCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506233; x=1656592633; bh=BOM0WKdvZgjoj
 D3ZrgMK7LoTkJCNWJUtbs3m/EhLkmU=; b=ku+DEOAyMlDxYtanruazUbTmP0zux
 XW+vaFfRyrFRSuh5UwpJjH51GuC2R0zHJ+jXVNxb57ffzzUptyGiZw962JT1VLkW
 ALJ7tdjNlMiK6dM7xELWGhwsGyWxeQyeLvv6DrWf1V3SKbb1OWfMEGBg1kPbQHfg
 GGe3oujkNdc2v1p8rnZuuKvwzCJlZWV++UrfQJpkuGXqaJtiK/YH6v5/J9VWTUAX
 6ucZx8/JkWUSc/PbjmDVOGny5n4DG7/M0zE6xcqq67HB3OnkBHCLyt9Rmkh5xqSQ
 XdiYfc0Uhm17y7dHQezgw0S41pi9k3Ug5J2Spg0aTxkXbAlroZNaB7YcA==
X-ME-Sender: <xms:eUe8Yi3TlNDjgiKjdArs3UQ-XK5iU4oYfYHJ4f5jwByxpGom9pT_dQ>
 <xme:eUe8YlF0ioDUI6oiWY8WPR4UuoLpF8BzMyGkOY7zG5RQUb0RHERR9rOWhkvLMLv3T
 98u3f-K7SGIXQK5FbE>
X-ME-Received: <xmr:eUe8Yq6kgI85Y1CmVdLiwG-hNQW2DZBYF7LYCVq2pCPFmdxLsj0RARjEL1bottezuKMI5k6JyynJcBvE6jOCP2wguiyt7Laq5sznQUk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eUe8Yj3eBacSAMuYuLGLBXp3EZJ6C-G-uR_fTKoquASVYgObdhvHiA>
 <xmx:eUe8YlEyqmVhSuPczOC76o9N5EKbJA79XEoyhoVmpJoq05EguYacMg>
 <xmx:eUe8Ys_OPlQZbVYCkCcoCq4PP5Up3UfzA4Gbea2Ps6bprvqWouyeaQ>
 <xmx:eUe8YphUf-v6j0yOwlx3xqaIZPw5SX3z3YpV_17a8RDTAesOncWxhQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 40/71] drm/vc4: hdmi: Remove call to
 drm_connector_unregister()
Date: Wed, 29 Jun 2022 14:34:39 +0200
Message-Id: <20220629123510.1915022-41-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index fba549edcfc5..05f769474903 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -267,12 +267,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_disconnected;
 }
 
-static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
@@ -380,7 +374,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vc4_hdmi_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -3022,7 +3016,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_destroy_conn:
-	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
+	drm_connector_cleanup(&vc4_hdmi->connector);
 err_destroy_encoder:
 	drm_encoder_cleanup(encoder);
 	pm_runtime_put_sync(dev);
@@ -3066,7 +3060,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
+	drm_connector_cleanup(&vc4_hdmi->connector);
 	drm_encoder_cleanup(&vc4_hdmi->encoder.base);
 
 	pm_runtime_disable(dev);
-- 
2.36.1

