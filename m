Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A3F857AEF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E0010E5BC;
	Fri, 16 Feb 2024 11:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gWJVSVmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA6010EB18
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 11:03:59 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-33b29b5ea96so922224f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 03:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081438; x=1708686238; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5ygFt5WEvBpqUpx/ZfEWpp/27W6mJ4fXmmus9YC0aao=;
 b=gWJVSVmzHZzEk2iNCmiKGNa07Bz3ncuVzbmi41sULuGR9Eo+DCZI1SptraWmWk5XEO
 Qk9mkmlf4RrM6f+mMIMtVM2n+n5FVeLpq92SEr1IDqnk74WlRxWWsOrTiQ+cUq6o2xI9
 lIgMcn4ZTQQorifpV7TmdBM9jcbyXkH0G+gEPohgQ8eQMnAwOMEJKJyUqXMxTWY28T1r
 MQJilx36HZdqB4191zjndosk1KZhLUKgZUi80u3r1ELFQgz1p9r51g7MXj8grmaQhhpK
 1FNa8e0MZ51PwkdyiHkS4PYTNKV81fGOvkvO88gcn1OQG/F/mk3tsiLZCTZMRX68edLn
 3RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081438; x=1708686238;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ygFt5WEvBpqUpx/ZfEWpp/27W6mJ4fXmmus9YC0aao=;
 b=NWYf1TU2WU8pz/CqyJC/2zKZ+z3G2ilhUZgwoGW+E5FSIfmph0vF3Wkw2796Uf19nL
 KGWAKob8YgAdtx9QQb0e39Zz6P08JRQUUsMqIghzfmRVsxPfvrZ/rUykcFGLaQqDFR05
 ecpMVW6TwWaZQf9dgNpMhu2FvzLQd1LwOzdqiZLbEyZc6cipLdeTz5RqeZtcGlNWA6KM
 jF9LsFw3mB7++Py/qnobchHDIMOUHNwy8zbdKc4umu04bl4Xz54wc88zF5NAxuOa5Qda
 e4h3X1ffstRn97QQ3xkAKFvgAqKdWAhS/R7v2sXlTcFDlz0urKvyCa671PoR6QcEjRPp
 C0sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl9DwjDLtIg6MiALELGiEftRSf2FfPr3QKkU5vMkg+lUp2UL3SWdq2NM3ozzR8h4GkrLEAJGor7IbVUY1inLDvVXTYRJ+43+xsKmc9sS6+
X-Gm-Message-State: AOJu0YxdDXa+0I0Fuhu4xg/HS1tZ1Ku4uOBcoi+jrM/2J5ZWTYlwpkjQ
 DG4isCyZzJz+yrtLsTTYnRfNPnaCcTEb8fpzZLlelQ4YikrRuA7m5j4ctn1ZyVU=
X-Google-Smtp-Source: AGHT+IEP3yiwcmF/JpddO+6q/ETD/OND3uScQVe3XPgZiAJ6sWVnA1HI/hScYmOVoLQdLn2nwzPXPA==
X-Received: by 2002:adf:f9c6:0:b0:33a:d28c:222c with SMTP id
 w6-20020adff9c6000000b0033ad28c222cmr6833643wrr.11.1708081438346; 
 Fri, 16 Feb 2024 03:03:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b004123b049f86sm1993174wmq.37.2024.02.16.03.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 03:03:57 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 16 Feb 2024 12:03:51 +0100
Subject: [PATCH v3 4/7] drm/msm/a6xx: Add missing regs for A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-topic-sm8650-gpu-v3-4-eb1f4b86d8d3@linaro.org>
References: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
In-Reply-To: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
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
 iommu@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B2VkxjrRCyr4kbi/Ih6iBNEXikEKFqg0faRJON0SE+g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlz0EWLv15OOt84prn+zzezyX4bsOfCsjeKZ0p7RdD
 9nUyGtCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc9BFgAKCRB33NvayMhJ0QcTEA
 CS2n5fqoqmYy9GHm6c4t2zLB5dDvZtmceau88GuV5umatO4fIxWOJ2NVqQz0VOvJbPEtS7xPrnA3o7
 JAnZ6MUVuh2noUioy3nxLe7FSMkh/ZPU2LRXwfKk4dwEZ0jF+MsRF3ZmZ2Hfw+elII/+aN7mJqw52s
 W8eyo/MgX0PgcTEKTYrqq0QRtGygwFwY4l1nxJV0IOtMGboM1VDlRq/BxaiUIyjIxFcNjuzz+Xh3w+
 Zr3SAVhHwGmNGYJmfIBHL8afHrOBGBloWT4rsKve+hzQ4NQIbt8MAblLGzeUTZSHpwwDPrIMBmO1rF
 vS+I1A12OTe4bEUDLXkmNEJPSs6NyxRsgGdOySmv3GJakcqJ+nbKW8sg1qR9tiNtCGmARKrnEnGPOL
 eEcxzYm8wlfIvLMMmxVQCKPv6tvaLo/Y0e5vo2YLoE8hsN1WTcOjSGnKCzxIXdLEeH+y+794HFWyc1
 1Dt8glMqWYagPv+aiZhsjdO3gFo0NuovcYjgjuxnr3SQ1nOXsS9q8YT6l+/q4pr47E2lOXRgqNttWo
 BnMpIc+sS5r8L9x4jpkteunntBHt8+6nQZTtFHCt/zok5FjqaNK/DGrKOiWDRm9xWQtEsBff6yphGC
 9JcXauVI9RI/gN52Cv42EbKaIhM09ziGBnkjek3NhTCJGhmUhay3i0Sj6n7A==
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

Sync missing regs for A750 clock gating control related registers
from Mesa a6xx.xml.h generated file.

Those registers were added in the !27576 merge request [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27576

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 863b5e3b0e67..58877464692a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1725,6 +1725,8 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_BLOCK_SW_RESET_CMD2			0x00000046
 
+#define REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL				0x000000ad
+
 #define REG_A6XX_RBBM_CLOCK_CNTL				0x000000ae
 
 #define REG_A6XX_RBBM_CLOCK_CNTL_SP0				0x000000b0
@@ -1939,12 +1941,19 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_CLOCK_HYST_HLSQ				0x0000011d
 
+#define REG_A7XX_RBBM_CGC_GLOBAL_LOAD_CMD			0x0000011e
+
+#define REG_A7XX_RBBM_CGC_P2S_TRIG_CMD				0x0000011f
+
 #define REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE			0x00000120
 
 #define REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE			0x00000121
 
 #define REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE			0x00000122
 
+#define REG_A7XX_RBBM_CGC_P2S_STATUS				0x00000122
+#define A7XX_RBBM_CGC_P2S_STATUS_TXDONE				0x00000001
+
 #define REG_A7XX_RBBM_CLOCK_HYST2_VFD				0x0000012f
 
 #define REG_A6XX_RBBM_LPAC_GBIF_CLIENT_QOS_CNTL			0x000005ff

-- 
2.34.1

