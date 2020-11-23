Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC5B2C0129
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 09:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7C789BA9;
	Mon, 23 Nov 2020 08:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CDA899AB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:47:14 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w16so621315pga.9
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 19:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NBFTSOV5X132dLJFilDGPY0gccuN+TXfuq0RMp4Oqzw=;
 b=JEuH55PhaK7IO9cw/CxjGzrdcTknRer/qrRcyHH+scTgYPXovzkSmgH5n9ZJp9T1uY
 JrbUAqwU2aZHbvaHIjeg5DFe5fhzeBWqivQEKX1vCZNnUKADweCUN0hQuZSeRIzAwKnI
 pZ8aiN5SLHO6+CQEKtN1cBrHrsfXgAsiSF4QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NBFTSOV5X132dLJFilDGPY0gccuN+TXfuq0RMp4Oqzw=;
 b=UDSTzQ++jPCb2nI/22/fJq0SnrAb2bbabMcJ/UT/58prOhYXffuWuLA6uA3lx/VJNa
 7si8lcLEKn5lkbnXOjA0jCd9sbsHB2Sb5FOMiG0ot6uXgrlnduyXHI9WSaM49YzcDHTS
 KjUv3nviepK1zGAK/aO0cfC1VS44Y7Tpq4Rw+T0j/mbcadVCdPGNbsV1oMT/dSwwe2pN
 936pBtUXrMAJ738VcMKccCPJvhZcVj825hnqeiNaVJPlpLHpW6uRqVE0sFkfh6hUqMbr
 s4uPZfHvdkIG+C3x0NlyH7ICrlSkNiR+j62x3Bma5EYCycsE5JPA5SA4QEbfq4wldFlX
 UhpA==
X-Gm-Message-State: AOAM530U+euuiQ991Kk8IagMGDFCRASao20fzySjEyLi9C/V5tjfXeML
 EJctB+K9tTJwfk42C8+tE9J77w==
X-Google-Smtp-Source: ABdhPJzpgoMOf+q/nprXjb6p03ctbOnQTmYQujTxfTsmLUeR6e38hwpr+BcyG1jJ5h09Ok3ZKHNC6w==
X-Received: by 2002:a17:90b:3647:: with SMTP id
 nh7mr7221696pjb.114.1606103233806; 
 Sun, 22 Nov 2020 19:47:13 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id m13sm149245pfa.115.2020.11.22.19.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 19:47:12 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Xin Ji <xji@analogixsemi.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: Add power supplies
Date: Mon, 23 Nov 2020 11:46:52 +0800
Message-Id: <20201123034652.3660584-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 08:12:51 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

anx7625 requires 3 power supply regulators.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Change:
v2: remove maxItems for supplies
---
 .../bindings/display/bridge/analogix,anx7625.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 60585a4fc22b..3ae97d9523e5 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -34,6 +34,15 @@ properties:
     description: used for reset chip control, RESET_N pin B7.
     maxItems: 1
 
+  vdd10-supply:
+    description: Regulator that provides the supply 1.0V power.
+
+  vdd18-supply:
+    description: Regulator that provides the supply 1.8V power.
+
+  vdd33-supply:
+    description: Regulator that provides the supply 3.3V power.
+
   ports:
     type: object
 
@@ -55,6 +64,9 @@ properties:
 required:
   - compatible
   - reg
+  - vdd10-supply
+  - vdd18-supply
+  - vdd33-supply
   - ports
 
 additionalProperties: false
@@ -72,6 +84,9 @@ examples:
             reg = <0x58>;
             enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
             reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1000_mipibrdg>;
+            vdd18-supply = <&pp1800_mipibrdg>;
+            vdd33-supply = <&pp3300_mipibrdg>;
 
             ports {
                 #address-cells = <1>;
-- 
2.29.2.454.gaff20da3a2-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
