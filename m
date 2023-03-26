Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5936C97D1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 22:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391AE10E262;
	Sun, 26 Mar 2023 20:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4FA10E237
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 20:42:31 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id er18so16708765edb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 13:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679863349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A+pxacFz13bsHOBsFxJX8/Qwx9xhoEQC7gMc+L9m6/I=;
 b=eZSrbaXgBHICG39/4wcDpoDcr8baPcRVwzg5FoG+euX0Gohz1uroRPCyF8/2ao8u5E
 2hwjEXdBT9Ebmyl6W7N6jB+fFj8WsSiZPnLeQFJEMyZRy52jDVqPUzyTxK/cQ8KTbomm
 a92cn1mobn0es1Mxm8SRs6qY8YaACJMjj94l2FV6XPEiJFNIxT7tdyonv56ZzO8Z04R1
 AmfemiMPsKDFENPAP3kR2+TKQuQASXciZg0sQJd/dZ+bGJkDWNKN0cuVUFQ+4v5csQp4
 nHJYDQmajljkyKJGdXL+qwsVJ8yFk7KubHYAVFG0rarRZmeW9IPe8boplrJKyWM2PknQ
 0IOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679863349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A+pxacFz13bsHOBsFxJX8/Qwx9xhoEQC7gMc+L9m6/I=;
 b=hW7uqB1eULtGjjeyQWEJHTEoe5liSv0GuegjsB0vYktYPqxT2T7SKXeFWh10pN9EC9
 f+KQcttl+h5fsqZOyUWxiHuNw1QSlk2tVFkBg4R3/BbqLBa+5tA3+NHQlMxUKPh2cjgv
 TAh3vc7q4x1NXcxsLcsWroNAnm7w8TQfP/qiAGVTmsRw80j6HQlAXOcGwGHB6W+IAQaU
 KgvRYlAIilen+JjSngOBMZngpwiR4zmrvSkJmVObdzvMpSwdc8BhYK7FkiFudjD98cZZ
 d9s6lBD7CbVhcepo7XZuQOL0lqm1o/iZZtTF2g7yOlFvlKqYQp0pYYVMbHdu/kA4kayo
 cqEA==
X-Gm-Message-State: AAQBX9f0sqYPmtP0TAi3dpkxchFz94rv1owGIn5qqtCcpqoYCfrAIxZW
 7alrGhwVATZjSR8rS/D63IRU2A==
X-Google-Smtp-Source: AKy350aV5GBIBhEVsNXkK5hJNQO8z9gH+wV2mBzEG1ThZvIdFFLVt/W2ufYh5KdKOFklvwSoLmEA5Q==
X-Received: by 2002:a17:907:8a08:b0:944:44d:c736 with SMTP id
 sc8-20020a1709078a0800b00944044dc736mr3868077ejc.64.1679863349831; 
 Sun, 26 Mar 2023 13:42:29 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6b51:4748:3f3f:ffcf])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a170906264b00b009255b14e91dsm13286144ejc.46.2023.03.26.13.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 13:42:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: display: elida,
 kd35t133: document port and rotation
Date: Sun, 26 Mar 2023 22:42:23 +0200
Message-Id: <20230326204224.80181-3-krzysztof.kozlowski@linaro.org>
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

  rk3326-odroid-go2.dtb: panel@0: 'port', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/panel/elida,kd35t133.yaml           | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
index 7adb83e2e8d9..265ab6d30572 100644
--- a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
+++ b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
@@ -17,7 +17,9 @@ properties:
     const: elida,kd35t133
   reg: true
   backlight: true
+  port: true
   reset-gpios: true
+  rotation: true
   iovcc-supply:
     description: regulator that supplies the iovcc voltage
   vdd-supply:
@@ -27,6 +29,7 @@ required:
   - compatible
   - reg
   - backlight
+  - port
   - iovcc-supply
   - vdd-supply
 
@@ -43,6 +46,12 @@ examples:
             backlight = <&backlight>;
             iovcc-supply = <&vcc_1v8>;
             vdd-supply = <&vcc3v3_lcd>;
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

