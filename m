Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2091541C0DE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 10:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA5B6EA0C;
	Wed, 29 Sep 2021 08:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC256EA07
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:43:01 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 571613201C48;
 Wed, 29 Sep 2021 04:43:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 29 Sep 2021 04:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=y1we0ectZ+Ojy
 3Wq8gV3g/l6x6zUkvdvYCKQ8aXDtRw=; b=ZZysxaltuMcka0Y15cVZZaV71V1zX
 PzBk+2bVXqlHNO3T1QLsCW/EdKaWuhJdcNjzfmTi+Gq24DiqiSpQtXVCP9jpLlC0
 W8vhLP2e6fXuQ+JsNPP4TPptaLAXRsjUIPshCgT9JuzFD7tI8qSd91+Fy/YvUsd4
 Hz20if0YrhP1naESidlyg2WoEYL0WtzGNfe3Zd6Ew58/u6kqtgvKLKhWod5L7n2i
 2oV/VqsLhwPWUMsIljXiRQ1fGDDSJEkcD0MdECtW78Q90ocv/a+1OfTES1XYOdj5
 6V7bvPRSF51QMyE3NIZ8Fl7lhK7YNIu0kylGt/B5J8w+UN4OnV3hVMceg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=y1we0ectZ+Ojy3Wq8gV3g/l6x6zUkvdvYCKQ8aXDtRw=; b=X9B8x0kH
 BMtecVlJVIrzCJgIK1Q5lXWriZTlUBudfq6OtltxYQjvcV30X6kiVsyNlCFpEx43
 PqRNhYcoq/2cEgOYZ03i2tmAVB0pxg4a4AvFOu//s9t+7vh+fCWk5Fec6+p+eMTM
 sF3Ijc9GEZTrBKOEY3TboW8oonfGPX/S/mtpMb4WxQMmSir4r3CbtmeeYeY60+3t
 Nvc3Q3FCAiwfNlnnjXZ6p3+01wQvETTe8UJf02Y3iYPMwxjSqqMf1YAwO/IWDZr4
 F0QYdlonu/5uLHq2Gizlmu1/oLkaHxz2DmHKKnSurpGKf7Nk0US3C7FZVhvtE2v+
 XNnX405TPBO3Pg==
X-ME-Sender: <xms:EydUYbacI2ej_HhbDrENk0jlpEsBvM5XKLrISaAt2MLLwyKYQWJdeA>
 <xme:EydUYaZZs3zXj28nVoDcaoTd20QwJuQF1QnVMwZ0K95-uhbdlHse8iMH98ya-UaEN
 fScMKMgVqWXJycf3AA>
X-ME-Received: <xmr:EydUYd-nUMvFMzabo_SjQjK5Llw0DYVo2LQHhjmZk8furvHrJJNa1fWAIieupDnONuNiDWLrsRzZiQM-Ff6U1Aa2uXKss946aq1Pbs-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EydUYRpAoXBU82zo-AGJgWiTl34hcoo3Kzdsy8capZaLacOJMWZdMg>
 <xmx:EydUYWpre7Tdm0FurXPKuttg9hRpL6eJsybC9eTFyUhPg0vM1BoreA>
 <xmx:EydUYXSUrC2weeDijdEJiP3JNXkIQKNQDfZyZa8fST6SFs_2v0vKFA>
 <xmx:EydUYSdGhSn62qtu_sSkl3FOwlLOjOsvbepOYutEu8a5HiDpRulzsQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 04:42:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 6/7] drm/sun4i: tcon: Enable the A20 dual-link output
Date: Wed, 29 Sep 2021 10:42:33 +0200
Message-Id: <20210929084234.1271915-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929084234.1271915-1-maxime@cerno.tech>
References: <20210929084234.1271915-1-maxime@cerno.tech>
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

The A20 second TCON (TCON1) can be used as a secondary output to drive a
dual-link LVDS output. Let's add it to our capabilities.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index c7c94b7c6439..2855ff70418d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1521,6 +1521,7 @@ static const struct sun4i_tcon_quirks sun7i_a20_tcon0_quirks = {
 };
 
 static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
+	.supports_lvds		= true,
 	.has_channel_0		= true,
 	.has_channel_1		= true,
 	.dclk_min_div		= 4,
-- 
2.31.1

