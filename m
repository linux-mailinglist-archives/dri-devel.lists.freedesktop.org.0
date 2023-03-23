Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 464796C64CE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 11:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7289110EA66;
	Thu, 23 Mar 2023 10:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBDD10EA65
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:25:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v1so13758606wrv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679567128;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MbMpIW2XeTgOIuij0DvAphORXQYIJr8R5bBmK3u0n4s=;
 b=OiM1Yacj+a6ZH6zyF+4WbfsKHoee7NXm2MM9OOs2n5bJzfOLIGXc12cwtoMMbg5V3G
 3E7MUGqH2EfT+LLrFi30N1TD5vnz9MtKSQJ7qwGhKdoghrG2YNuKlZpFNEbNpPfb+JNC
 For/VV8QIang/A28V7HMQQzpxwmJI796xxhu2taDRIfLRuuphtt55iNSeSB1TPRM88kr
 MbeZOoHUYvYqUSMsB/kCZa2vQ1FUlEiDJMmqJPeIQn3BXlnkPEmWDHVnFESQ6FJvikYa
 cSWdtPSS6SLsNYVNt6bjg783EluGuECjGfV2WXUqqcBqC1eByii9qGUXoZ2JXGQ/O6yJ
 vBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679567128;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MbMpIW2XeTgOIuij0DvAphORXQYIJr8R5bBmK3u0n4s=;
 b=KvGAkgFj/VW3iGKxHEO/dXyeshdl+wEe1+uhRUc4AqyxxBEVwD1cpWnfjHJEZ5AlNt
 L9jTQIJmLYRwKFYA0qtvxJTXfJ7IqzNq0p5lSn566RGaj5a7w8GJDCWfjSGhRLJvL7Od
 jk6SJZTy1fo4Jm4UFw7oow1Y8vWD2JUSsbEotzFofi2VMZnXjC8LBcmi0VDsCMh28nJk
 HT4IC7N3YcuftsFqki4HEBllpVrtPu37xhafIXs8CwFcHrXD27KntGzWER/T442gEaMV
 b8kDe6GcEPZmNyW4eIbHWm06/wgfaiT+IZDOo2pZIay47WyFy9aIHq2ebEfIAJbM0x3y
 GPzA==
X-Gm-Message-State: AAQBX9cTykqG5TDPLQHkTC8GytyjeSc9idgKecenXOZk2Gcp1FgAiDTQ
 lLbstsSNaEJeDmlIYus/OKuKHg==
X-Google-Smtp-Source: AKy350YnpJ9aARdt0vtWcfFYEivcldCh8Vl38PKNmqoJ8yqlx/THGzhpYzjoV1hW1Xn0hKBSv96fHw==
X-Received: by 2002:adf:ed43:0:b0:2ce:a8d5:4a89 with SMTP id
 u3-20020adfed43000000b002cea8d54a89mr2146384wro.37.1679567128111; 
 Thu, 23 Mar 2023 03:25:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 03:25:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Mar 2023 11:25:17 +0100
Subject: [PATCH 2/8] dt-bindings: mfd: qcom,spmi-pmic: document pm8450 pmic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-2-3ead1e418fe4@linaro.org>
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

Add a compatible for PM8450, commonly found with SM8450.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 975c30aad23c..15deeff2d447 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -57,6 +57,7 @@ properties:
           - qcom,pm8350
           - qcom,pm8350b
           - qcom,pm8350c
+          - qcom,pm8450
           - qcom,pm8550
           - qcom,pm8550b
           - qcom,pm8550ve

-- 
2.34.1

