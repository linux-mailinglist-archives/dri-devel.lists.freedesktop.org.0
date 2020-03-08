Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA0217D3A5
	for <lists+dri-devel@lfdr.de>; Sun,  8 Mar 2020 12:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E816E29A;
	Sun,  8 Mar 2020 11:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFBF6E29A
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 11:50:32 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id r7so6986487ljp.10
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2020 04:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8U0arpJjyZG4PEcID5P3OdBxXe5FL2ju3xXw7vB6b5Y=;
 b=ewXgXl+XIX83J0qPxVIMouqkdbaEsp2Skrles62G1DDhD95uW8cRlgGyRlpnH0H3q5
 RsdI3gjugvptUjBfaVTe1nFHkAIOg+uTzc1ZotHJ2SLOci6SgdggNrU8ki+uwnF9+KFc
 NtbYQLD3SDkCthoXRu/yyud8tZatR2jQx+tH2+pJp8FVz64WT5Quxo7/0o5iPDi52TbK
 hHWg5+MgPgyfVtvCj1S8oB7KQWxdM29PxS3o/Pfsm9YKrEMeXYelbT907+lS6ttJJFFh
 SdszsXHwbzJfbKAzu/TZzpnip2D2fMlCGt6U6iTNBC9Yl2PJQIm94DK46xKo5OYgqEbu
 KmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8U0arpJjyZG4PEcID5P3OdBxXe5FL2ju3xXw7vB6b5Y=;
 b=BW5newHmybSoxzfODEe4Qzl5FDSObuGtdczj/Yufg9RFJByodeK/Pkix13KJ5K/oCJ
 8UCnX3+ALiU/Yz0VsfcvPJdEnyTs2bUIrTpS8Aqw5TDewRNrOfwA6oZ1T/lqJmUW89uv
 8pYsrMO1p5ZzSsAHnq/6IZAVJkZ00hS9Lm5m7yXAFUEgH4s4GqtEdLfREfrwb2+ZWoOI
 CcsmjL+GKbBGgEHurT8Wf17oqjOW2hNZiJtCke23E25MejdHhrjsuqM75OIbrPgnYwyZ
 KW1t5bGavq3zYvITSI4xXj5iJkgctQUTPLfrGe1yrU77EJ2DbROLZ46C7iJjkTgdmlD7
 ZR8w==
X-Gm-Message-State: ANhLgQ3EOBhmd/W/Hny0K7ZKredpMDRD9GSOXQflZ+c2WfLMsWj478G5
 TWL8qK8bqzowDokHn7tG1OM=
X-Google-Smtp-Source: ADFU+vscdSC5W1WXwbGjsyCNU3QkHsMl8UcRV7mQHXL9XewiB+zCLdzS7TWZx3O9REjmTM8bbAsXbA==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr3914692ljj.266.1583668231058; 
 Sun, 08 Mar 2020 04:50:31 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u5sm8557572ljl.75.2020.03.08.04.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 04:50:30 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
Date: Sun,  8 Mar 2020 12:50:17 +0100
Message-Id: <20200308115017.18563-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200308115017.18563-1-sam@ravnborg.org>
References: <20200308115017.18563-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix following type af warnings in the panel bindings:

Warning (unit_address_vs_reg): /example-0/dsi/panel: node has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): /example-0/dsi@ff450000: node has a unit name, but no reg property

Removing the "@xxx" from the node name fixed first warning.
Adding a missing reg property fixed the second warning

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/display/panel/elida,kd35t133.yaml     | 2 +-
 .../bindings/display/panel/leadtek,ltk500hd1829.yaml          | 2 +-
 .../devicetree/bindings/display/panel/novatek,nt35510.yaml    | 4 ++--
 .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml | 2 +-
 .../devicetree/bindings/display/panel/panel-dpi.yaml          | 2 +-
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml   | 2 +-
 .../devicetree/bindings/display/panel/raydium,rm68200.yaml    | 2 +-
 .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
index 4bd74eaa61be..aa761f697b7a 100644
--- a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
+++ b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
@@ -34,7 +34,7 @@ additionalProperties: false
 
 examples:
   - |
-    dsi@ff450000 {
+    dsi {
         #address-cells = <1>;
         #size-cells = <0>;
         panel@0 {
diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
index 4ebcea7d0c63..2c9b8aa34815 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
@@ -34,7 +34,7 @@ additionalProperties: false
 
 examples:
   - |
-    dsi@ff450000 {
+    dsi {
         #address-cells = <1>;
         #size-cells = <0>;
         panel@0 {
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
index 791fc9daa68b..73d2ff3baaff 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -40,10 +40,10 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    dsi@a0351000 {
+    dsi {
         #address-cells = <1>;
         #size-cells = <0>;
-        panel {
+        panel@0 {
             compatible = "hydis,hva40wv1", "novatek,nt35510";
             reg = <0>;
             vdd-supply = <&ab8500_ldo_aux4_reg>;
diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
index 6e6ac995c27b..4b6dda6dbc0f 100644
--- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
@@ -39,7 +39,7 @@ required:
 
 examples:
   - |
-    dsi@0 {
+    dsi {
       #address-cells = <1>;
       #size-cells = <0>;
       panel@0 {
diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
index 5275d350f8cb..f63870384c00 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -48,7 +48,7 @@ additionalProperties: false
 
 examples:
   - |
-    panel@0 {
+    panel {
         compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
         label = "osddisplay";
         power-supply = <&vcc_supply>;
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 8b60368a2425..cefe19b6bf44 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -50,7 +50,7 @@ required:
 
 examples:
   - |
-    mdss_dsi@fd922800 {
+    mdss_dsi {
       #address-cells = <1>;
       #size-cells = <0>;
       panel@0 {
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
index 09149f140d5f..a35ba16fc000 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
@@ -42,7 +42,7 @@ required:
 
 examples:
   - |
-    dsi@0 {
+    dsi {
       #address-cells = <1>;
       #size-cells = <0>;
       panel@0 {
diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
index 186e5e1c8fa3..39ec7ae525ad 100644
--- a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
+++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
@@ -34,7 +34,7 @@ additionalProperties: false
 
 examples:
   - |
-    dsi@ff450000 {
+    dsi {
         #address-cells = <1>;
         #size-cells = <0>;
         panel@0 {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
