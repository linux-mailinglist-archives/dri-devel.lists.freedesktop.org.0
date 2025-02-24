Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E1A421DB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16EA10E2F6;
	Mon, 24 Feb 2025 13:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RbHNcOUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D73910E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 13:51:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF3815C6DC5;
 Mon, 24 Feb 2025 13:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2800AC4CEE8;
 Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740405064;
 bh=0mZGCuRUu8bHqSrP5214OTRBF/zAooyQDahu/9GP8OI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=RbHNcOUpp0bNIuC0zRogKbb3rn7e0998K4wPPN7PYwTDJmbHl6xwpLzA6z5TtvF1n
 PZEyRTaFmwm9tED4Hi03GxN0FCiZApo57Q+EApwspIRmNfk+vLnK5ucBjxj4t3AAMf
 LOnbi1iNApjHQ1ecnj2kDCAZswQnTRfKqNATv9gW+FAwx/IqGecSqBzq+R7YyVyg7i
 oTIMervG6gCgS5sbdnniFtar0p/Dmy5Ypl8F/wbXrEoMwqtdkzWQn7DmMMWMkU4Zcl
 K6gwd4Tj3Y10n4wQb+IXBxIfby++Ih7u/Mbqb/9LMSXLKNnGCxBkCHbLvxYlU1UD53
 ik2DFrcLenxKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 107DBC021B5;
 Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 24 Feb 2025 14:50:51 +0100
Subject: [PATCH 01/14] dt-bindings: display: simple: add BOE AV101HDT-A10 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-initial_display-v1-1-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=1040;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=40zl28floi4M3jn7zLafA4I2SyrY1dnpQAFmoqwqXJY=;
 b=LLEVcADTtIeah3vQnwyqh6H6KYxyToPG8cRuzaIyjCyCSUvmauoZpOiqQDaZczem8xps+vaW1
 HGncx4sAL6dC7u+v73HIGHWpBAoE0EtsHLPn0l6slp4ol77GtQC/CPU
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maudspierings@gocontroll.com>

add a compatible string for the BOE AV101HDT-A10 10.1" LVDS panel

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index e3ee3a332bb7e1736a8d44773b0aef4873153be1..b0de4fd6f3d4129d10e07b46533bb551784d8d53 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -63,6 +63,8 @@ properties:
       - auo,t215hvn01
         # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
       - avic,tm070ddh03
+        # BOE AV101HDT-a10 10.1" 1280x720 LVDS panel
+      - boe,av101hdt-a10
         # BOE BP082WX1-100 8.2" WXGA (1280x800) LVDS panel
       - boe,bp082wx1-100
         # BOE BP101WX1-100 10.1" WXGA (1280x800) LVDS panel

-- 
2.48.1


