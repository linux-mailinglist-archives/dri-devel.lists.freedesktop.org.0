Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6148D67126F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8AF10E673;
	Wed, 18 Jan 2023 04:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5265410E666
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:54 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id bk15so22758295ejb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFUVlLSeACjj16WsHbkWsVSEVF2l2EcRva5uQa0P5eA=;
 b=ta6cKFKIcnvxcLSDER30uqEhLewgKf7nJnld+v4uH1szhfnRVQlvzKt5Wu4mtDdWfR
 7NiTX+lr4xdrblHUP5hoA3h1hTpOnrwMfUoNqdlaeKug4u+Bi6u7+kwzzZGUEYUR5bjG
 BTNVNLTCJrTkm8pjmkFBFp94ViuXTGrFuY1/B3R63gwfVNtMpuWb+QUYmdZ76beRF55e
 H0N/n4gZr47liFFfZjfY7sZGNTn+T9YPHUWPSuhZ6+GuVyneWnfjYSIoJQiS+dKRMy+/
 k1rNUTAvv9SL474tfV8mCduzK5mAnke1Dr5RFo9WJqw42Wd6kkkMnmKeERRfpPo7IFpe
 GJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFUVlLSeACjj16WsHbkWsVSEVF2l2EcRva5uQa0P5eA=;
 b=3Uyb4REZ1NJK4plzj0IrccmbSiAYzs+q92rHUGUnxnaKpg1LcvRkDvXAMOBzu09au8
 cxIXyZGohvCimwhCZmAjty1Nt1k0p1fvoI+iw3l8vN1MizWNk9JSqvmCX7TrKYZD3gdh
 yDK5dGTmx8LuU3h6ydposrKQujGMkrDz3gayPpOI6WrvN4FKx15vBb0A/Ge0AzC9bhms
 Itu9YY4pvVHywGVCbv8+5aOY9Az1smgLslXaw4n5f4v9WbZ0GCdu49U81OdWMwDURNwr
 VAYxsFGdywVIsRoS5CkYRuLA6H4K4KGVkkKPvwgvW4ohiljTf6o5W5sDcmLK07DWO1uz
 lu+w==
X-Gm-Message-State: AFqh2kpBfXKPmTh4SvMuaaMpNQrwrqaqdNZkXxRUXKJDG4IxT/PPv2/Q
 gIEpS1vFPkFBp2TW/Ti0NPtTgQ==
X-Google-Smtp-Source: AMrXdXuwL+cahMr2hpDfw/s2+Q4zrO5FoqSL7dApKKtmlsGal/fg0nT9rnQSjPR2eepeEBEQf/h3QQ==
X-Received: by 2002:a17:906:1605:b0:872:41a5:7c78 with SMTP id
 m5-20020a170906160500b0087241a57c78mr7561088ejd.3.1674015172894; 
 Tue, 17 Jan 2023 20:12:52 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 06/11] ARM: dts: qcom-msm8974: add SoC specific compat
 string to mdp5 node
Date: Wed, 18 Jan 2023 06:12:38 +0200
Message-Id: <20230118041243.1720520-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
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

Add SoC-specific compat string to the MDP5 device node to ease
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 44c4d8d8f51f..ced62937165a 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1580,7 +1580,7 @@ mdss: mdss@fd900000 {
 			ranges;
 
 			mdp: mdp@fd900000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
 
-- 
2.39.0

