Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98996560013
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C11D14A61E;
	Wed, 29 Jun 2022 12:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAFC14A61D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:04 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id EB1163200952;
 Wed, 29 Jun 2022 08:37:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 29 Jun 2022 08:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506222; x=1656592622; bh=uH
 3R3FDq6fjFJvFJQ2NsrhrFDutF4cvzN0c/iYyKvLo=; b=M1tLqbxPHOgTZRZrG3
 3zRrSudI4ZfCEhJdkmndoYfF3Kpd8gI0hBxxHSjbMNC2Em8xleifLhffXc/9d43S
 jAiThI62nzhEESbEwagTPj8KfQ1ynhu1zdH5vT/k9q7Pz3/RnrK3r1f1MEdgSiHS
 UXh+32hjK4wbIzM0k8Rq8uAAuEB4QeexNqfUzCKV+rpnr35fscdBY3CAkeWcFyey
 RthsWaNNk0gpDrVhNPuCFZjUylciyJRD7yW6juSBAYaIWhWzL+oemFRaGpV11dbr
 xeafduzsIsRORtD18OeRrM8FMNJrTTFg+ZWr7Du5MLF29qCsTuttNBkiUALaeOIP
 cxog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506222; x=1656592622; bh=uH3R3FDq6fjFJ
 vFJQ2NsrhrFDutF4cvzN0c/iYyKvLo=; b=DfNGxKhemDHSl7pln/D3LKovWkZIm
 Pk8L+UY44Y/kWZtkw1JJOHDyy9k+i0SUsgvyDUSYRaZUlhQwTuLVAw/PliuyT3zf
 IGK3rk1PqNTo4+Ma61h+ktUxsfj1diMKNj2SNKvZgh9QvJOHnHAVTxdrhgx+Jrd5
 y/l/ZGXaHYipkwJLe5Nqr9VidQRxswE4aWtSiH5lvcX/pZZMMwc7UOdB14I0659K
 MOZiHjp6S3ej80uiGijzRspfR/R9MA/mSjqFtM+CBNmGSd2XkeuZYgm04MjXM44L
 sFvNih9SMNIIjBMYSIymWCEqCMSSNnIZqN+VHLvPZDPGBFfYB4Z0zNIzg==
X-ME-Sender: <xms:bke8YliiE2d0ka2bLTDcudz7IBmTmn0yfq1sZf_o3O-xzMK00bspRw>
 <xme:bke8YqBLTchWAZXshvymz01KXFIwaoKKsXJ_Y7RVvi6kUL3gEumNNJNifnzyJQa5v
 dEafSyotl1LwLJ1g_E>
X-ME-Received: <xmr:bke8YlFLuyncbAQmXAY6R7bydUIDV5O3-Flv4SujAwuudidaQTatUl-iNIlptTgwe0psVLsRbBh1p3gqEaWz2fq2oPAVw09vcdEx8q4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bke8YqRD-fsFtudN9-L1MTxVXFG51pTQSuG1JuEWmzICQt7-42eutQ>
 <xmx:bke8YizpWguNhFxntCCaVYGneiMZ9drySdbfvD-sNuniUPDIzNCLzA>
 <xmx:bke8Yg5sqSCdRg7qho7pMnYWdiDNUgGiGLnYj160BJxAk7bl869I0g>
 <xmx:bke8YsupxTNxqc4BVNL8CdAP8YEyLDctd4x-yqmD_PANn7JKfc2AFA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 36/71] drm/vc4: dsi: Switch to devm_pm_runtime_enable
Date: Wed, 29 Jun 2022 14:34:35 +0200
Message-Id: <20220629123510.1915022-37-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_dsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 4f5bdb9a328b..52c3215fef49 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1729,6 +1729,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
 	if (ret)
 		return ret;
@@ -1741,8 +1745,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
 
-	pm_runtime_enable(dev);
-
 	return 0;
 }
 
@@ -1752,8 +1754,6 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dsi->encoder.base;
 
-	pm_runtime_disable(dev);
-
 	/*
 	 * Restore the bridge_chain so the bridge detach procedure can happen
 	 * normally.
-- 
2.36.1

