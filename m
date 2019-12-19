Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209101292C5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6CA6E20A;
	Mon, 23 Dec 2019 08:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0412389D44
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 09:20:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1AB3157C;
 Thu, 19 Dec 2019 04:20:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 19 Dec 2019 04:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=0JK0EuublysGZ
 bEspavE45wCCCf/99Cvmu9cf7JQTGE=; b=YNpPcXxNM+l2iWDjcCqPK8HirVycQ
 CQoFlDDgfUtO7p3Kimf7KBv/HUX8dQoLJVPGL3vmvBcaFGQ37hTcu1MzpIl5NM8K
 qn7Gwn/W78Ul66VrdFzqm6rcXFTOG01RGFkeSltaVurOtjmwfD0fuZGd30H1BXHF
 8qtIOmtzatUOxGZapLyHY8X3i6dea6Es2dqwX3ukbjPO/c2Dn59ZxYCH80rArVVY
 mLqiK8FkrBwYF8N/Uel1liPUedyHyWa9hUnuV9MTTfnQ2CfwPCyDB+U23QttR4wo
 vbLPXTXE4ZeG7ILcX7YDBd0lreVCbR3FefFIiz8u3q3Dgi2fT/hfsYvgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=0JK0EuublysGZbEspavE45wCCCf/99Cvmu9cf7JQTGE=; b=uBMPvzOC
 YN5dvSwj9tyEDivEa4lMzuSsx/jrqErvJiqMBoXYybJz0ACuYx51/3mKiK7Q8VRT
 3kTMZovXKDMyrv5lXrQRj43MLLzAs7o9XU+gRZ2tYS14i1Ar+H6ysJRZyW8fLJx7
 WyWsiLs2J4qjQdT4R9pnmdemddvfo01HDazrsvqaeMGqHB6MLeucH6GAY/SN3MrC
 o8JM3acWB4u858Hhddk47puUNXPNALPQyCRXcsHcZNxg5p9F0Q0B86dvwANB3kc+
 shMxBW5nXWrqjRQK1Zgg4fztfjlQy9GfIyhhFBFPB/vrsTVa+9yS1CnEahFRpbNE
 VOfigGItqXyQAg==
X-ME-Sender: <xms:xUD7XX-SgdNtCjTKLIwDRCCsDKCaEieWG9kYS-o9hIQYXae16v_Deg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduuddgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:xUD7XRmAsh8lgdF2JvgcdZFUNcNlRhObk22-5-7QDQlNUBfO4QE1lg>
 <xmx:xUD7XeF0-E5-xigjNXnfRK5uNEyDuJM_yBGMNdz_wGlLxHFuL7tr_Q>
 <xmx:xUD7XUtHSlHqHPk5-P1LN_-9vBQttEFsfki7RLoOYo1DJU8jE3iPpg>
 <xmx:xUD7XeWCxEZ3IDxRqNNeA23-vs_lM0N0ChBmdcscVpKHzvGX0fk1Ew>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C7528005A;
 Thu, 19 Dec 2019 04:20:05 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/2] drm/sun4i: drc: Make sure we enforce the clock rate
Date: Thu, 19 Dec 2019 10:20:00 +0100
Message-Id: <20191219092000.949052-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191219092000.949052-1-maxime@cerno.tech>
References: <20191219092000.949052-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRC needs to run at 300MHz to be functional. This was done so far
using assigned-clocks in the device tree, but that is easy to forget, and
dosen't provide any other guarantee than the rate is going to be roughly
the one requested at probe time.

Therefore it's pretty fragile, so let's just use the exclusive clock API to
enforce it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun6i_drc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
index f7ab72244796..ddb52da90103 100644
--- a/drivers/gpu/drm/sun4i/sun6i_drc.c
+++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
@@ -57,6 +57,7 @@ static int sun6i_drc_bind(struct device *dev, struct device *master,
 		goto err_disable_bus_clk;
 	}
 	clk_prepare_enable(drc->mod_clk);
+	clk_set_rate_exclusive(drc->mod_clk, 300000000);
 
 	return 0;
 
@@ -72,6 +73,7 @@ static void sun6i_drc_unbind(struct device *dev, struct device *master,
 {
 	struct sun6i_drc *drc = dev_get_drvdata(dev);
 
+	clk_rate_exclusive_put(drc->mod_clk);
 	clk_disable_unprepare(drc->mod_clk);
 	clk_disable_unprepare(drc->bus_clk);
 	reset_control_assert(drc->reset);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
