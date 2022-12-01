Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C575D63EB72
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238E210E572;
	Thu,  1 Dec 2022 08:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D05510E56E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:44:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 97CC15C01BB;
 Thu,  1 Dec 2022 03:44:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 01 Dec 2022 03:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669884257; x=
 1669970657; bh=xhtPz8Dqfioscgg3yoemS47J761NmMtmupbcefOZt74=; b=L
 EPujtsgIwX9f0NvrpTUvntk97RsOQ+/vo7iQc8rjmEyChhHV3VEga350Tvp8cO0y
 N9MKH5vP5y4vF+EB1U5bc93YwDhDEW6zAgF+ViC8O2FfASifS6aIvBU2BLC0AQQ2
 lp/o3AdYfCuJCaOwmZdtfBpuLEJCCsZAEbxHqdHBpL8FXed6VaXrBRC4ht6ATaN1
 hRMXdZDhql0KdRVxMdUiLfk9PpJdU/wwRbSgGvnd0fh3AlY6rM4TCspa2CJ+qM33
 AASkTBOg63ubv48QWqP4RMG9ky5YgkMyfQQxCKRVYLnoOxE58b2qRKyatXZPjoO4
 RAxPQ0q6og2WrDpjITlqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669884257; x=
 1669970657; bh=xhtPz8Dqfioscgg3yoemS47J761NmMtmupbcefOZt74=; b=Y
 uxkCK706usNCWT/0noaHtovqnraHJGKlOkm+znWiY3dqjjmINVbDI6UNlTG09u1m
 3W08iWKxkRSKQ7/pl62UYTZd0G3+YrJ5yltG9CrjjrSGH4epIZwkA+AxieZ4AbIf
 FVD/1d1yj0r6ubChen63Za4XmSJKdB+UYdEG7edGf2aUgCmsWKpk/6c86QBVQ3Fz
 yszH0URpNUT7LTJSe1v1oCa4x493WHNvPdpCQU0BykFQeSGxTKPAAbI9hBUaVD1Z
 5fZVQWPTG5rrzZ84bGZ4kJux30sQH/xJeJBgRKvJ3X4rmSxWZQ7+OzhOggv/kJ+d
 RxK+um0h0cNDfH4ms3Hcg==
X-ME-Sender: <xms:YWmIY3d5DVItsj9XJh9s2aWg_wgdIC0dleXuDDqZtpJk_8A0xeW6ZA>
 <xme:YWmIY9O9h35Iuic_k94lNw_Jv4OSuYX11CXu-wgbkg4ej-0EK6_DqYNIRd9m6JZ_L
 4sBNNJjSz5H6VlsfEQ>
X-ME-Received: <xmr:YWmIYwi9O8S24_oc6kdPJrXCzkvW0PoejgETmRsdYrY9SMAKCLiaLrDNNgAplAWk4dmhjL8qigYirTXr6C-JGpbI11vjh9CoK05qmRyQdIt02Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeggdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YWmIY48YiLHNpa9NVjstLdu7wNDMhFc8h5Yvhe0FuYtzkXsVmUho_Q>
 <xmx:YWmIYzuzGr8X7ZWY_ITWFkMERRV6wSdeWxvRwFAKswTqAlrFJa3hSw>
 <xmx:YWmIY3Hur0Dq4W3yG9djPEbwPK1fPrSnKuKnPDn81DV9SavEx8-V_w>
 <xmx:YWmIY3BQg2_OzwDS4v0YHnNMmUI9w81xELGhsxeXzgoFV2ea56xtdg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 03:44:16 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 09:42:52 +0100
Subject: [PATCH v3 7/7] drm/vc4: dpi: Fix format mapping for RGB565
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v3-7-eb76e26a772d@cerno.tech>
References: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=43Ff0zFIOvU8ONzBI2sMboXcyvjpYfdtbjUUqEZ+IMo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdmeyBO2J0pyzr3P+f64RJ9zzB10/KgzcvuVzG6r3T/gL/
 zwkMHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjInluMDHfyr4ryz/qj8kzhQ0AvK9
 8UFu+G2MN8ET+NuM8yrJO+6cjIMHfT0mm+4eyCeqr/e1Q6wlpapRinGJ+cME19xmmDXVZCjAA=
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

The mapping is incorrect for RGB565_1X16 as it should be
DPI_FORMAT_18BIT_666_RGB_1 instead of DPI_FORMAT_18BIT_666_RGB_3.

Fixes: 08302c35b59d ("drm/vc4: Add DPI driver")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index fdae02760b6d..a7bebfa5d5b0 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -185,7 +185,7 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 						       DPI_FORMAT);
 				break;
 			case MEDIA_BUS_FMT_RGB565_1X16:
-				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
+				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_1,
 						       DPI_FORMAT);
 				break;
 			case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:

-- 
b4 0.10.1
