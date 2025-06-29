Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A258AED05E
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C5710E0EE;
	Sun, 29 Jun 2025 20:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEOaRKgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C2810E363
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TKF375017045
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/ZGyoxYE2vw
 gSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=; b=TEOaRKgEKXZl8BVMyYJNO1xYFMo
 x3PKu+eoiNJTKuj0pA+s4MaHzMIk5igdemEau9XbwnkAKzRAY2xHkG40yVqWlF83
 vsrUs+g3OZA+88YnFkjTBHPRoaJDjTyPt9+iDSElpv+ILQuXUiiXkFQ8ZfSArb2X
 0G2zalrrEmr90ylqCWkJRI5jgIbX0cc1jt0QKjnm4g8YmVFKXOUjhfJxPRIQldPj
 ik65WTUeUr83UGaH9+ne8r5f67RbII0uIpmYnQeojcEY6wT76EIBXCONgdawH5tP
 yjsx/2m+JrdVRo0aSDFTReI7fI/3sCDxfrjEmmuWzUWiyL5xgR/C0OzMz8w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9ajwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-315af0857f2so1208923a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228178; x=1751832978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ZGyoxYE2vwgSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=;
 b=VVXQoxqJ5RIJ/Y0ZW/qTN1nBlKYSumGoftq+guVKzuOjxKg2VNSXRZqL0ECVAP61Yh
 KY0PLL4/yUw/7SwmCyjD+dqabadshlOlaEjA5oRMWEwaIfT1eBA5i/vXeQr/YFH/d+i7
 vK8E7MJosghpgn4wP7fjTldTo8htJ/BQF9ebrcboCXqVm3lmYBm1eBdlkBndvQkVOpog
 TAh1gR7v+wB0MoTuzWrnMpnuRp3ZJtu6DVZ0EvT1Sx0+CbiJxluygDCY4K7s+4iRloaJ
 jdXfFiv8troPq3MNbf+ZhdCbL+YLVfRd++6zz4A1M1xJvS0QzHP+dGP5cOCTmF4uV5qq
 dzpg==
X-Gm-Message-State: AOJu0Yyk6MZ+08C+iTIYN6VsbjTFSdLtXuk7uCXVNNhAGlD/8Ja0r78B
 wiFiTumouFmLq62km7td3kuXeyI3ZgXR6CQAPVnFBX0mPo6g/GA/El4CHfIvJm2umuVP73Sv7de
 ncrWr5nEVufVErA3v/b6aZQMIbiWe73Ggd9Fj/chIV29/2hq/sFXSw8FKisCSF/bVDx6e1cmm22
 0SUeI=
X-Gm-Gg: ASbGncsivztVFkLroR8TCD8OQfFOCgYyY2CV1zBubIDc7Srlk1AT+WrJKGGBfcTPwCM
 41uxoX1w4MH6lOu+jtnIXV+aIJGU7FZMSX+qiQDKLfIufmvbRqBvV6+wuwBx+lLS81oO4HuexW+
 7YY4zd0W9IQKRtKjEc3bQr+n6bEHuBU3FDlNXhWw2HAduSvB9aC0SX02KpGKlrLcXHXt3i6C0Gn
 QGrfFkbL9pZAnOewPtdAYlC3acA074Vv3bXd9TXL6dQsB5wRB4E6t0tsHkE730F+N3QI3Vi9Y7X
 4+o366LO74ythGlbAAjRPEzXJtvOJlExfA==
X-Received: by 2002:a17:90b:4c89:b0:312:29e:9ec9 with SMTP id
 98e67ed59e1d1-318c92ee68dmr17157233a91.24.1751228178455; 
 Sun, 29 Jun 2025 13:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcqaNgJEnMkUx7hpJGEVz350AjhfdZASStdapMozh2ARhQFgf1aXDQ0y4avr5wbj9GJufNNg==
X-Received: by 2002:a17:90b:4c89:b0:312:29e:9ec9 with SMTP id
 98e67ed59e1d1-318c92ee68dmr17157206a91.24.1751228178042; 
 Sun, 29 Jun 2025 13:16:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f54414acsm12293812a91.47.2025.06.29.13.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 10/42] drm/msm: Don't close VMAs on purge
Date: Sun, 29 Jun 2025 13:12:53 -0700
Message-ID: <20250629201530.25775-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68619f13 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=nDn0RKeFDUDCjqZoaxcA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: L2wATPpXJa4qvaCDJiFEyQKk7r1udGaS
X-Proofpoint-GUID: L2wATPpXJa4qvaCDJiFEyQKk7r1udGaS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX5BO8z0eMo8e8
 TEnYj1zPOmKbla1KpRf/h562/fYEMzxC4wMS5Fovin1QeIR49n4JzqSXM9EkMRwm/4rrsi1Mjyt
 8xoww/B47n+o4SUjlxjORpitig/23ShRQaRavvBakWzXDxWh/6k1mmPlIYODgVGk4wxVI91A7rr
 x1m2yEVmLACZ/EZz0+ktamGWYGE3YqTaMljIA2zpQDFkbLn4mSDNfL433BT4HPYPuZ3mEFas3o1
 ifVhrBbUmL1w1KPBZ8k8ZCmsclIY1a+cc87w44eZ6oFLTQ/9aHX+kzokEk72k9837IHOfSFFTYU
 SdWFRV5Br/qES3hfk/PMt1eEtMq08bYg3cJXRKghvEMUDTFF27D1F9t+0sgLBKViRxSiOMwU/jk
 c1qI5f/citmkgbyii5HOsuMVkrfRjZ0VBZkLzMRTzK9lXzoQ4t+U4M6yYlrpQOdfd7NPQ5Cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172
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

