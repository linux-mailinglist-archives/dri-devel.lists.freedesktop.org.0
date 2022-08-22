Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D0359C715
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 20:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FC68DFB4;
	Mon, 22 Aug 2022 18:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C180D2B537
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 18:49:03 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id s1so13757521lfp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dWcAQPlFiDTPwWK7n4iS8GW3PtmQpffctMl/XuHtJSU=;
 b=WXYbtgqD5iuwgqkyug6cSYXqb9xeK3mPLjONSNskdNMTGvzU+6xFXAX3oSaVtzNM8o
 /MNyzOx/9uMTnAf2Ez64bUd5R2xiBSKni4O37jq4BLcBplB4BT34wl8Yx8VVr3gNlcB9
 oCxMUuFWrBtPSF+lSIjuSQ6S+ybz4y325+BqbbABgughmFsNscU5geUJxoNMB9QGPRJt
 bGjm79aVDzjaCv5ZYVL+qLi7E1eYWAryU4NzjBLEqM3fypmJyzV7nNaIPtF0pvaLjkG1
 d5/baw9lNFdOGYbOny2dnJL9CE9BCQlUp0OZ/5551M+wwlfq+bB/qLcpLzifjiA6MDsp
 QWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dWcAQPlFiDTPwWK7n4iS8GW3PtmQpffctMl/XuHtJSU=;
 b=TGriNgxRWlwe9LaJxd9Zv5UHjGcoh7H9h/tZXnE6/a9qR/0bwd/X2QRmS4J+VxEBFJ
 cXHa2pvqG8X6mivHGX91yck2E+PZQrAV5vRUMIAeLxbt4EcRQPDug5AbgA7aI6xs7ZZo
 jO5XKZcbcEG1hJ3NPE21760hhtoXsj6+a1rBN4hxAlVNXOHgziwvt5aLC8Zd8NoYCo9F
 1cBQF+HP7m81AgbI5zPR2a99HiDG/a37l9lvUTLPrlR5BWARyvp8Fy31er2iANjffte/
 CXofavHCTq6y/FosfKZsy89w3JLeALLZzrrfJARQXyIByIeK+m8v9jJP5l5cdnUC0noB
 NqPg==
X-Gm-Message-State: ACgBeo0ZN2DDRheyw9TPhvEMDTbwEzqNIBHqzVon5cmtlMQFbJpNkv/J
 OtFWTEYpILYg9utYV9Ct1cSR+w==
X-Google-Smtp-Source: AA6agR7L7kUQ4S+k3CQDkWT3Try4H2IES1dU4EH1574IZqzTB7lcU1gVn8iADJr/PhOO1cvh54NiEg==
X-Received: by 2002:a05:6512:2385:b0:492:e4cc:17ca with SMTP id
 c5-20020a056512238500b00492e4cc17camr2294054lfv.132.1661194143269; 
 Mon, 22 Aug 2022 11:49:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 w11-20020a05651c118b00b00261bc05c461sm1672599ljo.50.2022.08.22.11.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:49:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 2/3] dt-bindings: msm/dp: add missing properties
Date: Mon, 22 Aug 2022 21:48:59 +0300
Message-Id: <20220822184900.307160-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
References: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document missing definitions for opp-table (DP controller OPPs), aux-bus
(DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 391910d91e43..52cbf00df0ba 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -70,9 +70,21 @@ properties:
   operating-points-v2:
     maxItems: 1
 
+  opp-table: true
+
   power-domains:
     maxItems: 1
 
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+
+  data-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      maximum: 3
+
   "#sound-dai-cells":
     const: 0
 
-- 
2.35.1

