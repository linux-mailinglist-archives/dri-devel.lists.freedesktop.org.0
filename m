Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A860B636F27
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B4C10E671;
	Thu, 24 Nov 2022 00:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DA510E66A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id n3so246217wrp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cozmslkV1HJ5ORZW/fLPcfuOLJG0p6+yjVrLX810OU=;
 b=NCtYnaGXUXEow8dtZclqy6wSoHW85K/gfhLzqpZpmDmMdQoo/248yXtDpGkc6ehSnZ
 sMn8ivZedEl4QV1vWgjHsTIbzTlPrfYIFG8C8xPyLCp1O5t9J2846hsPEK2CO0zYeJ5z
 RGIcs3pUXwpyxo+cXWRDAtXMgWvotmj5veWReeqN0e2awrDi3TrHa9dGq2DkOte0QHt4
 G/x6xwBW2Qc/kv6S3KF3PJ1OQeCRqryE3uchHFNTWFoeKwrtmKK4bzXsSR897nA6OaEj
 ruIhzRbUAEg4/ddzeOzGO7U3aaRMEBCmbondyqFXb9zOBvEe2BrX1Fmd5G4DXCdL3TmQ
 WJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2cozmslkV1HJ5ORZW/fLPcfuOLJG0p6+yjVrLX810OU=;
 b=OZc2lGCzerZhc4BOiMozxff3v4wUz+fe17eZXcd2gbMMJl7aZ272nzP+dga9TzYYYe
 Fe7S3DKn/KonzFpAJR5UZn7sGe7kIEBPPuNvGvXeV+TlwOONnU3AKEq3dl6zEVCQ0wyb
 pTl2E6bEKOt6AnJnUv8TU26/T2DF033hTtveXj+OdUC0py+OYsSyRoUyo5Nuk2W4YGvU
 FeKqi6/Kp3R8xJWATUWIkxMNpAnc/Fh7vILryCldVSCYbp8bfFKM4xwjZNes1lOgGpfo
 2i6nXTwY8jACkCnISyudhdSI5ccOYACMGjiNN1KTYe+mncL34TvvEdL3RGzWh03tFn7X
 WNmg==
X-Gm-Message-State: ANoB5plmMICwBvhdSBu/ar/PwYh1PLkdZahO5EeWV4b+KytIIsv86H8V
 kezPbjrxRvb8T0zHfAuhP2q2Gg==
X-Google-Smtp-Source: AA0mqf7gWy9dLJkORYXwUKApzl58c0COI+hNsY1/jGFqtioTMSjLfmaAqNohwv6mu9l4g5RAZKCYNA==
X-Received: by 2002:a5d:5965:0:b0:236:7148:4b98 with SMTP id
 e37-20020a5d5965000000b0023671484b98mr18152044wri.229.1669250887071; 
 Wed, 23 Nov 2022 16:48:07 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:06 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 02/18] dt-bindings: msm: dsi-controller-main: Fix
 power-domain constraint
Date: Thu, 24 Nov 2022 00:47:45 +0000
Message-Id: <20221124004801.361232-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 agross@kernel.org, dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

power-domain is required for the sc7180 dispcc GDSC but not every qcom SoC
has a similar dependency for example the aqp8064.

Most Qcom SoC's using mdss-dsi-ctrl seem to have the ability to
power-collapse the MDP without collapsing DSI.

For example the qcom vendor kernel commit for apq8084, msm8226, msm8916,
msm8974.

https://review.carbonrom.org/plugins/gitiles/CarbonROM/android_kernel_oneplus_msm8994/+/7b5c011a770daa2811778937ed646237a28a8694

"ARM: dts: msm: add mdss gdsc supply to dsi controller device

 It is possible for the DSI controller to be active when MDP is
 power collapsed. DSI controller needs to have it's own vote for
 mdss gdsc to ensure that gdsc remains on in such cases."

This however doesn't appear to be the case for the apq8064 so we shouldn't
be marking power-domain as required in yaml checks.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 27ebfd5ffb22f..cf782c5f5bdb0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -134,7 +134,6 @@ required:
   - phys
   - assigned-clocks
   - assigned-clock-parents
-  - power-domains
   - ports
 
 additionalProperties: false
-- 
2.38.1

