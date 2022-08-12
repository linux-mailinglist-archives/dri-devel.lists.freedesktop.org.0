Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D475C590CBC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B346A18A89C;
	Fri, 12 Aug 2022 07:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7764B12B6BB
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:43:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CD6265C01A1;
 Fri, 12 Aug 2022 03:43:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 12 Aug 2022 03:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1660290182; x=1660376582; bh=kx
 +9JKlWu32A6DmgeW0vWkd2q0Mj+Ryf50uEWGXvNj8=; b=iIKLRIB19DcRslJJ2i
 adprTUQaPIsQ6jWhm4grS6ilrNmR9s+mlmQ9Ap7mS0iLmzfOTo1CbSzpt2PVQBp1
 7K1qulONUQOnVGU+eczWFLYnrIjd/JYZ/PRyesvlNLvX8vwq/O12ycqIdCC1ikNr
 cK/ySOF7clrtLGp+UmM2zW8vG9znmrCzYjzglv2QGwwXfMqTnD2DAS50fVxrxoSu
 fXLyVobNuIMEDPwH0x55Nrn2+Srw2K6mTW9qE68AM6c7U0SC/GUd46TbjOtyoVcv
 R0gbUWn97Y7pEEaxlJjocOt+EnxzOn88dqL40hNzCm57F+4Tpp5JFbr4nxZiiHag
 qK4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1660290182; x=1660376582; bh=kx+9JKlWu32A6
 DmgeW0vWkd2q0Mj+Ryf50uEWGXvNj8=; b=FKlhHqc3qMj2+NtbJ+qjwEVCP1sZG
 Pv4n0OPhUiSWUR81+UCNTJriHcL7UR9FbxdZ0nbw9xxsIceKrh+oUs8nBnMGxlSA
 ihmVy7CFLt6jhAUuD6JMxdbn6oVn447U/xCC+XJgJBKqs3H5igTszzS4NZuGLhwQ
 ehTVayYpahVDx3WlGU16Pm3wpEuD5rw9vIfFZVIWkVO+65r5IINvrywYCNztzQJM
 6jAY0CU/TLUuxhY5+l/Y6b/E5jjZ3Ald7DKHcOOXw+VdIzvtuA2niJ5XEI8XXvmq
 cI0mGllRt6QizGExAwuuVLBlcpKDkOQCN+qppS02BT6IHYemcr+YRrTLw==
X-ME-Sender: <xms:hgT2Yg6Bbv6ol6cTdCTK0j6GTpB9B2HN7o8UVO39ON_azn7DH8R4Yw>
 <xme:hgT2Yh6j3QEKDVkIPYTQSCQyBCLk82_inKC1XjTmhuxDz3Pr8mgZCOshAp6ZeqDuv
 ZIr8zzeAZ9Wbu973Q>
X-ME-Received: <xmr:hgT2Yve_80bIAiFOtB_BQxsCD_3ZpsnIwjY6TMyJ8MceGwPK5a6cnUow1GJVESA93H7Wl9b1DXIn92kmo2isLC-hN6qKIYKA6xXyoDvxES25gvKlc-3Q5pCf2wTdA3pvav2tcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeghedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
 gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:hgT2YlIS2KK6NuTI-2pNcotAgru7l6NVUnQAxbZnETLu25KJQ0wwKQ>
 <xmx:hgT2YkI9UbL8F_CD4HRU7tR2oG0QJsyzHD5X80CwAAaC-3K1IJGBVg>
 <xmx:hgT2Ymz9Xh-tYR-3ETZPvHZ36-Naq2C9Xv85nut1TLWrt5Rn9ynjtg>
 <xmx:hgT2YmClg_8a5ajGyKXImZ1ft7f8rin0pzazTvRa8oSkr5ozxluSjw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 03:43:02 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 4/4] drm/sun4i: dsi: Add the A100 variant
Date: Fri, 12 Aug 2022 02:42:56 -0500
Message-Id: <20220812074257.58254-5-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220812074257.58254-1-samuel@sholland.org>
References: <20220812074257.58254-1-samuel@sholland.org>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The A100 variant of the MIPI DSI controller now gets its module clock
from the TCON via the TCON TOP, so the clock rate cannot be set to a
fixed value. Otherwise, it appears to be the same as the A31 variant.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 6479ade416b9..5db5ecdc2fc6 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1222,6 +1222,10 @@ static const struct sun6i_dsi_variant sun6i_a31_mipi_dsi_variant = {
 static const struct sun6i_dsi_variant sun50i_a64_mipi_dsi_variant = {
 };
 
+static const struct sun6i_dsi_variant sun50i_a100_mipi_dsi_variant = {
+	.has_mod_clk	= true,
+};
+
 static const struct of_device_id sun6i_dsi_of_table[] = {
 	{
 		.compatible	= "allwinner,sun6i-a31-mipi-dsi",
@@ -1231,6 +1235,10 @@ static const struct of_device_id sun6i_dsi_of_table[] = {
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
2.35.1

