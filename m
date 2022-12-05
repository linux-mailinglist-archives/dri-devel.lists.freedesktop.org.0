Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD380642D21
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 17:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C8C10E267;
	Mon,  5 Dec 2022 16:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BD810E261
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 16:38:16 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id fc4so22236194ejc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 08:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cCi/ES9FuqiQm+KWnSYhmAQtDDx+gMJGxqOaQjv7UIk=;
 b=ZoX2tJHWrCkPkBcrX0//rHOVwz5BahSF28MTK6X+RN/dk4h/rxeBuGVO2L+dibazut
 q7dOt93tWuJleVc7TS6TfkeNOrGDCKN1ca5iX2RNDfHSaXI847X/7X8mohGv40Ke1/q2
 1emNQzt7bVLgkfLWuIt4n2KHDh2hKi/291aFB2jQlUgBJSIbpsIzBObIh0XAxctVbAsZ
 GiIU6wjVJ4/nIttKRhlqR/oQXSLkNwlW3ph3pVawHbFgNILVk12Ec0eceGyQu72lvIX3
 97NyQ9iScu7Qv7MMp1Knw7r2uwZtfZSaqPQ+6PRNhN2RV+7qKA0P8+yxLXPFe6HMg5uN
 HmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cCi/ES9FuqiQm+KWnSYhmAQtDDx+gMJGxqOaQjv7UIk=;
 b=iNgzdFd3MgZUfYTFcQPpqGg2Iw4oX80A5KKXKNKKj/gEnF0IzlL0fKvoddDHkotNWl
 jmDFORMUZmWoszIgQOCq+5YodOPUJ/bIP384tzhb39vTqKrLEZ5QqNB6fy68BTOB5qtX
 DlOY0JjTxZQvSQVeYDIzu8PbOcVSBWM+xA7wyD8lSV45qC/4oi68gh9HUre82lf9GVxx
 4XLm9HL4dtPU9zpB3/quUd0aUNevRy6wrgYZHjwJ7boY99hLwj1XUbaV9GQ/T3Wspf7u
 GqqdFCkaGMlUBcuRWuBJDZswFrKQqU/mdTFHxfV3LWXV0qlTaGKnGUceP4eIoW5F2vUc
 YMEg==
X-Gm-Message-State: ANoB5plPevLoqmn07wEDQOS57ZDy4wWaL+sT40c/IHJCO1+0HjP0UQEl
 wJNCpElYhThwV7BEy568EDUpFA==
X-Google-Smtp-Source: AA0mqf4uofNU36445H7vBcqW0PrG+7W2qeGiYvP9TetTZmvHakm9v4rcNC4UpjCea/HDj5gEZrsskQ==
X-Received: by 2002:a17:906:6417:b0:7ae:937f:2c38 with SMTP id
 d23-20020a170906641700b007ae937f2c38mr54991745ejm.201.1670258295604; 
 Mon, 05 Dec 2022 08:38:15 -0800 (PST)
Received: from prec5560.localdomain (ip5f58f364.dynamic.kabel-deutschland.de.
 [95.88.243.100]) by smtp.gmail.com with ESMTPSA id
 e21-20020a170906315500b007bed316a6d9sm6413610eje.18.2022.12.05.08.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:38:15 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 angelogioacchino.delregno@somainline.org, robert.foss@linaro.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v3 10/11] arm64: dts: qcom: sm8350-hdk: Enable display & dsi
 nodes
Date: Mon,  5 Dec 2022 17:37:53 +0100
Message-Id: <20221205163754.221139-11-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205163754.221139-1-robert.foss@linaro.org>
References: <20221205163754.221139-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the display subsystem and the dsi0 output for
the sm8350-hdk board.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index e6deb08c6da0..39462c659c58 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -213,10 +213,32 @@ &cdsp {
 	firmware-name = "qcom/sm8350/cdsp.mbn";
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&dsi0 {
+	vdda-supply = <&vreg_l6b_1p2>;
+	status = "okay";
+};
+
+&dsi0_phy  {
+	vdds-supply = <&vreg_l5b_0p88>;
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &mpss {
 	status = "okay";
 	firmware-name = "qcom/sm8350/modem.mbn";
-- 
2.34.1

