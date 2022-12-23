Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC5654AE7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 03:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBCA10E5FF;
	Fri, 23 Dec 2022 02:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD08010E5F1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id co23so3397966wrb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHjoTnRNTZFA0ZBsqDkIXARH9jeUb+0DAfgRumKgoyA=;
 b=lBDQtSit+1LqfmJbT1uhbKUQP17QT6jOYcXSoMTBTOZLa2xXlUhOmhQKhAvtRFKopi
 Ay1nv3bo5Xrq8o5PcsK6DjS4wliQlovmoSSTSpInMaUc8mErA8Ro1SyVnrhidsTAfAzl
 SFv5CVFN01XmU0CiED1g7Wh6QdmlHPrvuSv0YkFUQWkCjCY4Crb582wgyPwFIVloO4iv
 UVn9aehPzGoeFjylzhnKGyO4yMuMEQIiQ/My8GmvBzObXQ4uLD6kmTKz3PeVzkTgXorZ
 RvAw4sA4vGMjWnfUnjv7wxYrvC92tR8p5w0OpByZ87hIyTzNOnVlEOFoKOix2lgJCbH3
 zzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHjoTnRNTZFA0ZBsqDkIXARH9jeUb+0DAfgRumKgoyA=;
 b=PmP4XGHi/h5ww90/noczxmyJtBqt9jSlInG08zBY3sD/n+OmfBMup+bvvfGqKfqCHj
 bBnypJKLL77S+tUK6KxUFOf+j1twVs7R5i17I/R3mMM6ksM/c46YxCr8x3pZzv4ix0/K
 DM8RvgNSl2ck8AqTZEdSsuM8u0IpXu9im8F4rPXS6uNlY1blKiJI+x491+UoD0PV0Y2F
 AHyh/gQ544vCFECpSHH+y2HXpYIF6HjEs5rJNM/XrkwholvTJ/meZ3Upnd/boJWN3BpG
 /4+brm8OAu+RwNfCHOpCdkYkFi9ELEm0Q1RTrPSNji2Rbqo0B6HRsb2ou5T306MINEN9
 jiBQ==
X-Gm-Message-State: AFqh2kq2oRiY+qZNlBeBysj84EDExCUXyoYBwFXChxTGJY2Aho+uQmNt
 UDg724bcq5l02Tg+BvGbh3ROmg==
X-Google-Smtp-Source: AMrXdXsjlvDyNSKBvKq4fxfuBOK1I1bluwc0R6MKJ8g3VyJ6MY+VRGeAv1iWAuoPLG8kUzwNT8Trjg==
X-Received: by 2002:a5d:4950:0:b0:26e:7604:6575 with SMTP id
 r16-20020a5d4950000000b0026e76046575mr3878257wrs.65.1671761447428; 
 Thu, 22 Dec 2022 18:10:47 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:47 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v6 18/18] arm64: dts: qcom: sm8250: Add compat qcom,
 sm8250-dsi-ctrl
Date: Fri, 23 Dec 2022 02:10:25 +0000
Message-Id: <20221223021025.1646636-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sm8250-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sm8250 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index dab5579946f35..9240132efa75e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4050,7 +4050,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4141,7 +4142,8 @@ dsi0_phy: phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

