Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED031B800E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C8D6EB3B;
	Fri, 24 Apr 2020 20:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5866EAA6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:35:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A328610A2;
 Fri, 24 Apr 2020 11:35:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Q0xQzta3vxRt9
 2eurDQl3ATU7iLBuCrEm24XOmSc6qQ=; b=HI6HOkm/s88oA5lwX5uW0iVmly7Iw
 85uq3muY7TgJ9pvKB7AxffHtTocCHjszXXWpI3DDr0319xLBnkN4NrXXBCn/Klpc
 Bg6PUyCiWWGtiM+4b+nCJLWIDVD3btTWokcObKjojaX2jSqCVm05tAeyJeRK/67a
 jYoWEz4K8BSOkM7obUyT8mR7ntJDT/3AJJaB90Nt0la/cDwka4JOH22TUi2McnZg
 9o6YO3FlJO2P+yM5tCDzNZk8YxnI3DD/quUFnRp0ffhy0gfFyj/C1GUV5UN+utj+
 WZDzkL+ozLxIVlej+m+d1p9vGyCLwT7S4BTAJQxFopK6WFnscDUz+wn1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Q0xQzta3vxRt92eurDQl3ATU7iLBuCrEm24XOmSc6qQ=; b=jltMhk+G
 i2j1aDMk24Tg8Um7bnmTKj3pY1rhSU3JXnwqHk42qjQOrecKRlk7ZEsYUdFgxPLz
 tH8ulNAyxe7NA5n0rI50StjYhhTNKDay07HuVYWkzAiV8zbzPXMyf+YZmfw6iO41
 44lXElw/wO9TmN/rFrj6UhJo+UAEMB85NcIM+F6v6LsvILTF8A7Ll+x7jditXtnl
 s8wuZWy+7DENR2/fdMGm2wrTpKqSBA+IdGFYtF7Hew0+y1hJBXme/1ScIBUSi65Z
 wZNudyLx/pWd8cDt3zC9Mf5olD9y0wq0E0ap+KA0c4vzKi2IImfGMklh/x+NohBE
 pKto42cGbZ6Jxg==
X-ME-Sender: <xms:QwejXtfuqhfefUxIK_PlX-0CVQ6JP6-dD2llwPSfBdd1tgMM89d5_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QwejXsII-OBLCgCNSDhMvhLsFQqFWsTRxRchY8T_L6GGbNLNYpTTNQ>
 <xmx:QwejXuZR3uZQ175TbihAxDbzC2u4jCbINTtK0-8CROqAPZD5_73Dvw>
 <xmx:QwejXsbU1qo4ZnuUJs85o9Q6XRaRgZyeZYkMlW4LnacL_bIre8qQZQ>
 <xmx:QwejXkkz8v_y9DuWSr8iJU0HF-Y0CQVvhf16QBK0V7xwRo2Z4RBvt8863Yk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9BCA328005E;
 Fri, 24 Apr 2020 11:35:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 06/91] clk: bcm: rpi: Statically init clk_init_data
Date: Fri, 24 Apr 2020 17:33:47 +0200
Message-Id: <eeae1a92da7812f04a034498d3a1cb60e282fec7.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of declaring the clk_init_data and then calling memset on it, just
initialise properly.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index aedeaaf2f66b..b6d2823c2882 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -175,11 +175,10 @@ static const struct clk_ops raspberrypi_firmware_pll_clk_ops = {
 
 static int raspberrypi_register_pllb(struct raspberrypi_clk *rpi)
 {
+	struct clk_init_data init = {};
 	u32 min_rate = 0, max_rate = 0;
-	struct clk_init_data init;
 	int ret;
 
-	memset(&init, 0, sizeof(init));
 
 	/* All of the PLLs derive from the external oscillator. */
 	init.parent_names = (const char *[]){ "osc" };
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
