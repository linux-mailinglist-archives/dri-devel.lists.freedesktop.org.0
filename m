Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E608570915
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4399031A;
	Mon, 11 Jul 2022 17:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCA5902F5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:15 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 772555C0162;
 Mon, 11 Jul 2022 13:40:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 11 Jul 2022 13:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561214; x=1657647614; bh=+P
 yIPoybEqLC59r7fvcsMe9K24LmSGntaJD2qUUmTz8=; b=d/H7jgzbwGLcl52Sci
 TCKRyHKBROQ4ej7/5tsdcVTi54MycmmPAvTAmYD7jYrb6cjNCldmtYTegbRwbuqB
 Ao+UB6Q3hN1eSrqHOvuJEkOln/9gpdcQ6S6MSvSjcEZSbpLIIKkiMySMlEV2ulXF
 Ry5lT1XR2yU4hfsD5ivr7sF+JzPOn/y8WflrvpsC0BzaHdmsOtgTrGMhDLG2U6cY
 JvSrNDHQu/THvk5aLZ6LOiHlW2pl+Lxh7iM6PhW6wVwFrX2tnB+bK4UPmqgiKOri
 m9Q2OEo7xrZU9NNrb/L0dPZhtL6n2ozhcDujDG/PpUhf1gEhcm0jd9K3k4gECIz4
 Qq0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561214; x=1657647614; bh=+PyIPoybEqLC5
 9r7fvcsMe9K24LmSGntaJD2qUUmTz8=; b=pTBoURv4JzkCVkF4VoTyfhN8tg1SG
 ChknALmpQFCDfUO/WnIPoeYKMN1Lx5tmTDn7LjU/nhwxZtqrLWCN8ROMqehO9HLW
 GYtJEx/CNOk/BuPSU71xSQy8KbRRaEZgKxBxOxDhMFyUIv5KFRjVjLhUF7o4dpuB
 588dMAYsSGhfP6AiFkM8fyTmyNu6maioOjnj+DzjFU8etXdAG76W7O5quenC56WD
 ZFtZ8/CC2Ndkczr/bd+6Sg6zt7bI+TZpfJZxWb235SMVZCm6m200zaT7zXrOwvNg
 CGh6kJhgu47fEAftMGrRBQo1kWbVP1YCzf7juCTscn0ltf+vHVDmTdnzA==
X-ME-Sender: <xms:fmDMYn9AHsCSQ-3TCb48SyAxWe5HSZhjITVolgLxvgbvG5NBe0Im6Q>
 <xme:fmDMYjus3dndBdF0GkYKJjv_BEblsy9at8R3768CdI70TpOkuGaJ8xIuVBjBEjJ45
 nB99J2yrLR65IUygGM>
X-ME-Received: <xmr:fmDMYlCv49PLXh1X4K_hXKT3nNXUHIOPMLQPNvSBOjJvL9p8rloWIcoDDssQMRlldcQS8clevm9Udvp5r_637kYiXmtIRgiFiVKtN3Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fmDMYjfxFgq04q_Red5CbddsoL81HfiOZ5YgThBNthzb-G8iaQIJAg>
 <xmx:fmDMYsPiczWpJkrsD4o9-epzl27xWhKQNJbKQlHFjfw312lRU48cJA>
 <xmx:fmDMYllbvYbQCwY20aIKEnu5KASgvKzX1kUDDxm80eBqnR-2O0jBEQ>
 <xmx:fmDMYpr9hz4AGWyTmXUPuADxOkM53Ur37dYIRgNFKKCfCyUWGFAlTQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 18/69] drm/vc4: crtc: Remove manual plane removal on error
Date: Mon, 11 Jul 2022 19:38:48 +0200
Message-Id: <20220711173939.1132294-19-maxime@cerno.tech>
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

When vc4_crtc_bind() fails after vc4_crtc_init() has been called, we have
a loop undoing the plane creation and calling destroy on each plane
registered and matching the possible_crtcs mask.

However, this is redundant with what drm_mode_config_cleanup() is doing, so
let's remove it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index d391e894ee6c..03a799ba9ee8 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1317,7 +1317,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 			       IRQF_SHARED,
 			       "vc4 crtc", vc4_crtc);
 	if (ret)
-		goto err_destroy_planes;
+		return ret;
 
 	platform_set_drvdata(pdev, vc4_crtc);
 
@@ -1325,15 +1325,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 				 &vc4_crtc->regset);
 
 	return 0;
-
-err_destroy_planes:
-	list_for_each_entry_safe(destroy_plane, temp,
-				 &drm->mode_config.plane_list, head) {
-		if (destroy_plane->possible_crtcs == drm_crtc_mask(crtc))
-		    destroy_plane->funcs->destroy(destroy_plane);
-	}
-
-	return ret;
 }
 
 static void vc4_crtc_unbind(struct device *dev, struct device *master,
-- 
2.36.1

