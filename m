Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AB3554D30
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC18211333D;
	Wed, 22 Jun 2022 14:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC6111333A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BBDD2320096E;
 Wed, 22 Jun 2022 10:33:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 10:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908409; x=1655994809; bh=c+
 8BcHJj3fI9n5WgbBELzI6CS5KdRqyJ1KnN0llM8dI=; b=igHOK6lw+vSBcG82C5
 cGxr+Yo32b7WBRDI1U09mS/Ds+n1oLGST+eDqZrReg+np7hae+MHxWzDWKOhDk6E
 YuEk8FzifrL0QMup0py5ImsMAkDMPsDCdEDSxBV62M2f51qpfYNZyHIWGCb4O1QE
 QY+C5kPy8TyRFFWdUymGGhDo74Ck9tlmete3d4GM6ysdWv+2Cf2rruBmZcffRTwG
 N/blHK5AvpQKlEtseLPjhLH1Q4Ney7MxRd2/7lNCmikAcOmzfvZmKJ4ToU9YoJv7
 LSYAdplCbYpR3Qi9dhXCjkf3vPPiY+QFmox6hUdp8PaSmrAcHt1x7Bcg29MeMXE/
 hc5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908409; x=1655994809; bh=c+8BcHJj3fI9n
 5WgbBELzI6CS5KdRqyJ1KnN0llM8dI=; b=erQEBDWNjf97xOA3lU/Z0hxqRbuk9
 rpeloPwyTcUIX1+UvXh8inFcOoGvmewrjrFHT3mIm4Bwx7N2w59zgtJ5UfkeV2fc
 YiakMUMt1xvTjlKVeDCEjS/0avgOk6g1tTi4xTf9xV5g3PdufnW8teW+C9EZ8EQ0
 OaUNY3pQokLRVtJmCWVOg6nvFQa4aSrk0Vbw1i8st/j9V80llUsbVwgb1ViqWyJd
 DyqKmfi3PPOek6VqayioBJ8teO3lhDsraPPsH/hDeoMg551vPdLv0YYA/T7wGs0n
 mS0k5y1vujHOsGwVFcvXEJYLiF/M1+09C0zz9UoyufAieXBfKGjRMBKLg==
X-ME-Sender: <xms:OSizYvall1mALm5A2GqAlPadRsU8aEYuda3P7FZjLDEU7vbp0_l-zw>
 <xme:OSizYubJav-3KZndu4zZj74gZvo8YCAFY-8Yv2Cl-Chx5opL-fJhpQ5nlUbiObNLV
 SJiXw60qQUBkVHYUjw>
X-ME-Received: <xmr:OSizYh_zRD3WoKs1o9z4uHCQGZpn9f5cjikSASFNZVUZiLGlytiLTT0v1p4NlnV0v-lKMhcoNKU3RvKCIBKcZDMnyB3xfH1oETMWAEk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OSizYlrKQFCdiyJpiXP-AS3RMFO32AJ2quRUWOGOGPe1_Km6iXt1Gg>
 <xmx:OSizYqrInjRwH215P_bNHhIlBM5nSu8DjyvDqXd3DpzLu5nUXchlEQ>
 <xmx:OSizYrTIgvlz9gsPfPHft4CKDQw2QJYw8nGbDOLSTKrV9wIjkUYbfA>
 <xmx:OSizYnBMF-7g25X9DMw62j05FeVvIUmRRinlp4Ftdi-JVqxgZgH8Rw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 24/68] drm/vc4: dpi: Switch to drmm_kzalloc
Date: Wed, 22 Jun 2022 16:31:25 +0200
Message-Id: <20220622143209.600298-25-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most likely source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c88e8e397730..d1eaafb43bd1 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -244,9 +244,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_dpi *dpi;
 	int ret;
 
-	dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
+	dpi = drmm_kzalloc(drm, sizeof(*dpi), GFP_KERNEL);
 	if (!dpi)
 		return -ENOMEM;
+
 	dpi->encoder.type = VC4_ENCODER_TYPE_DPI;
 	dpi->pdev = pdev;
 	dpi->regs = vc4_ioremap_regs(pdev, 0);
-- 
2.36.1

