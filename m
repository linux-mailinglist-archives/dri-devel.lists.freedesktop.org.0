Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD578323734
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 07:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BC06E43C;
	Wed, 24 Feb 2021 06:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33306E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 06:14:14 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id t29so643980pfg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 22:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yxOYlDcAmFrvsseVFQZnlbu4c+MCg9v+/OLc+k95JMI=;
 b=h11vlpce4XGbBFbk13afoWc/iYSBMme7SCx6TA7PPG8goj0ZamXqmwYnchAylwh/kG
 G334yWOoUrSCVEiaQ2b11Ns6QtNTs6lyIv0I/sP/H6R2B45KRaZjH4ftfQ11MHnI52wq
 oq6Yme52ovnyQ1MJodGTN8XLzANyTf+v8UvSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yxOYlDcAmFrvsseVFQZnlbu4c+MCg9v+/OLc+k95JMI=;
 b=EbFoqFGduV0xJGwZETgySHoNxzjyY7OOw5DCTh1IhIDcvjvX36eGcychaB9U3K5TxD
 zHhfgFlqcbGOW7e+S7K0qnqpKa/WfXqQtLb8ikByk+sL3sLip3cfvjZx6VmzRw2WZPhs
 hHb+wQIih9jrQoIkrHrS6WxY54h2VXWBo2QaFocY6dfLYEHKc20qcOA41Hlh7vWo21jY
 V52esEoq4h9q/pejlAbdIO/IxChHHq5G+GTNVdTnQnHQqRXNoPdCadtfHi/r7eYsdrJv
 AGkFDhYZDY7kVkDozPtwcWrN+E4HCgWL5IuqpkFm5kfSO1D331uh4OpOpFsTMP2DYU45
 JCbg==
X-Gm-Message-State: AOAM530C4QqomZrsW9MzmxPeCuRPZmH3lL+jGVPYnyO2yiO4SXF5tQiM
 ksmzEkHud2M9mz/psJmqv8Rmhw==
X-Google-Smtp-Source: ABdhPJxy2AVlk5Xq7aOvwN63bI6UesMrVz7TGyZ2uLn4UrK2JqH1Tv0V+HKRxOP7f5vWqaG+1ITTig==
X-Received: by 2002:aa7:888b:0:b029:1ec:df4a:4da2 with SMTP id
 z11-20020aa7888b0000b02901ecdf4a4da2mr29828733pfe.66.1614147254429; 
 Tue, 23 Feb 2021 22:14:14 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5003:b035:5243:160e])
 by smtp.gmail.com with ESMTPSA id r13sm1266765pfg.37.2021.02.23.22.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 22:14:14 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Xin Ji <xji@analogixsemi.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/2] dt-bindings: drm/bridge: anx7625: Add power supplies
Date: Wed, 24 Feb 2021 14:14:08 +0800
Message-Id: <20210224061409.3996755-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

anx7625 requires 3 power supply regulators.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
v3->v4: rebase to drm-misc/for-linux-next
---
 .../bindings/display/bridge/analogix,anx7625.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index c789784efe306..ab48ab2f4240d 100644
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
     $ref: /schemas/graph.yaml#/properties/ports
 
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
2.30.1.766.gb4fecdf3b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
