Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26194621AB0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D4C10E4D5;
	Tue,  8 Nov 2022 17:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5471B10E4D5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:31:36 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id k22so14420230pfd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 09:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RrXg9IuNsuwKt/X/O3Io2Z6HaHHOsDQ/lXq1npKJCE=;
 b=wabhf3rRvveDvsQRQMsvYrADhvfdZX9wH11+cSYzn6KOv8RT3OBg6jbanOZlFsemFp
 0+q/tFIMSTBs66l98EjiozWmni8cVDg3iIihLmaSXBkGQzEVHATxFvWozUawEOABRLNV
 Q/rt1/QX8AdmzmneNZlxAq+kGT0SN6wqDoM81Ok7zTvwUIEWJHYp+rUXORhFCnj7AAOl
 lAuUqVfpsS6WzLKZHhoXVIgs2/Zy2uILSi8cyw+RLrfHt8wpFnqDdKhqC9Wg0lQziujl
 Oj0ZPkhG8lPd4Naf8Yi2wb/v5TpXWnNk9TNrYcu4Vra44qDKiBAkZ8VQg1mudwXLFzIH
 Em8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4RrXg9IuNsuwKt/X/O3Io2Z6HaHHOsDQ/lXq1npKJCE=;
 b=aSPMlMi9wM7pU/+DeMFBZLOO4iJ5J5powSOHfI4B78sOtcbyIxmHXmZtr7PqDB+X6b
 xYu45mRp9bJ/mu6lZqtizfNuHozHx6m5ostT7FOMbNKBx+yfs3sK8avd+Zu4+qmIRu0Q
 jMRozy7Qv/hoXbg7MOHcyr6AaWNHyXYSmw+WVTFMRwt1WPqQmOcVLlowAWVwIJXjBxxa
 KzIZONgn8zvHEjWJlaLdbMxyI5pGDPDn/yrsOV2tp0GoVathWaggMv0cY+sfWeurJAvS
 t6MuaOiPA6Rl0nTE2ygU5M3GaF4RkScWEZR4zWeH/VlmLa/Hpvi61QuK/860gKLuS8HD
 AN1g==
X-Gm-Message-State: ACrzQf3EucmyxU7O/vePq15yIMT4awCqxoqrEe4YUVGkJQj8R//lWlnA
 cVIKhkPBGmVOCLyZX2qky0Ut4Q==
X-Google-Smtp-Source: AMsMyM53repo2Tbl8y4m3P4jbvP5c5dh+RsRfIWxrARxXqfiTP6PIqRzouI1pEzVJZmwcTAyhJUcsA==
X-Received: by 2002:a63:5761:0:b0:46e:b96b:e76 with SMTP id
 h33-20020a635761000000b0046eb96b0e76mr49714664pgm.534.1667928695856; 
 Tue, 08 Nov 2022 09:31:35 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c2c:74c3:d3ed:4dfa])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a63df43000000b0046fd180640asm6018517pgj.24.2022.11.08.09.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 09:31:35 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 2/4] dt-bindings: vendor-prefixes: Document Jadard
Date: Tue,  8 Nov 2022 23:01:18 +0530
Message-Id: <20221108173120.618312-2-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221108173120.618312-1-jagan@edgeble.ai>
References: <20221108173120.618312-1-jagan@edgeble.ai>
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
Changes for v4, v3, v2:
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

