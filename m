Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2697EB26000
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B399D10E230;
	Thu, 14 Aug 2025 09:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGz+aJr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C51A10E13C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8ssAD020597
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=rGGIgrmmsmbimgDt4vADL8
 x+TnC6/clX59aBfoICLGQ=; b=UGz+aJr3XrtRjYKMQREbXjEgg1DI0Nmc0P0vkT
 m9Yf3FFnzBeGb/g437vbmMTJMFs0d4g8NGCkiFxkX5roEnYLhY6VuGwTkjaX8Hph
 sjpiBSr0vwCQ9r5wQIEzM4dlCBktf21na9+Y9tIRm6l7ROZ+Dee8Ihu+CtHSzbST
 Tdcc5BegwboSt+CV5oK66CQLFD1meSSPpzI2rcwGWQXsd0q2x3DfgIOCZavFzdOD
 bSGkndYTdrAM4AhOWeK0jOLwLYReYUTW5wQ32MvOmX8PzzpEvVkJ+bWvwS5/StIQ
 CxgMv5IbzCVxB/YNBTefbr7OPpIZluQwpYufY+o9puMJw9RA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmf1cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f636685so24096216d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 02:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755162236; x=1755767036;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGGIgrmmsmbimgDt4vADL8x+TnC6/clX59aBfoICLGQ=;
 b=msxAL0gYnsZER6P8f6Vn2bOP8ZO5dOoOewMoU6zy4pwXgU996EWj4o/3RIxAydVtDH
 Z966ciUNfgfU9BIpVPyTLfGm/iHjcHm5Ul8IDQ46qIDnAG4qwNTtUIoXuI9XrCDrUJdI
 YThayTti/RDdxKcV0ruSSmKx1nc1pC9MudvGUnUul03tFgpcLlim/R0BMHxhb3SdUKci
 YQF6awjoJBb02qUbBq0DDbgeSq1wVuBN3CsOtZ9sv3/aTQY+o1VJ7H6z2aiq8NfFw7jZ
 V8pOWYqLexiIusIk31Kl3JNRXjeCqlKgu5KcGslOWf9HZAciop7Lp4hhMdHKA6NPkf42
 MD0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpwXPb1k4dqNSFNl5jZmNjTm2fAoaSyyHExQjexglVCw6hx08PsWQyA+SFbS4+j7YKefRr3A2OtFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW6OCS+F+jKU38KrKpYhFJ4CCAg37MOm7bC4otdIsQu1xOu5P3
 OtMaRX8TRl0FTYR9cjtr0Na7JUR8YI+Xm4WOosuUf4cmR7yhQZ9/ODNU2IqnpgsDJ6jKnoU7qvv
 JewrMcKKTswKa3sLcWsVykcbXJMzu9INmZJemAOFyP5RADC36O10CAIAx+T3buk7SYXu3dJM=
X-Gm-Gg: ASbGncsF8/JE4/LxNaPty12tCmA2vOr+A4DIWW1RFQhh99+CcJrxBcHZl91znoYMzFW
 6FNACUTqQ3U7fT1wJ+dm4cezMMJaK85/BtFNTKrvbNlcMZzKEQ0UUVdoEztqBN/rfiGHqh9RQwa
 pg3VQyYZfG+JKFAF4Un+j65erV8Qm2Vq79SmPsL9dTBAwaX44cBNcCOl1K4RUuhFhAtfWLYh25k
 +oSLk4O1tSTJZYCjzV5jyJ49wCfCABSR21QOSK6bWpzUtaRF6gu/ZFdCykf9lGMBz7T2eNfi76a
 abmQvKRIthb3zq/AqiAAKVv6GFmOTzl1PKB+6S5EJOSh2gmApFfed4UieAfhF72R9T4XFqOiiV3
 4MPv8L85U/GS85dnyEDi3JvA4ZUkE/b+E4PfRrkF6Jd+0qxHObgxc
