Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3403E9102A7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6359610E930;
	Thu, 20 Jun 2024 11:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="ldhWSEP6";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="q5idu/0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADF410E92C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:32:49 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 8CBAC1140247;
 Thu, 20 Jun 2024 07:32:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 20 Jun 2024 07:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1718883168; x=
 1718969568; bh=9FVj1M2nckPDwVsNFdoMYwGpqYEtbcwzaVecnri7fPk=; b=l
 dhWSEP6OuHEWepxOxFEU8siN/FqE0aPyBZEL9mwTv6KtdWaiuK9rgftcAkBeDPlK
 BT7AmXuWg8Ab9HiVn8Uxj/u+cfS3XYM1XHRXUzLAgTqKO3lPrOfo59iqgfrxp3J7
 h43CJwjf738yChUv/TdeYI24U801pX2+NJkysdgDBWNnvDznED4MiOrk/6OjyX3z
 Z0VW+H8/KMY68eCB6g2u9rTOftrZ9V68ldlESCFtqXYyhkH4gh6FDWPS5w4Rp0EW
 xCTmpbYfaZictBebdXuUfPFyucyLiBi5bpNwxauiD0ONPITFcJz8Z7dxNTrQYAqx
 aQ2VC0j233jlDF5rikh1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883168; x=
 1718969568; bh=9FVj1M2nckPDwVsNFdoMYwGpqYEtbcwzaVecnri7fPk=; b=q
 5idu/0YwCWDB7mY0jJ1QARqCotzkNAQZwNQWflX8gqASlDehurXWIVE5JmFgT5+D
 AerUAlvcSS/LwOdCK5NV2CKvx8wUp0ZotbIjlvNfZqvjNOVR6kQfFSs+48tSU6mm
 LVet7BICaH6P7mCdeN1NDB5enjVLLzveUrkRaNgVsawUlcS5TJfVDipytWV3pr24
 nG4uuUPeg0SLi+Mdak5KMjtNDe/qAAgOS2XFMRZT8BkMl7f+wCTqfWzF69ffLrn+
 IVFiDta+qzQWKAwR7qr8/h1oHiyLWqfLzKXQ+VYx2er7krsdxIYjqC0p1HOxejk5
 /UYLlk4H21cV5mpKayROw==
X-ME-Sender: <xms:YBN0Zh-g3PdYfJBTux2z7Ulend-WKzilvV4KakfBErX98nQjpdeRQQ>
 <xme:YBN0ZlsjVodAf8sd7I0ZTf6hQzKDqt2S1AiUV-6rbx1cXRR-AYhY5cBvCpz3Hhp8M
 mJtNn0tJkjftWZDow>
X-ME-Received: <xmr:YBN0ZvAntXy2Txp6tHTQ-to0tJkcMoQLFtFKEgiHaDD7w2jiIdtYvYZP7-q3Ij4YMgDVRBRocM4J0f2BFarLSjbP2GDPOELg2be4gCb3sXGk9uaU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
 ieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:YBN0ZlcNJxF0_zU_jAJMrVs5BLbYnceNVLl_h7I8wyojLlE_y0q9TQ>
 <xmx:YBN0ZmOcFF4sbdMPXwCP01j9tluzkb6b1pZfBdzDpwS3MlS5O16J0Q>
 <xmx:YBN0ZnkkchlIRsu7WNmRAbB7OfTk33bfVHRwUc7MMlcPm3WQT3JuwQ>
 <xmx:YBN0ZgvPh2LmT6hOYy42tEKqCcNqpcvUYTMJzpt7mTw0A3adF4L1wQ>
 <xmx:YBN0Zt81V2GcDzw5T4pVzuHLj1ZM7aLVBih8RR8GNpQhr7l-KYWMCR1i>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:32:43 -0400 (EDT)
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
Subject: [PATCH 07/23] drm: sun4i: de3: add formatter flag to mixer config
Date: Thu, 20 Jun 2024 23:29:45 +1200
Message-ID: <20240620113150.83466-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620113150.83466-1-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
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

