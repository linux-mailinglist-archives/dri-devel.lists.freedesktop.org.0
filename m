Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7C9858341
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 18:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5565310EC52;
	Fri, 16 Feb 2024 17:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Eq54IAD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0698610EC3C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 17:01:26 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5129859c6b3so916687e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 09:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708102884; x=1708707684; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TiEpeDDImaOw/7EpXqQxgkCNsM3mPa/vvbsJHlnFxEg=;
 b=Eq54IAD7mpAxRZcfMq+4PY8hJpLCBSDBk3UAGtLoZof/bYCT+I2x5NbLQYn9C9kSm6
 sie4HNb/mknPZyC8j/Yfoex/E+xaV9hnjuF/YFejG4XCoctOEuXocVniBlXumBQoMxbN
 zpwCR984IPDTrg3a++euqiRclDCxTvqqcGZj2fONbd4UF0KufxtYJC0HADJjWo6HII4d
 y2IhDsO7iXvucBDS1rxLtQeqDuQIgBgP4hhxtSf/KLURI07CzaGbj9nK6DmHDn4niAjU
 g2hiLUs4OeTpPC175DRtv0R0NvBi0NDy32csiw7n/gJQiyosqKM9AyuFDqr+So/bzZLD
 BubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708102884; x=1708707684;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TiEpeDDImaOw/7EpXqQxgkCNsM3mPa/vvbsJHlnFxEg=;
 b=cYK+10JNz0ViyyKQBJccZBJtcMrMCP02FS5LFbV0l/IVA47ifL1+9Hl1+j6fLX2vDq
 m7mzXvdIrz5BHrqYvErPtSYjX3xAWo6KYCjI9uJf6wGip5pE222i3jkWQOuP2+4MeQgh
 9F94nNGZF26RsdFK4X6heINTiXFHPCAohoYGTcT07kmW7jB4gMxhqa5d7OyJ1Q06YAFj
 EdITOM+979VzMky2vpcDQDu9e1Fw07xK47vjK6GgM46oFMDMHphY0NzSsLNzxf1uccRV
 wqE6ql08Bgjz9kWSAgCmc0fyQJN0ar3pI6Ek7Xp9lmx/y0sueHkPqd+Qw/V930oW6Rwc
 XFPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV44umvLuZ9p7BMhgPPZxyAFSCcajDtjDx7CLNxLy6BHbYQyU+k/sZx+dsy9HpGlWuHkGm5FlrKfKOs8NsyQijSee2txleXU6vQ1YSF6E7R
X-Gm-Message-State: AOJu0YxHvpnmiXomPBqrq21RBJnblyKd6+xglDPasWAP7xzvTb/AOAFG
 2n2nDVBLkXOx/QaduFWQVrUe4vvPe7++Ctzlt963rQm0QApr/vDHYoin19cU1eA=
X-Google-Smtp-Source: AGHT+IE8Tjchp09XxZHaTZmVANhIcW5m1PAkNqucoJupWuJwPnVGH6GRAKyVCEiT78F8gRWfT2VEXg==
X-Received: by 2002:ac2:5e91:0:b0:512:9a29:1a81 with SMTP id
 b17-20020ac25e91000000b005129a291a81mr810748lfq.14.1708102884192; 
 Fri, 16 Feb 2024 09:01:24 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 u20-20020aa7d894000000b00563a6c9fd71sm159706edq.16.2024.02.16.09.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 09:01:23 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 16 Feb 2024 19:01:07 +0200
Subject: [PATCH v3 3/4] drm/msm: mdss: Add X1E80100 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-x1e80100-display-v3-3-28b1c33ac8c0@linaro.org>
References: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
In-Reply-To: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=84rmvZDk8zW8CmAQCdqUYugRzCw8mcvg2iteKd1+WTI=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlz5TawkNXFf8B6q+w8cJ6kZXt6czU75fNIjfWe
 S7h6Gw6Y7qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc+U2gAKCRAbX0TJAJUV
 VuvRD/4z8UMEJIBQnP1ombhXmaNwnavPDiWb+WUoZcchzehTqQFuOvOd7gUbysgF1BetLgS0fBR
 bO6yAlQY9as5QEB09JCpPqMM8ZM5mdr2RrL0n8F2wBtaIBzlwL9Xfn4kw7FTcLTTws/hX4ALuMa
 ciCS+Fw6gOa9QCFCG94wLQo3BWEJ8WBnzIkN4K3yuhZ/Dd1B0ElfzvGGiR0EIozJe+u0sbHFzcG
 d56O8FaZQotNrHjwqstRaS8VJISvf7ern1/2pvbF/DU5hgVmLMF2tzKiIg+vnJB4sI/y73792yL
 CmRIKriZwzWe8VNlyfyr6bmo5N3EOYR7pU0rXsHQS6VKtwjYRir7dO0wpw9WWSlTO8rUtFRwk4g
 dl3gqxK+fXp0iJPXrDWbHT2osLWWIU4XOXfaa/vSMTlKB+dW7vkXXluONKWE+W51I9KtC96cywl
 kVVIikF8ZkEaCK+EvO0rBmubczFUFqPqrCTiQxR+p2w0QG4IXZyNtLhLM0IBIe44tpaqfOFa+7Z
 tFFosC1TELeeAW+2YEncvg08NlWL8AllQJsneqnirC/dlZYhmPCiw+5wNVyB3PpSE02GtW8xRs6
 IRseXiwYM4AC+tBkkFKS2W7PIqZNTY1oQZqvru/7jaIQDtKyY8QsXCJvQZE6k2R9sZszH9LlF4a
 ZzbVyEAPLeVLYzA==
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

Add support for MDSS on X1E80100.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 35423d10aafa..6eda501e2a1a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -636,6 +636,18 @@ static const struct msm_mdss_data sm8550_data = {
 	.macrotile_mode = 1,
 	.reg_bus_bw = 57000,
 };
+
+static const struct msm_mdss_data x1e80100_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+	/* TODO: Add reg_bus_bw with real value */
+};
+
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
@@ -656,6 +668,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1

