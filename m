Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EDD638A25
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFDC10E759;
	Fri, 25 Nov 2022 12:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115B910E751
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n3so6581985wrp.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G7igFHyhmHKVMXZXEAa2K1RzngdOwodMFmdy9026aRg=;
 b=qIQj1rChUOkQZjWDMxlU73xldn7u4j/v5sjrq+HQcMJKXNE4uwrP4FIMNJn2J27oPO
 PVr35ZfJiCoSEC2bHtyRB+O55hhFLOm4c72fvkSIXiFDheQbQ5xIXeRD0RITOUymq0rQ
 rv4r67/F9KnclaA4AdP7U/D4uZxJRAHkQotBizzrCz0yb3naCnP8gBFg9Eu8S/G7zODn
 3hnP5oZHH5l+vX2Jt3WTC+Pzc6yjlwd6S1mX8vqnrFzxqnBJ6FmWzZvsd121H8LH35yC
 h3bowhIietdxPCWQuRxN6BfP68rqU+UWE0qLcV9ptrwIcoQ8vEkBKUdnyNBtusRpMial
 pz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G7igFHyhmHKVMXZXEAa2K1RzngdOwodMFmdy9026aRg=;
 b=I80BNzP+EuivtTsBZ6St5Bq3K3PR9aCrP+mHX9zdLiveC6JKsUA+ImU04csnCEaFQ7
 9oHRETHV6cFw3vKm2miz1g/760zw4lPG9Z5BZTULYKE1sScGqKPPDdACUFRWfnhy3N8M
 j6iNm+r+pMOWwxQ3FKrtrcHDzcIjpqKj2tb049ag2BDoHriteDf6E4r87v2gpwSnl7ah
 W/Zr0jbMa+i/83fBCrj4itVDJjMNpw3HlxsTw+vqFD4b+NH/kqvbHX17nvtajdFha93w
 g64lM46aI3Tdy51dSX7p2wTP9m663XmfZsPUDNx/zaiCHLhxeZhp7/36rK2QXXpSBn3r
 9sKw==
X-Gm-Message-State: ANoB5pm+dtYU0XlSEA5k5Z0CQSM1UgkdX7VnCFZ21s3gSGOmZaDmy+B2
 T7d2tYPsrdr6Bwo1o4iycYnFlg==
X-Google-Smtp-Source: AA0mqf4ziz7oDoP4wPCNbQed9BXD0t4XuAwT5713VZQX5l2QBzJFnL6s1/gE5DY8Oo7HGNZ/7E6isg==
X-Received: by 2002:a5d:5187:0:b0:242:5ef:ce32 with SMTP id
 k7-20020a5d5187000000b0024205efce32mr1869897wrv.260.1669379816659; 
 Fri, 25 Nov 2022 04:36:56 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:56 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 12/18] arm64: dts: qcom: msm8996: Add compat qcom,
 msm8996-dsi-ctrl
Date: Fri, 25 Nov 2022 12:36:32 +0000
Message-Id: <20221125123638.823261-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,msm8996-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8996 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 081e20a63c610..9f6543579dcf0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -968,7 +968,8 @@ mdp5_intf2_out: endpoint {
 			};
 
 			dsi0: dsi@994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8996-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00994000 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -1035,7 +1036,8 @@ dsi0_phy: dsi-phy@994400 {
 			};
 
 			dsi1: dsi@996000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8996-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00996000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

