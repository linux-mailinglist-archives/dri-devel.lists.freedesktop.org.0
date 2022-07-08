Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FCD56B6DD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56051138B5;
	Fri,  8 Jul 2022 09:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A04E1138B5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2ECE332009D0;
 Fri,  8 Jul 2022 05:59:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274375; x=1657360775; bh=sb
 a5PzDP+J8k8Lo2f5odJ2lk/8LYYlMABKNOH5ANJWw=; b=jTngp+4uZXWC4sF5kD
 XsTNCU9BIGmoIde84glykcHD9brwlgG7N5+lDCntPbf9+NjUDj8sxuwgBVB4habJ
 M04YZPMQwH1BaOzjKOnO06fOPklMBpRlAEGoHlzLauYfJV14dT8aICGgkkZN8XEo
 PpwQfhYKl/W1LS9uyc3V+Tn6qECaYRCFP0jWOpOzu6l7LZZpGBuCm2ahli45ZL9Y
 lUFSOFxp4NWwwbJjdm5zt96AnLNv6wEFbFD2H8nNq2sgzf8GAU2KBlgEam3vqqda
 aS1lN16Rl17hVMN//aUKI5Hnov7Q5Rfg8ifMT9tfM6UvLkIrJaa+hsAjWnMSuWyl
 WS0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274375; x=1657360775; bh=sba5PzDP+J8k8
 Lo2f5odJ2lk/8LYYlMABKNOH5ANJWw=; b=gyUSupM9phYA2dByFtJP5CYLlKNXH
 P6NYh954TDLBj3XHYLiaPrleNrLPOapBt+Ub+08dXwpny809cIqtncCoQZ5pvXI9
 E9VCiQnpMyP3k0t4Mn0Lj738/ahHuvHxlQd1hfGg6NP6SzEnbSmDFmCgOPO1Q7jf
 Ql97yGsC12+kbWF3RmRbcxnwN+NH0Ev+oHfKuyOEEBYCLfSllLZoyFQ98PUKXUul
 3aW3HcRuK2F/BkVxxYyjxnT9DvAh9YKHu7Aub2lsdWYB28STqtOt6cliQrytWqTW
 VTuVmHaa+5NkPF7pTJr5CcFm6Xw41ZtTckeHqqvi7fjhESJ/JpaYC2hpA==
X-ME-Sender: <xms:BwDIYg-XapRe8RzN_yIiGttub9t4WaWHrUElpMaWVO-AC4ZGf_GkHA>
 <xme:BwDIYovn44CTzUdniwPNf4H6irhA0kdD0yLd3qTrlOsDj6pjKD3lf1t3aK7R7I2zl
 RNFMLmmfcliFobCUhE>
X-ME-Received: <xmr:BwDIYmDQlJg6Kk9zZ7lMQt2zXe-8jyOB_rFa-teqH5-u6Fyj9z8V1_ynipzHtki197kqyhfPdaNsomGwXDCNI8M4zW8zcYmdj-7mNKo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BwDIYgdl9kdK6lEXB7ovOsLi9rSktVTY6mP3XwRoYSE01-XODDT2eQ>
 <xmx:BwDIYlMSZXMCrVUlVwqRgv9Istbrf8LmpPi-nmUqOkiLSPMXD_IovQ>
 <xmx:BwDIYqn76U_VI2UItiwzLZpYG1nvR30ZB4y36uGkoSUObOCJODxXBQ>
 <xmx:BwDIYqpRzIq51paBneSX3uprPqQ_AC5RagzLhLtk5-1dbjUtuEtBUA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 49/69] drm/vc4: txp: Remove vc4_dev txp pointer
Date: Fri,  8 Jul 2022 11:56:47 +0200
Message-Id: <20220708095707.257937-50-maxime@cerno.tech>
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

There's no user for that pointer so let's just get rid of it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 drivers/gpu/drm/vc4/vc4_txp.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 835d286c2802..0eb5f8a669fe 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -85,7 +85,6 @@ struct vc4_dev {
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
 	struct vc4_vec *vec;
-	struct vc4_txp *txp;
 
 	struct vc4_hang_state *hang_state;
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 448d48e7e99f..483a03a07ed2 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -469,7 +469,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_crtc *vc4_crtc;
 	struct vc4_txp *txp;
 	struct drm_crtc *crtc;
@@ -523,7 +522,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	dev_set_drvdata(dev, txp);
-	vc4->txp = txp;
 
 	vc4_debugfs_add_regset32(drm, "txp_regs", &txp->regset);
 
@@ -533,13 +531,9 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 static void vc4_txp_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_txp *txp = dev_get_drvdata(dev);
 
 	vc4_txp_connector_destroy(&txp->connector.base);
-
-	vc4->txp = NULL;
 }
 
 static const struct component_ops vc4_txp_ops = {
-- 
2.36.1

