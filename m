Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C05EAE8D95
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC3410E7FD;
	Wed, 25 Jun 2025 18:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXY8dKKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C1310E7F7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:24 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PHghYl021624
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=VHBzJXi95z6
 O97WECG8ege8Ip+1ENafn5APqxEppLk8=; b=aXY8dKKsLj/cT/1qK7TVhpav/7L
 UPP86Cr1vsRkmb0BWeGizTgB/q5Qx91qYGLq8/lts3a5LNr2x4p4SZJMxRi6bGKN
 PwdFBELzWvU5FTiWkhGYv1H87BJINRiiCtbtgu1VM5LAka/a98HsKnzn99H3Z/BP
 wv9VzFGfQIkEI3RH+C85UirTfCdKiWozEJjC7NbYofLAq/TjiR/ciwrYsTSGHfV+
 XMvkAZbexekRF4xD85S7FROndkdWfJQdRUw8E0XlKBV5vcCCRmVP8BJrNWSB6y72
 AK1KBhhS7aZiISGhY9EFFKEMbsLPy38kgK/uJOZIxLkkiZiNSfIo1hYUYwA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq15cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7494999de28so303398b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877962; x=1751482762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHBzJXi95z6O97WECG8ege8Ip+1ENafn5APqxEppLk8=;
 b=hhTdfmmVXD4bMqLcYfdEI9mCBBXsOnEnU9UGnI3nm6ZNSLNwwkQHpK8UzqozAQ1tmq
 XD4ARmKuA1w/g+wkFfsKRduSaz8PjNaEgqQq3apTOknCAwyOAU8j0LwD7LNNBg2QNJqT
 97He7siAML1IZd0gfyXaFIHZEP0Nme80qUwaDLYpozfCYs8kvGx7KHydiuBda/Z9lVF9
 dnFHzRLc2nWHlbBtFAC6zX5ZEeJjPnfePYIZl95G1LPyGH1BKHzhzu5Z5LC3BYEqGxpD
 2XoaEiYOYEDvqMbIEZxbPlnceWGd7MLpo64c0oDIkJLjVUQTpKjyJQ1CgxGZBqMDp8fL
 opvw==
X-Gm-Message-State: AOJu0Yyy4BeeNiPYMyNNTuT8icTS7LZsTEtmxZV10VD3Jw1H/d33fp1u
 XvPM7FZH52sbWK2n0M0ppWt4m77Y2pTPsGkY/dzCfLhE83DFC8jmPW9EIBgqmWD4KTJZgQ6UvHV
 nt3PRFmu0xFS9o6S6enSzuSQg/AL3mQn/VMi8osLy4LNyDUSAQcBIZNli2d12iNKIyE4qHaSDyV
 1dS1g=
X-Gm-Gg: ASbGncvXjHPlXydQ6pHl8t4AisrdAA6FmvUG7qgonUVzRfFuZef5F22C9ZGUUMJ8EB8
 WqmzLUM9mMjMK/SnRYFJpYjXsImauHmpOjpUCL0xBpRmq+4AwBRaQkSGgyhK9Z+jisp0Of7f2E7
 KPgop5n7+EXbMyVTvfImlXIaGBHl7By/FNn1JMoqNWcPXParO3gnqYAbhnvJ+AeQQ1v4UosTJg4
 /LUIHGdGYSl3e9xPhgpfbHaXGbc76XpEqZs6X/nKW1ksvWLexyMjRHP3J65iTpQi2GwzqyepfIv
 cUTfmkx447HIzGcYFS9Wg5BTDbiSs8Ns
X-Received: by 2002:a05:6a21:596:b0:21f:5598:4c2c with SMTP id
 adf61e73a8af0-2207f192b9fmr6464802637.13.1750877962253; 
 Wed, 25 Jun 2025 11:59:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdvmmyyyzB3Yjf1DpzF4jlr0xSFd/MY9FsPMtHRz/B0Yw+Ld6nyFDHhrmVvlIxCATF6VP5Sg==
X-Received: by 2002:a05:6a21:596:b0:21f:5598:4c2c with SMTP id
 adf61e73a8af0-2207f192b9fmr6464773637.13.1750877961841; 
 Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c889d219sm4961586b3a.180.2025.06.25.11.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 40/42] drm/msm: Bump UAPI version
Date: Wed, 25 Jun 2025 11:47:33 -0700
Message-ID: <20250625184918.124608-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c470b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXxh7tMz3qJrei
 sMwNGCG0Uj1hqpzzgaPAwmiQZ4H4qREz6UqHM89EltgvjCuAz29ZMVvKAf5ZWOi8ZXAH2aodhZr
 ylMwFTZPAsO5DzwrDagX6cnGDLml+d1ZqtQUDU/uZj54nvwsNwRV+YcLmT4Jg8BKmBhdf6ase1n
 DJ3FwKlWNFdKAbhvxhqaZh22V6RhgnUHImWpk6jvTZM34bZKtCqcqR74Ljw0sYZPgMwtByVtCrw
 DROJfmJYkS34exCOBmpotTkTs8ZepVgdPW4Q9l7Jj4bPSahBIJvAUzggg9EMjkzgbq/R4mIRv6d
 GZDtUr82Jp8SKZaBZiYylNOtxYQgHUKhFbfyyWbV/cGXocLhYINTeZw1ybybPM24/Bn1TCJPZEt
 GveePrUrhIt1ZNd6496e/x7LGCDRCsH/gsrRqJmBDwxN3qW3yY//vH0NnTsR3I1A3sbuslpC
X-Proofpoint-ORIG-GUID: jbu8fwXqIQsWPdtNK9aHfo1_DVzq7-WZ
X-Proofpoint-GUID: jbu8fwXqIQsWPdtNK9aHfo1_DVzq7-WZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bdf775897de8..710046906229 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.49.0

