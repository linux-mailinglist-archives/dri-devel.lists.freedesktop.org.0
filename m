Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38AE770639
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 18:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A073C10E73A;
	Fri,  4 Aug 2023 16:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0997610E73A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 16:45:14 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-57026f4bccaso24445867b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691167513; x=1691772313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XZtH2kloa6QLDzCHyNDaNCnwyfiQCQAHnn2Es3d2qE4=;
 b=Fqtm7RUL/LlO5i2G8bayyJG5clPUcpemhU0uXK9YSzX6f2/5j4QjybpOJh0c37qar8
 hPN5mNULhzwhW3IVcrGJU65uaV4isWGciHdbZzMjLa/AcrRDyLrFvF54CRwKLfUMehdo
 +T5a7ZiU+XCAn3O2AR6a64SyjHoIh8qd1aFQIhDq3wmVfhZZVI54j7Wqo6SO5hWSgHV9
 XDbfCv91tB+ynGglXgarI4HUh1sGzhBTb4hC8B6RklZTpj0ZzFsoR8DaxRIozt9Xj30k
 odmOFlurXJrjpxNkKv2dB/ovF/Kqy3NJGUWBIvFbWwouhLzOXalqO/H5rPZ9mxS5n7il
 gk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691167513; x=1691772313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZtH2kloa6QLDzCHyNDaNCnwyfiQCQAHnn2Es3d2qE4=;
 b=PZV7eDlh0CXG4zM2Rh/M+/vVAA2ocFuBN59b4Vbc6sOzNu6CcxAZsOTfn84SsVWFFe
 y56Y++CFvM1hoCOVW84niT3nNizxhSbcWQhDXEG1HaVChpzY4DkUbibQklUJ4ntaPzMK
 PkcBHyG7qb+/VhG8sv00q1g7jCCG88ElLga1ClICfzC/7Vz5zbA7FZpr4FikYSqLSShP
 kKONELlfhe9ld6hoQh+mxttaE6/th2+SGTXRZQR+TXHBcdGbJLtdWwLGpnIsG8/0Ncel
 t+IWzJyW6KTngMcsjhGVNAOKS4rIP6U0f7mBxca99CUtgWaqHBHWf21IFRFmEmn1+WXO
 Hd2g==
X-Gm-Message-State: AOJu0YzqqJj1ZYdjZqONObqjrviH/YJ2SGW7Og6qKaZQgnr7CkoTmajk
 XZFaqyV/6Dpa/9puNpqiEPD2yDWcLs8=
X-Google-Smtp-Source: AGHT+IEqpDsYuMfSaI3R4E5uhLP79V7LLfP1Lir+pGyO5HSv1afCGj9DTHJJC6o+NmWc+KfkWvMypQ==
X-Received: by 2002:a81:a18d:0:b0:586:cf7:2207 with SMTP id
 y135-20020a81a18d000000b005860cf72207mr2296911ywg.14.1691167513019; 
 Fri, 04 Aug 2023 09:45:13 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 j63-20020a816e42000000b00582fae92aa7sm825248ywc.93.2023.08.04.09.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 09:45:12 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: newvision,
 nv3051d: Add Anbernic 351V Support
Date: Fri,  4 Aug 2023 11:45:02 -0500
Message-Id: <20230804164503.135169-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804164503.135169-1-macroalpha82@gmail.com>
References: <20230804164503.135169-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Document the Anbernic RG351V panel, which appears to be identical to
the panel used in their 353 series except for in inclusion of an
additional DSI format flag.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/panel/newvision,nv3051d.yaml       | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
index 116c1b6030a2..1226db3613e6 100644
--- a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -8,8 +8,8 @@ title: NewVision NV3051D based LCD panel
 
 description: |
   The NewVision NV3051D is a driver chip used to drive DSI panels. For now,
-  this driver only supports the 640x480 panels found in the Anbernic RG353
-  based devices.
+  this driver only supports the 640x480 panels found in the Anbernic RG351
+  and 353 based devices.
 
 maintainers:
   - Chris Morgan <macromorgan@hotmail.com>
@@ -19,11 +19,15 @@ allOf:
 
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

