Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACFAB14FC1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 16:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481D410E659;
	Tue, 29 Jul 2025 14:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiwRHPIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8EB10E64E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:43 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T93G2h018856
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=JAyYn1wklNQ
 c4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=; b=ZiwRHPIzkt/3rNNsb7aQ7Wtdd18
 2mqUN0vdF2ms3+s8r2S+BUfhg3DB9QllgpMo9D8qjvLLKrjXoBYHd4FjZMKKWieC
 8fSaBhWXiB7vzb2Y7L72RtZX5yOi6l0YmBmbBpJ6VKuDrPHc9dVSH5oPbUUSQKYs
 8iMyA2bzj3q0Lf8jptTAkVNWgj6+HpJdJrUVUGz7YVLEDNJIWU/UtPkLyFMxQI3R
 9D96nUziOkQ5C5PJwkRbyDc63Z5rz1VcoqkYJhVOQNfTjICVi3+HXgqfxk2oO696
 6gGlfUapttfVrzOnOsG5/7uB510eSrhwoC7KD6UNjmIsDD78n+PkExM51+w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q860md7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3138e64b3f1so9023918a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801062; x=1754405862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAyYn1wklNQc4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=;
 b=nBSIxPrBAOK5XFFeonEExutRcuwouy3garkfSuugXiacVrtCUcPUSdq930Gtz38p24
 Am3VNDXrjJUtCdKU1Nxe24jjEVAuSaMD3a35hjLXdNpWiuhqHMlZNNK5NVRxzdNQV3Np
 o6j3s1ef6YefpvESbDStinQNU5idpUWZnlh3F5QqIrEKiU4afsHr4nfnwE72BCRyDxXl
 o7qNukJOGIcXYXvYRaCL5Umar5wXyXvL/R4NcqR3Vtv3P8EVaQJU+Dv1NO8UHiwP1U18
 kHiHAsRs5ZS+dIDH42RmUDkVQ6UugDWuEWbSxuRdpIJAG1v2I4W14QHGQpG1nRVYqTnJ
 N6Fw==
X-Gm-Message-State: AOJu0Yx8QzEPETK0HzEaEIh+OCvixYRrzmXV72MfCw/IxaKY9Aop1u8u
 ZFYi72hQ/uuDYufjLPWXm2ixOK3Outm5qgOReGkDkIvL74t6qTuBuB41x15jbwx29rBJhZQzoZ4
 +T+Nm+VuW9RqjknSfLvgi90wKrUs2QAGESIO6QLiVWDBknIslNo76aNYNDv4ukCT+AgoF3kSbjF
 L6U9U=
X-Gm-Gg: ASbGncsT0RkwPOlCcntvlUtnANwbO9jYp6I179Sus64wBVVFckhv1BTV7rvmor5wZmn
 fuv0qnEbzohEdRUaBhlcJT2DSsGQtmJEo5ViJSkK2A9YG9/t5JRx9/9kJ6ZzfTK7pi8107Rg5MY
 lNh1/CvCrsiq4ZqE+MqahU5EBZkiJAmm6nzi8wcTQ0s4/TFfiuntZh9Xc6wbg5ckBmO8m51sxu3
 f9jW7jbH72XXeufsucs6XU+0dOOkktC+FTQiFH7SKGhLO2a8hONz0x9Uu9k7tq5B1AtvaBErnsS
 H6D1YFsA2+blTL2Qi8mzLXDN+GeI4ZJ90gEoK0JXf5NxzX5znbY=
X-Received: by 2002:a17:90b:35cb:b0:312:639:a064 with SMTP id
 98e67ed59e1d1-31e77afec2fmr23804169a91.28.1753801062158; 
 Tue, 29 Jul 2025 07:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1VfCPq05jHjaQmPdpsTNpOERHdd8AcbiU4RZ9VCJMxFekjA0Y9XcD1WRvDW/ywpd3mPK6XA==
X-Received: by 2002:a17:90b:35cb:b0:312:639:a064 with SMTP id
 98e67ed59e1d1-31e77afec2fmr23804129a91.28.1753801061607; 
 Tue, 29 Jul 2025 07:57:41 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b42121a2c8fsm1289263a12.43.2025.07.29.07.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:41 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/7] drm/msm: Fix order of selector programming in cluster
 snapshot
Date: Tue, 29 Jul 2025 07:57:20 -0700
Message-ID: <20250729145729.10905-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExMyBTYWx0ZWRfX3Of2SitOtkvM
 rZ/rdkrxmiytANkIJrBQVMGDM2pcgMvP4STWfH7XFIVHXsUo88hmll32MvA8Sglw09Is8Muk9Jx
 qhEIWvzaTFjx2Zd0ozER1SLjPKZyUoyNADoDIOWOSu/heMxdmJjY2Vvurio5KDbxZIXMV95sN9q
 omM7N/l6lT9WYysLCKDDnaPAZTXNeVRKrb6+qMsa93PrDi41DIK+BgnaapZGZA6Mas24yBZ5gYB
 MQwShYGGBU+OWdltNvSnToBIPovTFiKcOCjJKPjBtX+PAjCPKcJltEsNiR2GZVSePxxtQnJz+ZI
 WRxdtmKZ3U6PZJt+GIC3YUPlYHfzDIuWAf90yl7fvpzm22oQ+paaSlcrgk7Ijt8yyVhx2iZVay5
 nCxRBjkcz+uLee1QaP/acJnqdPLALI8OxrcELw9xMfXmqaLbu+uE+kL/6pKGBx0fuhCHAKL9
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6888e167 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=5vtJ6i-I-lkEOiUwjbYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: md_HDFtU-gFTbf6JaGDs2972nYiI7SIR
X-Proofpoint-GUID: md_HDFtU-gFTbf6JaGDs2972nYiI7SIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290113
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
index a35cec606d59..5204b28fd7f9 100644
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

