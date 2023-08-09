Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC6777641D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 17:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0768310E450;
	Wed,  9 Aug 2023 15:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF9A10E450
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 15:39:48 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-583f65806f8so264887b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691595587; x=1692200387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iwOzHfqAzmYTY+7Vlxn3fLDfMJgjpkQd/BObI7qJc1k=;
 b=o/sJJmdeOlNo2UR/tdgD9cd/8YYqCLu1053cG2W7LnguU89RJFFAThfBECNOApB3N8
 yotLuH2DD19T8tZA4SDi+ZTYkZt4uFWF5UYi0j8lXHEbfwXd5bQWMzzjPjXOvvTR/Rj5
 eKjmyp9UALRpXlrnKfxUnlMzZRqbkCX4H+om8gsuZCULdlqLHZqITnYttVHUypK1SdUL
 VYk4wbtwpVeL1HhMoYJJtyzeXhlWIwRCUCmrQ6I7sLUYfxvPxWuyE4kPJb2pTAMNWqgK
 NSmWM/4F4QQka2eDuw+dLgzKw3YCjF3cYf5Wu/1ER2gA1YegC1LXYEoz/9OcCZZo/G60
 Qqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691595587; x=1692200387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iwOzHfqAzmYTY+7Vlxn3fLDfMJgjpkQd/BObI7qJc1k=;
 b=fvGjJ1NApaj7Qu0fXlA2dGN15MNns8LPy1FaKP4Z0XgibIgmNb86ICe2z4io/A6TYN
 MZkV9MT67DmZgviz6YheZb7j0rxBvf+l1Si3dsRK5OvVmQYFmot3KB/ZhJplcK+CM5ub
 tXUAGfC1y542SeEX4S2DZVfKwSRL39wDoZWb0y2eB3mFVB90IIIP/jx+u0j6ekQkAX27
 Q7fIPQAC3ldSGNQ/LHvlZvS3v38y4niZk18TxZbTqVqpFgxEEd6pKGjypzy2/IbN5ZLP
 01G/foHr/a7Dmi51S7JQYfxdJwdmSyhJQ7tCBrwRaYhf8vVy/GAs2EAv+4P4VuhzKTKa
 HGzQ==
X-Gm-Message-State: AOJu0YxpyCdvFAfsecGf+LfJMURFei9t05TpcJnf1F1UoXiAt/Jqo4uB
 es7gRLA+wnx7s05lsOeP9MY=
X-Google-Smtp-Source: AGHT+IHUEiZoN3ojpU4inG9BJCqG+Svqp0pn+33BbOb7wYoFcNdt2/lAZJyDKOIO032V1jbbIoAKMQ==
X-Received: by 2002:a81:4744:0:b0:586:c27c:3eee with SMTP id
 u65-20020a814744000000b00586c27c3eeemr3081651ywa.38.1691595587525; 
 Wed, 09 Aug 2023 08:39:47 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a81a50f000000b005707fb5110bsm4043969ywg.58.2023.08.09.08.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 08:39:47 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH V2 1/2] dt-bindings: display: newvision,
 nv3051d: Add Anbernic 351V Support
Date: Wed,  9 Aug 2023 10:39:40 -0500
Message-Id: <20230809153941.1172-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809153941.1172-1-macroalpha82@gmail.com>
References: <20230809153941.1172-1-macroalpha82@gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Document the Anbernic RG351V panel, which appears to be identical to
the panel used in their 353 series except for in inclusion of an
additional DSI format flag.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/panel/newvision,nv3051d.yaml       | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
index 116c1b6030a2..576f3640cb33 100644
--- a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -7,9 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NewVision NV3051D based LCD panel
 
 description: |
-  The NewVision NV3051D is a driver chip used to drive DSI panels. For now,
-  this driver only supports the 640x480 panels found in the Anbernic RG353
-  based devices.
+  The NewVision NV3051D is a driver chip used to drive DSI panels.
 
 maintainers:
   - Chris Morgan <macromorgan@hotmail.com>
@@ -19,11 +17,15 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - anbernic,rg353p-panel
-          - anbernic,rg353v-panel
-      - const: newvision,nv3051d
+    oneOf:
+      - items:
+          - enum:
+              - anbernic,rg353p-panel
+              - anbernic,rg353v-panel
+          - const: newvision,nv3051d
+
+      - items:
+          - const: anbernic,rg351v-panel
 
   reg: true
   backlight: true
-- 
2.34.1

