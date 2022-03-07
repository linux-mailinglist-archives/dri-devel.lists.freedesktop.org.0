Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1484D033D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B0910E043;
	Mon,  7 Mar 2022 15:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A8810E02F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 15:46:17 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w4so17993378edc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 07:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L5m6P7fLCOpQVhAoLkaaRIYTfvk9veUQCuvJDzF/V1c=;
 b=PdZQVIGYoSypt74Tuo0iLHZLHiWRG6vXCYsgFDwpM6qXsOTCeEU7R4CQIoq5C0dkh5
 jjExHORdLRHgqKN2d9StsZC092OGT4wCkFoODQBDAnEPYkvKtiu9hk5y8H9QiX3zHK9g
 osvrCBdLuY19+5Ed23HqTWehMMRZfA09MZ/AxURGswP/lN283j86aGyEzAaRbyMDswxe
 KhGNvLZN8Pq3ZPZkevCDHI+QRSNJ6padD8lh312vJ/dUCvCdU+pUyPajHJCWzseeu8qI
 pu39e3BojrA/uZPZODDdt5MXr9tsT0MIaW9FW7xJ70BOfWTu6FcoYjH6qQvk6x0HZmHO
 nm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L5m6P7fLCOpQVhAoLkaaRIYTfvk9veUQCuvJDzF/V1c=;
 b=Od/3SHFDHOFghP4ldKcDzZkIz3m9gyFjU71hNPm1a6AS0fKH0dSSM6b71DNw2kU5GH
 WwnbwG6b987IDKukvqxM+1gdkIBU85lzzjDVVm3r11aXpjS3tKTuNA8jMjqQWhelM9jJ
 +hrvLZJ95FK6G93XaAWAkCz1/MiE6Vg8hCgnhH5ZTJB35LX9bc3MxK7FrPyYyHS9EHbz
 j58B0n1g6IxwmPJRPfI/poPLcADHonc9yAN1qak2jar9teJpWobFkvoSKawsa+zkwYmT
 AT+YnSh5rgvUvk+gA9qYocRrHXu0xM6ASNKd8XPPpeTttmcz0s2F2/O0bt9HmkAG2Kpu
 A/7Q==
X-Gm-Message-State: AOAM531TZz5rq5Pq7GujGVOSGZTcf3ogmzKJtILx0sP1MjHQLiasO9oC
 8UkyyNVxjHjyBkSbCLcrsCxecg==
X-Google-Smtp-Source: ABdhPJz+TkcFsHL4kC2nAluY7JPswqrL7Wk2RJBJZ8M0konGhmQuUI7nNxB6e/fssM8GX54SAHaJRg==
X-Received: by 2002:a05:6402:d06:b0:412:eafd:8b9a with SMTP id
 eb6-20020a0564020d0600b00412eafd8b9amr11749516edb.278.1646667975836; 
 Mon, 07 Mar 2022 07:46:15 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a056402190c00b0041615cd434csm4210747edz.60.2022.03.07.07.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 07:46:15 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, robert.foss@linaro.org, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v1 1/2] Revert "dt-bindings:drm/bridge:anx7625:add vendor
 define"
Date: Mon,  7 Mar 2022 16:45:57 +0100
Message-Id: <20220307154558.2505734-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307154558.2505734-1-robert.foss@linaro.org>
References: <20220307154558.2505734-1-robert.foss@linaro.org>
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

This reverts commit a43661e7e819b100e1f833a35018560a1d9abb39.
---
 .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
 1 file changed, 2 insertions(+), 63 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 1d3e88daca041..ab48ab2f4240d 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -43,70 +43,14 @@ properties:
   vdd33-supply:
     description: Regulator that provides the supply 3.3V power.
 
-  analogix,lane0-swing:
-    $ref: /schemas/types.yaml#/definitions/uint8-array
-    minItems: 1
-    maxItems: 20
-    description:
-      an array of swing register setting for DP tx lane0 PHY.
-      Registers 0~9 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
-      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
-      Swing1_Pre2, Swing0_Pre3, they are for [Boost control] and
-      [Swing control] setting.
-      Registers 0~9, bit 3:0 is [Boost control], these bits control
-      post cursor manual, increase the [Boost control] to increase
-      Pre-emphasis value.
-      Registers 0~9, bit 6:4 is [Swing control], these bits control
-      swing manual, increase [Swing control] setting to add Vp-p value
-      for each Swing, Pre.
-      Registers 10~19 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
-      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
-      Swing1_Pre2, Swing0_Pre3, they are for [R select control] and
-      [R Termination control] setting.
-      Registers 10~19, bit 4:0 is [R select control], these bits are
-      compensation manual, increase it can enhance IO driven strength
-      and Vp-p.
-      Registers 10~19, bit 5:6 is [R termination control], these bits
-      adjust 50ohm impedance of DP tx termination. 00:55 ohm,
-      01:50 ohm(default), 10:45 ohm, 11:40 ohm.
-
-  analogix,lane1-swing:
-    $ref: /schemas/types.yaml#/definitions/uint8-array
-    minItems: 1
-    maxItems: 20
-    description:
-      an array of swing register setting for DP tx lane1 PHY.
-      DP TX lane1 swing register setting same with lane0
-      swing, please refer lane0-swing property description.
-
-  analogix,audio-enable:
-    type: boolean
-    description: let the driver enable audio HDMI codec function or not.
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: /schemas/graph.yaml#/properties/port
         description:
-          MIPI DSI/DPI input.
-
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            type: object
-            additionalProperties: false
-
-            properties:
-              remote-endpoint: true
-
-              bus-type:
-                enum: [1, 5]
-                default: 1
-
-              data-lanes: true
+          Video port for MIPI DSI input.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
@@ -143,9 +87,6 @@ examples:
             vdd10-supply = <&pp1000_mipibrdg>;
             vdd18-supply = <&pp1800_mipibrdg>;
             vdd33-supply = <&pp3300_mipibrdg>;
-            analogix,audio-enable;
-            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
-            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
 
             ports {
                 #address-cells = <1>;
@@ -155,8 +96,6 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
-                        bus-type = <5>;
-                        data-lanes = <0 1 2 3>;
                     };
                 };
 
-- 
2.32.0

