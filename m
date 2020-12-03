Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140362CE9C1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18E46E165;
	Fri,  4 Dec 2020 08:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B9D6EB68
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 13:25:49 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 55F6E58040E;
 Thu,  3 Dec 2020 08:25:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 03 Dec 2020 08:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=90XNSE2gFpYOo
 BrkrrVTSK1qJNmeSfYrGPvxUj62/YE=; b=sdKcuB7bPk9Fo/Sf8FIivYRbDria+
 Q5/BRAOosPXn6KQX3LkvooRxh3RNxHMg/IQwy9LVlOzHyV/caFhC3ANHpSV8EByg
 9Zw5uJReKVGzIIHVSVGhw/GeuWSMhcJtrIFOzH8pO5LnxdCSTRxC7Ttqu9xFTKmq
 QFJwesP9gEvRmAF7KHUXfg/N2aXH/F8j4ScWl4BWLcr4TFVGUBjS078IXa9RD6+S
 56HsD69UXFqnL93tCIqaBZ9SeVi5Ws/qFvOFSxiPMuuublrb9x7QoLORxYWjJ38G
 8W9b/hv5YVqB1EWu1x1Ns4R5/ltkq1V1+Ot0qFZXz08No+0aiOj7Y+5mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=90XNSE2gFpYOoBrkrrVTSK1qJNmeSfYrGPvxUj62/YE=; b=ocdAm6Nm
 ZHRSXT+AqoBzmKNjxKeL87gbVz0QtcMi+Y649IIuoeHDDWRunz+k6Oz8utIwSN+3
 rtTifSS4Be8/3pxkhC6fOb8FektjGwmTjYPQEr8r+gBz1JR02MWE83rAORh4t/sF
 xNA3evcwS2s6ZYjrjGkoC0NU11xat4jRR8+HqOJrkiySjGU81b+VTZ2Tcsg+Md1P
 NUtt5RphKRfCS0us745KFQke8P8uhyPXbdmeRmYIOZGs0Ka1X9D/lIlTnvkFcpn/
 TLkXm3zkQJiXvQFQTKX+29Y4omfPYxtY0Se+XBljcf4cfA6QiebV3HDvVGIWRGh6
 JZcctqlwFTsJ3A==
X-ME-Sender: <xms:XOfIX8bz4DuKzpaQRuM_Vh2fPiYxdIY5xWeZOVUL6TbkkcK2tjE1Cg>
 <xme:XOfIX3bLSVD2XIagnFYOObWyl8QLjqlQPnbljXvK529X4DsxHqTd2XwNgjUYOhioB
 suJvq2CfLY6CYHDr1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XOfIX2_9X1iD_dQXV4sRSMAp7Oe9ibvMH3PmTNIAwOdOGSsRu41PnQ>
 <xmx:XOfIX2oOyAfJ37pMi2iblJtHQrGDy7XM1JbtG-OLWg2M5Nu4WNlV5g>
 <xmx:XOfIX3ojHX_blVq8Q8aEvYzBjgzaNs-91OXOCNHSf0Y9ydpZfdLScQ>
 <xmx:XOfIX7cfVd6k0wYa89K7zjLxPocFsYCKgiI_VRBMHIX7NjaZpdxdxg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D83B1240062;
 Thu,  3 Dec 2020 08:25:47 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 2/8] drm/vc4: dsi: Correct DSI register definition
Date: Thu,  3 Dec 2020 14:25:37 +0100
Message-Id: <20201203132543.861591-3-maxime@cerno.tech>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The DSI1_PHY_AFEC0_PD_DLANE1 and DSI1_PHY_AFEC0_PD_DLANE3 register
definitions were swapped, so trying to use more than a single data
lane failed as lane 1 would get powered down.
(In theory a 4 lane device would work as all lanes would remain
powered).

Correct the definitions.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index b1d8765795f1..bb316e6cc12b 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -306,11 +306,11 @@
 # define DSI0_PHY_AFEC0_RESET			BIT(11)
 # define DSI1_PHY_AFEC0_PD_BG			BIT(11)
 # define DSI0_PHY_AFEC0_PD			BIT(10)
-# define DSI1_PHY_AFEC0_PD_DLANE3		BIT(10)
+# define DSI1_PHY_AFEC0_PD_DLANE1		BIT(10)
 # define DSI0_PHY_AFEC0_PD_BG			BIT(9)
 # define DSI1_PHY_AFEC0_PD_DLANE2		BIT(9)
 # define DSI0_PHY_AFEC0_PD_DLANE1		BIT(8)
-# define DSI1_PHY_AFEC0_PD_DLANE1		BIT(8)
+# define DSI1_PHY_AFEC0_PD_DLANE3		BIT(8)
 # define DSI_PHY_AFEC0_PTATADJ_MASK		VC4_MASK(7, 4)
 # define DSI_PHY_AFEC0_PTATADJ_SHIFT		4
 # define DSI_PHY_AFEC0_CTATADJ_MASK		VC4_MASK(3, 0)
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
