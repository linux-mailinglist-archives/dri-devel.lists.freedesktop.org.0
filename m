Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5706954C0E6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 06:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F309710EA54;
	Wed, 15 Jun 2022 04:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202B010EA54
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 04:55:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id BC0C2320095F;
 Wed, 15 Jun 2022 00:55:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 15 Jun 2022 00:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1655268946; x=1655355346; bh=+UsEpNLfWCp1EdVbEX/suhZGT
 npHlG7eCC0g75eYQtM=; b=QGF/T2ZhbqkvwXgU5+bVxMCJZNN7Qewl9EBzEEfT/
 9GttAmpyVg1qaI3YqWBWA1GQ5okdR+JOq7XKzdpiKB7VZqet2ZsFB7NpWmF/RDFL
 1Bd2tdxZZPa5jjIHYRU3xJDK0A93loYQaVG0awQTCyGxKB30qXLTGYrU4pjxQKDL
 pnplYneJN8pzmMdi3HCEPJC7euq4zizL3BKzLZxp7eT20zN8zCG8mCpNSrMKZJUP
 jVu0McdAoQLSDO/+dFEEmg/NTYdk6K1J91q2fzerk4PHv4/pty8HvOUmUV/emU1V
 4qGZLh5TzVFGV3vKkBc7p8GG9ReE7PTKePi7muCWNY46A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1655268946; x=1655355346; bh=+UsEpNLfWCp1EdVbEX/suhZGTnpHlG7eCC0
 g75eYQtM=; b=WGkIETKLw0jDh1xXnJWsIMsjOShb/avs9Wx/3f17TJT88Swp31f
 3Z1n8XonQRo3Mx/vPiGe3oDDil/1LdVnwkLFn9biptpUSQdDPy6a5qQiRehR9Of8
 kK254FlhO6F+b2OBFABNiUvz+ULTHA/aFjWlbfLIArjWobZzFS93wz7sbUBJryEW
 94w3fBAxkxUsQzLHSh25sL0VXF5r3d/z3vfKfG5Y5FD2RCE9muZ3pnDGsB2rKpYR
 Iz/Kj4dNBCyGThgMfnCqCme7wYsw2vWVFrgF2kFFI+vGIzaTIxBVgD8pjurHm7rv
 IhrquGNaneOnuQXXk/OASMbYRF0VM7sU9MA==
X-ME-Sender: <xms:UWapYm3_Gg99QM31gBTQh9-fWL2ARTOJlEYc-6EDxfElaw59SlJFIw>
 <xme:UWapYpHLbPatcUC_ILfl5o41FcoRp1mx4x-Af9xTWKFXdLABFO69pZmdveJioUBVm
 lvNrEfIHcVTzNcjjQ>
X-ME-Received: <xmr:UWapYu5KQwomsLZtBG37g1VzLZNNC85gyz_5RR31high6Zv-sFRylpjrz3WzdJhhlUTgAt6nVTP-oScR8UZVGeQ4ZNUkl680HFHU-5sAcaCSfLmgWl_k7JUaFufU73iAWxAnHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvtddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
 hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:UWapYn0nRJBZYoVA-dFVoBYiCXmzEqv3vy4OiOQNCNd7BH592qDfsA>
 <xmx:UWapYpHi_rHEYmxjxZEScWTzmwFU2F97zi-86nUck7XIRVt_XzCvgQ>
 <xmx:UWapYg9ap-Uend13uIPFfeZKVPC4xSZQZ-3Y13Wsm0eGnx7RpDYkrw>
 <xmx:UmapYoAhVgvSHy3RVMV4DUC3T2vgr2RgLuh4S6pYTwzex0wNy9RLEQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 00:55:44 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/6] drm/sun4i: HDMI PHY cleanup/refactoring
Date: Tue, 14 Jun 2022 23:55:37 -0500
Message-Id: <20220615045543.62813-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series prepares the sun8i HDMI PHY driver for supporting the new
custom PHY in the Allwinner D1 SoC. No functional change intended here.

This series was tested on D1, H3, and H6.

Changes in v2:
 - Move error handling inside variant checks in probe function

Samuel Holland (6):
  drm/sun4i: sun8i-hdmi-phy: Use of_device_get_match_data
  drm/sun4i: sun8i-hdmi-phy: Use devm_platform_ioremap_resource
  drm/sun4i: sun8i-hdmi-phy: Used device-managed clocks/resets
  drm/sun4i: sun8i-hdmi-phy: Support multiple custom PHY ops
  drm/sun4i: sun8i-hdmi-phy: Separate A83T and H3 PHY ops
  drm/sun4i: sun8i-hdmi-phy: Group PHY ops functions by generation

 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |   9 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 242 ++++++++++---------------
 2 files changed, 97 insertions(+), 154 deletions(-)

-- 
2.35.1