X-Received: by 2002:a05:6214:dc6:b0:709:edde:4c0d with SMTP id
 6a1803df08f44-70ae6d3710emr29798376d6.8.1755162236385; 
 Thu, 14 Aug 2025 02:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ1HL/zHxuCTsnkJlePNuWvPNebHmrVkEdAt8etPB1DsMCZbdV+ybwNuWXk1pRpyEqmj4zHw==
X-Received: by 2002:a05:6214:dc6:b0:709:edde:4c0d with SMTP id
 6a1803df08f44-70ae6d3710emr29797866d6.8.1755162235837; 
 Thu, 14 Aug 2025 02:03:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-333f8cec11asm1720061fa.23.2025.08.14.02.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:03:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/dpu: use full scale alpha in generic code
Date: Thu, 14 Aug 2025 12:03:51 +0300
Message-Id: <20250814-dpu-rework-alpha-v1-0-b4baa4ffa8fe@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHemnWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0MT3ZSCUt2i1PL8omzdxJyCjERdAzODtDSzpDRTQwtTJaC2gqLUtMw
 KsJHRsbW1AOj5nThiAAAA
X-Change-ID: 20250814-dpu-rework-alpha-060ff6bf5185
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YsXZpPAaNSeCnyMCCLmHOfqq67CcDMLsx+wfM4OBZcw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonaZ5pHml9oNbOWl15GmrKptxv7thvICknjHEj
 I5Q/zBSdnCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2meQAKCRCLPIo+Aiko
 1eYkCACOy0N/ydD63zVefNmO4rL9mm/EAsrC9DOD7tCihUGn5WrYCi1O3wFsMtzA3mlk5ckgJxL
 +vgK8mUH3LyTGJA+O91ZyyBplFNGQwKGSi/KnVC9LLK1fszi11Tw+h36B5nNJQj4FVp7/4AJRdG
 obZxBc0OTGxv+q9fe9tOjdZApd6BKuU9e1YidBSPv9bEhlQurDuqBiBi+aBWS+nAQ6stTkgxcJO
 KVGS6Ry1RlKgEK6+s40NaMtdTbeda1aNmj6yi0x4deum2geO51PLWV04afRFcfAjPK/ZSEI9TDR
 M4EKf/FzT7DcfvcraY8sbz2+eD6kPPGiOZ9Di/3ICMhcHt9r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX3eQHNd8vwVEN
 2AHtUMv5qu7sEgEPsvFhZgAkj7Wo6o+gMMKr3FrOfy9W9CH3ljDvgapZKaPIAoiyTsgZr6mm2+o
 1W0+1yZYDOYIsg56/dDtrnIVgtfbHn5mbc7IzBtOZrNOPKO14y6TF0EFASB1GhzpjV0Zk3YNjnl
 6szb9qGfC0eMhE5zat5qEA5kDyFZOWjvlx6lmfINPtoRI9KtlxdAfIzG6OiYEZQ9FENjgM/GhUL
 jxZ/nk9nkKu3++OUXGFz0LhUPIO0U34cg3qY4eOuVp13hv4wmfpsmRRsoWzcMud5E/93clv2Nr4
 45/iK9PoKeO7cfRdjSaKOZjXfSnDh5mA4kdjS9zrCtLPL3qN2B6OHLnmG7p9ozx/Pa4fWbfoCql
 SC5cKb2r
X-Proofpoint-GUID: atLGkgbpHN8HXHOuuYA0QPXWmcCHYvzz
X-Proofpoint-ORIG-GUID: atLGkgbpHN8HXHOuuYA0QPXWmcCHYvzz
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689da67d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=XoDkaeHCiDYGaMSRgogA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119
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

Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
callbacks embed knowledge about platform's alpha range (8-bit or
10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
alpha and reduce alpha only in DPU-specific callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify bg_alpha selection
      drm/msm/dpu: use full scale alpha in _dpu_crtc_setup_blend_cfg()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 10 ++++++----
 2 files changed, 13 insertions(+), 15 deletions(-)
---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250814-dpu-rework-alpha-060ff6bf5185

Best regards,
-- 
With best wishes
Dmitry

