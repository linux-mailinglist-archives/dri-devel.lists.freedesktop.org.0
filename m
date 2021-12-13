Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF04723C0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F68310E66A;
	Mon, 13 Dec 2021 09:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD40310E643
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:25:19 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 970522B0014C;
 Mon, 13 Dec 2021 04:25:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 13 Dec 2021 04:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=yQw9DXa8mMxZk
 wpFz13lFKHWrNaJJt0CezYCd2GiA6o=; b=d2GPi9d0aM+UzxZ7JlmT/9l7uvNSx
 1e5gI6Jfma7IYxImjXP7Ssaf1DVsC2ZMWWYk6GtWEz8kY/wRAwy0sDycong/7EQr
 kJp/pifgZTHfqH9h3zSQzWIki749RgP2SlzVhbo31l8XLRSYmIQsI1UrBhxcQ/XZ
 J4s0Ra5D5DyKonnMs+L4Ks5VTbe3D3U48KMqVf13Ovhv2oR7u6Mj3fcuDMlkZnU4
 PY3ZIUMwmgACnQHELaVnUT/dfAg8/CWlWmHJcIR6Lyilg1qv+WwASyDFA8Leo56z
 NaoSfsaXg5IpJUzbxjXpODG9MEKVYxtkWzCpzd6rsZdrGObzRdwN01JTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=yQw9DXa8mMxZkwpFz13lFKHWrNaJJt0CezYCd2GiA6o=; b=MtB+R0Jb
 PVc1ViZSf5qy5sTcgy071EkcAD6O8c8qed8sQFDscCV/6bVKKBri6bMLWX+hviF6
 nhWaLQK84MkdMzGsUKO1KJnAEdkQVzmSsFIM4LrLS5enP24GLNhzOvBCrXg7P73K
 JUZFMmqxw1HE164C5slJCxajITMlLkltJV9sL1USoiBvLL0h8/OYxJ6nSTklP0h2
 N8Ht3TZUe/1KLDKlP9mcLQBipLNDXF7ToZVCelR8luldK4EQ973Guz11Woexk3Fi
 OWOJ4PRGT+t8TNA9jTbwqdJ+R4QjwKWc334xPKRI25JM+/rnZ66Alo1GynfuX2Im
 3pzUWXRFEzU4VA==
X-ME-Sender: <xms:exG3YdDxlCR-TDfj80Fypjlp9y6QPRh9LQlDVJ1gfjwlNrmdsT1qZA>
 <xme:exG3YbjxYfiyaTPumpZa3isGdGZb2YC4PzJEhDwnAXRBHPts_Tv-tyi2EJ5qPMqZH
 1WFfxhiOXPdhzr-9WE>
X-ME-Received: <xmr:exG3YYmT3x2xEvP0wBx_Nzd0MXBErF3s3nsTLvqm9qyPddOySFpxVXr8MyFLf45OyafljsYoGur3e2mk1D3UvXydYPzkCKZYGW5V6Lgq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:exG3YXxT7qs80V2XDeFUOjg-hjOCfMRTZsShP2mSboe4opV8RUrogw>
 <xmx:exG3YSS4Dg70kK6je80CPy0W6CWiUtEDFZUkFVVL1Ef2ccn-3_PByw>
 <xmx:exG3YaZby6__rP2ThlxeL5QaF6tkp-yCszXOk3FuunxSupYaqg6KIw>
 <xmx:fBG3YTLJITCbhZtZSM-IEvVKCgl6RfaSkiw5TZrjfNVwhVYWK4lpodrgd6A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 04:25:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Subject: [PATCH v3 2/3] drm/vc4: Remove conflicting framebuffers before
 callind bind_all
Date: Mon, 13 Dec 2021 10:25:02 +0100
Message-Id: <20211213092503.57379-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213092503.57379-1-maxime@cerno.tech>
References: <20211213092503.57379-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bind hooks will modify their controller registers, so simplefb is
going to be unusable anyway. Let's avoid any transient state where it
could still be in the system but no longer functionnal.

Acked-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 16abc3a3d601..8ab89f805826 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -251,6 +251,10 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
+	if (ret)
+		return ret;
+
 	ret = component_bind_all(dev, drm);
 	if (ret)
 		return ret;
@@ -259,10 +263,6 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		goto unbind_all;
 
-	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
-	if (ret)
-		goto unbind_all;
-
 	ret = vc4_kms_load(drm);
 	if (ret < 0)
 		goto unbind_all;
-- 
2.33.1

