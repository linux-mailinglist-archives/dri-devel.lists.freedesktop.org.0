Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F2663F37F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362B710E62E;
	Thu,  1 Dec 2022 15:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D5110E5FF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:15:17 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8D0215803A4;
 Thu,  1 Dec 2022 10:15:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 01 Dec 2022 10:15:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907716; x=
 1669914916; bh=5wSvW/DZx0aI6uP1+7/AFBFIuW+waBnmd9lfUJ/y8M8=; b=g
 ybvHvVqlnFvZ6msmZXOcssmsa5KOeB227L+9sg68rT1AtmWWXKEbSX3lCJIOLQu2
 Q8k7v8jzgkU0pdf8TMbYeOmGxaYWjGx0FERuaIETm23ssC6vEy2cH5m2vMYNxdlD
 N5J8W3a1srB3v56psR15zIn5uHHn9ModU/vAet+7Ifa7yl+hxkO8Ft/enIRPlAic
 UhN/F/qw/BDLlmaErxMC6BIH2EYo58qbeTX36QAaUhnCP6EGno4uJqr6qDHkuSSv
 WT4TzMYD1mlNlM3iFnBB6elTWsTJIih8DSPDcR/CCSLu2z1cMolD7fFudeRfmo1J
 FNApVy5N2+GgCzlKJ0vlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907716; x=
 1669914916; bh=5wSvW/DZx0aI6uP1+7/AFBFIuW+waBnmd9lfUJ/y8M8=; b=R
 xn5GcImQQ5PITwjW/nIVSSv/NFiTcb8LODJwUDNu8mHtUtt06bJrfudWOsKC3A7h
 q0VjLjh31c6tuC7io4afHRZmCdb0/nvfAk8jVgPznx3fh9iCopASToIR+vFmkq29
 c5MVx6s8ecC7JVNxdGG+FGaw47PPNndnjoHJpnXUXj4yifLIjYslbckTRccY+33G
 33WAcb85GqzLQ1nbqm9iJyW8NRzExM9JW7tDz8+TBVzKG2RMNHHmToXxpamgO8iZ
 ymlg2jbHZCxfmHqlTuoefGYtj4qzxOohcQYUSzprFnVQachNsUaFIvI/XKDx9lI3
 fzvROsWRA6+ZBbNRm0Icw==
X-ME-Sender: <xms:BMWIY0nCfEnHuNF70ZAQhW3DyqW1aIaLELKaQJR3UKnKm95bsb6UFg>
 <xme:BMWIYz1r7hHVlQ9t5hC5KzMm0tGu3rZuEB5fUBrXw2I9myW-r7l1HyQ_ok0bjiiI3
 2qZr9zQdxhkkaL1aDo>
X-ME-Received: <xmr:BMWIYyrPeJBW5b3Lw6Juw3xSa8Z3J1dtbbi62q9BXQ8KalZSMTW71dsupp4vl2seo3RuuPANKPCowPFrvJHI9tQRQAHkqCbnGPA6bt7ut1WdgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BMWIYwldK7ngUebqAchEjJHgnKUQ0ZcOxP4YurwvO44cQdXSPvDVsw>
 <xmx:BMWIYy13nJs_WRwGpehymofYE-MYIwN68t98RJY4t5A1d0yeII3Cxg>
 <xmx:BMWIY3vIEznS1SCgeNmp_pSxlhqszELlXUSeOCqbTfRDoOLthHCwvA>
 <xmx:BMWIY_3rcvDo7_AaAbrcoSnVWcsKHv7TZtzZ2fQxX6RD7USX-KxjEw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:15:14 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:46 +0100
Subject: [PATCH v3 15/20] drm/vc4: crtc: Make encoder lookup helper public
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221123-rpi-kunit-tests-v3-15-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=5RCNFvFyyWlLaGm7Yfw8HK8YEA+rYifInFFZfiFrkV4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzTuVE93ZVqdckBi0sqHPOsEGRa9zObbuXPZnQlXV92/
 lHRWrKOUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATKa1iZFjmx1mbx+OzeXZjo53K2l
 DfdbfV6ya/YlzZs7Jg5j4FjpkMv5hvTp3JEjI70tOg50Zgep7ThRWXHaeJck8TUghaybJnOQsA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: David Gow <davidgow@google.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maíra Canal <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, Maíra Canal <mairacanal@riseup.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need a function that looks up an encoder by its vc4_encoder_type.
Such a function is already present in the CRTC code, so let's make it
public so that we can reuse it in the unit tests.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 17 +----------------
 drivers/gpu/drm/vc4/vc4_drv.h  | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 5f7f50add46e..195d2b61839d 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -486,21 +486,6 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 	return 0;
 }
 
-static struct drm_encoder *vc4_crtc_get_encoder_by_type(struct drm_crtc *crtc,
-							enum vc4_encoder_type type)
-{
-	struct drm_encoder *encoder;
-
-	drm_for_each_encoder(encoder, crtc->dev) {
-		struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
-
-		if (vc4_encoder->type == type)
-			return encoder;
-	}
-
-	return NULL;
-}
-
 int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 {
 	struct drm_device *drm = crtc->dev;
@@ -536,7 +521,7 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 
 	pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
 	encoder_type = pv_data->encoder_types[encoder_sel];
-	encoder = vc4_crtc_get_encoder_by_type(crtc, encoder_type);
+	encoder = vc4_find_encoder_by_type(drm, encoder_type);
 	if (WARN_ON(!encoder))
 		return 0;
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index cd2002fff115..54352db48476 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -495,6 +495,22 @@ to_vc4_encoder(const struct drm_encoder *encoder)
 	return container_of(encoder, struct vc4_encoder, base);
 }
 
+static inline
+struct drm_encoder *vc4_find_encoder_by_type(struct drm_device *drm,
+					     enum vc4_encoder_type type)
+{
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder(encoder, drm) {
+		struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
+
+		if (vc4_encoder->type == type)
+			return encoder;
+	}
+
+	return NULL;
+}
+
 struct vc4_crtc_data {
 	const char *name;
 

-- 
b4 0.10.1
