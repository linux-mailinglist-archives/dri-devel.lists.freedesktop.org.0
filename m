Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1456C97CD
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 22:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C9710E237;
	Sun, 26 Mar 2023 20:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A174610E26A
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 20:42:29 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b20so28018039edd.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 13:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679863348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gG9ztwx7gkHgYSG+hPtINy83lSHlJ3gPmXdpgMiGDik=;
 b=LqM6CQ9N2gfNQiu+AELRYpJP1+VlJ8mX378s9ioDTPMA0rQgjhLt5a462ImkPp9RWs
 6EhDymwdIbm64k5VQcx5QONB2V5bqW0Td4vm5NXRQfY0GLIlHLvRkYiDst+fn9Lm/7kA
 z0ml+gzuO9NI71ChVKArUO4EITIfnhATGiycVMz3vn8hx27zUZGrG9EsqWePBepXS4d6
 KFpY+RF1nHWQ8nhbN1FftacCFX0SfZXw62aWNojpgFHiby4rAvdo48Yoxk9fuQ9KOEs1
 mzk8lWheF3ujT3gwGaCrcEr+yi29Z/XHt4uDt4ndXpEz8lz9XhzUrBwrf8P8n5z+pwG8
 sF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679863348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gG9ztwx7gkHgYSG+hPtINy83lSHlJ3gPmXdpgMiGDik=;
 b=Mt7yP/wlwgv8KoGpM+o7GV+XkwwAfz3ICB/LY44Ykba/mHh6zu7BMbPEcDx0rs6/Fm
 OYtt6zmBEdjaJ9HiDg4WsIS5W4wrBzyXsIPBNavkssj/qRu7vZPp0RRn6pDu+bhcA05n
 fQxGPElYpKdJj55vaGfOqhUEYxDi0R6z6he2cayy4KJtxMYCcFZ3HuGqfsIdQqjAarXJ
 GxMUTkYP05shutfY9+nEbrDvoUhKJMiZ6gi7Ubim88SiumxGwH0n0CgMhsGOVT4heTkY
 dJ9o5YL05k7IMuhd1y3+ko77seGGPEgRbYBIHb/gGlyfKS+4JSCA921hpEDHorvApsyu
 /LWQ==
X-Gm-Message-State: AAQBX9dBPlTP/QqknxTh84KTASLkCGtFMp/+6czrbg6LtPPqjiiV354Y
 bRDtPUf6PpKhaE0+7gNLQpaC2g==
X-Google-Smtp-Source: AKy350YGoyy5ydS3ykgysksCRYUBpA6u9Rbf+AmZYMzg/ie6Vr9vCvGLmxU9sQ33365hiV5iuz0tOQ==
X-Received: by 2002:a17:906:1645:b0:88d:f759:15ae with SMTP id
 n5-20020a170906164500b0088df75915aemr10723378ejd.42.1679863347920; 
 Sun, 26 Mar 2023 13:42:27 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6b51:4748:3f3f:ffcf])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a170906264b00b009255b14e91dsm13286144ejc.46.2023.03.26.13.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 13:42:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: display: xinpeng,xpp055c272: document port
Date: Sun, 26 Mar 2023 22:42:21 +0200
Message-Id: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panels are supposed to have one port (defined in panel-common.yaml
binding):

  px30-evb.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/panel/xinpeng,xpp055c272.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
index d5c46a3cc2b0..c407deb6afb1 100644
--- a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
+++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
@@ -17,6 +17,7 @@ properties:
     const: xinpeng,xpp055c272
   reg: true
   backlight: true
+  port: true
   reset-gpios: true
   iovcc-supply:
     description: regulator that supplies the iovcc voltage
@@ -27,6 +28,7 @@ required:
   - compatible
   - reg
   - backlight
+  - port
   - iovcc-supply
   - vci-supply
 
@@ -44,6 +46,12 @@ examples:
             backlight = <&backlight>;
             iovcc-supply = <&vcc_1v8>;
             vci-supply = <&vcc3v3_lcd>;
+
+            port {
+                mipi_in_panel: endpoint {
+                    remote-endpoint = <&mipi_out_panel>;
+                };
+            };
         };
     };
 
-- 
2.34.1

