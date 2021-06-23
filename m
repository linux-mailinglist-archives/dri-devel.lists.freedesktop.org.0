Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D423C3B23D5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 01:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387D06E94A;
	Wed, 23 Jun 2021 23:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1BE6E94A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 23:07:31 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id k16so5500637ios.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 16:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C+uE8+nAEXOxgiCH++oPG1+J3LkqFr8mIOEqRnmwPBw=;
 b=s5Ckz9t4+5tPccF+XTldfbZfofkiaM9QIsyEzHFHUBwjyW28ugDsiGIBncYbHUy5uF
 /fhI3zlYzD/qWipLoYSbH+1md+L2QTe9NnwsBE28/gkFPK7diJHWbD0LjUYgBvj1TOej
 RbXGEbvRDAmmZCBgGMXDqnG/6zezAb0ff4l6y7cXLFlg4yXAfbLIb7BMUwikCgMJ1H7K
 T34XOG2/5leTP+2ZzaUBm/HQ6h9hNThWiHi7U7WZTwb8pj44Zs2ECpUVqKmzk0BUR3jq
 zgBPexLD3X8julGsx5F2d/Duj+yUDCNUwYZAeZw9IA9b49myJiAWQaJjniW3jwcUrI+A
 l1OA==
X-Gm-Message-State: AOAM533iV2KhnOUWEkpqYxpmt6f9Z+HuQLlE1Yj5+A3DtUG/JXlV7l+0
 HCUHQVIZe5nHLOnR++wVBQ==
X-Google-Smtp-Source: ABdhPJwzuEWwG8Oagt2CTbbJroe3LynjgOu1pCwS9+oZVovJWP3h2Wsz8MenFNLJPGxpp+FNp6bSgg==
X-Received: by 2002:a02:90cb:: with SMTP id c11mr1863165jag.53.1624489651145; 
 Wed, 23 Jun 2021 16:07:31 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id t15sm694356ile.28.2021.06.23.16.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 16:07:30 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 1/2] dt-bindings: Clean-up OPP binding node names in examples
Date: Wed, 23 Jun 2021 17:07:21 -0600
Message-Id: <20210623230722.3545986-2-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210623230722.3545986-1-robh@kernel.org>
References: <20210623230722.3545986-1-robh@kernel.org>
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
 Yangtao Li <tiny.windzz@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, Georgi Djakov <djakov@kernel.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to convert OPP bindings to DT schema, clean-up a few OPP
binding node names in the binding examples.

Cc: Georgi Djakov <djakov@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Leonard Crestez <leonard.crestez@nxp.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-pm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml   | 2 +-
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml   | 2 +-
 .../devicetree/bindings/interconnect/fsl,imx8m-noc.yaml       | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 894ba217ab32..260afff8cfbb 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -108,7 +108,7 @@ examples:
       resets = <&reset 0>, <&reset 1>;
     };
 
-    gpu_opp_table: opp_table0 {
+    gpu_opp_table: opp-table {
       compatible = "operating-points-v2";
 
       opp-533000000 {
diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index 696c17aedbbe..d209f272625d 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -160,7 +160,7 @@ examples:
       #cooling-cells = <2>;
     };
 
-    gpu_opp_table: opp_table0 {
+    gpu_opp_table: opp-table {
       compatible = "operating-points-v2";
 
       opp-533000000 {
diff --git a/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml b/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml
index a8873739d61a..b8204ed22dd5 100644
--- a/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml
+++ b/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml
@@ -81,10 +81,10 @@ examples:
         noc_opp_table: opp-table {
             compatible = "operating-points-v2";
 
-            opp-133M {
+            opp-133333333 {
                 opp-hz = /bits/ 64 <133333333>;
             };
-            opp-800M {
+            opp-800000000 {
                 opp-hz = /bits/ 64 <800000000>;
             };
         };
-- 
2.27.0

