Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A438835794
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 20:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9D110E2BB;
	Sun, 21 Jan 2024 19:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CD010E2BB;
 Sun, 21 Jan 2024 19:46:38 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a2821884a09so179921266b.2; 
 Sun, 21 Jan 2024 11:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705866337; x=1706471137; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2dDmna/MWX2vDlMqYwoRWKFxPOqOpE2ADzV3jCsCUQ=;
 b=OuG8FeiKnX3RyPfWhF+1cYNv6+s/rdVOCrphRShJwkV1x5ILsfiU0T+LzNQ7cS0YE0
 DG/6zu4hdf3SD/w5fYI90CQ/h1w34bxxwd7F7OkO6jzehRDldGrry35TXX7RwH81SB9O
 Fk1orSLbPXCtG6G6O0phx4SCQnwqKvV5W7XEqXoJMnE8QTq9F7KRgLoa0olTooH3rUQT
 uoXvTX/WaKXv+mLM2vnwfnybetFt+dDEOWd0rSoXCKMFaJDmXL+pbWkWYvcQVTKqZvOt
 4PXMhsmpRX5zVHKnIkEn/uy4s/EGqGsM5Ai9RxLkYq3thv24mUPNK/OJdTKtUeAganGR
 CZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705866337; x=1706471137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2dDmna/MWX2vDlMqYwoRWKFxPOqOpE2ADzV3jCsCUQ=;
 b=HmakWM+q4vHTNt78AHhTCELTV9yZNqAap1wZvJAHb7+DtOAkj/CVFWwjk8xh8G6YU/
 KEXdTDUCB9RMxazK7IE9OFaX5p5S5+Ic9YJ5U9nu2iPfsGxLj60ZOz4s0tajZ9ie3zJ3
 LeoGdcvaS5r5sQ+9XBgrSOX7mcTeDaH0KXleTcBagHnsZ2s13aZtGvV8B6/IjqNHb5LR
 WVWPB1/1TxMur3ljh/vk1jGAwHSHgs6q2W8oRffMzv12udfrIFyBeAv0UdHoCHz+yg0r
 bDOGUVjrRWKozoXH9IVHFzF5oSkR0i0Ei5GP0Xxo+TDJG63p2Jp5JGFcO5/sTtgAP3Rb
 FIMQ==
X-Gm-Message-State: AOJu0YyNfC9thIBuTlY0ldG11snk0388UyrHFwWs6JwDaAIQH+xNUWJV
 wd4HK5hnZe61HQXYZnXMXZWWNG5dIcoCmfbwyVwTVRZNhFaw+rRV
X-Google-Smtp-Source: AGHT+IF2DAbij4xCHFmYdAAyW4OsdvmNps4QU6Vdn+SiLznAgG58YkVFWmTNlcwIORbXSUyw3NYXyQ==
X-Received: by 2002:a17:906:6c81:b0:a28:e3e9:bc8f with SMTP id
 s1-20020a1709066c8100b00a28e3e9bc8fmr1875994ejr.32.1705866337163; 
 Sun, 21 Jan 2024 11:45:37 -0800 (PST)
Received: from localhost.localdomain (byv51.neoplus.adsl.tpnet.pl.
 [83.30.41.51]) by smtp.gmail.com with ESMTPSA id
 k6-20020a170906128600b00a2b0b0fc80esm12547134ejb.193.2024.01.21.11.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 11:45:36 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 5/8] dt-bindings: drm/msm/gpu: Document AON clock for A506/A510
Date: Sun, 21 Jan 2024 20:41:03 +0100
Message-Id: <20240121194221.13513-6-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240121194221.13513-1-a39.skl@gmail.com>
References: <20240121194221.13513-1-a39.skl@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adreno 506(MSM8953) and Adreno 510(MSM8976) require
Always-on branch clock to be enabled, describe it.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index b019db954793..9e36f54a5caf 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -133,7 +133,7 @@ allOf:
       properties:
         clocks:
           minItems: 2
-          maxItems: 7
+          maxItems: 8
 
         clock-names:
           items:
@@ -148,6 +148,8 @@ allOf:
                 description: GPU Memory Interface clock
               - const: alt_mem_iface
                 description: GPU Alternative Memory Interface clock
+              - const: alwayson
+                description: GPU Always-On clock
               - const: gfx3d
                 description: GPU 3D engine clock
               - const: rbbmtimer
@@ -155,7 +157,7 @@ allOf:
               - const: rbcpr
                 description: GPU RB Core Power Reduction clock
           minItems: 2
-          maxItems: 7
+          maxItems: 8
 
       required:
         - clocks
-- 
2.43.0

