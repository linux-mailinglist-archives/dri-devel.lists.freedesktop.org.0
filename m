Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB98CA5CEA2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011D810E684;
	Tue, 11 Mar 2025 19:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OX0jkjHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DF610E685
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:03:18 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cf861f936so2846595e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 12:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719797; x=1742324597; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a3bwniejdI/OPbevpLj33tIqt0/bau3qVCvVDzBOjOY=;
 b=OX0jkjHZiCRywf/EGVSjk4lDBlvS3yhj7f3lqjlTp9uH3bi5lsYhw0/5ead/Sw4SHu
 T7AV56S9IwQyILAZQzOevIYuu0tKSdFVXaFGw7lsqu5/5gYLOoSfxn4S+U3YvbnVOHoH
 nrFMzUBAgxU7NA3ofIHdy/Ui6w5zwyvm4imRhPn0+z8ya1HH49egBLTOeg190mc2wud0
 G9ktpXvu2wNBb9YsWvZFLCwF5fZZHPOYYhzC9cHkJoEQUMMv5mQoMKWhsFhwcKf1nJfA
 kziEqc1vSZjh5qRH9BD6+upiLv14espoV7Fw4f++N/q0djTEy+h7prG1iIggFB3JQ7K4
 L7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719797; x=1742324597;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3bwniejdI/OPbevpLj33tIqt0/bau3qVCvVDzBOjOY=;
 b=vix8fHTibARhkdKdq9dUluP6XPMMQolsg4tt375rrKNHXI0Xywlr9siSl1SM+Jcqwt
 Ht5jyxy0JYNDFpJUR0TS6omGxod7jHr3YR8SlLCIQ9f9qeapjn1CJ3Ye2tfEfzmSEv7y
 YH6k7jXKpszaC1j7u35Idy+CcFvIQ9FFhVz1H5jy5zRb3nfOpwedPmYRr56ieQghElvV
 79cRoDziXEhtKAGe8uWWyxUAVELVeCkV7LFhzOsH6bOMvLJ40G6NLNQSlDau3O7fCKGK
 CCH0J++6iniWrbPHL/32FeCW5lhI/Y50cE/CVUJt6H+54XzV+jxsoTqg3PMCVzFqXzHS
 8P2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQleZTnazqfYhrAA/XuYhWToZb2ofB7YO324S41ZxVGm2I9fpzMCmLftvQmEM7fC1bg8VhV4U/TTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0D1AGToMcyW4/QOreWFAxxD9IZufYesTptybKd5z9d2GH01sG
 MPJrOtjgveSIkgVN6/UyuPt8kemffNCnNoffXQGWTdvjrBDYXBWcnoVLZCrhXzQ=
X-Gm-Gg: ASbGncu+c79Fhc6q3QmoKpJ5lQ2MbCpEF6xfa9K1HlLnAwVpRNzW7nwkucL40Kav8t0
 itZDs14JrPZyj9Bi4XzZxMiW0lyYyG9XpF4PBxNi/+DJ8aaql3ckUW5PmGy+VvkJvsWSASoHBeS
 oPuKNeLoX6kITf4/0RqPNx92XZG76mrP9R2GPdSULndiN60eKLkemgw6+P1v/fv1CDLOvK1haAk
 p065lKVA1FvyRS/cT4CI87hw4QlneE4IM2LycK0+Zamu48JUkzkFeutmr/VVC2aXJ/hyBlog5dd
 ceDSvDxH5tcvmA/EaOGJennZoLjWB8YybaLQs4OhQE9dE5M5OeND+m2c28w=
X-Google-Smtp-Source: AGHT+IHF8uLli3Mscw7Wz7pzlQgN98nmS03vxbjY+FMS38uVER5+D4/KmiqUOx0hRsjBec9IPhX0ew==
X-Received: by 2002:a05:600c:1c9a:b0:43b:c228:1ee0 with SMTP id
 5b1f17b1804b1-43d01c2abc9mr25985105e9.7.1741719797380; 
 Tue, 11 Mar 2025 12:03:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:03:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:02:09 +0100
Subject: [PATCH v4 19/19] drm/msm/mdss: Add support for SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-19-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=npT/AUk70cBHCRbn81WnGX4UoVxSXbDYwaGyJuk3VME=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0Ii1yuO48mmFAfjVI5TUjpkb33aMMB6mobfjo
 UUveOoKZZCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CItQAKCRDBN2bmhouD
 17owD/9LjgAfcE9wntXboxUQq1wq53OyBXwxPik3FSCXq00B/qklbILV0ge/Szdeo9zTuS8y3DG
 knhGywWnB9nHdRoi+TPbAZBJs8cuw7tnj4TNMi3FYQd9cQySHGKHAE7ioVFYfYHEMGctY+Jt2nr
 5lJrIhhz8dUXHl/FUI7jfDdrcg/L6pWAoEI+YideSmhj/cj7gs04qCP0jVZwnNEle8pUv/YPQeg
 KI72byD5UP8v7iIM1/PurcrImftuR4WoV+eNVAJwh7SaeCem6YbZIW8rZK2vfiNbtHEu+2G2Qc0
 rD8nmha0MhFUXguzZfTaaqFP0Bup6J84yfAoondQpmxp9zMu780/O5Q1/8rrl2boTiIVZw5rSwg
 bmHjqCnfBMtHi1PfdJhQagiDmbQwLR7fOgBaHvc2IPG2AqgLmB5lFQC2NeiWDhv9NY0HQKKOxLE
 PeGtM37TtdWZYYHppyE8o/vKWNFXJl622/lZPmfLlqBDeqSe0FDrb4sARfnpXdv1STDLqHXtYFb
 mAD80MXlqqvpo5/gO4ySYdZUluuS6zkd+/cq7EXE/h6W9H3oRVVV4abUnquCLbPfZMQITgvWlii
 alysPpRr0FTtk14vawx9/5uirQdtKn8irnP7UvKc6S/k0YG84FMg+E/ieo3N6NGBDiQ21fVOsiS
 bWBVJLuy1zrqZWw==
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

