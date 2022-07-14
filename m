Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD435747FF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A7512B191;
	Thu, 14 Jul 2022 09:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D9D2BE22
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:13:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3BFEF3200900;
 Thu, 14 Jul 2022 05:13:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 14 Jul 2022 05:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657789982; x=1657876382; bh=gO
 SQTb7Wo11rF/AxGEWLDMIkdIlbqO1Eb0r9m+Pnv0Y=; b=jeFhguaOhg3XJac+jB
 fWdjNMdwAoqWDEm6yLAVuafuSrW6hI3zKjVT27V3/2V+OID9gmiHozIoKT34WPJA
 o7GYRljszWz+4qtsDaAeHpu3UZ8nQlPnTZEf7Jr58A9JOJ6nxasRUeJcNVTRCqh/
 XgkKsjRLyKkJIbH5QL4dq6W6UCT2yOEVZHTRrg4WnWckdBXSOs0q5GIQimM+9aOw
 eux8sMJ9qejzsyrGKAv73lGhOU9obp1HXfyM7XVWmiMt4WT83AWyfedOmbm3CGwS
 t22AXB1Mz+XgNCw689yxQ7Q1nagDKE4U/LA8pn4QAwXV5hnZQ8UloNB/Zb1l/w/r
 yvtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657789982; x=1657876382; bh=gOSQTb7Wo11rF
 /AxGEWLDMIkdIlbqO1Eb0r9m+Pnv0Y=; b=O+ggCLJDbTTYr28rWRKaxY7FSQBeE
 yH6gh3lIfGB+3Av6SR4KH0jvTYK6hNS/GnZ6svCnBCr0bBRRWceaczXRTbdVNLyV
 4LvS904QhRz1L4sLCYki7Gia8GRZzGrDuprDccFdXT4QqwegYJV2e2F9sC9EtdM7
 Wde0RIFUW6vw/RsVd6TJhNj2+ETClQBrQ2QCWekil3Q7QU9xXRiJxoCJxUeoChr0
 vu4SB5LjhIKXE70phasWRvQFa/x1kC7uP4CafpJLi9ViC1N8decdhN327scYqY7c
 Or0hoqsZcoTKEddQbKFrQ5LdPLB+PVCb+QzLqeovAarPMa5Vu7FVQOnnA==
X-ME-Sender: <xms:Ht7PYgv5O9J5BcjAAqguEZ1AVrmaZ9AmHxJHjlfmZsGQ54p2XG3AYA>
 <xme:Ht7PYtcHY83vnZdwhCZgY7v2-EjXBbJRekAC_V3vc-o5rC37mWIiDGbasatKKS_II
 M_8ChjNMGET8U_pmbk>
X-ME-Received: <xmr:Ht7PYrzYyQ_iXymY6uXhEq_Ai4vPPa-hXt3P6HeoYs5fruXnZLKGrrrUW6ye0vbARSP6SiaFQutivTfPK_L2nycnX4R4SgLVO2SJePg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ht7PYjOc3Svb0aCfMhWI7UKlc3a4CyO3DtOjUv8ofWM9cMkgEifwbw>
 <xmx:Ht7PYg8Y-Txrka6TSwvFGwLmumTKAhVpCltUQYSADOXW8dCURzzLmA>
 <xmx:Ht7PYrVUZ3IXTCHjEm8KpoRFj_qWNo01PUk9vrwJbhHNdyLqG96lIw>
 <xmx:Ht7PYrYvruKSF5Tnbbe0A-36vZpGu5qYvj7L9vLCn9shD6O3lZoC3w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 05:13:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 2/8] drm/vc4: hdmi: Remove unused argument in
 vc4_hdmi_supports_scrambling
Date: Thu, 14 Jul 2022 11:12:46 +0200
Message-Id: <20220714091252.2089015-3-maxime@cerno.tech>
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

Even though vc4_hdmi_supports_scrambling takes a mode as an argument, it
never uses it. Let's remove it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index adcc2d3918f1..13407e06846f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -650,8 +650,7 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 	vc4_hdmi_set_hdr_infoframe(encoder);
 }
 
-static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
-					 const struct drm_display_mode *mode)
+static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
@@ -678,7 +677,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
-	if (!vc4_hdmi_supports_scrambling(encoder, mode))
+	if (!vc4_hdmi_supports_scrambling(encoder))
 		return;
 
 	if (!vc4_hdmi_mode_needs_scrambling(mode,
-- 
2.36.1

