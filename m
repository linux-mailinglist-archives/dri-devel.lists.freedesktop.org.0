Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF56FACF6B2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF1B10E2F4;
	Thu,  5 Jun 2025 18:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdAgdvEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A6110E2EC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555B0BDI014417
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=vb+Q3ccg7Qa
 sQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=; b=TdAgdvExjgLyGj34idphX4xSZZ7
 pgITHojzHMnYNLmEHWmE4ZKRINmCWwMX2v/X9Bb1lCsAC/BXVtoG7/9cXZwKhEqh
 cftJJCR1uhcgs8LQ/FvCcVbuS/AFDM6Hs599yk/7hqAieIUmy8FekRqeZIxwV2t5
 ZBDkDCf8Blm4LxPgQ7NzmScNC5n1fNjVTAkx82Le/2vMFA9CIigDoV5gZTwiMKOm
 HeyPvANF+SLmQ3aud4HAprnJH9KDH9COrJIcobX18Ckmc+TF9NNtxutC5fbhxN4t
 jPJn3m1/0pgkL62zsyVZgzVV6A+8CiS9ootUTpFz3I6AIFRsGhSqNRf6C9Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta9hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235f77f86f6so6206595ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148358; x=1749753158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vb+Q3ccg7QasQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=;
 b=Q1JGEkt7Q1w8a+NX0XiVrno9Pw+za3lwc0xuBNKE5gbYxhX5woNPECKW1j2tHXYXTD
 fVAkaouNHMcEQhKWWVbg/UBGKkS3fSYt65YK8L7CDVcbYLTLW0RiC411CLk7L50UPRos
 9x5nD/OHYjDL/7cZxuodYZWHF2Zzt+P13bNGRxnRMmNqKakzGwuN3D7ljL3yF6IxXaCg
 e8+BkQGvYhMk3Bwi+WFJsF1hVLtmHTQUvEFhbFkUU4pS0GW8dzq7eQx091wxNxuUieC8
 x3Mg/7Nn4quMg8kOpa40W446AU+YsnMr832t5eHVhEpaN4/Fl0zmktuROGOHPJVpolYz
 XQfA==
X-Gm-Message-State: AOJu0YxBLKCCHSI4C5wrgrJNwW2T2zQ0474/CLKnZyZZJnHl6aCBDAhh
 2ggKLd+s0wQttb7sVlr7dXjbWB4Vambvfr3aearzoHkeKgwtQB2Gxi6ty+N19qvwqdbfjyOhXZA
 Q80J2ZTU0U+FmmtONeQZRBAiS9/tslkin61gO+MdzVImhEjhILZMHb1KSC8t2DlrrN6RvKmYgvM
 PHjQ4=
X-Gm-Gg: ASbGncslMnbVGnMRW1YMmVgcPuCnwOPcAr7cdhx2eCZ7VGBruLaf4RUDXDA3HT3dCEi
 UOs5smwincZz9r7PVJzX2j4o+ElJfIbtaDVQU0W3du5MB2JsAXPDOqVun8OUBudFQCdcFMMbMsM
 bmQp52TgoPfCUtOuoMgpSKunHlKaCMwCko4PAfOTPDhsNZRNj6Aq5z7d2KNUeQVLOlCZ1+7J/4h
 c95QdAzmvBTnUSYPEE6QsYP4+jMWEh2aZqrny8PZO2AyNz0/pIB53J57L7I6AdMUvwojL1j2WBe
 vekOLmeYf5O9WclFod46tQ==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id
 d9443c01a7336-23601d96e8dmr6602475ad.38.1749148358335; 
 Thu, 05 Jun 2025 11:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhgBS88FiFnJWBPK5j4gpjhnAM+FBu71NhFYDWj/9txYixjz/XfgZjlMTKenwua3ROM/Jrug==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id
 d9443c01a7336-23601d96e8dmr6602035ad.38.1749148357957; 
 Thu, 05 Jun 2025 11:32:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-235e1e4ec12sm30594695ad.11.2025.06.05.11.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:37 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 10/40] drm/msm: Refcount framebuffer pins
Date: Thu,  5 Jun 2025 11:28:55 -0700
Message-ID: <20250605183111.163594-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6841e2c7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: WAUbsWpg7A-aJ0tHZ4Cz5OiW8-3TcYQR
X-Proofpoint-GUID: WAUbsWpg7A-aJ0tHZ4Cz5OiW8-3TcYQR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2MyBTYWx0ZWRfXwZPjmhWzo10P
 BKiCWrVZS76xwYximG7cPKCR2tnaoBBADyl+TNkhpBFcFwkTL4ryH+lWG9n5SRepDa2Tua72Xh0
 ebYJXBKladantvDxtiJOySquGCI95BVq6YygAYKJUouzD6edCTjpBxPfjwkPZjBHYJuANi1h28L
 4k14euoXY9PjKMv0ZYPvMYh1VaDmcvZTgP8fFybkQINZpRb4U7s2cVaGdBwFFh8GD8ntwkbeAqo
 Te/HrrojqmRe5a+dDF8JGlGg6c0uG46fAiGa1bpdVaPIXpWSwypqODnEpXwapvicKS+rx8oGaOA
 CELBVlaVBO8zYTDPSpPr8C/XinYQ8dvmAaaSk22j977R5+lJPS1CGu4OHiExtm3SMzhgdYF1VX2
 HM5m60RNfylhdgba9sqWRtQJEt4c67L/ChuXAbyYChgZFKeXrWnapVXwt5L+62Ih/DO68zIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050163
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

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.49.0

