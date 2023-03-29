Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9346CF662
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 00:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B1110E56B;
	Wed, 29 Mar 2023 22:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F31710E1D3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 22:25:05 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id h25so22133513lfv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680128703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QEueJb8wxFS51D5H+YQGZcmoJREAPX/3P/EgTv1KRmQ=;
 b=lRUgCTj8FbwxUykPzPj+tXrYXzquUMA2SE3l2V7o5HuwDGblXGkm5u3lUL3x/myZo8
 GSEGBQAQ+ti9lfTG9xS3ZbCuS7pIgHc9qpQ+c7c35los6UTyTjRQE4WrUaNhEBVxQJqb
 tnq5+OBi2/9rJ4P/COOh2QjYcTX3fq0W2OIFW/fgIUTSh9M7djIZXioLdhD7WKOxHdPp
 V4hxBsrHLOTINBXq6err0YTWXfThPMLIZrrYekvrBQ/o0BJrDPf5rPku8cboAJr+vWBV
 c8AX5APP22S5qZ/3G/y2i7ecgg+hzcAJhbTxQ9+6rp0ibWKYX11Vzhyuhm3weNzRw14k
 jUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680128703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QEueJb8wxFS51D5H+YQGZcmoJREAPX/3P/EgTv1KRmQ=;
 b=iaHsIxpN1GPB+renQS+zmva2i/QPu3Rd6oU/FqSnYofDxbnor6bBg4/oSaxPR4sBhO
 teRF+INHxU9DiSxsiDMe61uQCIJJK0n5kscw0TrXsOCyc5c9cYrpj1nqahWyjwXMrFBV
 84z6rGsxDf5jzOgorNWKimv6CNb816PcknhzKnP+pjHIj7o+qgybOa9/9H1NCUTboFvo
 7uW7ImoRtl1T39+eu0QSl3ihoXEIGnhEEPYGP29lk12Tc9bBY6wfWDBpb/zCrAp7fAsU
 f/YkM/JdrpCMq0KtleY6O1SmMnx3kaI20ZwYuGjHlIN4/nQy8o0z9FqnbNLdTnaKN4XW
 B5GQ==
X-Gm-Message-State: AAQBX9fCUCBU1XfR55HFHiu2zceNtdCNk5mY1pT+tl1WT1H/Wv/kXzwP
 oENTwNEDenfsoR7U+SiKWJ4XaA==
X-Google-Smtp-Source: AKy350auET5GfqVeLoBe8QXogMU0qUTo2PHB76nYRpaWXwMAGBCpKiFuj5I23ncL6OK5zEWUTpjDSA==
X-Received: by 2002:ac2:4c26:0:b0:4e9:a16f:a176 with SMTP id
 u6-20020ac24c26000000b004e9a16fa176mr6731039lfq.36.1680128703439; 
 Wed, 29 Mar 2023 15:25:03 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y26-20020ac255ba000000b004e9b307d2c8sm4724226lfg.238.2023.03.29.15.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 15:25:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 3/3] arm64: dts: qcom: specify power domains for the GPU
Date: Thu, 30 Mar 2023 01:25:00 +0300
Message-Id: <20230329222500.1131836-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
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

The GPU on msm8996 is powered on by several power domains. Add
configuration for the GFX CPR and MX domains.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 905678e7175d..ff4fb30f9075 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -521,6 +521,10 @@ rpmpd_opp5: opp5 {
 					rpmpd_opp6: opp6 {
 						opp-level = <6>;
 					};
+
+					rpmpd_opp7: opp7 {
+						opp-level = <7>;
+					};
 				};
 			};
 		};
@@ -1228,7 +1232,8 @@ gpu: gpu@b00000 {
 			interconnects = <&bimc MASTER_GRAPHICS_3D &bimc SLAVE_EBI_CH0>;
 			interconnect-names = "gfx-mem";
 
-			power-domains = <&mmcc GPU_GX_GDSC>;
+			power-domains = <&mmcc GPU_GX_GDSC>, <&rpmpd MSM8996_VDDMX>;
+			power-domain-names = "gx", "mx";
 			iommus = <&adreno_smmu 0>;
 
 			nvmem-cells = <&speedbin_efuse>;
@@ -1251,30 +1256,37 @@ gpu_opp_table: opp-table {
 				opp-624000000 {
 					opp-hz = /bits/ 64 <624000000>;
 					opp-supported-hw = <0x09>;
+					required-opps = <&rpmpd_opp7>;
 				};
 				opp-560000000 {
 					opp-hz = /bits/ 64 <560000000>;
 					opp-supported-hw = <0x0d>;
+					required-opps = <&rpmpd_opp7>;
 				};
 				opp-510000000 {
 					opp-hz = /bits/ 64 <510000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp5>;
 				};
 				opp-401800000 {
 					opp-hz = /bits/ 64 <401800000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp5>;
 				};
 				opp-315000000 {
 					opp-hz = /bits/ 64 <315000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp4>;
 				};
 				opp-214000000 {
 					opp-hz = /bits/ 64 <214000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp4>;
 				};
 				opp-133000000 {
 					opp-hz = /bits/ 64 <133000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp4>;
 				};
 			};
 
-- 
2.39.2

