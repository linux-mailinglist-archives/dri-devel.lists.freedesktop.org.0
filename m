Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7197B44AC4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 02:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112C810E34F;
	Fri,  5 Sep 2025 00:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8LxnQMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692AE10E34F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 00:38:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584Iiifv023158
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 00:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yTzO62qQEXkfh7mQFeF6JWdziRWqLc1w2y3Ayzm1rok=; b=L8LxnQMkdelWd9bW
 Fv8Ct44/t9adiGQQXxAD7FZsreLPJVR0TOPF3ukyWzm55bmTb61dfRKym1W1NrYf
 4qvRZUKkD4/1OZhfagafn1kNEaKOgIV61fkn6z/agyahxT2kWLgyAa2Z+Aww+e4x
 lQbG+WoZ7cryx9tzynrZv1jE9+iPKerlXXdAyQNUdTY1IfJdp937gB6biT9/Pmfb
 Mok0gw6eFoO1UmSyXAuTVVHGKRRoM52YFamNObZyMFH1UMrEeFXO4vwCeI5PdZ41
 a9G3Krd6BEBJE5kq67I6l5EdMyqkrTobyQBtoUTHt1DEPFgXlbhyDtcool0mnuYd
 5Br25A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0esebe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:38:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-729751964dcso22978016d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 17:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032721; x=1757637521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTzO62qQEXkfh7mQFeF6JWdziRWqLc1w2y3Ayzm1rok=;
 b=k/EM0qIMokhqhrww5vHNwaEPM7hhtzmELOF27jIEsKe+2nbKsKjgSFemoJcZGAKEl5
 yuPNsPaZ/rOGcELq4ASJI3y5WYin0e28kxXnivBnCa63oytWf2dGiB0JWIpUEQzcJ1BH
 8ztuhwHf3S1HnHLcpt2JWOgKL1k87jurwh3qONZ6vIYRxyJmSncCr3Pkz1N+9DOTN6jA
 uD7kLeyfIoF14rFIRhaW2u+ectCG6j+6i4IKMIOIo4HZyrLVUrRtjVxrTqcqnzcqxnL1
 0nKzcPQDX1li9kt75uHvXKLhe1TW3XQl9hYlTmkTs/1kfmewBIijQLUMHi8r3nvsngTv
 sUJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrGx5RnAjfdHT6O94AVfUVOuf8OyYcyrGSZdLtCN3W2KoIzSxINn507MUi7KMSJrcDnnO5NrHMBLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwONp6ZUHzPHy8no74prSXVJh42UpQ70gMO7+mqikynBblMojlU
 5Aa6vAX4zXQMOXI29OTENahjQij6Pbv+/Rhc7ue70WEVZFiG6ChDe6H9WgOGwbjFGuDvgk/nBMv
 2YG+cSfGm2rT0DP9pt+3IoQqHqo/QqH2HMLYj3SQQ7aeSMsETXjLqQjl1+u+akPvjYgHYMaY=
X-Gm-Gg: ASbGnctmLeP90Iu0XhnTtfLdCsv77X1dn522PsfxaLUWOGGb+92Wd0PMFZ+dMUZzaSr
 3AhYRYU9AKB7q+xlC5XXAO78PGxqNBCXmHTiuKVPmyY4L3fNucbrkd5FgCiGqU8cJT4/P805vuG
 KBWyEzBy+xAhcysPV7IEz7Q96ewmBAun+/XSCw40vPaLzlwgCrOYkGPrnJtdwhPlxUvEg/bizK8
 iVbjmlilQnPqll1L6SUTHm0EXWlZkA/mRsVODPdIyCeani7lK/f8RsIqOwlFmYzp2JIRGk27m2e
 GpbYuHq6XYf+VngXwATq2k9YGy+32WvnQZnLNodBW/jN4SZpoC+2Rb21HFVjKPDNxCdsjXc7Sxi
 fIpPEzjotAQQwe/fK0WQG2ka/IVSra4wbZxgpZCVtBGxTzVuD31Wx
X-Received: by 2002:a05:6214:3018:b0:711:a23a:281 with SMTP id
 6a1803df08f44-711a23a0c15mr194916446d6.65.1757032721604; 
 Thu, 04 Sep 2025 17:38:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuZohjFcvi9xTjLiW9tme41He1itQHQ2UbVUwvfQWw3Lg8jdFYcIPQk8JEEU87+AyJpRPc9g==
X-Received: by 2002:a05:6214:3018:b0:711:a23a:281 with SMTP id
 6a1803df08f44-711a23a0c15mr194916216d6.65.1757032721142; 
 Thu, 04 Sep 2025 17:38:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:38:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:30 +0300
Subject: [PATCH v2 01/12] drm/msm/disp: set num_planes to 1 for interleaved
 YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-1-7a674028c048@oss.qualcomm.com>
References: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
In-Reply-To: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pjUEPhdOzoPN8Hx0y8aVOu6btqr80/b31OiPFcm79wI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEJ3w9H0sgiKbSsYOCwI2yiJJaK8fGHDXl/7
 ZOVoYJbKxKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCQAKCRCLPIo+Aiko
 1SnZB/90j2/8ZftKy0xyZheaergMQBEpsiEvBVvhfXlEtu+HzAJBjAEOUlwblXQ+Ygjd0HsxV9e
 xBaJ1l/OxtauN6WlE5NwuFZk5Nf89YVMZ+v03D5CbAlsVMn+FLhzizhHrw0VoZPsQx1Z27k5tEi
 6jRSUhqbN6fN+94jYERIOjUTbHtxjzdJ7spcVxcGzk6QkcFMX9UBqllWURLIDEwzK6WYS/Ybpb6
 +/ruy7WsFUdV5Jb546wmudvXtVGw7j55jtU5jfvKRPmLGPystk9ePmsqmTHi0qDeTNkypzZIH0M
 oRvWreNT1kqRFaAe1JkR6k+O8QgL6B1jqKHxgcUVuW6CeGQ/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: YSI2jUmDzBVk6YbVu_6fFzNI9zuoEfEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXztdWzmUVw7s2
 eZpBYi+FcIyz/ZyD5IRC9YCn2NV4dY2E9YxUxTq+BN8IrhYULyU4TfFbKufDAYiFsMGRNJcSAY2
 7Tp395QODkl3k4vxDN0KVln2pu7v+XXk6O3OBiLYFcLklumK477uPEG9OUtp0gKs/4qiK3eldmW
 yC2K85gOMnXs4uumi6XgX9aLRrgl0uVMmKHHPOZxw5tSWxZ7VX3qg/hzASpLSPPCyXTQr2GBxvD
 FeVAXumc6PQCZhMt15UQZAHB/K6HctauRBZvYYrGXjwwA5kDlTk706RDt/QM3W7k/wszGhI7SAr
 ceDNBYfvV2T9BzkdO6F0e+ezZ7kaXZdzz0ag9QYGp8TsQo+EFxDt18RfQOUafTx8tfQ/YJtCq/X
 IkZ8J6Xf
X-Proofpoint-ORIG-GUID: YSI2jUmDzBVk6YbVu_6fFzNI9zuoEfEe
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68ba3113 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DB8TyEHaRv6uusbT9jkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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
Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
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
2.47.2

