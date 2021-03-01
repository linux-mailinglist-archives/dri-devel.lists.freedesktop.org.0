Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E04B32951F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 00:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230986E0AC;
	Mon,  1 Mar 2021 23:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E9A89F08
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 23:26:15 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id v5so28273961lft.13
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 15:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=52VY1qGR0DBCvKNl4BeNryqM5sQ80IZrIVZy2czBVUc=;
 b=Y2R+b6uMaHEA4g/itnFBwvx3iEWxqD3EfbEN+/aG399V017H+AjY7Lzz9QGOuYgYkq
 alrXh7t89aRlrECo/bkRNVxr44HdOb9uZ8pUVYUbcAHMxYEsW2TR4s9gHEqfJdAQczgN
 ARk/xVUfc+MKwlOtm7exa0g6DzO6YrEuECO/m1bWtGfhV+K1orCOlxhlzIbFWO/jEqWE
 2DI6PutXiorRqLPlU6onwQjtAehzGLfNPt7lcKLshxaIOfT6RfFU1lsP/98005XbnooH
 L8sIHtxVFpRyyuzSR85tS6MCRMTiFEE2/9f4dAHvfV1IJdHA4zYbuK4PzqOwTMrqCYzO
 GXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=52VY1qGR0DBCvKNl4BeNryqM5sQ80IZrIVZy2czBVUc=;
 b=mPK5I4YL+Elq/PF+xiUY/2MvqWBxLXHz778gPMF24L4xqmiPxXfEk29qzWaR7yEoZo
 EGnYi0cNExi/t5PoRHeD/tFueHPaCvBGHXkcEGKByKMxBFukDy9dH3nq4mn6TP5cAkNR
 bk++aU8lHAGERI5tUTt05BKitsYaQ+ZHcd2zSDXQZC1eh3PgGDS97frF999ia0ghIaqo
 EZfkGJIKUPlcv4N/o6meiwtVuZqFVrchciOoFiyop6eNaslRDsejEX7pFOG4YFJcvC2h
 aGdGkmYfQN18X3QWVMEfY5KATu+URLHtQ19z6KAUAwjLbdBVUMV6halKoUZXQSmweShX
 g1MQ==
X-Gm-Message-State: AOAM532LIu4a8I7rXl6tad309dOO7WGipT0mjscnQDcFd2x/r7/yy1KB
 36ASbvYDebEc1+rcDzpw9HuYBw==
X-Google-Smtp-Source: ABdhPJwGKatMMje/buXvMiD6ivtxJLAtH6JNnHwJLzXtTXMLU/Ja+E3WQqmv4P4T5lvuTvPGMYsrCQ==
X-Received: by 2002:a19:2d5:: with SMTP id 204mr734618lfc.85.1614641173829;
 Mon, 01 Mar 2021 15:26:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:26:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [RFC 07/24] arm64: dts: qcom: sm8250: assign DSI clock source parents
Date: Tue,  2 Mar 2021 02:24:50 +0300
Message-Id: <20210301232506.3057401-8-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..b6ed94497e8a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2445,6 +2445,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
@@ -2512,6 +2515,9 @@ dsi1: dsi@ae96000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
