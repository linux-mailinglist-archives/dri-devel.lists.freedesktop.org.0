Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E14F849E25
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 16:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A0610E909;
	Mon,  5 Feb 2024 15:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="p5BOTlx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A263D10E909
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 15:30:55 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4TT9BJ5DfPz9swV;
 Mon,  5 Feb 2024 16:23:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1707146600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qC4mq/tsfLRuzLmRs5JjHQXl/DynYoHApRzxf1WL2uM=;
 b=p5BOTlx7BFzH5jfkDYpQViWSxKs5abIL8hm2KzHBy21+XzrQNcnG7drDYZmaNPxgoq6svd
 VOSQLdXUhkmNUjvvyni3MqpxfHJ9FfT9ALjLCZUljFNWk19ObC6iFsezdkutZunV5B8fHZ
 jB+XIXs90OYNf3K9Mt+jErTvhXbdBH2ROAKG4uAEMbwpQOo1819ukPoEBy4tBSRQqt/JOf
 8anff4Wsl++LcK4cx5OCjA5bJWAMRppsY9M4jJCNb+xzJPwHfl2rW/S52m2QxEs4zPnOTp
 iljLh3JK+krTqxPfsWyMMUrjP6VeycUjCDdi+Autvy4D6dY/G0E7QW2NosNGUQ==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 05 Feb 2024 16:22:29 +0100
Subject: [PATCH v2 6/6] arm64: dts: allwinner: a64: Fix minimum GPU OPP
 rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240205-pinephone-pll-fixes-v2-6-96a46a2d8c9b@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
In-Reply-To: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=zwBfjIxPZERVFfsaNgpqFLdeiKWw7hboXJ6uRiKwYxM=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBlwP0/YywsMvB2h9f3zxar+UUpwxyriOAGKTLGS
 ZdrqQvmPRqJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZcD9PwAKCRCaaaIIlErT
 x3RxDACBLK+cLnbt4nqBmvnVYYuwNDvDRxFAxO4EA3xfHnuyUi9obGXAhbHRwu5r0O73xHPRVNr
 4Wom+6tBs3/fQuItFP79IP5TmiAFQrzSkoGLQ92bS5iXGhBEcIYFwlpkUXgOrCTqtXWypBAdp29
 RAQI6ih2i6NilPU/cyy0Y+cdmz/NlslvlnloC2NIgNtCgna8EqxXVuznxxOIsfw70TXsMZa7FEL
 nG4hYb1xsmY98DZy2qeZA3OJNg+sXOyxL+J3Vey8KfaAx3NJdZ5eQo0RiwX/Lrvc/bOweP6oovx
 Bs8nYRM/GJ5zndYzn49FwuuIIzmtWco7Era813fL1BsSdT0EdMFQSE4b/7TqbKkE3zj9Xnq+9BD
 /P0du+E3yb6d8fHwBbUqfBL6QtBVwrxvsC68I5utxurpsD07McLUo54uaOBRrufJoJHceUfjGRV
 vGonUD0GohydlHH8bkAhELUd6IZTEOOawyGWyIOycvEhaBrM5Rmbdj1jFE/oBIptqjiM0=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4TT9BJ5DfPz9swV
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

The PLL-GPU has a minimum rate of 192 MHz according to the A64 manual.

If run at less than 192 MHz the pinephone (based on the A64) sometimes
replays the last few frames that were displayed over and over (see first
link below).

Note, that running PLL-GPU at 240 MHz and using a divisor of 2 *should*
circumvent this problem as well. But unfortunately, the GPU shows the
erratic behaviour even more often, even though its parent is driven at a
supported range. This might be due to a similar issue to the one
observed on the Allwinner H6 (see second link).

Running both the GPU and PLL-GPU at more then 192 MHz reduces the
occurrenc of the issue.

Therefore, increase the minimum rate in the GPU OPP table to 192 MHz.

Link: https://gitlab.com/postmarketOS/pmaports/-/issues/805
Link: https://lore.kernel.org/linux-arm-kernel/2562485.k3LOHGUjKi@kista/T/
Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 57ac18738c99..448d7fbdd1a9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -107,8 +107,8 @@ de: display-engine {
 	gpu_opp_table: opp-table-gpu {
 		compatible = "operating-points-v2";
 
-		opp-120000000 {
-			opp-hz = /bits/ 64 <120000000>;
+		opp-192000000 {
+			opp-hz = /bits/ 64 <192000000>;
 		};
 
 		opp-312000000 {

-- 
2.43.0

