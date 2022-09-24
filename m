Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F205E8A78
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177DC10E55B;
	Sat, 24 Sep 2022 09:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEA110E557
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:17 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id o2so3597927lfc.10
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IaDfU+x0iC4kL+CdCv83HsmEDgx86x9FOtM6hlVBCT8=;
 b=AiSA8IyJNysHCHCkQDMKGftRLp4tHcyimA83W/ywmDGTR+fjqztN7F4uwvWYa8qwF9
 FZjhTkdoQkGal+vfFV4V0RRaEkYrU0byugnZNvqiInO9cIjLeB/kO8f7QcCBUbZA5W4x
 VerAif7EbKyliXcUL8nF+R8mAfg681wLUQXAXPJcdbLJaPNzWhokn9MnxFkUd+SKQR7a
 OuoSDMaIb0ih56wq91CoWp9vK9riEtByOSLrMOWG2W7Rf7dJmjgOltvBaZy05udD7DqJ
 rL6lFWBq9FdciX0z63vQr3ky1/HVyDIPBv4uA2DMirEhttZC7zIT/9ZipESsUqyzwhIM
 uBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IaDfU+x0iC4kL+CdCv83HsmEDgx86x9FOtM6hlVBCT8=;
 b=NqlMwmGFoZ6YyY3Y+2/II5uaoFzpXG4VmN4CVMUvtkenGX+bA6hiuVF5EhduMbbmYg
 1nOpbgKRtqGrdSwuyee7YYQgjGVe7bGL9TWUjoWwwdSDzBI9saMAXTxvdpQJKAmY710S
 os5bokEDXNQMEvLZX75gBfkHt3z/ITEye6/OMsNCGQTovoBDt0OYfe8sa0tPS8jfD0RL
 I+Z/r88jh6uo1SkLmxBlmiwbqniVFbkjfptzADw7E4LTD+VjYai73HwOghcx0vHqx/Xj
 NiNdm3GmIjb9mLtrpl1WxL79SM1rabLi5QjduAuQEDQ0rPOtBSFSvPy7po4CBXBA1GJs
 L+uw==
X-Gm-Message-State: ACrzQf1ymaKpMtJFqs3L+obPr7VZEm6g0l2jZrGODdugMB085bQkzs5R
 PoqwA2Rgbrl+jDP3ga0ujL1L2g==
X-Google-Smtp-Source: AMsMyM7IMH8w7DvH2apzALsP2PVzcbjXMWiAMeWoc2qxzWkt697ecLVwzRl/Dro+1D8y9tqK8zA9tw==
X-Received: by 2002:a05:6512:3502:b0:496:272:6258 with SMTP id
 h2-20020a056512350200b0049602726258mr4540887lfs.429.1664010076737; 
 Sat, 24 Sep 2022 02:01:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 9/9] arm64: dts: qcom: sm8250: change DSI PHY node name to
 generic one
Date: Sat, 24 Sep 2022 12:01:08 +0300
Message-Id: <20220924090108.166934-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 5843e46a3164..e3ea39fcec13 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3592,7 +3592,7 @@ opp-358000000 {
 				};
 			};
 
-			dsi0_phy: dsi-phy@ae94400 {
+			dsi0_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
@@ -3665,7 +3665,7 @@ dsi1_out: endpoint {
 				};
 			};
 
-			dsi1_phy: dsi-phy@ae96400 {
+			dsi1_phy: phy@ae96400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,
-- 
2.35.1

