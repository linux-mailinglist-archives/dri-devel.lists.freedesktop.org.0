Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2CCAE8D50
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1F410E7D6;
	Wed, 25 Jun 2025 18:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxcAs3V3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB2F10E7CD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PC1f5D011897
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=vb+Q3ccg7Qa
 sQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=; b=YxcAs3V37MUahOJdP9dLUX55cMg
 cqYGsTQjIXFnqtQlXpSrZ6ie0xBmdMx775N8mW4MSO/1RYljObLQ7j4eZ5S3tthJ
 AXfbezOb3OhLaPNzAFbWXlsnL1EV7l96LmfxJnSGyeRHmr3W2Vyuo3OTFPGfC3A3
 KDpMfS9zJhlAxVg5lPvJfLRua0GxYpoeoeZa2dkI+nF6pYs5N7Q2+Oha3qJ3gSDO
 LGVA5u4VfvWxwCpmJwiCcYRDFasUxbRc/p7bv08Sv73+PTHT0N+dynyhLVbgCV7w
 ofNYL1Pf5Ezxc/b+oZWgbdVV4tNi8fn0+4CxsQ7mIqYiGdBnKn+G/7GuyEQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq159d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-747dd44048cso212329b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877917; x=1751482717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vb+Q3ccg7QasQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=;
 b=gUu0UDaLqJqxoACQIMt0kjtxF9ysgDYdO9y40nYkqIlA0m1hTllirHh4focb92EUux
 IQQQtSKEZu4zeQjvtxsNEmmLo4fXgQFbdij/Fx6pG4OG2lenC2vsGAuR5OItSj6GHu0B
 Gz+Oe0vjFW5zxxj45qtqS26zIzcAqMaBHkqD5EpZ/7C27i9Gl+55kBRzHzliFB4HV10I
 7a8YtR7wp0Mmi9xXszQaAi2DZ6phkTOI+J3teAZaVjldHxUFsECckCVmcZ9Ijwqym3I/
 /hfErIi6lvrsAyIL/9gLjxAAWu++LqC9bjErN5mSC0P+3OEHzVJCpklGOj3WohnRdocN
 5EMA==
X-Gm-Message-State: AOJu0YyB0xrdT3M3U/M7hJPr5jgGHWqd5vytnTlSotGg3FjopKr8My6O
 cr6+izrkInW3R5JQAEMIW8RG5C990+npNJ2tVnE6uw1r+PBAvU8DaWVvk5dzFCu0Ig/W4MR2ZsH
 LS8d/IeCqvRge1VDT5gtoJrvpgA2vOXulQCcCcE7qR4x0jWJMT7t/d13V+LjoJ/8y4ugsqCruXS
 cSzvo=
X-Gm-Gg: ASbGncsnEHfth18hD3h60zrfXXCeNmTdLaGOwvY1uX6vjY39oSHcZb7XT4wpgg0Z2qc
 7ggpkYA1fdTrQds6nHh9ppA7iJBQACxCKj6tMB/hrgLTT/ck6/Uuuztup3ZxG5AdX/jL/bKKcxB
 v8Xko9yiGZd4ieHqrDBVR7HrBavfPplEktt0lwSu+G0idW42W+drdz8fFnt3AtwLux4ITjH78Ld
 dTdDb3R1KOlQSl/Boz6zSE4eJPfssLLJRZAuc03O6mEK8srz/r4K9omX2HKmtaty+Oxk/xu2wEm
 KKDGW4PBdKKHdWzdf3ORZvirPmo+mLEl
X-Received: by 2002:a05:6a00:2da4:b0:748:fb2c:6b95 with SMTP id
 d2e1a72fcca58-74ad4599964mr6768244b3a.18.1750877916843; 
 Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2R3fCh2w1CdRYNs6SzElJV5q80FOXlY69V8dHuPmzMI0PHAMaTPozp1q9qVR8kIBjZ/CByg==
X-Received: by 2002:a05:6a00:2da4:b0:748:fb2c:6b95 with SMTP id
 d2e1a72fcca58-74ad4599964mr6768216b3a.18.1750877916423; 
 Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f11ac8eesm13442633a12.34.2025.06.25.11.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 12/42] drm/msm: Refcount framebuffer pins
Date: Wed, 25 Jun 2025 11:47:05 -0700
Message-ID: <20250625184918.124608-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c46de cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXxKpplqpb6yki
 0bByrWKOaL1jX6Z8/tHekuWqvssrJIzm1/ZtQJHZuQ6KIvfVe24VfwESZXsYyUDNFC0m6aR9vRU
 3Tx0bp/nCfYghEv1K5RhKPjyEPvDvQjDkS4sXEb2gzplxY9i5HLdEVDOLyX2O+DFtat1zOUmKvC
 +ytYYx0gLerad97OVniL0V5QbqqO7asgCyikXXgBoe52xxwIcNcIfINzRcsg+uXAOASo95FAEZP
 JZm7zq20r7duEBCWDxZzCM8/PgNZvNXXK8cJJqS4XoGgaPUn8r7uoruuXiY06I/pRm9+Gcf5iKY
 fVziy1gCpktXljlA06jwj+MhYg4q0KG/dogAmc8SFisQQIaLvh02yixhSh25DLMfOQPM8r9vXss
 1pnoaXNX/jDGEXkzPD8XqoNaabZZUdP+QL0aq0sA0nkJrpjvKtcLyIxDeH2U8MJsuTZ4lVyV
X-Proofpoint-ORIG-GUID: hHkoGmFZ_PvUPp2RBj0fjtnLX_hrkd7t
X-Proofpoint-GUID: hHkoGmFZ_PvUPp2RBj0fjtnLX_hrkd7t
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

