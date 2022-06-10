Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D999454660B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C42510EBD9;
	Fri, 10 Jun 2022 11:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4800910EC13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:52:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A58465C013F;
 Fri, 10 Jun 2022 07:52:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 10 Jun 2022 07:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861924; x=1654948324; bh=UH
 GJfAibbq6LMDpqwN51Aa8/Lz3L+iRnZOiUjYl+teo=; b=PAnmCsVVkMYlH4ZM+V
 o8O9CyhPvJaC6wdAfH6D1gp5Njk1wpXDITXTu27zqrJUMEPJdY/SqCs0h1WODE5T
 2CdXedba1WegPBn8hTQ6ASAQd8n6E8u+UKmYW9xP33OOGGYXicDVeW/gtmfmDYz0
 5CTbgvqgZsy3LdYm12TxcL7krnRBuMHXLrhax9ZR1jxAUCu5E2ZngXCpRyZMrq0R
 mMZfXaibnYbxNFKs01COpLDHqQEA7I8FV0kl55Ha7EciStzaTUk2pNhpznzbTpqk
 1OJkFOQ8tHFfjq2FeSPznAiqsoNfG48axwl5JtGKf/cF+OOrZiHHfMh48U0VuyCA
 q1Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861924; x=1654948324; bh=UHGJfAibbq6LM
 DpqwN51Aa8/Lz3L+iRnZOiUjYl+teo=; b=KGfJCXHVsUbJ6XMlXR3+8u20XhcsW
 ilNqmxEHZEY/MCibkVgALWuRaEPi2XTXfrc/zAj4EE9Zbn61CNfjDwuWnrmiDNcC
 DgAW3y7qEzqx7XDGOI8uy8r8bgQuchJMCzRRLW6e6H7J/sBtpqF8+EuHyNu56Buy
 Jk9H7XV24CMRbc0uEqKBkRQSG4cVhSacGDfV6PrwOgdIdtE1AAXKP4CVBWla7rQ4
 nxUSy9m4X1YMrC7gW/c8KNHOI5U8bY8V6RKDPchKykm6TNuuRYy3dz7MciXgUdup
 D54Ei1+2muvibEOpGXnQhq3ZkGVDr/OXkOIpER58I8gRX5Kjkh513q7sg==
X-ME-Sender: <xms:ZDCjYrOXt9PdxoZaEVNIH8I1snRMndEa8q_D5SpIT-C4WNsQpQPvAQ>
 <xme:ZDCjYl-FcHLFZiGZI8UJQnWES8gXFfsr0rNI9WRnh9luXYq03lFsR6FmOPrsw8Z8K
 SFYqySSVe4XYIaFXVQ>
X-ME-Received: <xmr:ZDCjYqR7sB4m8qu6c85Pq1FAbiB5KdkvgeFOj9APhj-6I1e-VGgz4s3B1_C1VdJMimw4z9Pn1OImWItT86WXlO4OflIE_gzvu9aoGfM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZDCjYvtoTRhN3vZaKOWJ7Ekf2AUA7-FbZW7rezZSDGPYxaD_lh3sfw>
 <xmx:ZDCjYjf57pJsaAWlhGg_jrRlP24aVYPhe3uF3eXvL3PHh0Rb_19OPg>
 <xmx:ZDCjYr0iQjWnpWwXpFavZlIAbFd5V-qA1WptExgp__1dW4NMt8trjA>
 <xmx:ZDCjYkF5nGTmxJYTIU46mG0lInpas0yiLv3-1BlLiQSBl455Bx0w7w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:52:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 06/14] drm/vc4: kms: Register a different
 drm_mode_config_funcs on BCM2711
Date: Fri, 10 Jun 2022 13:51:41 +0200
Message-Id: <20220610115149.964394-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610115149.964394-1-maxime@cerno.tech>
References: <20220610115149.964394-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the BCM2711, our current definition of drm_mode_config_funcs uses the
custom vc4_fb_create().

However, that function relies on the buffer allocation path that was
relying on the GPU, and is no longer relevant.

Let's create another drm_mode_config_funcs structure that we will
register on the BCM2711.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 3c232d85ab85..1d3b31fb71ea 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -997,6 +997,12 @@ static const struct drm_mode_config_funcs vc4_mode_funcs = {
 	.fb_create = vc4_fb_create,
 };
 
+static const struct drm_mode_config_funcs vc5_mode_funcs = {
+	.atomic_check = vc4_atomic_check,
+	.atomic_commit = drm_atomic_helper_commit,
+	.fb_create = drm_gem_fb_create,
+};
+
 int vc4_kms_load(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -1031,7 +1037,7 @@ int vc4_kms_load(struct drm_device *dev)
 		dev->mode_config.max_height = 2048;
 	}
 
-	dev->mode_config.funcs = &vc4_mode_funcs;
+	dev->mode_config.funcs = vc4->is_vc5 ? &vc5_mode_funcs : &vc4_mode_funcs;
 	dev->mode_config.helper_private = &vc4_mode_config_helpers;
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.async_page_flip = true;
-- 
2.36.1

