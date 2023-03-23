Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBA46C64DE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 11:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3280A10EA6B;
	Thu, 23 Mar 2023 10:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5702B10EA66
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:25:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id l27so11546057wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679567132;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=la//61tmt1JcHM3ugdeN6VnhDtVEZYhOaulQ5DfrvTk=;
 b=S2plp2biPGbwxEiLWBmwLJwun7H46QDGsXGyrABWfNZDdJqJh2PBS9voTj3QSeOUh1
 99qv2UbnDsZDzXJoIi3Y5+uzdePQTnw9tRFUmz1d5jUJ5nQkjPojZ1mzrEt3ZPs0Bj5W
 sW/yzmYBz3xuR0ejrvsfxWKx7sHxGHnRCxXb62Qq+AX03L2q1sRPSNCrUF9eYAMdea8z
 /QdKTwqDEAwXxUtwONLXbjwlFiFGL1e09KILItMUY3q7lSet92LZ96YQZq4YpHhRPxG/
 cehXuvJTmhmnLF/DLCGs8Qd0WUWsclH+WvciD7ootrnnzur54KUypGkVhvyjSRiz6Lj6
 HzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679567132;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=la//61tmt1JcHM3ugdeN6VnhDtVEZYhOaulQ5DfrvTk=;
 b=2UBxHjDtmhizzeokl/3G5SbeJJNxtSTCm7PWfkQ7pM5o8vBl0WYE1uC7HCwGZbbywr
 V/F2z+ey26n6qaf0LqLnogdXDzdLsbzQS/EadraXuKB/fJPpWasI22xYB/+8icJ2i7y5
 v4qpeHY53CzoWv4zBh1T/sPtJvdHPHPByfdsqqff3SfRdU1LmkPSOEogr8Xe/pblwuzT
 0NfR6SSXqP2mTFzNO+5I7tD8gmDL36f3Yzp4z2QnlLNOvTkIXUGwBO3xmDXlYGQs1SkQ
 3HjujhYZpciRSmHwq2WGPJSEDVshHG2Q3J3ikfq1UHwMffVR06v3pfX2QaTgngiII6dT
 HRDw==
X-Gm-Message-State: AAQBX9cOoYAO3hk3gvIg0CPo2JXSH2iMdzbpA4qzMnJv7lHABOzM8P5e
 4J5EoOj9eMtDFeq9xA4BnHwbyw==
X-Google-Smtp-Source: AKy350b44afSbkJF5DaYq1NUD5d4106/qJV/mKTzn9m9WMT0RNlmV8eElddHIPWpkEOECHczSuNPjg==
X-Received: by 2002:adf:f14e:0:b0:2cf:e77e:2eef with SMTP id
 y14-20020adff14e000000b002cfe77e2eefmr2254862wro.8.1679567131835; 
 Thu, 23 Mar 2023 03:25:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 03:25:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Mar 2023 11:25:20 +0100
Subject: [PATCH 5/8] arm64: dts: qcom: sm8450: remove invalid
 power-domain-names in pcie nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-5-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>
X-Mailer: b4 0.12.1
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
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following DT bindings check error:
pci@1c00000: Unevaluated properties are not allowed ('power-domain-names' were unexpected)

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index ff55fcfdd676..bcb51e612261 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1792,7 +1792,6 @@ pcie0: pci@1c00000 {
 			reset-names = "pci";
 
 			power-domains = <&gcc PCIE_0_GDSC>;
-			power-domain-names = "gdsc";
 
 			phys = <&pcie0_lane>;
 			phy-names = "pciephy";
@@ -1905,7 +1904,6 @@ pcie1: pci@1c08000 {
 			reset-names = "pci";
 
 			power-domains = <&gcc PCIE_1_GDSC>;
-			power-domain-names = "gdsc";
 
 			phys = <&pcie1_lane>;
 			phy-names = "pciephy";

-- 
2.34.1

