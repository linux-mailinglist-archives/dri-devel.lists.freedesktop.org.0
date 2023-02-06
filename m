Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5DC68C0C1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 15:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7462B10E40E;
	Mon,  6 Feb 2023 14:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9D710E488
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 14:57:19 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ml19so35108523ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 06:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
 b=FhbKMLoNFUAWgn+KHQ69RJuJ/z1JEUNsDQLrN26ILh2sf38Q3tVGNkFLuWo7zm3hH4
 VLLg21KcCOr24lh65lsSoa7CFwvGDQg42Xs4nYoAgezqd74ZEifIf7d99YOwT2POgPxu
 j04Uzj4TeRpRGz/s1hUBFsC0C6dM0EcH5wEgBez56Xx15AdyJ/h91W2KsUEBWywAiVoO
 wx63kmm1nCsonj4IV3MCPAY8NJPyJylDJZEps7dYSqUZT3dHnoOkB2IbRt5G+ZvIOmf+
 7DNnzBJwmUc79kb6U31NzTmt4lWLA3gS4hqhDcw2RKrAyNwORB1EVwHdF44tBgTWs+gc
 Qpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
 b=dqfD7Enugsh9EHnbUI2Nrp9EWtDjU/YouaoPTeg2XvAgUdoFRpF+lfkwshONmZnYjV
 Y+fUYzXXZENPniQ/ZWQdafFrjNs6eWFnKvZsaKcCHvxuINZDzckCAWc1kcl7+e3WpXij
 v9V8MZdviTKRgIjUMO0j3IDXtARTIGZ/QYdihMQwOlg7zJw/j/x6Ih+lFA9wNnxqrthX
 ZWRVmqGFXGNvjKlGMqkojVf2es/tURd5em7evKXo+nteJniVBwxhMnAgNO2Qd+WQu6bi
 AMdMeYBBQXACgHXhtqGLT3OO/jjGCGuTfsy7jeK1qQsI4CsmQROiw/94fXqivCai/xy0
 Wbkg==
X-Gm-Message-State: AO0yUKWfrPe7Rxoy7iP55IpK5MHaosgmVAdQdLusaJyClZIFFGrdAPbu
 0M/WlwY120eDzdbaoktp1d7hHw==
X-Google-Smtp-Source: AK7set/BbBwZ2tUdJQcmNpQqX0iYCeNQD2U/sxj9vmbzbl37IVzdRVXDEFmvzjMIvEIWKes98WxnkA==
X-Received: by 2002:a17:906:4b57:b0:885:2eb5:68a5 with SMTP id
 j23-20020a1709064b5700b008852eb568a5mr17647451ejv.66.1675695438882; 
 Mon, 06 Feb 2023 06:57:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 06:57:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8350-hdk: enable GPU
Date: Mon,  6 Feb 2023 16:57:07 +0200
Message-Id: <20230206145707.122937-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
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

