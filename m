Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E84638A19
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2D610E756;
	Fri, 25 Nov 2022 12:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2ED110E0FC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d1so6552412wrs.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/+izB6qlYb6bRq2XQ4xWOaK3HaQF+2lrKRrNqk2qGA=;
 b=WdkkM6Raa2y5wKVJnAb2QuYjYxFIVyIoTSXPixv2QH2pBE1MsILzeZvVymmcyjWEFB
 LrZO4ouNUCnQ4c2SeTO+WMDzfOW9mhyTFT7IeLxoHTvHg5ji6Fjc7ZGTDPg7eyclDwkl
 vqwuKKpZuGC4gn3WyX9BJdZ6gq556Ax3q55HzVny5lRzx7PJyFt/76UgH1HhPjnLd/9Y
 uHK5LqYEZwN7DpyAe68R2hkotTGvcB+DJnGJBv7P8Q8Xfiio2j69iDPgnmc6fg3fPs+l
 rQJV4/7uzJb+M1IE1w0mAaV99o73+EwHQMCaEB4DkPIzizQEkjzPMReBGGZ9K8eBX+NS
 hs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s/+izB6qlYb6bRq2XQ4xWOaK3HaQF+2lrKRrNqk2qGA=;
 b=113KxYbdkJlmrbMDeWsb0/uFoCqt3ZNgw0xL2jkXqOsucXd67Hy6+dP2gs3bWOC1AM
 eoi6492Fpxnf5hgyKhspi5gQ94lD8zU4NLvDMxAIzdMvM3tmtE91W/609QbJGnPgGHjn
 eroqGVjcP0Gq1oGHC8s824fposdz+f9VgpH6TKbBVc9mo18xUKLBNGy0xn2uT0fwH4Zz
 bcVh7prsJNP22OaBoJtOEJnKYMUJPypahtoCcxqA3WNn23Xsqu4JQLLCmg5Ex/wZ21Db
 Mf5RpUFp0EfA9t/v/dv5CEdPmbq18aLba51A4ryz2+rkksqm6I5gptGVUzbLWogtXAyZ
 YUUg==
X-Gm-Message-State: ANoB5pnkXmPkRmSrc6AHVEriW6YxppR2uG2kgNiAfvhFk1RyEcLPMQAZ
 YbYvZQq4E9JiFjdLV0BI8fFKvA==
X-Google-Smtp-Source: AA0mqf43iH2mEg7O9lv/d3pAnLcJHfWRmPPVAGflWp9REiyt6YZ2arB7njdS/RqA/YsQoxJ20UxZeQ==
X-Received: by 2002:a5d:570e:0:b0:241:f2e2:57ce with SMTP id
 a14-20020a5d570e000000b00241f2e257cemr7235575wrv.308.1669379805111; 
 Fri, 25 Nov 2022 04:36:45 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:44 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 03/18] dt-bindings: msm: dsi-controller-main: Rename qcom,
 dsi-ctrl-6g-qcm2290 to qcom, qcm2290-dsi-ctrl
Date: Fri, 25 Nov 2022 12:36:23 +0000
Message-Id: <20221125123638.823261-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We will add in a number of compat strings to dsi-controller-main.yaml in
the format "qcom,socname-dsi-ctrl" convert the currently unused
qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index cf782c5f5bdb0..67d08dc338925 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -16,7 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,mdss-dsi-ctrl
-      - qcom,dsi-ctrl-6g-qcm2290
+      - qcom,qcm2290-dsi-ctrl
 
   reg:
     maxItems: 1
-- 
2.38.1

