Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2085B446EC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 22:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54C310EACA;
	Thu,  4 Sep 2025 20:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="wKkdMKr+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ht8buZKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FBE10EAC7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 20:04:56 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHr6v3lLTz9tFV;
 Thu,  4 Sep 2025 22:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757016295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=laoGGEVO+Nzxj153VQlyUvl8GS6WXFC6jR/xWNH0R9s=;
 b=wKkdMKr+7B0Cy62ni773W4TSsAfK63kketfLjxrrSg/NVj2rchJygMzCU7qNgZRMCOHNrp
 cq3KdHrM1LLejQhNtINYxzCqzGWT58z1sgqiZpm1buZhitvEUxPo6H8MB4BsGSVeX6cDZE
 5zjlaSJjPXmOWI54b5HwdzV63CpshUeTKjXJtEwYvHL9/CJXEmTCCTQnl+CNl4jS55heTF
 SnZ3rJaLg5ZVy09meDrrzndlE4HMwmx+ghUoJcUMl8qJOz26A9X4dFjycZh3V0XfECjdwe
 NgK4m4hbjXGitYoOZt1RNdhiYp/9KpQDnLQW/qnNrOQEdn8puzveOSEB8QhdlA==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Ht8buZKJ;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757016293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=laoGGEVO+Nzxj153VQlyUvl8GS6WXFC6jR/xWNH0R9s=;
 b=Ht8buZKJynSs5acSPh9eLlgf9Aix/WrZj66Nh/zYQ3EG0MymY4YlT8FOXRlZhx74FmFXLT
 8weQET6B4XP1kVcpHLvjIJ5xWFTv13pgrp/HeoFoKley+NpVPwukE1EtLQu127YTi1P50G
 u+Ak3aTZ0hIveG3TjY0ORgTOuEHRzF6uZkkomg3LeIKljIYzibIF6B6wQzrJxypjC8S1Sl
 VEqLQi07ns84C/JkUW4msY4PF2TlCfGuC5DzCV88hj2eE2DLk8/YFS4JWDjVgYyDO7mcdN
 nFIJvGVEa7gHeKpjYmeCg1eEqG8SsLZN1NZmwWrZRTfysKfZicdhqa1DyoiwQw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: renesas: r8a779g0: Rename dsi-encoder@ to dsi@
Date: Thu,  4 Sep 2025 22:03:06 +0200
Message-ID: <20250904200431.168363-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: zif16n154yhntpkif6dd91yozr1xs9fx
X-MBO-RS-ID: e07c121d75dd1735519
X-Rspamd-Queue-Id: 4cHr6v3lLTz9tFV
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

Rename dsi-encoder@ node to dsi@ node to follow node name pattern
in Documentation/devicetree/bindings/display/dsi-controller.yaml .
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 8d9ca30c299c9..4fae063bf91b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2476,7 +2476,7 @@ isp1vin15: endpoint {
 			};
 		};
 
-		dsi0: dsi-encoder@fed80000 {
+		dsi0: dsi@fed80000 {
 			compatible = "renesas,r8a779g0-dsi-csi2-tx";
 			reg = <0 0xfed80000 0 0x10000>;
 			clocks = <&cpg CPG_MOD 415>,
@@ -2505,7 +2505,7 @@ port@1 {
 			};
 		};
 
-		dsi1: dsi-encoder@fed90000 {
+		dsi1: dsi@fed90000 {
 			compatible = "renesas,r8a779g0-dsi-csi2-tx";
 			reg = <0 0xfed90000 0 0x10000>;
 			clocks = <&cpg CPG_MOD 416>,
-- 
2.50.1

