Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD395855DBB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F4610E475;
	Thu, 15 Feb 2024 09:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AWbcm8y7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C7A10E475
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:20:34 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33cf6266c76so379962f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 01:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707988833; x=1708593633; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rJagULZ78/2FNiklIv2V0yaJYekfWzVBl7+5o+wg9ug=;
 b=AWbcm8y7SlR8+TOlz+LszGW8KN+OC2Pzi9nyjhRkLVVEjY0YzxfVl5JGDN5z+6hq0O
 qRqztgAz/C97XGZB6l5b35M6tbgBuGc7mW3zH1GiuYeUPxXql3bLN602BIm42N8umOY2
 IUh14zfr/xNTgfazp9kOMxWyvTw4bA4laPg+DeRvVatdnrubkih+DSNxvik9VVLJH0cE
 hldQKg9ZlyojhckV8YiOXiWyETBPuEf6f+uRepi+JXK6k1K1YvpOvX7Vtg5KoitQP2nz
 f7wnGScOJ1v8QtK5/uA8wbs+/If7H9LeQHD4RBngXvxXnHCQ84GmXSBCNvXr8DvCecJE
 liEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707988833; x=1708593633;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJagULZ78/2FNiklIv2V0yaJYekfWzVBl7+5o+wg9ug=;
 b=QqB+kXiZ8UfpG7iaWlQ9cE4W7Hsa4ebwtHJ0fvz7RokHkBnSf6jiYHxULSLCAAJRs8
 KIdvdsDTm1MHODMVIbQPfAh1lJQZ6pt6ZR4WAtOptg8dtBC5F054kxvS5on/g8v9ZHV0
 p1lXNOogjr2YzzS7yI4fcqtX6MF00wwBC3x88FaiM+5iNle8iRd/D/+pTWnlYawvdlml
 3C3e9wARO64GjnPqg3CkBzgKTA3pLP3SiJMjzBBmko+Yt/Nx4TwGSWsLZAKgpUqdCMwv
 eGIehVfEISizATlTgIy3MZhjDfbxS4O4DLioxC8Qs9g3zhSVmwfvMKLw+CkZc9/xzCg1
 b5HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqJwZ89vNLSHPAvXQcfzWN4VE6N+vN1sNaHu6uhhnQHQdDIPATe01hA5ALhnxph+0uwS+6E0LI2uA9tsaEFPV7zk+677JSrh9z3Yfgit7Y
X-Gm-Message-State: AOJu0Yz90NtYkoxIkKZ0ogNXDJe0dHFxG8TZdxfDlTfbbUcU/4ffI69g
 kLYj0oGijPkw/poh3si9/rLgCztORF7GQpbqAyhUa2sMuLT2tgd4hxQuNZV51I0=
X-Google-Smtp-Source: AGHT+IGp8PMtl4/BQOIm+djYPcum7f8RPFzzwdqiXF8XlH48cA5EQ/oqgfoCl+h6vhKoGtgOFNP4gQ==
X-Received: by 2002:a5d:6ac5:0:b0:33c:e29b:f5cd with SMTP id
 u5-20020a5d6ac5000000b0033ce29bf5cdmr1177257wrw.24.1707988833298; 
 Thu, 15 Feb 2024 01:20:33 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 l8-20020adfa388000000b0033b66c2d61esm1156435wrb.48.2024.02.15.01.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 01:20:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 15 Feb 2024 10:20:24 +0100
Subject: [PATCH v2 2/6] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240215-topic-sm8650-gpu-v2-2-6be0b4bf2e09@linaro.org>
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
In-Reply-To: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlzddbAVFrIBQkQc8wMo3rdp9H43W74Ogf7rPLLvlB
 Pp2ObIuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc3XWwAKCRB33NvayMhJ0XWFD/
 90BnRPN6dApDP/mf/zTfMk+WPjxCgiRKD9B5wOVXHmserUOVv4XQjNbeSnmKiPHIrlA2diwPMLUQW5
 gldygkZKP/cKbNfC7aXmrDV3kzll9YnfrIfR8V9Ofd24GFWdevVhfZK95UCROl0ETK5LsWizLKAcPt
 1ASrOZziaNSQOIH7ROV8AszH8knJdYLs8AzIzc+bpGYwJ2hHwI9rAcksVDZJY1qgHvR4mO0Y3ygS9t
 kErNXLjvPAtlytDCjUh9GFFft6IZoF3Tq50VcYk8e73pOYDH15ke9huAPevApViaQZfhMgMNlEvS1g
 HKpxQ7NSWSK3Ht39GwzxDw7JBh7U5pmU8f+0DJq+QS2V+Cjjns3L73O0u+hujvD1lmE+23PmuEse9y
 IHUTUqD0w4Uy+WGigKDnMcj7sbh/a4Ij3QUnDU/U8PO4Dav9d//50iKe7xlYIkbSmqJ19MSq2Z2R4j
 ifQRWVp61pZGXzF2w/ET1xRrK45+YUffB2vkPO2USc20WFM505lX4gOP9yLOkirH/6T0u6Ew9nZOTv
 prdfEyL6z6l9L4UDPtA4AqdpbfmIUJrzpHfkKoHkjhzKgJmYwQ8dpfbz0zJvH7Aos2R1MItpDpqvUY
 7+ez6OVQ9TzbkKl9IESBxQACvj+aXm16MisovuPwclaI6Ip0zlL9qsMBs31Q==
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

