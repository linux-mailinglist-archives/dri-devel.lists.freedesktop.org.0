Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117313C2AA2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 23:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E5A6EA8F;
	Fri,  9 Jul 2021 21:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B4D89E86
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 21:07:35 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id k8so10115261lja.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 14:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hJEW9w0y6Vcyes9owQtz9S/0i0lXig3Az7cXFopBjtc=;
 b=fErVVr4pfIJbVtUKRHnaiRSwiESw88MXK4nJOMrQurA3qSPw+jY8bZ7yjI0gwd8IcA
 Z0Y9hswzeZlcQINkON1LTwNJGPzPwFkFjkioN0yYm4bVKTQJSbN7rKbcK3kHfHfOrGEF
 s8eIlFTqWE8NVoVmXDfTK8o8YgUnlvq9pxg5UfvlUQsHTZUtHtQR7RuKOtJB27pdxDaq
 s38BYWqY66kmHU+Hk1s9uVptda29k3gyzDeDP55L/YPk4BYTmFkgQzDvSpaBCruR5sZg
 UoLfxq9JOioajcPf2PhCaWZA5FsUHeBHZQOkz+Xahi713/PersOMrDO5A12kVOY1wx6q
 jx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hJEW9w0y6Vcyes9owQtz9S/0i0lXig3Az7cXFopBjtc=;
 b=YBW8C1WsQFFvuChfwQ0JdwQsMxETOomCq/JaSWQDNCampkhGYw8JAjBr+dw07EciTB
 QW4kv//AgVkQGwPgRfCTR1JlRwpngQLq3SUlY4PQr1dr7obi+3cfCdCjVmJPq6tSw3UO
 C2qIDOBT1BdbvrfX+3sbVZ8n+5YGzwa0JiUkAG4QAaUTjs0icJEho9atdOn/UlPEa/9/
 o1JZjgp5faLFLZuc2xUqXgap4gJtHcZmmET1L1FoxF8IU/truUWjrYOc6daC1JKauiP7
 w4G5IGlGrtaBgSDU2ljR3H6Kv7CEw2wq4qQenqGEVPkh2UIV4NjTrmXeWMX9KOxolUsU
 KrZw==
X-Gm-Message-State: AOAM5326KdB8ezB7fxS7OIAlji2BTq9pOeh81a5wLL5ybh4uNP6MBoLJ
 C1cBY4CqtkpNFzFq3c+qC4p4fg==
X-Google-Smtp-Source: ABdhPJxwEU1JXAYF23cylO9ydxaJi+pRUDC33zBTaCd/tXUSJbSPQBQH5TQCHFNqw+9C5KQLXr0Ddw==
X-Received: by 2002:a2e:50c:: with SMTP id 12mr23647928ljf.173.1625864853431; 
 Fri, 09 Jul 2021 14:07:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 14:07:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/8] dt-bindings: display: msm: dsi-controller-main:
 restore assigned-clocks
Date: Sat, 10 Jul 2021 00:07:22 +0300
Message-Id: <20210709210729.953114-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restore the assgined-clocks and assigned-clock-parents properties that
were lost during the txt -> YAML conversion.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 76348b71f736..760eec6b0db1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -64,6 +64,18 @@ properties:
       Indicates if the DSI controller is driving a panel which needs
       2 DSI links.
 
+  assigned-clocks:
+    minItems: 2
+    maxItems: 2
+    description: |
+      Parents of "byte" and "pixel" for the given platform.
+
+  assigned-clock-parents:
+    minItems: 2
+    maxItems: 2
+    description: |
+      The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
+
   power-domains:
     maxItems: 1
 
@@ -119,6 +131,8 @@ required:
   - clock-names
   - phys
   - phy-names
+  - assigned-clocks
+  - assigned-clock-parents
   - power-domains
   - operating-points-v2
   - ports
@@ -159,6 +173,9 @@ examples:
            phys = <&dsi0_phy>;
            phy-names = "dsi";
 
+           assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+           assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+
            power-domains = <&rpmhpd SC7180_CX>;
            operating-points-v2 = <&dsi_opp_table>;
 
-- 
2.30.2

