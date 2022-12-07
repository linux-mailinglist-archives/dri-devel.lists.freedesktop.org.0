Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C86457C5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 11:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF1910E391;
	Wed,  7 Dec 2022 10:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2547010E391
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 10:27:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 54F395C00FB;
 Wed,  7 Dec 2022 05:27:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 07 Dec 2022 05:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670408837; x=
 1670495237; bh=w+Gci/EdEyZNlgJIQDZMLgz1QP+F+UJkjKPeee30W70=; b=U
 AYeWgpcWyxgCAxvZ1hru12ZbMWrdG9xQohWAecVtnS+nx9IBPRrAeO4sicwqKzIJ
 +aSVdO+KS+KvI3USr+E2Duon9qjMM3IvPsaFm2LNFVwU73SfXqEcFgsz10FgUnaP
 XpppQWggX1ldVmBrD19otOF66G4yhWXLMWmAm+F/zXUKPRVVgUNg92kbmttAodTR
 U25vmaHselY4wJHJmOdOCpEu0cXlDVtr+NLKRZSb4JvyTH43pOlV55d4I8RdN2Q4
 CAec3afr2lgfJv9mcI4wwr4fbV5e4He/oCuXXDOUUeC9jPoL+g3PgXQuWt8JkAuP
 z5o0DJyfzKDwzsqp8B5zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670408837; x=
 1670495237; bh=w+Gci/EdEyZNlgJIQDZMLgz1QP+F+UJkjKPeee30W70=; b=P
 mkYLiEHUCM0QSX+4fjK7X0bBS/tkXzNPFqBkmy/Ij8JXmECOtUderHWxq4LIGo8h
 13phtE2wX4y6CSATS9u+shqja0KOk879oe5h4g7iv6/HDekhd/+bC1vW96fCZqHe
 vkjFQ8EXPB9ra4Hky026tHHHmgEW4lbk+QZ41JikhrOm3z/nhEme6bZWPxR+Z4UZ
 5FBtJLo+LWoY1wQ/TxpQjKg5CcQEm0DrGHiIpY1NnQYUi7DDuwZQEV/f87tmWel4
 yuI0F1wqW0NwOJDFv7DIvrfBk+9tW6oET4+bwaCYxA34Hs1vEm5JChV58zslu13E
 9H9V6vWjCJ1TBUJDvVPcQ==
X-ME-Sender: <xms:hWqQY_i59E5zaDFmDk9kPKtkZt_-Q5V8LGvFzptA-ynOeD_diUrKqw>
 <xme:hWqQY8Aa3kU5Y9mDrSFpWntRwsyobq6cLFQpyoLX2DVNtVMn0rWuXD9cw-FG652c-
 i-cZUlJU6-iu_VaVWI>
X-ME-Received: <xmr:hWqQY_E7-mtZzCRjW72lJNNNzboxmdtOlGq65R5agiWab61IKZ4I4gGaUHfFJ3_bXZgD4TeO7Q4Xz2bBkEb6oRQYEf5Ek1wBrW1KsUhan2akFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hWqQY8R3dVA3DdH83rleJ7Aqhp8WfgkuMD92-xL_FKqyGYJgKT8aOg>
 <xmx:hWqQY8zakWjzyO102DsPvtzIe1Q_KyvGwtm9WrGhYTZFOU24IfkxKQ>
 <xmx:hWqQYy4NpK2IgsA45BIBx8XKEClaMUsqMzOm5mFqK_3GZ6FikwmOtg>
 <xmx:hWqQYxKD3ANCH-oMVywSH5OUdBBUzzNlkSYY85u8JgGkwOejuyjRfg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 05:27:16 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 11:22:44 +0100
Subject: [PATCH 1/6] drm/vc4: dsi: Rename bridge to out_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-dsi-bridge-v1-1-8f68ee0b0adb@cerno.tech>
References: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
In-Reply-To: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=tWzFKQ0hN8LGVeDx6bqlvMlhZjCI3ajfljD5sQbs6zo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTMkuSLHUVNkTy8qzJ6/ZtfDL/bI3wgSxm5d07I48t8Qrd
 OjG2o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNZOouR4anCW8PTFstMbwZNUr4j0m
 nX27/tUdofr4cSPJ+qD+9ZdIXhr8jf8zO+yKj8FJ4xNz9VWNjvhLSp4v2NP2VfrTx77NNfFUYA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

In preparation for converting the encoder to being a bridge,
rename the variable holding the next bridge in the chain to
out_bridge, so that our bridge can be called bridge.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 878e05d79e81..d9d951e9ab7c 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -556,7 +556,7 @@ struct vc4_dsi {
 
 	struct platform_device *pdev;
 
-	struct drm_bridge *bridge;
+	struct drm_bridge *out_bridge;
 	struct list_head bridge_chain;
 
 	void __iomem *regs;
@@ -800,7 +800,7 @@ static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
 		if (iter->funcs->disable)
 			iter->funcs->disable(iter);
 
-		if (iter == dsi->bridge)
+		if (iter == dsi->out_bridge)
 			break;
 	}
 
@@ -1723,9 +1723,9 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	dsi->bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
-	if (IS_ERR(dsi->bridge))
-		return PTR_ERR(dsi->bridge);
+	dsi->out_bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
+	if (IS_ERR(dsi->out_bridge))
+		return PTR_ERR(dsi->out_bridge);
 
 	/* The esc clock rate is supposed to always be 100Mhz. */
 	ret = clk_set_rate(dsi->escape_clock, 100 * 1000000);
@@ -1751,7 +1751,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
+	ret = drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
 	if (ret)
 		return ret;
 	/* Disable the atomic helper calls into the bridge.  We

-- 
2.38.1
