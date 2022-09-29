Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01655EFA92
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF33810EAD1;
	Thu, 29 Sep 2022 16:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378CE10EABF;
 Thu, 29 Sep 2022 16:31:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8D10B580800;
 Thu, 29 Sep 2022 12:31:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 29 Sep 2022 12:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469071; x=
 1664476271; bh=xvSxfoBG+878tqacEYmKBzYuHXSaOsMzcuOzjE122uo=; b=w
 ggtXTyjzWc/b6il3VyjAJEDL2ybGbS2532crYaBBgw+31OlOHiJF4MXJWnyUXzRC
 J2YX3dDJrrcg/3L2KUnvxzb3B1ZMYmxSy/2WbuZI0db55MkGHNDBRKatJl894rb6
 +YU5s9iUg+wgBhFuC6ZuQswV0oDnNlHzIFjIDsu/umyrcKXlqmxM++k6oi0Ts1/K
 yo30gAWKbBF27rZ5FWVaHexfeNPV5gRar3veJUap4S8eTeKkLB8UFfNOysKWDM6u
 CCpCsS3SZSOK3im9M4qD2Mf0oJMBvpLd1/AXIkgtna3pj4Itg9cYNn/VwtiBNtdA
 JPY5WsARPVdYf1Q2l1MJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469071; x=
 1664476271; bh=xvSxfoBG+878tqacEYmKBzYuHXSaOsMzcuOzjE122uo=; b=k
 +ymP6ZrxcatciaKtnUBRTkRUAM46OUfJqas3LxStHXozCk46iUfbg1rqmFcZ0jlS
 Fp4eyMUUn1nwLpXyWTOq6jzY/2pnATIP9XXfOVfWFoEtbwn6iAQumJ7tsWG5mr1q
 byyuPqaHyo7l/WjbJ4qGtjUS2NZpkD0Qn3PfaR46v6WjChNSFdtevF1yFxxGSOCc
 /G/mrzMI7qYy82BDqQzRGn+R9A52Fmr3WWJ+lAB5lgBoTHvojIBNGmKoIOBSl37R
 qbxEJltVFxZZdf6w/XDmjghBpTCCoxtWRAUShZcRic0WpRi0xfeJgclsDYiPXiKt
 jv0OhGAndy919e4NLA/mA==
X-ME-Sender: <xms:Tsg1Y3dsPXy31gNtezT0er31y4F5CM-CaDlPqHarRJBBfUht0f5gmA>
 <xme:Tsg1Y9M0RI21nkrKlI25L1jkDIACbQS1r5ZYXVtPCZLbC-IT-_LBUQVAist0MzRzF
 OvpOhSWZd2kUUNrduk>
X-ME-Received: <xmr:Tsg1YwhoZBE5YHVwbXk_rwPfMd-CZGp-hFoQYFTy72YMP3vsKIJtq6wHGRCt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Tsg1Y4_nerkUSrUDd0A6xgbqJSwpLhkvocolP_6y3L9S8nxowsAfWw>
 <xmx:Tsg1YzvWdhuz9tN0GfhFpkDyEkalofYIsI5x8B6yrBoa1j0WRwcO-A>
 <xmx:Tsg1Y3HVXJ8NDkI6ao2Iu_nhy8M-OJBuQDtNANj36u_UbVXsX2ySHw>
 <xmx:T8g1Y05vcfolsfADLzIBTpGJUp9zV4hyctHRZcszDK9ton9FU0CHBw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:30:55 +0200
Subject: [PATCH v4 01/30] drm/docs: Remove unused TV Standard property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-1-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=UvO84g6wM5SraKBKfQ6RBfojfWspX1nu5hOLFSPQwm8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9z0xQua9m1t53W9Yve23uf2HLHlC/9/PPYiotBw0q5Z
 97PkO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRlU4Mfzi69kQ1iHgcTzSr2RNbd/
 2y+p2wZ9Y9Mr8YJyx+nPWrJYjhf41TvcCUifOPGn12FQ7ez1atlbZ1uY/DnXsCLtzK/dYtTAA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That property is not used or exposed by any driver in the kernel. Remove
it from the documentation.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v4:
- New patch
---
 Documentation/gpu/kms-properties.csv | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
index 07ed22ea3bd6..45c12e3e82f4 100644
--- a/Documentation/gpu/kms-properties.csv
+++ b/Documentation/gpu/kms-properties.csv
@@ -91,7 +91,6 @@ omap,Generic,“zorder”,RANGE,"Min=0, Max=3","CRTC, Plane",TBD
 qxl,Generic,"“hotplug_mode_update""",RANGE,"Min=0, Max=1",Connector,TBD
 radeon,DVI-I,“coherent”,RANGE,"Min=0, Max=1",Connector,TBD
 ,DAC enable load detect,“load detection”,RANGE,"Min=0, Max=1",Connector,TBD
-,TV Standard,"""tv standard""",ENUM,"{ ""ntsc"", ""pal"", ""pal-m"", ""pal-60"", ""ntsc-j"" , ""scart-pal"", ""pal-cn"", ""secam"" }",Connector,TBD
 ,legacy TMDS PLL detect,"""tmds_pll""",ENUM,"{ ""driver"", ""bios"" }",-,TBD
 ,Underscan,"""underscan""",ENUM,"{ ""off"", ""on"", ""auto"" }",Connector,TBD
 ,,"""underscan hborder""",RANGE,"Min=0, Max=128",Connector,TBD

-- 
b4 0.11.0-dev-7da52
