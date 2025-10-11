Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F30BCF9C4
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5243610E341;
	Sat, 11 Oct 2025 17:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="OuhAg7a+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jZmdi5TH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE9110E344
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:04:32 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVMg02Lpz9skc;
 Sat, 11 Oct 2025 19:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xljFliCRP9Mj6mcwv/ihtz8MrzZBGcHB9dv1YI9AHNo=;
 b=OuhAg7a+AvOBtY1OOCt9SAF9Y9Ap26u8nYvGa0bCH9tIriLGwIozd7ePesi9m5DukIumAH
 4woWUIZQuytAt1nKN9USssEi6TXxZI3Z4CwcJMX70ZKYYh7+sX3p5KygUHVsRYmMKyrjke
 3eAG0X+T/XpD+0S7unLR0Mfa2VK84EBJzwPEg/yBDV3kz4DFuBa+cfosnDow1n9/Nw5GDC
 N9btCb/b/ZkIotMNAxEF41ltPq3LaxDQGc+I7l7vwv8r0DWTQ2aUpWfpGQmT2PGZ6CWUov
 dMtCufeSK5SeIFcS5SzCcCzt0IzygnqJ6xOwPKnJP0rAb+T4bpXkQYVgRls6rg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xljFliCRP9Mj6mcwv/ihtz8MrzZBGcHB9dv1YI9AHNo=;
 b=jZmdi5THYXHZBoohzFTEmcDYMIG01oYDoFGwFMzCvCNQCFHTHHMT66Q1F34TXvZDakfudW
 WBGr7HE5tMU7fFBirwjGwbJdWAdU2ws3zQ2MZ+ECMEnsPXTCJcZrvehQorvyJiiVJCEgBQ
 1RIts+y8ShMXYeErueMM/2+TDYbtLWUchlZk170pcmfSo1xzeb4F3YqTHlUc+3qwO5iP9s
 tkrwVTAJF9fVtGVscIbI9pp2wl4Zg/50z5D8apHpnynLwEvjUvoUov3geTvSxqD6E9Ahbz
 d9FOCzyM4/tv2/8YYarAZPyUH1+RtiFdV8+NWP0o3WCapXjZJy9E2vfqxWnH3Q==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 34/39] dt-bindings: display: bridge: ldb: Add an i.MX95 entry
Date: Sat, 11 Oct 2025 18:51:49 +0200
Message-ID: <20251011170213.128907-35-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ecmhhgaji385qxs8r1n1u6oze13afseb
X-MBO-RS-ID: b2cf3b604c2589930db
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

i.MX95 has twice a single LVDS port and share a similar LDB_CTRL register
layout with i.MX8MP and i.MX93. Unlike the other SoCs, i.MX95 does have a
mapping bridge in front of this LDB PHY.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90df..9564360d4bbb8 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -20,6 +20,7 @@ properties:
       - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
+      - fsl,imx95-ldb
 
   clocks:
     maxItems: 1
@@ -68,6 +69,7 @@ allOf:
             enum:
               - fsl,imx6sx-ldb
               - fsl,imx93-ldb
+              - fsl,imx95-ldb
     then:
       properties:
         ports:
-- 
2.51.0

