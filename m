Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFC4BD9638
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E80710E5F5;
	Tue, 14 Oct 2025 12:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pqAINGaf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984FC10E5F6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:39:56 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-46e61ebddd6so57099135e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760445595; x=1761050395; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AqsKQ8///0zondjUQyLirrRSCHthDErDWugJZ18wpKg=;
 b=pqAINGafsprAmx7la1ktoxqZZQAgVkr6m0QDPGlovO4h8/RnbhHnZPHhs4hPWTZvIE
 PDP77gN1ga5o4pUxjHR+sxiGK8HrCXs2Ao/hTnNQ0BR/RTv7E0J4cJmBC3ufo2JdAGWg
 B4/NTC9r5OYZUV13Bda01TMCPfvfjquREqHOPI2rOOM88Sn2quhCWodwhWesMaowU9/m
 G2nHE8j2tfMwOgtKqW5LNm1RimjL+b917ghiFiqyxrYJ0LgkT8nh5JOerDKnf003ZRWd
 cPAeXHs6pyHmyuJciQhb3CuNmRXheFYOA95BHpsossP5a/IO3vbOiCGytnNwfE/Qi1Np
 LOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760445595; x=1761050395;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AqsKQ8///0zondjUQyLirrRSCHthDErDWugJZ18wpKg=;
 b=A0ltcVQZ3Ps7GWB1neRZdkryV9ZioehgfVKjnLbVLBS/vRxVgzJw3d5hOpA6grk9yO
 sY60jkBp6vsb08zxnRNnk0hlowLM256hCZp3QXnmfYLUKkujR5BSLLuFu+Hy7ciRqM4A
 JKp+sSM6NIoQmynUIwZACqc7Jd5L9pCEVlzuk6RrA9X1FlvEtCJclHzMlifnXNhGJFi6
 WwRSD12tRhzA7mVL3QuyXFFzD2bALXTTR9T+fT8hTQA+KH+PZKgEMKmNKXygceM3Dt1b
 C3QWGR+GfHGt9XbljO3XP0LKrvZPV+1SZGrg06YFebu8PKMCZDzLo7jRvx0s/GoEdIlQ
 yslg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWja8KqZFZAzhfnx3HqYw+2kLP3AM2F9sKjbLXu9/WDZEkzw+pDTPFrZcm18nhrsonLNgjOev/8m/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHW1um5/ub1SiuXzuGNJz0bXEiUT80gBQIvVio2Bok1Mw2/kSM
 cnPI9bngz8Kih5GRJd2xicQJ+wyS8+fdKNs8GnP1rNel/c0iH9adpMFsFVG6ALDeQqY=
X-Gm-Gg: ASbGncv552oi5EVLXoUErKPkbffFyLNVmx+f7cxGYU1Hh4rH37xdvEVUn15AncYrHih
 Zi1xy2gNE8Dz1/QxPQP5zFdHHnqadDMBh7IQuumqUhz6t+1yaPrd6/OIXYhoT0S9PVzbiXyPOoN
 PnVcnP7MtNmeL+q5bGAm81qD0V7NCEqn2RsaH0MCEcthnQrPVmrP4fCsonFgOi294ktSaSqyZMC
 pGgmQ+tCw/YkN62IImMAw2c+tqpxTx/n1iMQ9XQJlmYkK5j62GMFpYkNbwRjWuiZu+vv62hwdXW
 jj4PuXpBgHCVvZ2WX49ww753k/J2Gst/je9LX1Uukgv8r9m6B5jizWrgB5tc72G2BRPbpt4EzT2
 dhbXqniL95m/w01sql3OFeCfPGQll8/coFYlYuON92f8=
X-Google-Smtp-Source: AGHT+IF94TkmrblUuMOmKKw3sDw0waUXWJ6Sn72cPvNn8ob8Njw4rB13rXYCle6cWXXhQ2X4WSqt1g==
X-Received: by 2002:a05:600c:1547:b0:46f:c4a1:1da4 with SMTP id
 5b1f17b1804b1-46fc4a11f37mr63636725e9.8.1760445594948; 
 Tue, 14 Oct 2025 05:39:54 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:39:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 15:38:29 +0300
Subject: [PATCH v2 4/7] drm/msm/mdss: Add Glymur device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-glymur-display-v2-4-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=m/Ryf+3/Ba7bj8cfGk0q+ZCXj08lxgpxWe3j8JBvzwU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kSC91TA3eE2/FLce9JDXX+AHYC/aYLGbE6qH
 N2iL/WtXQmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EggAKCRAbX0TJAJUV
 ViKoD/0Sl157HvmbXuKIHDPa3XoBGzAdukbIe2ps4MXbFV6J6LNYoC90LVs6GeC+xTT6W8KVuIv
 uUJO9EJCnjsYddbeSEzuA1mREDoYnoWyXcX/bTvFKAOCtcDMEOaJ67vfF8Vu8pbCvYjcLJx/OqM
 1o20MDkMgza430gTOYMyqXa2gY5QreP1kdOwC5GM1DJdZmkopVYBYDqW9K/jbsIvpvwWVeq3hYH
 KQkWMON5+SlObVOM9AUBEl7P03csVQ7Yt79Y44WxGFyuO7ZgEw7sLfa7P5TMemoq18YGDh0TLe8
 vD5xP5vsp4mo9OiYbMHHKOHh6YsA89Py0da7gR8FinkIlVMck7F4npyorCRFcoZg6/Dr+SWWNKG
 LBUC/p+34urTE6t/bjsLZDeoj4dRXdb7tehEFrpIIY8Ve7JRvgyKOtSr3NO8VZMA7dHe3HedcgW
 LwfMMyA5Vti+iAQVPyo8cK/S9KNJkDhgthQSEqzPtFj9yMwxUg1GK4/Yq+aRjO8fXpvVQ5n0ZX/
 +ogmfphhy8Tka/TDOGfteQMc/U+GRR7PmxkW/MfKbJ9fIU5eWFrSQ9eqD6LaKnMZdLM2NTPyw03
 tzGCfR7w/wgnuufAzwJIqPydCpqdPc4BqCk1VF47snbP4jmqwMc0gvLsBBsbFOXhjDYmyHwklAF
 AN+FcDKHpISSmHQ==
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

Add Mobile Display Subsystem (MDSS) support for the Glymur platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..60bd6af83a8846f2ad751ea625a20e419c80638b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -553,6 +553,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.48.1

