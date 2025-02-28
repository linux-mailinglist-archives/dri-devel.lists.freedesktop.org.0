Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB6BA48EC0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 03:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98AB10EBE8;
	Fri, 28 Feb 2025 02:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bTO9if2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8820B10EBE1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 02:40:49 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-307d1ab59c6so18219141fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 18:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740710448; x=1741315248; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vOGs6Fa6zuHrhwyPIl+nFTAKnbOoAu0XxgAk7bsGnFo=;
 b=bTO9if2BLgCZJO8/x5LnH/lR8k3BhLX2ZdSBPQqOI9aY27sFtQFwNGxk/9dxIHIzBy
 1pvdmKOIwlJV5ZbI7zrK7cKR0QUzgatQ9MAytmTxPDUf/r/e6mQ7HIH7A5wKki7EO+yN
 sBkFbliEp/bXkuJJ8JNYAe4ABVJqPWXS7UmbmmFHVyAiTBONKX7YkiXCT4MrbD/d+Xkt
 XXSAW7H62c2f0DqflHeF89HXAeb3Wifh4Zon7ApOhiDzpAX9PActZjOqR7dwKkKDA0Hp
 RGqBYj0cGokEOpfemfoRmoplu8ZOWqh90/G7h465gHDY2ibUHiNsoTwo/e+wXTBAmXc1
 XLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740710448; x=1741315248;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vOGs6Fa6zuHrhwyPIl+nFTAKnbOoAu0XxgAk7bsGnFo=;
 b=dcZK/ikZoNMYaWgztf0ZjFlTHZ7T5zFBmpyfNV2hqoPIcEihDLx+EUor46rdMXWZmF
 M8B4J0e08RtKMCbBQ0eHy7SohzolONYSEuLfeLPNGDyJrBSNEQW+tbShzTrWcQ3DR75q
 wBm/cL0GTyUkPX64ibL7q+0r5XJHbVij6WhJUcSkWP50TeYqAx1tT5WAFFq40hC6kxrX
 7TNUmpUGA7JSOu5wc7cdjr/NojrWtw/Q9rdKREYLjKpNbTF9QHgoPudg1DyPkyMrjJLA
 V0A2hkH4GZ31QHVdTjoptfsDjjOkWP9Bu6hDTvU8EocnzBzZJagWt+JtjsKFiwloZh7W
 PIRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO2jfuvzaUFvkCniJ9xijLYGcFO4vmMoI5qtzhFF6Cv8/6bQ0Ct/LtblKAtbtP1iwfHwdCVxXfrZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwagLnlqHj8QnzYcT5S+S0c+KkWIYWckUEJ0ptSdC+UHWrUNPMn
 8wc83kYXZxDCg/tsdzSmgnH3fYwMaPDjqnVpGFd7uOlbSn+/4R9b6ZJbNq+Weu8=
X-Gm-Gg: ASbGncuKH+V6t5VoRLJpNky+q1ZyjD+QpN2Kg1pWaYlqmL4TfEBJIMsnSAFLCZCMN78
 AQ73HG+pLIXpKFWm0iLcOmj93nrwg77E5YX2yA/nPZY1YRQdcuaMjPRqQrb2TfbIm19v1Z1T0Un
 AjF6OUfS4LZJYyLEFpzXRug3VrxY68O6janPa1WGFr4DQ5XT6dJos9je7FyMxGytX9OVOuUxbQf
 x+CdZy7wiShlaBgR5ByKKRUZfUxRrl/mFSif3m38mQQU2IqrL80LGIhQjsT57A/xiLnJ/OUMC9z
 fwE+zCM3c6Y08bDMTSZyuzfbCMKEQoAFwA==
X-Google-Smtp-Source: AGHT+IEB4jROCc8fnBy3MSZrW9RzrxCaLFObuJxsi615v2WW4DWyQ2y9erjQd2zzlfZt4HWqNT73Xw==
X-Received: by 2002:a05:651c:e07:b0:30b:9813:afe1 with SMTP id
 38308e7fff4ca-30b9813b4eemr801181fa.25.1740710447809; 
 Thu, 27 Feb 2025 18:40:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b867a7403sm3493881fa.17.2025.02.27.18.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 18:40:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 04:40:39 +0200
Subject: [PATCH 2/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8917
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-fix-catalog-v1-2-b05d22fbc2b4@linaro.org>
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
In-Reply-To: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AHlIDMaamS4Q911Ji55qeGiDjSSjpx7O5PqZx+FIb8k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwSIo7NuSbAFeNFO1NY+RizSOKgHJrrMgQz/BM
 XWFEbzrn0CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8EiKAAKCRCLPIo+Aiko
 1Q9yB/9Isl5/jVjtfyVK1130CUffh72E0EfipCMgeU8T2V/cUd/oht19i47Bklr9nLRGpZgr0QF
 nhI5oaX2BJowBZ7XVBBL46P6bSfq7TwhGC0DrGEvNK3B9LHLnQOAdgv7wYlUqjVhqK29uQEwE5/
 JJi/sefWmvVpPkWxytK+0EhNUbmF5UyfG0ADicerAHsoIy1s5QIBWruB3KdrnqsC5r/qU2j6R4m
 OdJs/X0VWXZRxsHn7psLQ9Q+H4INkAUvLxYhtHMHRQt0uwlxtkDVFzs2iBcWmIv6w9LROVF+Jq8
 C/JtiYINhX+7199v3tqxSZaCU1G2USuXFqjGQffzH+WkMPGY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The MSM8937 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask and, as it is the only remaining bit,
drop the .features assignment completely.

Fixes: 62af6e1cb596 ("drm/msm/dpu: Add support for MSM8917")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 6bdaecca676144f9162ab1839d99f3e2e3386dc7..6f2c40b303e2b017fc3f913563a1a251779a9124 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -93,7 +93,6 @@ static const struct dpu_pingpong_cfg msm8917_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),

-- 
2.39.5

