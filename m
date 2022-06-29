Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BAF560018
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEF314A62A;
	Wed, 29 Jun 2022 12:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505F014A619
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 12759320094C;
 Wed, 29 Jun 2022 08:36:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506216; x=1656592616; bh=ox
 tMSEfvW64OQpxKR9mh62WvTPsUVKAzEOPeu3UfuGc=; b=bTAkWvgAX4z6rxQ+Hd
 ZJeK9yLcVY9tLrMFVMitJOyA2i6YMO6gB9ofMs/77dM0GVVUP1kWaIbABH9U5tZv
 o5KzlU7/LiUeQVMcJSjsSC9Jcwf5O6v3+tg6W/6O3B2uVVX1O9U+UkyamGOSvu81
 q621eTtM5D1zxEeyfFXGgPD0qBCNmzQD3U4Fbb6sU/ynxiOIU9ICJMZ2ZTfxTfLs
 OYguD6hJGwvI5BS4/iBe+EFwR2IVAwDYfNrxDzyDLPwu9wtg7yr+5NrTl/E0d4+f
 Zrp5xwC3Q8OUI1coOTkfDFKSG/gHzVvgBcNDsYNEVeDGaz3z11jmzLpHHDrP4KYM
 lpTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506216; x=1656592616; bh=oxtMSEfvW64OQ
 pxKR9mh62WvTPsUVKAzEOPeu3UfuGc=; b=VI7uaZgw7YHX/wFTcw5cdi9G1kR4s
 nhM562/xtzLd6irE3/QYm6pbHidaiZRYJVUx5/dK/lIuB4QSyHGV9VQd+Xq1JAA9
 WbVfdc+bO1dT0SzlrnoZdEa5dgCsjg7cozQ0yGT2OSZeTsRhRmcjD8WPZVNWSAVa
 IkIfVR0Dck1DKhsC6oHbkJz1H6bRINiVoTRNC4S+zPddfDmINYeqQ3/pWqADoIFl
 c69faH9yUxSrZQG5tJrOgKSeuWAsU7+RcEuItcnC1St/8vQo728CTLBVrljJw3Fm
 9pCS8S2wFkZECEHaRCx/6/34217e/JqR8umgw1P0GzW1PPh4bMrSuGbcQ==
X-ME-Sender: <xms:aEe8Ylhx8g1b6mOm2RKWkCq938USZWSoMw7XjKeAuE10HP277dOZEA>
 <xme:aEe8YqBuJdfbRh036USmh6qb_L-jgL0v9n0586iUhTsPP7POJxnziAx7dYGkrD4VE
 x3rofg5mgxaf-xuEEk>
X-ME-Received: <xmr:aEe8YlEyNO_CJqMi1hPeaS3Abfvomwz199GLVL-KdrcwZVVTW409MaGl-jbmD3gXHZoUQdE2bGlD6na228w0cPT5tWNbixdZLgYV8oo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aEe8YqSe_aMloVI52PkkiVLUmQ9WaJmV_WfqlNxB6Pc-ncSn-mU3Tw>
 <xmx:aEe8Yiyo92IbnUON_fFlC4gGEFqqLNoVG7jsFlt44aLiK0XjOCG3wA>
 <xmx:aEe8Yg6_AFbVTHBNRsCR0oOzXI4mQyFpDbtsE7IJufWpiD3PEqPwUA>
 <xmx:aEe8YpoO6AFK15NHX61PVDvBJftj-J2isIkplTKSG-YJBjCEGEDSpA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 34/71] drm/vc4: dsi: Switch to drmm_of_get_bridge
Date: Wed, 29 Jun 2022 14:34:33 +0200
Message-Id: <20220629123510.1915022-35-maxime@cerno.tech>
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

The current code uses a device-managed function to retrieve the next bridge
downstream.

However, that means that it will be removed at unbind time, where the DRM
device is still very much live and might still have some applications that
still have it open.

Switch to a DRM-managed variant to clean everything up once the DRM device
has been last closed.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 1a55b7ea52a8..13266ff334d0 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1672,7 +1672,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	dsi->bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	dsi->bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
 	if (IS_ERR(dsi->bridge))
 		return PTR_ERR(dsi->bridge);
 
-- 
2.36.1

