Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E6886CC3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 14:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB43112473;
	Fri, 22 Mar 2024 13:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ITVH9V+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F1A10F7FF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 13:22:40 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso257304466b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711113759; x=1711718559; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6XUaenHWoXhfDkhnV0aXHNHBLry4TB9gcfVEB03TUiU=;
 b=ITVH9V+uKQ2TG270r1cU6skQdq2+V87JadzWgTAITBHPc1j7nnC2Ybnhd2jzG7sabP
 HT8/k33JxfKhigdGhyTQOlWz7d/8uCsvAIxz94dBKaHYSqp9xryuzqDyfLcgf2leT7ca
 dKRP+bXVbG7FOTfZkvS2okJsU7gxWOITd1VwZqwr46m5jxqJP7vRrxfOQiSbzgykizna
 Zopv5rnFvkCIvVxQCq163gYvCq8x40ms4YEXPo0Nxe3LQnrxI8tOITC04o8l22+xh2xa
 zbMP1hNm9bP7bWrcH3G67mfOdoofUcJwuNxWIrlBHw0CM7WZbUKd7Za4FONn8saRMYrB
 TrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711113759; x=1711718559;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6XUaenHWoXhfDkhnV0aXHNHBLry4TB9gcfVEB03TUiU=;
 b=X4JtlblaxmvmBhRa94pwDm8Jhc4kYsL2xmGqK55Y8uYoaiLYv5Zge+7sPsY5li7Z5q
 6ioOEHqckPl92mp2qV+ysLPoE7VFM5onIbFpz1RgER/1RTdVwxcu62Y3DTNo2YnccV5q
 ppn8t8YI2cD4DdIQfO8PGVowGKbl3D2RxgnT0/6E8UkYMK+kK3Chtd46fGTYSyaPxKq4
 oa4IMt2/iFVGIDUeZEhPCLHGDTFkMYY2KZAsevrqVYUv7Bn+B2TUcGcx/CG4d3bBIbVC
 N9x/z1GhTvBbGmN8mS4bm8pAOF4JWG1WX4s0c/v9bgQrvsGiOv+nk2LQkLD8942Fl2Wb
 2XfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9tczTklL0UI0OdGtrLD6XoQjuNLlNtUbnnurdibR6nF02gC+p5o34KzRa0kXpHt1Ukn+E0FCNT6gcfXVg3a8paz4k5VEqc/KasslhRJy3
X-Gm-Message-State: AOJu0YwtyIAhUI3k0ZWUDQuTsbtegzdKLDgFLY/b/RfFXgrjrASoBReT
 ckvAnjHYktNmEk76rxzN66gj23QwlBZgKAb143zC0dX/TIAXbk7ypPSMklkWT9g=
X-Google-Smtp-Source: AGHT+IFMT7cq/p6U5lZbQ/UZ/wU2nRaG+ZU2xJOExzaN28htNK1eQGiRtGlQH9vKIq8cXLB+nbzu4w==
X-Received: by 2002:a17:906:230e:b0:a46:d77f:37ca with SMTP id
 l14-20020a170906230e00b00a46d77f37camr1654728eja.66.1711113758864; 
 Fri, 22 Mar 2024 06:22:38 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194]) by smtp.gmail.com with ESMTPSA id
 m22-20020a170906721600b00a461e206c00sm1014176ejk.20.2024.03.22.06.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 06:22:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 22 Mar 2024 15:22:23 +0200
Subject: [PATCH v3 2/2] drm/msm/dp: Add support for the X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-x1e80100-display-refactor-connector-v3-2-af14c29af665@linaro.org>
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
In-Reply-To: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=VRvzJp7F3pTXsdpRrJnsX5QXf0DQXJcBRvykcAY4DxI=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl/YYWHMWfb5XeXykySFpfSgfGEkbi/1xu5RtIP
 mFT/7v5JKqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZf2GFgAKCRAbX0TJAJUV
 VpJmEACuCgSMFMohE+PmYWIPPDdU9bXmOOpIjgkIEhjwqm7w9Oha2buji2b+JyOiuz50Joux6CH
 KQikLlX+6EMMc5zwiaq3NMAjRxL4ofMWGcrQ6jFwowQs7xFMvRjWsEACQTL08gdkJBm1KJzh0TV
 vPU9KZcVR4brLS4xKD6MBlaJtFzpL7wXM697i5HHbyBr8pjAjBWVizntUgu0wWOJ9twd5VG7tX4
 SJeuJ5VLkJ1p3X1QmbIptBQrMsirEJKJ3Sy+2AzrfeC3/zJWTz0yJ7jC5cU0OiKF8PPuk0To8Xh
 hjYWBmLAlXAiImP7pfsDOWWoQnhms5RHonAUidXJJeR/3eYlnVqYnQbV8sZ2virffdkcz5jPfxD
 hi6r5mscDmgRub+yHCDrWbBGGfslDTyn6996Nr3urquLoHoUdYgWf6T0qgVGxNx93S5iPR730b/
 TnbA99VBhvKWrJg3+8tYxrhDioWoeZMV9+kETPKwoMLx4IscxrmBm0W/j+slZsavstQ42b8WpPL
 +1Frd53yRw4mCdE2GqMcNfLS4fUvulzu1yhvcUQKClViXdNB4BJdZW9lH5/2oku2f18k/9JguqB
 cufYg2+vD7dMdAnJbR+nt8VrDIX04sRlVWnTYK3N4dfkH3r89W8YoP7TRjbFlMpU2i0gE2x7slM
 IFvVOF7/nyPvJUw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add the X1E80100 DP descs and compatible. This platform will be using
a single compatible for both eDP and DP mode. The actual mode will
be set based on the presence of the panel node in DT.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c9763f77c832..95f6cf949fe6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -171,6 +171,14 @@ static const struct msm_dp_desc sm8650_dp_descs[] = {
 	{}
 };
 
+static const struct msm_dp_desc x1e80100_dp_descs[] = {
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
+	{}
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
@@ -182,6 +190,7 @@ static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
 	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
+	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },
 	{}
 };
 

-- 
2.34.1

