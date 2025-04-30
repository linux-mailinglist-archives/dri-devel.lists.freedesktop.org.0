Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D2BAA55C1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 22:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB9510E80F;
	Wed, 30 Apr 2025 20:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gzrpfo2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C1610E32F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 20:41:22 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so186430f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746045680; x=1746650480; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=On2oKS4KpMiFNX9GGJWebr5I28XVUIr+D5gExlaa1s4=;
 b=gzrpfo2TqNrWN015mY8zwBlb2jAPVZM4zQzP8XiBrabjmHLQ7mVhx71ybM5DHwS5s8
 UHhH7xfGEDMaUlQbeZ0SQQrlSraAdPQzq6lN042dB4kyfD7Jv0ADaCGDE3gB6dfuaVrO
 yBmHVB8UyWz1Wa9aCXpMwBJDBLiWbWgU+kdoS2qAnaKCByBiZuWKhqVPaYvhxo+Wo5HH
 HuiCFJDS8KlTLfSUAydbxnPDxwRjw5tMOV5eC6JXW0uupU3zFYMDoW1zY6DJQJjLV1pS
 Ro2xafc25x1f874hDP2Fa+haG62CxjbS0/WYqERDelUeLDKOruzqqL+Cj28j463Zw4a4
 N5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746045680; x=1746650480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=On2oKS4KpMiFNX9GGJWebr5I28XVUIr+D5gExlaa1s4=;
 b=Y1l796AvXWALjpvTr8D7KJ9/Pr7msVE9dz1ki5UYth/NCgNTp3Y5ok84eXBWi2tHIL
 ICu9or7UFR1GIqs7Qeb0G5GuoYIMKVW7OB/FNf06ot9X3CxjjlgHHJdzhd/908ag/ta8
 W6CZ7fFJLELKItwukatPzEdMoNA4DWDnuB+moW/QvtvHH7RCsoqKxrRpgcvTIJkc5rrC
 zRBayFIZr+eIqH/Faj9w5rIqKICumhbVmWaGePzkQXv8+iFz+yUCwuEnNrkFHx514s5S
 Jj6D0V0Vyguosgz3KWxMfk2T992ShnUbG3qGc0MpGfd0ofzxICPziXnUdhYZney7+gR2
 KEDA==
X-Gm-Message-State: AOJu0YxnK0lp6EGbV+yO9TXrnHwvZoauh9w89RBgNttwuKVt181j/eFQ
 Y15iCFyL1OblYNHrAtkNAIZIgxeGXEDpCEnFKra59SCLlmVW7j7H
X-Gm-Gg: ASbGncvqhwvdPbHgoVjk9h7+WdgASVQxJ9ZKArgwEUm/VUhudM+hS5vF2l6nTqUoS+V
 66KY/av3ixmScS/qS2o3shNmOhPWT7vee/qiuIaJafQf9YX06tXsPNbe3UEKbScYfWnsCdWJbu/
 aUPWRm8fIa7uq0Mmon4ZUZvr8AtbWXVe3eHZHhAkII+OlZ5CdTga8glaNF+nKggooyCfFy8S7Fu
 HD8YuId19dxKH7CN7yilg957eusDQD2fc7tYreudy9fhZQZ+h6OVQFnPHOsB9Wx4voXwKT//jXT
 yFLC7fcZbe7+aj2aJ+6r88yFkkndRngrSBJUOA/Q9NJhPqT7pQFTQvyBNVUEMtgZyUvajgNbdy0
 =
X-Google-Smtp-Source: AGHT+IF1Ipl/5U6SwjsJg0vzNSDQtkdpF5VTD0kmaDcq3x0fBQp4qrl2QURIQ/+alWMxNKSu0iBmGg==
X-Received: by 2002:a05:6000:2284:b0:3a0:8c68:19b7 with SMTP id
 ffacd0b85a97d-3a08f7985d0mr4459303f8f.3.1746045680588; 
 Wed, 30 Apr 2025 13:41:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 13:41:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 03/15] dt-bindings: display: renesas,
 rzg2l-du: Add support for RZ/V2H(P) SoC
Date: Wed, 30 Apr 2025 21:41:00 +0100
Message-ID: <20250430204112.342123-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The DU block on the RZ/V2H(P) SoC is identical to the one found on the
RZ/G2L SoC. However, it only supports the DSI interface, whereas the
RZ/G2L supports both DSI and DPI interfaces.

Due to this difference, a SoC-specific compatible string
'renesas,r9a09g057-du' is added for the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 95e3d5e74b87..1e32d14b6edb 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g057-du # RZ/V2H(P)
       - items:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
@@ -101,7 +102,12 @@ allOf:
 
           required:
             - port@0
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g044-du
+    then:
       properties:
         ports:
           properties:
@@ -113,6 +119,21 @@ allOf:
           required:
             - port@0
             - port@1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-du
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1: false
+
+          required:
+            - port@0
 
 examples:
   # RZ/G2L DU
-- 
2.49.0

