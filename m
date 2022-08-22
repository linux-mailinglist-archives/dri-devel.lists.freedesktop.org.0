Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001759C9E5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C99A1AAF;
	Mon, 22 Aug 2022 20:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777C0A1A34
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:18:19 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id z6so16831509lfu.9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=b0csbqWjuX0z1ouVyH85kpMRal2rBTuFqDlpM2dtaGs=;
 b=RHkeOH/N8akKNzr5gPA24Je9viNjwBNlXDv55rzedGRjiMavLWCWofoMhLB49bN82+
 1PQU+/3Zwdsh5Vv65WlZAcp7VJGGai8hcLK1JPOb/jyZtlfctUch/8yDEDG1QiQPqLGA
 tQX6F8vNX8f9hCGtGXiBBiqUINhD0iAhcqoUvB0BCuZwVTnuB2GRqam3MNjLNpuib6SH
 HIgsSvTYbMhIHQqxRTjV4EJRcqUn++7ISlBJpiyHDIkd6NplmjGIKdqYxWPj1zLEIUho
 K15DViPkBTBFdHTcP8gX91xjRqlHBTC51h2N+oqKB+HO9cqYSLZXM3hzeJCHGj091o7A
 8laA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=b0csbqWjuX0z1ouVyH85kpMRal2rBTuFqDlpM2dtaGs=;
 b=3FKVHjQbMZSIgg1ruAjgGn9cs5UhjRtjiaxTlUGoK0JqXle3DZYNW4jGJgZ7O+lhGq
 fBR0A4T/1n/7YrF1EEW+1kb4iD3995/QEGkEjCw9xIFJD88rYhHWy4DR/YsVJBb7ix18
 4nMq5wKOS8Hq5X/Ro76igEaiaPVNcUwMuuFL6sWeq1HzjxOQSWk7sOgv0AD/TY8fX+8l
 OXMDpwzYWQkirNDSS1T8REkdDW5WwsIKZI9eqn2/StHTv/lxaAf9te6Ot5Q9wxaWf6vL
 DsTlmtFrZB3vEfnOXzvSSkKmX1PrcCqPd12d9NpzC6VoBxDPkKwwGZhZUx35hQTG6XWh
 cMmg==
X-Gm-Message-State: ACgBeo0vYkleLYK3gU2NFqfD7tn4peF1tEOiZqHZ+TBR7FOuHcRZJEiD
 pqIdHO5fEhDbkJSQW5fgHxgEnA==
X-Google-Smtp-Source: AA6agR68PJLvmGpy9/so9cyjZeepliYHidSqKXbaWXAiZpKWlnOVUiWZYg2lkmplE2B5xZd4BztLsA==
X-Received: by 2002:a19:5e01:0:b0:492:c03a:aa8e with SMTP id
 s1-20020a195e01000000b00492c03aaa8emr7659198lfb.139.1661199497047; 
 Mon, 22 Aug 2022 13:18:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 13:18:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 7/9] dt-bindings: display/mdm: add gcc-bus clock to
 dpu-smd845
Date: Mon, 22 Aug 2022 23:18:06 +0300
Message-Id: <20220822201808.347783-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
References: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add gcc-bus clock required for the SDM845 DPU device tree node. This
change was made in the commit 111c52854102 ("arm64: dts: qcom: sdm845:
move bus clock to mdp node for sdm845 target"), but was not reflected in
the schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 2074e954372f..42ff85e80f45 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -29,6 +29,7 @@ properties:
 
   clocks:
     items:
+      - description: Display GCC bus clock
       - description: Display ahb clock
       - description: Display axi clock
       - description: Display core clock
@@ -36,6 +37,7 @@ properties:
 
   clock-names:
     items:
+      - const: gcc-bus
       - const: iface
       - const: bus
       - const: core
@@ -114,11 +116,12 @@ examples:
                           <0x0aeb0000 0x2008>;
                     reg-names = "mdp", "vbif";
 
-                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                    clocks = <&gcc GCC_DISP_AXI_CLK>,
+                             <&dispcc DISP_CC_MDSS_AHB_CLK>,
                              <&dispcc DISP_CC_MDSS_AXI_CLK>,
                              <&dispcc DISP_CC_MDSS_MDP_CLK>,
                              <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                    clock-names = "iface", "bus", "core", "vsync";
+                    clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
 
                     interrupt-parent = <&mdss>;
                     interrupts = <0>;
-- 
2.35.1

