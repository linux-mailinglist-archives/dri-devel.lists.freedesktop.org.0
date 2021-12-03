Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39FB4678DA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 14:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23DA7ADC5;
	Fri,  3 Dec 2021 13:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D32A7ADC7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 13:51:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A67895800E3;
 Fri,  3 Dec 2021 08:51:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 03 Dec 2021 08:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=qzonQ7o9ZUVo8
 KUbjrot/21pyteCYG+CTBgNW3fAN9E=; b=EfZuJi27liTCfWjlQqmjBzt74HNdk
 xazXacFE3NahqCyNp/XNeCaaxm097r5duNBDEhdzY0Uak1lZuSkxQpQ5By0okgRo
 LC8ynN21c6BYz7Rd3kBaetghlu7NHJNw0ldthqFY1svY7vMxEhqazEQtANIhIlrV
 vsnMUf/cm8HgPsZhIKRxwFZT/L9DCf8VO5z4eURUru2G4+dimdtDKBD2yv458Bvu
 aSki6Fc43xSn4+fTIuZ65HptoY9G5vyK901iAEpdaoS/4kA5iIGk7rSqeoPaYJ/T
 u83QcNTBK0grtGk3mXWwWrZc/uDzcfhF/AUFPiUIHXq83Kq8naRgINkHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qzonQ7o9ZUVo8KUbjrot/21pyteCYG+CTBgNW3fAN9E=; b=AeX+9Fr+
 gECxhwVDigZMK7Owxc+I1xm3IfXD2TCMd3fV2w1g7jXhclKKYXmT18XHfLPm9e7l
 XGOlZ6PHFwfU9F9tclTgueybZXgH964DSIf+QiNQxbCmSl23BQkI2auP/nsYD8UN
 otA77hxyjJ2c+C2CLI4H4yEyvidSBLwh7dXaYJFbtyuK8fPhoKhAjByqzMmCpBag
 ZITHBM+jgqNBKYkcG350GziqNIqVmThR1Lrrhm8FdFcCIBzNaaMdqSDXIDzkbNuG
 lVMfN9EPZo23lUScOlYUDLcTeEraLip/3I0VHgKPW7c0nN5pw2rRbhY+PnrOEy3l
 WFSQd6vpDBZD0w==
X-ME-Sender: <xms:5iCqYQb9fzgHXLHveVEegrjUbszIN59Ul3ylsOJUffP8uAPycK3tnw>
 <xme:5iCqYbY7UMnJ4627qYWZ_iy91NOQcodBv-p5Lh8un_xZ_OGKoOleD3TFuywW6RlJ5
 BRfqER096cerZKzl-g>
X-ME-Received: <xmr:5iCqYa9I96Mkd7tstAkJ8BcPB68FbIMoVvqnw4YPcp-DJAYHo8sJnoFbqZCd8T8G3HwW8fRn98Qj3-BGSHF5mmzN7sVvmvUIBILzw43J4larbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5iCqYaqYzgO6sHZNZMvYxH3Jqjoa8tFpLXjmaPhRhQaktY7qTteWig>
 <xmx:5iCqYbqAG6FJ1Aa3fgmRGyov6GCbeHOz-R0YxvAZOqbvTHrR1i-ADw>
 <xmx:5iCqYYSHu8bjynW-HRaV3O1SmgIEDrqobBqVd0WGUR3sSsuwXdx1vQ>
 <xmx:5iCqYQjQTvQUhh5vNh2LVtaDOId8A3V6AirCVdxgU4rmWTBhfzAHQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 08:51:33 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 2/3] drm/vc4: Remove conflicting framebuffers before
 callind bind_all
Date: Fri,  3 Dec 2021 14:51:25 +0100
Message-Id: <20211203135126.700165-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203135126.700165-1-maxime@cerno.tech>
References: <20211203135126.700165-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 16abc3a3d601..8ab89f805826 100644
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

