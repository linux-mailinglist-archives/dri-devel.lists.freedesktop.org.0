Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3215719871
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 12:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E606C10E53E;
	Thu,  1 Jun 2023 10:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E0F10E53B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 10:10:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30c4c1fd511so71351f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 03:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685614203; x=1688206203;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4hM3UpU4FHsZR3ujTD4pG4KYkhz/mexEq2D+ziSUPKA=;
 b=wm0YX/FCvbKlhU8+yx/ex0SXt+VVm9oGs34CkMJgcsUos/ksIQds0jbU/2zfqJdNMt
 B1q+sI1TqnYVnzmPYirTEpd4EYzOe+2ajmG0xIlETpmHWTkrGv7/1bL4/mIupyl0zYMD
 7DZkQ9loj/ET7NJHVN7pd6l+TaDNDIDS6wfKdKO8v+MA2lM9c2XYyaEwAfKApDvTmm6r
 MOEnvqmzG9Gbpj/CSNvftIdqq1AoqGSyUYNvaJewpt+0sprqYWtSwd67YkqhsL+wkvNt
 XWgRnHXQh2c88A8ZAI39Pk03HhtDHcOOoHlwFwo8pazb+G0LCsXZDv6zpBCgxGls89Vq
 SJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685614203; x=1688206203;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4hM3UpU4FHsZR3ujTD4pG4KYkhz/mexEq2D+ziSUPKA=;
 b=W9YvTYErVxqy/6d5DJ8e05+MEVZrWIqdnlb8OTWW/PvDSGaBtSqRxDEheHZUULlXwb
 CLssVxhqr/RaVr5Eg9chqYK7lnjLGpL+1e02mXb/PLTwPH5PnlbsLPg/HiTqnwy8bQbL
 zPBwNUIh+2NzUNP/ZIKlMDivuMEWZwCZnwDWdf/O7cbcv5bm1lewamW15merTnwZxrwm
 OJekLqZF3eo8HwPhGFT3Jq4HAFMN9GfjlkVii7tlj5fGJWNR2yQk6Y3rQ9iaRyknfhMW
 IkQtm5dlhjoIvt1asP0g6Ll1+ClLiS+EdYuVhJmqhw2WoqPxF+gsbPdRX0HP9WHWBZw2
 /bJg==
X-Gm-Message-State: AC+VfDyplJY+VSI3V3MfF7Ey27We2i2NOu5Acaa2JZpfxDWhZ2YOYgbp
 zcORndQkh5PnbzjbstKvnK5d5A==
X-Google-Smtp-Source: ACHHUZ69Bbf6Z3INj/J+PwXGLRxzxffkhFi1gLwovYKWHvCS3FLJST4uEj1nucW5+Z4m4vb6CSO5MA==
X-Received: by 2002:a5d:60d1:0:b0:309:5029:b075 with SMTP id
 x17-20020a5d60d1000000b003095029b075mr1497452wrt.13.1685614203474; 
 Thu, 01 Jun 2023 03:10:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfeb46000000b0030ae53550f5sm9683845wrn.51.2023.06.01.03.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 03:10:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 01 Jun 2023 12:09:47 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller: document
 SM8550 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-dp-v2-1-e8778109c757@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DRIkrQLx11ml/or6ze6+hR4V0lPSP/PMoO7uVnzdRFc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkeG54qg4wI0MlQbpeCkfXkCVcdBiCMuVoAT0SMQ1N
 59LRRxeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHhueAAKCRB33NvayMhJ0afpD/
 9uWKQsA/VKfHHE76RHNW3PPQDOjVTLJ9jcBX1WePnao/vNYlw9XuVl/GTt2p8YhPZSHBIYU/T7ukFf
 lI2nbrdnYJFFikTpvDhyQvT68mZ00mTXDDakUxVB/nLwzjlAOGTUc9FbDNAifNACgVjIs+/woS4FWK
 1GLiWtPat8FaGPKQyhtnuOXTyrs1Adzidf0B5HfxDIT/ydsvX35TAVcfnl36MHTVF4ElAByV122Dnj
 7VTFiTw1ibXKN2Si6b482wou3s8hTuz64t4dKF1FmIF86b+OfJ2rr4ilpM6tCVId06IvjyYts7mZZc
 rd1DKtP+PTq2wM6hBWGrXe03vezEBp6/E+13CrqX0Rhu6CSNxyiLBm76ucWC/4oHwE6vz1zmt4LgEr
 HXeJg5KAPE1AFp7MmZGeJVdXe3CPDlSEXJkxvH0QQ8RXuHUdKfphFvi9b2oHX+tgEXIdVySCpSHo46
 8ihW6AMow+htUomkVYCNm8Gv+ZRvAOlG8Wn0/1s0oFk0fFENrBYvJNBecKqu/FLhGYdGQ7qurHcpF3
 B8DeUX2KQW6yDCvfHJ4NCcF0PG4aXOEGr+Sn8OxGA36hL63GfVQkeZ0nRpNYds81DRKMgPkW2VRdLc
 1lrLzNM2ztNi4RGed6RJ+gv/M5bd3VdkW0SY6Tph/gKTD4D9SuZ351pRlYQQ==
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SM8550 & SM8350 SoC shares the same DP TX IP version, use the
SM8350 compatible as fallback for SM8550.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index f0c2237d5f82..7a7cf3fb3e6d 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,7 @@ properties:
       - items:
           - enum:
               - qcom,sm8450-dp
+              - qcom,sm8550-dp
           - const: qcom,sm8350-dp
 
   reg:

-- 
2.34.1

