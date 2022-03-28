Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E7E4EA284
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 23:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16A610E12E;
	Mon, 28 Mar 2022 21:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A143310E107
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 21:43:53 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7B1A983F80;
 Mon, 28 Mar 2022 23:43:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648503831;
 bh=JKeyhssL00PpnhfSNrrujU2Of6wRInTOnkdSThHMns0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AiEqb/RQjmtVXrYX+VygzNArAC8hy3LYVgLD8LUXfQ9JXrGkYvXvnD/pnQDABY0le
 1q+JzzT5PHzZ9pqryUIsCt8YtJrqSAxw6u+YDg+BLLQA1sNLizXm3c4oRt310ymZWV
 ZLB6dM5tkaIYlZs3R/lntCxdddlVF9rRlmMlheqyCWpaoEn0J0XYBJA3ndmDFghGbJ
 fL/WE29FcdpQA0J+HTWHxrbhO99mYLApfedqXzzrRe9D2ppYjk8jlubJMVOkANXENt
 to0JM9HSWo+HtJTeUnVRRc8CF2eq03xAuPqv4brj6VWqGzEAE+VS4BHKEIl5Oieseh
 33HK6LG4kMKRQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 01/11] dt-bindings: display: bridge: tc358867: Document DPI
 output support
Date: Mon, 28 Mar 2022 23:43:14 +0200
Message-Id: <20220328214324.252472-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328214324.252472-1-marex@denx.de>
References: <20220328214324.252472-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TC358767/TC358867/TC9595 are all capable of operating in multiple
modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Document support for the
DPI output port, which can now be connected both as input and output.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Lucas Stach <l.stach@pengutronix.de> # In both DPI to eDP and DSI to DPI mode.
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
V2: - Rebase on next-20220217
V3: - No change
V4: - Add AB by Rob, RB/TB by Lucas
---
 .../devicetree/bindings/display/bridge/toshiba,tc358767.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
index f1541cc052977..5cfda6f2ba69c 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
@@ -61,8 +61,8 @@ properties:
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: |
-            DPI input port. The remote endpoint phandle should be a
-            reference to a valid DPI output endpoint node
+            DPI input/output port. The remote endpoint phandle should be a
+            reference to a valid DPI output or input endpoint node.
 
       port@2:
         $ref: /schemas/graph.yaml#/properties/port
-- 
2.35.1

