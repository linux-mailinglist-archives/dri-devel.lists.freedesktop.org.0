Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2035675F54
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 22:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF1C10EAB3;
	Fri, 20 Jan 2023 21:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D06D10EAB3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:32 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id kt14so17036391ejc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kC6nlRLXpiMSXPquJRZdMcIDZWTTdhGu8SW/fzka2cA=;
 b=GZVHFP1REjMaN5lojRSILSBMt1q6iSK8zwe3yIxe0NSo1uZJbZPhML/NO9VEjBwRaT
 5k2+WhA+LwDMJcDxGulYlE5Os8nHtqkT54EPRZaduT8P74v7GfhKW7VrisTFPEh3jD4c
 WbBem2QNshnG14RdogSkCC6Kj/TRClgO5tPycn3aat6HiCPIFdg5wUh13k51576zsIKz
 Lh883YnxDojxT8CgxeFJDc7rNc9gdSRvuvpug9ATOP3prBpNs5BMri7yqIukOitezp8n
 GkQj/N1QhnUQ/y+Lg4YsEo1uPW+HmTVvWyMmCI4zZ0u9dOx5NKoz7zBgcekPvFg9BNrk
 1uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kC6nlRLXpiMSXPquJRZdMcIDZWTTdhGu8SW/fzka2cA=;
 b=5ecswfHJv2pKRl8/9f0i0UqhlwtcBxJbx+ZtmKlVdCeuBaynUuN2/pzDxy8OjClnLs
 Exm5xvU+5CCjZEmE4XTZFk+SdxOjS4Hhem8Icx4Yk3AUkmYryROs6hEZBB5nnBDE6aHd
 PZ8v3K4x9QN1HRnSA0b6NoJ32sdWwzgwKewVOIcTpxjZTPEzGBBawP7GDXLkqK/UW05k
 ZgrHnP4dVmzXQuffakE7h4bJAsNcVVjoeq4JUQHRSXgZRmkFJeJnhJgtsI69m8PDSKDJ
 G1lWbRbVIWAOA5BF00NWEHIpQ36sTYpfCcc00gBND9P4RHc+DCoM0H5m+GI4mySfFBPL
 tSnw==
X-Gm-Message-State: AFqh2koBEM4k025A4y0bwEKIeFWht/UuX3yX/dfezq8suVnVbhIumFPc
 T3j6hj5kFPl9NYTJLMmCCpu2fQ==
X-Google-Smtp-Source: AMrXdXvh8zy8Egrn8GT8PYXEo5TDYrAauJfohfTZoaHfR7FKzujlU4IhQyL4qcRUS4Kib92MglSWNw==
X-Received: by 2002:a17:907:c498:b0:862:1709:a06f with SMTP id
 tp24-20020a170907c49800b008621709a06fmr14367372ejc.37.1674248491724; 
 Fri, 20 Jan 2023 13:01:31 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:31 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 8/8] arm64: dts: qcom: sm8350: Hook up DSI1 to MDP
Date: Fri, 20 Jan 2023 22:01:00 +0100
Message-Id: <20230120210101.2146852-8-konrad.dybcio@linaro.org>
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
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
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

Somehow DSI1 was not hooked up to MDP resulting in it not working.
Fix it.

Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 0f9427f3319f..2531a9a80194 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2955,6 +2955,13 @@ dpu_intf1_out: endpoint {
 							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
+						};
+					};
 				};
 			};
 
@@ -3123,6 +3130,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
 						};
 					};
 
-- 
2.39.1

