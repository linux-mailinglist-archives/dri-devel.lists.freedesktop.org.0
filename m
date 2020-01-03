Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3FA130215
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2516E457;
	Sat,  4 Jan 2020 11:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC1E6E051
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 15:28:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 493F99DF9;
 Fri,  3 Jan 2020 10:28:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 03 Jan 2020 10:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=OGv2PjtJHB8QM
 vPH8CaJPwpmPo7SxAhtUjW/yzWRHQc=; b=Nm5sFV8I15oYFqtoratwPfV22nBjN
 ds0SzzLoApRjDm6++KZyXwNa8Q78uL0S4phwRqh/mpKY2u/MW2Gw8VDbJIDs4vsj
 pZf3PFOYtM3lH+9/MP6xxyW2nP3w+nmBNk3/RWwybKCkMIOXDLSY6o+RwtueSJXO
 ru2QCQ8xqKpqaM01qxBZ13pnc3B+FjwV4ndAgJiK+qeDD0DecgVgJE7v96Q1uLAq
 BDUZKrXKCAULTYcuc3qZ7XkI5L07jfdNlsebaHV6z6djNVNMpBGVyQuA2Haxl1Ec
 foo7ciMO6Rl3X1uomzGGqj7yADszRpHiPinejV7oVowwlsxOtSw+m1pzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=OGv2PjtJHB8QMvPH8CaJPwpmPo7SxAhtUjW/yzWRHQc=; b=Lj46+M47
 I4Q5ngc4j+jwGLthQH6ebM6XbVRGYfbj1V9UYdSfg7nTyvZrdrn/U/hybDrbxajC
 rncLvdodK9y3v4fpcnW+l0Nznzt1m3PjQ2ZhRueenioIyZIqAIhcMpOjHNS6IIt1
 YCGnk7g8Vn1obmwQcOADxXI3t76xCIxTjYgLb7Ft3Ph2SoGY+bN/X0vf11xwjj7Y
 ukZtv+XyYjIKBNqG2lveMsaVZfXnWAOPDaLGjxP1cjLW5Zpg8/KEANBHlX0/IZf3
 b7EI/FqWT18YVr8ftKPKYkO1/AgXtHvkWP881VfhnFoqw5L3OxetZZSYl/zAUyvt
 mrtL/N4fTTlJ8Q==
X-ME-Sender: <xms:h10PXrJZIry1lcBbeP279LAXepFGOKBr0zxVjmQohBAnQwpLlc5jmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegfedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:h10PXhB1Ei6oNYH3M-PXZoV9oG3KwxCpt3HscsFF_ZP2_ysel2R-Pw>
 <xmx:h10PXo1pJu8pE-EIhCRC2NEtgCyLlD1EyePD0Z3HNeLpXLwtTysjdg>
 <xmx:h10PXkkI_TNFMCZbRf44DUDlgS4ls5ipKLSmfDQNqDShyV0g95yYpQ>
 <xmx:h10PXpGsVIB3M_4SrHkhaOEv1AaPzNVlA8uD4W1jBCpX9Ns_hXNajQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC25930607B4;
 Fri,  3 Jan 2020 10:28:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 2/4] clk: sunxi: a31: Export the MIPI PLL
Date: Fri,  3 Jan 2020 16:27:59 +0100
Message-Id: <20200103152801.47254-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200103152801.47254-1-maxime@cerno.tech>
References: <20200103152801.47254-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MIPI PLL is used for LVDS. Make sure it's exported in the dt bindings
headers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/sunxi-ng/ccu-sun6i-a31.h      | 4 +++-
 include/dt-bindings/clock/sun6i-a31-ccu.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-a31.h b/drivers/clk/sunxi-ng/ccu-sun6i-a31.h
index a361388b4670..3ed2a59b0dc6 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-a31.h
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-a31.h
@@ -32,7 +32,9 @@
 /* The PLL_VIDEO1_2X clock is exported */
 
 #define CLK_PLL_GPU		14
-#define CLK_PLL_MIPI		15
+
+/* The PLL_VIDEO1_2X clock is exported */
+
 #define CLK_PLL9		16
 #define CLK_PLL10		17
 
diff --git a/include/dt-bindings/clock/sun6i-a31-ccu.h b/include/dt-bindings/clock/sun6i-a31-ccu.h
index c5d13340184a..39878d9dce9f 100644
--- a/include/dt-bindings/clock/sun6i-a31-ccu.h
+++ b/include/dt-bindings/clock/sun6i-a31-ccu.h
@@ -49,6 +49,8 @@
 
 #define CLK_PLL_VIDEO1_2X	13
 
+#define CLK_PLL_MIPI		15
+
 #define CLK_CPU			18
 
 #define CLK_AHB1_MIPIDSI	23
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
