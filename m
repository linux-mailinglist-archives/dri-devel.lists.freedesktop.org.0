Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2CD63C9C8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBD810E3E6;
	Tue, 29 Nov 2022 20:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648DC10E09D;
 Tue, 29 Nov 2022 20:46:58 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id d6so23888356lfs.10;
 Tue, 29 Nov 2022 12:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0asAoMqwEnbLM8XD1/hLqCKMeXNAQ5meWtedT2j2eo=;
 b=mC4SrMSQU9Ksm7Z9Zz4jeSxnSoYtCEjCxvFktqIAj+LxH95z+9D/kcRn/sivbsj0pJ
 m6Ef20QJ3hJyPV0SpJr8TSDW0iofCGBAHDv+HSRNVa9CKihjvv6DQlXDRkP3olec+3iZ
 AxyBeHJcfmXbdDZrzOn5AaGQTga/gLhTz62cOY75YE0ftZypE9KiTXIJae8IggVONOl/
 2rx7e5gD9MvqzMaSNEWba2lUja6yHzCHFb5ptxvvShDAfHGIGobYrW0D6IK24q+rv5cY
 JgG44YqwSbFbhA4htr5UgOCHOAjhzoIZRdHlHLo8HPi9rdJdFUbMbPEJvy2f+LbtvZ3Z
 iW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0asAoMqwEnbLM8XD1/hLqCKMeXNAQ5meWtedT2j2eo=;
 b=7HpbNkdAcOuD7WASctREmQzuYmwCl19hfUiDN4o/zOu8PowCZpconLLNdAYiZOJmwv
 WlCRBYCeuUsK1IEuy8wVUl8ayU6jUCG5HoqNVEhdGsaCrs3Fx/v1br0n3YNeXdaHGDum
 t+zzFPu5FQ1qwVZNjNegk8x2Ipvptdu+Hayt0Zd7rApjHVSyWrGfCRZhlRqbSWVyvRqE
 UxIKfEC7c73I7P2B+hKc3sfwftWJiubsFjoq3W9uuSX/RulMvynWDqzv+GYtOHH25hXJ
 HFlPTfDljP9mII+a9JcYB/duSjV6+sFnGqDiSBtRhCoR66xTcQ/vCgzotTou8dnI0U+S
 /bWg==
X-Gm-Message-State: ANoB5plWhNPOpiGY7TPoXx4V0XVL7yLRKrmVdMdyH+WYy99BUNZa3Zch
 ZAXS1R9i5h9YJtveiEcUKvY=
X-Google-Smtp-Source: AA0mqf4sjfz5XraQ8YjoH//addmVdAEiibnccbFxPDlqD/xvyEbpMKoICP3OOzm3EoNjkzLiIeTwEg==
X-Received: by 2002:a19:674a:0:b0:4b1:3931:af with SMTP id
 e10-20020a19674a000000b004b1393100afmr15582699lfj.394.1669754816507; 
 Tue, 29 Nov 2022 12:46:56 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b004ae24368195sm2325620lfr.233.2022.11.29.12.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:46:56 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 02/12] dt-bindings: thermal: tsens: Add SM6115 compatible
Date: Tue, 29 Nov 2022 21:46:06 +0100
Message-Id: <20221129204616.47006-3-a39.skl@gmail.com>
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

Document compatible for tsens on Qualcomm SM6115 platform
according to downstream dts it ship v2.4 of IP

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 038d81338fcf..c41fcf404117 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -53,6 +53,7 @@ properties:
               - qcom,sc8280xp-tsens
               - qcom,sdm630-tsens
               - qcom,sdm845-tsens
+              - qcom,sm6115-tsens
               - qcom,sm6350-tsens
               - qcom,sm8150-tsens
               - qcom,sm8250-tsens
-- 
2.25.1

