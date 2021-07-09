Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108353C2AAC
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 23:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859786EA92;
	Fri,  9 Jul 2021 21:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9000B6EA93
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 21:07:36 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id k8so10115313lja.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 14:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+PAtg9BEfaBeVDYjq8MiVIG3ylCM5YSds46prh2L6Q=;
 b=skHag2o7KhfRrEy1+Zb3RJhW1QSiaraLtZS7zMDlXXqo3ne1aS9zFomHYMRBX3YfX6
 U4CS953s6Fw7rmxa8pYknBw4ZxrelKFLL8z5+J22Az8Bq+7Vnj+yzPl/ed335EvvRB/p
 zISm1082OLfw4+XPeuE/N4n+pKiGahV2wMp2TGnJi1wk46gtnJ0wsgy6ASF42+d8OoIT
 d+Ac/noP4adXJHY0qext/Pcwcm9bR/uKEaLctl6dbgnpcW6KsPt1u/ZgPRdiRUHpZls8
 BRJd7CqR9KAFGk9U3RsWDjT6mQQBzWTR4KP4iFXD/ibUMXvnjD/BUVn9fjh3/NgNx/cl
 C3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+PAtg9BEfaBeVDYjq8MiVIG3ylCM5YSds46prh2L6Q=;
 b=CCO92S0vE/1KCjoAv+kAL5GkRigTfR+i9u5lYGQcsR5NW4dVLvGBap8zmsHoqOajYr
 BqkbBpYf0D0TPvSooekyk99JX69v1qo7qik7oSDak/eRxTBfwcErsdUBEzmiFijG0/mB
 432oFPRRhKjAtpNEje5hwT+wVIV1G0L0Fnjn4qoS88SYaKM+9DwFjtt7vFeppGZ+RrTE
 NBM+l7UiDMoAeCP5KBkiFQEc3EGhNOmas2gVYIPKiOiPCUF6GPVJvv8cTASZqPK6//51
 sbxVa/+hoE0ETncaEtgfYoPtKiSTOLziE4E3bSPK0jiHgMb0gwj50kB4jnn/WJSB8DQU
 eQ3Q==
X-Gm-Message-State: AOAM533jnpfF9FfVg2NexA4jpidUHHGSjFbmGPcc7WYnogIWxnA3Bhqi
 ZfrJ5G+HZRxiGXQx7+RrgZV9Bw==
X-Google-Smtp-Source: ABdhPJxQVQh4foQW+IEnamXeadag9G00y2Lto7Ys7u9O2JJ3HDGd7JwNKXB3rU6aWujXn8BLIKzBaw==
X-Received: by 2002:a2e:9798:: with SMTP id y24mr24010266lji.227.1625864855006; 
 Fri, 09 Jul 2021 14:07:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 14:07:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/8] arm64: dts: qcom: sdm845: assign DSI clock source
 parents
Date: Sat, 10 Jul 2021 00:07:24 +0300
Message-Id: <20210709210729.953114-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0a86fe71a66d..e13097ef271a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4260,6 +4260,9 @@ dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
@@ -4326,6 +4329,9 @@ dsi1: dsi@ae96000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
-- 
2.30.2

