Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B72894994
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 04:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129CC10F818;
	Tue,  2 Apr 2024 02:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZwGOnw+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E038E10F816
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 02:51:47 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-51588f70d2dso6204901e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 19:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712026306; x=1712631106; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/uwZxnjfekbVPxIm3NgmC3jP31Q9QBFu1AAINEMokbA=;
 b=ZwGOnw+oDAZjItKmADgCYkPQLL3og5zghye5OOT3tbSkIAUBT2UDGlf2gd1hpXY16Z
 Gh0zC97BgLHFxBN6c9IXy79i2o07BddA8CtG619pngHRywlUO5h+0nLeVqkEhk6Bhqnj
 H3ZgbBav6hXHsMxZfR78dsOwTfWSkcsqbGMRTZUkRVOxKqdyJE7SOZR9svqO8fdffXt+
 /YY45MoUYxEcEfAsnJVilLZDnMAPKjqvxYsowtbV0MXGkqsNpw1dx0kRgEi9WdlzD1uG
 xLEqKCmXBWdIBVE2rCvaQ5rzO4KNsLAWNz88DsK5HsJGMwIyV0eW6KRGJiV5AVdSe99E
 y+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712026306; x=1712631106;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/uwZxnjfekbVPxIm3NgmC3jP31Q9QBFu1AAINEMokbA=;
 b=RwbHVJ1OS0Cxk93yVVJI/16twiQiH2qgxD77IAn0YUIbM1blESkrmDk7cKP/vW1+5F
 P+NyITyNu4O8P49Uik9TVSdis5tkGYoFTO7Bw27qhWDPybyU7Q0HI+93F7smhScUWtZ6
 VuztH19TOVMhdb1BwUotrft7+JTmnbgYTJGoH0TJUJp3n020hGc+cnBuedhI0Sn9QxqR
 kPi0FkYnVsYVY7Sz4I0M/FN92kYx8/PIfbsMsCXyo/apTsb57gPCCErctVaEmR4KNASe
 RhhMs48NjPvd3OKAK9w7LPZV44PdmNyRPpkxUdIFv6rO6oelaUHHlda1bUaXRck3/c4E
 R+hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW701Xor9dW6ptA2tE3fKd2DLycShGkz3WEY8X3CZhFN/JAvLskwc6WHyrbee3wm1LN1JTLQoQDMG7AYcPOFA9KRJWSZA65paDlkp5R1xCL
X-Gm-Message-State: AOJu0YzJ3mPMX1IRJCv0AYPe3H+Rw6I1qxErDxxZzVOfRtNJh9mt+ROl
 OhBOy8rZH3tZm/wC/CtEe1tpXuwynlOJRcETilSitDu5ceZLHqUtSN/pYWkUi4VCPFiwXkKtO+L
 f
X-Google-Smtp-Source: AGHT+IFeQ4+VkXvXKg2bCoXDwCQ4K+jyRjP9HcxqaqguEWln7ZtxPBY6gnvTPz2mDKcrsBObfpcVPA==
X-Received: by 2002:a05:6512:3e08:b0:515:d24e:4e2e with SMTP id
 i8-20020a0565123e0800b00515d24e4e2emr8663492lfv.20.1712026305821; 
 Mon, 01 Apr 2024 19:51:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 h26-20020ac24dba000000b00516a1e2a6fcsm738824lfe.256.2024.04.01.19.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 19:51:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:51:43 +0300
Subject: [PATCH v2 1/4] dt-bindings: display/msm: sm8150-mdss: add DP node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v2-1-39bf90051d83@linaro.org>
References: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/SFcU8Z7m12JUWBj7jBl6oeySfA8J1iODLj5nSrz7GQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3K/Ag+vqCLVskhF2HaiDAo4jjfRUIeLKy2cV
 KXdjUrVzpmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtyvwAKCRCLPIo+Aiko
 1XOgB/9AbWI43J4MrsBnywBHEFBCIuHF8FF7xW53Tqne68jpitqrweFqFF/GqCxvy2KyZyhXJzB
 Q3y5bW5pBv3kVYEzbmbHqpL1iXglRO+gGfKI220ZvtWSigHl2k4pZtvvxElIhbB9hm5n8+5ONWF
 8a9oHA8Rb/johEEJw0jljoeKWGyJQoJGa3hZek6eHXwEZPcnOgMIpGEki9tG3JFNqeJZsyVlHF5
 OvvYsp1aaTT6R7YugXduUDNbGxYtHL3bvawoKqdqVVvnTRzajfHHNtQU/Tb3p1V8bsba1Q7NSZp
 z95u/aaLjMaATVHDUzjSb/DkiLdiEPfaO4YMpb8Mvm1TOUxr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

As Qualcomm SM8150 got support for the DisplayPort, add displayport@
node as a valid child to the MDSS node.

Fixes: 88806318e2c2 ("dt-bindings: display: msm: dp: declare compatible string for sm8150")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
index c0d6a4fdff97..e6dc5494baee 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -53,6 +53,15 @@ patternProperties:
       compatible:
         const: qcom,sm8150-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          const: qcom,sm8150-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.39.2

