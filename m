Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A5E642D11
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 17:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6227E10E24F;
	Mon,  5 Dec 2022 16:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AB710E24F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 16:38:06 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id b2so29186220eja.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 08:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ikVD0DfwFm4BefZfjV8KlOgWa9wgGHVQ5qduHZ3YKJI=;
 b=Tw/QVM0P9PmY/myId1uSMoV/+vdpASaSP247AGtd0Am6EWFgZzPH+GdQvB8mOIQlZO
 sLZuMfr5anncSiT3AMTjfCN6k9o28ooIGjE9/1155kzFn0icUtygfdTTnsTIfIApKeZc
 uBOIsjQLeVyRfEkKdUcqWeJVZLCkVyM3Wkn+/XcpkN5ws7dZZg8FPYE4yZ/+YZgsECYj
 NXE6drlG4IX1jhD5IMbZmVsxX8nWF9KZh9XncckpxzbK/F8HlgoMoQo9IVcsG1rbIV8f
 J3c+w0zd8oMKXzv47Egqvpl9+OTa0ptqloQuWijvZ6QE/keuu3x4B++TsoXKCv5ZUGcU
 OTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ikVD0DfwFm4BefZfjV8KlOgWa9wgGHVQ5qduHZ3YKJI=;
 b=EK36hObhdK3N1Jcv/on5OQFyR1AgDiELTQ/GgKBGh7mYp07zLJ0UOUtp5Ib3ZLe+B2
 57Trf9WimFDRYfaTEfBMmOFBBXwJw7smKlI+RzdYrrMxT7TBDTLpT6XMDPlpmr6C9dDA
 Wod90q8Zl+uv743jX4Fteadf+/RRW/TaNRlUnXMi6Lb0DlZDyRROA/KCPGdFiovHoBtj
 AP8zCJ/gcEOtSgjhZoEZbmAxw2RbyTfU7d7IgOiZgH2hFlhh+1hLJxgsZ55SNr98VtdT
 kTOe+i4yrWmUKYz+d0J3UEesJ1gXmQL1ZYD6Y38KdfNNyc3SxfI19tHTiFyld27kPQra
 6Ciw==
X-Gm-Message-State: ANoB5pkSV2Flm5rk9ujS9+7ehWKkXHkGA4vOuuNXJO6GM9TXa5LI4I4H
 Kxty4hCSMPXkXrwG0qWTBbKcDQ==
X-Google-Smtp-Source: AA0mqf4GCqnjHAkihknASAn0yi5G+Mq3odla2UDNvKPhEwC6fSs2KP4dmfXWt5u/x4RRFQ1j57oPAQ==
X-Received: by 2002:a17:906:cc92:b0:7c0:beef:79e2 with SMTP id
 oq18-20020a170906cc9200b007c0beef79e2mr13796496ejb.148.1670258285960; 
 Mon, 05 Dec 2022 08:38:05 -0800 (PST)
Received: from prec5560.localdomain (ip5f58f364.dynamic.kabel-deutschland.de.
 [95.88.243.100]) by smtp.gmail.com with ESMTPSA id
 e21-20020a170906315500b007bed316a6d9sm6413610eje.18.2022.12.05.08.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:38:05 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 angelogioacchino.delregno@somainline.org, robert.foss@linaro.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v3 04/11] drm/msm/dpu: Add support for SM8350
Date: Mon,  5 Dec 2022 17:37:47 +0100
Message-Id: <20221205163754.221139-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205163754.221139-1-robert.foss@linaro.org>
References: <20221205163754.221139-1-robert.foss@linaro.org>
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

Add compatibles string, "qcom,sm8350-dpu", for the display processing unit
used on Qualcomm SM8350 platform.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9827914dc096..6048bfae0824 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1322,6 +1322,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-dpu", },
 	{ .compatible = "qcom,sm8150-dpu", },
 	{ .compatible = "qcom,sm8250-dpu", },
+	{ .compatible = "qcom,sm8350-dpu", },
 	{ .compatible = "qcom,sm8450-dpu", },
 	{}
 };
-- 
2.34.1

