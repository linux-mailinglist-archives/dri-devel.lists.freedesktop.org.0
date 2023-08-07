Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C077727EF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 16:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E25310E29F;
	Mon,  7 Aug 2023 14:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5798E10E29B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 14:35:35 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-991c786369cso625514066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 07:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691418934; x=1692023734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ZvPUmeI/1EMGUSu/xpT/NIbYPZbxTYJRvOXwkEg1y4=;
 b=nx3VdgiKuT2WAB9KWAoKXJPbURnaLo0c7g2k8OCRZ8JX+DDucBlkvE79w7wqREmoAv
 5m7FMByQLnWy4CKH1Dv4uJlEb3ClC3MUvCJCJzVOELztu8Bwb8UvEnYwfynQk/JUNYSx
 +MS/6zWN36ApBG3RZEbKdTwu3whwBIpZDKUFQpIUwgJBVeslLFD0WUa2KIR4gjIZl0AR
 31Tjy5cxqNBWmZjIo90FvvCkObwmUMp2i/HPzTAGn9i021AaopRAcOp1bHgvGI7+UelC
 FTRsHz8dxGIa9J04nv8A/KMFn9WutCosf0k7vXOoVhhYkk8k4Kd+RcEaQUl3NQ63Oe8z
 EwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691418934; x=1692023734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ZvPUmeI/1EMGUSu/xpT/NIbYPZbxTYJRvOXwkEg1y4=;
 b=lJHPYrDDSUzdcu0uYigp0yNrssZLq1xn5mZSJgVTaD5HBwOnLrnKa57f/w0Qc9D4Xr
 gH3BOJvUODbpfWwXtBv+WckWWqXhaNYulWdkjtmhr0fDtBUDcl3D4J8fDY6c1w+ScIT1
 3lJUa/U8KUgiJHSDnls1lzUgaSh+sXEjCOzn3Xq6sAkqqKD8d6CDX/QMAAwaslB282do
 XKMpiCKZLKQUgtMXDuf9s0gaJ0TOFMx3GjFpBXnnLIxG7MpZ6hfdqGIZNnRYmS0CXIAL
 sFNS45gAzOW8TIe0BAeZQQAqhcWbIRS749aEbv+1/GfefSNdvjAN/psmbTqbEWIXQH6f
 X7ZQ==
X-Gm-Message-State: AOJu0YymA+FH3+aIk3Spb1c4TdwheCvTxsUp2RTYGTpPrBimWgXzyznj
 lqH6dK1vIKeg+uJokRDNizZ02lt5o5aJTw==
X-Google-Smtp-Source: AGHT+IFieJ8bZzt1TPzOApOQ7/Q2X9S0DhUWYiPxMLc7XZT0uMY2JEoLmpSSXlAl5GIQWxhXlFs4wA==
X-Received: by 2002:a17:907:b09:b0:99c:5707:f458 with SMTP id
 h9-20020a1709070b0900b0099c5707f458mr6661271ejl.72.1691418933549; 
 Mon, 07 Aug 2023 07:35:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 e3-20020a170906504300b0099329b3ab67sm5323292ejk.71.2023.08.07.07.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:35:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 2/5] dt-bindings: display: tegra: nvidia,
 tegra20-dc: Add parallel RGB output port node
Date: Mon,  7 Aug 2023 17:35:12 +0300
Message-Id: <20230807143515.7882-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807143515.7882-1-clamor95@gmail.com>
References: <20230807143515.7882-1-clamor95@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxim Schwalm <maxim.schwalm@gmail.com>

Either this node, which is optional, or the nvidia,panel property can be
present.

Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-dc.yaml      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd562..102304703062 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -127,6 +127,37 @@ allOf:
               $ref: /schemas/types.yaml#/definitions/phandle
               description: phandle of a display panel
 
+            port:
+              $ref: /schemas/graph.yaml#/$defs/port-base
+              description: Parallel RGB output port
+
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+
+              unevaluatedProperties: false
+
+          anyOf:
+            - if:
+                not:
+                  properties:
+                    nvidia,panel: false
+              then:
+                not:
+                  properties:
+                    port: true
+            - if:
+                not:
+                  properties:
+                    port: false
+              then:
+                not:
+                  properties:
+                    nvidia,panel: true
+
+          additionalProperties: false
+
   - if:
       properties:
         compatible:
-- 
2.39.2

