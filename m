Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911E368B36C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 01:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6537A10E312;
	Mon,  6 Feb 2023 00:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268E410E309
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 00:27:49 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ml19so30024611ejb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Feb 2023 16:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
 b=K2C8OmmYLDe9OgSRVG/UAqx6U+TulXaGYzBLcl9ur5siVQWhXdNbBvv+dRKGNwRUyK
 ON0vfsXGVHAH4TdIkBpW3RMMb7G9Cz25ktOBos7BwcBe1pptKBrGjbcQqSPx2RL7TMb+
 Rmp0PvidYYQZdADBlzSxdGfQou9/hylKnWYfd6Uudp/khcn8EGJ4yNmUS33lJWZeirIz
 ND+V/1Qj6PSSwkRweyREeb+5RQRTA4/d8n8IyEpLk7mawYCKKa9Ul22cm+8QSnAU0R3n
 vlRYgYmRZVQXRzgmmhsjeqGeK/vBb3rc9PwbBLR0C7/IPSoihk2+oggcgruNU2Mgv+w8
 lRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
 b=sAxEeZZ3YgEBR8e3anIbepJi1JWjgYNDt4gVff1OU547vmxeBaPDdunnge52WTbTVC
 NdFYuscj6Eq0zs5+gkRzryNHiV/PQU1mmSZGKA54a0cgTLBISM7P5IlVjoqaTKD/G0MF
 2wkhj/xXgYwHNWWvLpkr+Z7VCNpAIZhsg+F7bo7uM1qjmUnKcq8NCkLOF4cq/eHpRwvj
 8FVcvHUdZp6cChcajUVHWgdDzCI8ies5wOVwc07onHSehO8w1aFr8oqlmWcYJDQjYUvR
 lJpAGUZzxPePDxzTzV5eRcNcHxEsjfJaPHkipwBiSzIcYquSgt1RejMtk0i+/xjiUolX
 ZH6w==
X-Gm-Message-State: AO0yUKWDXJFyyDRrH4G2VUWgBgHkm/+TdLzAubTjbHfdNupockyHJKGE
 uafvxOpdhil7IeRHketZiKwMdQ==
X-Google-Smtp-Source: AK7set+19/vKl62cK332+ZCFWeKvlTsYTe6ZjYoKDmCYrN0DndYD9oPU9OCmnl+2iZc/kdYqtrGnNA==
X-Received: by 2002:a17:907:da3:b0:891:b1ba:4c85 with SMTP id
 go35-20020a1709070da300b00891b1ba4c85mr7946118ejc.74.1675643268790; 
 Sun, 05 Feb 2023 16:27:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 16:27:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 8/8] arm64: dts: qcom: sm8350-hdk: enable GPU
Date: Mon,  6 Feb 2023 02:27:35 +0200
Message-Id: <20230206002735.2736935-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the GPU on the SM8350-HDK device. The ZAP shader is required for
the GPU to function properly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index df841230d1b7..5e744423a673 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -284,6 +284,14 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8350/a660_zap.mbn";
+	};
+};
+
 &i2c15 {
 	clock-frequency = <400000>;
 	status = "okay";
-- 
2.39.1

