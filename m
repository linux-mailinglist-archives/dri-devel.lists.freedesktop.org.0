Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F056CDFF
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6641E11BEFD;
	Sun, 10 Jul 2022 08:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818E611BEB4
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z25so4258782lfr.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WZU55ztxCr9hrm/X9mq0W7rnO8DhBgA9l+GjYiiRXCk=;
 b=j7WKH1P9qrMtVfM+BgRoq05JqWY9cqgdDSOY0uMJ+i+8vwStr6I3MUVM2F/0mo/bUn
 SRQnXsUNDz88GLtbvVdJknG/dcAAY3PhVKkvsj/NJbuQbxyk6L3hksHvGDEDgSGUkzYz
 OTCvxU/U/EqnQUgDNdO1/bBL87VtpycpRHXJO3EecLnuPnLC/meVtM6JmLc7ZsDUM1Xp
 Pu0Azk4GUHVoOAQHhPPDRfHw6TfHz+PKCpedDEl3vvE2OOhOapqMh650MEQa/IbKocSc
 FQHjPK89bsHYItgUfUEyRUvnNHs3VQKamH1aNwj6U6A7mDEhCP69LjegN8zYxKva8k3u
 Js2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZU55ztxCr9hrm/X9mq0W7rnO8DhBgA9l+GjYiiRXCk=;
 b=3NJXmjbHAKnga2EzFTlDMh4rGTThdwylqcp+Y1/bpkxTg9HeSN0VF9SP0KG70d+iSX
 1RBuWPVMkm/HSecr2FSf+D891Vp+HaoBhWFRnw764t6PEg9fm2evMm93b3xmcuMgAvT3
 o1mwIS31F3+Ecx3h98Hl1lAxVyLH0AOzVJr823Zaymco9aZMjTovWTsvN6OJ0HgQP5eL
 2vBuiwbLHqDw9u/+Cu7PYviFXJ8GmLaZdLEapEB1keoCgPIC2MeK5j3lbf1kFmwuk8iB
 j/TTlXty6PM5Abu+e2+wqqzjboqqJcudfp1k0FVxGPfooets3iedSpxw7C+mDsp/uOwX
 7atQ==
X-Gm-Message-State: AJIora94xTA3tesdWHMPt3oQGORTxagkbT2QpRSbFc10jYBCnGDl/cyl
 NKyUILdqUIr1CGqyBdMjloUvDA==
X-Google-Smtp-Source: AGRyM1vxQa30p97YqLFfiaEcWr22TJ7iZraKSZ6N1/3jsyAQ35Xl5FJKJAdTXadD7Mj4DfudYkLbbw==
X-Received: by 2002:a05:6512:2306:b0:485:8e08:5740 with SMTP id
 o6-20020a056512230600b004858e085740mr8320796lfu.354.1657442503707; 
 Sun, 10 Jul 2022 01:41:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
Date: Sun, 10 Jul 2022 11:41:32 +0300
Message-Id: <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document missing definitions for opp-table (DP controller OPPs), aux-bus
(DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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

