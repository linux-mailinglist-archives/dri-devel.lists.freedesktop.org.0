Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37A5984494
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A5B10E6D8;
	Tue, 24 Sep 2024 11:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KZY1dhsq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE37010E882;
 Tue, 24 Sep 2024 11:30:47 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so857343366b.1; 
 Tue, 24 Sep 2024 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727177446; x=1727782246; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DtlKt6idkJAcSVx+NWk8duOZfO6okh0MSeZqXt1n944=;
 b=KZY1dhsqmjH8F1n3v6B/fG3I+KfsTBgvhgvRJAtEw3NkDc9Z47nj52TNIND545DYMR
 5MKE2A63/Jj51YH43MBLfLH88umpvECtkfPGkm01NMXMeYaHuMiKjFVCcAk/JrnczZtb
 XJ1bKeFD9zkoy/Ot9Gufmb2RC8HKxbTgsZhNy0fWyHMcLjBzo/d2jPkurqJy4D8RNXcN
 n3RfETdV0gB49uu73ICh+gpL6Tn2b74QiwDEgSU4WvCSxvfjm9c7wvUockn3vaqxTaoZ
 M/M39Xhh/KUXGIL2CROkyzEJARQahknKtQ4lrgOdeKHtSqhosbY+gmwhUb6VexllndnW
 xjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727177446; x=1727782246;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtlKt6idkJAcSVx+NWk8duOZfO6okh0MSeZqXt1n944=;
 b=c8kjzz/jx9I4Q9+CC8DPNUV3KiFRAGmvzVlNh83munKbv/UbD0WK/1v+8s8tu974K5
 8X1MjSKZ73kM2U9mNzl4903xORKUvkruOZzgjOcQmi98vnPTYZoqMynOLHsmL7rD+eBy
 IWPwOYKJ02Yow385HfN2KQhBq5gunNnwnCieFuYhqMhU6A+xsvnCV/ea41G7AtbZ38d0
 Ni6G5XiwvKspdVL1fUHdl7//I+L+ARzu5/Ypoabb4WKgJf+UN7RD/R9WAiPAQ7g7MSSA
 liWEGZO5B35iv1+PwhqHT/cIb/b9sxswiu44u0KS0Qqz9hYVtsAaF8I6ucJAT2Mwu+VB
 9KlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrDW9HnpYQrPBx95dFQLyn2PFlOTeddttwpfNvaEwlq+VwTeN91otI02hS90vw6mpyd9itZeEXf2o=@lists.freedesktop.org,
 AJvYcCXpbVo+Ij+v07jPDdlFQ81x5tsErXi6NTjP32ZAUBe1Vmzywd2z9+KlmSmhyo8Xi5R5WOP8IfxHSI35@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWjTMYXecIY72Fb4OThojt75AaheEBG3kx5UF/rAhX8zLvChFZ
 YQzaDxc42RLaSEJTzv3CaGqJA2GfKv1a7M2j03ulNplVW2YSg/sw
X-Google-Smtp-Source: AGHT+IEaWx/441QIk2rtllfpJ1s+7PSPQeqyJQiFATxUwsmjwWsOBcZRgKQs+F7ZKPPkFcaq+e7HRA==
X-Received: by 2002:a17:907:e64f:b0:a8d:555f:eeda with SMTP id
 a640c23a62f3a-a90d4fdf82cmr1509225066b.8.1727177445942; 
 Tue, 24 Sep 2024 04:30:45 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it.
 [87.7.171.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:30:45 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:39 +0200
Subject: [PATCH v5 04/11] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-4-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=1479;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=HrcVfm6GphW+dkH2/eI9roTkaCaCbkN7M4JC5UFjlfM=;
 b=AyFPAFOk2mxFmrI1dnga0J8a6dYRNWGg482028ks8r3gY41J5JokFfnV5rBBLARPpqungLuE7
 JDreZFdmJbvABkCO4dnf3j+aNlwa3SSjw0PGgr0wxpdSn3/7UiL8qYR
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f52449b76c2f75b2d101c08115d16..fd31d1d7a11eef7f38dcc2975dc1034f6b7a2e41 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1337,7 +1337,12 @@ to upconvert to 32b float internally?
 		<reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
 	</array>
 
-	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL"/>
+	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL">
+		<bitfield name="STOP" pos="0" type="boolean"/>
+		<bitfield name="LEVEL" low="6" high="7"/>
+		<bitfield name="USES_GMEM" pos="8" type="boolean"/>
+		<bitfield name="SKIP_SAVE_RESTORE" pos="9" type="boolean"/>
+	</reg32>
 	<reg64 offset="0x08A1" name="CP_CONTEXT_SWITCH_SMMU_INFO"/>
 	<reg64 offset="0x08A3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR"/>
 	<reg64 offset="0x08A5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR"/>

-- 
2.46.1

