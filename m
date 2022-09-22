Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E485E657C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FED10EBB4;
	Thu, 22 Sep 2022 14:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0757310EBB3;
 Thu, 22 Sep 2022 14:29:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id B68412B05B3D;
 Thu, 22 Sep 2022 10:28:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 22 Sep 2022 10:28:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856936; x=
 1663864136; bh=7r0O9WFHJ9KQW1LRwe1RDVRyeEourmjpwkBZsM8ZBBU=; b=E
 vsd6BIVLFkzyZONidpAGSbu/i2yx1JG8lzZV34I3XuQR+xJVqIn4TEFOKM8XFg4C
 YfttrRnKCWqCytZHENgy+0Ecg9L9Sw27BZmj4gxlVPYE/f0iYXagqPv/YtPWwcvG
 gndJoHvSebyOfUIz9aliqSb1Jv+KH0s6SFg03hZ3NE++TKSMGgcQ2qvYP+M0aSZ9
 P2w3EYYpkoW921IWqp4OENdEd5YckZr4INj4iFDAIe2GiyJCikQGIAI4OeD0xPPv
 pvq97AO3efnpxwfWAAshlAdodvVG9lbzxctacc8/sBK911FQdOh8t1VfLuYYmqs1
 IdbJ7HyVC3ey61jX3qhQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856936; x=
 1663864136; bh=7r0O9WFHJ9KQW1LRwe1RDVRyeEourmjpwkBZsM8ZBBU=; b=E
 uSar2PBuxpMaada8bJj2qq3I5BRMK//Z911iFmEEQqIGk3PmCubRxSQozK9qqQMV
 My9VDuZ5ZpTOSQS0C7EMW8EE0a96igY2B0udidH+AIa4EVP4HlK4Mw+8qegBg2DL
 jMNJ+MMClDsjtEB3vBhJl57PGSeUN6eclnzktDnEiuOoPQF8O0Jsf7YQRd9tJfWG
 qvhN797j3tjonluTVX0JiTyc/TqyxHZ/REeX/nhKWdRjj7nCYJu/eY9GipRbU5TC
 GGecKyMkp8T+sMsZ4kNFMmjHQCQS55ni5840QUo5/qUxYH6QaGmtNE6G7Q5Deft+
 pRafKtLVCwhtOb0uQy5OQ==
X-ME-Sender: <xms:KHEsY0QjjDafOb8S6o5nl30vXhUzyDmSXgWSSIVec4HQL_-x7HAOBw>
 <xme:KHEsYxw4AOTRbVKCZKOHgjLRnFKdSLSXzinerSfD-LHjQVt3Bka1O89kI7YjyMLhh
 Mx40Ai-OipkG7ivB10>
X-ME-Received: <xmr:KHEsYx1ksT-27QPMjFAAl7SY-SgCwFo62GCc_bAs0NTYL9a3uqKi1xi0c2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KHEsY4AaGTQ0C3p1GZysPOmodFI6TOMYE3UeJIpJneNV_-9ox7oHzg>
 <xmx:KHEsY9gMw2YZnQm7dUf_nlPukSxlNRgqajK1iwbE3iHoMKAxxsFBQg>
 <xmx:KHEsY0oknaaixWHZHvPADngFqywDQdAk9sBe--ZH2xib2RluGNPC5Q>
 <xmx:KHEsYzMOI6qeD_r5CNFnESFZjULiJuEDix9_fGxvpG8YWvfHR5j0nZ1faXk>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:28:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:45 +0200
Subject: [PATCH v2 28/33] drm/vc4: vec: Fix definition of PAL-M mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-28-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=KhLuPV03zkkjEr/AzfTwW/zS/7K13ZQtaRxwyBOIOHw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYETjrQZqVeeu8DLONFkwZ9netqGi172vGtpn7bF77Xj
 yRfyHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhI/GZGhnUmMovNL09dcIjvWqGh9/
 LPmmeuXLp+5uzCvcqMrzeVRu9lZPh51HPJ6kPnuSM26+4Nzp38ql7TbvaZl4t2H6yRe/ozsJQZAA==
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

PAL-M is a Brazilian analog TV standard that uses a PAL-style chroma
subcarrier at 3.575611[888111] MHz on top of 525-line (480i60) timings.
This commit makes the driver actually use the proper VEC preset for this
mode instead of just changing PAL subcarrier frequency.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index f31fef938f11..5ec3a12359b1 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -69,6 +69,7 @@
 #define VEC_CONFIG0_STD_MASK		GENMASK(1, 0)
 #define VEC_CONFIG0_NTSC_STD		0
 #define VEC_CONFIG0_PAL_BDGHI_STD	1
+#define VEC_CONFIG0_PAL_M_STD		2
 #define VEC_CONFIG0_PAL_N_STD		3
 
 #define VEC_SCHPH			0x108
@@ -255,10 +256,9 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_PAL_M] = {
-		.mode = &pal_mode,
-		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
-		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
-		.custom_freq = 0x223b61d1,
+		.mode = &ntsc_mode,
+		.config0 = VEC_CONFIG0_PAL_M_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 };
 

-- 
b4 0.10.0
