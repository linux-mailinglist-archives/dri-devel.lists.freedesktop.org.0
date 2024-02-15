Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EED855DC3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5B510E43A;
	Thu, 15 Feb 2024 09:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TBGUl4C0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E873C10E4C5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:20:39 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4121a8635a2so2310195e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 01:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707988838; x=1708593638; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M4VUVivuxhBItwCnLx0xGdHQH3tLZmkPnVy151EVhso=;
 b=TBGUl4C02nC+UD51AiLQnkvtzK4vUpRnl1+D2icW77m6avYgiWmrrxUrPJUgDwSEn5
 ZE11Njr4L1FGP7S6ySNHZC3S/kGVr/UG6FfsHv7N52R6GakqnYqapVx+H/FOgM61N6dv
 zQrBlA6yY9hNY6zSZO0Qk8LJKihfH2ouSj+MmhpvgGfOMFJWVdnQ5qZtQrojfw7EeycB
 go2FssralBzP+XGZOoaSChmmmLHoczndeUWliUHyf7x0Gx3aZorcSsBOadtN7bN26mvf
 tOzfHT1J8LSYbDUUYWwcgjvyqoZ2/cVR6ofyoQ99mkZ8j1NUjz7PwRVww9CX1TiafrEH
 B1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707988838; x=1708593638;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4VUVivuxhBItwCnLx0xGdHQH3tLZmkPnVy151EVhso=;
 b=lkvtemhmGDtY2nzmHHhsXvt8Y6MFIlI8PmO2VZh4KtXM7H/gGPWGtoEJclbe2fdkfu
 LJ09benBWS9vZfnLo5Xwd3XT+lETrUySXztW/1JblRdx8lgxV3ImxoNvbYTLSpsb9SML
 H4HJJSKxWk1E70MQsEySYjzhbtIAYYGjHuENKM2H6Oba+oGykqz2QuUHLCMLRLIisPNJ
 /KcpJQ7Iv8WWYaRpsVPaMP/fOnuYDvailaOwZnQ05EN570XUj0Yg/IPjhacGuDurs4uP
 f44/L7l1+Umo6wRDIMDaMWFWlBttEYhOygxCx2pb0aw1GlEISrww3IWUWjMjFzCcj5Bp
 9wjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvwi1Aqd4f2OHpbgvM81Cya7/j+8a9Ol6hVjRvjyJccVphtLWlHVgdJm+oFaVgJyMGBc8JhOdReaCLOq7f9N+r/hDBcE9NG5NFAnbxbBBS
X-Gm-Message-State: AOJu0YyRtemgVVAvj1vkrEBJxbcVLX3Y0JLbb0jnWRfBPfSQvzEOWb5r
 Yt10RoN/7TgiiS6FsumXKLn0QSrpPUp0lqq9aS7aqhEFqRyB4Md8xnoTD/D+gXc=
X-Google-Smtp-Source: AGHT+IFXVVQ/uxEk2n2UTx3FliemDL2HGwWD3N47dVkf/bJsy8vsKAGapR4cnCOAJNCWIz4P+M5s3A==
X-Received: by 2002:a05:600c:310c:b0:40f:bd81:e738 with SMTP id
 g12-20020a05600c310c00b0040fbd81e738mr956462wmo.29.1707988838302; 
 Thu, 15 Feb 2024 01:20:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 l8-20020adfa388000000b0033b66c2d61esm1156435wrb.48.2024.02.15.01.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 01:20:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 15 Feb 2024 10:20:28 +0100
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8650-qrd: enable GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240215-topic-sm8650-gpu-v2-6-6be0b4bf2e09@linaro.org>
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
In-Reply-To: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=eK619A8Ja/rJOcWssIzBbWM6D0kuHt0880KvRuYuMKM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlzddcVOTYaWXhqXz7CR0Hulwvc1BGcUEkmWvV2LSR
 NKZ9k7WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc3XXAAKCRB33NvayMhJ0eCAD/
 sGA6LkVKECsn38P5DH+wqPkMbxKjQP2fox10vCL1kOfmXAKY/TaOdQkclGH3g5hLpEOBA6CGarOlrU
 2kLTIui0bQVTUNKVtHdGewsVaGpZN5nCMv4Wdkg49nAZcS24QNPFFOf+L1AJtcLGM/F9lCH/J+89qv
 NgItVT649rOPF27s7wX1fSsFPZINwwsNY67B1I2bxKAEJC4I/nkTUPYnfwHlE0cGXTnlmPRJ+pVDhQ
 LHR0O0YnsS3Le9JGqEPyXxgjuil1IgUbKHiIa1/1uebw+aeeovJWnvsnFlMFhLltxJN8rTRFsa0Ht5
 vrqvc6TRjKwunCDjeQXaNsI4s9UQUA1bH1rQW7S9uji5sNURGP8FBNaYvbaLOmWkZLaJIFeXxNdjlt
 MvQ+TLWxwVU0/rsUG7j0qWlaN+i5zCEL+LVpY/Ewy/ENXU24l2iJYdNqRcvwg8WU1m7ryjIzBLPt7O
 +j1wfBYW/j+LCzrMonIWxtC+EOZW075OCV8Tdn90s97iADzC1nPKs4R4igTsm5H9/c20PVBejk3lep
 tjFjyda0GmKOGOYLxHSriW32Jacwk8nqT7Rd31uwmS+91HwYTCdiCzgxC/kYx+qUvHnIznYLeq0r9f
 Kv1VFYO/ReEoD5Dx+S0CnoWDPQO4CpB6v5J2zsqYVi+s2F/zjKwonhjw+XEA==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add path of the GPU firmware for the SM8650-QRD board

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index b07cac2e5bc8..dc91f0bf4b8c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -766,6 +766,14 @@ &ipa {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8650/gen70900_zap.mbn";
+	};
+};
+
 &lpass_tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio21";

-- 
2.34.1

