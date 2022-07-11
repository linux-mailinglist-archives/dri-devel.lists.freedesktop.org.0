Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FF5570930
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1F99033F;
	Mon, 11 Jul 2022 17:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2633D90325
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:07 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 77C435C006F;
 Mon, 11 Jul 2022 13:41:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 11 Jul 2022 13:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561266; x=1657647666; bh=sb
 a5PzDP+J8k8Lo2f5odJ2lk/8LYYlMABKNOH5ANJWw=; b=iPKgZ5ULarrqgzKdzE
 7uRsGgh6i0bT8UMDDpU2YijQf4QGMsn/R+Px9/HuP0tYdRTRtHjJVDtlr+n0okfx
 8C/rDSBA5KvfgcetjE6r3HY6ze5csYiEKuKCkuSAj83yIIsuB5Hieedb7ecg2Ejf
 XWlv20s8sYs8DFHuaDPNReNOotTiQgxOy85tS4gvVoAv3I4ylL7VlC8y5jB+2Cfa
 17++PngLwzIbxJ2wA0zbvuMf7PXS2y95cutF1WdqpuoXnmAlW7pgStH8R/fkSVSq
 XDVTCxojwYXax3+DAlbCNhURSJBXMA1iwXnF4PiwQUHc58tJ/+o3onkZD/prK+6G
 I34A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561266; x=1657647666; bh=sba5PzDP+J8k8
 Lo2f5odJ2lk/8LYYlMABKNOH5ANJWw=; b=u0soyiqPPsJqMF2qEWyTtL9sMa2W0
 z+w2LtWSrgGe/NhviDV62KBdUR+ixiyPEyyws2uWUErhs5YfeCEvkSbpVQLUM+CN
 bHgu+RNtcLqGHaBwKqrv4MamaxiT+x9F+EK1rL7pFXKzHiZkRBdnTbWmHIia/pXk
 AzQMA2pkwhX50twS3CPZyYrHxsoQGkKQsZmowqO1UcQ46SAA+jCnDzzH0t2liTI2
 oiP7MEZzzEJIb7147JZ6/Z8uy712i9r98jPXGZ3vv2LjGU3TPvUh+oKoaMJZKfqM
 YfYkcTl5rn2ZbY+bk6k+6/+oR6H22cNIdsvI1cP5K61PY2EzegufespEQ==
X-ME-Sender: <xms:smDMYi8zoyZFHCSAn85Ax-n42JEZBHyqVdGbthYzcfTN7o9uhgE9jA>
 <xme:smDMYishw0xAryN3E4Xam7n72rn6qSWTUr5zm8OyZYhsUC44CKWNCwg132taDi-pM
 JxPU55dBOin7Gjsk1k>
X-ME-Received: <xmr:smDMYoAZ5tMpiJVJDJmRPTptaYFGogz4FFHl1G36KDP0ACECB4pDrFCDVlJsJmCXfRZmfTDBRh3FPaYTtPviszHLGzby8rvOnBoam8k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:smDMYqdHxbr-CWiRbOzGDRbSzKa074OA7b6Iuh2L8T6A8bXTIEWR8A>
 <xmx:smDMYnNQl-A6idb6EGxrTqPe_HaMCmrBpczjqKv-OGMiShvDEyxEPA>
 <xmx:smDMYkkvn_e5n7IDbWmZAgVMvPb7uOCvSG3yRRdR3_zYGmRXzziNhg>
 <xmx:smDMYspQxe8Rbpq0hThCBJfHMrx5cfccQ-gg6OcAvTps0x9z9r7i7w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 49/69] drm/vc4: txp: Remove vc4_dev txp pointer
Date: Mon, 11 Jul 2022 19:39:19 +0200
Message-Id: <20220711173939.1132294-50-maxime@cerno.tech>
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

