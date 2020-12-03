Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8CB2CE9E3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260DA6EC87;
	Fri,  4 Dec 2020 08:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96096EB68
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 13:25:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 46B4C580410;
 Thu,  3 Dec 2020 08:25:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 03 Dec 2020 08:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=J+jHhcWAOhxrW
 jou4qcr3FdZvKZRKwnOUSW1iZMZL+k=; b=u1GLBH+f8yKUG3pcQEvy0XYJ6Ud7+
 bzBnW/fLq75E/vnNt9IkfGjhiwxFB154ryElCPBLTD8DZlyfN4+sjO1UUaXEv2IC
 +qriIui7W1nW/v4umAqg8YiJBQvoqu1Bw7sF3uibqsPM0Cxtp+Npmt/6EGPc+Iki
 Mlq9+dwiAa7m1Z1Xj0c1GE1Atm5rQ9V+eO5j38v333bGpQ8N800QA++oGo4iv1rr
 p+tZzULQ9dcEhTHv+NZNiQf5vr9mCEdA/2Otvpw4Xr4Bo1jc98EWOouXpcU+1QWE
 lHFsstLaDAXdNXsMMqkHdD5ggYbAiUrnxOKneynUaxi1WVH9yzC9zG1/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=J+jHhcWAOhxrWjou4qcr3FdZvKZRKwnOUSW1iZMZL+k=; b=CsyvSdU4
 /x+M8L7rhpNRFD3NGZRFVMWhXeCSJKzM/Uief5g6QxOEDT4w/pQuOmg/NIcaHHH2
 4ht3iDDl2Vxx5rIKfw4etY+oQRM6/AGj8LL+77LSejacWbVl5W4Ymq2T0bkt52wY
 lsL61mrZOmAAje76a6K8/Xv113nzJMv/eze+xgJlAlU8zE7D/TobYHRSHcRESikq
 LronbPv+BCaSNhwBGj89OgewR3byAp+O3tFoc0cGI9pfWZY2MI0QUhw78DGWZY3t
 P6eXwnSPYVLuOdaZRWA+GG8YuOpBoLNJj4cqIKMrVio68lgBilbSCzr3/VZUNTKZ
 qejjafTFw2vH7Q==
X-ME-Sender: <xms:XefIXxuIe5oOpQaJ2ph4cDaV_Alq441GE_Jb7C4Bm-v_pIEOQKkNWg>
 <xme:XefIX79fZivYgqp5MbxZ-vQao5iwNFXGk-2j1W5VnCseLhUVfjOfEBcqMx1BpMAov
 zqVjb8lnX0o5N9kTng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XefIX00bxo-kflne6DxP3u6xyPEbJwdXoqrx20MUk7_VPTU9VmVbow>
 <xmx:XefIX4An2SgzepYXY1u3l9neHxQTZudfboitMGveEa5kG9YifLx4aQ>
 <xmx:XefIX4cZLD5Hayx9oDi62EpquExoTGtauo67LoqKMoZtw1pTqmjhHA>
 <xmx:X-fIX3_W-3kAKVU88EosCghUqvGgHYq1Vjmj9aEwTq03RVIzyGf2Tw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3986924005C;
 Thu,  3 Dec 2020 08:25:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 3/8] drm/vc4: dsi: Use snprintf for the PHY clocks instead of
 an array
Date: Thu,  3 Dec 2020 14:25:38 +0100
Message-Id: <20201203132543.861591-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201203132543.861591-1-maxime@cerno.tech>
References: <20201203132543.861591-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI clocks setup function has been using an array to store the clock
name of either the DSI0 or DSI1 blocks, using the port ID to choose the
proper one.

Let's switch to an snprintf call to do the same thing and simplify the
array a bit.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index bb316e6cc12b..f704d959e65b 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1398,12 +1398,12 @@ vc4_dsi_init_phy_clocks(struct vc4_dsi *dsi)
 	struct device *dev = &dsi->pdev->dev;
 	const char *parent_name = __clk_get_name(dsi->pll_phy_clock);
 	static const struct {
-		const char *dsi0_name, *dsi1_name;
+		const char *name;
 		int div;
 	} phy_clocks[] = {
-		{ "dsi0_byte", "dsi1_byte", 8 },
-		{ "dsi0_ddr2", "dsi1_ddr2", 4 },
-		{ "dsi0_ddr", "dsi1_ddr", 2 },
+		{ "byte", 8 },
+		{ "ddr2", 4 },
+		{ "ddr", 2 },
 	};
 	int i;
 
@@ -1419,8 +1419,12 @@ vc4_dsi_init_phy_clocks(struct vc4_dsi *dsi)
 	for (i = 0; i < ARRAY_SIZE(phy_clocks); i++) {
 		struct clk_fixed_factor *fix = &dsi->phy_clocks[i];
 		struct clk_init_data init;
+		char clk_name[16];
 		int ret;
 
+		snprintf(clk_name, sizeof(clk_name),
+			 "dsi%u_%s", dsi->port, phy_clocks[i].name);
+
 		/* We just use core fixed factor clock ops for the PHY
 		 * clocks.  The clocks are actually gated by the
 		 * PHY_AFEC0_DDRCLK_EN bits, which we should be
@@ -1437,10 +1441,7 @@ vc4_dsi_init_phy_clocks(struct vc4_dsi *dsi)
 		memset(&init, 0, sizeof(init));
 		init.parent_names = &parent_name;
 		init.num_parents = 1;
-		if (dsi->port == 1)
-			init.name = phy_clocks[i].dsi1_name;
-		else
-			init.name = phy_clocks[i].dsi0_name;
+		init.name = clk_name;
 		init.ops = &clk_fixed_factor_ops;
 
 		ret = devm_clk_hw_register(dev, &fix->hw);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
