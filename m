Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5931560000
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F303114A60F;
	Wed, 29 Jun 2022 12:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E84D14A607
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3145A320093F;
 Wed, 29 Jun 2022 08:36:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506183; x=1656592583; bh=BX
 UMZODozYPDPm3VbxM0Y3o15IHHzlfq/0g7lsRUciM=; b=Jm6BQnEMcemCwzu2Yp
 tbnGXZoyRJRdwI1TY6ZsSA/9o1hX2+8SSpdx3BNrY0RW2gPjEGczwiqeJy3jyLgH
 1vzobQFk+fx6Y/PQifmVkx49W581dbTNJ77y/HsyW9n5HVIidpWdqiZT2VJYPP2m
 M1VI+eTZbN8HYvx6BXs68pcWteCldWpcG6AD3WnLKgyO8BoSFqHZZcfqzrGAFqG3
 Pl4/rS2dMcfeQqzw/VZW0gTDzIN+7p499QXmO/GDp8Z/JNIiuDajjeUiwWa4FOUT
 MqLZjFJ35DXjjLNBDR88ryOVS7zTdn1emfrzARXz7PS8fBKGn3x6EmNCv6oTUbvE
 KGDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506183; x=1656592583; bh=BXUMZODozYPDP
 m3VbxM0Y3o15IHHzlfq/0g7lsRUciM=; b=IK+ir8lg7jJ6UpZq3R1HENPCWQOYO
 +QEBSWRJErVh5oK9VfTAMTKWzIbyff4vebUxSFsh1+Kc+0a0lGQdTHRaWfmjdjJo
 myaXo9qZqVKfjgNp+ig/C7q4PG27zmLa5+kwTv4S4xhILgNEVxkMa6MPiwEpWqx+
 dEF0hdMpjAAJsdRcon8tTQSPm2HDTFpv/5wVLrDtr7kdk/UQLMFxqFVgMW4O1EQN
 FKY3mzytiw1QpLn8m27TXAnTyRA9qgk98Mgx6ai7arilENswrDmX9ORq1qttrxKQ
 BfaUzxtpCIsL1RoTmK0irezESZ6+3aG1i1qPZNRNy803MoapzV+LpeUjQ==
X-ME-Sender: <xms:R0e8Ym6QXmTxOTYi7ZK9pmoFGwXhckI-AsAH2uEd8DrqP7VQxj3hPQ>
 <xme:R0e8Yv5uZIPp8hxt7K0KHeCMqBZSXblFtyA3AIh1qbb7cy4MnGxOPbqSuwjXhfSt_
 UvjqNyH3teIELVMSXM>
X-ME-Received: <xmr:R0e8YlfOA7sc-7oUtV3WVhWUu4DYUbHuT12UjvG1Eznabsax1S1f-CztrMughVYvrrnKa6BXilRqhJW1mPzQkOTzEYEPMzBZffcU6Mk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:R0e8YjJxGPt-kjYpOqPCWPqB5-lwd4otA7BAXSXFMOREPEDIOVuBcA>
 <xmx:R0e8YqLidtFLT9l1t_f_nORSoj3Hk3TzVrw9UuBFG64ys0i_4iG6bA>
 <xmx:R0e8YkyneumIbPazsvk8CrklxmdNEkJGUfVua-9R6m2lL4XzbgMPgQ>
 <xmx:R0e8Ysi7LZjSbaEp44-i3JgCBYOV1tbwuiu1eCxAuZXDi7mP7IZj8Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 23/71] drm/vc4: dpi: Remove vc4_dev dpi pointer
Date: Wed, 29 Jun 2022 14:34:22 +0200
Message-Id: <20220629123510.1915022-24-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no user for that pointer so let's just get rid of it.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 7 -------
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 44355b347ff2..52348e1e1ee7 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -268,7 +268,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dpi *dpi;
 	struct vc4_dpi_encoder *vc4_dpi_encoder;
 	int ret;
@@ -327,8 +326,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, dpi);
 
-	vc4->dpi = dpi;
-
 	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
 
 	return 0;
@@ -342,8 +339,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 static void vc4_dpi_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
 	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
@@ -351,8 +346,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 	drm_encoder_cleanup(dpi->encoder);
 
 	clk_disable_unprepare(dpi->core_clock);
-
-	vc4->dpi = NULL;
 }
 
 static const struct component_ops vc4_dpi_ops = {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6afa873f0def..db51dd3e20b8 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -83,7 +83,6 @@ struct vc4_dev {
 
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
-	struct vc4_dpi *dpi;
 	struct vc4_vec *vec;
 	struct vc4_txp *txp;
 
-- 
2.36.1

