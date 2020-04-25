Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C2B1B8FDF
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 14:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01656E2BC;
	Sun, 26 Apr 2020 12:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9F56E227
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 15:40:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s10so15172855wrr.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 08:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4tS2YGMao2bjz+V8i9WcC4XNAp8kWn2u9wEJt79QoxQ=;
 b=dF1k9liH3vfLfnCQ38X3ZEdw/ILSueU4pIU8vSkFjXiNbaOk0AOr7z6fV5KjjUhI3G
 tGmJbp7EWR2o+ivKlKnxVEms60/+1PQmdCuJUJlDSpU9c2UP4038Fr4cDhjIWw4hsMjq
 gGdRD3NqmVtvGDsdb+VQF2ruU1D78lBlNTBpCpWuJkYFqR1ymt5O3ng224ZDwlvUl/Pu
 zYlP3+58ZnvuRTo8pNHKJl/F+2SR0Rn7vy7iF49aV2kXRZOgiw6H75UuYXSq8Y9tj8t0
 TWGpif2nTKtPlcbYrCUGN7cDWU3ba0bEa/CNDdiiiO+0Ir9vBH11pGwugIFjUBrtpdH+
 iyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4tS2YGMao2bjz+V8i9WcC4XNAp8kWn2u9wEJt79QoxQ=;
 b=VJmkChVMsfMDr44OJsUKfBQLWtGRBui1g8sVfYbabyf0EDakAw1z7Dgbvjgwxk1U96
 pyAG+E2p2aawO/FqnykKMkbWMrTmeqWvI6GstpahPvLBigNFeviBnzcrREuzfSbKeKGr
 tkoMr9mNHTpIsk0KX9dgixjxDisqOAXECLuat1O3waLI5Yo7QRuUMcSb8nOQoJsI2XbQ
 lPLK6hc+b7PpohKp9lPG0Y5dzQnJMQ8mSX+poT2liaVrfyxbZ/WWHfd+AMzPPdbcF9Zg
 wmOrMEY7+7tosVWhBo8WXpx2tM3QjeARK/RrV2SDoht4QaI6hmQo74r0I5iQPwJCgn5l
 onrQ==
X-Gm-Message-State: AGi0Pua13Kt62JckO7OfV/l1N9wvJm8isSz05R/onT5MF4O1LjgzqR3j
 esiEKQ4iQkYXIQHhONII1uY=
X-Google-Smtp-Source: APiQypJGoGaAzG+Bg3At6JDz4UC0pKLg+Q1gEBvlSnQRnBene5RUUzfezzxPjtbNthOJhfaLe9pXvA==
X-Received: by 2002:adf:ab5c:: with SMTP id r28mr17423144wrc.384.1587829245032; 
 Sat, 25 Apr 2020 08:40:45 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c190sm7759143wme.4.2020.04.25.08.40.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 Apr 2020 08:40:44 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH] dt-bindings: gpu: add power-domains #cooling-cells to arm,
 mali-bifrost.yaml
Date: Sat, 25 Apr 2020 17:40:37 +0200
Message-Id: <20200425154037.21083-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Sun, 26 Apr 2020 12:35:16 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A test with the command below gives this error:

arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml: gpu@ff400000:
'#cooling-cells', 'power-domains'
do not match any of the regexes: 'pinctrl-[0-9]+'

With the conversion to yaml it also filters things
in a node that are used by other drivers like
'#cooling-cells' and 'power-domains'
for Rockchip px30 gpu nodes,
so add them to 'arm,mali-bifrost.yaml'.

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/gpu/
arm,mali-bifrost.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 0b229a7d4..b1844b9c2 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -43,9 +43,15 @@ properties:
 
   operating-points-v2: true
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 2
 
+  "#cooling-cells":
+    const: 2
+
 required:
   - compatible
   - reg
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
