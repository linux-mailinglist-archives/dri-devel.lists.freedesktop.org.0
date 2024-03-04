Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1419A86FAC9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 08:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466DE10FDAE;
	Mon,  4 Mar 2024 07:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="WETvWYy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D0610FDAE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 07:30:31 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Tp9Mm0bnbz9sQJ;
 Mon,  4 Mar 2024 08:30:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1709537428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPqo6ggfchf8Eo8IzHB61o1N1czixDrkgbYRsxezN8c=;
 b=WETvWYy8KnRKnpbEBwTCtY8rSUlT4nt1jNvhqkNc7xjfoZzwJPVQHAgNrO8QQCCfC2Ywf4
 DFAprV6WH9qCU0kujsvsYd8/nRlBCUw2OwJNmuGm+QqSOENyuQ8amvQ1dhtH6x3Kg1Gl4X
 I2m5dRMkohZwACsniickAn39G80NZIJp/c9VBFlA5X00F+c4LUK2A1ppjrVeIb8PK7nDmg
 mfFNbnARLoF0iWW8pvNzbACozuHmMbXE73vyAoZeVoYyg6cf7qFuLkdjJsMPCUdkOul1uW
 YNzJLqC29oEqXFppvJxiup0jTTbUGYilnYIO7sh0Cn4BHpcOviVrmqqIBkAryw==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 04 Mar 2024 08:29:21 +0100
Subject: [PATCH v3 5/5] arm64: dts: allwinner: a64: Run GPU at 432 MHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pinephone-pll-fixes-v3-5-94ab828f269a@oltmanns.dev>
References: <20240304-pinephone-pll-fixes-v3-0-94ab828f269a@oltmanns.dev>
In-Reply-To: <20240304-pinephone-pll-fixes-v3-0-94ab828f269a@oltmanns.dev>
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
 Frank Oltmanns <frank@oltmanns.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=465cP31JRMr94nU0gRhI1fk1wJXGTQoV5XYegVLKIvk=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBl5Xhx9BxlpyXsETgIPW4+KIkZfwF26bL53VDWZ
 sb0uVOWRt+JAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZeV4cQAKCRCaaaIIlErT
 x0iXC/9kAUvpZfp08Fa9Etq3guQAB/WTkntp+YOU5esogHDIPMLVL9s8J3BmVymEMsrwcZGWYf6
 /Fg40Ek4gdlb7ubQx+uwcRrSmoQlnM7iALQdSnV0PVDLR9BGdfyegX+5OkVcOVxe0eodfmqylN4
 oQ/6hL7exkBjTiHjeZjtrt3nfyl5DGK8cyXLjjo+Xz1oV6C5BXsb4NMN1otFkAlhud8aV80lQgE
 WcQo7zr1B6odwuTnMTZVNAZMfeUdu2uc3WHI7AM4djqvj8EdkJk8Xtwm2mRehBL4gk7ezigkrDi
 mk+GFzrdamKg9XQEZ8STQdRlG6xq7XmefS+Vyl5hB6WnjdFZ8iW3rTYcvsBWn6UxVtXAtDNEXUn
 B2F6Z5ZT6oJlKqw78J0U2SkrNpUMd+7oChTyDKWGXGk7Y/yxW48gCU1r1jXw6eVkf/K7Rb3Vyor
 VPpbsDlGiGPIEdOUugWl5YknQ41mKlMtr1azRyBGMTeM7sW4CcVJajx2QDdwhnQMvG2cI=
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

