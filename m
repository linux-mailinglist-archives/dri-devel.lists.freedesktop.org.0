Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A253B617EF7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 15:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42CA10E5F2;
	Thu,  3 Nov 2022 14:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B73810E5F2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 14:12:21 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d10so1711015pfh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i+DkswWCfqje3A7Pi2nFIDFwXranpEUi3ZDxbiO4ucI=;
 b=XCLQYGSGscJ/vbuh8hjpoXQl6AWaK0k5L4YKeiU2qyizap5IGhMpnMRbCfNw88IR84
 K20awpNDqQBgFPJSekcXkFYee6BjjUHIH28siNpAIqad0ZAAhQEzh+3MdWw2P1zPQmrt
 nf9bHv/PEMNSswSxp7Dx/eVYUSwJ78ki0bcJwXF0O9vRBsq9TfSSfl57BnvDHkTKU9zA
 2IgIXaTNA0eY40bmAB/QsXz//BUhXH7MD3xU45l5wDvJUuMFq1bDeJyTT+Ynz+S+h/5E
 6CermzzTrvGEzrV6xxWMHczVLhkh+mbjuci42ibeI6mBoKyQZDL7M2hC3LMdF3Tv+QcA
 g84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i+DkswWCfqje3A7Pi2nFIDFwXranpEUi3ZDxbiO4ucI=;
 b=srT3RStDLActQSksYlfT3UZebqGfKVDEsRqOCloxycPNcfmROdSKeUiDggQZ3Crc9p
 rNMigOe5bPpohvTbgl6QP4N1vR0AGr0l804WZMNzdED3VaGodEmFw37T5GMojWbo5Nwe
 IQRcT/LUw4kkuSd9XmYtdwD1YPwLazKdzrhvcjvme1bv1KV3OHEwDGvcsjXp+wcVpuUH
 cO6wsS+UU0iY9MzsfSlKTJrk97zqsvGK2ZZWyaBlRg78iZLx0YXfjyTWg4TFLgvFy6q1
 VzPYypB5NW/kLZlAlvedDXXDhfBFnIu3HIl4RFEuy/Cv7eiXCyPIbaM30ic+52lFmKZq
 O4PA==
X-Gm-Message-State: ACrzQf2S4i8IeYeglm5jqVVQ+MXGRWN4HoJUj/mUMWfNY1kzEHPYjGWM
 Mnsu81d66QQ7rAv/TIS6TP9p7g==
X-Google-Smtp-Source: AMsMyM5Glyn5i8I0lPKA/bbpRf5Q7b+BKnqzX3RCQvrWeT2NLiO+osrL04mE9WOe/+Whj/mpMBkTZw==
X-Received: by 2002:a63:5243:0:b0:43c:96a:8528 with SMTP id
 s3-20020a635243000000b0043c096a8528mr25827682pgl.47.1667484741002; 
 Thu, 03 Nov 2022 07:12:21 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a809:3a79:b5a5:9718:3f91])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a170902934400b001780a528540sm725808plp.93.2022.11.03.07.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:12:20 -0700 (PDT)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Document Chongzhou
Date: Thu,  3 Nov 2022 19:41:52 +0530
Message-Id: <20221103141155.1105961-1-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chongzhou is a professional is a manufacturer of LCD panels
from Shenzhen.

Add vendor prefix for it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v3, v2:
- none

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index eae3bc8a4484..08264594a99f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -246,6 +246,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chongzhou,.*":
+    description: Shenzhen Chongzhou Electronic Technology Co., Ltd
   "^chrontel,.*":
     description: Chrontel, Inc.
   "^chrp,.*":
-- 
2.25.1

