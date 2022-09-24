Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296605E8C99
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 14:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1501810EC0E;
	Sat, 24 Sep 2022 12:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FC410E610
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 12:36:16 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u18so4119270lfo.8
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 05:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
 b=YjdcxLVE7Jnc7UN8j9yJfN7Uq50cbwaisIpdqncEjDWorGISw1Q4bIKzMJIHsa/bAy
 AMfavFSP3/Qc2gdTAFR+To5CtXlwV2QpXwu0w7uPF3jknJ0QsIO9bkoKnYFZeococFcG
 2DbZQrRLMtHN6UiwwznxNBPD3hzxcwqKygIr1+I90nKMpmt8Urpt7DUvPXX5S2+Lj85L
 g5/vt77teDhlPPGjfzX2Z3wlIVobDGOILB+aUE4J9xdW0OsPXaXBYDW7Xi9wJ4YCPMnw
 uwFftEXjuxx1KkQW1BmhwnAPlaVkXlrv8CTWjZP05jutqnONp/hz5+w7AvUtfICtfuqR
 tTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
 b=vJL134d3S2kaTt48FCiAWIUVqbAqeFyWFbQK2C7+eXMvbX8STGNRv3akzwaPj797Bl
 EogYGPbDYt9OmuzUsGJ7+44Ns1lL+hPOiMa8WTU34bVs9BBlWBeL3L3k8wS5Yv0CZcUZ
 NctWGjp5/C1pH5vrDbvqtV3rpfR2xsOn8klGsOTt8ljljPFoTW4buYiHLooCCxhdH2SU
 JADSX4lWOavqaiy59fDxe3tfWa6gNERTUfJIdLM5Bgyq2pJgX/VvTxZPHneNqN1IGSAZ
 694B/UuSQll6hSCPBnCkdVYg2UFnY+q3AFtDa3V0EOApHeTV+uesjESPwpLmGwCeRSU6
 TNRQ==
X-Gm-Message-State: ACrzQf2F3YH5Ep5JL6vsJ1EUEsKZt7P+0JmhcrNU3j2i5Y8+5KjmIaVm
 ArFpPxQ5Dkg+D83TAUmmSz9UMQ==
X-Google-Smtp-Source: AMsMyM5ixskLg7xVsV1hW57LtjoKOpXeFjGXeiUbfvieg+SAtmquiWpBYXiKkUwsw9gdF5SKBAnDWw==
X-Received: by 2002:a19:6555:0:b0:49e:7d52:a4ca with SMTP id
 c21-20020a196555000000b0049e7d52a4camr5487418lfj.198.1664022974550; 
 Sat, 24 Sep 2022 05:36:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u18-20020a2eb812000000b0026c4113c160sm1707269ljo.109.2022.09.24.05.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 05:36:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v8 02/12] dt-bindings: display/msm: add gcc-bus clock to
 dpu-smd845
Date: Sat, 24 Sep 2022 15:36:01 +0300
Message-Id: <20220924123611.225520-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
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
index 7d1037373175..3cb2ae336996 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -84,6 +84,7 @@ patternProperties:
 
       clocks:
         items:
+          - description: Display GCC bus clock
           - description: Display ahb clock
           - description: Display axi clock
           - description: Display core clock
@@ -91,6 +92,7 @@ patternProperties:
 
       clock-names:
         items:
+          - const: gcc-bus
           - const: iface
           - const: bus
           - const: core
@@ -183,11 +185,12 @@ examples:
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

