Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D947925A41
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF7D10E79F;
	Wed,  3 Jul 2024 10:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="sqF1KSPr";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="j4bbewp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A0E10E79F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:55:59 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 988781140376;
 Wed,  3 Jul 2024 06:55:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 03 Jul 2024 06:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720004158; x=
 1720090558; bh=9FVj1M2nckPDwVsNFdoMYwGpqYEtbcwzaVecnri7fPk=; b=s
 qF1KSPrZC8vkeRgMnKmBFWgD/FBvM1lBBFYUm5oCF3mfzCHUAzXEn9hInPT+7K+q
 vZtiGwQzoAuDnuxJoGdojHyc/DswAF+moE/iLLqnwlbCR7h6JOa8dbp2e9zg08gf
 HGE9it35F1p77nVoKJhd+lpnJuhLHWT84BRZ5kJ9JF3CtoUfPp4Dgdgdx4ACrL6l
 g2G/2PsULE79sJu5670KXmmZ+JWWcZ6ddjAThN+VVG3Sq37fKeO4+gZj2fnha9AL
 Gc8EurCxeLa+zl06H/B0RDwW8ySSzwS1pb4VlD4DGOUOtK3Ufdt422FM2sZe7yZk
 9ExnoP2vw2rUMufrIYopw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004158; x=
 1720090558; bh=9FVj1M2nckPDwVsNFdoMYwGpqYEtbcwzaVecnri7fPk=; b=j
 4bbewp/kQjxF0k2Gbj3ujsHfuLDSc45oivxBC87LfOhGWTwi/n5PH7hhBz71MVes
 kV+YzF9xXhjEENHO2CKiwR+6nvcsK0XEAU11o1CT5Vi/7GAnZH56fPNOkvkTAJJ2
 U/3moeeRlzWgS97Tjh4SGx9vA2dncbgWJwVpIxSnOrNq81C6SXgr4mTTZbU9CPOa
 1l3HD5U2LzbBCz2URdYDqIQ3O0BmADowNNanRIoivp7vfcBalvWzY3naIE0sXNXT
 j/O/kyfGns2FMSBvKGSW/Ssx82ptg2iITlojnplynF3AyEjyHAbMzOolS4zZtmF+
 4KfK2y5/b3Y+Vzt52HJ/w==
X-ME-Sender: <xms:Pi6FZkI1Z1WHD0by_7DXp-XzuEMKshPYPsucXkqRKSLBel-eKOhong>
 <xme:Pi6FZkIVmbPDkYKg7yabBw_c12Vcbjfn55kNgsrmrftlXtgyOCeQK4gHsN6LfmiR5
 5ryjE9zLzPge88LRg>
X-ME-Received: <xmr:Pi6FZkuxf81zYE-fgiBM96vglIL_ql1sQtUVx57n5GvgmJXkQMRtyX3WQQQLZr7HMuyR_RcejylMrykrDGbXYQtzGHJ7ex_EzQ9jtammuRYfbWRJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:Pi6FZhZLr_iFRJGM3eQu94Ixgm39iDycB3KhwFvQ10MXQV-aaEqxFA>
 <xmx:Pi6FZraApOhyUuV8M3wjyO7h3Vwqcnokt1ipM7AKyp4KDdCTvDpi2Q>
 <xmx:Pi6FZtDtXNYrzCQ48jHKoiVgSvjezs2DldXbBtjs1FxLYM2O3zswkg>
 <xmx:Pi6FZhazl9HM1J8RUgIWWJi3_0uJwUPsnjYXC9A_v6XWziMRKXrAtg>
 <xmx:Pi6FZoIYOgdUc4hT4Zb7lR3N1wccT7kelafraHhXMgoidawhZGjOA0yO>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:55:52 -0400 (EDT)
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
Subject: [PATCH v2 07/23] drm: sun4i: de3: add formatter flag to mixer config
Date: Wed,  3 Jul 2024 22:50:57 +1200
Message-ID: <20240703105454.41254-8-ryan@testtoast.com>
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

Only the DE3 (and newer) display engines have a formatter module. This
could be inferred from the is_de3 flag alone, however this will not
scale with addition of future DE versions in subsequent patches.

Add a separate flag to signal this in the mixer configuration.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 01382860aaeea..0738ee6446330 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -653,6 +653,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.is_de3		= true,
+	.has_formatter	= 1,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 85c94884fb9a4..13401643c7bfc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -162,6 +162,7 @@ enum {
  * @mod_rate: module clock rate that needs to be set in order to have
  *	a functional block.
  * @is_de3: true, if this is next gen display engine 3.0, false otherwise.
+ * @has_formatter: true, if mixer has formatter core, for 10-bit and YUV handling
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  */
 struct sun8i_mixer_cfg {
@@ -171,6 +172,7 @@ struct sun8i_mixer_cfg {
 	int		ccsc;
 	unsigned long	mod_rate;
 	unsigned int	is_de3 : 1;
+	unsigned int    has_formatter : 1;
 	unsigned int	scanline_yuv;
 };
 
-- 
2.45.2

