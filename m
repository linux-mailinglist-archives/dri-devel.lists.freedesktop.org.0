Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5D96711B5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97FE10E66B;
	Wed, 18 Jan 2023 03:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD6310E652
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 03:17:22 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id vm8so80049365ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GMbaXOpJps57LZX9T8TLMvj9shL/EKlMPCHrubh+ldM=;
 b=hQR6fLTkpOdBbpnoEt5ccS61kq5hOyOhM2sJmDDQS/0+8Oskn0hKPMUwGAaS71aQFV
 6U419l12lxqhwYfCkrTeXt3pWTZsBaykL7Qp/YA5MWJ8QYNypcnBmxd7soqba208fspK
 SaxORZB+E96yWgsv6aMPsltfBjrt4r29IrcLZvJgHqkEeXE7ZdJ+9QIDYPmTG24eIK4O
 DpUfiSWWhm6+WZFce0mdV3cYOLEeGUsNTdIxXWjzRGIIpmehG86A9kKS9qV6Ibtm+Wyx
 srT2CtmKPSa1BOipkot1u9WvRrhG5ft/BbUo+MVhbNzjoqHM1TQgJjAr9DFGMe8d3mKn
 NbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GMbaXOpJps57LZX9T8TLMvj9shL/EKlMPCHrubh+ldM=;
 b=DGIvozdiTFsWIk0JSINKwy8ifJELHVlBccnCcPhiQKf2OiM6xKELEQw+kxyeWgLNNe
 KsMClAEN7o+5iAD4fg8P4SQYH5ScyP7hzNLCQAig63okI2XF/7lTJ9PUwSAKOhUdrbBn
 9uEGPfsZTGyNfDXl/bVRqeWQFoZ27AvqzIxeAIfsNJ26oIj4yT1fYlvaREflSlJ0m+ut
 m57porrevutrIuZM+u+wfZoAD9VAGHgdTF7ulp14oMc2tR6eTU6ATLV6u4C1LlrcS93Z
 HmOTrSNSpSMJ3K7Y22GTR7QLEOmityajcS0/ZRL/CMXvCeX9CKE4ifbNurSZASIoOFST
 kG1Q==
X-Gm-Message-State: AFqh2kpDbvbEI8DxnpHcZQP27ljki/5+1ew12c3X08NsIZNdyDgS9SyB
 KJhDrjoco+KewhAyZZR5kBIHSw==
X-Google-Smtp-Source: AMrXdXvnS/jPFskq9CuPGdx0jCWVekl/5a43zq1NuLIH2RpPyRd/9gSSrJ/4BUYAG+pYbfjuWirORw==
X-Received: by 2002:a17:906:d787:b0:872:5c0a:5597 with SMTP id
 pj7-20020a170906d78700b008725c0a5597mr4432757ejb.70.1674011841245; 
 Tue, 17 Jan 2023 19:17:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00876479361edsm535639ejt.149.2023.01.17.19.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:17:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/4] dt-bindings: display/msm: qcom,
 sc8280xp-mdss: add DP / eDP child nodes
Date: Wed, 18 Jan 2023 05:17:16 +0200
Message-Id: <20230118031718.1714861-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
References: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Describe DP and eDP devices as subdevices to the MDSS on SC8280XP
platform.

Fixes: 45af56bf2d74 ("dt-bindings: display/msm: Add binding for SC8280XP MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,sc8280xp-mdss.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
index b67e7874ed56..c239544bc37f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
@@ -38,6 +38,14 @@ patternProperties:
       compatible:
         const: qcom,sc8280xp-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc8280xp-dp
+          - qcom,sc8280xp-edp
+
 unevaluatedProperties: false
 
 examples:
-- 
2.39.0

