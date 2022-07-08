Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF9556B6AC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615DF113894;
	Fri,  8 Jul 2022 09:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F758113894
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:59 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id EE06D32009CA;
 Fri,  8 Jul 2022 05:58:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274337; x=1657360737; bh=cH
 uWzYUQ8nCJ5tK48ywWdmoVf+uzGC8mGuUeoo/mkgQ=; b=XXyUkom+BsFEOyVDa8
 jMARIFzLXxmQupxoYH09c7VnuwaNUdsNHE8tJy1Lc1V/u7Typ6ee1QYRTEQap1uc
 c+La79YZEJLnbq/ZlziK1hq42NGtXfXsTP1HPzf1XHWiW3rPEPOX1sSwz3DqaGu1
 wG6pMWBdRJlqUs8lmNXUN9vpFEAOtJT4it8hxBek8JEYEY5Uwp3cwgKL/pvC9KLE
 U56jFVC754yfDOAs3cLmHEOylp6P4VanjZi2J2Jfp715CQtWOpP0Np2AMivzlCiv
 cC1HT/ZXo3GlRQMic+K/d2ytAZpBYZ2MWIKFVYN+5MjPN6AzaO2bCGtX4bN5DSUR
 kgmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274337; x=1657360737; bh=cHuWzYUQ8nCJ5
 tK48ywWdmoVf+uzGC8mGuUeoo/mkgQ=; b=Xwl2THmHNO6S43d15uspXQVRkbKV5
 oKeP4NZV5oD1AG4Xr62Ma2hBdMkFNlqxSARVpK82mz5jhHYoUIwSFvGQgOP2wtcZ
 ++K44DYbaKz/zbjf7nW1SD3jG5Mhs1iMyIPwohzGbGMgyGvYsGfERz6JEwjiRZa2
 jfrVhGmq8ZoosFyYyWeRsUJOBicSq2kSakALDADsNSv0jfWsnF2jh4avIlN3HTub
 ajhc+vZAGNIDTyF5VOAm8OmTyXkRu+WVpEw5d2CyEyYHLqfLE8VyZSjgVqTHcWCf
 wXqJx5zFzNvEzkoRU4JWM4m7seaROgNQoDQ/l5BRDx+gb3CuLDIbyiQOg==
X-ME-Sender: <xms:4f_HYk9aGiChijhkuK5iEdNsmUEdV9TWBFCXtlRrCMA5U6RZ3gVT6w>
 <xme:4f_HYsuJJWNEZPoe4tB52kW1iCKmJUxppKirPrlaPIBwpkeU266Qpg1NnJ8UbTH3a
 ZuDQeIahaHiAqK82lY>
X-ME-Received: <xmr:4f_HYqBlTPm1eGcVJyCpqUu4r6trsDS-HtE-zinslquoEUl0p27dUxCF_ljCFkF2FMexs2yHTzA5N_NkjBO9d8CIRXLSWIfz3pTknyM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4f_HYkdxOH2WQ66dJgYW3_J1jkY6Cles3mP4xtH37Q-_Yn5CJFqSTg>
 <xmx:4f_HYpPJhUKNprveTEYNZ9N86YWJtPbq7nyxUbBiIochMdNnyoVKTA>
 <xmx:4f_HYumBe1Qhrk-Kn0zDfOlF9hcCuQNNHEHf0umtoQFc0eDUheYlmw>
 <xmx:4f_HYuriM91nRInMs15S8PA5V8krw9Gc6-6J9wOPhJKIJ9ae4hZeUw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 36/69] drm/vc4: dsi: Switch to devm_pm_runtime_enable
Date: Fri,  8 Jul 2022 11:56:34 +0200
Message-Id: <20220708095707.257937-37-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 4f5bdb9a328b..52c3215fef49 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1729,6 +1729,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
 	if (ret)
 		return ret;
@@ -1741,8 +1745,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
 
-	pm_runtime_enable(dev);
-
 	return 0;
 }
 
@@ -1752,8 +1754,6 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dsi->encoder.base;
 
-	pm_runtime_disable(dev);
-
 	/*
 	 * Restore the bridge_chain so the bridge detach procedure can happen
 	 * normally.
-- 
2.36.1

