Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DD7629A80
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D30610E3DC;
	Tue, 15 Nov 2022 13:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBA110E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:31:36 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v27so21896614eda.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cCi/ES9FuqiQm+KWnSYhmAQtDDx+gMJGxqOaQjv7UIk=;
 b=Wzx8DYBHXIYeswZwDCSF56PUk7V4nUuegWHM7Fy6L+Mg6b4kHm8LTHxaeNZEJMoA/i
 dzCxvPoOj7o8hhckG6o7DbOmNuZ61dazbyjTHKsXFh0Aqi4g33YZRH0uXNgYacvfIWr7
 NHdFsxnUyE5PZ6Jscp+azDvCoZZkalOuZC5C7QdYPVJAI5nZHMs+A4M+lUrH17UpkfHZ
 62UFl4cRGDB9vMH+ULMSCIs+He7M3K/OQ4qPSHBo/qziRcuXxI1LPC46dnuHHD3x4exP
 0lWJ7xY9ASWgL/r9a2P8cOPxycPcI98RxyMAI0ejbAGex4DBC163JVxGwuBHgv1Vgfbk
 UzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cCi/ES9FuqiQm+KWnSYhmAQtDDx+gMJGxqOaQjv7UIk=;
 b=cDeHL01cLslmZOe3p4MgZ5Trt/KFcjsNpBk4TB2iZ1lyYNGnYDL24qxpFtCM6BmWWY
 iF56/sEVPSVvJYoK/33WOU8/7U8d8wm59fx7m6pZnSiawO4Ee+2WpfYK5dvM6yP+2zIJ
 P+umsQBb70utxL5BkOpzoeg0K+DgHqB5NCpHGloTbDykIN/oS6PTs5yzNGXs04qmuv4H
 NqBUmbp7+Kdob/DKbR0NeFywA9mordBvkcWEb6ArQwv7ZL0WLEhz0CF/K/0tkUApu/rx
 vIPRa832Sdkywrkcp/wT/5b4vc8AVFs9QxLVdzQjzyeJpztKB7NLgmurbl9jbrYQDu5n
 kU+g==
X-Gm-Message-State: ANoB5pkpPjibP+a+rq9l2MgApd/Fjy9f9fqk8wpYWtIBcwenwiHrndC4
 h+gVgawn7ddRnxeGrKuNYU66Hw==
X-Google-Smtp-Source: AA0mqf7bl80L9QHfvrgMQcRIUQbJ3AxQoxSjPv/3VC37LXF/mTDNhPsQrYKvsB8QW8ZSzZywGnLJ+g==
X-Received: by 2002:aa7:d799:0:b0:461:6f87:20bb with SMTP id
 s25-20020aa7d799000000b004616f8720bbmr14959954edq.300.1668519096017; 
 Tue, 15 Nov 2022 05:31:36 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b004618f2127d2sm6162176edr.57.2022.11.15.05.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:31:35 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v2 11/12] arm64: dts: qcom: sm8350-hdk: Enable display & dsi
 nodes
Date: Tue, 15 Nov 2022 14:31:04 +0100
Message-Id: <20221115133105.980877-12-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
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

