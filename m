Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8403D63EB71
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A7E10E56E;
	Thu,  1 Dec 2022 08:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF55410E570
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:44:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C1645C01AE;
 Thu,  1 Dec 2022 03:44:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 01 Dec 2022 03:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669884255; x=
 1669970655; bh=1vlWw3HWcseVhvxGIduvYvORASnSFa/0anA5xMkzYTs=; b=A
 IMDJY/TOTF3FYZzKSFfSABapNtMgtstVZZwPeU5tKwfQ/u+pFUVhSViIyij4b0wO
 zbi7B659HN/qnkihiSgKXKhtZ69me94ozqbcO2OiB7a3i9yA60qkLT4TKW1eEVW1
 fqwKC34AGKgw7uiTCkwIuUkCRDD27e0W49U0OJ2poV45otO2cZTdutwKYYKgxz6O
 xprIf2xbVxeuLCqjjh5uEXBCnn51PY12qzbs4GM/1jSkZamnTjBBCLAPLCXVv1xY
 DJGtTbvq1clXMBYNtYOeYDq64LjMez+oS6L3X4QNWzuR00no+Dpbq06xhZBfouJJ
 eT+VM+DEY4a4TtrjnmI0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669884255; x=
 1669970655; bh=1vlWw3HWcseVhvxGIduvYvORASnSFa/0anA5xMkzYTs=; b=n
 ttMxKjSzh6M1U2J8XdbUvNH5nZj+9szvM34E4c08/kAKIZBCDAId0EDZ3C9YEK+J
 TzrafALHEbox1ajJW0Q/1Er88htT2sfmcE1Tl59bs6XdTMwsSb0xLQKTdfYjV/L6
 DYCqw8rEM6aE7z/SQmxXURuWwiX2m0vyXcI7HpKg2sMeWSdeoZhJFae4L8xGwwfP
 Xh6EV25U4a7xvFExDK1w1SAzSHp7Rp51EbEZc5J1wjXnjNLeW211AAqDhzCu7ZVp
 GzQsVozVLrT+NT5vciZTyquUNC3FOt37D+hHuJa7vcZLz533nHSxGK1guqTS5vKh
 V11TURURvDZXPcYlFGCsA==
X-ME-Sender: <xms:X2mIY54wfdxV3o9PxDQmr9UG1K743PpjO4E53iO3ztZe_MBFP6ae5g>
 <xme:X2mIY27DmXgPW7lv0-gSB2jdWeWjF7P6y9BIycxoFc1tswkaz3zUt1jWXTV1csMrv
 npfq25f32dy3_frFJU>
X-ME-Received: <xmr:X2mIYwdi1QO95QYcmvrMbBNI9Bk-W5TjqpFzWyXEV46oH3SZOo_C5qjZs5NuANu6mvWGk4iXyYWlcLndBMWVO3rQnliH2GWc6WNadfZD60Spsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeggdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:X2mIYyJzRA1UNeclhNtFR1cUsp8mB12CW_687gRKSJaZI9ERhxhafQ>
 <xmx:X2mIY9JVMQEsXuj_z-DyNaRkI0vc-y-xnG8DbE5awwAn4gm6FnP4lg>
 <xmx:X2mIY7zSmo-JnXQU4F5m9ov7ay6lakmwVBkujNCLVdaFqC4pX0G6kA>
 <xmx:X2mIY4cKai1rzk0RvxeAySlrDRz3aLcVzRo0EB1iMhXGLH7ztIxM_A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 03:44:14 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 09:42:51 +0100
Subject: [PATCH v3 6/7] drm/vc4: dpi: Change the default DPI format to being
 18bpp, not 24.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v3-6-eb76e26a772d@cerno.tech>
References: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Cj2SqCiv0e+hjTKV6Xz2WDeMWOb4ZCwlvcwXbXBSakE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdmeziL3SX7zTrdP5+OHjOkrnCmxbrdmXuj3bKLXVqEgs8
 c6ejo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOJm8DIcGpr/V/O79tuXdWqbfmh6n
 W57GFLhYNumMCrp72Xi9e/j2ZkmJZQ/Ovcls2bZx8IEhXgTPszQeDy78sbk56V/r5y2eyvPysA
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Morgan <macromorgan@hotmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

DPI hasn't really been used up until now, so the default has
been meaningless.
In theory we should be able to pass the desired format for the
adjacent bridge chip through, but framework seems to be missing
for that.

As the main device to use DPI is the VGA666 or Adafruit Kippah,
both of which use RGB666, change the default to being RGB666 instead
of RGB888.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index ecbe4cd87036..fdae02760b6d 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -150,8 +150,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
-	/* Default to 24bit if no connector or format found. */
-	dpi_c |= VC4_SET_FIELD(DPI_FORMAT_24BIT_888_RGB, DPI_FORMAT);
+	/* Default to 18bit if no connector or format found. */
+	dpi_c |= VC4_SET_FIELD(DPI_FORMAT_18BIT_666_RGB_1, DPI_FORMAT);
 
 	if (connector) {
 		if (connector->display_info.num_bus_formats) {

-- 
b4 0.10.1
