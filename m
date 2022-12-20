Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B967F6520AF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF41810E3B3;
	Tue, 20 Dec 2022 12:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B3E10E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so8655967wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+Ok/Y8Pr2ds0xVbkzxTKyFSBfTt/36m9CaPlTa4hTI=;
 b=Ag1chGkW8b+L6VHPtMej8JYigTy4MJpq9bKbqyfbscX949mD/b1DQh1u7rZ0YUA72a
 DYpejL92sBjCMJ4cSf0UjL4aVuySRIE7A78VGq+pWP2agojIl7kKufLjRoEe7ADrrNc+
 T1os/kTg5MJ4cmk/LcNEpRDf1f5M+09GI/YP99Op/Ep+1gVRzAhHxVrsxRFWis9LqBFY
 r8s8yjwoDnBT4w7dLISdmxSAU0FOTCgzrYkA8JVa00QpiF2MCO8/uOIlLG6w57ePuDwi
 buHZhv2+Rm+Juu4VhZf8EH+Jq7ANjWC2WupAosZk1GaSFuqvb9CRG6qgU43bPygym6i4
 NO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+Ok/Y8Pr2ds0xVbkzxTKyFSBfTt/36m9CaPlTa4hTI=;
 b=sStVPkfK6iRPcKV5BO9ii0hS5yMiaixErySkjMJIan/Bnsdiq8kQbqxDakxZk0vt+Z
 EwCQNLaYmCqDOvwkfMfQ8J7GYEIb1tT31WyImfEhB6cPQ2iFoeu0240wxMzZxjN136fF
 TqC7pkvSvuvrKROp/hjun/mNKRyEJmqFjK4OquH3z/wQqQTSveJ9nDlXsNEX479BLc/f
 eKm4A+r3kC7BmMP9VpiPif8o414tbkQtMkbxuhIZNkn+MZ3gtSq7qiAjTm8YWLpOO+AA
 hc/gF/3nMpqx0HpgS5fISEa+jQ3mIAuOE5yA5LDFhuCtE7O/zuQVzoYWof7EY8T6ARIF
 T8ug==
X-Gm-Message-State: ANoB5pnteL2OP5N3VoZjov1wkGjTxuETGWgRMr6gkbDLJdNE/R8KIdhE
 ZMg59sOow3pRa0L+90ta26/NZA==
X-Google-Smtp-Source: AA0mqf4PxgQM04G2ksh2FXeAbW88jOU2n+w0+LzI66CabwqjcV7HzBb9OwQuhQwrv1iFoIAvaAAg5Q==
X-Received: by 2002:a05:600c:42c2:b0:3d2:24d2:d02b with SMTP id
 j2-20020a05600c42c200b003d224d2d02bmr25615593wme.29.1671539799584; 
 Tue, 20 Dec 2022 04:36:39 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:39 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 02/21] dt-bindings: msm: dsi-controller-main: Fix
 power-domain constraint
Date: Tue, 20 Dec 2022 12:36:15 +0000
Message-Id: <20221220123634.382970-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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
has a similar dependency for example the apq8064.

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
index 55bfe1101d6f4..8ba61fef576a5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -137,7 +137,6 @@ required:
   - phys
   - assigned-clocks
   - assigned-clock-parents
-  - power-domains
   - ports
 
 additionalProperties: false
-- 
2.38.1

