Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F460620438
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 00:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F078F10E3EC;
	Mon,  7 Nov 2022 23:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF61C10E3E5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 23:57:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h9so18571088wrt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 15:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fKuGmPk1NWjFYE6G+xAiV43cbF23XemWP+03+XF+NtI=;
 b=A5slQpahUTnb6aWaJNgpTrX++hsgRb7B8m1RFqmJMYSGjDQnHdS3vdMBMDH8xmqFrQ
 DfaXqX4b+uUngPKVn+7B2dSfKsW9GlabJJlSxjUiLBOgSOBS8rIoHc4sc4FbtTc+YjDa
 +tkE0HwjdiXFPglslTvWU4GE69DixukEn0Za9pqqiPmZUj/4aL+rlu0eNc5IJqWY6cXD
 7OybnSeQF0zFTDo0Ucs8rw8sb+9rpAmXsLHUvjIicKqfZDvWRjdyufRVgr9poKddbcOA
 ouI8Mkmuhb8BH0IuaC/hzzrCSOF3Bl7HlQoWRa8bMbGGZW9FthFF+WHbHg/e2l7pxXkt
 xY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fKuGmPk1NWjFYE6G+xAiV43cbF23XemWP+03+XF+NtI=;
 b=wlAmZtTTPp4VShx/vUgBbsrRgB9bx3cWcpc4ZEZW36X41un1Cc+Ed4zBgC/EgA+t1x
 3x39+r3XX3uhVrjdOH9pXoEB/1xezyAkRu3ItYNg4MyEDm/S9rMWe4n1ykc+8YF28UX3
 W07WvnmnMRgA/TkDcA2V1K5hKRohAutSmCBrUu5lx/gzw5fP/2N/DqnlJwOyukjFiMYz
 skmBkdJu4KSArTq1RjpnWXXol9fBstfr6R8xLSAn5NbikGewIbEV6xs7XVeAfKjadINM
 GkV4+2R1mjvcruZIFIEm7lFJ0iSv5Px01NZvtQGJru4HGs5MttA+SUgQbRdi3J/9e7Ve
 XYFg==
X-Gm-Message-State: ACrzQf2lISumRr9WVOXwHNl0NiNG6NcIXrw9/VEcYmT5fAd/FaEFnZik
 yhNAlMlrqC8kMli1AFEwD2xE9w==
X-Google-Smtp-Source: AMsMyM6zX41cbM0aON4aZqPSWqm7kQ9bn/74+MZykNz0SW2DqRu3GdEhlzlP/3XpxN+bxJxA+FBGNA==
X-Received: by 2002:a5d:4f05:0:b0:236:a65e:3762 with SMTP id
 c5-20020a5d4f05000000b00236a65e3762mr31983928wru.156.1667865423999; 
 Mon, 07 Nov 2022 15:57:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 15:57:03 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 07/18] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Date: Mon,  7 Nov 2022 23:56:43 +0000
Message-Id: <20221107235654.1769462-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we do not differentiate between the various users of the
qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
compatible string but, the hardware does have some significant differences
in the number of clocks.

To facilitate documenting the clocks add the following compatible strings

- qcom,mdss-dsi-ctrl-apq8064
- qcom,mdss-dsi-ctrl-msm8916
- qcom,mdss-dsi-ctrl-msm8974
- qcom,mdss-dsi-ctrl-msm8996
- qcom,mdss-dsi-ctrl-sc7180
- qcom,mdss-dsi-ctrl-sc7280
- qcom,mdss-dsi-ctrl-sdm630
- qcom,mdss-dsi-ctrl-sdm660
- qcom,mdss-dsi-ctrl-sdm845
- qcom,mdss-dsi-ctrl-sm8250

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index b35130a77b43e..9db3e63acda3d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -17,6 +17,16 @@ properties:
     enum:
       - qcom,dsi-ctrl-6g-qcm2290
       - qcom,mdss-dsi-ctrl
+      - qcom,mdss-dsi-ctrl-apq8064
+      - qcom,mdss-dsi-ctrl-msm8916
+      - qcom,mdss-dsi-ctrl-msm8974
+      - qcom,mdss-dsi-ctrl-msm8996
+      - qcom,mdss-dsi-ctrl-sc7180
+      - qcom,mdss-dsi-ctrl-sc7280
+      - qcom,mdss-dsi-ctrl-sdm630
+      - qcom,mdss-dsi-ctrl-sdm660
+      - qcom,mdss-dsi-ctrl-sdm845
+      - qcom,mdss-dsi-ctrl-sm8250
 
   reg:
     maxItems: 1
-- 
2.38.1

