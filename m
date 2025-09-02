Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DBDB3FE74
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1445C10E687;
	Tue,  2 Sep 2025 11:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0oklpbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252D310E687
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:51:04 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582ACSvs030589
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 11:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RXbXSoN8+xcQeFZSW7xnjf1gqgKzPw5UBm5otQcCyVc=; b=m0oklpbHMHSvAIv6
 e4GB3pxIvHi3cNzY7ndYtkhNsyPO2fsmSPj/2HU8XnmguTPeAGBz0LGdMkny3Mvw
 Wl+uT2fw4vhblBgRWHPQdKv4UPmKXgC5xd5mbe7i2B6NecSueo+GKCTfzJWnKiPF
 IDlgS+vt3VPOsTnqgSG+EmwnKBr0bm6lugIWPWAYDzZaunBPVo63b/2mf7Qxgeuy
 +8DOkuPzU8y3xf0ogyzPYXnEmt2TqdgnBbzhJ4x/8h4Qeg7o+zg65N2hrmx+lc8F
 dou2AbanwvWOL1mM7igQnDqnO/15dS9/fqmJqVy9p2RIFEL4yX4CAP9NW5eq+8GW
 fIzS9Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8qmar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 11:51:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-329dbf4476cso785332a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813862; x=1757418662;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXbXSoN8+xcQeFZSW7xnjf1gqgKzPw5UBm5otQcCyVc=;
 b=IPhjCf/brlLXlr4boMzPGNy+HduUHs12Xa7RBkoNgoJrKqZoRrH0ZKIuG05jLLx+eK
 KCKi4h9bwhzElWjvd6XO95oRTXrmwn9SclpM/t/3U2ht3EA+6ua9V2frjdVgyL0Welb9
 hNyzYm8QwGofmNR2yrSV5iTiOE/Dkq52ULVpT7TVWk9yda7eolc5WwMQisAE2LcvgtsS
 IFwSCLfcv/w8q2UK3mEZvw5Ii46pGNWMeNxkVg5GHsrx61/AspUYG98Ydz3/X+YtMx++
 RD+ZWCg4Ilewpvr5AtH6lX8S5+yaH4OrTIjOViUSHMI3Tegmw2zgWx36B04Iw6SvynV9
 /zNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFP7fSBqEP60EcMV4eS4ZtUkE+xQxVwdxKLdkmmV6dMoPqG3DXTvb4uu9RN9vl0PLUmA3avueQl6g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKav++d1D+1jzBKPcn86D+8k4nGYurMpU54SWHN0mL/bOQksAL
 gVUikkEEaK/7Dh0QFhzjHM4BqYwxg4Q4HgV8cWNeJ54xNaQVJPg+kuogJKzLzRF8qzhxpNDicu3
 M/ZqJDO7Hs1Vv1QagCwHExtmX34hYYcBa11ZXz9x0mdI8XQm7aeT4JLLTU5lJcDYEFpQyRZs=
X-Gm-Gg: ASbGncvcV8dtt6RcI2qQP5C1XZQz4y5zgCpJKUQrrcEE4ZDOtThEZBMsC9wPrd/HbtZ
 oEhv/8nvPP2UHhIAYC5GlSvdh8Ge8KW5ChoTkYMCVIEwuEuQJLLUXLOgfYgXOHrEXqHlKk9nIId
 eOucyALryq4UzEUuJLedIhRkCGM9BWy+RFCiUX0Iz4jf5YfpzRPyIr7LVxKqpAgfsMoisgKdxUK
 viAHphEFQFEFF28OT/qXjz+2nVKUjxKoJ+Cr//bAkQ7crvHNrfCqzqRjR9G5OIb+bL21eoJN7jj
 pFpKfbdrwEqj4cBRJpGcybuBO1W9//mFnHq0ZQmcjBBqBXTt0QS3EzHclryQN738
X-Received: by 2002:a17:90a:e7cc:b0:327:dce5:f644 with SMTP id
 98e67ed59e1d1-32815436034mr14083556a91.11.1756813861798; 
 Tue, 02 Sep 2025 04:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoSouSKhDw/XMbQucJtw29inwJa9PXd0lM4uXnFSu8NXWhDmuE8ewb2G9NTAHJCIwa3AK6Vw==
X-Received: by 2002:a17:90a:e7cc:b0:327:dce5:f644 with SMTP id
 98e67ed59e1d1-32815436034mr14083530a91.11.1756813861277; 
 Tue, 02 Sep 2025 04:51:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:51:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 17:20:03 +0530
Subject: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=862;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=u+jvzNK2e56X8NgPlWVyKgTqTb6j7//8GPSdT1wszhc=;
 b=h1wuLBfHfxcnM6zFAKgRxWdVDGgBm+1UEUHwJUPl+idhjvX3cN7t259RcLJnP/jnGewak+bBJ
 jWeTxOAo6mMC9ctIPcO0kjFFpFYt5i3C+xqg+hvMMdgsFtncKo35DtR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: BfeLpzMN0iiAsbMYUzYQ4jQHwrdJaOWU
X-Proofpoint-GUID: BfeLpzMN0iiAsbMYUzYQ4jQHwrdJaOWU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX22JyJyPNWX6d
 J5fjNpED2ClgjSl2kJHUq0i3mk11K9/wWog/fTFD8czfDqptCaBNuzIZD+ovJ8u1EshtcyRgi3L
 FVHDEjNYVCV0b/1G5E61bTrUFLEsdYS9Fb4uIvO09q0c/BnJ5dpA9X8AqjGHFLL6SEkHsy/RQ/v
 1N5WaMnKqjCAK1AUQRbYsnfjEAS8zEjnHPx2O7OxSYXSCekHlz+xpZrh9hNMvC/qCINmw2LaaFN
 PV2/4biH7PmLlKGwE3SaWZB4BnZghaBbmOZw/1Ry/mqVsoPK8lF2DPevy1Jm19LJgMZs0AL+mX7
 mBajJNOzuvTjknpDFfFHuODT8PVu+ySTSnNDXkwDlrdkAeX8E5zgZunxJ8v6GxJZ2PoeLIovbif
 JK1FX6/m
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b6da27 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7jaC3Q-7aBCS2g4HU_oA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

It is not obvious why we can skip error checking of
dev_pm_opp_find_freq_exact() API. Add a comment explaining it.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc065b5c4c49e2bfd5dc7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
 		u32 val;
 
 		freq = gmu->gpu_freqs[i];
+		/* This is unlikely to fail because we are passing back a known freq */
 		opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
 		np = dev_pm_opp_get_of_node(opp);
 

-- 
2.50.1

