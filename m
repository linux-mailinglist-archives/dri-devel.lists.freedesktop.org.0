Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D16D63C992
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FE210E390;
	Tue, 29 Nov 2022 20:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABD610E09D;
 Tue, 29 Nov 2022 20:46:56 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id z24so18651376ljn.4;
 Tue, 29 Nov 2022 12:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bc2wd09Vf93CqCZ4OitfPPdDRgWz7evH44zLSPOfnkw=;
 b=Goy5X3TGbfRaFrdqc6vQC+dVOU5SDvgc//B7vrY+xmhxApivyBX6X6g0CsQL1U+12f
 AklX7NKyRYGyQT1piHT03Obs5wzFoHeS4Lg/jVbknKveBoB7WDmuYJqBkveGjeFUFjbk
 7nNoMc9RkNfL1IMI9q3YL5Yy/IuQrABXcXajqjV+aozEK+sYUQCswoHeoV+LyE6oz7vd
 VhkwBdBBz/JlWsJEzTht/1rPwvkPUWRqtflSOJ6DSa43ONxG1EiAlPTC/VDatnpdL2nf
 haFvMzty+TFL6AzeVLysm5R/8xUNTbZVi5cKc+XaFKBanW7yz6YuiPuul0nirgYizT5U
 n5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bc2wd09Vf93CqCZ4OitfPPdDRgWz7evH44zLSPOfnkw=;
 b=sr4QaCfw0EtGApKDLR6OMbF/tmGsFM+nNrQ5UUBHuSU1FQZTF8m4bPgfubpRaymKPC
 b56JYkjXOV6Hnzsbx8Be5yxev9z6UsJiIMgXfDVw6bkLcyPfnd5VDYFCHvv8IZEV1nSq
 J1+IcbvD0nLtWXB0rLusjWVl7TRCgXDJffzfHLJPQdmkljCN4TZ77pvkzt3OTMeBqxcR
 0mjmlmnwB6s6W5OOBf3FnshqNu9YONe/jriZZZ6yb1UWBsROsuOYxdUWQ88e0rRTHZQ1
 RXkjRCWECJuRPi+Ro6dn6GdkFsdaTHzxzy5jwO3zchYU8/rCbNj020UlK/aIKP4WBhYl
 a+fw==
X-Gm-Message-State: ANoB5pkhtluoyEujGTgTUVTT0hIlxvyFUGlIdcdeH/1SpyFDdtOTh20K
 Dv2cOlLEe5WovUEJlXGqK2w=
X-Google-Smtp-Source: AA0mqf50ce6u/oMNPHzvmd0XckXmqYwp8E3XMboa2j9FJlBeVEF4COF+erao2NEaj7JiigRUIyS8UA==
X-Received: by 2002:a2e:9c45:0:b0:26f:bd73:489b with SMTP id
 t5-20020a2e9c45000000b0026fbd73489bmr15874760ljj.478.1669754814273; 
 Tue, 29 Nov 2022 12:46:54 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b004ae24368195sm2325620lfr.233.2022.11.29.12.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:46:53 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 01/12] dt-bindings: display: msm: Replace mdss with
 display-subsystem
Date: Tue, 29 Nov 2022 21:46:05 +0100
Message-Id: <20221129204616.47006-2-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129204616.47006-1-a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow other YAMLs and replace mdss name.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml      | 2 +-
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index d6f043a4b08d..4795e13c7b59 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -72,7 +72,7 @@ examples:
     #include <dt-bindings/interconnect/qcom,qcm2290.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    mdss@5e00000 {
+    display-subsystem@5e00000 {
         #address-cells = <1>;
         #size-cells = <1>;
         compatible = "qcom,qcm2290-mdss";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index a86d7f53fa84..886858ef6700 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -62,7 +62,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    mdss@5e00000 {
+    display-subsystem@5e00000 {
         #address-cells = <1>;
         #size-cells = <1>;
         compatible = "qcom,sm6115-mdss";
-- 
2.25.1

