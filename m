Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F50329536
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 00:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA5889DA4;
	Mon,  1 Mar 2021 23:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013056E90D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 23:26:27 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id v5so28274630lft.13
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 15:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/g683yfKMbSwanrv0GKDcyKMtduWqmgNMeU84dPM/I=;
 b=u0I4XS9EQX/RrTgjEwRh1DB7T0t3yiqaL5emtUIOeGbIpVH0/EREIEzn4RvRWESsqA
 xEUUdpsONp6kPF32tGzTBE94mowKWllT6WY9CYChA2dnE2ynT7pGeDc4SdLMxrrpCSLI
 CAvN2wuXn92uG5cAgZc9hE7yokZMAPHejx4aSopWGqI7WoPMHLgt9ccVApik+q22aMz1
 pMcowInq9xmemsW1rvs7yc7doJMWX1hyMzuFKn/uncOPRs8WtaN0J7ReuR1Ln0zk0wZb
 DySM1kicgk7quh/UMfNsYudSI50LG/bjVJ/OXRF2l+jBcx0Ge67SmxeEJEY9PBguo1jX
 nnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/g683yfKMbSwanrv0GKDcyKMtduWqmgNMeU84dPM/I=;
 b=ks4kn27kGV1Ww8p+GY3ZgyigZXEK1jYwNlFqxJ0yuzebgHQqWd8Jspm+Jpq7K5X0i6
 b6ls0KuthjtRAKl7zfbq4SaBvS7Zix/dQuFncld5ITtcPW63QFbpzZwtzSX68Sgd5Y+x
 at3jOIMmKHCPapCgCYGslVe/pOCbYUWh33maEzosshzKyK3GiknBlHJszDLmkjfOVoV1
 JzzBYd1Ubl6Igq5yjmDOey5c8eEqC3nhKpFUXuCPzwPiQF0vDLZoQl8FMCUjKuyMCRWj
 Y+JwjAJoHGZ/2/bBUFFYkNwwNly8uZCYGCURsFhUnmt5WMzCIbRyk1YSjypFOLJEA9hg
 IgcQ==
X-Gm-Message-State: AOAM531z9zc0D+vLmv2rIH9Jzz3smuv/gvI8LgQoJCTCasjBKANqbO9s
 b6a5dFbyLw3bLY1l9TWGRhgCfg==
X-Google-Smtp-Source: ABdhPJwPTWy+s1unheR5Ge4u57rIEixPwt6TRaRd9RWzxhBf4Acq36RsiXpxUxAqkYPLHx06kQ+yWg==
X-Received: by 2002:a19:9109:: with SMTP id t9mr10475451lfd.49.1614641186429; 
 Mon, 01 Mar 2021 15:26:26 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:26:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [RFC 24/24] arm64: dts: qcom: sdm845: assign DSI clock source parents
Date: Tue,  2 Mar 2021 02:25:07 +0300
Message-Id: <20210301232506.3057401-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..2166549382c1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4113,6 +4113,9 @@ dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
@@ -4179,6 +4182,9 @@ dsi1: dsi@ae96000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
