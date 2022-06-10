Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519654625B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7907D11BCD7;
	Fri, 10 Jun 2022 09:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC7511B4A4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E8B305C005C;
 Fri, 10 Jun 2022 05:30:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853447; x=1654939847; bh=DY
 cULcZvcfW44V+7UAQcTh85I477tcEdEtveeWftkwA=; b=U14ZLSZchzxEy4iVnD
 baZ9XK4+DiLDd1D6QtQpzmHUhMBMV6ZhlRFFyjRrSFZLG+Tu/e0fDNJY0XK5GQAy
 hSvDOTL8EhMfa/lhuqGHJqiry18QF1xNpLrXhPMA+n14uSaHWClm+dcUMJ1lZePE
 /pdVGbMzyS+xOecWZkRBFfRRr/Y+Wk7F0UsA+twSxixHaEP7phzXYEw3b9bOmwkE
 z/kZaXtMr+FV4f8BgK/Lz8VzkZSxMltgrFOYDB5HLgK8fs8vHKqZ/3eYl0vzPW6g
 ZIHQZ2qUFvQqpXL2ZM/Xdtw1vubf12Q38TuhLRpJvlQVgutjZrJSvz7iAOfcBX7h
 Eheg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853447; x=1654939847; bh=DYcULcZvcfW44
 V+7UAQcTh85I477tcEdEtveeWftkwA=; b=g3XJ5WnHCaa7/HrjMX4sWN0IjywZY
 tgKYIR+9526N/gpCKhp+biWnLp/VpiDZKuMbpKGK/OsXIsRb7+9b8j1bhLxdQlmO
 2dvS2C+Hwwi852pgy6xdRCAouH2MW4bHD+Gp9t5mtii5CjRbC7fhjkd/kXUwPscF
 fIP21M39mhBZL0VDXI91yMdYsN4EObql1EYPOioYZRsy/WB0R9Hbb2xyHSNEiJSo
 Z8GTi+39Ryd020BymKHzbAngslLSOmJbhdRzBiY6cXJWlt+J3QT0AAlE5UZ6Af9L
 4vhe0wEJG7ZYCqCj4vavNEkxNpZ5M5/jpH1jXmhSE1eI0ROTGMEcWyngg==
X-ME-Sender: <xms:Rw-jYkKV4oqGW05Z2HR2pcg1rqU4-dZ8wQvWrkBHpniE19MGgXTASw>
 <xme:Rw-jYkL1YNH-VkcloOU7VL0GtRYZ0pKxup6kS5b95W13bbPRXn_rKtdHBAZnO-55F
 y2I4-uQQuNZizdWlg4>
X-ME-Received: <xmr:Rw-jYksR2o7N-oxvh8rEGAoXK6Edi1hnhtt8n1MZy3Q4knjioA9YbvupfwdthtroMoRqEo9tj5Nx8SjZOz7MvjCEAWVwBvVo_VjQ1Zo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Rw-jYhYrav6VJ8kx3sMTjlmp7iw0Cfn5ADGBdJEVPTJYzDo2QBuMTA>
 <xmx:Rw-jYrbgdb43aS2h4C9jv4f6BZaObtj6tkpJ0vcj42M5RvIlq4qv4A>
 <xmx:Rw-jYtDNwnzjKhUkM4cdslFEzgTBqRf0NyY6uirsY0CpWoniTskNRA>
 <xmx:Rw-jYqWuNI6a66uosUikHDrGXdN-E_vxhAFbdoT-X_XZnmu5VZXY4A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 45/64] drm/vc4: txp: Remove vc4_dev txp pointer
Date: Fri, 10 Jun 2022 11:29:05 +0200
Message-Id: <20220610092924.754942-46-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 drivers/gpu/drm/vc4/vc4_txp.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 846f3cda179a..5f2d7640a09d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -80,7 +80,6 @@ struct vc4_dev {
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
 	struct vc4_vec *vec;
-	struct vc4_txp *txp;
 
 	struct vc4_hang_state *hang_state;
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index f306e05ac5b2..87c896f482fb 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -468,7 +468,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_crtc *vc4_crtc;
 	struct vc4_txp *txp;
 	struct drm_crtc *crtc;
@@ -521,7 +520,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	dev_set_drvdata(dev, txp);
-	vc4->txp = txp;
 
 	vc4_debugfs_add_regset32(drm, "txp_regs", &txp->regset);
 
@@ -531,13 +529,9 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
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

