Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C953A207A5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 10:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E333B10E61F;
	Tue, 28 Jan 2025 09:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r+MsN8mW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D078510E61F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 09:47:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4361aa6e517so8713075e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 01:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738057644; x=1738662444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9RDEfAjvytCStxuDVQwfhnYFZ5MAhhy9EXCC63scEM=;
 b=r+MsN8mWJn2gswFR2g2q6TukQb+mcwB8O9RV6+MfdFsxktEdaODKRvvoSvMqbFzwfJ
 TpCUvPxJB1WXAzY2/1ifkuByL0AfDfEknsMLLwx8A/1sGwdd1XMdUz3qHB1jkbthXWQD
 MEmoVmoWiO48EbiZaPTchkG1ofnRBzTy7fZ2xfoh8H6hEZrvGJLIy0qzIbTBwzDaybp0
 koo2WyxhnlCYqvuiBVjBJFQ+E2BYtg4uXoYXLPNudxw+hm5/+gt++L82HbKO7E7i/aci
 oOOmt73bnrW6bzxvhPGbkKXHlmugRPZI1fWVhMGMrz4ajtA9aSggmQ1uxnNi9Idpfw4y
 jT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738057644; x=1738662444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u9RDEfAjvytCStxuDVQwfhnYFZ5MAhhy9EXCC63scEM=;
 b=LNbUnFPWVrCOS3IlcsJgzSTZhNTraiRMRpP6zquTMjAt3RBI598cnz06BE5NNbLBG6
 n8MQjrSvGGOTvSi0+7TfOxzcYdQim3kfdph3akbtZDbhilrmunS4Mkj4T9d2GKo8MxtG
 sbvRKKbobX6QBMmE59S1Y/oPIBxHvxieTRYuppD61S0xGUNn18Iatr8pyePCoitX5/sG
 nbM0uQ/CsERgcX/UygHKPeq++z/6Df/2NjijjfqSVYqXXsvgMBpk8+Vx2bNWHEmUvPhx
 ekBFz0wN58QKqbf7AgjrPNDT/foSaPS5IQ2I/Wk48oCKVQSy/+MwW7in1bNEaAigVHGo
 F98Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEVaV7ICH4BvxDD80AcLQvBDelU6xxwqY6HpggfklkgblP57aPR/9cvm5UkJT3ebqxgJNy35V+BxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTYF+DBb0+oOOXqAqTqUvWst/9n8nKIrzmfZaV9B3cfwO1IJpo
 TVjGXr9l1aaiuRebD6p0EuYi2sFhCJm1WFPHJtkATNEL4mwEQxuKNrO2erCTk5o=
X-Gm-Gg: ASbGncslhw6jEy/5yMNrM8bM8MifgSjoA06Th3OW5GmB9vhGy0fH+/+CwOGCHo95dVT
 rUWflWAaVsNKxK7kauufmuCFkvaNWeCpwi89mDcArwdB8QH3usod7ep0JjGWEAdcmQWuV26mV3N
 LzxY0gfDUSXeI5yfORbSP/J0Qv5UK0LKGhUaxdAzBomvz1OH8/1tTXBQz06IpJlqfBRdLBDJ3Mi
 85j/gAop7YRARNxDLsoUQlfQhyxNQiFOzFCMlPYWujKwR13SXIhvI1vdvylckFpS31GBew0t66K
 ndjt8qoCMwHFe2eykU00Pl3TYYPH
X-Google-Smtp-Source: AGHT+IGwnsZz41AB4AUv6kdCnTehqV69TD9WVf518U+GkQ/0HAHCLnXtGv4xpdScQIry/Deix8IjOw==
X-Received: by 2002:a7b:cb41:0:b0:438:a240:c62 with SMTP id
 5b1f17b1804b1-438a2400e02mr131580915e9.8.1738057644322; 
 Tue, 28 Jan 2025 01:47:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd50233dsm159711095e9.15.2025.01.28.01.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 01:47:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/2] dt-bindings: display: renesas,
 du: add top-level constraints
Date: Tue, 28 Jan 2025 10:47:19 +0100
Message-ID: <20250128094719.63776-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128094719.63776-1-krzysztof.kozlowski@linaro.org>
References: <20250128094719.63776-1-krzysztof.kozlowski@linaro.org>
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

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clocks, clock-names, interrupts, resets, reset-names, renesas,cmms
and renesas,vsps.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add tags
2. Rebase
---
 .../bindings/display/renesas,du.yaml          | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 88ecabc4348d..c27dfea7fc62 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -47,12 +47,26 @@ properties:
     maxItems: 1
 
   # See compatible-specific constraints below.
-  clocks: true
-  clock-names: true
+  clocks:
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+
   interrupts:
+    minItems: 1
+    maxItems: 4
     description: Interrupt specifiers, one per DU channel
-  resets: true
-  reset-names: true
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
 
   power-domains:
     maxItems: 1
@@ -74,7 +88,7 @@ properties:
 
   renesas,cmms:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    minItems: 1
+    minItems: 2
     maxItems: 4
     items:
       maxItems: 1
-- 
2.43.0

