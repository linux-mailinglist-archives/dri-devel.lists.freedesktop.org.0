Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB38709D32
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AF310E5CC;
	Fri, 19 May 2023 17:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D41E10E5B4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 17:04:36 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4effb818c37so3982791e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 10:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684515874; x=1687107874;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H1+Xx964Do5+Dd75p0npXtM1tzzF2n1YUbY/5ffcryg=;
 b=thfkMJlDBO8wgthYMNMUetBmtETMvJPAsYrmS0DzsUWpmfaib4gkM6txQeuc6e4vvv
 GyytH2+nPXZg2cxeG4fm49g+VOthlvEgjSWV8yeBcWmv9ge/km0/ZRMyeWQzjSLHk4yj
 QPp+ecXf101QRtMFP39n9kSmcBcLXE3eM+tUHwQrPYdlWPpgccVRQTJO7E1fKQmdFXhz
 eQBZncbZPwGULUtgUf8FU6OKp3JaTMxGryRy+9d/lMXmuA6HT9u5f1EMfbT2UhGkR7K0
 CKkxDT0Qam3x47K4ccxbeLbsyGDOr0MA52V6Ujd70UdmJIaCSiO/jKM6C33b1Cxl6J8Y
 yoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515874; x=1687107874;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H1+Xx964Do5+Dd75p0npXtM1tzzF2n1YUbY/5ffcryg=;
 b=lOCbOKihi/AHVsqYM/8Yp2PQmTT2VBkB+7+QgRgWR7f/1Whj0NrLw+v7Fvn6vb/FR9
 eSeumZ4TI/uFbWjTDnHV1DoNP2Jx9TtSbnX1WF2ef/mXdoZfFglKVFVw2zIyUvqB3To7
 j0cscxgJEj0owAyDIgQtCPWzCr/u+pzg6QuoYyuMi8UuI6sxiSwIvOc1E3kkjU4frO9L
 IWzD5EkGZ3uXKXppqDPYxEMcUMeZYhb88+ysQzoZgozZ7QAkIA5QjjqjhPNS31wLrX+X
 DbHE6KSr0tCaKedtPVrM/P7SGv5rhJ+sNQHJQfEzwX+XEzgvyYTYnJxJt04wueG1mYIs
 jP4Q==
X-Gm-Message-State: AC+VfDxqhySFNzcAt1vHXthNwT7aTb1Mho6R86/DuNmXeRaO3GGlTs2z
 pJZtquyRVvxHI1fYEgR/0ZrmIA==
X-Google-Smtp-Source: ACHHUZ4mELS3YoypykXV8iWIlO0eUJnwCCZDBcvHgkxqQ8EOSkqseL8HgLFIlG4jNk1ozEpcxJvN/A==
X-Received: by 2002:ac2:5298:0:b0:4ef:eb50:4d3d with SMTP id
 q24-20020ac25298000000b004efeb504d3dmr1036530lfm.18.1684515874534; 
 Fri, 19 May 2023 10:04:34 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b004f38260f196sm654478lff.218.2023.05.19.10.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:04:34 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 19:04:22 +0200
Subject: [PATCH v4 01/12] dt-bindings: display/msm: dsi-controller-main:
 Add SM6350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v4-1-68e7e25d70e1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684515870; l=1129;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+O75/n498bCPQBt/QSpDKi1r6jFyvKeD8W9H7IyUIm4=;
 b=VMrSRiQHHy1IfOFNgIhJBuew4aa+bzoYEQiURFvzfuY35jhC8ZmvzP63uqDyObnTEPw1tPlJK
 NjlOaMqNxplC8il/61Rj/Lc3mhX2uSte/tj0u4ArOzMhKezg3GsCLCm
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the DSI host found on SM6350.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e6c1ebfe8a32..6f367a1fabf8 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -285,6 +286,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.1

