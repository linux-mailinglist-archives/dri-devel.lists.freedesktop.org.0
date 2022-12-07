Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7B645971
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572D210E39B;
	Wed,  7 Dec 2022 11:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E216A10E38D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4504E5C01EE;
 Wed,  7 Dec 2022 06:55:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 07 Dec 2022 06:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414125; x=
 1670500525; bh=Mn7xWks8iZKiWdJtUFwsySgAI/XwTZtsV80VUYyCcFA=; b=L
 aRYGJ3yeKFjQorfDubxUnYzfpwL6Udv76F10ErG2kAwtL28+DZT0TpGik1k73jdf
 E5bwy9LgY1IPR1U8F8nunv+Q/IwHJYxG7vxurmbsmUyVGGp63rwM/Fh1XDgjpGCc
 dRVg1mmiIxeVrlsK85DUA7+nw7kk02JzfVxXaHQqHuEuveRTR2iV876TLHMVjZGd
 EBt7PbsVtDOgT76yXy9isv8T17uQUlNtCiyrhHUCtsDWMEo92T+svp58kCswWRUO
 LZ4/eTldRV0npa8+pXM45PtTaaTZkv5cbMPfQhqKx0EJCEe5JxlyNP0Mvqj3f87H
 i8vrVW/pG8YFPFknkKfgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414125; x=
 1670500525; bh=Mn7xWks8iZKiWdJtUFwsySgAI/XwTZtsV80VUYyCcFA=; b=t
 2VkqO2owJ4bvptFD9rs3zfPvk2mvbYE9Us9QVOHE7Jjiu59uLQK6K2MGs9UnIW48
 jp+uA7AQVjdhhtWmswISLMgIpLIbHy1/meJk6XXioUqbnxZzGJWTrO4hOTYLXgDb
 FgnUxF7vhEq+MA6sfu23e46jOZ8jto0/yBk2FTeWabZrZhEzlIpZMVJe1T6JsMHU
 Y2Z4IQSnBG9QhqakHtqPhcvLYZF/Anlq8ek2f4EctTn4zd3OC/Ax8dxniTH5tedf
 hpWhOQ9nBRBly5GoRHRRQWyxKZBzzbVoYOfg2Dol15Nszz6ZBxCNzfhg87NyzNJV
 FOaKAaoYdf7IsKvZU/bMQ==
X-ME-Sender: <xms:LX-QY4Ba-Bf3lo-Kc35fupu2BSILiBaGexuUCOy-YwDc8zcXkOxeAA>
 <xme:LX-QY6ikAwxR4UDUu_tY_96tfNDk_lI_pcfmTScma-ncxLkhXFMdoYBLRnR0d28eG
 7V0i1CK-YLeUPhckyE>
X-ME-Received: <xmr:LX-QY7ljvNWmctHfhm32tZlGwinxra5oCqQ-gojCXI3Dua9h3UttVxgFKs0kNHpYyl2qKrBy68paEd40XJVQxCpV21nWT2zLwbyCSU_Pa5lWeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LX-QY-wXPuQNNMpzPhiRiKiaea_i93dIZZMGVehi_qKL4zR_7ICFtA>
 <xmx:LX-QY9T7wek1Pg-WNqNuISzvBmoauNBGAxlNqSV5iFuVBHMJ-3a90w>
 <xmx:LX-QY5ZNL1CV-g2GdVEUrBDUih-gq5PTQiF0zEoxCmbTASRIXJD_tw>
 <xmx:LX-QY-KeDed6uypPaaG4aWkMCbbHFwoxZ_Tjf6DFykbHqd3p0_T59w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:18 +0100
Subject: [PATCH 07/15] drm/vc4: hvs: Add DRM 210101010 RGB formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-7-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=sJnuhQKjgOBeb7xKPXFNOEcV00S92JOFT4ScB1TbFQE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6laGTPKovm7rmr6Dn4FpfVLX4ohjvWWXhLd+q5+Zqvje
 bqlvRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbSm8DIcJL97d5ZVXFep1jO+X266e
 fyJcKvufnI7I5Whl0bdoVPNGD4Z3eSdVJc01pFCYaOPzOnK84+Z8H/qL0j0+zFoTXu24/osgMA
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

HVS5 supports the 210101010 RGB[A|X] formats, but they were
missing from the DRM to HVS mapping list, so weren't available.
Add them in.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index e60d6f1a7de1..eb0ac2167937 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -139,6 +139,34 @@ static const struct hvs_format {
 		.pixel_order = HVS_PIXEL_ORDER_XYCBCR,
 		.hvs5_only = true,
 	},
+	{
+		.drm = DRM_FORMAT_XRGB2101010,
+		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
+		.pixel_order = HVS_PIXEL_ORDER_ABGR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
+		.hvs5_only = true,
+	},
+	{
+		.drm = DRM_FORMAT_ARGB2101010,
+		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
+		.pixel_order = HVS_PIXEL_ORDER_ABGR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
+		.hvs5_only = true,
+	},
+	{
+		.drm = DRM_FORMAT_ABGR2101010,
+		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
+		.pixel_order = HVS_PIXEL_ORDER_ARGB,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ABGR,
+		.hvs5_only = true,
+	},
+	{
+		.drm = DRM_FORMAT_XBGR2101010,
+		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
+		.pixel_order = HVS_PIXEL_ORDER_ARGB,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ABGR,
+		.hvs5_only = true,
+	},
 };
 
 static const struct hvs_format *vc4_get_hvs_format(u32 drm_format)

-- 
2.38.1
