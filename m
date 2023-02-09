Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBB8690A83
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EDA10EAE5;
	Thu,  9 Feb 2023 13:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4385510EAE3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:38:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id sa10so6369790ejc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 05:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=teoBKH/xnumZutLhR1lTsGt6HiXAAYfHJxJM2LYx8fk=;
 b=G/uuvbOxNB1jOHxuIz+T35oO8H5+UMf98NvOjAmZ6vFzlgXXhaqyNlQZyV1Smi3nD7
 woTPs7dozQ/4iNsI5dT/a3zrLY/iFisvMeaxYuRF2Ni+SxfpdBzuCmZ5JUNHQcpfijRi
 vK5/bbPms/NUvTNyotHEHrQbbtUkjfrZ1d1nDlCg8kq7X2yUCrGBhhzsAXHFQl1aY4x7
 /Fc+VchqkCYIJ+5tbEuoMvNHKwkFYERkiTf3yFSGEROU2DaKslQw4Q/LNbUnGx9QY3Iv
 stL+PC0TtOwzlCsGTIJPLrgtg0KkqUul2x5Ok7IH2ElgzNFABW0xuZRQqgRy+zRysD/5
 m9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=teoBKH/xnumZutLhR1lTsGt6HiXAAYfHJxJM2LYx8fk=;
 b=BNX6BOivRObJpX3vjsbAU3bCisKvsSZPYeP67tHX3FKGk+ujKlzZm765N9u3ygzaOx
 jC7ezN9r6dBsaR/kfAVX6H4eFEgr8Wf4n9i3Gk4Klf5c1PJwi8vPNeNunGzdeze3cUrv
 QYR9lDwMd+myn0rrc1fOAhjA4s16RFoO6EevG+s04Lpbqz6AjeLqAIxnImt50oTL88tr
 i87zne4DYtYC8w4ICTMAKpBcQxYYQmsKhNqkCXPOF7VpQCZoNGpw5xakVUnkyqhA6dgs
 lk3/hal+8y3jhJ2GazJhnh01WVgV/Gc0DL3GapuFkLaJG9I27a4ErzguovDr5BfaIjDA
 dXtw==
X-Gm-Message-State: AO0yUKWTPhUZYfAaA9h5ou+ubKL/8lIWThpLKtSu2rrmKVgYX5MY85lc
 BjFrxzxKJdvZgdXT6P78Y5Guww==
X-Google-Smtp-Source: AK7set+DHeRxdOeZF9XY/umYouZ9f/FTI2/QQ8wP/VEMl2Sh87/V1u0FZRWMTxgofkpHc3TJyGBUtw==
X-Received: by 2002:a17:906:149b:b0:88c:8c2e:af17 with SMTP id
 x27-20020a170906149b00b0088c8c2eaf17mr12516883ejc.2.1675949928898; 
 Thu, 09 Feb 2023 05:38:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 cd17-20020a170906b35100b0088f8ee84b76sm885553ejb.105.2023.02.09.05.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 05:38:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 6/6] arm64: dts: qcom: sm8350-hdk: enable GPU
Date: Thu,  9 Feb 2023 15:38:39 +0200
Message-Id: <20230209133839.762631-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
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

Enable the GPU on the SM8350-HDK device. The ZAP shader is required for
the GPU to function properly.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 54654eb75c28..09baf6959c71 100644
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

