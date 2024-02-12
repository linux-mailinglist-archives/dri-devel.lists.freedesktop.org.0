Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B02851114
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F385610EC35;
	Mon, 12 Feb 2024 10:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pK2RK8BR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE1010EC00
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:37:38 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-33b29b5ea96so1381352f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707734257; x=1708339057; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rJagULZ78/2FNiklIv2V0yaJYekfWzVBl7+5o+wg9ug=;
 b=pK2RK8BRNcMLy9L2H0KqZltN3TH20h09VsvBJXMcj7JQkK89OI4FWh0OSUQsRIBYA9
 Yhxk2//8ix/bPgfS0uHhFjqFAu6h/1/v+P8+49RY8Scl4Fwi9/6HeLoX9F/gBuML7QSN
 LLZYzsGLZJcHhG2Jd4j2IHCwKDTUO1VJCH20XoUJPwQzMt30Bc//6Sr8L1f8zXqGNlKy
 9XFVDFrNA7gjiigWu+42WMLSPVTfHLCsECNosNxp6NiG5I6kIdvzvN7Gbyo4Q7Va3yn0
 bsqeZChaTY7r/p7LSyaIF863VFeMokLZH79Z96rn7sd6ZvL9MtTJXCj2MDk3vGEnhvE3
 tPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707734257; x=1708339057;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJagULZ78/2FNiklIv2V0yaJYekfWzVBl7+5o+wg9ug=;
 b=J7TMbLSWgPnHvyEWOgrE8EwtEbmC7nZFf2byuE6EpRXZAcARyWfx1aYQXYnUNZHPIj
 Lq9WDr0N+rWsq/8osk2iSKkhUA5S8GPk5XdWt3JYK/QMDUpa//5d8mqbw91769o+9D5Z
 IC+2VJUa0N1QOp0Zw6L7uDSUpAuJaV4wmdv2Re980Lp6JcJUfmwHxeJaaB3vJ6fsm9wl
 573hhj9vwkq+blkZpWnCqwCyKRGvmXI7RJ8ONtw0lwG9MIU0vrZzTHUsvN3LFmads9e5
 3cvvErOfVudqE1v8G7SgZmTUlxRsxz7ry+wuMPtwukh6gGrRjoNFVDTOhJa82TRJ+Klf
 wXrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFeU0mPPz9x4ig0BJyPYMN8qAhV5R7NVfytFDCn/ofIR6RGk+38ghYs9JuYkf2xBrunlaXog4fq6Uz3U7S2J+e/GYOp2R5LIayJCJGFsNw
X-Gm-Message-State: AOJu0YwDmMyYf0LYtqUQ+BtWKwoT5JanRdnqblBDVhZk9jTcMWyk0Nyc
 j8LLOXgAL4ueGKRIZ5syfqEVHUNcZ2dDyxwiaJbgozDXsBVjuKBoNXdRIdaB6pQ=
X-Google-Smtp-Source: AGHT+IEUTbD3P+8HYLm57Gj62Yy+XJcAscPYSfTzC9X3BDnYz7nuTYa8g6lCJZ1yRVTHo8ErNwEWyg==
X-Received: by 2002:adf:f74a:0:b0:33b:4ec0:8158 with SMTP id
 z10-20020adff74a000000b0033b4ec08158mr5438324wrp.1.1707734257037; 
 Mon, 12 Feb 2024 02:37:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVm9cvpkw+EPcMp5Ggu8Tz2Y5oioUY4blXzFfVQW5qFjRs5H0RAX0DHyJi30eK+Lod5cYp5YA6+9GBNKqNW2bQXkMU8GMclCsjITnIo1V46svI+vJ2ukeX3ussrwAM/3CvumJVo8UnfKyuWkWo28wo65WvC11krDI5uibD/uSZP2OVrPLD5N807nKQ7Dmk6eLBPDBodJf/YQdfcTdW96TraHAYArr4uDBXTLrbTs2z5FrooxXsxnYJ2hjrsLQiYpPbGreqBuxyiz5a6jhPQt0o/HGSVLpY1r0oNPmOb7wZKfrpSrnNcLyGbYyOoXtvlxudhG0y1T/Zp+32EEasqUvfIkvX0vuI063kfsyq+0jxnvTwVH3iOJQiQU6EOYlUD7mUaoT6psH6gEfqDZD6cIdc6VP4M2Z+Jbnau1L8az9uuR235WsvZGsIzpvYnB2ehwARHZZwFned9/L5Nv31K3Z8PJNhpryUgGGElz/+d3DoUMoLzNUTRBQWymIGhsovLF1lYPVCq6Yx0OLvpI1YPNVsyX5gK0pLi6W5ZyyAzlHlVYrK95gpx0YP7DvYkdyqu7xjkd8ngU/H/U1s0bmLUdVkTfKYBs5y3zFgizDKzIdTERjpHzyDI+ojWfo2IUOkiX2NCGXqfYhZ1sertf0XgNc/XyI1sKc8P1vsmcEfb4pcEamKXAhCj9QEVoG20Z4qC2BPzQCMH2Kptneo9mRd64q0jtVTWFtohEeYZd8j3jsiP7y401aKsk0nL3Auv0esaiHmSE8TpfsG8+OnSeU+TdY+jX02FlbfRcAWcXJEb7Dp/nNJFPr6W5rCauU7ZFYATfSULEEo67McGDe8a6CxO2TIMz2+iSLxxdXwQnYY=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056000128e00b0033b50e0d493sm6404188wrx.59.2024.02.12.02.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:37:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Feb 2024 11:37:31 +0100
