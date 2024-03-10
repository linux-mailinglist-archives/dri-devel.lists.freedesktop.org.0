Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F19E877700
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 14:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A67B10E177;
	Sun, 10 Mar 2024 13:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="yqpB/ZFs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A9610E176
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 13:22:37 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Tt0vF5gjbz9smD;
 Sun, 10 Mar 2024 14:22:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1710076953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhGwFTOxsp8TA925vZCjt+JcQqgJocjoqK3BssOmRYM=;
 b=yqpB/ZFsIC3kVJiHYJxsIUj+zkEdsrbwWRpoL3s3LJXI5NXAT7uCqBmYJynZrZvLl9pG8L
 6Lf3AiIu71PVNlRQ+byBfX2w5xMsh44hiyxEqL1EgviV57n1HO7SxCwMJC7nU0l4IemOnT
 RrgNw4P9jbLAs0TbBFnqURRsmlFipUNhVn5S4doXCmEOhZm/oSXdrr1vjURggphMfKkvQC
 5dpf5rQfqOhf+emT9gpdPE3El/+kMKAt1LpILKsR3l49okaMcqcMlZNVVwjrCyXNXwxrdm
 PycJixMcrT0d1HVm7iYFxB74VZA1c+dD7Yza54IEYi2w6i6csV3XqrYbMO7WTw==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Sun, 10 Mar 2024 14:21:15 +0100
Subject: [PATCH v4 5/5] arm64: dts: allwinner: a64: Run GPU at 432 MHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240310-pinephone-pll-fixes-v4-5-46fc80c83637@oltmanns.dev>
References: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
In-Reply-To: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Frank Oltmanns <frank@oltmanns.dev>, Erico Nunes <nunes.erico@gmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=kvvIkTmfQMw8UxSyDxPC93rn0oSCr/Quea9RAybNOn8=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBl7bP6p2D/0yVAajHJzxsF2A2zeZMiqWXbGyGZ0
 py+R4ILTJuJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZe2z+gAKCRCaaaIIlErT
 xzQeC/9jShpjnftS4GkyabYSB2tpbtKkzT+oFr9HD819N1UtksrEvwfmCRDtWbZkHg+E+Id2EFl
 5cwQX+IXyN5BYzWsPCCw/Jxf3LqYdbEmmwYWS7YMLBE8VVjpycE3jloPFsYVc4yOxjRW7+MCJxl
 5/29M0HefgdbSERNfRe40HeZZGjZHUu4KdUa69QIixrQTZLrLsCFm42Z/UqQJ3VkPn5NiiyJr6E
 z40Tg+9Ga/rU2uaDcforPsLl/l0y9ayLBoK0UA9C3LijM2DxATNpeWz3iWPwg/YIRp6MvTKNW18
 YiHtgkixh18DiLRJBl2Z3G0dhWGU3g9e6EfYoV93t/YeHSmXCxp91JSM+cwxNsgHLKCoZ1jIWsP
 82JDNAdA0LyExvZXF5171VphDgB353vTAiSQlb0BlupDKjDFbKCbOfIpcJTDS63WGJ+pBlEi0Xa
 t/JoCa19Y8thObe2+u87zj51in6LJCujRj8DHXUmwhVWJgMTIO93b65RqRGapzoBPecpg=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Allwinner A64's GPU has currently three operating points. However,
the BSP runs the GPU fixed at 432 MHz. In addition, at least one of the
devices using that SoC - the pinephone - shows unstabilities (see link)
that can be circumvented by running the GPU at a fixed rate.

Therefore, remove the other two operating points from the GPU OPP table,
so that the GPU runs at a fixed rate of 432 MHz.

Link: https://gitlab.com/postmarketOS/pmaports/-/issues/805
Acked-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 57ac18738c99..c810380aab6d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -107,14 +107,6 @@ de: display-engine {
 	gpu_opp_table: opp-table-gpu {
 		compatible = "operating-points-v2";
 
-		opp-120000000 {
-			opp-hz = /bits/ 64 <120000000>;
-		};
-
-		opp-312000000 {
-			opp-hz = /bits/ 64 <312000000>;
-		};
-
 		opp-432000000 {
 			opp-hz = /bits/ 64 <432000000>;
 		};

-- 
2.44.0

