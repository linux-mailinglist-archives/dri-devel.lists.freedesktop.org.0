Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2A0AECD21
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C67310E208;
	Sun, 29 Jun 2025 14:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MH7bbc1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2486410E29D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:27 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCq5c7016505
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/ZGyoxYE2vw
 gSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=; b=MH7bbc1DFoAnrrAiKzlxAKNKmNT
 eQ+QgTpAXkqU+HtEK4xFOsAXH+cag2pGJoQ61dMBgwxSz7vnu75G2ZvFw2P1vtp3
 e0gi7JUhhRO5MnbKPl+ftIGngduKQzriFLRWkCpRNoPT+Ty5+f2R7Fnb/zNm7QtS
 uR6Uj48qzdphwtx4aowL3etKe+n9tHEjQec3EVQG7uAe+t9vxn5EhMM3MCfE9Stb
 sonNhV/HPb9f5au9y3+d+xEh6Y14iMMZllfJQxSC2hljGQ7dcrrRB1S7JBRkFU1k
 cqtbboiLHTI6HU3ugLv4i46GXH5Rg02nmIltsvZgrgFS0EkSUjEma5BwLpA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvj9qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-748b4d5c045so1105844b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206045; x=1751810845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ZGyoxYE2vwgSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=;
 b=Wl3lZwsMVhKX5xUAyiXNcfvmTyx3JXXxibHSUvD4u8HgzRjQ26AqjRtx9n2/B0gfMG
 kKbntB4CU+Zpl3xnKuq6nPokqjupuY2kovAcUvILsRE8C/ZSWTbvT5YDwV/3yTjhJMSw
 qrghQftoBeGlxS8QU+m5rWEgt/0KKESY4sA2/ZiNF15M5GaffptKCMgTphp4Z7gK3d1i
 q0HUAeqsLKE3yfen4pZkqrlCSbmIhRFwfxvg6N6fueAZN6bFzU4+xx/3rG0QL10iYYlD
 LOFnk55jfiOmsYFhzFOm3Am6dQNaJLGJXG9vryXA/D6my5BEVTe70weSXv42hB+PwvlZ
 344w==
X-Gm-Message-State: AOJu0YyN3nAnuyNX5r9pp1ktIwH4rEWnG/D6KQ6U8uOaZAKxcRJlMuhA
 RTXAq0W+Na07Eam+jkGP63QlGjjKztIIa8Tq1MiFWLz61Faft/F6cbYjQN3OBElQebzuGdv30Kb
 Isv0NPr9wot7cKjyaEUMNsonnRn5lOEwz3JV35Bk0vHnlpUMdrRUkYgrKCbwt5n+D5b7r9XTJfY
 jLeu4=
X-Gm-Gg: ASbGncsQOz1JX4jAEX36JtTUYD2cc/yObk7eT23lklfnEWkY2LJGfoho1tLnkh54hs6
 tQrXRKdkOdA41r28SA0f5x24pCnIEHblCG/4rPCzqlc30JLyJPXPlDBFIZz61hKD1jQpY+dARko
 MJXYyBsz2xqJ99tcFLg/4KKbwCbWYvSJfUSayhWLemNX9gXq6gfwnoxqfC9wcZjQYvGV5E/QijD
 LOKb6AuZfFg2LHtoMz1T8Vs7sxcAmer9laaL/h2+XjuQcuHcRunvUlrXqRISJ8XUyUwueLG+lRG
 csTz9aC6OdRHNQjBj8INdeCvQA+GRInJ
X-Received: by 2002:a05:6a00:a8c:b0:748:e1e4:71de with SMTP id
 d2e1a72fcca58-74af6f75b9dmr12651636b3a.14.1751206045586; 
 Sun, 29 Jun 2025 07:07:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENZJtEa8Zo6YKK1VC7UhfnqyS3PG4LqHA7jxkHsRhyjRhGBPSmWMeaac3G6wvZ2uQ+OkNChw==
X-Received: by 2002:a05:6a00:a8c:b0:748:e1e4:71de with SMTP id
 d2e1a72fcca58-74af6f75b9dmr12651605b3a.14.1751206045178; 
 Sun, 29 Jun 2025 07:07:25 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af57f1ef1sm6773669b3a.164.2025.06.29.07.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 10/42] drm/msm: Don't close VMAs on purge
Date: Sun, 29 Jun 2025 07:03:13 -0700
Message-ID: <20250629140537.30850-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0-QZGWEN4s3BaF7t01hBeY1VfhdVUfiu
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6861489e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=nDn0RKeFDUDCjqZoaxcA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 0-QZGWEN4s3BaF7t01hBeY1VfhdVUfiu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX+ddN1JAzAOcs
 7E8f4CD2MVoPxQ2v8yK3BaC3/88xIb/uLHFHBNA+LieIut8h1wm6Ev0i2nGrpnVgnyQ70WW8LDY
 85+YidPByZPcsd4awp+60vPeWagDt7v4t/lV85RW3Tf3JhNkThJfT2VXwYO0i5p4Oxq4YjIeIKX
 bmzAXFtpDGmyBOd2Udh7VVsgGWY7X7CHMU3ucgfxNXSmHWHNofxjfbzKNwfuQ7giS808qZXzgx2
 FcFr7aCfhvXqkdgj0cQ23NR+q0dmAHFAj1SgCqfeefyM7nEd6F8I5fsdr7Y0ugnHnFJchO477im
 7SwXvafkWVC1LEcJT4ziDoSc0Iwyu2KK6Py8S1NNvEUcH8ullV4kRdXB8O9Zrlu6lHl2hDSkCfI
 P5UDXJ3HMKzEryW087IKSCzyWnxxR+E+hod4aeiQIsgx3OBmHc0RpSpEXITXWVP6i6ZO1RfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 7b0430628834..a20ae783f244 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -755,7 +755,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.50.0

