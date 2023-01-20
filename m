Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5534675F59
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 22:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1700D10E29C;
	Fri, 20 Jan 2023 21:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0169610E3AB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:27 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id tz11so17109602ejc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vMsCj9RG25O4A3HEOR6OR/jKZMnByaByNeXu250+UU0=;
 b=UblonUr+s3jct0bytTz09CEi/dhtVtIrCOEUydaKUCV/nj16FhVjCmy54wjNSZm3+J
 ilMkrDQHn9ekTI+QHM7HysK9lmccuS18P7DqbuUnIAHp1vxkoiUdP8jTxlyGqBHOrApL
 95czCWtwnx3dVgFJ9x6Qa6L4CdiFEUuTlrff5BsWS0WB/XvshTs+WnF2fvlcveY2+bRd
 8Gs6f4pmBQx6Jytc3dBfH7Ia0NZ8yYgBcDQ463zYzUpU0VtJwUodwawbWHH76FuenpAv
 180PMagFbFmzpRk2XcLSTA5IVHgWiciW8XotlLwTP+US0JryCSTsCwqy99RK2ANUZMjK
 +OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vMsCj9RG25O4A3HEOR6OR/jKZMnByaByNeXu250+UU0=;
 b=hxvrl23R6qGdVJmpoASOYnyMjDt8b8S7hxdex+kTcOpqu/vEf3NX+O7zet1zDK9YYC
 oUCNEc3fo9PGtD/EL9lLwfrIi5v9/fNY04FH3USAsUht4JxcEaRaiqruHZGmdx4Njg7+
 RaTaRjFicOTjEdNp+TrJuEvXbw5yEGpJGX5I3vVytPhdlBkF8vZ8EZKClQtlJYmPb+gO
 a6VlGCl33XRVMoolG6ZtaiMWe/XOwRh2wFHdRd5NuKoQSl7Ix1BIirD63b1iDAq82C+j
 xB24gRQ9K6FMIJ5f4TeH5p7tGD3ukfJiSQzNiE1G1958DwLgNsOw5XNcFwicFEnNwHym
 9FWQ==
X-Gm-Message-State: AFqh2ko847GT9UUWKrwWjLmWw/jJMx54u3DP001rnx50vxm+980Bslu+
 gYhW/mjkyvXG+rh1YtB2QT2UfQ==
X-Google-Smtp-Source: AMrXdXsnKTMnn8pBggT8wypvx4ly24qXZso6gSXtYC3gBFgndudQ2tx35A3eKs1c9jb4wVpBxKIXeg==
X-Received: by 2002:a17:906:3610:b0:7c1:8ba7:3182 with SMTP id
 q16-20020a170906361000b007c18ba73182mr17143993ejb.69.1674248486565; 
 Fri, 20 Jan 2023 13:01:26 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:26 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 6/8] arm64: dts: qcom: sm8350: Fix DSI PLL size
Date: Fri, 20 Jan 2023 22:00:58 +0100
Message-Id: <20230120210101.2146852-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As downstream indicates, DSI PLL is actually 0x27c and not 0x260-
wide. Fix that to reserve the correct registers.

Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 22bf6239c757..b09eb8880376 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3041,7 +3041,7 @@ mdss_dsi0_phy: phy@ae94400 {
 				compatible = "qcom,sm8350-dsi-phy-5nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
-				      <0 0x0ae94900 0 0x260>;
+				      <0 0x0ae94900 0 0x27c>;
 				reg-names = "dsi_phy",
 					    "dsi_phy_lane",
 					    "dsi_pll";
@@ -3138,7 +3138,7 @@ mdss_dsi1_phy: phy@ae96400 {
 				compatible = "qcom,sm8350-dsi-phy-5nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,
-				      <0 0x0ae96900 0 0x260>;
+				      <0 0x0ae96900 0 0x27c>;
 				reg-names = "dsi_phy",
 					    "dsi_phy_lane",
 					    "dsi_pll";
-- 
2.39.1

