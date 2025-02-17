Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00337A389B8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F57A10E55A;
	Mon, 17 Feb 2025 16:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MlEKO4H1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF7010E565
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:42:18 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ab7f9f57192so66773766b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810537; x=1740415337; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a3bwniejdI/OPbevpLj33tIqt0/bau3qVCvVDzBOjOY=;
 b=MlEKO4H1tBGJTF1NLBHVGXP5rmyGnn7MIc9e2eUgSdWTeuogXrXRXXmpZzW7ArL2XX
 nFw6FxRt8GKvHGX15JhZyibUQDWYNPCXpOGbntBR+oAkE8NblZe6BmNlkLfpvyeh+DVL
 CPgJpBfwomzykiQRPF4R7HJ5mCiUvhDinKwkCKFE9gQs+sWQvvWmKKa0h/1g7eejWTH6
 7VnlMI4dAeYG3LscT7JkKaisinQQzEHRh1vgOU21Qr9XLJScNfGmhE9ZFhO+HLgbbQIW
 SAU3FVnkq1w2wwB74ZB0NciZkme/SFstdcB2Mqz3f/Ivruim8J97GIwuvOflfZIGbUI3
 GKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810537; x=1740415337;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3bwniejdI/OPbevpLj33tIqt0/bau3qVCvVDzBOjOY=;
 b=N0dGg7w+9R7gu2OMyvdrmb9h+Bw4BooFGpQnSQepAiBUHLaU9EuNPPclWpvsGa6A1A
 RFW2ab7RA2nvvomdUZKp0gaaqftO4CkpwkH/iruNYYqUisN4L0n/zHoTf8mOzkWLbX16
 myWucQ2rz2nbBbsvBWeVLNjDBYPJqOF+dqaOxoEVMrf2/bp6e4kby32ORaDmZwuPRCm0
 6661G3HMJyrpH0Prys7o6zwlldIAv0l+kNKKe/v40/ik1Bh82m6lfinYKoAeTZ335FM/
 f3+LkeXpvjpxej3nbTLpwx+YbaOlOazvajb7dXStnHFfVK92Oj++9XdmolKzy83j4NOQ
 ZvSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3okO6o7a3vB5xCVHoRdzJ8ibxz+xZxw95SCMuJ7cfC/L6hfAFN/b/IewkD5YCnp/oaadsBmdrwSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzohfJ8L28g7xQy/5hAo+DLT6yLwRV9V/0+7+IRU82OqR9iw5Fk
 kzeDropAvoRHMGETdBacR1a+EBlQaG6gXhfaj76ijlva6Z7E51GoZHzx79sE92NyOUg0z1XWZBr
 w
X-Gm-Gg: ASbGnct0bHRx2/A8LsbHcROUWAaVb5nEGKuzO/1MpXGqEaWUTpIl3YFzuO87QsGvyV+
 amafoMUHgCSC37w63uZg7bmG9X0HBK6YEZ+Jxa2++4z+5kHKrPjHJfuB08KIla0wUkvszsuc9KP
 L3X7aOalqz9sCViUdUmXCduOfRkaejoV1X2whBeMdnR2kLDnufOudr8wBNvRaeQ9LwiSmqAOLb3
 Olgt8dCHUkw5mHr2JhYJeUwJb7jkJes3PWIt59ZN2tKvIqn0L8SxIaahY6tzRwEpkNI3oMklg1G
 tljcPOlF7JnGd+oTWhM1mIqotX+1ozA=
X-Google-Smtp-Source: AGHT+IFYF0nsGqkCnhvNcX42NuzRrOaSu5qMxI91MpfvgKlb990wc6+bQ0tjBdLkitfFsrwJbfj/Uw==
X-Received: by 2002:a17:906:7310:b0:abb:6f35:f514 with SMTP id
 a640c23a62f3a-abb70df3426mr352695766b.13.1739810537368; 
 Mon, 17 Feb 2025 08:42:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:42:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:37 +0100
Subject: [PATCH v2 16/16] drm/msm/mdss: Add support for SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-16-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=npT/AUk70cBHCRbn81WnGX4UoVxSXbDYwaGyJuk3VME=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2bFZ2hu1MzBH0BCrv5flO9CVwu0Y6SnKx404
 uBGg2GNXWWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmxQAKCRDBN2bmhouD
 10PMD/0TpbFaxlve+q6sBLe+kZnWI2gpgxVajSa1kKSerRKqRlJChd49nL352VlDKP/tMekaOEs
 Hb+KkarBrXjIt1LRA2FYHygGYffOZZlJMYLt9K6DJP+qi9ZE0PmomB1e6ts3j/67P8jPEWgxlkn
 Tfgp4kdXfC3LVggeXPlZwbo3ZQ6y8KV9H4yVmLD1/PM28bB2n+0e+w5Beakfc/tL4OkJEhdIKdb
 duCjqZlQ55c6i4V+4Nan08qanQM/h5pF5aL7rZDU8lNetrF5mmf/GmoYLbyN7I5UuDpZLN448bq
 QDjQF6UY3z/i5PmmQPvLrKjwqWrx3gs5sIXcF7247NEhs5WEJdAfQQuys7WKxupcs4+jSWxoL8v
 2FcnAiaC6f3wSJMj64CoKlzNWp2nMFo+dnjnNNvu1L4vchGFXJV62dskce116r3MrL4M0tGNbd1
 mrx66nqmfy4dJRI1d8Xv1zTHqyY/tMTtX0QlKt6vhH2hVBC+sGHaHN9OUSaE622SNF42CMHxDDM
 /I2VKh72af99OKFHIczKQBOg6W4n8EGdOipZXaOk1UInIOKm5gfifVhem5dvShouRRGzPODRZrU
 zWLuLnb9ywEZbVSysnWrgIUQvGSLy+trxx4CIH6m5QhIZDWZBAnyN5JwE8bLrMw1ZUJbJobSZ5A
 nTciEaLHS497GBQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add support for the Qualcomm SM8750 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mdss.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f00eb6de3a9d2bee7637c6f516efff78b7d872b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
+{
+	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+
+	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+}
+
 #define MDSS_HW_MAJ_MIN		\
 	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
 
@@ -339,6 +357,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_4_3:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss);
 		break;
+	case UBWC_5_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -722,6 +743,17 @@ static const struct msm_mdss_data sm8550_data = {
 	.reg_bus_bw = 57000,
 };
 
+static const struct msm_mdss_data sm8750_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.reg_bus_bw = 57000,
+};
+
 static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
@@ -756,6 +788,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,sm8750-mdss", .data = &sm8750_data},
 	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 14dc53704314558841ee1fe08d93309fd2233812..dd0160c6ba1a297cea5b87cd8b03895b2aa08213 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -22,6 +22,7 @@ struct msm_mdss_data {
 #define UBWC_3_0 0x30000000
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
+#define UBWC_5_0 0x50000000
 
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
 

-- 
2.43.0

