Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D75C629A57
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A62E10E3E0;
	Tue, 15 Nov 2022 13:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1521910E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:31:26 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id n20so15436088ejh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FA6VZLr8EX+1LwmM9brJgk2AqL1UbJ0XsUIaiz9n7JY=;
 b=nilNDcO+Dvh/GNaQwv21UPwBlAYUKgxhJWDnVkZyC1w8s7CF6k2t4w/0Oe7Zc+QTKM
 OmSEcOwqrjlJBLTueyUKYQLCg9VlfK9fcIWjt49uHPUrsBcMuxsZxWJIrCHVYakcoBRN
 q/Vrfcu+vF+s1p7v2rsRo6IA6PK78R6L/XRw7ufmKqIpj/mP0hO7JtSR7ICUW5T2RD9P
 UQN23qjsr1Z3qmHuIlULhQBDbi9cUTsLGZ830607AXHX5XutJ9q+nRbLk5gt6vqjeeIO
 gM/vkwpe0xLTKDdr2PFiyDdcjH/ENbqRcg5Gn651+Nse0JxNccOfiIQb8WTm8Vfl8jyp
 Nsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FA6VZLr8EX+1LwmM9brJgk2AqL1UbJ0XsUIaiz9n7JY=;
 b=tu39X88T9Sm/dOZvlN+ZcCLvJ26tmgauMg5UPe5telucTT+HNbDIg1DZpR+Qrhfvoe
 MBrDLCc2MJp6gW3MBAzEeZVo6INERLa9Cxrn3uAdkbPZAE3uvN7vj2450ER1B1cPd1SB
 jbksTjVkYHs9OJtoYZ+9JKlAWi315MysoclnJzkv3yFphulNmEX99mGgbfSuw3hqzLWP
 ew9NwVV0l7f1d+qWToDPEUDrp8ksfbHgaq6WxaHAdpiZMp+bdklcfhz7ddiui8SYQp2L
 zcOBGcgUuwPz77ML+sBTGY+YI5LAgjQGl9tUXmUQ7ornZKicmtDrVihYQIqJi9JODWTS
 WL+w==
X-Gm-Message-State: ANoB5pmmYDgF/rMp3qWVQWqJSZQTTaJH1/KPzFJz2K+fSxgU/1ffhsQO
 2aIRH37ZflVG1hPIYa47P08otg==
X-Google-Smtp-Source: AA0mqf58K0nPUdH2ACUFBZHTyMf/y7B8YjJoerLelKr40QVkELpRuDuR1ymQIBx+Ahyxm2R6iSD2Ag==
X-Received: by 2002:a17:907:20a5:b0:78c:9b67:6655 with SMTP id
 pw5-20020a17090720a500b0078c9b676655mr13338211ejb.90.1668519084603; 
 Tue, 15 Nov 2022 05:31:24 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b004618f2127d2sm6162176edr.57.2022.11.15.05.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:31:24 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v2 06/12] drm/msm: Add support for SM8350
Date: Tue, 15 Nov 2022 14:30:59 +0100
Message-Id: <20221115133105.980877-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatibles string, "qcom,sm8350-mdss", for the multimedia display
subsystem unit used on Qualcomm SM8350 platform.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index a2264fb517a1..39746b972cdd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -293,6 +293,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		/* UBWC_2_0 */
 		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
 		break;
+	case DPU_HW_VER_700:
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 1, 1);
+		break;
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
@@ -530,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8350-mdss" },
 	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
-- 
2.34.1

