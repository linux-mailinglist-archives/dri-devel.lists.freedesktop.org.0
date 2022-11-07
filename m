Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F1861EA9E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 06:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE71410E1DD;
	Mon,  7 Nov 2022 05:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5948C10E1E6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 05:45:53 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C40E25C010F;
 Mon,  7 Nov 2022 00:35:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 07 Nov 2022 00:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1667799359; x=1667885759; bh=CT
 F3MeYBdYDb9QkjYMGL6Erp3oYYPDieKsIYfX3UM/o=; b=oztyJd2DwVU66oSlO4
 hU2Ylwpd5r1sGPpUVIZgDeVlN1YDysjnKxtHaa5Eog5QGNexxDJUxh7iPO4WBL++
 XqHRfDNfAzaXQxVPKm3KUjKI6+6/KZrzopx/A6efEm/VPPqotGYXxk7fOkpnz21o
 DJffO8LVzKGG26HyVWUGDtulT85+blUv8sbvW5i4AxZ4H8eA6u3Y3pJbDeEZh4FL
 2MorhqWRAWmzYckreZAHD1I9x2P0aw/OWMM5GrXXcZC8iD4eNNDUFshOHDzJ1qoz
 6JIdDlbRFkVRc6Z+sMAU85kJ2/wBNQYH+5vLeWqhRgVnUo9xbuOWCnPq0oGGvv8d
 +8UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667799359; x=1667885759; bh=CTF3MeYBdYDb9
 QkjYMGL6Erp3oYYPDieKsIYfX3UM/o=; b=hxhSlOjhW0zlCMgveB+jr7nbj6mHp
 ziNeGtdMV4fuZHTiLUT2y7+ZOy4/61VkkNcvW3yR8+JV1nihEsL083adPxSosn/j
 4MjY6vOxJ4vFEiUfnENhtsW0WDEa9M1PQUZ4iuF+JODFtDb6BxHCVrM1AHEEHiRh
 cZpNuxlL8pllUnjBAnu+1ioeKJJOkfKcxPjxXtLcXMmlXYsIG5iBENAK3AePEJ7b
 HeZo6N7bRMfqxii0x+3KL2x2xG97kT/dUa5Fhgdx42bFJZGzSvVHvugyv0vnk6oC
 XGwg1Eo0w7VuMRrnc+ltGbazO46gLhWDz0ZvmpgxayWgTD9Yn3VlNag4Q==
X-ME-Sender: <xms:P5loY0mLaQDs_5T0oflYK9ATlt1_ZpWCW_jK1p__glbPK3GjBi9Mfg>
 <xme:P5loYz0AVv11fcTRMMC58DzOVEMq92ufIFrcYn53VjKWUFYW48VabekIUoehyhu0-
 GzfYNqp-kMV89IqJw>
X-ME-Received: <xmr:P5loYypAcTeL3g_tCkRTbTTM1YOcD-GtqnOu-wrlPMfTec5peHfB4jIX0rHFBVMSWmEXgh4HAOViBpvJscwlUE5VrI_vRbOZpcuW_Fw1MOh8MgnvQyp3mpkBdwEjisa8DAiqkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdejgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:P5loYwl6eTLBfzDzx7tfxAyJ0UW35UhvSVv5TpxpEzr61gPjSmTtYQ>
 <xmx:P5loYy3Q7Cu81eRcaPX6QU3e5nb9IwWAp-VlJN_SAvlVSk9jcDW1uw>
 <xmx:P5loY3utP-fKV6JfylFmk0ygsAMWnoq2oc_nZ0z49Oq_9q_LPTWQ1A>
 <xmx:P5loY4P0CNm9-iFcoo_1tKLvSMx2-jk4mzarSiDtV6nqgPTLDY3vpA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 00:35:58 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 4/4] drm/sun4i: dsi: Add the A100 variant
Date: Sun,  6 Nov 2022 23:35:52 -0600
Message-Id: <20221107053552.2330-5-samuel@sholland.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221107053552.2330-1-samuel@sholland.org>
References: <20221107053552.2330-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The A100 variant of the MIPI DSI controller now gets its module clock
from the TCON via the TCON TOP, so the clock rate cannot be set to a
fixed value. Otherwise, it appears to be the same as the A31 variant.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index f22c96cc8408..760ff05eabf4 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1223,6 +1223,10 @@ static const struct sun6i_dsi_variant sun6i_a31_mipi_dsi_variant = {
 static const struct sun6i_dsi_variant sun50i_a64_mipi_dsi_variant = {
 };
 
+static const struct sun6i_dsi_variant sun50i_a100_mipi_dsi_variant = {
+	.has_mod_clk	= true,
+};
+
 static const struct of_device_id sun6i_dsi_of_table[] = {
 	{
 		.compatible	= "allwinner,sun6i-a31-mipi-dsi",
@@ -1232,6 +1236,10 @@ static const struct of_device_id sun6i_dsi_of_table[] = {
 		.compatible	= "allwinner,sun50i-a64-mipi-dsi",
 		.data		= &sun50i_a64_mipi_dsi_variant,
 	},
+	{
+		.compatible	= "allwinner,sun50i-a100-mipi-dsi",
+		.data		= &sun50i_a100_mipi_dsi_variant,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dsi_of_table);
-- 
2.37.3

