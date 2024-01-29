Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD938406B1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 14:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D92010F732;
	Mon, 29 Jan 2024 13:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DFB10F72B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 13:20:12 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a315f43ecc3so244351766b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 05:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706534351; x=1707139151; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GG0GBWYmR303lhQbjP/lih7U/nLsvQ1GRwuqyhVa6N8=;
 b=zFNv7bnytVfTAFBCkHg+nFh94/ar86k1zdd3408cHQhsME5gO1d6dIQ//shPtuapAd
 iXZIrAsZ7wxDDk7hLCL0Z93RE/ghhoSgsIdPqHXvY33qXSo5XjGiJIOGXLIfABkLKktr
 mgBg20BGtRUAuHnFaLToRPqgR+X2JT1OEIIce79r/ypCcbxaJuX5TYgenxrDO7Cxg/EC
 TSGu8YfCaHvD0ij413bRDhpGoADUXC3CbsYj3DtEZfA4ueNcRyyxojhaUaHV1sZWkv81
 jVKSnmeIGbuXJPHhdstJvRvmJ0xmy0xRZGBVanb6jWBFADzFjKlCbn8a0io511ExtxCW
 wJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706534351; x=1707139151;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GG0GBWYmR303lhQbjP/lih7U/nLsvQ1GRwuqyhVa6N8=;
 b=d8LIfd05hJC75HEJGD/RH/PYNKGnkXH0JIJ+pcpoXTCaE9YwLuyBzMURrejR3zkzYb
 j/kNgkvHczno1t/jiG2yjSLgmPj6mi6kxDXi9c0gAayO9p0/DEvLSafwB1SPhg4khXUY
 qYyQzkEKyLnfmVJDJ+LKh+rK6xg33grMKDzlcNQvcMCY7uUZdUAsWR10QfM5rlvdmt1T
 2ZSdb5IMh3dyaAtUwTWugRsrKxYJAeQq+e1lzKxH5NEW7E4+9hKQlj+gMxYDhpxTzQOr
 mGVI4DNhtUk95N2ElaGDDi/oPZY9xjPJ3pwqZU3jRv4iVSgRJPsF1vHjYRwcWQkFWXqm
 sYyQ==
X-Gm-Message-State: AOJu0YzhUQ1HPgdoDOJqqGXdNReihEuc+jzLhKUWep9lA0fA5OMJcicZ
 GxXBozAQFy1P6es1JU/aPnAHKePds6o/X9mXydzf1k8eieLf6r1iZdPySEiIzuc=
X-Google-Smtp-Source: AGHT+IEJy4JQltR8i3WL7nnCfTH9WoA8KA83+7OvtRrL8fcRTBSUgiIoyZaw31At50+47iq+vfBl/w==
X-Received: by 2002:a17:906:c097:b0:a2d:2121:2a93 with SMTP id
 f23-20020a170906c09700b00a2d21212a93mr4511029ejz.70.1706534351183; 
 Mon, 29 Jan 2024 05:19:11 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25]) by smtp.gmail.com with ESMTPSA id
 q15-20020a17090622cf00b00a359afad88dsm1591658eja.10.2024.01.29.05.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 05:19:10 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 15:18:55 +0200
Subject: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for
 X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-display-v1-2-0d9eb8254df0@linaro.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
In-Reply-To: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=875; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=obEEQfmkAfxnjBW+PweeqoESi7fBuQn5BZP9Fnf2iR4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt6XFMvqsCn2GbXA3hKh3+PdT5dkoMZI1KJEt9
 0ujMq6Z04iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbelxQAKCRAbX0TJAJUV
 Vo80D/96RIySVK8vNVIn96hqrcM85c5tCYu+ZCsjzpyfM13gPfwrzZ/DHNk0Ll0jIod8CkAp3fW
 dLmw4QLlALVFosIdJ2txSld1VcQiNKbLuJ9GvnCsgbcQ6dPj07BYklYMrde8tuMYoYm4E0HO2lW
 L8mmfw8j1FyuBWB1ETbnncINvDXJHRgQfUJYjGsAAzkQS+ocXYeIc9ZuSx2hPBE4EkFMF4v+QR0
 kUu6KApyJS2Y/7BSZMImkuJotbmQqkmkoRdiPp3g04ujhE/SycbyCI/MHbBNK9P8sKKfQoPNqBD
 KgA1CNa4D4HU53rCeqf9Ruwe9hwizLy9nOEOUStWBh78MNNQ6kQ2X+v9YCJTGsGlPYgxXfsxujv
 0UI8vGUm5CY3ccQq2UR5mxrAPcqWa4WiMW+2ektPPnCmS6ONS2wMYMuCx2rS2q0Dd8WHYjUYDbA
 +drBWk2Rs03ks3T/IoYSy75lGsIYLL+UnzlJSUs8z6sRLCGg+J+h70brlXfl3db2PjNhaH11TCm
 2An/Wlvs/excz7GL1PsXjYtQhEOkyjmr4Wu87hlNvFJXnvMHk2xX1RBC/uRfk/ANBL42w81ArWk
 4h69JC4e6ROgyx3KDy8RZkAp4rkVd1bIIIZ1aZ5Y21rVxjazjwKhr+ZfAONiBY6ktSVLWRBjn+x
 wFVzNOCvqkNnP5w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abel Vesa <abel.vesa@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the DPU for Qualcomm X1E80100 platform in the SM8650 schema, as
they are similar.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index a01d15a03317..f84fa6d5e6a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,7 +13,10 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8650-dpu
+    items:
+      - enum:
+          - qcom,sm8650-dpu
+          - qcom,x1e80100-dpu
 
   reg:
     items:

-- 
2.34.1

