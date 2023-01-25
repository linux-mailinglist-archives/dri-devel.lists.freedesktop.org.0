Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4A67BFB4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 23:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BAA10E244;
	Wed, 25 Jan 2023 22:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5367E10E1D5;
 Wed, 25 Jan 2023 22:14:02 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id d188so17625480oia.3;
 Wed, 25 Jan 2023 14:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dJ9z57UwZG4tTNorqhSO8lGfimRHzs0UtM70Y/wGFLA=;
 b=qeBDHsppAhK146pfKU5zVP88MaLx9JyO5znGAERRuAU96GXvrUp4WSGvbgSfLwIPaN
 87yP/yx/Wt3BKcht47F8Y6KV1nlhuBU7NiSOZWsYGpJnv+g+V+6aLItu5ZN4Dp6wZ1a2
 DdLLjF0APO8UYQgY+KxkJF61L9bOfk+mb3P7caT/5Zay9eYiRLe3JbCY03MpTLCW6hjQ
 4LENwDjnT8+gfJeOkMw8Rvz5/NhDrv5m5slbkChfAg8RhMxHs9EcFSBfxw33crYqkPyC
 9wLS2X0PX81LE89vy+wMtpQGkmEOfQBa9PwoV9cR2z+F4XFsHSeMitWw64gz3XER0QEe
 AY5Q==
X-Gm-Message-State: AO0yUKUAYRagpCsujhept6CfsvVsmv0RhFpU5FMrFejfevOd20P1yv07
 7M4YosgCL/zWneOCvX1VmQ==
X-Google-Smtp-Source: AK7set8GspnsCWGYKbxKN1uTZJxpgT1DCK5rPr1zBkbIBamx+JrDWk3S0vq7V9yELy/gC+8h18sZYA==
X-Received: by 2002:aca:45c4:0:b0:36d:9536:160 with SMTP id
 s187-20020aca45c4000000b0036d95360160mr7317oia.32.1674684841524; 
 Wed, 25 Jan 2023 14:14:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056808034200b003648b84a2b5sm2780771oie.33.2023.01.25.14.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 14:14:01 -0800 (PST)
Received: (nullmailer pid 3057738 invoked by uid 1000);
 Wed, 25 Jan 2023 22:14:00 -0000
From: Rob Herring <robh@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: display: msm: Drop type from 'memory-region'
Date: Wed, 25 Jan 2023 16:13:56 -0600
Message-Id: <20230125221357.3057655-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'memory-region' is a common property and already has a type.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index c5f49842dc7b..304525f81563 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -89,7 +89,7 @@ properties:
       help bring the GPU out of secure mode.
     properties:
       memory-region:
-        $ref: /schemas/types.yaml#/definitions/phandle
+        maxItems: 1
 
       firmware-name:
         description: |
-- 
2.39.0

