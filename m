Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23C57092D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3989033C;
	Mon, 11 Jul 2022 17:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1FD9032F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C89F85C006F;
 Mon, 11 Jul 2022 13:41:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 11 Jul 2022 13:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561264; x=1657647664; bh=/e
 xfFqPWj/EkuC/CZxAppwFZ0KuD3O+5SRTeEzYTVLs=; b=eYWbPUjKgyRdXGIQ0c
 JuERDtrJNW63NEbO0DCYx8izOIuYTCsrl370Ns//ed7CLvsfqRkCtpD+0Eh1SBCR
 w3K7/8OMXWPh2MTMqh4dldjhTHWsIFqPbKVMGX+lTzi5hJWIuQfNLbwTyX6k+RDK
 q4eIUBdN4QsxNbkg3L5qmHmj/OjJXvuk5ukXVGXAORdhmyowCIITIEskSO8RyKW2
 9/IlmFt+ILOeaeiqE6t3zsyoJdVu5Dm2HKgRG1q9Ad4CzgQws7vScBMD1YrgEUqv
 zWEnQwZgXZTTKC608sq6A5eD3BJNzG4rRCFeixiCEucPwV7gasZsXS/EPSMnhFmo
 6r/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561264; x=1657647664; bh=/exfFqPWj/Eku
 C/CZxAppwFZ0KuD3O+5SRTeEzYTVLs=; b=0P2kBLU1eq3Wdt7u/m3Zq57yH6RQA
 uAbkzG0sMEiHa+iYBrWiWvS4RCV/hDV46jb6oAHPZL7aovZxqTRPrIigpWAF26pG
 tEKC2CbPg0+NA3iLLMyCTR2VBVBPJPQQwWjrVbysED/N7I2qSfJAPbJS6LcZx7b0
 SPDxo3sULcmYpE6yVCpVwDJSpgJNq0VRVp+q/Ngp0eQnTggjIowmHEWBd6AHGFuU
 nJ9asZeCB7/fFdUKPZ1GbOzmUNkETUdxFDdZvZOFhvoNAI7xr84wPHPybelXFLmT
 MNiKuCsJ3oEWZV1uU1lBEuadA/YDg/v2ZH8QBPzYcvBN6wJGw7K4o25rQ==
X-ME-Sender: <xms:sGDMYkITYhGoDYzuKDgJcJof7CGWRBgqjYVoGa4bKMgDFLMsjfOluQ>
 <xme:sGDMYkKb3cgjkLkO86nf9byDR_hk0lKKKGwl35QJKXS--mZmKLxpMAFB_Bys7Yac6
 W_0KnLjsEpyDMAlhAI>
X-ME-Received: <xmr:sGDMYku_EPQDBDUJW9KDRTSOCnb9Osgv9Z2jcORjwRnqn00KvC0lo55pa7y5Hdy_5ftHqFtRIgi44fmva5xOVW6X-318jTYDCB5aiOM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sGDMYhZBBp97sgdH43FkK5il4BXB6b1exFfLGnM6iUBfCGbGKf6gAg>
 <xmx:sGDMYrY-r6ShSFy-eP42slfA8SsP4_7e4aScFNc0FpFKRMg_OHaKAg>
 <xmx:sGDMYtDTo7XlpzL_q8AULPWWkQIQ7zdb7ZHgoI4EMKS0DR4MpAhJYQ>
 <xmx:sGDMYqX8C2sr9ICvZP7s4Glum5Ov-NzG3qE9v053ug3BBX5CxDCsdw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 48/69] drm/vc4: hdmi: Switch to devm_pm_runtime_enable
Date: Mon, 11 Jul 2022 19:39:18 +0200
Message-Id: <20220711173939.1132294-49-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 82a0d6a906a4..52106ad54efc 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3315,7 +3315,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			vc4_hdmi->disable_4kp60 = true;
 	}
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	/*
 	 *  We need to have the device powered up at this point to call
@@ -3323,7 +3325,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	 */
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_disable_runtime_pm;
+		return ret;
 
 	if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
 	     of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1")) &&
@@ -3368,21 +3370,12 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
-err_disable_runtime_pm:
-	pm_runtime_disable(dev);
 
 	return ret;
 }
 
-static void vc4_hdmi_unbind(struct device *dev, struct device *master,
-			    void *data)
-{
-	pm_runtime_disable(dev);
-}
-
 static const struct component_ops vc4_hdmi_ops = {
 	.bind   = vc4_hdmi_bind,
-	.unbind = vc4_hdmi_unbind,
 };
 
 static int vc4_hdmi_dev_probe(struct platform_device *pdev)
-- 
2.36.1

