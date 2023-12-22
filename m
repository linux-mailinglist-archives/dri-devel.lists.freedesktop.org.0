Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B590E81CDB3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F030010E7F8;
	Fri, 22 Dec 2023 17:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E48210E7F8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-336990fb8fbso479603f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266943; x=1703871743; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xcMMn1wo5ecoqzzFfZ/NThvc+Exg7NREzlaFXx0npiA=;
 b=f0J7evQ2s9nsAQPWsg+20cyvzNKuYz1w1j6fgt0afH1vh9Nb3hNQMYhT374XSpKkgt
 UbdaoHGmxuKnWzWHMKBDawdXN7R4+pOWuh5uCLUGY1ycR/g1B7nuo19QYNFRTZV0Ovvk
 WKNuyfD7peSwt6Iu2VYGIOJlYCyRo9f/+wweAJmrnCpTHPYZqfLri5KWAYlPy4o2oOsH
 y3TwPGm6TtE/o2Bll+rfdbdlAcxPAhE1TEE8piA5oNIB4jVZbipEKa3/OaQn9ABYoMwu
 mdlF0YGEOcKd7OUYFW4yZz/YVKIpVTw25yQEyQE6V2k62hoOtSI15svW6uqv1J0vLeQ7
 /oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266943; x=1703871743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xcMMn1wo5ecoqzzFfZ/NThvc+Exg7NREzlaFXx0npiA=;
 b=fann5j5o/68u+7aATSN9QrzIH8RPIAW1VrXJ3IbDRO/ANKBJsSvD9I83AY/545++2W
 5P7CQe8igXgnPhyGyRrlyZloQln1v1VBQhv9VNK4KWeVSuEFWI1IkAXGOLQ9iS7EOmtp
 +Km/Q4G8dqekMByVnbr13o1i9gLPOCePUT6ChHOnzM605TFNeNxNLp3YevSTV7BK5mX4
 eT9EEUYV80xNqinIdXu7DKncLBi+tEWGiJzEaeUtSjscm06KqWqTgcUX7LO/ojPXRx/C
 7Vd+iQuaGaDGF/suix4FcmBLrvxHpWNEweQBfKp/3B0BCCSAfpNEXabuy5TLPktcKm2A
 R8OQ==
X-Gm-Message-State: AOJu0YzfhwwNsNtMgm1AZwycgvZ64oyP/baxRXz6pnxWUMIcVN3Om86+
 Nl14SzGl7YbpK68kTlxVLA==
X-Google-Smtp-Source: AGHT+IH55tOdjFEvsimvQ0AWwkhlparYzELlSEvcxba6ID4XqVa/0ncC9dCVT9baJ10rAbzbikAuQg==
X-Received: by 2002:a5d:6546:0:b0:336:7794:4475 with SMTP id
 z6-20020a5d6546000000b0033677944475mr992813wrv.109.1703266943072; 
 Fri, 22 Dec 2023 09:42:23 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:22 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 01/29] dt-bindings: display: rockchip,
 inno-hdmi: Document RK3128 compatible
Date: Fri, 22 Dec 2023 18:41:52 +0100
Message-ID: <20231222174220.55249-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The integration for this SoC is different from the currently existing: It
needs it's PHY's reference clock rate to calculate the DDC bus frequency
correctly. The controller is also part of a powerdomain, so this gets added
as an mandatory property for this variant.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
changes in v2:
 - clarify that the controller itself is part of the powerdomain
 - simplify clock-names
 - made power-domains property only allowed (and required) for new variant

changes in v3:
 - collect RB

changes in v4:
 - none

 .../display/rockchip/rockchip,inno-hdmi.yaml  | 40 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
index 96889c86849a..be78dcfa1c76 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     enum:
       - rockchip,rk3036-inno-hdmi
+      - rockchip,rk3128-inno-hdmi
 
   reg:
     maxItems: 1
@@ -22,10 +23,19 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: The HDMI controller main clock
+      - description: The HDMI PHY reference clock
 
   clock-names:
-    const: pclk
+    minItems: 1
+    items:
+      - const: pclk
+      - const: ref
+
+  power-domains:
+    maxItems: 1
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -55,6 +65,32 @@ required:
   - pinctrl-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3036-inno-hdmi
+
+    then:
+      properties:
+        power-domains: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3128-inno-hdmi
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+      required:
+        - power-domains
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

