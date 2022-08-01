Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F22AC586BD2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 15:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED073B576F;
	Mon,  1 Aug 2022 13:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55F4B4261
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 13:19:17 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F24E38440A;
 Mon,  1 Aug 2022 15:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1659359956;
 bh=wcj9FeuZ8cXOT472oAuu+NLSau/Fb3N8+CJ+hx0ObTk=;
 h=From:To:Cc:Subject:Date:From;
 b=It6bgbcM77Xx+hB2L5xAvGLjIyNRK9efCuax0y1ICpu0NqpR8tK9GKUl9uvKTudmD
 srmlN1ubOyV13njSRszPsrtWwF78h9dZ5UVXNnMfkw8wgRH4k2mgWsk6/N6ihg01P8
 aHjkdMWFys01a2AKRTszwZONHNVpC2WQbMkgdynOANO5NNgIJdhDOuH1DavxH2rTSp
 EJXtD9LTAqxPXe3bLmW7ekY5Bv4MPoF7uwHgoPsYk7nw74JPtYDe62hCA78T72Nc8X
 zGn0rMgOeC2Hn77MLccIwJGtmKVZ3eUa8HFnpomxNRq5YrYc8qMXvf4AS5BihNBr6q
 +tTXzjuwMU2RQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: bridge: icn6211: Add support for
 RGB/BGR swap
Date: Mon,  1 Aug 2022 15:19:00 +0200
Message-Id: <20220801131901.183090-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 robert.foss@linaro.org, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ICN6211 is capable of swapping the output DPI RGB/BGR color channels,
document a DT property to select this swap in DT. This can be useful on
hardware where such swap happens.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/display/bridge/chipone,icn6211.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
index 18563ebed1a96..e721dd76e6640 100644
--- a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
@@ -33,6 +33,12 @@ properties:
         Optional external clock connected to REF_CLK input.
         The clock rate must be in 10..154 MHz range.
 
+  blue-and-red-swap:
+    description:
+      If defined, the DPI output blue and red channels are swapped,
+      i.e. RGB becomes BGR.
+    type: boolean
+
   enable-gpios:
     description: Bridge EN pin, chip is reset when EN is low.
 
-- 
2.35.1

