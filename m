Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1061617EFC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 15:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCB010E5F3;
	Thu,  3 Nov 2022 14:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A7010E5F3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 14:12:31 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so1919693pjk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 07:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdt04ihQSLPyg0J7dIXv8UYh4qRz2CxhQoeRgaiLIUk=;
 b=cw6vZZUFI+ScskUU+vZyP8M611AeQADU9y6aEprHt72Os5RKpZlnMgILQ+UwB/8X2u
 SqYdRKtWQ0wPE/MpPd+fQAcJEsIQow4bhfqjuSfhEO5qthV92boPjSB3N+N9LGY2m50K
 IC8/ExkzrxyO/g4I2CqN1OWQlUb+MUUjpDl3ngdNTDOIcNkpC7tIe4/ovjhpQF37Osad
 FJrIC8s/LRFv3WKJ/SU25fmg6ozKUe+3+Xzx8rTTRcuy+Ux8aSHP9NsP8RJ65w7i0qOi
 ZFsf44uNifjXYtirpxJfscg8gV7lHAXSfPaV3/PuOY31SImHpfa91MJlZ209X1wa+yHe
 A/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdt04ihQSLPyg0J7dIXv8UYh4qRz2CxhQoeRgaiLIUk=;
 b=QN9VifqfZGCOfdBOB+InuEh3Xc/gAUQJ+RVeYw4GS0sTn01sxqrjt631LF0JYrbM4C
 7HGRbWYVsMW8nU2PB8GvrhoYMfZFNkoyTd8/RZDrfI/MJnJYV/HugAaPczNsVCNUFBPi
 /7czIZemYWNamo52a1a5va0nkoqS3fPJ3+XJw/0s0NYA0Ys6/3gZ+FrO7+7cbLyJXvNU
 La1B7h9odbfJy5i1R9XKo58q8qA91PosktqZ5egVuKjBhZGXqYVYKLA4pZgFDW8SrOkb
 Zab8R3UcJnluRgOApHLdUqW5UDYiPMaIIvnrgCUtzDZBRW93gRI4p5t8LDmtifiKQayB
 mcbA==
X-Gm-Message-State: ACrzQf36uV1WbOxYjbKZxmyOeWVRiRs9GzlVUK1J+/5pF1KzKBDh0TmN
 /9qqvADMm9prUlCpZYcfk3dfIg==
X-Google-Smtp-Source: AMsMyM4OpZ9SkKqi5u2R7ycpcXbnc8n0+0z2kjfl4qDFC34Q5dQ/8QwUL4Nzklstv82O61KkMVsYHQ==
X-Received: by 2002:a17:902:784b:b0:187:2296:2a35 with SMTP id
 e11-20020a170902784b00b0018722962a35mr21029732pln.103.1667484750705; 
 Thu, 03 Nov 2022 07:12:30 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a809:3a79:b5a5:9718:3f91])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a170902934400b001780a528540sm725808plp.93.2022.11.03.07.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:12:30 -0700 (PDT)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 2/4] dt-bindings: vendor-prefixes: Document Jadard
Date: Thu,  3 Nov 2022 19:41:53 +0530
Message-Id: <20221103141155.1105961-2-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103141155.1105961-1-jagan@edgeble.ai>
References: <20221103141155.1105961-1-jagan@edgeble.ai>
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

Jadard Technology Inc. manufactures and distributes chips
from Shenzhen.

Add vendor prefix for it.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes for v3, v2:
- none

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 08264594a99f..c601f5438b02 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -645,6 +645,8 @@ patternProperties:
     description: ITian Corporation
   "^iwave,.*":
     description: iWave Systems Technologies Pvt. Ltd.
+  "^jadard,.*":
+    description: Jadard Technology Inc.
   "^jdi,.*":
     description: Japan Display Inc.
   "^jedec,.*":
-- 
2.25.1

