Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C144454C0E8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 06:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E80410FED0;
	Wed, 15 Jun 2022 04:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E906810FDC5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 04:55:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 539B3320091D;
 Wed, 15 Jun 2022 00:55:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 15 Jun 2022 00:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1655268951; x=1655355351; bh=me
 B3o4RHIjnH4+7Q/C/69u/oZ6dMRlLCXzf5bgQ4WC4=; b=LTBiMCzL2FhF6pdlV1
 Tbw6xLQsd9/7Xwope6Ey+tJO/uEis5iOG0mdYfgV7zw0PY2M1bRmFVWgJb+FsdPH
 E142niuNLUxzmhpn7d3XdGSehXIrZj1rthRpCUvAHABvoRG8PpuxiKWU4AJfCasP
 nkWAup39gMjS4Am3Yn1USxtxz3n/LvQcQvPilVeyk9WRarP6a2hH1lVfqBsuhQbN
 fLoJbIayBImhfzT+R0A0/tXoGq6s2HI6mnKNpaazRvneHbKc2I7P6zquHjd2Bi5Z
 4+3QtYz9Qf7NM08MSWL5EdX/jye6N+Pm0fAgGEzM3htWT/DScY+5iagpOJT4RRfk
 gK2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655268951; x=1655355351; bh=meB3o4RHIjnH4
 +7Q/C/69u/oZ6dMRlLCXzf5bgQ4WC4=; b=kq6o7i78UHBy7o0QqsIg1dd/CgBcw
 H0ntZ+97IyM5OZ7ElvaBN07ETY+CM9dEz2MLiycuiuzj/uPZhakCay510A1U4FU1
 jem+o9j0dQqSwxz4sstXtuGxc5JMa+IY7UBqCtgb9YqQaa12RuqbBh5S54b38QQB
 MtWocRz4ipAMagckd4pcFir0Ksoj2BIty8fnN/S7cbE3XRdv1fdyzLJzfgtpA3OP
 M9pZWty1XpAGg0VCjZpwwKt3ZKec/pEwEhWsg9QN9GWhH2+tJw1wVUwsCfoWxUaN
 uOXl9NTjobqWKTJd9Ac90sKmRdTeWebT7+AHTKAEWwk1W0dTDqtjaY+Fg==
X-ME-Sender: <xms:V2apYsCKSH6oYt6V0lL9Lt1PFwp5CnSy161aJh4uGv878jtq14J3fA>
 <xme:V2apYuivgaKHXPUN2nw8k9tU-yMIN0XPOBJ7l6R2-eibvZTk6qGkDj7kq2ydtxEW7
 bP96Cjmnx4zXvB7sw>
X-ME-Received: <xmr:V2apYvmtggZgFgU_tqAy5Ins6jng6rMcFycY5ECP1u-M-Q3r_y6F_ovTwMFM4nWQf4wCQD64LpKbLI3qeAuVzLDMAzWtxCTP0lQqoHP668m5zyQtf2SEm2hELotInmZ-_xsGaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvtddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:V2apYiw1YcKeX1mOXrGAVul4QKHMrr3s5VTONvlK5YdjUBxI6KIN-g>
 <xmx:V2apYhTw_IFqTf21ob8T9k_aRgO5RENDREQ95xg8Fc3KG1OrFHUViA>
 <xmx:V2apYtbMusOuZBHqWblRpGZ-5NAKzVzgAVN6RBvJ42AtixxrucpyOw>
 <xmx:V2apYu_4HdJvajYWG7RIXw7mxW6hNR-x74vyf5h3Jp0pOhX0q0VPwg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 00:55:51 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 2/6] drm/sun4i: sun8i-hdmi-phy: Use
 devm_platform_ioremap_resource
Date: Tue, 14 Jun 2022 23:55:39 -0500
Message-Id: <20220615045543.62813-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615045543.62813-1-samuel@sholland.org>
References: <20220615045543.62813-1-samuel@sholland.org>
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

The struct resource is not used for anything else, so we can simplify
the code a bit by using the helper function.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 4553e04144fe..10504c2de132 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -675,7 +675,6 @@ static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct sun8i_hdmi_phy *phy;
-	struct resource res;
 	void __iomem *regs;
 	int ret;
 
@@ -686,13 +685,7 @@ static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 	phy->variant = of_device_get_match_data(dev);
 	phy->dev = dev;
 
-	ret = of_address_to_resource(node, 0, &res);
-	if (ret) {
-		dev_err(dev, "phy: Couldn't get our resources\n");
-		return ret;
-	}
-
-	regs = devm_ioremap_resource(dev, &res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
 		dev_err(dev, "Couldn't map the HDMI PHY registers\n");
 		return PTR_ERR(regs);
-- 
2.35.1

