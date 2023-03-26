Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F96C97D2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 22:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2B710E26C;
	Sun, 26 Mar 2023 20:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB1E10E512
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 20:42:30 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id eg48so27821771edb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 13:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679863349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BilgW9JQ3PYiXbdZSdcUykIAS0KaiQsLO0keVQERKnA=;
 b=OSlvhaVxy64XN8aMVHBS4Zg5o8E2zsGaanoaFHcnY+22smUGuOb+qu9CIfIpOQiIvC
 lNBik1Of2Au9EjTgXUjruoCHMLWm9BDc3Ohz/1igEkeTZqkPreOd4ph/I5K0291Gm2Q4
 thC5c1jC9v0FyxwO7onEbq61QkfZ5LYAm2MuGD1UjLKs+j9pFeV1+42UNBuKWZM9Yocc
 ufSfXOFZaHkzB3cLSO1NilDS7V4db0Vj3amdC17Zd58X+19p7IVqokcM8WBmtO65lfMa
 ar9I4wZs9vtoVdDX50WLnPMLWAN9UsdELvet8GuvzWU5/bb7JWmBQfdlTyUdaxCkmG9G
 Bqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679863349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BilgW9JQ3PYiXbdZSdcUykIAS0KaiQsLO0keVQERKnA=;
 b=lTEmpu2pb2S7KumGYw1qnCa1Rj6Xe9p4XyPJ3zp78dHHVOGy/kbYn6DriVWXXEXUdI
 ginKfrffqzrNstFMLh1OVZmbJZuCSJaQ6t85J3z5XmAW54o+V1Trj6FuEJiJAfzZZ8cZ
 JPR1n8GCZ4AB06oGhslcHKxE1eppWJA7Z5kDyi0OFf0jOpOo7Forh4N76QNiPRTrHgiH
 YvMAGm9bySKDxapIoRHPClQKuQhzaDEclralI7RVtKAMZEh3f/UoXEg32+yE6NqdM0/o
 bNweUo7vwRXU4ZLZgqAS+44hOd9nNt7umwzyQoHqWC2MpkLPYs6WcnoGUzAsObP2+lmL
 q8vQ==
X-Gm-Message-State: AAQBX9dQVRNq5DBzUqVav4o1tgFRAdaLhyYOUzmUVolsB9pfDXjlU1Wy
 z5yWro45RMA7J3DqBAxW+sajtQ==
X-Google-Smtp-Source: AKy350bcLGk7TwdA88dxQv6mjnmK+k1+T6Ec5tJyYumt66UXAMs/BDq2jxMsFPU6KafLltTLnWCiEw==
X-Received: by 2002:a17:906:71c4:b0:8b1:7857:2331 with SMTP id
 i4-20020a17090671c400b008b178572331mr10035871ejk.65.1679863348880; 
 Sun, 26 Mar 2023 13:42:28 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6b51:4748:3f3f:ffcf])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a170906264b00b009255b14e91dsm13286144ejc.46.2023.03.26.13.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 13:42:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: display: feiyang,
 fy07024di26a30d: document port
Date: Sun, 26 Mar 2023 22:42:22 +0200
Message-Id: <20230326204224.80181-2-krzysztof.kozlowski@linaro.org>
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
binding):

  rk3399-rockpro64.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/panel/feiyang,fy07024di26a30d.yaml   | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
index 1cf84c8dd85e..92df69e80a82 100644
--- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
@@ -26,6 +26,7 @@ properties:
   dvdd-supply:
     description: 3v3 digital regulator
 
+  port: true
   reset-gpios: true
 
   backlight: true
@@ -35,6 +36,7 @@ required:
   - reg
   - avdd-supply
   - dvdd-supply
+  - port
 
 additionalProperties: false
 
@@ -53,5 +55,11 @@ examples:
             dvdd-supply = <&reg_dldo2>;
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

