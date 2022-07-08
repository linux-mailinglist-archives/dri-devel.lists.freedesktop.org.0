Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8FC56B6D7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AA61138D9;
	Fri,  8 Jul 2022 10:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA891138D9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 05AE43200980;
 Fri,  8 Jul 2022 06:00:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 08 Jul 2022 06:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274435; x=1657360835; bh=QH
 om9BUGqjHVBhElvC9X+JqBwtmWJEf573Bn6c7tmls=; b=p9JTwKhEYGVG2xHkcy
 hdwqr+AynGTlVNXoNAfNsxvwIh52eDmiUuRPl0MjwC11X9rVuuhyCDS0ui2ubXSA
 wsXIYetgg6LWUdytknCgJD3qJz/h+qB78+klTlWQtPZwKciUbJG3J5K7x2ivv8Uv
 FWxhMFG6KL3rj0tdqNXfazd7iQ7+OLM2jIh9StEWtH9TeOJISgIeN1IXxhHpjsnO
 Bsv0xbATrecWizOGF7sQmIP6OzyANnmiqGYdQlcmiKXwsWUru6iUkPL/01CURUgr
 JrlNMvDg2JKhKwJkvTswrn5FZkKltN+Cs4c5fBpWj7M3buW0dMdsaRdiIB7uYFCd
 4weg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274435; x=1657360835; bh=QHom9BUGqjHVB
 hElvC9X+JqBwtmWJEf573Bn6c7tmls=; b=nMyEQDO5D3QZx9t7jWdkJi5BgAiQ0
 Bm5Oz/9JPrLSwAaLjMBK5cKUzcpqYuP+EhpBD9UPP0p51ejAHCe1BECZzYSkB82/
 8ZOlGsQMCKE4WMuAwiz6qX50THNkfzl2gG6J+xxqLOOhg2v/iSzqUdjstIhkiXD+
 2/hfk+Mjfs8s06HNxhJE/CEPaCer3FllxHJwihqHkixYFoZNrkhNVgXd2BNBhAR1
 I1pO5GFpu4FinTS6JChZ/qPkzN3vh1c1jfPyK3Ph9h4bhTBIZrkMyHVXuO4v37zN
 ufukyt1JZKTtJnBYSQtLczNHyc6upSS5BbKoZTLkeqtM5SNOIA30/Ws8g==
X-ME-Sender: <xms:QwDIYug9Oq-pbwq4YOuHethuBSouOm5S1_QCr6PoQbtrXuc1F7C-5A>
 <xme:QwDIYvDnQHkpOgU8g2wyysMgVjQysIC0daBWfJi_wKrQgN7ZwSi13ck-kdA9JZTUu
 jjphL4ut6INVIQZo_4>
X-ME-Received: <xmr:QwDIYmG5pNlwK29ltm-K0pxALJuCjAMcUc6dB4vgkrbIAkYp_tH3xazPrnjZNI9timrJHEa5DKR8FdNicvZz-WYr6bvpKINuUY5dwjk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QwDIYnSA__EbMo98n5bkaSeNr7PelB11Os6dqE9DK2oUbRa5DsKcOw>
 <xmx:QwDIYrytZdYEHvipe2TOexYSXxEryECoMJBzxh6WLTJRTDUfpEnWFg>
 <xmx:QwDIYl59mFXB2vHT-AtiQ5xumMR4pB0OPxnnA14W93N-L4SRsMkRug>
 <xmx:QwDIYtu6YBzd_1ay7BbtvypoY__jH1f2vJhGV3eiHLvDnFRsqo2ULA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 06:00:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 69/69] drm/vc4: v3d: Switch to devm_pm_runtime_enable
Date: Fri,  8 Jul 2022 11:57:07 +0200
Message-Id: <20220708095707.257937-70-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_v3d.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index d82c86865079..40f04157ea39 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -468,11 +468,13 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	vc4->irq = ret;
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_disable_runtime_pm;
+		return ret;
 
 	if (V3D_READ(V3D_IDENT0) != V3D_EXPECTED_IDENT0) {
 		DRM_ERROR("V3D_IDENT0 read 0x%08x instead of 0x%08x\n",
@@ -501,9 +503,6 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 err_put_runtime_pm:
 	pm_runtime_put(dev);
 
-err_disable_runtime_pm:
-	pm_runtime_disable(dev);
-
 	return ret;
 }
 
@@ -513,8 +512,6 @@ static void vc4_v3d_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
-	pm_runtime_disable(dev);
-
 	vc4_irq_uninstall(drm);
 
 	/* Disable the binner's overflow memory address, so the next
-- 
2.36.1

