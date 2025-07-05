Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA285AF9DBE
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 04:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE5210E361;
	Sat,  5 Jul 2025 02:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmJz75Pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1762C10E158
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5650DXjq008762
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uwF0yXtjcYZZHTWUtFBuT2u76dwiF/qWvZ0FO2txtq0=; b=fmJz75PgADpZWKXy
 Oyq9zd3dCsSv3twi/x2G5XmcBCfrJpXIdi00LqpxGyfzPFauCKTJRIgwfr7i84YF
 JWl8u02ObtgrM58bJgf7fczu/0STHIwqDB6zLxflVLXvhi2lZpb11+q8qvr38z4c
 x+qXSUAKuoGOGwaP6PJD4akjul2DonIhtwTuwD9Vb/gnaLojhR6mRXUTwbuYoqZN
 RcgGaOroEMk9AMbZEUX0calVBZ/XbW3KP63G9sCWnjl4RbmaFAYy5FOlS1b9PjzE
 aNi6uxUFBNtIXWcfNo2QIn3pv3m7uPnEAxj4HQe3Ud+dET7rMUT9nfKR8w/pH3hc
 nkPA4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9w7kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d460764849so418992085a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683651; x=1752288451;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uwF0yXtjcYZZHTWUtFBuT2u76dwiF/qWvZ0FO2txtq0=;
 b=HQhJWEsGvwVI/C2x9KiCNCXkdNIUj2nczUIG4KCHXiCEmVHIzG5OL6xcGrb/xH7+Tb
 jay7UlFmAyj55Dq6GSQz89h2BVv7yIwsXF1OGwNRycphNmG2nGV+7bh6xmNRSN2vv7YU
 6YPxqSBkqMdZczJtYk+xh+GzEV4cNYNaGtE0GrXGHzi9vpkm6NlSaTg1Whr3A8MLRXdz
 3oDQR2mR397iPZv+tuu1Dzpfu0wxdsunfC9C3RILQD/dyPvrb+fep/5i5sXDsj/WR75d
 RNQvuTyNgYzy1p4HKZ/cO3+sMIIc+F5zbWlcTewEcVWZ1JuHRVuvuNiOtIFKKoIt2FNx
 4sEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkgECc1h7VpFUeZ4vgbAPpRXuR4vUGbtf37Kxxg95q3qd0+0EvCuRS6w5G+isXKFpdOWmDFK0shCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfWdWpfkDWNzmRG5U2mdkpWgYepc3vW8dcXnUUNJtedirJKR/X
 UtR9ancSwuUBISoL4smhNBO2BM8w4a8e55bYeZAbjflRD9xxth2KCWcu8HNxw2AGFwbRHehX2p8
 iaSfla/T8mzY9A6gumAWn+lZcrLx+1moZQ7G/8ZgQcv1/A9srtIlztzbGE6FKsk3mI9fwDwHjlP
 Tr8Y76zw==
X-Gm-Gg: ASbGncuv9OLfvAYx4NfOL5EeCXigzTyL5jGvZvb6tVCZNLj/ZG9WhoB17WSQX4eKNbr
 lCRhED7O1jRoG5VcBoHUN1ecygCr6bBYIyFQ2a78xFbWfr91FDxlDCX5cj36thtZc4BCX2DG1gD
 AQ765I4kw6eLFHaZVaq0K/zk5z/E9Zvuwt2o8KhESjhmUQxMrOeCLMYMcazcsAojFgWmwXq+L2I
 h92D0L0ls0Mx5IY4K7k0egSL0fZa235CJVGPJdtS57IZ2wziokidGyYH2emjyAajbm3LHRwfJfD
 O0xi47M7E5NkbojmMowCsVFZhGp2goeLuSYrHRvOG0WnKqy5Nniy8S2Pu8KwU0shKrg3AEX/6Dr
 7MGltq9QuVG3N8/1/f/GXOfbQWLJZpxCMNWo=
