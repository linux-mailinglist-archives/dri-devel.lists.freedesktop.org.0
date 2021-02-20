Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC56C32046E
	for <lists+dri-devel@lfdr.de>; Sat, 20 Feb 2021 09:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278666E102;
	Sat, 20 Feb 2021 08:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544B96E073
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Feb 2021 06:08:17 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id j24so363963pfi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 22:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4J7s0mPNjGFe1vyjC7N5XGIE26jPZq4Ak09pPR0Twms=;
 b=lyDJdkqCpdi60gGZAPVkdzWgGNquPY2yhkZ9S3Ua8ZTSPznkX+1MGAagKtkECNAEu2
 OzC5O/A+0iAOf53nRQeNbxa0Mvaa9mpeiXCJvmN3/xD0m5vwFoQxpeSMmBJ8hEfmTE02
 /nwVYAKMMMf+tHeGC7IbORuTcGQaRend6ehfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4J7s0mPNjGFe1vyjC7N5XGIE26jPZq4Ak09pPR0Twms=;
 b=RNJwKhFOmhR1Pf1BsDkO1KlP8UKejGwfboZJAFGUejzCilEFKkOj0gJhFj97FPIzqv
 uO0mCezXuBuaBy4npi6Q4jRWgNdcQvx2ZCUmgBYoBFtxKJ/C6qfgHJBu8GUTO7jSXCdQ
 ntOh2V6duucaDd4u4/CYZBqojyV9fWZ0sj0Paxo2zG7GMqwx1LMSc1XF68B53xvynC6m
 LQyZXikPrKvSnx8jiiK1pw4u6agOZhWLbFxCdriXml6LLIfma5iuUBjpgKFigncQgSzM
 0tF985RGsNM73f/DicZrSikj7LEDnSc4t34sjAWUdKlpKrNpCTCIShdIYEyLbiYDNqrZ
 /FvA==
X-Gm-Message-State: AOAM533dMwfpFOiXrkjXjyS06FzKvC8aqT6CyfBnP0PuDiYTkTab8ud9
 HEHRJeaiXpwQtyJ/R/HPN4DVtg==
X-Google-Smtp-Source: ABdhPJzeo47hIWNCTY8rScYv5CJmQh6LqfmJhCPz8jxmAxv/V7hM+by1CxBxc4OvbSGHZDyjtYyo0w==
X-Received: by 2002:aa7:93ac:0:b029:1e5:b52e:314f with SMTP id
 x12-20020aa793ac0000b02901e5b52e314fmr12473630pff.45.1613801297317; 
 Fri, 19 Feb 2021 22:08:17 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:537:d36b:e4d6:54fb])
 by smtp.gmail.com with ESMTPSA id w187sm10943697pfb.208.2021.02.19.22.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 22:08:16 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Xin Ji <xji@analogixsemi.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Subject: [RESEND v3 1/2] dt-bindings: drm/bridge: anx7625: Add power supplies
Date: Sat, 20 Feb 2021 14:08:10 +0800
Message-Id: <20210220060811.2500081-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 20 Feb 2021 08:30:34 +0000
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

anx7625 requires 3 power supply regulators.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/analogix,anx7625.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 60585a4fc22bc..3ae97d9523e56 100644
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
2.30.0.617.g56c4b15f3c-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
