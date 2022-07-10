Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B2756CE53
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 11:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC72B1127B2;
	Sun, 10 Jul 2022 09:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DD911349B
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 09:00:51 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id u14so3058930ljh.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8uP7epyJQsP5rWLMlZPU+2WIXogmdHgKsCg4a6KbsQ=;
 b=kKvMJpP/ZP5JytTzFf0NPpp8SzSAfBXi7jIqa8Hk+QV/PNSoE+sayfQtZTrEoBYI7g
 zh1795kR7Ag0oYToA8bVBDV63ZDa25O2kr9/slwZOiuq3YVXmZnE/XueoDzXzCK25KC8
 Ja9SHBSKnWtTnKsOHT4hLR5PRhPv1Wili1yg9pfLS0xpOjl2Dy+E7PKoRY6X15LptQAw
 xj9XJmWz98sTcxxSvIAzoSpOutu1J1Usqjf4PzUq9yKQokTadq+1+S/qQPk2/Ru9c6+T
 bKflirilmwVHMJuW/U5LaoJce+IUl9y+PkbmTIIogjjRUJ3NO/aS0mjooKx7edaIv1I7
 9ipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8uP7epyJQsP5rWLMlZPU+2WIXogmdHgKsCg4a6KbsQ=;
 b=cBNpgriQ4Iu+SoztNVcmxdmCMs0VfuPa4tcIANMRL7V3XXT3KtXhvQNkSwCXrjhhA2
 bbP7//28BQGO8t5IUwynSHH4NwGMTR8gKxfZxZWWLYD7gkbsohd3fOf943p9xjB/4RzL
 f220qEPJSv01rT+slz8x9tA0h9/V2TcT8idShEJ/s31VZX9ChnZPeXj5QSLZTChXsAWl
 +AUAn0wpDnAJi6IVt9HnDvZ5kAM728ZmEJtGLGFXedepCfTp3rRFQ6HMzD6PG8s+Cfcs
 ckP8xC8bf6DmbLRqNgdIuBEpTMsKFoICBvOZ2StzbUrlaWgqDpgg3JWYrbiDDfCLNjgi
 4ndg==
X-Gm-Message-State: AJIora9Qb93p9hSXAkLAT3qNqvg9HTX5uQLqBVpoQMo0Djw4OpO5rQ6t
 9tQG5tzmikmHVjaR62azoQyI9A==
X-Google-Smtp-Source: AGRyM1tRRC56ermrH8sFgyeA0GHovNm/nUTSJV/sXXfkIPvFNvOYIpxVOLE4kCIzUkymapoQz2jyjg==
X-Received: by 2002:a2e:82cf:0:b0:25d:490f:4035 with SMTP id
 n15-20020a2e82cf000000b0025d490f4035mr7391229ljh.290.1657443649443; 
 Sun, 10 Jul 2022 02:00:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 02:00:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 10/11] dt-bindings: display/mdm: add gcc-bus clock to
 dpu-smd845
Date: Sun, 10 Jul 2022 12:00:39 +0300
Message-Id: <20220710090040.35193-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
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

