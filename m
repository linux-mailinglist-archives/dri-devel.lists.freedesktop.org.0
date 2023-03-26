Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8B26C97D3
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 22:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C507510E298;
	Sun, 26 Mar 2023 20:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D94510E262
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 20:42:32 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id w9so27996700edc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679863350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ew1SyOgc+Q7GMXF7T6us3Qow14K/abD5i3gh3lFcCZY=;
 b=eXnSIZRA/7ZdDiZvFi+IsTCSk8BkvQg/VUKSIjFwB4QqOUvjzxtxA9lz+E7pSv/mj8
 jrf1Mu8CCKgfI49hv5O2h1vnZ0MhIjDzxf6t6FeQEZFvdndIPH5MYqBy3AYwDpLtbzvP
 9Sspdyc2fg09jMucuaLd+o3u2I1NIRi2avI/4VLnh6Fck7V0TlzMrBGkJhCc+gRb0lK0
 Dzr2iiteUUbIVrN7EyfnhYp+MoQgaidey7ta6UwB36TR9VCUrN/QASOh5x/LYPVJiyLV
 65Kmn+NwJN4aO4hhG8IuGMU3xNrOMUJghDnNp7BBy8IKp4BZShiZQZKDXirJtec9tLk7
 DPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679863350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ew1SyOgc+Q7GMXF7T6us3Qow14K/abD5i3gh3lFcCZY=;
 b=4yP1Ht1beRZs4r1BmFVz1Db+bBy/0tK+zr0pYOnHTaUTIU+QnkLUHjBol/ARdCRfl5
 W4vQCAq82iKp4XFVk8ecTM/7L8Dcmp9lwz3zm1dtxrTVBd3tTJuvwDMEeb38zMNQYPax
 5BUq+iiUWKZFnirE+JfQRAZDdLXqfkVnlmdkBFoslT5lNBBPb2XvhbMl0+85YsdyA44G
 l8Rf0dialm94UBxZ6LBV+KpT67N872E87n2acZWRNBQOnKlICoTzFsIy73K7fLKYGbMe
 QsddgO0wmVl8RPWSK3LVyy9nRpwJx+8PNfx8coynvLnQ0xxyrLeRi2wza8rb+Yy+wWYt
 LA9g==
X-Gm-Message-State: AAQBX9fZBMUhCiMHo+hCEhLRQs5WbTN7i3E7ebC5hSrcyYQDcotIsBPD
 G2j4IwXGYVIdmaLvCSYvHRhetw==
X-Google-Smtp-Source: AKy350b8Qq2nfe1wFdmZ/iGhbbovdEBefSjUAKlu3sDWABfuoBZNwk2iQv9QSajhWclgO8UNpcL1yg==
X-Received: by 2002:a17:906:facb:b0:93b:752:d2a9 with SMTP id
 lu11-20020a170906facb00b0093b0752d2a9mr10277563ejb.31.1679863350701; 
 Sun, 26 Mar 2023 13:42:30 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6b51:4748:3f3f:ffcf])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a170906264b00b009255b14e91dsm13286144ejc.46.2023.03.26.13.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 13:42:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: display: sitronix,
 st7701: document port and rotation
Date: Sun, 26 Mar 2023 22:42:24 +0200
Message-Id: <20230326204224.80181-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
References: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
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
binding) and can have also rotation:

  rk3326-odroid-go3.dtb: panel@0: 'port', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/panel/sitronix,st7701.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index 83d30eadf7d9..4dc0cd4a6a77 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -42,7 +42,9 @@ properties:
   IOVCC-supply:
     description: I/O system regulator
 
+  port: true
   reset-gpios: true
+  rotation: true
 
   backlight: true
 
@@ -51,6 +53,7 @@ required:
   - reg
   - VCC-supply
   - IOVCC-supply
+  - port
   - reset-gpios
 
 additionalProperties: false
@@ -70,5 +73,11 @@ examples:
             IOVCC-supply = <&reg_dldo2>;
             reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
             backlight = <&backlight>;
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

