Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49498765E0A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D0E10E607;
	Thu, 27 Jul 2023 21:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BE910E616;
 Thu, 27 Jul 2023 21:23:32 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1b8b2b60731so8536545ad.2; 
 Thu, 27 Jul 2023 14:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690493011; x=1691097811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQZMOPuU2NT251VkgOhkBFz/GJRkDGlyYehHpTo6xuo=;
 b=ivYp4VJCrL/8o1Xn4k6WDMaTuMD3bKTU4BJpdp83TNkv1aQzgezYW+SjC5+QLxW8lh
 00IQvb2RQ1DY4Yv4R6sEuZN7yYF6qWdSiyr1towRuRVGFEwDSgZhrozK8pxzr4pPdl0S
 BF2uXXKUtnQ8HbzR/h352BcbpZ9jXcymuiC/O8Nf0j7q8bhifVUBAQg+JBLWBHky4h0+
 fqhPJvCO5+sTO9Otyciht4/oaN9qAOIedk8P/ojCImjfWB04JEU7f2cZttDA4xqYn/DR
 XRtxwQUJC642nI3RwdLqczsIQdwxecFJ00gfPYR5SuUsOiOLjsZPzKFh797GJ4xDacRo
 PGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690493011; x=1691097811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQZMOPuU2NT251VkgOhkBFz/GJRkDGlyYehHpTo6xuo=;
 b=XO2p/WobeFnEbt2LR9bM1CYa9Eb201Teg6COFyDfKZ6JN43oI/i/rOP0Hb9dvuvrcM
 wxK5eyLG6P4U15/z1sE7mU9EBSttG9yARiE1UZM0AgdWKEEWAmyD3IWQvaSXNqBdspwe
 Xi8jf/Z8kVS529/qZt8133uWSClWZX4OXYlhkAaVw1Fwzy4kPOm9RdwdnGp/gATS+6vq
 qAYOJKA82L86tYFt+y5HkBVCgEVnA2jPca/nv2hRgZv/LkXdljjC/z04IpOb1gCKCS2T
 /IgBh0yR3y+lFS09QBNFzCGKuOnbQyqXlgD8qzcI7yKEC9Vv3+fNtANADoQmxs1ZfpsW
 VQuw==
X-Gm-Message-State: ABy/qLaqXMZbBP9gc38xKH3li0IUaRk9zd8C/L+2sTMA1Ed7AghGDRUZ
 r5064dM3bHaYCpNCYQftTdnCt37kwTw=
X-Google-Smtp-Source: APBJJlG1ww+SPQvtSFuUK3ikZ0jM7AgtQ8N3bRakU4pav3WJNQ0ITBLndKGJDY5IP78SwHRXLOQJWQ==
X-Received: by 2002:a17:902:ef87:b0:1b9:e9f1:91e0 with SMTP id
 iz7-20020a170902ef8700b001b9e9f191e0mr383339plb.41.1690493011002; 
 Thu, 27 Jul 2023 14:23:31 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a170903018800b001b8a85489a3sm2074529plg.262.2023.07.27.14.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 14:23:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/13] dt-bindings: drm/msm/gpu: Extend bindings for chip-id
Date: Thu, 27 Jul 2023 14:20:17 -0700
Message-ID: <20230727212208.102501-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727212208.102501-1-robdclark@gmail.com>
References: <20230727212208.102501-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Upcoming GPUs use an opaque chip-id for identifying the GPU.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 58ca8912a8c3..56b9b247e8c2 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -13,6 +13,12 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - description: |
+          The driver is parsing the compat string for Adreno to
+          figure out the chip-id.
+        items:
+          - pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$'
+          - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Adreno to
           figure out the gpu-id and patch level.
-- 
2.41.0

