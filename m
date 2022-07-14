Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FB5574808
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A462F12B30B;
	Thu, 14 Jul 2022 09:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162D3A3A90
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:13:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 63BE8320085B;
 Thu, 14 Jul 2022 05:13:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 14 Jul 2022 05:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657789993; x=1657876393; bh=CL
 AC3HbZDPdlV7+gJQ5XZR5Y7ZQlsG+zyeA+sguIMPk=; b=e8SfCD2PErWrrrJDTs
 IYyg6Fc0YbBQ6z/6r8GMn1Lt8rtZsC2Wp+ItqX5QqC+AJu37CTcYEjqLOOuTyaoj
 vnsHJPTmZxZSFx1pwqfSDhKN7GghqXzyTC7Yn3/3cjMv+VKJOXrH1eZm8acfNMV1
 F42gKa2zK6QYDGJYs+WSfQ/iKrLJy6k77iqindLCcRWvZIpiRyvvCgqOy7DP52v9
 blixF1ydRXpzBRcMtsk2SwRhRVpxi0ej8939p1BoMg1KILWzxjo3+RnjV60dKlEx
 w4kCT8QKtgH2Acem8yz6LLKfFpNwikXsVMbQgnKylVkMDn9ROBi1CQe3W/XQE8cU
 fXiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657789993; x=1657876393; bh=CLAC3HbZDPdlV
 7+gJQ5XZR5Y7ZQlsG+zyeA+sguIMPk=; b=Y2iHUcYwXWWr5zBXglU4RMtJZzBP+
 WlHmjKy4coZ8/ytoBv2EtzpfG+0P6BiBGosuVCNLL7cfpG2rROh9PN1dRE8G5biH
 BmNoIqTMSWuFw4OBKe1m2aB76iDiqMO1M4GJhqM3+bI+/IaEL9n0qroq2NRe1zt4
 HhtuHU3qt514HoZPtQ1LbV549Ao8zMFmLBOm+7vrRpCIEym3wwfM/IAsvaJlgfya
 nnYvB19KZz7y63pR5c/qVPdU2++YWrhH1zDSvTYjh4fqqDohXfoRHJomrLfRCEiK
 Byks0VFdfjyoQeTG7iUy9nmx4fDtqO36SkzsDGzd8TQ63mMWrOkDtAoqA==
X-ME-Sender: <xms:Kd7PYqtZNW0hmz3ukqK-i3vX_UuzsZ11DAFqpGULDC4BKSBghyducQ>
 <xme:Kd7PYvfr4KkuVrlvtWEzwAH9jTs0sT3LV38_m4gN-HQsN7DwgrzEXis4FOMuLYZUk
 Ccsy3BpaRnRb8fr4BY>
X-ME-Received: <xmr:Kd7PYly62BnsN3921BfymSpnlCHmNVaQCazmZVeDGnD6Ay89enIssqh0bsmiYiNMtz_pjL2rDm5PsZGaxM0fJUrfP0hObxnYbSE7c00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Kd7PYlNtaZK2yC6INDuBCPwkklRCvqsZbzxrw-eaumaN1TOO_O03Zw>
 <xmx:Kd7PYq_i4w1ZPTi3akbYa0z1a8h60WKYQiHbEaWAUJ099xDdgNomvA>
 <xmx:Kd7PYtVa6-PwMnNqsa35e3mOxscoLRRXdTHSAC34jZKlog3j7yA4tA>
 <xmx:Kd7PYtaIUMaLyvxi8ifCkWozvq96Elzn4eadTu5PmP1dg-IzmCjeuQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 05:13:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 5/8] drm/vc4: hdmi: Switch to detect_ctx
Date: Thu, 14 Jul 2022 11:12:49 +0200
Message-Id: <20220714091252.2089015-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714091252.2089015-1-maxime@cerno.tech>
References: <20220714091252.2089015-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need the locking context in future patch, so let's convert .detect
to .detect_ctx.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6d84f3b96654..668addc8c170 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -263,8 +263,9 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
 }
 
-static enum drm_connector_status
-vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
+static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
+					 struct drm_modeset_acquire_ctx *ctx,
+					 bool force)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	enum drm_connector_status status = connector_status_disconnected;
@@ -412,7 +413,6 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
-	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = vc4_hdmi_connector_destroy,
 	.reset = vc4_hdmi_connector_reset,
@@ -421,6 +421,7 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 };
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
+	.detect_ctx = vc4_hdmi_connector_detect_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
 };
-- 
2.36.1

