Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA48041BA62
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 00:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB8B6E9BA;
	Tue, 28 Sep 2021 22:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE076E9BA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 22:29:23 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so449270otb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 15:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vwcHQF6/8HUIm1fObpnSG0aiSaXON6QZUe3Gw0ku0bk=;
 b=I1QCbEIAYyjJbv4/MNtTHDwbB5u76P2grahgc9B1fE9Xe7303e8OTOPPTror7zdreP
 UzW9GZvdsWEVFJFqFB8OmuRvqEx8Mgg/L4TeCPhE86a8E3QYg9sozaMQzOxQhaPAboyA
 sTtwQ/ij54/UwKlOiHMsUyX5+EKDGsWoYinPiqiLj6UniDNRTS4k2HNwZsEZUJafWVaQ
 jBcsH9uRdHdvl3vKRYmsLIIZEpmmeuRTlyw/txMUy+O5eoNtosmnqK07K2OplgglGBj8
 lnjuWYxu2nkPEjlw2fYPvDDOwAbye5eam93GTMOVShoMqhbGVIppGYFtYStst4mllReg
 1RyA==
X-Gm-Message-State: AOAM531tE8NVeIHDmji4fzHHOE1qEdUP2mQNCFL/gfNKUdF0nVJx3cvi
 wEWFQlGnxJdvGgstk7bBnw==
X-Google-Smtp-Source: ABdhPJwIo8LpG9CqlCCSYyWBM2R+bXzVEo57GgT/4sLojNBA5cKROdiFakWw9bMvfnaBeZBHr5CWRA==
X-Received: by 2002:a05:6830:25d1:: with SMTP id
 d17mr7302750otu.253.1632868162403; 
 Tue, 28 Sep 2021 15:29:22 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id g4sm65460ooa.44.2021.09.28.15.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 15:29:21 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Evgeniy Polyakov <zbr@ioremap.net>, Marek Vasut <marex@denx.de>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Daniel Mack <zonque@gmail.com>,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: Drop more redundant 'maxItems'
Date: Tue, 28 Sep 2021 17:29:20 -0500
Message-Id: <20210928222920.2204761-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Another round of removing redundant minItems/maxItems from new schema in
the recent merge window.

If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
same size as the list is redundant and can be dropped. Note that is DT
schema specific behavior and not standard json-schema behavior. The tooling
will fixup the final schema adding any unspecified minItems/maxItems.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Marek Vasut <marex@denx.de>
Cc: Joakim Zhang <qiangqing.zhang@nxp.com>
Cc: Daniel Mack <zonque@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml        | 2 --
 Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml        | 1 -
 Documentation/devicetree/bindings/w1/w1-gpio.yaml               | 1 -
 3 files changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 07b20383cbca..b446d0f0f1b4 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -50,7 +50,6 @@ properties:
               data-lanes:
                 description: array of physical DSI data lane indexes.
                 minItems: 1
-                maxItems: 4
                 items:
                   - const: 1
                   - const: 2
@@ -71,7 +70,6 @@ properties:
               data-lanes:
                 description: array of physical DSI data lane indexes.
                 minItems: 1
-                maxItems: 4
                 items:
                   - const: 1
                   - const: 2
diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index 5629b2e4ccf8..ee4afe361fac 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -34,7 +34,6 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 5
     items:
       - description: MAC host clock
       - description: MAC apb clock
diff --git a/Documentation/devicetree/bindings/w1/w1-gpio.yaml b/Documentation/devicetree/bindings/w1/w1-gpio.yaml
index 7ba1c2fd4722..8eef2380161b 100644
--- a/Documentation/devicetree/bindings/w1/w1-gpio.yaml
+++ b/Documentation/devicetree/bindings/w1/w1-gpio.yaml
@@ -15,7 +15,6 @@ properties:
 
   gpios:
     minItems: 1
-    maxItems: 2
     items:
       - description: Data I/O pin
       - description: Enable pin for an external pull-up resistor
-- 
2.30.2

