Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDAF9DB588
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BA610E26E;
	Thu, 28 Nov 2024 10:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SKyx4O4X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6F810E32A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:25:50 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4349e4e252dso6031615e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 02:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732789549; x=1733394349; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=reoDVbzQsiSf/gPv0A34FrWumLX+gyEDCSO0BWtsisc=;
 b=SKyx4O4XicBIiaTpp/zYXWwKa2W0a45dsxWtwxFIe7nftmm1sd7/SNztNUc4sC/osd
 gq/0Yp91whqrKUL3jH8xKy25/PGW1sJnnSEdKYPeuaUxsYHsV2r0H/Q9LEMGFDxbXfPK
 SYMqMa8yeYKAuxDbmsU9skb/G4i0h+T+KsyA6zvjXqAqW6rLel5AlmLniYAvlJU+YHRR
 Vdb7KM5Rxjarz8Se8XeFpDv0vIUNpdf/lCNWVhPL7qBSuio9S/STKSdgsA1FyXQg5Qyo
 FmiB/BVxS4NYiNm0zawlML3hf3Yj66VSs4aK5JlgSAKV0VWqfjIowawRjIxAeDTwhfAh
 U5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732789549; x=1733394349;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=reoDVbzQsiSf/gPv0A34FrWumLX+gyEDCSO0BWtsisc=;
 b=ENi5xea4oJCNgASdmhy05QsvbvlGfsFrk5NCVBhbec4uGIxVMBbo02BQSZfKfOg4lp
 4QG6q3ZwUpwgmbgwf8X3KyKfO2S1cXC90X46C+dhPymtW1Rzl9mEWeYmLJSH182KT7TC
 oBzUVFtx57k1vxEHA7AspH47OvePr7+J2NMWSE35Tzid3IGXrtxzTqiQDpVfBd7jORcs
 x3r5vrEB/zlWGoAuVlrhnuBfeTwjnnjiAeEqakrXNFQK5G5xN4TsdmO/Rll14y4/p7gz
 90ejh0QXRI8odNyqx/dJpjbp4XzfNPOb9H7/QelNkKCw7rShqiB0ZoKGjd4JeOJ3a/1p
 9bIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURInFoTskY5qjowC8kXs6nJiedC9+ce6nQQrrI1AHgNie1eJK0g2PqajOyHsActu5kqwGAfl9LPPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGa6ZQzPFEr5dzEq6cR/G6mn0VtruiZCpyd1+Oa1qPy1VckhKj
 5yCzgeMOY2smiUkjJlqpSMWdmOFRH6gFefPft/3vvUFpP2f2D/Fpq4TJFmKYhGI=
X-Gm-Gg: ASbGncuUJhmso+oOoK/VxCaYPbHq3o3FSywr7CZD8RZeNqZViPf8hwJrcwvILWScns1
 Lmh3ijs9/nB6Q5NSKTx/m3M1BleMcuR2HEx3w3VPQMPRHfN0lQthnYu8jIY8DWqJV3Bl5sJLgPe
 DinbCYVqppvQKSWRGSInnAKvY1fOgSjDOfqZ46nNh4XEc4XWSajqgzth1oqKyL/i3iw/UXRfNvs
 8xQU7JTXGC8k+zr2gJe4t7JVuBpzcrEhA29bpdZo1fgQjrC4k1UNGw+FwhzTBpF8eLMrXk=
X-Google-Smtp-Source: AGHT+IGVIJCasw1w/lv4nzEi6y4n3531XuVT2EDn/i1vSfZn52Q39Pj28ZjDj+ocKgTB+1FjYDEvjQ==
X-Received: by 2002:a05:600c:4e8b:b0:42c:de34:34be with SMTP id
 5b1f17b1804b1-434a9db8393mr69151985e9.3.1732789548697; 
 Thu, 28 Nov 2024 02:25:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 02:25:48 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:41 +0100
Subject: [PATCH v3 1/7] drm/msm: adreno: add defines for gpu & gmu
 frequency table sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-1-81d60c10fb73@linaro.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vsEtJhqxnbLwiKyoTF80GGH+V1VYTVJylLP0loUgqSU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUn67+M0ZML1AQ2Cu12caF1aO4b5n+ci1RzZfKS
 W1UiU6CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFJwAKCRB33NvayMhJ0Tk/D/
 4/1hGwJ8vuHp8WboZb5xYxpLSFr2w5QWVfhTYJfXz3uYFf09IKoQt1rD0qqOYKUrioDRVPXnOvnfEC
 gdYfqAzokrpfBrJ1IDSdDZL+bMw1poelWVWdr/UDO+0q6ivtCgTxe2i1toSmnHE+ccpXigknc2U1iS
 4WecgJfwi5zaxlqGStKnjZ9MxeJrP+tdi4VW0ghOInX7WgduaepmTAgesQ+Rpwlan7bVaG1eG82k8V
 /vqsiQUlUWnE26PhWF3K6eNPhgJfD3x4DFGKxo3eqS7dmDvq3d7qNtP3hbfJVLdrdGwkk144aPe0MS
 yVH1y4I40NCPtp7OnHEKjXgF9xJoLRbyT00Fb23tJMPethBjIJpk8WlY65znroi+j3S1h18DId/rDd
 PqHbmxcxetOWwL7/3XxDYrss9FqK+Zex+tDk6DRcaWhyM498GXdx19lvKJv8ND4HZx337ctJvhESGI
 ufv7C0e84+6RUTlMZ/lZ5BBEBsCbh1SDOh01uiyiDNT8SuBt7hIW5oYwurg6UTtd0TUG8wAyOzI2cZ
 wIMDENQbTNcZRmSUhpzL5Yje+OU3Vmh6qIR8MBF9VDeKTKv2XfTwxUhgDqqDexHTA4QaQesWcGgPNL
 B5Zxk5qKmVc9bmnZjA+xVsY2XGnYSD6O9w30M20cCS0NRrieE9AwUWCgXaVw==
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

Even if the code uses ARRAY_SIZE() to fill those tables,
it's still a best practice to not use magic values for
tables in structs.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..88f18ea6a38a08b5b171709e5020010947a5d347 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -19,6 +19,9 @@ struct a6xx_gmu_bo {
 	u64 iova;
 };
 
+#define GMU_MAX_GX_FREQS	16
+#define GMU_MAX_CX_FREQS	4
+
 /*
  * These define the different GMU wake up options - these define how both the
  * CPU and the GMU bring up the hardware
@@ -79,12 +82,12 @@ struct a6xx_gmu {
 	int current_perf_index;
 
 	int nr_gpu_freqs;
-	unsigned long gpu_freqs[16];
-	u32 gx_arc_votes[16];
+	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
+	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
 
 	int nr_gmu_freqs;
-	unsigned long gmu_freqs[4];
-	u32 cx_arc_votes[4];
+	unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
+	u32 cx_arc_votes[GMU_MAX_CX_FREQS];
 
 	unsigned long freq;
 

-- 
2.34.1

