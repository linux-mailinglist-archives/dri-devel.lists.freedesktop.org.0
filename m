Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EAB54623A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0720B11B369;
	Fri, 10 Jun 2022 09:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB58811B369
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:27 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E2A45C01B5;
 Fri, 10 Jun 2022 05:30:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853427; x=1654939827; bh=E1
 b45VUGZllQD9uYrov7Io3FFZa6r6f1LR9CT46rqsc=; b=S5JyS9vt46PPem9Wh6
 FZOkEXWPO9oIzGfux7dhkW/EUVg4kBOa/PBc980/zo0n3LQQG6ZMYFUQdyh3X5ak
 oHRenX9ZGJqzMtyTK+pFibi65jl1WX2GyhLPelSm0U1wQjtS6UP4JQpss8Dqnz6C
 fYCS4XU6E/H/CL38GdB+RGO13jr294PtTdY9AQ20TdBb9KzgpAFt0SIg8dyBYcKA
 wVo5IJZ/W+9JxIdcSDiWSm6ODI5vUoTAwhxUBYZi5gEMMoeLs1YEzMQNZQn3sASm
 KB747wQItJh9acJbuV6wc6O2dXLFMRw+58c4fLy/2/0SoPcBkC+VNGyFcZQbdl8p
 yqfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853427; x=1654939827; bh=E1b45VUGZllQD
 9uYrov7Io3FFZa6r6f1LR9CT46rqsc=; b=ZNVkyEdSlsswT2SWQjzplFf+OvIXt
 HF9Vh3MEqw4HbtlF2lmwIsnacjg/YytCEqNEFBuLuYMg4PhPx0lYA3rohL0IG2P0
 nvJUVAmIvMsNrjptaj9nw0wQ1kRfShLZ0jef9oqyGXxEnYlCvC8Mu43Svls4xXku
 9v74ICA3vHHzxPdUjwv8Ush0ZPZ97TDdBcqYHvFG1A5Jh1ee88tuUaWKc7i3F8dN
 D+gZl/Wicea9zrE96Hw0EBV0bffK5I8Gx255VNA4licfa2mfkYFvtMohG2mAxPsY
 OlQ90tZY4oTXHDwO/nSQ3k3BCZWJLJH7vo1trMO82/8epmx5k5RYW1Olw==
X-ME-Sender: <xms:Mw-jYloGlXcCMy8tpnhSgyQbR6G1ZoyrcNY9Qmyab4NHFAuLAMoGLg>
 <xme:Mw-jYnqsFv0VbetjGePEGHSZT4xI-EQkY8n_cFf87Fm-simpKRj9NkKyzOgbHddpF
 xGhayP1KRSNopyargQ>
X-ME-Received: <xmr:Mw-jYiNkdeXW9so-1b9SRcYi_GmIuNr9sDat3XdFRevHttQwWpKOly46PaxHaDkz2oLXuiyOAb2dCcKO1xPB0rrxbYXBalJ7BuqOcdI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Mw-jYg6BGhoc7ETeMGhH_do29LMLl11a9LA-reciYdQc6r0jHdFp5A>
 <xmx:Mw-jYk5LZ0a0T3h_1eEaDIHX58VEwmCDQSQCh8r7pVHcKc1qqkqhIA>
 <xmx:Mw-jYojAcVgqU0tlfkOSB8BoyosMGBDOLIciuMRCy81Y6fMaF3qcfQ>
 <xmx:Mw-jYv0Jf7SPqhhYqXFoMtzdGslAWsB3d93khVd7StV8avlfNT8O0w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 33/64] drm/vc4: dsi: Switch to devm_pm_runtime_enable
Date: Fri, 10 Jun 2022 11:28:53 +0200
Message-Id: <20220610092924.754942-34-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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

devm_pm_runtime_enable() simplifies the driver a bit since it will call
pm_runtime_disable() automatically through a device-managed action.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 282537f27b8e..741db2dce8ab 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1622,6 +1622,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
 	if (ret)
 		return ret;
@@ -1634,8 +1638,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
 
-	pm_runtime_enable(dev);
-
 	return 0;
 }
 
@@ -1645,8 +1647,6 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dsi->encoder.base;
 
-	pm_runtime_disable(dev);
-
 	/*
 	 * Restore the bridge_chain so the bridge detach procedure can happen
 	 * normally.
-- 
2.36.1

