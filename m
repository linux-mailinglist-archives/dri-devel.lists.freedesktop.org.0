Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEC2634B36
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EB610E4A9;
	Tue, 22 Nov 2022 23:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABFA10E49A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 23:37:02 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a15so19624689ljb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZRg2hYUZ55Yzoq4hDxZaql963EtJYTAOZ+zJGgmhWA=;
 b=EDlgWkp3OlyaDWrNvJsNIWgLIYVuQZIYzKiJIOC1ZLqFg/lgJQ0T1TxJE2J51RzJfR
 geYDbHJUMW0VhJfaDjuFsghMtTK14+bGSGWu2ncdiUXNP2BzirW7lHmIv8haxnjveQYF
 x/TVfz4Kb12T8w0sjBB5YnzBZgUjw87roqtF6pTwHE+TSL7cy3szvmtlnFnD0usB5J5b
 qOLm5hoeO/FkV63rEu1iyk1v6UXfjwJp9met0fRRyepSnpltnTyEm5oQ2eo2uHREZSBy
 idobRjUHn+WIItkKaQz3YqLZWPoQY5HYGCrdLYJPV54YEoJGOAyjbB1eK1CmQDc83Zu9
 T9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZRg2hYUZ55Yzoq4hDxZaql963EtJYTAOZ+zJGgmhWA=;
 b=yKMDxsv7SeJmmri4uAR/YcQ5D2YU9cwP43j7AY/sJTmNYMi2g61mh0JDIxh7vsbDD4
 yZiu7W3A8S75Z3RrNauV+ALOQ6w91hML5AOEvzr0Ax2cJ5Fmf9/zMoptpAeBA8TQcuM6
 vStjmKWHbVCsm13XOnZrZCXMfw8PpX84R78iZIWERr0mbZ1+lJ3OcYy5Abqeu1AmroSY
 TyTRcAg7wYv8PzV4t8zT2KhkpxEnMxmqQW7/PSDvgo7OQlG3oxwcqKXITznl8ZXU4Dwx
 yh4F30kUONP/4w1isqyRuECbsFhFjYanJkJWGYA6LsGOQwuCqmxEUOkKA+i+3ZLEIR0K
 xZ7w==
X-Gm-Message-State: ANoB5pnp4JBasq8dz0Hz/xqM95a2E44QpHsM+nxU6bfUzVsgaBZgRaqq
 cHsVgjgK5Jzh45bDoYD3HzSJrg==
X-Google-Smtp-Source: AA0mqf5zwUBczXkxLKMF+E+AAp+kHqmVWugsTI1eD54EFn4ZfqP56jOYdGU8gSo8Mhz/sWcMrXpI/g==
X-Received: by 2002:a05:651c:2123:b0:277:328:affb with SMTP id
 a35-20020a05651c212300b002770328affbmr3487255ljq.376.1669160220986; 
 Tue, 22 Nov 2022 15:37:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 h3-20020ac250c3000000b00492c463526dsm2666454lfm.186.2022.11.22.15.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:37:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/5] arm64: dts: qcom: sm8450: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_D1
Date: Wed, 23 Nov 2022 01:36:55 +0200
Message-Id: <20221122233659.3308175-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
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

