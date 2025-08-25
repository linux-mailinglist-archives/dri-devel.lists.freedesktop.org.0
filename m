Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883CEB34336
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E074510E4C9;
	Mon, 25 Aug 2025 14:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WE3VhV8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA6C10E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Qllo030514
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M6wHYbSvg7X6j+hxKHpKI5Xd3HiTiQ5a6PIWmFXRLBo=; b=WE3VhV8xruhxECoO
 l4c+2fW9Y/peDX9IcqV1KHaQj+t4oNPb51aj5bbwyJd6PbuvHXALDf1wxUkiz/rJ
 eP/lVlgTCIgEN27RhrYVjjKRzmVb58x7GE43TSozz5b8d9LoV7B4SAZvR7ywg/9O
 0+lIDqAa8z74feLeFaoteBNfPyak5HuNndGG/6CSfKsbgaTblCUcUHuPu6ACUkSj
 jYqdw0A4JlpXh4AhB/1MEKigivh0VVWpelxn209vop1DtWw6iLCmnysdGuDIBo/w
 VjRiVL3RfsA6Sfr8ApBYh7OASOkOtG+rWkE1TSTMH2t2enuk9CQPNEEdZ15mzc8E
 bd6FrQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwbh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e8ae86ab3so4285744b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131534; x=1756736334;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M6wHYbSvg7X6j+hxKHpKI5Xd3HiTiQ5a6PIWmFXRLBo=;
 b=oMHXBqdDNeJU+S+5mo+SpTu7xJKG/KrRyWgWA9bCsLS4EeSozw1qMNy34qevmrGr+p
 9RDrgEtiV0qh44gw4nCRMn7rECdQJqEi5UQg8G6Ngrb1kYqFEGPXwnyt10CKEQijpksM
 MsAwScmwllIPe7gkCtYwIqenU2s9UQfN26Q3OEKdkOOg8L/cq59frlkpCJgZii2micdi
 kBD9GvD+6Vw98CtgNEAUEWYX7qb8sHcwTqQ0jmaTya3A7Qd7Dg4KUHMc0El9K80CRsOj
 Mg/N5MVVBZZoZAKrNJW4ppkPCPl2oAh5oCfA4Cu0MquFpeycQ/qujyRWWY1+G32uQHWg
 wqaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDEg0y1+GjmbI+vvvBjncmcjQRdIVt7WU4otcjSg/gofWGjEzB5rYanptPtKGjrb1vqCJcksnOxK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4ciOBMHtOVHCMdhez8blu4keOJDPfXWT/ek2NimydN+noide4
 pwxwNAEO9ofjQFK+kgUtq+R6ehhowoMSYJ8jwq+3iPQtP0Tg/481a3WGX1NRJxPOyf6NxJa0UuY
 Mtf4BupbV76HnERwssEnMW0d+20h5/beECDv7OAfoJu93s+RaHBaITo3nYekdf1WxHRLNaqo=
X-Gm-Gg: ASbGncuHeJutH38VoT6zdgTwY9hX3sj6O2r3hdBvpJP9tC/25wfxxTZg9OW6WQJ4MYx
 UEL9R+NiQX12hzU44zXCaq8etpOyjTzBSAPwM+u9uk12us1brrLbMNdHl27S66u5wjkN918dg7t
 psFXmxShxVfiGMm6GbNmgoduQkm439/LS2tDE2BnKSZi4O4RcAY5B7KQ0C0fm3ovA4kM8oazJZ2
 O0A6xsH+3m1sBPy6rp65PZ6WB5dmWL0GOMC2JE2zPKVifJdGtAchja0/RX0zws6NlA/bwTVWUXi
 VNHDzMccUZFuKKf+1C7eQ2NRetsS8Chol6sB1WyVawkQS8pfSaVBUYjn7v2QDCEA8ab58N4=
X-Received: by 2002:a05:6a00:391f:b0:76b:e936:607 with SMTP id
 d2e1a72fcca58-7702f71282fmr15614249b3a.0.1756131533931; 
 Mon, 25 Aug 2025 07:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOIe57ydGXa++MErfMnONFuNJjLar/gSG8BXw2uySW/CV1EwrBjfkSzqdOpuu88d/5cAafZg==
X-Received: by 2002:a05:6a00:391f:b0:76b:e936:607 with SMTP id
 d2e1a72fcca58-7702f71282fmr15614219b3a.0.1756131533415; 
 Mon, 25 Aug 2025 07:18:53 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:11 +0800
Subject: [PATCH v3 25/38] drm/msm/dp: Mark the SST bridge disconnected when
 mst is active
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-25-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131422; l=1007;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=qVUepIjusQu0oiyKhdBBjZ9rnYnedg/dO8rrWYD3he0=;
 b=Mm7SH2QVnkdWkXUKoBGe917JO2ug8TJ3B1CNvrWGxVgZ6cUb76kGHwuP9NdkG7IbSysBIbP6M
 lj+R8gKVMGzDFE9MsunfScMTtGGQAGp/JTS7OfT9zluAnBOGNoIRbGp
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX45GiIEOaIl9e
 01KSPHLFGncABtq/qh86fNP2xJQBskVI/5QcIfyn2SV79qJ2lAKY4rAGHqAwrHDfX36Ve0cPuRG
 +t5VQp6HKOe0fqi8skKupbuUpyCychTN8Ry3OjKSv+PvYJo0tfzAPSGiILkqVd2vr20lwzkh29s
 DPi1K5KVfSRU1xI+AMgTp0SOeUrx0/ew9YsMPIaU1dvHxXZlxIOT/AzxuyNFiq3PEdNY2dODjWY
 TGLfYRpUIcF5ZXN8oVhwrZYNeMu8mewsVY3nVXuUhEPFtdYK6dk5eMJ/gFkz0ZHoK7MzjDapkhh
 LKmysQym7rglp36jWaSUyM/U2pI47a9hotuO7pUnYWQ4OuwlpjO2gkM9BSQ2uEV1xWg6JtYiflW
 hGrFH0vU
X-Proofpoint-ORIG-GUID: -WPOCJ-sMy2QeG8oKguPdC-9iuWR-Awk
X-Proofpoint-GUID: -WPOCJ-sMy2QeG8oKguPdC-9iuWR-Awk
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac70cf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The bridge detect function is only applicable for SST. In MST mode,
connector detection is handled by MST bridges. This patch skips
detection for the SST bridge when MST is active.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e2e6b0ea2f9dbfe49a599ca19b1d205669365c4c..cb433103d439ac6b8089bdecf0ee6be35c914db1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -986,7 +986,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge, struct
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	if (!dp->link_ready)
+	if (!dp->link_ready || dp->mst_active)
 		return status;
 
 	msm_dp_aux_enable_xfers(priv->aux, true);

-- 
2.34.1

