Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5ECB41633
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC27310E32C;
	Wed,  3 Sep 2025 07:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lr0n2wkN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4B210E334
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 07:20:25 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831NI9k021302
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 07:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v+6e4xOzVaoqWdl3BPy6JebZPRvDVcagEgOuEn4A348=; b=Lr0n2wkNLANQ2zog
 JDSEYgYJjxeLku0RcngqH875j0lKKfXd/jD1QONj8y4IzuzG6nUlhI98aMkhjsG2
 QSSs6d6xdCjvHz8U0pJ7VcwZfsVoapOP86jm5OrtSA6u3r1WBLaV4fzAHirAuFeM
 +dQZ/uYgBb1G/+g1AWmjOqlF19FJF0EsLp/t/X0xc6+T/V+Y8f5Su2ngHOrv8n72
 A3hhq+o7bF0nEP39iIBvsYQjo0OLOzRxjlBcrQuof/Y6cxm9sGC08+uHWRd0qMQK
 /VRUYPcm43A0c75mckeQ8A5bjVEQZw1XwkpyA3GkZB1v90tYeIK53SVx7NmxWdTM
 +a32zQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s2p5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 07:20:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77250d676b0so816148b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 00:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756884024; x=1757488824;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+6e4xOzVaoqWdl3BPy6JebZPRvDVcagEgOuEn4A348=;
 b=fFGmTFPLCVyyGTNALTzC0Joy7KS7uEX4Vot4iSSe/l2gejihEWSicxrmOwFP+lUQVf
 czrUk5PqdHAcGRI7FYW4Tm0Wzcz7cN3lexK4sNZ21tloqIjTsDCo0mbYFx5NOL4EdCT9
 NrhzlNLn7D4e+auZB0pp4JFKseWi0Ryf4MM7RRr/KX7gxYqIj5POrE8J6DdR/jutd6P4
 DFlsbvYTURpOtzcYzQskXhHDhrG0Xg4g5dJAgpBqq5nafEB8/EKrlFgD5JvXHe1UIW9o
 9n+lmBQuDY4Sx+wubKq+jEHoGiyX/P6nPzjgVJcrRKcGeYYWhxu1w99o0DGuJ/b4/rSB
 jaFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg1W2y8I+nDKrE8z0+61b+CPbUR0Md068ag6mOlEPbpZairDV+c75jW3alawI8/w9waJQWfFnM824=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGy7RAAegwcH+LPBcKlWaVs0DK4BG/+TOLoh04ee2lS7bPI2e9
 zqXPvqzztYxYX8TTwpdnzgcXNfQGghoK8YDGOOnDPpfOIM4g5py1qg/D+baV4P49q+XE79pvloH
 r2DNBi4P/ftawGYVYX5koP8v4dwIEPCI0otk9H3Ct+nn6ofoZ+M0qgmiYNvovTSIld+97Qi4=
X-Gm-Gg: ASbGnctcApvfmnqLlJ9Ft4B+fT1obXYbC3VmNSCMdiU4Z6Y8SmwRoFemB4kSpytemLJ
 X28l1msAqNprgJXl8SzYKRCUSG+fOfCprXhmhCGJHC5ptY9i8s/XJ6GHEq+/Dkj2iDjbyU8zoh6
 RuqyjzVhzsslfUoOUV2PZWE0TN2KD8Y3Iv7OpQsbO1/Rp3JeoiSL/R8SXfNzhDV0IFLIdxbgm2P
 ne8CteWzOMv81pUmUuXkQao6Px6wqnbItSldH90Ri3WV+Lv8VxcvpSih/1SEEXEYrMBNME6m8xG
 McmzZRDIHdkAzAniSzGLrhSU+ymc7u7sZlpX40Tn5Ef5ZFoCkO8SqsSlgojKkyWg
X-Received: by 2002:a05:6a00:4655:b0:772:2bcc:d2d7 with SMTP id
 d2e1a72fcca58-7723c3e5048mr17242843b3a.2.1756884023705; 
 Wed, 03 Sep 2025 00:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+kWes+kmSKDdJMo8iXbuniL1stlElvJ8Rvpw/70/MrVB+qiWNE+9keUsOzaohXoVM9Up5LA==
X-Received: by 2002:a05:6a00:4655:b0:772:2bcc:d2d7 with SMTP id
 d2e1a72fcca58-7723c3e5048mr17242816b3a.2.1756884023248; 
 Wed, 03 Sep 2025 00:20:23 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 00:20:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 12:49:53 +0530
Subject: [PATCH v5 2/5] drm/msm/adreno: Add speedbin data for A623 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-a623-gpu-support-v5-2-5398585e2981@oss.qualcomm.com>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
In-Reply-To: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=774;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ql+8P5N7vQ3lwxnd+dbI8nX/wXVxC6V30jvlih6vQVM=;
 b=NQb5LD9y8LqyoVpq4tTw0yWHyAzdvABXKjSiYBepXTEqnf0bpAT7UGb6tTfoIaZqNelb396kj
 9NNDud/mxA+DwrOF1cbuOIM/q7b3JBgvu+6Q4M4IsCsxNlpogf4+wfH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXyNuBqefl47QO
 ODymwddvhMKdl3jKBEONikPIkTETSZMU80y28Ky/M35Ew625cNVX6NV+LIT1E3LG2kFrDYKmoQX
 pIWoCfzdyXAMx5IzH65LS5UBjrmCTSqwf1ktdRd6WMZQm/Vh8DKZmCBpRu+PoulQc4ZI+QC5Pf/
 28AkbKHcy2b1V6+oVCVLQAcq+VsvA+ofndHrdH64QjR4gQmV92vINQUR5d+CombKjWDyy8uaKxQ
 F0H0d1bQ/48fohF4pWWSPCJ6TT0mbK/NEeJHYdtYzjoT3Mzfqw2oT7v3HryYdcXO0PrgxUl8ikS
 g0reMKWjqteyojUB8WXc5ZA0yNHu26QUIdskMjx/fyKoxhaFAa/RcYbYCvY3m/NOv5gRbDHeiVu
 vpLt0fzu
X-Proofpoint-GUID: lmLQA8KNhdaDGzLSG9RLfyIOuHGzij2n
X-Proofpoint-ORIG-GUID: lmLQA8KNhdaDGzLSG9RLfyIOuHGzij2n
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b7ec38 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=kzp3Ga1VzSMNCBmXpT0A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

Add the speedbin mappings for Adreno 623 GPU.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..6a793cc666d0b53e6869c2b82c65322f92e2486d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -913,6 +913,11 @@ static const struct adreno_info a6xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 185, 0 },
+			{ 127, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x06030001,

-- 
2.50.1