X-Received: by 2002:a05:620a:618b:b0:7d3:e56e:4fd8 with SMTP id
 af79cd13be357-7d5dc66a567mr648064485a.12.1751683650865; 
 Fri, 04 Jul 2025 19:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjg/CcD45AAmgdd3TehstYt7pR3hgyi7SoBp8wsgbVpyLR3/nu3VuQCR1BxdlZ/oY2Ff7THw==
X-Received: by 2002:a05:620a:618b:b0:7d3:e56e:4fd8 with SMTP id
 af79cd13be357-7d5dc66a567mr648063385a.12.1751683650425; 
 Fri, 04 Jul 2025 19:47:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:22 +0300
Subject: [PATCH 01/12] drm/msm/disp: set num_planes to 1 for interleaved
 YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-1-40f0bb31b8c8@oss.qualcomm.com>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PILnmvpGnr1q9TnXm9+RxFGUB/bQl/VAfEMPj6+eJQA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI8paQmJDx7acunG6Rf9svsL1sBNNN8yILi1
 QsJil1O4PSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPAAKCRCLPIo+Aiko
 1UbCB/4vpQ/e5si1WCvR1zIPoAKe0Cg64TLcbGLi5QW9+TbtNS4WiMoqWkTqspNexCPf6ZTlvD7
 TPiFirmzpRC03azsgzeifdnimiztH3xJY2OoLOrv/Fle89yDyWnzGUQWxTjc9p+ip86laJrlhsi
 Du6eu7Q83pXnaqO77KFNK4q3YcWEwrjywKDyVb62DYUjkpABfkwxdXfDRPe2bVkm1UkPULF6fFz
 srSV1jIPaHj1LopSyJy7JjwXh5rUsgzGqbBprpyrjfQw9tO+Z8SPCSQTc2SAC4n/imEGRCgKAv/
 U8kqIxJM9tehJVCyDcSA3aZ9y7FnT86MN5QFngDEPvdca60/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68689244 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DB8TyEHaRv6uusbT9jkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: lmoHUfdlrAzqGvSqhs4LfJIrILELaROk
X-Proofpoint-GUID: lmoHUfdlrAzqGvSqhs4LfJIrILELaROk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfXw33gO3HlE9fW
 Rye3jcThxWjqSeGxxinfRP9Y0u5a9Ct9q8Il6jdEP84QsFDYPFik8habm6t1KQB3bo5ztnm1LOV
 jhzVEJT1OyNRBu2dt5udKB7s9EvEwJZYhNZ2q7IjyQklXd/MPt+Ln9jiyKWLdEjaEr0+WdAnUjk
 GA1MFXYg1usnBOkODHHsqwFPTJWL7GKEBnzILh8qqThQJ3MOy0f0n4Y0e7WQC/UgOidftJfQRJW
 tzVRhN/BE4PbGBfUJ6p0kB7PcKH1wcDcgvsFm4wAneiMP9cmO0cNDdAZXDrcfaIHIWYZZeUz0u9
 26Z6LDpK1zzkEKn2yv3sP+VJQTVySvVms0TyjQKpu9Uy74R62IetDMMdrNBJO67Rlk/G6FrgvGC
 0SthZ3iYkp4F+RCZSkxdKsrMDVZipr6VBFslcPujgcYkpS8scexkemWlXgRcnPcznWpiFxbH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017
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

Interleaved YUV formats use only one plane for all pixel data. Specify
num_planes = 1 for those formats. This was left unnoticed since
_dpu_format_populate_plane_sizes_linear() overrides layout->num_planes.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 426782d50cb49d57a0db0cff3a4bb50c5a0b3d1a..eebedb1a2636e76996cf82847b7d391cb67b0941 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -479,25 +479,25 @@ static const struct msm_format mdp_formats[] = {
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(UYVY,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YUYV,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YVYU,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	/* 3 plane YUV */
 	PLANAR_YUV_FMT(YUV420,

-- 
2.39.5

