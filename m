Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53933560035
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CFE14A67B;
	Wed, 29 Jun 2022 12:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70D714A66E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9F6813200972;
 Wed, 29 Jun 2022 08:38:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506301; x=1656592701; bh=0U
 7m7dFeMiHvvFRtrcuCO/zoKMRd50O1nZdB2Ne2lqM=; b=PQxnkCktP77xvcQuEk
 GaEoOal/J3D+aQMvLUJ1QR/Crqoa+H2jEwqZT872MDxnV2LGRKtDMpghrR9bREyR
 iCogId1N02sKZKuK+XGM5JK8TawQfQ2u2RD55R7GMsaTt3QQsO0GRQpOB9oqL50f
 S3jXEH/ZalpI1VwCxUDYno2LMswqnedrc/iIsG1S02S4SNpFeYf2szOXPS8ulBBC
 exV6sbq1BuBcnzTndzhgYnXuxdwv1Ni3YkN8Hq81hnmQZ4HhcqidhQAB3XFGh3GV
 3x2XCAO5ICNWIsA9OFzeuWS6HTZiLQkYk4/m6+5BGC93p+gM+VqkflHHd97KCXEn
 FJPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506301; x=1656592701; bh=0U7m7dFeMiHvv
 FRtrcuCO/zoKMRd50O1nZdB2Ne2lqM=; b=HAfKm1s9/FxTXNNbEk2ZNHFvmy9ib
 i5LQaDKNBob5O7V23UeNqT6Y637kbSg/3tuCknlvxHPOMFQTSuaXh8+o0Y/Iyxdz
 onSjDRJz3IEQQpgrClB7/MtIDnkjKKQogk4weh5eAsMKGu7c/pP3vIfXxbj+j29f
 NA9NqKlebwgbYbvbukBNwsKmAniv/bLPKs3r3MWgikmTt85V2LRlehRaM/yzPlgt
 oOXmyNnczXIHrKngcAycBROCil6YCO22ZoxzaZvJmBAxBwwuay4tYCEJLlxJ6r71
 GN6vdnkPXgu8iSjT1u09wwoqiPXorHJl9odLsisQGmsEft2vyzuo3C2pg==
X-ME-Sender: <xms:vEe8YuDwAjtqCv3oMhQ-ME1p4LZFhG0Ng1ZUbCfjcr_ylJtMFng4Zg>
 <xme:vEe8YojrH1uNFrNIZ0JRj-HOEKkO_63kZy1JewTbBvqPR6NOx749vBhhFvHjkYjXx
 Z5h6ZguyhaCFOS_gA8>
X-ME-Received: <xmr:vEe8YhnR84I_2p1Sfd_pMsv0kiHPVo7irercmSobLdZBcKeux8kFIscoW_4qT7KosRctwsa6itYMgOCDv7P-_qkJugi-0GUr6Glr6DY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vUe8Yszpm4X8g-vaUXTPcU85FrUTXJkWYW_GxpN9zE_hJDtmnbQWGg>
 <xmx:vUe8YjSYw6Oa5Ebq-kuMb7fQq9o34b0vBLMJ8brkmO8qXn9yNhHBnQ>
 <xmx:vUe8YnYi3V2jLmYB_CWO_cyO66qMEXiGoWB9dSB8OQhGNBfYapQjGQ>
 <xmx:vUe8YhPFCTi5DB-FCfUn1rNTkW9dlqhmM0bMXD5WGvO-isf0kxWabA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 63/71] drm/vc4: vec: Switch to devm_pm_runtime_enable
Date: Wed, 29 Jun 2022 14:35:02 +0200
Message-Id: <20220629123510.1915022-64-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_vec.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index df6adef96050..d356ffa52866 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -583,42 +583,32 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = drmm_encoder_init(drm, &vec->encoder.base,
 				NULL,
 				DRM_MODE_ENCODER_TVDAC,
 				NULL);
 	if (ret)
-		goto err_put_runtime_pm;
+		return ret;
 
 	drm_encoder_helper_add(&vec->encoder.base, &vc4_vec_encoder_helper_funcs);
 
 	ret = vc4_vec_connector_init(drm, vec);
 	if (ret)
-		goto err_put_runtime_pm;
+		return ret;
 
 	dev_set_drvdata(dev, vec);
 
 	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
 
 	return 0;
-
-err_put_runtime_pm:
-	pm_runtime_disable(dev);
-
-	return ret;
-}
-
-static void vc4_vec_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	pm_runtime_disable(dev);
 }
 
 static const struct component_ops vc4_vec_ops = {
 	.bind   = vc4_vec_bind,
-	.unbind = vc4_vec_unbind,
 };
 
 static int vc4_vec_dev_probe(struct platform_device *pdev)
-- 
2.36.1

