Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0332A638A37
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5892310E760;
	Fri, 25 Nov 2022 12:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FBE10E752
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q7so5687018wrr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIJDbyegl6u8zeEPDRjfbckMoUQq7Dd8VduqGlrKmeE=;
 b=iTTFGz8jy339GLHg541jLaT9dA4HA9fvcmEO/fxQQLN90d/PvISNhJ/6lYpUa33DqM
 BuZdaImi1QmDyjXNVpnbNKH+CWWBgx5+tewEjSOPxCX1DPPUPRlE+WdVGb8nNY23febT
 8c3i6qBRHyNv7rtI67twEqc7kXcrUYF352w+JFNABHyOqoeX7Z3wE1ci8CT2Pb4FzIRA
 ybr7jZ+zmXuoDO8tmc64YSTOjG9AV03zMEQjW2N+z9quZHX5m6qcf4QDlHz1lVzhlllL
 onWM8RRIVU+eEb8Ec/Ynjf85tRle8T2COWlcdqEFXsG0z9Bm+R+XE+c6aKJh6Z4DAAgx
 nGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HIJDbyegl6u8zeEPDRjfbckMoUQq7Dd8VduqGlrKmeE=;
 b=YrBkGaiZLEK5Wg6x/PuAM4m8yGz72nZ8750jqdpyQUQdpHnVjhYtEYkqInDIcnCMUC
 YSUMa1IHypaLJqb9Gqvw9WcE9Hftsehsz+dQlNsY60bhPgFTvrDEmS9deHqCt6RcG6J4
 f/pzt3GvsoNRtasilJpUg9s2axv9Un6STQGgrIC6wK5BXbv/eIjiwoxYsKmUdJjvK08g
 XkZBH3gsDZ2MgNrw64I4Lxzoh2JoC0tukuF+gNSLFl5JLSgoeFZWohLPKdL5xJLqeLru
 mObAYq4um06rqA4SeUf4asQffKSxqUSIBHtNG/Tb1Kowux7NpdnU4xskQ2HxMNBm1XBb
 l98w==
X-Gm-Message-State: ANoB5plseZhF5aJIgQqxWEl2Lrd0f56p0tHEg1Iw+982Jbus/2aOrrIb
 OlKg/MagNj6GD84ib1BlkRgOBA==
X-Google-Smtp-Source: AA0mqf7ptg6Hh54tGkUUz+d4qRCLeoMdzWcd+Am87+jMuUBCw7bWpqd12qOjMU+fHgv/lRZIaUCVmw==
X-Received: by 2002:adf:ec49:0:b0:22e:28fe:39d6 with SMTP id
 w9-20020adfec49000000b0022e28fe39d6mr23382964wrn.701.1669379819110; 
 Fri, 25 Nov 2022 04:36:59 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:58 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 14/18] arm64: dts: qcom: sc7280: Add compat qcom,
 sc7280-dsi-ctrl
Date: Fri, 25 Nov 2022 12:36:34 +0000
Message-Id: <20221125123638.823261-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sc7280-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7280 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a4d6e866b5999..3368531e004e8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3903,7 +3903,8 @@ opp-506666667 {
 			};
 
 			mdss_dsi: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7280-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

