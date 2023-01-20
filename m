Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8476675F57
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 22:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F8C10EAB4;
	Fri, 20 Jan 2023 21:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC4210E3AB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:29 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u19so16964265ejm.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cplHg6mmZO77Jj4HjyqBizHDxHYMI91dvrCE+XRo9rU=;
 b=pyRBjQVaxGEuZeJXBEpUNUgHxD9Z3JgDHkxja3xv85n7MIQizfzpRmIhWtSLcKVsv6
 iGYQFUwZI//O/otLG9lQuAt1TAoUpqzw08rUfl50jZHBjljox+1s/hxc5umAE5SnxaXa
 uHJ2c6+dg/u5IPYb2Uks5dQ0BZNKfUo7jO+XBeUD13tQZ3yRFm4IzQRz8dhhvJVosxTu
 yrdRgGkZqkqZBUi0Ti7vGNGeyxN0xxUO03WgtrRFXGXS1vzNl62xuahhRFyrGG96JcTO
 QCKAxNUcKP6xhwWaTMC5oyaKEVYdDOTQ4oft3361FdqmpUmy8RSM6loxW6HJWB5iLPjx
 75+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cplHg6mmZO77Jj4HjyqBizHDxHYMI91dvrCE+XRo9rU=;
 b=faOkkmH4ybTwgwJtlU5CH/OFKQ5Ws2k9x7ZdFCNWw3lmyhkgpIQUARFFS94lA2EZCP
 Mgm2qDANcY4vOP3fvWV0zFNlAJkpCsXJbks63GklCDJwPSZCSY4+vEieSB9bMA3sPj3N
 z+4K5yATQdyjrKIgUDoXmShx74v4oqF+e7TFUFyl7wIUT49zTx9HL1nVpiGG1pGlRe60
 vuKI+E3c+l4I1bHyKZrOtNZIPLqWqppHEpWvNh6kQIv85vFLjFDs205dvroAivrr6CNx
 vLuZ2Qeq6PkbJ2jdB3/KixpBhtKFKkbM6Si0A+Hn7BKnPsPktAVi4du00Kk9WrbfzW2V
 S9RA==
X-Gm-Message-State: AFqh2krIYMGYdKIgFzF381y05TMUwPaqRS4qJmF/KElewYUmkJddxxsh
 t+93UzZJPnKwbUvyGOOqG3nt/w==
X-Google-Smtp-Source: AMrXdXvhQI54/4nyNC2unGCcARW/ouKy70qQqZ5Werikg+NU9C96Tk/aCyOTWsXVvSMVhDpZ2CTH0A==
X-Received: by 2002:a17:906:a88c:b0:7c1:5098:907a with SMTP id
 ha12-20020a170906a88c00b007c15098907amr16687692ejb.35.1674248489093; 
 Fri, 20 Jan 2023 13:01:29 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 7/8] arm64: dts: qcom: sm8350: Add mdss_ prefix to DSIn out
 labels
Date: Fri, 20 Jan 2023 22:00:59 +0100
Message-Id: <20230120210101.2146852-7-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the mdss_ prefix to DSIn labels, so that the hardware blocks can
be organized near each other while retaining the alphabetical order
in device DTs when referencing by label.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts |  2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5a4c4ea4d122..df841230d1b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -309,7 +309,7 @@ port@0 {
 				reg = <0>;
 
 				lt9611_a: endpoint {
-					remote-endpoint = <&dsi0_out>;
+					remote-endpoint = <&mdss_dsi0_out>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index b09eb8880376..0f9427f3319f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2952,7 +2952,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						dpu_intf1_out: endpoint {
-							remote-endpoint = <&dsi0_in>;
+							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
 				};
@@ -3024,14 +3024,14 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dsi0_in: endpoint {
+						mdss_dsi0_in: endpoint {
 							remote-endpoint = <&dpu_intf1_out>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
-						dsi0_out: endpoint {
+						mdss_dsi0_out: endpoint {
 						};
 					};
 				};
@@ -3122,13 +3122,13 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dsi1_in: endpoint {
+						mdss_dsi1_in: endpoint {
 						};
 					};
 
 					port@1 {
 						reg = <1>;
-						dsi1_out: endpoint {
+						mdss_dsi1_out: endpoint {
 						};
 					};
 				};
-- 
2.39.1

