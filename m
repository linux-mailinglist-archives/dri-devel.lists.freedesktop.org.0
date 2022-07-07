Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7529556AD8F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9AB11B63A;
	Thu,  7 Jul 2022 21:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F275011AFE5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bu42so13447370lfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LmG27VAvPqwLokCgRV28hmE5ll7C/l8IW7AnNAbPsYQ=;
 b=jDaLV0ZBuyPjn14Y17cRatbbTN/Tkwejw4WZCqmEGWAVvzFp01TyY1lb64FKqPlpYy
 eiLpoye+eG9hRhG2corcbLnLmL06G3Wqmp0K8G+bh4rBR9T8hX5Rji1Eaq+Fm+JCK5Tw
 vsUAMAY+2SS0uWh+gmcBL9AatnNo/C3ffGAnS6eAhcW5qOdILnjx6kkxPdVsxCgCPS84
 md7dr7V/DVs2gt0zvyoB8+7rJ25h082E8Ju/0CGiSExSSk/y7QvDUOqRs8QadyMjyw7n
 F7vrk3O66oVEGvZUCZ2hUdvkkVNaUL0A8ADnCYayOxEupDTsERiQioKlE/p40Uw8vFR8
 KUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LmG27VAvPqwLokCgRV28hmE5ll7C/l8IW7AnNAbPsYQ=;
 b=U2q+9Ey6oTgqnwxLJqQjQgFd0MH2wO9ltaVO20GgMeJ/2faT9swApiDfzuIDiF1mup
 a7Jrsq857m6/Z1rWzTPBzT3W4seatSjJ6AQtsT8bQKpH87KvV5kY8C2D2DP4TIW1OJcT
 mXeClw4ZWB8Qh/wQi2MI6Tw7pCXTXZtf2qYPdNc0FPHfgLm7Mmf0RwoL1oDwJgCsj6ev
 MNWZMjT05LNo0QmhBejvP9mL4hlYTE0u1ChSIsfsb9nB8Bot5iqAuY94QiC7IsxcctIR
 qS4SbD7KUyZgioOuQNd6zSlJMLIv57sX92KvGFcIaVxOGoYoikpf7Jh/Hpxa2IpHS3Hw
 s/OA==
X-Gm-Message-State: AJIora9v6e9nxxsNKakcZ5WtFLIp5Fy+g0hdDwOIz6e/DZG60EpVOLvF
 xxeiq/WBbQOwA/gSpXAaKejN8Q==
X-Google-Smtp-Source: AGRyM1smbr0/8AujEHBcLyNC+lvRU2ijM+Qi7JuhUY4++YSEHvrLz3qMQdbflIiMW/6j79iVTBfIag==
X-Received: by 2002:ac2:53b6:0:b0:486:3357:c67d with SMTP id
 j22-20020ac253b6000000b004863357c67dmr128289lfh.433.1657229534248; 
 Thu, 07 Jul 2022 14:32:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 9/9] arm64: dts: qcom: sc7280: drop address/size-cells from
 eDP node
Date: Fri,  8 Jul 2022 00:32:04 +0300
Message-Id: <20220707213204.2605816-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop #address/#size-cells from eDP device node. For eDP the panels are
not described directly under the controller node. They are either
present under aux-bus child node, or they are declared separately (e.g.
in a /soc node).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 21ab986968e2..004cbbb084a2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3740,9 +3740,6 @@ mdss_edp: edp@aea0000 {
 				operating-points-v2 = <&edp_opp_table>;
 				power-domains = <&rpmhpd SC7280_CX>;
 
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				status = "disabled";
 
 				ports {
-- 
2.35.1

