Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8680C85A4D5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 14:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619DF10E3AF;
	Mon, 19 Feb 2024 13:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dh9fi5T5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F079D10E3F0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 13:36:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5129c8e651fso2671065e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 05:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708349783; x=1708954583; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lYeaGN05CrS5pFcr/tEpV5+bAgqlMkDoOULt3QF1Ggk=;
 b=Dh9fi5T5KvKxWQtq+A6FDLzpvv0AxE2KFhlL8yZEGXCDEj5fqgTER88/322FLg7sZS
 j+9XqFlQPfcMS7wKc0aRIe3iKROPiQy9+E44rlMovJKPf6OXrIzDsNhk2udglbYRRTAG
 Rgs7x8y3deMCWktGSMoom4HWFqLD9s1EwvwNBBmIEnLPb7QHUPT51fZ+6lVpC1fPZ6C3
 qHdIm9AcwPeWGp6nZ2Unq2o3rijPnMOU3AJmjQI9bRN3g0+WbO9U/MjN7QkU9mLzeLJi
 Pwezfj0xYbGFcQIHeBTWE0HtEOhHoMWaO6z/OTbuM8no06jqWWah8Bge5Ruf1r5+PjzH
 Ts5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708349783; x=1708954583;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lYeaGN05CrS5pFcr/tEpV5+bAgqlMkDoOULt3QF1Ggk=;
 b=lW45YYsey+F/4R7yxdVn79bZBfKfhtJ1R+Y8DxK0ZvzR/k8eD6xeurogTZFmfjt9WP
 uDY8GVIe3UA96yF35XGq0sh987CDwcGXRKlU7Lvsy2+kXSLZlYaIutjckUHPPcTP6vdr
 366izgUdLmu5m7OOdkZwy+Gus1ymfhyUGth7EQ4Do2qucJ9qGM0rQp9xIXRt6QhLWv5w
 7EbH9Rmp4Y0/xGGfM6czzQ5JWZToHKUrBwOrU9lObMuQ/LNqj9VSKYZiX/e8/oqb2QDv
 Nw8VOaWLh2zoNg0asdxYyDACWj4muIF4L4Y6CPSdAM5uKjOD31OmG+mQuyJoX8pLlC3k
 1LNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGI1XIftX8A5syMsdlfmRv01yQ7DuZtCTZgZy/rEo3QICxqQ2cki+1dl3zEuSLk4FUbQjp6OqcgnvenwAXb9slbLGnWO/IKCKcrwOJvpf/
X-Gm-Message-State: AOJu0YwzmeGLgjUjE0u/vHb4MHN3Wd6KQH1qWvNzaYKY10sOlRrvPT9h
 mtPwpcgMpcIGXtuoqvxDwm7JOxS4oj+zqGgZ+8tQkZfCfMYL/BrJ4Mdx1VH7+G4=
X-Google-Smtp-Source: AGHT+IFrCmmRI9koWR8+2EcQASd/IAuIdf+8BxbSGOHLyOpoeNa+Y8fldaDiDE1mcZ7oQlR5RnyK8A==
X-Received: by 2002:a05:6512:e8f:b0:512:be57:6dce with SMTP id
 bi15-20020a0565120e8f00b00512be576dcemr701562lfb.12.1708349782988; 
 Mon, 19 Feb 2024 05:36:22 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 q29-20020a50cc9d000000b00563a3ff30basm2900168edi.59.2024.02.19.05.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 05:36:22 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 19 Feb 2024 14:35:53 +0100
Subject: [PATCH 8/8] arm64: dts: qcom: qrb2210-rb1: Enable the GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v1-8-d260fa854707@linaro.org>
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708349759; l=852;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Qqtg4ojpOawwNYOqVpOvtJgi/pUtWJ369I3bzfKA0X4=;
 b=7s6b1o0Wbq+2Q9UxmDpWZcz1X+WrOuTL3z3Ndhfv4cWpB+GS8fT0yuSsDnxb4CeS4G3tVFSpH
 aC1g/6W2UwABvq/j2FmZN37rrNOb1IlvgJD1D3eP0KEN8TNjCvQO0bL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Enable the A702 GPU (also marketed as "3D accelerator by qcom [1], lol).

[1] https://docs.qualcomm.com/bundle/publicresource/87-61720-1_REV_A_QUALCOMM_ROBOTICS_RB1_PLATFORM__QUALCOMM_QRB2210__PRODUCT_BRIEF.pdf
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 6e9dd0312adc..c9abca5a7e39 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -199,6 +199,14 @@ &gpi_dma0 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/qcm2290/a702_zap.mbn";
+	};
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.43.2

