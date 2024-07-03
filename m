Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF74925A3A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E261610E791;
	Wed,  3 Jul 2024 10:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="SNNuVyHI";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ieGewEPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C1010E791
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:55:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id F2CCF1380622;
 Wed,  3 Jul 2024 06:55:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 03 Jul 2024 06:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720004139; x=
 1720090539; bh=nWXLocCMt7EGKg67iVS/7BHF4d4/LJP7o3vbPwq3pQs=; b=S
 NNuVyHIkwJlztuHp25YkoO7kCIZwGVpIsT16IajHSb79tv8Xs8HCkFbwgIcFyXIQ
 mbf2Fmyh3+d1TN+j/4YF6JV6yYY6JV03XXLp0VpESKf/l+FJJzzsVpTazr+cu7J4
 TTQ+Yr/VNh97IqhJuZGQlJcUqCT1MnKNPQLXMJFEr3C/tLmBH+kMZZ/ZP23OzaiF
 eILocTJ1UTYJ17dUAi7em8/VOFLyqgltYnxpT/pfRwi0XZyEQPjwFvBJR3UulmNw
 PTIvs41JPKgwNgHak1rfyZb9uH8gKkWfLY3+mj78FWHDiP4fQhKTwezId9/jIcYT
 sfMhFvvfZ9/uXE4jgG5Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004139; x=
 1720090539; bh=nWXLocCMt7EGKg67iVS/7BHF4d4/LJP7o3vbPwq3pQs=; b=i
 eGewEPEL2F7EqFXAMmKQvRZp8KcpFppaYixLCJ0YUfNike1Ztc+38IXJUzkZ1NGl
 76PVRVxNo60AwbU9ewMJItaHR5UTwdWLb2jAxOReMjozpeNnRuSpRIivs8wnCHxj
 ZzMKCGC0wX7T/QSQop8Dwfed4SZnC5A8Sgj24IrFjAw4AVOwt/NGvD/oWTrHTAeF
 0Y8B5N2eyq121p4h+sRHHxae6g5w2RxfDaGumiNgq5/bePLnHhfBa+yQIMQAAieU
 Ouimgo4Us4fZNhNq9VK6gxh0kM7utWYcl0x+amqVLNWAucpVxKX7gk/yIQn+f1gm
 sLnQvqKcyjGK7DLPw3RRQ==
X-ME-Sender: <xms:Ky6FZpIFU8WtAKzP9fW9PrZy09RwhyMulZIhsGnW_Uap7wy9PUdbjQ>
 <xme:Ky6FZlKn6KEfXDCylZBGDsb1EownPLe7kW_qYt3jXCuZ5W3SHVLrvWE2nsSVeeSAM
 w30jItdRVEYI3mQhg>
X-ME-Received: <xmr:Ky6FZhtCW0lfJQDLwgRfra-Pvt8naVkvVXb2d6glajiJrUt-QtGt4wu-0hYQYlsb_S-RWv5vuXb_Fcu1jPexB0XX93NuU8LdfUdk3mHVnsEGD4bD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:Ky6FZqbTBtmdjkL5j5khZeTqq_YB4Pgrsrfd3DdCEt0Kwq7FbBwuog>
 <xmx:Ky6FZgYGW9dsK_RbuYo3p9ducCzg1jZ0udiiYaN5bNef6KNJpUBJ7A>
 <xmx:Ky6FZuCQmbuJnc6Ae7wTjqsVVtpUHoGCsEt9xiR1Mq_DDBV05jE-UQ>
 <xmx:Ky6FZuaAqRlikY_Li5vKtMyp-Jhu-44vNazo2pNJLg-F54alzcZQLg>
 <xmx:Ky6FZtJQZNOsOwUNBlc9gIdvJox0rznctzXRGsVPcVlCjawDKlVrNnEk>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:55:34 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 04/23] drm: sun4i: de2: Initialize layer fields earlier
Date: Wed,  3 Jul 2024 22:50:54 +1200
Message-ID: <20240703105454.41254-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jernej Skrabec <jernej.skrabec@gmail.com>

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 ++++---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 884abe3cf773a..91781b5bbbbce 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -365,6 +365,10 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -395,9 +399,6 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 6ee3790a2a812..329e8bf8cd20d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -549,6 +549,10 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->is_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -607,9 +611,6 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.45.2

