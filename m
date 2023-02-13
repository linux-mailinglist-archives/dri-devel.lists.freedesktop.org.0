Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E72969454D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970AD10E588;
	Mon, 13 Feb 2023 12:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434F710E588
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:10:19 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qw12so31325845ejc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 04:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sLkh67ooWyVObn1J2I1Qu7dXdNbX+Cd0UoL9axKT34o=;
 b=p8WGCP9v5yIWbqJlLQRmMt4chiH79pIdn/7AB+4u36M/TTmmzVK1ZVLXeajFDjlSHT
 cOO6it7vveZEhpkGjAAqnz+csbNPwy1aG25sAbzN4xBu1iIBCSLIb+fADM842f8D4gU1
 vQ4YjvIWiUj59NG7bCE+aUwx3nanN3FFInJXJjsDakUUBBnZAw+6/B6KYznfiPE7vDgR
 x/+Qq/jef9admT0KChEbH1aLvyLMslwfGF3JUJ/gV2UvFeChYwTlEswgOF0tTQtk4ig4
 SmoFfdXxu1QehBVPm4G9hbjnzNCyjRlo/EIr6YaxVp4mWcB6aW2elIkYazjylBN6HoKN
 8Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sLkh67ooWyVObn1J2I1Qu7dXdNbX+Cd0UoL9axKT34o=;
 b=2NFXXNAxibj6Yn6y6m652GMaXbCZlNCopAMBnogZyrxKoZRLO8J7McVMlkWT/vz424
 KwDlC+1THYkRiB77YUPQk5J5O3Xnasyf/dehUmUz9RdWiO3YfjqfKlC9RvWf8MzUpODd
 ZLDlaLSZwoBSNO/fjCJrGMc7Yvc8b06hWwRk4sY9BHxGqGwbEd+7M+6XXOo6SkQYzAYt
 y/JndzGU5mYJxE5A+0mSRcpF/o5jxV+Q85EJNOlyUuGbFTbuiMpjo5IF6Wnc+svewzpC
 AHOra9umeTfxWOd3zcYL2Nu+PyK/+F3jOk+laVrZdFfac95G8sVSfRNRL76zo0BfYXWx
 OvGg==
X-Gm-Message-State: AO0yUKWWv+BI7DpXNR8JtJ7N1Y3SyRspvIPfg6rsXtIUYd9Ybdyq6qjC
 qCBa1QjFK4tn7D4zra0LFx226A==
X-Google-Smtp-Source: AK7set81z61FZiKoN0s7dy9ixfbbUA4wWNKA2rBI/8l8V7YwRzxhtMm5RnVtHF6TGfXBlSD4ZM0jEA==
X-Received: by 2002:a17:906:1908:b0:878:5f8e:26c0 with SMTP id
 a8-20020a170906190800b008785f8e26c0mr17900635eje.7.1676290217679; 
 Mon, 13 Feb 2023 04:10:17 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 dt19-20020a170906b79300b0088ed7de4821sm6651586ejb.158.2023.02.13.04.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:10:17 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 1/9] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Date: Mon, 13 Feb 2023 13:10:04 +0100
Message-Id: <20230213121012.1768296-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The qcom, prefix was missed previously. Fix it.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e75a3efe4dac..2494817c1bd6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -33,7 +33,7 @@ properties:
           - const: qcom,mdss-dsi-ctrl
       - items:
           - enum:
-              - dsi-ctrl-6g-qcm2290
+              - qcom,dsi-ctrl-6g-qcm2290
           - const: qcom,mdss-dsi-ctrl
         deprecated: true
 
-- 
2.39.1

