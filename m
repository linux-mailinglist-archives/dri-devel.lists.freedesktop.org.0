Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD7967D8A6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 23:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E330210E3CB;
	Thu, 26 Jan 2023 22:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649EC10E07C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 22:40:49 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id o5so2624091qtr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+Z26JUx2ATLd/dkCoCkg+wifXJDNOjObbIUvuO+srwM=;
 b=K1hD81eySQ0tWy7XUcrWjImwQF9mnNjKUmmrAZjds3Aw4ZZ0JJx1WUEymQu1gI3EiD
 F9JiVInwc0C1Asm4Fo8dhs36pYCCYedqYQcPvmdv0rYCKou/AC7GGS3sDs5ivEbY2BiW
 TiR/RsSLlX4IPWE4/HRQNg/Qe0EuhlGdcRPSDIcF3sXXlr6xIH8rrdjdU7XJQlWa1pKp
 Vp3ooiqAZxpv3WXDD46BAXxJwrXRG0Tby/MWtPj82lRh11aOJArCDTjk0RLrKXHL7cEs
 rOeGv2NPwUeDNKFIsHGcqpD4D5MO/2bKCH/UXnb1sDOSKkYnFzAN74+XZ6v9VJaN9xVu
 EtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Z26JUx2ATLd/dkCoCkg+wifXJDNOjObbIUvuO+srwM=;
 b=AWaWV2NgRXywFC8f/Q48frGsz/5MGvs/ljcMhLEaMVm1s9guByLD+3O/4rFQCweT3i
 oy5DHeXsiDC6E6Hxrs43qnBcssFfKRnejLWiX4MX0lZOxUx7qB8GIq+oVP9cUSLEwekW
 VCp7F3N60kufY+vo8mXyfECiYJseGoBdCTREYKqf19HXAnuOto/D+0jCfEEyJ1mLvy+h
 PK48JlSDhXJaSBzJG1/PG3jk9VFgo5DWCqnSFQpJs4qZtq9hi8TjtRtjO3EjFWMOZjfl
 bidlzyMyXn5T2prnNAjSTKdFRUFud9Ojtqy/LFZaFb722NwsJhvsyQQpJsuQLrtiioQk
 h6EA==
X-Gm-Message-State: AFqh2kplZFcX88hEUvZu+08/W51SG6ftDmGSTB4kZxC2v8kMULNtvif8
 6vDb42l+X4UaPbaHvYaQ4p5Pvg==
X-Google-Smtp-Source: AMrXdXsUfPXyBdUOaoFYOcJfrln3A3RCdHVL43+dK/IM1vZZMlbUOM98q/vo9MEsr4B51Er7NsSKAg==
X-Received: by 2002:ac8:6f09:0:b0:3b6:309e:dfde with SMTP id
 bs9-20020ac86f09000000b003b6309edfdemr64396988qtb.27.1674772848366; 
 Thu, 26 Jan 2023 14:40:48 -0800 (PST)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net.
 [72.90.70.109]) by smtp.gmail.com with ESMTPSA id
 ek3-20020a05622a4fc300b003b68ea3d5c8sm1505678qtb.41.2023.01.26.14.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 14:40:47 -0800 (PST)
From: Jonathan Cormier <jcormier@criticallink.com>
Date: Thu, 26 Jan 2023 17:40:42 -0500
Subject: [PATCH v2 1/4] dt-bindings: display: bridge: tfp410: Add tfp410
 i2c example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-tfp410_i2c-v2-1-bf22f4dcbcea@criticallink.com>
References: <20230125-tfp410_i2c-v2-0-bf22f4dcbcea@criticallink.com>
In-Reply-To: <20230125-tfp410_i2c-v2-0-bf22f4dcbcea@criticallink.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=ChyX0+O3QNta/wRqgPEb2AoAlselOk6fdkUsmDhZY9g=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBj0wFuFMqR89pfGZmdPhF+pwtHpym61u5iPDoVFk0N
 dKFZPvmJAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCY9MBbgAKCRDc1/0uCzbrqpJhD/
 9lIdfkA8tiGvRTw7bZMK7o+oglBip9uQzPZ+wnANjsROcumDlucu9WujrWGavlRGW7ShilWBD9dgLx
 Wv4KYkIKDUSCzeBvTCt8sAmg7GKFjClTZUQTQzEmzAiHOFNYm7GZmvDFXQ1EPATRr4rmO+U2Xni88g
 pw/rGTlrgWc42vPYiuY8mfRdNNQjb6ritUdxPk1d8TeHSkihkVCwfcSW0zfNZ7+an+62dT+gBaHsD5
 /9aSW62LPR88px6ekim0UWQa8z3RxE0jQGenXZMt4/NCtqUV82eowNG6ysDJrWNwKo61BOJf3smom1
 bttnNHU3mYf6QwkHsExVC9JWJtlUr+Vch/VFUYJJJs73vxMRUOUjpk0CUK8njorLvAejGeZeBUJyyc
 IEHm/YpFC+Nttg/h5TELh1YF+QVOcCR4NA8nCz1m4bYQCnCs22AuaoBgjjvRri2TvnDXZ/cTxjBSyN
 cMd04FLx3gpLiBzHJ2E6czOJW+NQmWMFNuSqQes9+QLY7QmpCaRBaYobxsPNsJ0kWfuzY5cX4dLv0l
 ox9x4w4OgkAXH15aLhdCkK2f2jiNqAlOycDDlZtfCbbgSwihRhFGR1XxvShf+gx7gww9IRzIGB4ai4
 Z3SMI56RB6TO9TuB3zIm3UULujGRZIcq5RmI4EY4ut9UCDzLcCRJZw5gpgxw==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
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
Cc: Jonathan Cormier <jcormier@criticallink.com>, devicetree@vger.kernel.org,
 Bob Duke <bduke@criticallink.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Williamson <michael.williamson@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a i2c example with HDMI connector

Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
 .../bindings/display/bridge/ti,tfp410.yaml         | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
index 4c5dd8ec2951..1f3d29259f22 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
@@ -116,4 +116,34 @@ examples:
         };
     };
 
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tfp410_i2c: encoder@38 {
+            compatible = "ti,tfp410";
+            reg = <0x38>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    tfp410_in_1: endpoint {
+                        remote-endpoint = <&dpi1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    tfp410_out_1: endpoint {
+                        remote-endpoint = <&hdmi_connector_in>;
+                    };
+                };
+            };
+        };
+    };
+
 ...

-- 
2.25.1

