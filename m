Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB95B1434F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3235510E595;
	Mon, 28 Jul 2025 20:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyGqrtlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0356910E592
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlLkq005055
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=DJLMxQSPLul
 XmS86Qmm/+/LPCMloXGev8Y4y4Psl0K4=; b=dyGqrtlgUB93eDbcmXDouyadnwJ
 sNmpiwmsgyDI3+qLxbqFJVPzLsU1SWMAl5OOT55TRM0Eukkyn5WFy567grwzxSio
 yEWruDcHGv/Flv2AGfNskRvylbeg8Ulg+Ayrg0Lo7LErC1DcY0B1NoPD5LuGT0Fo
 XRXg/4km8fceVlfaNvyOSIbDzmTJOmLc30F6OxPXktAFheXPggZ5Mhne78PYTQ+3
 TabloM8V0mIuEY21ENDdtGySXV7kTdXRdq2Agwycugt1LlODTTknVh28v4UvvNmu
 jRsCwFsJALaboxqmGHD1HJzmjlZnhbyDFtRMm6vnLJ3Dek7nVlk6tnXAHAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytx06y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23632fd6248so49485705ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734862; x=1754339662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DJLMxQSPLulXmS86Qmm/+/LPCMloXGev8Y4y4Psl0K4=;
 b=mhmzLrAAkjSKo71Vidq1NiMg0qhbGikW7Q4bfyjbDFV++5CnTL5Ww9vc2Wkw56RDg1
 AllyiMqxu3SjExsuit+a5J0saMHh2Y1rEbr+ih4pgoynlNeIL6LOYNLlORSOh30aJDpF
 FBl5vw+RtFQ/3UN1egHmx4jmBAJ1cHYc1DXPwnskVii6EehLAMJDRDT/SqyTgXyMyXvY
 fcDvg0zoTPM0wiCKE+cPaw1nzdB6TDl3PP7vClPp0+T3PpBjQjS10TySFpIlomJguWeL
 okRN0wfRi2N9gRl9jzGhw1v7wVxIDer6aVCtMUPBP9fcNBP7EAmJOBCODAKd38nRe7QO
 lrCg==
X-Gm-Message-State: AOJu0Yw3Y8igeKccpYDfdUU9vh5gOWCQlOsuPS0+cd6VrJh8//3WYirj
 7Xs1fvcJwru4gI9+FoAzCMUlRuguNPlWBKX1C12dW2SZNYhMb6wSsu4AxmLYkxFMcHxL9lHy00p
 gyQyxqroofUd8KZq5sBE638ElNvz2xyhJjkiQyoxULUbqvLN4mZOZv6BT7bKqc6XexszDq2ykuv
 ioVRw=
X-Gm-Gg: ASbGnctGRXH7JzC2XMluybOfUfwH48lunaVjD5YPw3cgAPQsIhwzrm+VZwOZNZnh6W7
 MhL+k7RPP1RjAm7NNiAZC+cNWtjDx+OWh4VdEg4BDOph1+hlV8TT9s1jt4YW6KEVz5nCgGDFrF4
 Hq6qgdXc0hKeuANvkBuwMoN/1wYlctNfznKoziflepCJFFBN+qPuylvuUMop0eiwejLMXbKXSH+
 8ngVt8GRRMY+WPUFUE1tDAAilsql7W9yR+B8hiDj3H5hqrU+EChla4NPpwxjT61Ucd0bbyUIReb
 EMRhvH7yRhamwO4vrx8jipHrHDztBpqGHl/BgWwkbTZSo4yeva4=
X-Received: by 2002:a17:903:1b10:b0:235:2ac3:51f2 with SMTP id
 d9443c01a7336-23fb3100edcmr234346395ad.45.1753734862410; 
 Mon, 28 Jul 2025 13:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuxUhcvGJgtF6rDcn2PilTqgQgn7t0oHSLKPK2e//pz1CGm2wbhZkHISTRxQ7mDDyxLpBecA==
X-Received: by 2002:a17:903:1b10:b0:235:2ac3:51f2 with SMTP id
 d9443c01a7336-23fb3100edcmr234346205ad.45.1753734862031; 
 Mon, 28 Jul 2025 13:34:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-240469a8111sm16679085ad.168.2025.07.28.13.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:34:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/7] drm/msm: Fix order of selector programming in cluster
 snapshot
Date: Mon, 28 Jul 2025 13:34:03 -0700
Message-ID: <20250728203412.22573-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AMoQBm68oMKxI4COdYmUMbOlTweF_ZOO
X-Proofpoint-ORIG-GUID: AMoQBm68oMKxI4COdYmUMbOlTweF_ZOO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfX1eh12m3qnI1i
 ILziInCumq9xV7QXplHECiyeN4KCG3/YAVxh0vJospUl2Ak4TOE1v0jp7bs/UwnKExwrHzA8pSj
 2q2ucLrwaSwK5TxCPwcxSJA1+iWjHAeDL9Sl2X/3Ub+UXq6iLSjvkCDbv6W/M1Z6m0LG8dNXsI1
 uklAXKrIiZA1mSQ0D3muWHigufp1CxiDuzZUoOZFZZZcs8H1iH8JeCHqMQQL+dkn6B8Iq1oWxIv
 GtGHl+9oKd10zYA53HxxlyHkUWEusDiscCmpqt09ZNtjGSs7XYVc44h58r3z0+PoUd8U4dyfvNz
 rwH83aZBtg02x8OC/odiax5nn+Xu0CcLqHRGlNNMtmnGtqKYo9QJzlsKDnA9tMSxw+9UW2xHuXY
 S+7Qd8SEmd8GK+Y22222XZgUG2ZKOatibA4eoBDHH54ZUuOZyHZCV4FXsvuK3Zq1HtUb+QCM
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6887decf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=5vtJ6i-I-lkEOiUwjbYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151
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

Program the selector _after_ selecting the aperture.  This aligns with
the downstream driver, and fixes a case where we were failing to capture
ctx0 regs (and presumably what we thought were ctx1 regs were actually
ctx0).

Suggested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index e586577e90de..b253ef38eebf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -759,15 +759,15 @@ static void a7xx_get_cluster(struct msm_gpu *gpu,
 	size_t datasize;
 	int i, regcount = 0;
 
-	/* Some clusters need a selector register to be programmed too */
-	if (cluster->sel)
-		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
-
 	in += CRASHDUMP_WRITE(in, REG_A7XX_CP_APERTURE_CNTL_CD,
 		A7XX_CP_APERTURE_CNTL_CD_PIPE(cluster->pipe_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CLUSTER(cluster->cluster_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CONTEXT(cluster->context_id));
 
+	/* Some clusters need a selector register to be programmed too */
+	if (cluster->sel)
+		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
+
 	for (i = 0; cluster->regs[i] != UINT_MAX; i += 2) {
 		int count = RANGE(cluster->regs, i);
 
-- 
2.50.1

