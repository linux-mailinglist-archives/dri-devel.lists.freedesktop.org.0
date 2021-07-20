Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7813CFC87
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 16:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA2E6E40C;
	Tue, 20 Jul 2021 14:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B706E40C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 14:41:26 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id z9so24163142iob.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 07:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XBmEtxGuro5AHDRV4MlIOBSIJE60xpP6Q488vaMtT4w=;
 b=EnKOZft947gK8bMLPNo6ZK9jGnKQw/LcyOHdFomHv1vqwg3AlDJ0lLTBQWpgteIctw
 8sg7C8+f0I1iTSG5OO9LrjNXxUoHKxGxcmINfk6OhpLo1umwSZhzeReFDQ+1XH0srwm+
 fRDkvabtmh4xRlMi2vbR0c+yolXkJPYw2MjEc/CRpqr3pvN8xV9q4c1Q8A7KcjBxeJPt
 jUmkRWb/W7jE7wB5TpfRTaao7GoKIQRKZljZ3f0xyy/wHHEs8Qmt62ju+dKU+rOgBN+H
 KOJrUj53+4B5kN2v7bAvUgIN5F2FYP0U2ptdN0it9giaM/ayYXgTsyBlOnUHhJbbgfEm
 g+Bg==
X-Gm-Message-State: AOAM53371Y4HoIltEsPejRNGQOdJ37BFXipewJGNjpRQczq+DIu3JtDK
 E2deDSbj96Pl1OOZA45egQ==
X-Google-Smtp-Source: ABdhPJxooJfH/EtsqVVp9aWaE7jnvJiJKvu2tMzpZa406I+JYIozF7V3Rmk+KzkVPfszh9YcgMuFVA==
X-Received: by 2002:a6b:e60f:: with SMTP id g15mr22562813ioh.48.1626792086375; 
 Tue, 20 Jul 2021 07:41:26 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id 10sm2091407iln.39.2021.07.20.07.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 07:41:25 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH v3 2/3] dt-bindings: Clean-up OPP binding node names in
 examples
Date: Tue, 20 Jul 2021 08:41:20 -0600
Message-Id: <20210720144121.66713-2-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210720144121.66713-1-robh@kernel.org>
References: <20210720144121.66713-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Leonard Crestez <leonard.crestez@nxp.com>,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Georgi Djakov <djakov@kernel.org>, linux-omap@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
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
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml   | 2 +-
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml   | 2 +-
 .../devicetree/bindings/interconnect/fsl,imx8m-noc.yaml       | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 0f73f436bea7..4bea51d1e7ea 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -136,7 +136,7 @@ examples:
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

