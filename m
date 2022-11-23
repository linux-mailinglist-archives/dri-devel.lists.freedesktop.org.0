Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D456636C06
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 22:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0817610E635;
	Wed, 23 Nov 2022 21:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AC610E630
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 21:07:24 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id p8so29909949lfu.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 13:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZRg2hYUZ55Yzoq4hDxZaql963EtJYTAOZ+zJGgmhWA=;
 b=Kf4SprGXwmWQD1w1Eg+ZWR96Y2yqFyXQOmFqvsW8zgQDUtORvrH2Wj77QW91QTlmdd
 fnFyMpHRvDQ03vg3G00KtRkwx5GN04XcCyCP9tZAS2nipIJvNq8z7lOPacpYo2HehudD
 XTsLEnZdCvdaSVv/dsJdwpH11pf4yWnT2uGy6qogQEItoS7gad17or56seop77pSus/D
 0dmMCE38pY4nXsGvx0+N8BcDdRQe8rWNTL0CKrL221dqziJ9NSSNo9AaFJS81nRu3OGY
 quoZLkAlP4+lpufIqLSGaOCrj+r1UJj1h7aHc9nW8D8GIC7COyKghh7z9Vgjp5FFiCo9
 97Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZRg2hYUZ55Yzoq4hDxZaql963EtJYTAOZ+zJGgmhWA=;
 b=avCnpqP60CZZRevNoJoU6UOK0CffYKvK/W268yOFq9AZFawGu5qkf7jTGzWk2AyOWh
 qkoDXysS1f3HK6ZzS5kTzX3Vvn+EctpEMjtlvhLzfn3g5NvywOGGjp4TT60wrJ4Hwbih
 9jUo+/Q+TK7pJttf+egTPkb2wo6Ruys+3Sfk9erWWXDdK/0kDuGwoXdSTtb12Ya2Fmmp
 nWHin/oJNlo2hUhgQ8/WvHO9LLZ9WmFN/XMB+HnwqB/KH01PPRFP1ZHdGa0PNOkSePVS
 2DdBKnpDs7hewtrRa6UAQJr7YDCtuGn2cRnWO5pGhZYq6r1GJCW89Gu9Fe/WfoZz23x7
 VwCA==
X-Gm-Message-State: ANoB5pma6i/sKp5ErpXRxt8+P/+zz96SScP98kIMynhxR9xjk/9T+Wiu
 lzcNKe5q2/NYF7iwtq+DBh1syw==
X-Google-Smtp-Source: AA0mqf54YeJAPmU2NPId1oEv6/iBF0eu/nKkdOKIV00Cfq9e1D9bzNS5SuegPBHGrocsj8XfGm9XEg==
X-Received: by 2002:a05:6512:3ca0:b0:4a2:2c4b:8138 with SMTP id
 h32-20020a0565123ca000b004a22c4b8138mr4390614lfv.14.1669237642180; 
 Wed, 23 Nov 2022 13:07:22 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2415a000000b0048a8c907fe9sm3024119lfi.167.2022.11.23.13.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 13:07:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 1/5] arm64: dts: qcom: sm8450: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_D1
Date: Wed, 23 Nov 2022 23:07:16 +0200
Message-Id: <20221123210720.3593671-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
References: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add another power saving state used on SM8450. Unfortunately adding it
in proper place causes renumbering of all the opp states in sm8450.dtsi

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 20 ++++++++++++--------
 include/dt-bindings/power/qcom-rpmpd.h |  1 +
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index f20db5456765..8cc9f62f7645 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3211,35 +3211,39 @@ rpmhpd_opp_min_svs: opp2 {
 						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
 					};
 
-					rpmhpd_opp_low_svs: opp3 {
+					rpmhpd_opp_low_svs_d1: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					};
+
+					rpmhpd_opp_low_svs: opp4 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					};
 
-					rpmhpd_opp_svs: opp4 {
+					rpmhpd_opp_svs: opp5 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					};
 
-					rpmhpd_opp_svs_l1: opp5 {
+					rpmhpd_opp_svs_l1: opp6 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					};
 
-					rpmhpd_opp_nom: opp6 {
+					rpmhpd_opp_nom: opp7 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					};
 
-					rpmhpd_opp_nom_l1: opp7 {
+					rpmhpd_opp_nom_l1: opp8 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					};
 
-					rpmhpd_opp_nom_l2: opp8 {
+					rpmhpd_opp_nom_l2: opp9 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
 					};
 
-					rpmhpd_opp_turbo: opp9 {
+					rpmhpd_opp_turbo: opp10 {
 						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
 					};
 
-					rpmhpd_opp_turbo_l1: opp10 {
+					rpmhpd_opp_turbo_l1: opp11 {
 						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
 					};
 				};
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 7b2e4b66419a..701401c8b945 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -174,6 +174,7 @@
 /* SDM845 Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION	16
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
 #define RPMH_REGULATOR_LEVEL_SVS	128
 #define RPMH_REGULATOR_LEVEL_SVS_L0	144
-- 
2.35.1

