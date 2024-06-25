Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF2A917036
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 20:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1793F10E71B;
	Tue, 25 Jun 2024 18:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JXYKhq6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7275D10E714
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 18:28:22 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso6878037a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 11:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340100; x=1719944900; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xNl1LGe+OUBjKkWza/syUNm4iRQsXOqi9TzG6uI03xo=;
 b=JXYKhq6yHiLwRq5IbWI65o2jhf753Wznjw8G5Nbyxjt9YRwvWErrTC26i0R4EOQRcR
 Jzk/4gqUezFYdzzO6q/oWWxF8BGLkp7aquh//KjTZXF3kGQsI6UMoqLpatyscmUToTeD
 UxDGy4cBtWQEyQVL0CY+NKaBbMAc5Hg4YIiiJrCnURdsBePkuM9Ix7Ow94aIfxncjJWJ
 q0B9ZLhixPTYArOiU9AsG/VmkjbEaU2aWhwgVuvgH+XJ86Y8eqp+KQk9LSWsRu10CRVM
 tDD4hnS3Q0BvXjI4PvZYmUrkzD6A5FBNv7/Kci1jV/XPZQDpybRIfdqVlx7THmDuIM94
 wRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340100; x=1719944900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xNl1LGe+OUBjKkWza/syUNm4iRQsXOqi9TzG6uI03xo=;
 b=SuTpzUl6IGi1VUeCkXla0s3EtiQV4Zi4V8xJEpONqAJTe2789lDzYbkClrSPzIkDjo
 uJDfooVZ6rIbhCsqT10XRsIT7Rg87Nj4luOY8kFny2/lQoSRilKwIjWG+yM2XG5fWo5B
 7F41QG/5i3B7iwBbL5/sH5PqB11daS0aONysEc+Hub2EPmiBCsva0z8Cru4g3p4yFqcy
 d8IRiqM+q1taEKE9O4dI+vWQJG4gVU1Uz6sOBU/qQ6xFta5Q2W7opkBphlnGFXWM3Sx5
 fyJd42MpM2yQvFgvrW6Bs7AfjLMpYpRw623UBaqBWCY2ujbXHKe+b4Q/brp53TTIY6cd
 PS4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ40os8uE5VQxahtjq4GQZuuY57QD+xfUGsn6VpeY8v/3JYA0UG7ZnFAnZNcmT0FapDS7TEAxAXBVe1ncwTIhZhKUsXTYcB8v/yDxSv9ur
X-Gm-Message-State: AOJu0YzmKJRiNk3bKBnsYIwG0KSR8ld0QT+e3eRhmHz4CqPVCTCjvFhz
 DlPC205VQ9nS7sljzwJzaHeK4LBK6fBm3HOHCYXDseTKjtoAhXw1Re7bvKv1Cd1P9Y6KQQDzjPn
 k+RE=
X-Google-Smtp-Source: AGHT+IFZf75V6EVKFoeMMT86fpiVICPajQFEHJC9qNUtbTjyoSjlwEE+EJZ1PD+TboCYI1SSsb8bUw==
X-Received: by 2002:aa7:d393:0:b0:57d:5600:2c94 with SMTP id
 4fb4d7f45d1cf-57d56003448mr5183567a12.0.1719340100400; 
 Tue, 25 Jun 2024 11:28:20 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3042fd72sm6323136a12.48.2024.06.25.11.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:28:20 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 25 Jun 2024 20:28:08 +0200
Subject: [PATCH v4 3/5] drm/msm/adreno: Define A530 speed bins explicitly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-topic-smem_speedbin-v4-3-f6f8493ab814@linaro.org>
References: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
In-Reply-To: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719340091; l=874;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=hlAsvCKJeJlsvCjk6T4iu/SvTfq4qoydQ2dHeLtqkkA=;
 b=IRMR1HRLN2YRjxVqz6xKwmuxF680eWYXDX4vQzB+gFNVfylWuVcDos2bQwzKA7wmZ4U3gJ32x
 gg7nzrlgLmLBSFRvmSiO2FyHkPwIZb+ULPTqUvjdw9Y1u9Ob9HaCm+V
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

In preparation for commonizing the speedbin handling code.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
index 455a953dee67..c98ad4ea558c 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -116,6 +116,12 @@ static const struct adreno_info a5xx_gpus[] = {
 			ADRENO_QUIRK_FAULT_DETECT_MASK,
 		.init = a5xx_gpu_init,
 		.zapfw = "a530_zap.mdt",
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 1, 1 },
+			{ 2, 2 },
+			{ 3, 3 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05040001),
 		.family = ADRENO_5XX,

-- 
2.45.2

