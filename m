Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115B047557E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E077B10E255;
	Wed, 15 Dec 2021 09:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C712310E265
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:51:27 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 256F6580189;
 Wed, 15 Dec 2021 04:51:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 15 Dec 2021 04:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=DWisH74FtOO6D
 ZDcdH7fo1vJbnYXx33V9C3uMX9AN78=; b=ENqrJGi/DV9k310RNLr4UDCw96Svf
 3f/OOVZ4aA6QCkIOPQcZjM55v4m6vRDoYm64Cz+vs6yrCwNcTvs23asnzcD5C54U
 keFiPE4qvdqWRxvS0dnRzOCpZcEpFyENnrMAh3725cZAC95GJjy5wMOHCXjl/9+E
 KrYG/xx9drtMTeqnDEoriXT+KHZ5hKSoa34yvHP81akhehQsEDPH91wezjg97aip
 wMK/WroWEic4ofygehBRUCXPoGIab/2FgOjA49CvYiobn4aU670ihDJwvEStun7U
 W3FZU1KYQ21K6b2SE2QhXeO8sW7BEUC2pWVL7nvkjvdyRCSkIS1ruc8gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=DWisH74FtOO6DZDcdH7fo1vJbnYXx33V9C3uMX9AN78=; b=UXz82kFk
 Q6gE0JeKtxUrcGpKnnLDeBMbCNWBx3Ju51i1mxzj8GcmslViYNZ/1HnbJqB54H1L
 SIWomJHPNEJ9A6j3yDiZdwuUB4G/isIJfHJNL06siuzfJ3wZmfrMtHkNoAIYJKKG
 xXyYwtPznrtMEX3Jm/1v/YUVjvkAjsddP69LtJN6qiGoPQezlM+9xwULEGF/0sbh
 ECT8lFaKjubzrN3LidimAhDLc8cKk0CRWaR4e9QX07iljGRJFSOiFUG4zvwmoEy2
 GXVBKHlEijeoFVaph6+Srz8awJDzWq8jKcO/gjVH1ymnG9BK/TGNhK02ePyXl5DI
 ysbTcatvMPAa1A==
X-ME-Sender: <xms:nrq5YfHPa3oup6nvp4CwMrK-yBi8eVcRu6sZxBZbZx7Q267pmRVhiw>
 <xme:nrq5YcUr3PSbDBGWshWOJwBQX_8jH7cq6pSvd_PlcylHu_ZJXoZv7ugvIXE8FP2lX
 eA-ofYSousO1-N2udI>
X-ME-Received: <xmr:nrq5YRL5DThItL3JlXWhJym9oSZd2WTsEsQFx6YjO0fYCZBI9HwCnckb4giBx72n37UkhFvR6OH-ab2DnstIxtdJtZGkoFJGeOlkgUo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:n7q5YdGkNOk-Yquu9fiLbMZyv_SGBfr_IE8nUyBomYSsKnU_Cl5oBg>
 <xmx:n7q5YVW3bQKRRxQvlGn_4HYcHdszrQYq0XjSfQIkzNOATTYTcQKNGg>
 <xmx:n7q5YYMJsNQUwTKJJBYapfM9YSdlpeau8ODEc-uBx2dX7AI5lAgXHg>
 <xmx:n7q5YcPTJrKOT18KN6cHBeTa3LY_u9RlK-1yA4E7JFugJVG_eyQr3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 04:51:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH RESEND v4 v5 3/4] drm/vc4: Remove conflicting framebuffers
 before callind bind_all
Date: Wed, 15 Dec 2021 10:51:16 +0100
Message-Id: <20211215095117.176435-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215095117.176435-1-maxime@cerno.tech>
References: <20211215095117.176435-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bind hooks will modify their controller registers, so simplefb is
going to be unusable anyway. Let's avoid any transient state where it
could still be in the system but no longer functionnal.

Acked-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index d3cae84a4c4e..86c61ee120b7 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -251,6 +251,10 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
+	if (ret)
+		return ret;
+
 	ret = component_bind_all(dev, drm);
 	if (ret)
 		return ret;
@@ -259,10 +263,6 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		goto unbind_all;
 
-	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
-	if (ret)
-		goto unbind_all;
-
 	ret = vc4_kms_load(drm);
 	if (ret < 0)
 		goto unbind_all;
-- 
2.33.1

