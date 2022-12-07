Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6A964596F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED95410E040;
	Wed,  7 Dec 2022 11:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B56610E39A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:31 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A52C95C01E9;
 Wed,  7 Dec 2022 06:55:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 07 Dec 2022 06:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414130; x=
 1670500530; bh=chybC9bA4z237Otv3XNN+1hhSvj8Cx+nBnOPtGmUHew=; b=e
 xYWL9oDgcShiObJtAACa651WpMg6F3QytTFX5IYy+D/xSC4kJgQuLqL1V4pPbD+Z
 1hJZTsOn7f2KOKSHSqEggJhigmUyeKYqF2Ka5cRavSkeBVAwhCr1XlgpuKHkFXBf
 EqpBAXTWRRiIUdfKfDKKmTYcRZjoKVZFHlqAbDyIQVMl3aeEaoMzmxFUtWTTabE6
 VsvexcpQJcnVfkI87wmMBVX7KzH3Iu/8l4c9jQo0e69BjrUeKYZKAKU3ISquHuh0
 cA4KwWyUSSm+1h3IZVBN6Wuk3qedrOfCe1uzWUW6W+kAUWL1TnV3eK8HBGzglS8C
 YNxfo3Tl7Um/gUCqa9KgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414130; x=
 1670500530; bh=chybC9bA4z237Otv3XNN+1hhSvj8Cx+nBnOPtGmUHew=; b=t
 BPaV7KpvDzJNwekv8pTr10ms92PFWu2pKDHq4DKYgXjsACVcRMbEgpKJhshPUSTh
 fuGgR2Y9ZXqz6cNFdiTsotStFC3rf2mm180DQi48hYTzg3UcTIO3ouzssEpwfXXO
 bJGliH9xJy/yJ9fNgO/lbAdCMxjYcJDv3KTsSLYdEqWv7zqTbzbr0f0WmqdCfMvN
 qFp1Fkij3aCM0vTaG7A+mj6aD2+9hWwxOK3le50Haffn4qXWEpjVo0OWFX6sEpbc
 q6lWFJNjfoJY+8qyXU/hhOAdTQIUysr3WZdcS/NfgtFaWz7bEaH7/E9nu1EQ9+ZD
 NZSQFHZMwM/lFD7qDRw9A==
X-ME-Sender: <xms:Mn-QY1zH7kxnwXP30kVmyeYgWxFCMO177QQdk-inyhbt7nfJ4LPtCA>
 <xme:Mn-QY1SmjSH5J7lCh-mXhrN_1r6g7qlr1kGzlrVG5nqIeMJlOz2ET40D9T-yfAkO5
 8aRejvqmxfXeEtc4CU>
X-ME-Received: <xmr:Mn-QY_Whj7GMjVy4Y5dNDLDyp7b6U538EX0EKwSl4qMZz12tYHcJSQ7WOOVcOnRFUg-7VyS8_9BDUysN9FXTyJl6PIWg6muQ8YCHAAzDZ_r9YA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Mn-QY3h_aa7AVVwzSr3BYEZudc6YwrMVyYua6RT2hxqMdqTxrFsagw>
 <xmx:Mn-QY3DaVNoFRr314atgnZJ8V_WkB-ScUlGIXM432AEKNm5EHwLMqg>
 <xmx:Mn-QYwI-iDL7YVoEhwTD0oCUJEfxS_lRKLCX9C0sOeqsiMDQ9ckEKg>
 <xmx:Mn-QY_7zDCKkatjj3VB3EwoePDdbOqY69LfIzzYLYX7P-w7-yCFDdQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:29 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:21 +0100
Subject: [PATCH 10/15] drm/vc4: plane: Omit pixel_order from the hvs_format
 for hvs5 only formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-10-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=TjzYPZb0GiveIAkQNU4LbeqUUAovVrht0vdSF4aq2qQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6laaR36MquNQc/dmnOhx6bxYgEFIkWVOeJCjZUbKyaN3
 Ioo6SlkYxLgYZMUUWWKEzZfEnZr1upONbx7MHFYmkCEMXJwCMJEtPxgZJje3WhXqqc2x/XUuuTX07a
 Ggq4p3vs08OJn/nvuqK/kR+xj+aTC2HFpTYBDzu1F1oar7eYt7N5g2Xuo6YP9+T+4G4XWd3AA=
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

pixel_order is used for the earlier versions of the HVS, so is
redundant on the 10:10:10:2 and 10bit YUV formats that are only
supported on HVS5.
Remove the assignment from the table to avoid confusion.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 8b4805c937f0..7b7bbe94d47a 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -148,35 +148,30 @@ static const struct hvs_format {
 	{
 		.drm = DRM_FORMAT_P030,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_10BIT,
-		.pixel_order = HVS_PIXEL_ORDER_XYCBCR,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
 		.hvs5_only = true,
 	},
 	{
 		.drm = DRM_FORMAT_XRGB2101010,
 		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
-		.pixel_order = HVS_PIXEL_ORDER_ABGR,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
 		.hvs5_only = true,
 	},
 	{
 		.drm = DRM_FORMAT_ARGB2101010,
 		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
-		.pixel_order = HVS_PIXEL_ORDER_ABGR,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
 		.hvs5_only = true,
 	},
 	{
 		.drm = DRM_FORMAT_ABGR2101010,
 		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
-		.pixel_order = HVS_PIXEL_ORDER_ARGB,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ABGR,
 		.hvs5_only = true,
 	},
 	{
 		.drm = DRM_FORMAT_XBGR2101010,
 		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
-		.pixel_order = HVS_PIXEL_ORDER_ARGB,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ABGR,
 		.hvs5_only = true,
 	},

-- 
2.38.1
