Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3FB57094A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2FB90391;
	Mon, 11 Jul 2022 17:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280289034A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 825E55C0106;
 Mon, 11 Jul 2022 13:41:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561281; x=1657647681; bh=3Q
 s37bYZ6eR+ve910boEUq7N/RZ+c47LJR6JvZc1H3Y=; b=UgLdfl6ISWlU6UQexi
 3uLXAt8qMf8qAGSKXwx/dZ5HYH4dxiijhDV65hWtib5vE28LPe7ASPF4r2FJFamo
 BYkPyeopBfbPT2Sr0O0ZnaqE7Mju1NjKQ6VwOGQkCzr/XvWpfd26oTshulwJgTVm
 WrM2Mp3ejEyYVi9h37QbDvFnnkduwm3veVAf5EQanKzophrCiigjcT2MWQBpBdMG
 f7yIO2w5biGbKQCoRJ9F1XvceUO63KQFSQAdvCjQXvT/jee9pc1Akac4ChL+RCzA
 cG+zw9Ki7AIgswP4PKpMyia9BIuVRFK1rpGX0GI8E/DcsocwHVPge2D6+PwQKRQs
 sWow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561281; x=1657647681; bh=3Qs37bYZ6eR+v
 e910boEUq7N/RZ+c47LJR6JvZc1H3Y=; b=IUrL+lj2bNiaN1XPcJi4+Q0FTqJhO
 IwiU0hhu8yue9Drybwm3XRCMu+BS5NwBGBEaAujOUQ3mB0Xv6QvJsAMKhCg93kY9
 X0rXkPqNsXbjXnsNCVKQpC/xjrDPthgQzH+Ij29YmDArS198qdkP/7VwYYTepwBE
 h6dNAzm9q5he/o034NUUKt4EbdfCysj1i4KtwUwdnvIyysfE2V+IlcS0l8FyGxD8
 472YMg/MRZMIQaj6b03M+5Pn+57zz70LFJN2PmWcV15jWYX27ggPyVHSoXLnZG2/
 3S+K+55iGb4OXQOYPzfJa4o9SRM/HpDpS7dnpnKTnzsiTpF3tqzMLb23Q==
X-ME-Sender: <xms:wWDMYh16TOGxscQwrtDs-ou9xqhzCQ0xKsRur4aeRMqufjw_QondKw>
 <xme:wWDMYoEo-KM8M74QsrgphK466JSDDYkHiNWiMOuzbqnNuTH2mNVJtwGpKZwjuQbw9
 AdeM0soMe2FByNAEgo>
X-ME-Received: <xmr:wWDMYh59WfFfh05SC4o-ScXA1VE9PX8Uye8QCTZIh7KjCA7POfjICMD-Ux5YHtA5cQe-Hm3h8quJ_hPsbLKEFPh4HjCDwYIGwAa0kiI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wWDMYu2lDsqeEDqrMQvsO47JwIooK-4PU_0y9mS3ntpHXyANtHxX_g>
 <xmx:wWDMYkFYD-rNCsnkXtyUKc5WJunQ6whNqe_bGGidpqXy6GFX1CFRbQ>
 <xmx:wWDMYv-VpazQ1WykH0eZ85uqCmwxboJZfnjaIN6DF7fOaVPgGvrVgQ>
 <xmx:wWDMYgjCW67T_sL0qJYSq3oEjMTL4TXdwyTN0NM644hHhJuCaz3YFw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 58/69] drm/vc4: vec: Switch to DRM-managed encoder
 initialization
Date: Mon, 11 Jul 2022 19:39:28 +0200
Message-Id: <20220711173939.1132294-59-maxime@cerno.tech>
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

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 2e9dc09fc6f0..518b66bcc0b5 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -528,12 +528,18 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_enable(dev);
 
-	drm_simple_encoder_init(drm, &vec->encoder.base, DRM_MODE_ENCODER_TVDAC);
+	ret = drmm_encoder_init(drm, &vec->encoder.base,
+				NULL,
+				DRM_MODE_ENCODER_TVDAC,
+				NULL);
+	if (ret)
+		goto err_put_runtime_pm;
+
 	drm_encoder_helper_add(&vec->encoder.base, &vc4_vec_encoder_helper_funcs);
 
 	ret = vc4_vec_connector_init(drm, vec);
 	if (ret)
-		goto err_destroy_encoder;
+		goto err_put_runtime_pm;
 
 	dev_set_drvdata(dev, vec);
 
@@ -541,8 +547,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_destroy_encoder:
-	drm_encoder_cleanup(&vec->encoder.base);
+err_put_runtime_pm:
 	pm_runtime_disable(dev);
 
 	return ret;
@@ -554,7 +559,6 @@ static void vc4_vec_unbind(struct device *dev, struct device *master,
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
 	drm_connector_cleanup(&vec->connector);
-	drm_encoder_cleanup(&vec->encoder.base);
 	pm_runtime_disable(dev);
 }
 
-- 
2.36.1

