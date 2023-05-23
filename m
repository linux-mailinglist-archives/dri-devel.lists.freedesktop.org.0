Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAD070D5BA
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 09:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3269E10E3E2;
	Tue, 23 May 2023 07:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AF110E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 07:46:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f3b39cea1eso3912117e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684828008; x=1687420008;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+njLtj9xbvOIFM7dHEkaORkCFR8dY1HcWLWxadiCjHQ=;
 b=Ca41ZV4waV6Uvc6gbu4pZrI2mHbyuon3JyERErRwlIMz8bbiqKkSw7L5Pg014npL1L
 EDi3Y/IoFSKGcYb2rBHwgqFdvhGBbOcdw+up2yn36KaS90IWDopz/4uXtiLBcyiL9alB
 NK6xxXQXqhaqLP9CM5n2VZwRc7BnikVpLr9e8UkDy5skpEhuy5/qzdWBmCRyZmrFX1ip
 MoBO7k8ijb+TKdliYMXCfZvlFig8bcdjXKnROmW8sTwxFaQY74Fm4ChZ0te745lY8uI+
 dd/b4LSpi+i5ITgHE9j8+tZDJnQpVXIaEKhX+eY7W5fsAEZ6jCg14jlKxcUND1x2IcZM
 UR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684828008; x=1687420008;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+njLtj9xbvOIFM7dHEkaORkCFR8dY1HcWLWxadiCjHQ=;
 b=WmERrMNos1L2rLY/l5o6FcA4ECY6GbhF0lkTZdrRgCVLmhE9Kk0OGsZP9I9MguiIlR
 i5W4Xs+CVyYnKInpSm4Guum4fFoBcu8Iks4rkk3lJeWouA1syJGMurQFyq6luVLiwNZo
 saAeRvfNF0TyEQWdY9UgSPoAljz5jz6KixAFzzfIRob8K2H6YT5XqFmcCel9EhqsHchz
 yMTTHhF7f1PVRc9lE58YfHtrBFxkkaH4VmCTbjlKMFXG6PtRNJDNPSY5ehvvhTFi+aBb
 0qJk0foJ3Adq1tt7EDjWNoQ3qieAUfv1y5271U/0pWW9/lATJqKLRx1Nm8WyUYmm4z86
 1vVQ==
X-Gm-Message-State: AC+VfDzqGKCBVXRR/8CSDkZS0t9cWujT9biQ2wEPetrHZxF562SHsR+F
 oGk/k9YN/I/Wz5fnyt3DKQdg+w==
X-Google-Smtp-Source: ACHHUZ6Z1IporAEVTmntbzww2mlpou5nSlMKw864voVy8UcwTx7EkZjpX4C/Gxnrt4UFoN9aF+FP5Q==
X-Received: by 2002:a19:ad02:0:b0:4f3:7b3c:2e16 with SMTP id
 t2-20020a19ad02000000b004f37b3c2e16mr4243599lfc.39.1684828008720; 
 Tue, 23 May 2023 00:46:48 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 00:46:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 23 May 2023 09:46:13 +0200
Subject: [PATCH v5 02/12] dt-bindings: display/msm: dsi-controller-main:
 Add SM6375
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-2-998b4d2f7dd1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=1145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1vb4mQXJIaOy+L2bFISsNkN0kUA69WSBSqQBJvQrOv8=;
 b=CBoqH84rn/pGKj9+tRprI5mq7KUtB5xc8n/iP2tnHJB7nuo3bD0S+ruz8fSKu0FIa/VAcT8yg
 /AEykRyGeNKCgjUs5bmGWxRpZkDJKXvjg9dSfvoyQFAbIoAeaTXT/oR
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

Add the DSI host found on SM6375.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 43f801a94d79..0cb1198eb3d0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -366,6 +367,7 @@ allOf:
             enum:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.1

