Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC20570948
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D9B90399;
	Mon, 11 Jul 2022 17:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1995B9032F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:28 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 74E925C0102;
 Mon, 11 Jul 2022 13:41:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561287; x=1657647687; bh=tE
 aXilarIFHHS60UFntONrpyfxEYqsAW0nps9Ev5REY=; b=fGer+JfsmD8MVXJVfT
 Tf59OPLMCh1wirhILgQEUzluDJDmnPIEBklM0ieCY/+dWP/KNz50vJgJ7j6cuWuj
 SuoJcaKTc+DSCXloDQ/1qg0rlBsdywKjzhjGMsWd4qRZzYlJLAj5V5ihRz3lJpUw
 Qe0vUlU3NBPzudh8XPBPAtezDeGgyF4T76EutZEwQ059Zjq34nCDwURgUya21WhS
 7A6xAS1rxQANqO4Y61hrD+QwmvQPY1dk0GTu/PZshs3BsuUlqkM/VDygTGP/VdPc
 pA0NVC0R3QZbiRxerz1Z8G4OYTCkJ7cQtO3NOGLa5zr2otrhyzpDz6ongwgO39+F
 bvcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561287; x=1657647687; bh=tEaXilarIFHHS
 60UFntONrpyfxEYqsAW0nps9Ev5REY=; b=S9vg9OYV3TBNPV063rp/U9GzAIuUB
 2qki9EOkeVfj8NlWoT9bBMIAHPMuFhPpQ54IelPbP0SUuccridSe2AKfYJpAf3Ns
 plKeOFb0CGh5Kal5XAlPLmdKuPHDqSvoFHdNfnsLBVdT6XtJ9j+g6IplLLyNAGzd
 Yacu/mJTwt4EPwKAihNZoHZh5ZcMBGUjrJAIvDeGNUmKoQ3Uy893dwRsOfQSUdM/
 dN8I+qSF/COdp6MHf41CoccjCG9KJsCDrzLPcFLM1kb2fJNMMCP8Bpvh7ALUI/wH
 ijZKr9R8EZ4wHEmbt6f+zdEasuFHBYbIzvL2SkxX1dt8I2jz8FqmXbNag==
X-ME-Sender: <xms:xmDMYhcEt7ymeQNuv3WJvBUNwkki-G4UPynte83PF-4Gf_JgY60Bwg>
 <xme:xmDMYvODw8ayPRZRbZrMLY_2PkubZeZPfS4N-NqSlTJktDuFQnlRveWYBnE3dFiZ2
 gF35Sn87lLrG37289U>
X-ME-Received: <xmr:xmDMYqjYL58Go9LwauobrfNtDnIiaCTdqnaoVh8DvVlTt-0XMRkd5q6YTSzaZ6kmmBmBnBReyGJ5ZAf2xwhXSr5u5fuxIpwSraEydlI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepudeknecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xmDMYq-byXMZLtYtZCmrMs3k10zQ0a4XLERA8XnepTSE9dp4Iu6LIA>
 <xmx:xmDMYttHTvJuBLWct3LMM6kumv6AE1bruP7eYA_nUMSc1qSnMucArg>
 <xmx:xmDMYpH2rSiQtP6Vg4C0PCq6PzpHV5dzmFM1Ja_koKdJ6p4XB5Wfww>
 <xmx:x2DMYnJn81Tmfej2NYfC7AzBW17gKF4u4dD1EuBEANMuIyOnBiwyTQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 61/69] drm/vc4: vec: Switch to devm_pm_runtime_enable
Date: Mon, 11 Jul 2022 19:39:31 +0200
Message-Id: <20220711173939.1132294-62-maxime@cerno.tech>
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