Subject: [PATCH 2/5] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-topic-sm8650-gpu-v1-2-708a40b747b5@linaro.org>
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
In-Reply-To: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yo2bcPgq0Ry4Dz1DgWE+noJk1QUbw0wPoiksjLdYOBo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlyfTrO4WrHwPJVS0uZ7/4DoP2WAPQu+/ImfcHnWJp
 o7pJCXeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcn06wAKCRB33NvayMhJ0cczD/
 9SSPuVVbNk2q2830ed1PUUQYXwi+AD2p6G5oVvutmoaFeglNqyo1u9Cqae9qnvbX/AFn62VQIq6oLz
 3WBiwX83XucvLBmMqNQ4pFhyrIokyKfY92Eq1poWCZtaaZOp6AUvj1EDqzDoeVu29q8IWF8rORmFVT
 j1043yD0KI8GLrGLovOcu1eGEmunBajlBRIxEYA0fN4GZdaYBc//DUyxctPNp9tvmSbtbvT+MtaYXm
 IFasBy2TJKqwzhEN6PIsCcK4/KJQnJ9HKBOQ0RTkFmVIrmf1bWZ3n91u4dUgbVY838jjJ5909OToAf
 ogFSnCHtEA5z20G0wPPxzJQPZkiUAlo5wpguLe1aukvgHJExieK1Kfeht3G6b4TV24c825ucyAPFhT
 OhU9bA8/3uy0wuUMWomIgaAddEDt1OUnpljsxkNHIDux9f3EtBevuXABRVYZZJvybdeV+XahEQKi2Q
 bsRQ5d2mQPvMacnsTMqx67B2+EoZ+w8p1zc211SqjNxiWnSp9txjjMPqKHlCLYBOIUeL76A0bGOxJK
 t+GgvzgFy1MtSA6jSHKEWy85htZ3855+fWTLmSXN30hM/mtd3FMXwyfpUEz8I65daLOILXrXi9lZTx
 2W5G/1h6Z5gsY7WqI32ZqONFi2PaVsgoB2liBDzcP6bYGE6+BOuWJjEVHWPA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Document the GPU SMMU found on the SM8650 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a4042ae24770..3ad5c850f3bf 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -93,6 +93,7 @@ properties:
               - qcom,sm8350-smmu-500
               - qcom,sm8450-smmu-500
               - qcom,sm8550-smmu-500
+              - qcom,sm8650-smmu-500
           - const: qcom,adreno-smmu
           - const: qcom,smmu-500
           - const: arm,mmu-500
@@ -508,7 +509,10 @@ allOf:
   - if:
       properties:
         compatible:
-          const: qcom,sm8550-smmu-500
+          contains:
+            enum:
+              - qcom,sm8550-smmu-500
+              - qcom,sm8650-smmu-500
     then:
       properties:
         clock-names:
@@ -544,7 +548,6 @@ allOf:
               - qcom,sdx65-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
-              - qcom,sm8650-smmu-500
               - qcom,x1e80100-smmu-500
     then:
       properties:

-- 
2.34.1

