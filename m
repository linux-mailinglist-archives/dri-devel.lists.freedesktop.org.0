Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6921256B6C5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6171E10F718;
	Fri,  8 Jul 2022 10:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1EE1138D2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:13 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 05E3032009FC;
 Fri,  8 Jul 2022 06:00:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 08 Jul 2022 06:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274411; x=1657360811; bh=tE
 aXilarIFHHS60UFntONrpyfxEYqsAW0nps9Ev5REY=; b=mcDq4DYkzYL9vFa9b4
 nqM5tL6NH6/XCE93FHa4dlq3xslDpk2zKqGrsfbap7TvjH4ydxYwdBrBiAy743qS
 R7laxcE6FDqq0cArbYLRGTzqAJxOxUdrfmVHFheCBo6maQ8OjZEeujaCLson0oTO
 wO/Px9MjxXw67wEGC1wcqzSkKs3mrwO9FgKMB1jq/AElbX9mRzhUL06uiXsixPQ4
 alPNk0CaP06zRR08DbcBJGhdsvHeqoz8nILo9ZYETUq6gKmN1iiC5qC3gAriqqsN
 CGOJTxKkTvC9S6L+F2Va2uong+tPISrkpKZp0MPHqcVi+pygKUKrLkiWAzuBnuSu
 aKOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274411; x=1657360811; bh=tEaXilarIFHHS
 60UFntONrpyfxEYqsAW0nps9Ev5REY=; b=NY/FXr0xbn0YNVmpLn26KimrEXPXm
 2NnKUIz7vcyw4wmmDy4+jpM72xKITUgqDs16P0jIBdEvl4oH21JgpipUzMDokG+I
 VNuy/Tk6xvw8++rMyIB7xou6rVYXwJE/xrYW4MSot6SGvCSjGzmwMlnF0BU6Z+Ju
 D74Abin1yLqFbiVfcYVdHOAcBncipaYmf9zY3Kp1YdU+jZTxvBWrVLurzjWMlKjT
 +07/MyvOMwyFaDxkyGZftHjgv+uQD+wkYqHGqF03Rn5isRaBsuu5WbIsXfP863AF
 Axk4Neu0rww4bKWPPzUU1xpuMGgYx5lhl+OFT3eusydXUr63oC/inj8xg==
X-ME-Sender: <xms:KwDIYuk8brSgJ_dUqkEdTFDRFcnn8pSTixNLscTxqvXoOWSLsEeghQ>
 <xme:KwDIYl1ha1qxw5cT8E7C2E7YxPc5I4wWWR7k6xv91-B-r545srPYsmABPlumlix_K
 XiHBCiU_57nKxCR09E>
X-ME-Received: <xmr:KwDIYspaTlgaZ8Mbn-jY44utTdRm0nsNaqSVA1BKhYE8R5iL8u8Q3ChFgMy_e8eqgyXjyRTJrwb0QF_bG54K-EAPaftIcDhXFgUk4ok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KwDIYimQCSKsY-XFzUEuwMfPCAbpiGANOoSh1IFFNW1rD2WXATOvWQ>
 <xmx:KwDIYs37psVg8GSFt99k-yuvcfnPokTeAcMvczuElc8xy0g__rj9nQ>
 <xmx:KwDIYpsANpYY4jOLpICOYr4BIe91nAHLXqItdqLlRmcZBJOIPvj6Fg>
 <xmx:KwDIYvTv9XQBx025qW_pEHR_lu-raGN9-9sxG9DgfGBZcBkRkuwolQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 06:00:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 61/69] drm/vc4: vec: Switch to devm_pm_runtime_enable
Date: Fri,  8 Jul 2022 11:56:59 +0200
Message-Id: <20220708095707.257937-62-maxime@cerno.tech>
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

