Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D428E562CAF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409C410EECF;
	Fri,  1 Jul 2022 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E389411A2BB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 u12-20020a05600c210c00b003a02b16d2b8so1531314wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DyPxfEgniN5NAuSTp0u5CFD7e7/QLtzxkjKqP7SWLms=;
 b=KYn84+/cfSOH4MzjIixeA5hWyTicZ6TpkqLzPVy2guLoqeA3aeEWEtjfwJYiMFL17t
 NhpDQaZH68tZAJd5cqFWj9FWa9KjLZ6shKcHDCrrewAigvKxo2kl4VCvVaYraX9QthyM
 AUFbgPAA7jyGrlCJLXAcfecgwi+uyaasntwYX1K3jXJDqZ+D0e/GOr0W5lAoGnIwaU5h
 CdeYkWDqZJus41Wslm1cpfrudhVYypccQUUiI+SvWzKbzpKWGPug0egBiIzhcy5aSfrV
 wiY01A5rRMSU0lOKZ2ve5ibEzloEGiURINYaIa6FrYmy6Rl+cGtNvf8q+QiVtIwZy5vj
 b+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DyPxfEgniN5NAuSTp0u5CFD7e7/QLtzxkjKqP7SWLms=;
 b=sMTPN50Ox9hDl5xAexFq/lrIXYpiKh/C199cj8UMf1og0bTRAcj6tnlhXCQGOI/x3S
 5tyb7nNtR2K2YnbvqQLyWv440DtN75N5a1uAifzGStY97yxKSwGmbLjmJQGA2gDoxAYR
 GkQGyT+xyB2vRyP+hNd1/2SpMX7Coj3EZGww7LFJXXaETGV9jAVoq6cjMRj/k4b/rv65
 navX8RtGXMx6ytAUxrY3YLtwKgX98mhnghXbC44Rop2hld0zzPjKg50PdfLmht3A2P6r
 xhQGavR80Y8U3E/y7xHHJdDXUA3ccRRIkcxGWqastd8HHO3Y0FBuWVpib8cJPxmxGUIv
 f4uA==
X-Gm-Message-State: AJIora8cUowoOK3HfezXmM0EbugBveATe4y6ba3Eds0hmyl6Pxoqhhis
 PQaT15Bt0c8szySjd1fCjeShuA==
X-Google-Smtp-Source: AGRyM1vMKCCLOxQaWrm/VzD2MG3JjZP+mwqBUGB9LgYbHwney0SzT0Gq4V/cF0E6OuH5UJ2GT8brlA==
X-Received: by 2002:a7b:c741:0:b0:3a0:5473:efc1 with SMTP id
 w1-20020a7bc741000000b003a05473efc1mr11942903wmk.201.1656590934390; 
 Thu, 30 Jun 2022 05:08:54 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 5/7] dt-bindings: msm: dsi: Fix clock declarations
Date: Thu, 30 Jun 2022 13:08:43 +0100
Message-Id: <20220630120845.3356144-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When converting from .txt to .yaml dt-binding descriptions we appear to
have missed some of the previous detail on the number and names of
permissible clocks.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index fd9d472437853..b24ba6c346a77 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -28,22 +28,31 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Display byte clock
-      - description: Display byte interface clock
-      - description: Display pixel clock
-      - description: Display escape clock
-      - description: Display AHB clock
-      - description: Display AXI clock
+    minItems: 6
+    maxItems: 9
 
   clock-names:
     items:
       - const: byte
+        description: Display byte clock
       - const: byte_intf
+        description: Display byte interface clock
       - const: pixel
+        description: Display pixel clock
       - const: core
+        description: Display escape clock
       - const: iface
+        description: Display AHB clock
       - const: bus
+        description: Display AXI clock
+      - const: core_mmss
+        description: Core MultiMedia SubSystem clock
+      - const: mdp_core
+        description: MDP Core clock
+      - const: mnoc
+        description: MNOC clock
+    minItems: 6
+    maxItems: 9
 
   phys:
     maxItems: 1
-- 
2.36.1

