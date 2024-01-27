Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8698A83EDF9
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 16:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1848010F1F4;
	Sat, 27 Jan 2024 15:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B105C10F1F4
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 15:29:33 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a277339dcf4so129603366b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 07:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706369308; x=1706974108;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=haBaXjP3IuqWi4Vh3TynqcBtGi5D9/RbAjyH8MaxFEk=;
 b=HLkByE1b4GCtdjl0olNHFe7krVdMsQ/JSu2OIzT9BGMzsDEdI3ndehostkKmWPevGs
 gJAjfoPTVkSsm8M7INm12kQHQGK1ID7nMEazsmP0JGgam+tNG78xHV4+/r+c48ihu2bH
 nKWwgx+C7Ng34frflhYhWK7/3TOiy5gixuY3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706369308; x=1706974108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=haBaXjP3IuqWi4Vh3TynqcBtGi5D9/RbAjyH8MaxFEk=;
 b=Agwq7QNcS4SZz0V0WeYnsVGo4z1oYF4Rt4VR2T8T40MYuPZ4o9ofDIpDhirwHO/+70
 n61VTmaAz8YFXs21no8y4K3AlExUniEf3cboNKj+oewMnI3u97baCrhMPqTcGMgaqlpr
 q/65hQGl86fER4FmJ8fbOv4o4iAOBvOOQpckoKyLTLiiB9TY4/cpnonweQSUID6BQUFc
 W+Xkrwb0dCvDJc5Z82F1Z+OqEs5G3yy1FZxg7kr84gXt31SP+UcgAbu7OCcC1gp7Bg8J
 Ykv8XqLk9qBPSldlfRTFqfoqPKzEZIY3RaQ0Xu/1AhFz9v4NN7YE1KqNT22XKfNVf/TC
 9rHA==
X-Gm-Message-State: AOJu0YzYith031SSFDvA58SAKPZeNrhA7Nh29MqlZ55KZqa1tlV8Dx83
 RVsSrFoV/9Bb+HTIkvJwls58iJaACD4HR3aY7HikDmh4RtiJxGr0JNQYIuoBo8I=
X-Google-Smtp-Source: AGHT+IErhFoxSEE+bInbELtSYR5kkaNSeW62dXAyFHtebD7TQBYzbADVG8K8/cyVC3nEdk8weBw+vw==
X-Received: by 2002:a17:906:6953:b0:a34:af8a:ee3d with SMTP id
 c19-20020a170906695300b00a34af8aee3dmr1160137ejs.16.1706369308266; 
 Sat, 27 Jan 2024 07:28:28 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-21-103-141.retail.telecomitalia.it. [79.21.103.141])
 by smtp.gmail.com with ESMTPSA id
 vs3-20020a170907a58300b00a3550c56127sm509361ejc.9.2024.01.27.07.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jan 2024 07:28:27 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [drm-drm-misc:drm-misc-next] dt-bindings: nt35510: document 'port'
 property
Date: Sat, 27 Jan 2024 16:28:08 +0100
Message-ID: <20240127152821.65744-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow 'port' property (coming from panel-common.yaml) to be used in DTS:

  st/stm32f769-disco-mb1166-reva09.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

 .../display/panel/novatek,nt35510.yaml        | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
index a4afaff483b7..72913719df23 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -31,6 +31,22 @@ properties:
   vddi-supply:
     description: regulator that supplies the vddi voltage
   backlight: true
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - frida,frd400b25025
+then:
+  required:
+    - port
+
+else:
+  properties:
+    port: false
 
 required:
   - compatible
@@ -54,5 +70,23 @@ examples:
             backlight = <&gpio_bl>;
         };
     };
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "frida,frd400b25025", "novatek,nt35510";
+            vddi-supply = <&vcc_3v3>;
+            vdd-supply = <&vcc_3v3>;
+            reg = <0>; /* dsi virtual channel (0..3) */
+            reset-gpios = <&gpioj 15 GPIO_ACTIVE_LOW>;
 
+            port {
+                dsi_panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
 ...
-- 
2.43.0

