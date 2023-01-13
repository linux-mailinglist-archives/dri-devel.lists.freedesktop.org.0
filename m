Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B67B66914A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62BF10E9C2;
	Fri, 13 Jan 2023 08:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1655D10E9B7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:38 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b3so32113628lfv.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FCTRKHtFgYaHbPtkSUZRRjr3CHS5tb40ajhOyrJkC74=;
 b=GV2IkpaEE5wINYClQCW8wkutrbrq7NWwCJlD7BoC/PxfOBqE9K2m5bFOMWmTXitF//
 p/iD4pacX1FpdFX0bEAtOI3WSpu96iQe4ksNWSQimCe5UeR4Xs5eW2TpVZXC1ssnESGv
 s91d/ZvAZ5eusLcE8pONCRsVFcL2Tqu8rbjogSjDMEQFHEdp/k+DwYP91J4TjTWhtPha
 1u8+GZQyyP3e/UjaVZesHzlPOzcYCMfU8KNg2pDw/kSGrKsAnCCeZArFEy+gHtm1bUCg
 C26pXI6ZR/JfA5rgcSugaRu7prscELZONXVOVIfoaEyyakwdZywQIblvKErCjkduUhQE
 GuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FCTRKHtFgYaHbPtkSUZRRjr3CHS5tb40ajhOyrJkC74=;
 b=g7vRh/Qn/Enz8IeAjh0qbBqRfye5mbcG4ycyGgCvrHXOIZ2fF8byTbkbYkPcfD3TF7
 bbtwKwJCOvb+v5m9cXRv78SVKw8MraHPB2GC8Pq8eS+ieuRJoafqMOOrYs/IJcrc6bZ0
 yYLq7gs/pvWHC6OrxrasRbY8oWVsq4Rj4LJfBe8VDk//MSezTniyXJvWCrsF6VudUJwQ
 Am1mqa/0KS5syLSEcvXoqzYLNvKKzYiAmfttywpH9oNsH2lQDARu28VJW+BGrw+fnxKL
 bWrvqpixMz0MiCfhUNECqSOs8RegARHJ4DZslSBP+PpSE05AjDrMsnjN/CMAq009bIlG
 M7Cg==
X-Gm-Message-State: AFqh2kqmWokH8MUFxkGRINqWDJU9KuJvnfHm6vKFJ5tZcHNhshwFRS+w
 NjRjBbO7uJ1n/89hkPx4F4tNDg==
X-Google-Smtp-Source: AMrXdXtGgF+DSrc/gjCX9/C/GYXrvH5S+P5vQLT16mtsr95X7PYDpdyjhraUcHtMLXiAl6j2Jj7rAw==
X-Received: by 2002:a05:6512:3f1e:b0:4c0:91d0:e7ab with SMTP id
 y30-20020a0565123f1e00b004c091d0e7abmr25889004lfa.28.1673599056463; 
 Fri, 13 Jan 2023 00:37:36 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 09/11] ARM: dts: qcom-msm8974: rename mdss node to
 display-subsystem
Date: Fri, 13 Jan 2023 10:37:18 +0200
Message-Id: <20230113083720.39224-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
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

Follow the schema change and rename mdss node to generic name
'display-subsystem'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 1d8b8870b990..2e46a8b6bb14 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1554,7 +1554,7 @@ mmcc: clock-controller@fd8c0000 {
 				      "edp_vco_div";
 		};
 
-		mdss: mdss@fd900000 {
+		mdss: display-subsystem@fd900000 {
 			compatible = "qcom,mdss";
 			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
 			reg-names = "mdss_phys", "vbif_phys";
-- 
2.39.0

