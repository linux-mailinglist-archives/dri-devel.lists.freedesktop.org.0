Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E623885BE6E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F8B10E44E;
	Tue, 20 Feb 2024 14:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UpWqJc1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2C310E440
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:16:13 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-563c0f13cabso6730718a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 06:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708438572; x=1709043372; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RbQj3mp7H4OoQYFV5k9dEyhOUiy+Klvn+UhkFhJKrBs=;
 b=UpWqJc1xZczEoD8hYOAqohWcmDeDr/0CqesgppyiVcI3iOAwbiKgGG4yHko80buSB6
 BYFPQkdZg/TMSgJorzVjbYQc6XTApY5s5+mMjTijoL37rc3AcSe+0lFBdpwaFHVctwaT
 BI89UQlqYUBP9hDSdAO9DApPBK1o0kvL2UMrDU4MNYdlKLOLP2lE+UqP4+8fNbAUNtdp
 W4kYn06OVNlgqQ+0+OBzHIpVVBV+KrNdPRhs8bm4XKqU7t3FUsuXJjgXVwA8c1OFjICx
 z3+kdyRo7D4IYHWXh0cVhtXqdgWq7+GCgGbh8HGjyMkRTBj5cE8ulipYhikUfkhszi8I
 AxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708438572; x=1709043372;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RbQj3mp7H4OoQYFV5k9dEyhOUiy+Klvn+UhkFhJKrBs=;
 b=PA0REI1TejPgek0Qyounsg57WLAuNHDdDsUkit9lRcr53yLyl135Iyw2w2U6HVX4hR
 YCb/o8Kkkgu6897hRUoS5GkFwQH42rqHY5JpQfGGikhtTEP3U+3ac9o+lyip99J0w8Im
 iz1pwxyPKoAEegEdXI9Fx95onOoWSrcSv3gegD/OZUB/qHwjOpWSAlly2sBJHNjg6BML
 nJe6MiLmVkjPBZKfbXmEIVLIIS6S//3g3NK/NSM5TVsjrp2vXIgi4d58QKq96cZdC/Mg
 gxqKnU+iUfL4UfWrpSEkbFwz96X3NuW5EMtQ6CyitbtP7wXPahTsDgGJUfewSw9zi7FP
 UL2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5TmlGBJX6dyWdBC8DanFpuO3l8cE+rSLbRHG+A3lS9LnstwYw2OGwSgKbjAiJc5wYrF9o7a1fU2P+w+IKOhNhNozJGySbEqjggxz+bczn
X-Gm-Message-State: AOJu0YxeVf9BerexH86xEY2i8dvDWFy4W9sXk41boHKEkQm8H7/IbeTY
 a/gqOLvJlj00n3B/hs/0nUir9wGWrvGKPvNX+X1SRTtJnzw7GEjLwfm+3IGsAmw=
X-Google-Smtp-Source: AGHT+IHeaYqromQKXV63x2GOq8Xdo0svk0QhphX45LfqQuOwsD+jkKSct2kq2scOmWt8xpsXazi0/A==
X-Received: by 2002:a17:906:c786:b0:a3e:58df:fb08 with SMTP id
 cw6-20020a170906c78600b00a3e58dffb08mr4446053ejb.44.1708438571830; 
 Tue, 20 Feb 2024 06:16:11 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 s8-20020a170906500800b00a3de4c7bf00sm3998534ejj.79.2024.02.20.06.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 06:16:11 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 20 Feb 2024 16:15:56 +0200
Subject: [PATCH v4 1/4] dt-bindings: display/msm: Document the DPU for X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-x1e80100-display-v4-1-971afd9de861@linaro.org>
References: <20240220-x1e80100-display-v4-0-971afd9de861@linaro.org>
In-Reply-To: <20240220-x1e80100-display-v4-0-971afd9de861@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=XYlYR8OxpeVvmXC1saF7WHBLyL9BLQ+hAMkfLosneSU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1LQk1ZxmTIC+nLc576zOYOqSTbjmHVkcJucIE
 Np/wdtyjx6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdS0JAAKCRAbX0TJAJUV
 VqITD/93oKXwgnE9me64LzCiFkoiYSArvAyT3TMEmLe8Z6uIdjglhQRBvW2mFA+o7YqYNZpmrvd
 MwIPbFFjM7h7Guj9l3SWYfH8oSrGSXhn2a057889KRm5dzXXpwkRpQoNGBINBCe4OXdwjsc7dfn
 buPYkH4ozhc4d6Gv7rm8XKCh7r/JlgK7Ulaako1hytqxER4nN2wi4HcLgm7MikUNDtBY7X05QtY
 bn4royGDRB0VopB0R+etVyig85SY6SxuAiFLQ36tNQepdsEDBhFJOFBzEYi6U1fouwsw1Kih3+O
 e9q90M1PvF1lILaIdRR0Ph6wDr2dNRpY2k9XnKW9XOikimp88wKkshCKc7Hks2kj3nMzCDoyZGs
 U7ib17+L5uB1cvplJ4Jpb/a9XDT2d9nbvLm3/ZVar2d8g8gwhaeUAbVgcT4/UzGfxkwvy9FFIKD
 FgHIuAvvHfyXKiMlsDxK8yz7KQFKE27fYbXCeqZP/Fo7LYh5711mjhfa8/oA9bfjVGWsNlHWc2Y
 zvs9mtTHDc36uWHwGcfmmyRnM/61a40hFfrkrQ+5Q+EOlovSrZnxl1xr5L4zz2zzhCXIyY3jGre
 Hamf0/55fGdQnveT6bmxRnfNzYe6s8mnjuydNWbePer7futL+ssjc/MzLVpg3AThEgi8ZKdg0xM
 cm6TYl7lFEk+i8Q==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the DPU for Qualcomm X1E80100 platform in the SM8650 schema, as
they are similar.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index a01d15a03317..c4087cc5abbd 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8650-dpu
+    enum:
+      - qcom,sm8650-dpu
+      - qcom,x1e80100-dpu
 
   reg:
     items:

-- 
2.34.1

