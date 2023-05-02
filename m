Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B7F6F4337
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 14:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AA610E227;
	Tue,  2 May 2023 12:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6577010E227
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 12:00:59 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-94ed7e49541so610147866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 05:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683028857; x=1685620857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+WYS2uNNoOkm3orqvZxxy/U4Nr8xICG5Dwp3aoTlmM4=;
 b=KrNvgqnlCJ62jTv5QKIFn8l1MPz6NrKoUB/fs6ZiByAZQRfT32HlFohiu4KLlAKKv9
 kLbaauMkSbT16Z6VAl1JcxnOE1qoMmLssiN+TlUwhoPWdLeVCdEVtWHaeUTklz1sr8Hy
 FJjnyNlSUMs921zOgeC1Xf8RA6pCLNiYTAvj85ZV4Icmq2tHIgkDIj17EsDgmnt6484+
 o5xo9O+atBqVzX14QE/WT32YhMBTEt+oFygM7LFwoy28EU+DU9dqXQm9clbOD7S3boUi
 CsGfQ/xWDWdD3c/zo9kKqCsbOMV29Fh0qbFzDFKUv8VWsx6FN3IHSSLwabUYPSxQXyAV
 qnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683028857; x=1685620857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+WYS2uNNoOkm3orqvZxxy/U4Nr8xICG5Dwp3aoTlmM4=;
 b=LVaeCUvljc77QMrBN7E4G0JzOElgnA9ItiSr+eO1JLrHrGgZrS4lNszDK9rJDu3BcP
 SUiuBPyOStxzdFEqXtl7HPd3nrjEaq3GNl+FC3L3GyaUmAtQ9B2kgJo9hcJN2u7Mi94r
 K6qSLm4vPGjGPXXZQrpIzBYhOCmxpKr9NiD6I+rnZGDuslFvrwoCRnyjmsAA/TfTyCB5
 3k4j+75LkLiiXGApGM1gEB9yoV4DE5FSqQgIQEDV0LzfqswDmB5//0pXji2LWDh2V90b
 PV6JtxK+LcV/HErsU566aIRegKS444v4h33Wavs5G1ax/vBq9060j3MfayaftzDIRy2G
 0OrA==
X-Gm-Message-State: AC+VfDw4Dv20KcqWv7+EiF0iD8MAuk9TzktS7FdlzJuFM5vJ7VPjS6nQ
 0dsyAz6TBNX/5c/qvfJMBjmc/w==
X-Google-Smtp-Source: ACHHUZ7UP4zneqUqBTSrVE1dz3gYWQRhrswBtXkRlQD/zyv1FGBW6b28N3mfaqsf3b5HIL1999Ir6g==
X-Received: by 2002:a17:907:6e89:b0:94a:62e7:70e1 with SMTP id
 sh9-20020a1709076e8900b0094a62e770e1mr15086566ejc.68.1683028857540; 
 Tue, 02 May 2023 05:00:57 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a1709063bca00b0094ee3e4c934sm16063403ejf.221.2023.05.02.05.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:00:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: display: novatek,nt36523: define ports
Date: Tue,  2 May 2023 14:00:36 +0200
Message-Id: <20230502120036.47165-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502120036.47165-1-krzysztof.kozlowski@linaro.org>
References: <20230502120036.47165-1-krzysztof.kozlowski@linaro.org>
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

The panel-common schema does not define what "ports" property is, so
bring the definition to enforce the type.  All panels described by
binding are dual-link, thus require both ports.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Rework to add ports to device schema, not to panel-common.
https://lore.kernel.org/all/20230420160905.GA2952736-robh@kernel.org/
---
 .../bindings/display/panel/novatek,nt36523.yaml           | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
index 0039561ef04c..a2a8c4e39573 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
@@ -32,8 +32,14 @@ properties:
   vddio-supply:
     description: regulator that supplies the I/O voltage
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    required:
+      - port@0
+      - port@1
+
   reg: true
-  ports: true
   backlight: true
 
 required:
-- 
2.34.1

