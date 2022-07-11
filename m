Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D16A570929
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5565390339;
	Mon, 11 Jul 2022 17:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1F790319
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:45 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C3B85C015C;
 Mon, 11 Jul 2022 13:40:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561244; x=1657647644; bh=cH
 uWzYUQ8nCJ5tK48ywWdmoVf+uzGC8mGuUeoo/mkgQ=; b=v0Dx5OYU5oWzOKlc4C
 5JFyXT4Pg5A+XiZ8bvxSoxxpMO1s21laFPUuyjTo/SY80RmKlTAEUYnoeRWXYJqL
 VwaW0F2aZWZFd74NpIHz2LO/rSRbUiIDsI57ZBl/U/Wr47P90ezRPjSZB8WAPUWS
 Q82OvedLfdJHleyELVk1pSTlDcUV1L16whovaZYOwPiu1yX2xSJRIv78EN4t9VOd
 jJEVo1B4ds5McyZJYLQ3oG8q3zYsetPlvWmJONGrt9btFGdroAk02OaWdluzGrGg
 8a1ywURy0O5bzxaU9N18JhzyBWFHTjHatKGrAU5qxCWyVNuuE13+jAJqIhOz6Ui4
 D+rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561244; x=1657647644; bh=cHuWzYUQ8nCJ5
 tK48ywWdmoVf+uzGC8mGuUeoo/mkgQ=; b=DkpfZ3MjxSGo4Mc4dnXTsSwHgjOfA
 EMVa8StbdrrHSGSpwC3igIwQMm6zYiTpti3BdEQnspGMkSh5/rV8DwKwyaj/45oY
 uxekyjino2Efl4naqRBiFRVNwU9E6G9V7IzCODLJUtzbB87wlQHoU1e/WCIMYPNQ
 OR3kArg5k3oeEcnDayWZiZg/Sm3q2CbhNJwFQHudbCkrimPA4F97pLxwmq/NeVFD
 TRVxbh5biK85vXTPFUkwoui9OkaFBrU1xNS0nLPNJncJEga2Pwfd3nxFnA3XNBjt
 yzVuauT0FlhXamln7v5WCjOf/wUsg+AG0pjodPen25YLPB+0UXApavT5A==
X-ME-Sender: <xms:nGDMYsTGbfZ7rKNYC5_TjVdOvtsVxbrjafAozN__PT7jZch6ZSUXYQ>
 <xme:nGDMYpzV9wmup6LcuC8cYvkhzqAjBXd16vIgPqcQFGqsTJJBdYNRAzqdf0bRTmsAU
 VQcdJhY-glb-AgJSW8>
X-ME-Received: <xmr:nGDMYp1zoBPUN21YrZLZfNZR9nBxqWv0AnfJt6M7QKVXPz95xGoiGJbTpAyQWdy0NPj1TdZ-quOCRvQv2MwLEHbPj2YbJAZ0q7eQLNo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:nGDMYgC0z4K7P5c49DN8RQIUZ77kXiPZEL83vW6XdfLNhENFSYi71Q>
 <xmx:nGDMYlhoa3roWEf7XAoW6ExDpmTDvZqZ-yXS65jNG7uIzFvGBfJ58Q>
 <xmx:nGDMYsoZgaE-Ie_9WQpbHWmOeU4C3Psfk5wbOpzCej6BYF1RTMM5vg>
 <xmx:nGDMYlcgAJruEycjbUpmvdCKydKk_NnC6BozyuRe8AfhEuNbrqQAEA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 36/69] drm/vc4: dsi: Switch to devm_pm_runtime_enable
Date: Mon, 11 Jul 2022 19:39:06 +0200
Message-Id: <20220711173939.1132294-37-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

