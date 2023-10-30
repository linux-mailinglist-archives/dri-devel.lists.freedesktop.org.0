Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32EA7DB85B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C3210E2AB;
	Mon, 30 Oct 2023 10:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2227E10E298
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:36:52 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-507d1cc0538so5928031e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 03:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698662210; x=1699267010; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BQUtMmhP8dK4X8gyF58pOXTNlNmCqs0e9rkXe7+J4ZQ=;
 b=wo5LyCmISFcTJkcu1Pbbj2quARGBVBaQ3GHuyRRcenzjM/pM5cItmWGFrT1cg0egOo
 p1/qMlnlxTS7pk9C0U0wamy3IeVYsXZJ08uiRs1/Uel0PlWbyfpSb5EA441s7msRgcT2
 ODt1z6Sy/eKOQXViUjQi6/Wq7tacyvZ0dHHHKJtV/nkxNuc+5Gmgvd3mkD5ESjzPLv+j
 rjSUUm9VeOjDwJwMt1x1iTkzZ0OBTeefM3ymZR91Sw3zf8Q+ZfQX3wb6ZzH/z6i02QYz
 XsDs8K5DMBYcjGtMsPfEB1Wrj1vfUm5glBhXTc/22FLxMBJlwpK/67K2wrk/UpeeVXKk
 rrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698662210; x=1699267010;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BQUtMmhP8dK4X8gyF58pOXTNlNmCqs0e9rkXe7+J4ZQ=;
 b=SvzJKvGn17LrfZM4oHL1wFwVFWBOzPghTPvBNpPlVUv/UHKRrGAvMqM2JTH6Wpz69E
 gnEfX6/FGUafWCbvY3h+Kcr9dB0b5NEKaJJJ3nGfK5nWzLadJewciCwsfGYcUxMVLzF6
 85dcEDjQChHVV8H6WKm6g9TOSYDD56+o8JLdkn5eP2uDW4Eo9Lo+C+jiLv7x2rkz/+BU
 qwlBBAw9pURXZVhKJzjMk8AJSYdAz8rdspSTf4ZL4ZKYLlSmmbvIR613lxtAzzO2/oWj
 vMxRPASV98HG/EFvjalpOJkupar4jG5RXqJ9F+EarDpjqqVF0oSeRBC7/ZDoUWXx3Fpc
 FymA==
X-Gm-Message-State: AOJu0YxfZNKMl7oUZtcdz5OiyLCp1+O/fH1y1Zz6UiTGvB3YtjKklSG4
 aa2ev7NXrlquaQdISf2n0MCWSw==
X-Google-Smtp-Source: AGHT+IHfXwpP2Ap37baVspJyHp0mJ1Xts9KTo2NI4MBOzgvTKkzyrjYYn9sVwp8m+CprIkiqj1KTsA==
X-Received: by 2002:a05:6512:1081:b0:500:daf6:3898 with SMTP id
 j1-20020a056512108100b00500daf63898mr7278395lfg.26.1698662210356; 
 Mon, 30 Oct 2023 03:36:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c458500b004060f0a0fd5sm8783209wmo.13.2023.10.30.03.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 03:36:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Oct 2023 11:36:28 +0100
Subject: [PATCH v2 6/8] drm/msm: mdss: add support for SM8650
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-mdss-v2-6-43f1887c82b8@linaro.org>
References: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=optkb8hrjPq+qQd/lfPAxbzCpU2oz8b/um1vODBfZNk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP4c4OkV6WLFVMCM8tqrTGgQhQNBWAphAL/cwfIQt
 vYYkR4iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT+HOAAKCRB33NvayMhJ0Sx0EA
 CIp76pTITqgi3wDKcfBUVjawQmBU0/xXhBqhZJ7sAh85xtmsGbq2/gBMTHrZjYbHjWme+yArLaq43j
 t/nDhz8d15VtIrspB+9LCvys5122PjjuX156COziR8hXhf+06N/oyikJ8H91PUu8gyhbaVoNjtjg6/
 L2w5/6Z77s3KZTSea6mWhrtzhu/YpZZTZBxLC/Og/G6jnsDO+3cyrzR1tSIi7j4xGy5A5qa+Eos7jq
 hLKMZJACH0+WWomVmI8K4SWk6zvt1gJWF/WfKmq6/BwSGZkTT3zNbvRB/VH3IIy8j6ZEbt+3ZcJGl9
 s9HXU/R6/tgHxoqNvLqi625JyQblU6TO1TInXRNXzaRPF51OcqC+zIahgmtw33crkyQ45SyVLId/JE
 YjfmHsV1SxDVIhGsEzW5FnRj25u4P88Ig0Jlfc/f4MT4/uLZc9DwMH2eywyFrbpJwiJNs5XbmIn8MK
 J7aeirEe6k0aM6013XgoHMi/HjZXZTI8dnpdrjIf9KHD2r7tx/9ojh/sgEDVf4DKi3DynfPIZhrWww
 0UIPW2gs1s2ApQqZR/PPV1gh/F3bTVUUcqjvyP6bws0ILOLwjFes3mfARC/R5TYK9S8YSaysRPhRIs
 UquLdh5ZrYw/z/JLrihh6nUrj3m+1OGDeplgyvTP2BcTqTlAhxOQVzOXKDSw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Mobile Display Subsystem (MDSS) support for the SM8650 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6865db1e3ce8..33947a2e313c 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -621,6 +621,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
+	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1

