Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD596F81C2
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 13:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0313B10E5D3;
	Fri,  5 May 2023 11:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513F910E5D3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 11:27:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BF0CA3200A4A;
 Fri,  5 May 2023 07:27:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 05 May 2023 07:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1683286064; x=1683372464; bh=AnLxhZc0fJ786bDyYlnqjLFWU1yTiqKFnDO
 TZk4ZctM=; b=jNz8XBKM8k/IoDrLX2BJXu0sHDbxUSKj7zGGt6hPrkrK1hHb1TE
 dgQ1P+ulwD/wD4njeNHAyo5XD99WOHv9cOMII8Uvu1K6uXR5A5/kYK/6DS0G2MjN
 Tb9ar8tPCRVG/Fr9gB6oDHj6S/a6FMjw6EJCZLcrbJsI6uoRR3pGqZQ4FeolB9LG
 XQXpQahE9yFQJnvNwaJIV9x041lfg51AEocRrY/LQvuzGsz456wnEj/PTW9pHMMZ
 WLPZiYCyghFOutsHYtr+Shhxn0nzG8bb0tLuKjRLF55W1q/fGt1U6TRSUVJmJwgu
 GqpxSEvvvqSHrUM4ITazFI9k/yE3jvDheGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683286064; x=1683372464; bh=AnLxhZc0fJ786bDyYlnqjLFWU1yTiqKFnDO
 TZk4ZctM=; b=GwE85ilGSMjZUj5GgflYbC9/TxxeOOGWXXqPX7TQU96z7o0pNQK
 BIE2Uj2ZCJJ5ne1D6+yo9P6LumdkUPjEvPpDXEEAxPEkAqNnNITWvGboyVrZk+1K
 QR6GsXMOontVgeJ+ViC2in6zzxB7ZNxot/Ud4Ys7ImxZSwowFkpibD7QTr4Zyx+1
 XbUUDVQ2XDE4WDGuJfhcrBXmDb02PVeqz60BNyAhEfpNlJPVXZFcmrQDICDS58Dw
 C0bQVmDJABWDkfjSKXdSdj3q3ykdp+2LMG3cNj2eQQ2wwEuH/8T80J3mUVpmL5Dt
 8V7WVsnN+F+GmPZOlwkxb9OwGgIAkNXeOKQ==
X-ME-Sender: <xms:MOhUZNHSNoOgyHh0sbfuuqb0-ObH5Q9ySKqooW-9BIvqoROrTNDd7w>
 <xme:MOhUZCWlYf5E1oHctAZiKKi7saEIuJbXBTfSa6riGgyHgn5ogVD_n1dBVSpFljq9b
 fh3kr9xGJhDqpPls-8>
X-ME-Received: <xmr:MOhUZPLmblUJ7dC0ptuzS0QmaqXcSn976iJfe2RuN-euIh0w7yWLNFF_4KIf5-4MFCKZ0fJU-NGFHDWus1aLW08P4KMr1uo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MOhUZDEtsQuu__c8E9QPyxFS94cpyOD9T36QZK4IOBYjOtTtmeDw0g>
 <xmx:MOhUZDUIeoya00LJLBgzhfcwqW6bXG_w29TJWk-VBv9ALzvaMTColg>
 <xmx:MOhUZOO4F3tqeig4Yuk_-mu3NyR4v-WmtBq4zSIpTjfsp9b-lPXEBg>
 <xmx:MOhUZDT8n1ESntjwlxIKokvTztxrMokk5bnYUXF9Xr0bsrU5UB-w6g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 05 May 2023 13:25:42 +0200
Subject: [PATCH v4 40/68] drm/tegra: sor: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-40-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2366; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=X5aJqS+zwl3Jn3nYEvmWCSG5nEfQm1oPlEUuBT6buzE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5dknW7kvxG1Kfvs0elPNJdtzmTKqqtNiT/14bxj7RP+
 +Yt3d5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAilf2MDDdZAtSb7nhbudx/reVlIL
 5jpx3D61dlZgZnj6UVmt599pXhv6+25ffoY4ncc2KvW/ivc2/jfaniqPUj+OG8WerFOzPmcgMA
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
Cc: dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Tegra sor pad clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

Similarly, it doesn't look like the device tree using that clock driver
uses any of the assigned-clock properties on that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
determine_rate implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tegra/sor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index fbb63d755496..abd6e3b92293 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -586,6 +586,7 @@ static u8 tegra_clk_sor_pad_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops tegra_clk_sor_pad_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent = tegra_clk_sor_pad_set_parent,
 	.get_parent = tegra_clk_sor_pad_get_parent,
 };

-- 
2.40.0

