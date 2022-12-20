Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A06520D3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50BD10E3E9;
	Tue, 20 Dec 2022 12:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79B310E37D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:45 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id co23so11606538wrb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFSiXEp/F81I9rA8oyYkmW6cQulf46aZV7cm+NnbXns=;
 b=c8e3WBKo9a1OtUkjjTp9eBaKaFfiMlh/R5UX0kgZgfi9v49CAAdCoPIZoaoU7PbIzx
 MrON+bCxS0OvO2833qm8tOqB0JnTrCExHVR+65jfzwZZCYw0812YC+nmwSR9oQu0yvQz
 qBlO1nsi0p2GHRCAD1laaut9JRWjAlHOQtbLrH8iRC2nuKrMGCz35anyp19xSXDGxOgl
 /FqrpUpqUV0c2TUhcJP3BWmfz99NZTBszaDwOl4U284TxpYpbVNYk4M3EBTn6gkPjBh+
 Wn2Tz4XlH03OSsRM7X8BgnLQNXBxjNj7MLXIxjMDydIgjkvZFp7AbhrLCaYM92dKls0F
 IvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFSiXEp/F81I9rA8oyYkmW6cQulf46aZV7cm+NnbXns=;
 b=H6FYU16HOsh7AYVhlHGskAC+pfCoPlJgvcoXoldd3AITs24tVNSUhnZYAh881OF1yy
 KGWElyEGI4h0gUtJVBQkUq3/gv+SzbVn8ePePWYpVGLI59c0LA5qkjeHGhLc52Brkd9c
 RMdG72aJZ5g+ayGxQHpBjvY9PAKQ6sfol+8twK6vpOlfODgLVE4geoUH6hL6jLr/i6+5
 cMU+8Fhgac8Z0aNWIRdB1xcp/lBlLkPk4X5L1WwY4NUoXlrgkDfTf8f4xkq0xBSuvI/4
 4Hs4HxQ+iuYp51Hn0pYT1nm3Mu27k3bKM+FL/iuL7pLtQeVMq5by6khMyVvheOcd2K0n
 Z5rA==
X-Gm-Message-State: ANoB5pl/F+oZJRlVzMyo2KRrDFNVHMkkEI0SnDWSUKDzprDJG4ZXsx41
 oJ4NhzFXDz/xVzNb+HehuJdwXg==
X-Google-Smtp-Source: AA0mqf7+GSrjWRgSJIptzklKTRg+Hk2DgWMf0VY7MsFeUzZMDYtNEYOoAY8knKPM3DTwuGHGeRQfMA==
X-Received: by 2002:adf:f802:0:b0:24b:b74d:8011 with SMTP id
 s2-20020adff802000000b0024bb74d8011mr27693857wrp.6.1671539805263; 
 Tue, 20 Dec 2022 04:36:45 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:44 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 07/21] dt-bindings: msm: dsi-controller-main: Fix clock
 declarations
Date: Tue, 20 Dec 2022 12:36:20 +0000
Message-Id: <20221220123634.382970-8-bryan.odonoghue@linaro.org>
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
index ce103e3ec4db3..4116b3010219a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -43,13 +43,19 @@ properties:
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
+    minItems: 3
+    maxItems: 9
 
   clock-names:
     minItems: 3
-- 
2.38.1

