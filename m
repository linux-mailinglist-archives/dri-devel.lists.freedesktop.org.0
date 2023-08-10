Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CC5777B2C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A4610E551;
	Thu, 10 Aug 2023 14:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C4810E550
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1691678702; x=1723214702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w0UAbxXWAQNdssPmXVzrxzDw2c7hP+0NfZiyE8xtXXA=;
 b=N/4CGcxh7yY4TWvEH4ptnJ8vq1BvaPmA+E/73mD9WPH1+L7DYBcxMZ7+
 wImfxTF5q4eHPEF59nLWSMdUFaUdY/9hKfu7Hz/zfXI+eLYfER6FbHPbX
 OLrFpYA8Vq114MSeu7QVSaivgY6Hv6KkMZ987QS25B5QkVymJbmZLnw4f
 dfzYp/izS+DNFgWjWpoFkNEYazg2O8FnIiDSJ5fu0qEYGd6oWQc0iLGeC
 D8UxrXyLSlC1am1JS68pdVIKF+TPCMbjSx6LdglVghAICdOHoxQV6mOkY
 E/OxtOoX/KzxEapYq3IZ5SXHCYPkEq9flBb1jozRoBl3DzIu26puuW1Mo Q==;
X-IronPort-AV: E=Sophos;i="6.01,162,1684792800"; d="scan'208";a="32396725"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Aug 2023 16:44:59 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6140928008D;
 Thu, 10 Aug 2023 16:44:59 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 6/6] dt-bindings: timer: fsl,
 imxgpt: Add optional osc_per clock
Date: Thu, 10 Aug 2023 16:44:51 +0200
Message-Id: <20230810144451.1459985-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
References: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit bad3db104f89 ("ARM: imx: source gpt per clk from OSC for
system timer") osc_per can be used for clocking the GPT which is not
scaled when entering low bus mode.
This clock source is available only on i.MX6Q (incl. i.MX6QP) and i.MX6DL.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---

Notes:
    osc_per is only used in arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi, so I assume
    this is the only platform supporting this source.
    
    I had to use minItem:2 and maxItems:3 in the constraints as fsl,imx6sx-gpt
    and fsl,imx6sl-gpt are also compatible to fsl,imx6dl-gpt, but only provide
    two clocks. Maybe this the compatible list needs some cleanup, but I do
    not know which hardware is compatible to what. The driver
    drivers/clocksource/timer-imx-gpt.c also gives no clues because it's totally
    mixed.

 .../devicetree/bindings/timer/fsl,imxgpt.yaml | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
index c5d3be8c1d68..e2607377cbae 100644
--- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
+++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
@@ -48,14 +48,18 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: SoC GPT ipg clock
       - description: SoC GPT per clock
+      - description: SoC GPT osc per clock
 
   clock-names:
+    minItems: 2
     items:
       - const: ipg
       - const: per
+      - const: osc_per
 
 required:
   - compatible
@@ -64,6 +68,29 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx6dl-gpt
+              - fsl,imx6q-gpt
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 3
+        clock-names:
+          minItems: 2
+          maxItems: 3
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

