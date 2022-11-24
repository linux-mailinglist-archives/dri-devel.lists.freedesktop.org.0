Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52235636F45
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A55210E672;
	Thu, 24 Nov 2022 00:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA90B10E670
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x17so242574wrn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3eO0tOz0zwXGw3TOZj4ZrnPJ+UUmohAjz6RImQ5MpXA=;
 b=I11XwzaEC+ir6A/K95aGzWsdpEp61vD3pFNkpvU4mVi3BC4N4n7ZvwuyozHApiUigC
 qXzOG86bfe1PGX1/cl9CyC/Oroxv9LNWLw9nz4kTcU4RdoALJdfqlBNlWrBGtTunmba7
 itwgKYDmITMGAwheA1RuaVXoo9kFRhgdbJoNTuki5KNPbEkMyYNaGR1WhWW9/1JQcE2T
 ixXEg7UXqPNPRm1SdRatw5oWwlv9yBlCPCQaRHOlaXlNxFQzT1NExBPKuZOiVWdL6Jvu
 yXTFGau1HwGpckNaTQs1PgbbctMervYDipU/qiPUctDZlLU6+mzRIpZ5B12Sap2chZyF
 HKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3eO0tOz0zwXGw3TOZj4ZrnPJ+UUmohAjz6RImQ5MpXA=;
 b=z96kW5W9ST7wrUU+qyivrXGn8ngQRDg7Zf9JZkWAnwH+1lvzgMM6s8LSOusmtc48nO
 otIG/hX6xHt1fbZam1Ppg3dCsW1SC3KgblierUqtrPoD26DzSC56D6KNU6QrJcG7ShAj
 mK59nXDczh4GU/0RCnXLmzWlTSsqNYspwRtWNGberhWQd6Bsg67B14329nkJwkg9vMAa
 yGTrJK9ECSw0DsQq6Mve0fKW7a6pdLA9dXxQGOpY/gposvlhvQst96DR5NqF1pgc7CvZ
 FvX4c+bti6wue9eufc3Dr/FQwp24c90oK5x83DFzBiqfSXJBTU6ZqJLGrl8tAaiBUYvK
 wDLw==
X-Gm-Message-State: ANoB5pla7yMoeCrVX1gjWbZZkYnjbiikpSn+W7aGqwHI7dTKzG4GEgLg
 q74sOJtpynGsoT3mkMEIYt7grA==
X-Google-Smtp-Source: AA0mqf4yy73QVZpMXWfU9xi9AHxR0nf+n1BO+7UBbflLWuG69yiXRQYNU/eR1741JbBoa77+rdSKkA==
X-Received: by 2002:a5d:69c4:0:b0:236:c206:b2b1 with SMTP id
 s4-20020a5d69c4000000b00236c206b2b1mr7894471wrw.624.1669250893312; 
 Wed, 23 Nov 2022 16:48:13 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:12 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 07/18] dt-bindings: msm: dsi-controller-main: Fix clock
 declarations
Date: Thu, 24 Nov 2022 00:47:50 +0000
Message-Id: <20221124004801.361232-8-bryan.odonoghue@linaro.org>
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
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When converting from .txt to .yaml dt-binding descriptions we appear to
have missed some of the previous detail on the number and names of
permissible clocks.

Fix this by listing the clock descriptions against the clock names at a
high level.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 0c09b9230b7f5..0fbb0c04f4b06 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -36,13 +36,19 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Display byte clock
-      - description: Display byte interface clock
-      - description: Display pixel clock
-      - description: Display core clock
-      - description: Display AHB clock
-      - description: Display AXI clock
+    description: |
+      Several clocks are used, depending on the variant. Typical ones are::
+       - bus:: Display AHB clock.
+       - byte:: Display byte clock.
+       - byte_intf:: Display byte interface clock.
+       - core:: Display core clock.
+       - core_mss:: Core MultiMedia SubSystem clock.
+       - iface:: Display AXI clock.
+       - mdp_core:: MDP Core clock.
+       - mnoc:: MNOC clock
+       - pixel:: Display pixel clock.
+    minItems: 6
+    maxItems: 9
 
   clock-names:
     minItems: 6
-- 
2.38.1

