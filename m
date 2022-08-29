Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3CC5A4E75
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0B410F278;
	Mon, 29 Aug 2022 13:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0838810F278
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:47:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 99412320084E;
 Mon, 29 Aug 2022 09:47:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 29 Aug 2022 09:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661780875; x=1661867275; bh=Yc
 kmvzRRrl4yB3uYIHubCaR2rk9cSe4F5C/dwoiYqLQ=; b=YvvuOn3j2dq7h29Cph
 QTkjiT1SH3D1BBa7unMDth3ZRQrY1tGElwvoHrnR6jzvxYUSCADyNh3Qdx1PIlDL
 FKWS+K6NyoGa9wdCcD1g+BOfYwdhqd2tyy3QbcF/PeN71Y+mz+96baJH/RNK1feD
 7VNZoDvwdH1s4n85ilVdd/QX/AS3pOS7eB1ki8FDbiaFxaHQYpHRB57Xyb1EFPbg
 lqafM0VOwn4QBNkY7x1+vAUWbD+TKS40e4lwB34X4AgkenaR1BWHAISn7/21VncZ
 bBb4GIyH8zZmWVyngZXLLKK2yv2mpRXSHAjZZyroTRj4rlthuK2jeMVJ4+VxmPmW
 uofw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661780875; x=1661867275; bh=YckmvzRRrl4yB
 3uYIHubCaR2rk9cSe4F5C/dwoiYqLQ=; b=SW4bTZMGALC0BPSFGKHbA4F1K6OlD
 nrm5oD0IYsRIweOh5k1iuF0GfH2dEWxCo9xpZ9jPpeRnCIsD4UAOIY9V0bQ4+9aA
 v5izQOjRkyQCTGgdeMncSm+1xHm7r/DmkiXXXQs1bOLC4Z+PPwrL3dsG805feMX8
 okHOOM+WKz1+918BuDgad3+BFahwcN3Jaz8iC11WU6wuA5pTWxC76N2yGpVIYB4N
 SfVntmx1cE/aKCDs9tVKjjbkxFVaEQzCNEuHABeL02Mi5y5jEk1+JCVR10/l9YNu
 5SfxLw3X9XiEkbDQRTM+BkvC4+gWTHVPEJIqApvGe74yTW5PzWD25LJVg==
X-ME-Sender: <xms:isMMY3wDgMIWo76HyTbz-U-aa8F3kylCBP9aeRspvNomKJdHFsYjkA>
 <xme:isMMY_T_6NmrVWV2OhCqQxCvxGL-8SOjBcjvOkhUzl4iZmHs7F2pOQByholwTV15Z
 VWeZbf07ZNrXhTPJHs>
X-ME-Received: <xmr:isMMYxWLeqJ7E5_RznETwx2CuqSCB6CC-cIuyfhiPcJXkqksV2FMBZXBS3JR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:isMMYxiCYfnwcb9gRSr8NHbeFNJNgY2pEwEJsKnF7XE_GKkyq1Mk5g>
 <xmx:isMMY5C4ycP49BW-YnlLhh3y7sIb69JFBC3uXQMDKKP5HMdRo12xMg>
 <xmx:isMMY6KRWx7M6h1R5SBiWwDfrulhvtDDAjHiooOdb2HiyfgMYKaWcA>
 <xmx:i8MMY9tYuyQ0C_NzrBEzxJxhnlshKZwDaUaHqrsyiBmDUAlAK1u0pg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:47:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 2/8] drm/vc4: hdmi: Remove unused argument in
 vc4_hdmi_supports_scrambling
Date: Mon, 29 Aug 2022 15:47:25 +0200
Message-Id: <20220829134731.213478-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220829134731.213478-1-maxime@cerno.tech>
References: <20220829134731.213478-1-maxime@cerno.tech>
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

Even though vc4_hdmi_supports_scrambling takes a mode as an argument, it
never uses it. Let's remove it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4a8c902dbbc8..faf52c20b95b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -708,8 +708,7 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 	vc4_hdmi_set_hdr_infoframe(encoder);
 }
 
-static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
-					 const struct drm_display_mode *mode)
+static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
@@ -738,7 +737,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
-	if (!vc4_hdmi_supports_scrambling(encoder, mode))
+	if (!vc4_hdmi_supports_scrambling(encoder))
 		return;
 
 	if (!vc4_hdmi_mode_needs_scrambling(mode,
-- 
2.37.1

