Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC47161EAA2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 06:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C8F10E1E9;
	Mon,  7 Nov 2022 05:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62D10E1E7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 05:45:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 10C895C0075;
 Mon,  7 Nov 2022 00:35:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Nov 2022 00:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1667799355; x=1667885755; bh=1vDdZwoBU9jOrZMlmbLFu38K/
 K9c8EjRaLm7B4fO58A=; b=mbICbAYT0faftU4XpO+/xRLp6RoT9PyELnDveOSLw
 jinx+9/QsGsMkILzBxmAZAgsm06ZeqXMnZc4cdzEPR96f2I+JzJQ1LII0mLJ1pKQ
 MDDx0sF6fgeDr4NWW+FTt13PGgt+rEASCmc+jSBqq8gN2dk6dV0oXdb/iHG1UHjs
 6pLqxMo3YclXaYHp1tnid+gwvgglBKGwsfRIAbbu4l9Fdw9jvRyjEJP5OqxvhLAr
 MdyZiA1FQ/t7Sv9MGrK8zBA8BbmnYpRPwGRQ8YGv0BZJLbh7d9kLfhdCmGit9B8P
 7CmjUAXWm+jwKaUF3wWsnqJ7bKOdRLydxU8YU1z5KfCAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1667799355; x=1667885755; bh=1vDdZwoBU9jOrZMlmbLFu38K/K9c8EjRaLm
 7B4fO58A=; b=pWraLX/NSNcQoIQmKBwY1pWvenBQNoaSA/EuKgfeEtSx9/Coay9
 FDSHsOxNLIQzwInIyCZQYb6j9CU1o4ZYzNmfPVTJWYqU4kyUl8vBjVEej4yelL7a
 EjtX3Otk8i4+UYYqEBQtcR8jC0uMsaSKiPmeP0enYXwWelpJnI7N/cI57wKI0kUk
 aTU7TOWXdjnHNpjFqdwjfEU8OrD7EvpTB/8boeQh0lnHK8RpHrtKlroeFvGNPCXb
 B4IdYxWxUDQzEwbStIb+tsYua3kLLRuEvKRwl5w2NaccuqPEdHjoOBG88PlK6nup
 klCQ09n4+/uYjxUC3k5IrL6Y5I+D4mB0/mA==
X-ME-Sender: <xms:OploY3vAhjnuY2-6qYwoMZWWKyfFT-cJzikoVFSPXMR1FPoOmlWIRg>
 <xme:OploY4eSqPIGhjY3sEUIPXddHHqyMkbWv6VnTUU5RwVnqoJvqGNbniPcHNAKI9Zi5
 M4TbGRw0jJzs8ypAw>
X-ME-Received: <xmr:OploY6wFQOMkgvFvJ6ilrJoyFtQh2qQG_zuQpqYN0buws-NlSWggWGq32_iv_oones0uADGCfcD0qFOK3yf-4a0kus2sHZ8QFNjEJiCG9QgAqSM4wu_DO0QxOr3YZ0CMEuXbvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdejgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
 jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
 htthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeehhffh
 keekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:OploY2Nezu4ZCouVWpCAF6BMruOappBmtVQHwQnxrZ6FrwWv01qz7Q>
 <xmx:OploY3_mMjBd_T9RkCzUrmshwkLZc4GTv65X7kjIdq9WUmNcYaE_UQ>
 <xmx:OploY2XavGBgFoLxa396W6ASLq0qJ0ZezFrFfGcSY7RX-a8GjtSDkQ>
 <xmx:O5loY6V8HXdgzhchTPERmlPv0Mi87GU_qXIWPHUbHf-6QuY1NJ-U8w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 00:35:53 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/4] drm/sun4i: dsi: Support the A100/D1 controller variant
Date: Sun,  6 Nov 2022 23:35:48 -0600
Message-Id: <20221107053552.2330-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.3
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

This series adds support for the digital part of the DSI controller
found in the A100 and D1 SoCs (plus T7, which is not supported by
mainline Linux). There are two changes to the hardware integration:
  1) the module clock routes through the TCON TOP, and
  2) the separate I/O domain is removed.

The actual register interface appears to be the same as before. The
register definitions in the D1 BSP exactly match the A64 BSP.

The BSP describes this as the "40nm" DSI controller variant. There is
also a "28nm" variant with a different register interface; that one is
found in a different subset of SoCs (V5 and A50).

A100/D1 also come with an updated DPHY, described by the BSP as a
"combo" PHY, which is now also used for LVDS channel 0. (LVDS and DSI
share the same pins on Port D.) Since that is a different subsystem,
I am sending that as a separate series.

Changes in v2:
 - Add the variant check to the probe error path

Samuel Holland (4):
  dt-bindings: display: sun6i-dsi: Fix clock conditional
  dt-bindings: display: sun6i-dsi: Add the A100 variant
  drm/sun4i: dsi: Add a variant structure
  drm/sun4i: dsi: Add the A100 variant

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 30 ++++++---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        | 61 +++++++++++++------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h        |  7 +++
 3 files changed, 71 insertions(+), 27 deletions(-)

-- 
2.37.3

