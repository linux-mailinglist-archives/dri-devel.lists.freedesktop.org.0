Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBAFACF6B0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F28F10E8B9;
	Thu,  5 Jun 2025 18:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUa4wx1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430AD10E8E3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:32 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HV3rP006413
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=aJRux9Mmt7D
 uLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=; b=JUa4wx1MONrVIMYhDve2lIQwsws
 4cOE0chvJ8aod9TXux8ng4rmXFhO/oFJadVBjgwuOWPdDkMpZ2oZw5z3Zmf3o3sK
 O9DsVa4mmS3kJ8cuWa8slPvUJePRZcNLoF9wpZ+6xyBa4X6lJd6Vdkxl7HDUr1dM
 gAwmBcbnAPq4devLEuvIT8/P04suQDLeDHJiHQLu5h3d1omNjsBEM0DJEUPHT8jo
 F+a1sux+uZ+2gcSTJrLy6WroRqAadVpiVVBnPlHHBYANN9CG8QraClFeg8EJRnIN
 i/jbXtrvVVEuDE+spHob9fewbWibvEbVG7FMhlZtaes71nIf4M5wF8aH8FA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2a9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-312df02acf5so1918408a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148351; x=1749753151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aJRux9Mmt7DuLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=;
 b=ULfZ/t6tc7cvsrGtaOcy6nWyDShyvuS7Ak0zRvmsrKKzAA2CeVOBI1u9ktEcQPkzof
 bSUJV/KX/OjvCl5ws45v/Wm9JsNJB2AAjHh41rQ8qhm4JMO8l6FeZUsThsYFPHZqlvp2
 llnYNYRppQxKeWJgWbkMy1/nX9JV57OB8hloArJYNE1K1HbstxRItk6SUTqtP00IgqBU
 w7MIkLa9JDiWBLN52fESdAb/f7POCQkQbH6vbIffFE6lcL+C9qfRzFU5w0YONnqB3V+I
 a7V9rUqpl3WbHObcO3Fc/w9qYpRhogXne/bSIrdW74V40su5svWmRiSMgGC3RiD0qFKF
 9hhw==
X-Gm-Message-State: AOJu0Yxk3NZaEn/+ot3eaXr9E3kh8sbRtgIoSLm6vGMVjpDMXVgrPWzr
 humvDycUMO5mZk6AwYig+F7OQNH4Hh2UMW2DrOU4x5SgP57LZJj7bRr64LRlI0WJALruhQLCqyt
 INnYBVO7sgv/lXctXaPkylPjEElacS+ASZWu1GYh3QDnYiPLNoL5s7hycvlqr5Yle66JWlGrNOc
 xad6M=
X-Gm-Gg: ASbGncsmLkiuifKMHWiFbVF43h2/bZYtGVYHXhP7IZ31rxPOdvVvhKpvngszIItMvPe
 jZdeoH1wDhlrPhmxMwFCarIXZdOwI9BN0SGIMjoo+IWiO17OT0O74HYA0CT9vNMjQ3zASDXhd/i
 KaCOjNo+2CODxbzPYCFaBONXl366qSLBupryEdBsNVN99N+ffIVWU8mV2uhya4oJumu/c/M+CjR
 EvMfi7faJnDRpc+p4vkqcYxXqq8vriBhfQfYgoeyAyL+IGQOvZ9qH1e/82GNUIruaXgNM7tD4Z0
 cWWGe8kpGGUCvyf7Dtxggw==
X-Received: by 2002:a17:90b:3d8f:b0:311:abba:53b6 with SMTP id
 98e67ed59e1d1-31349fb9e7bmr314344a91.14.1749148350503; 
 Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFf9Ed15WnJ0bK+g5LNOmp59mIQDowolw20rilCr32CVyAeCUxH7k2sAVz4uNjydss8qX1kA==
X-Received: by 2002:a17:90b:3d8f:b0:311:abba:53b6 with SMTP id
 98e67ed59e1d1-31349fb9e7bmr314299a91.14.1749148350077; 
 Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349f6d8f3sm61281a91.46.2025.06.05.11.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:29 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 08/40] drm/msm: Don't close VMAs on purge
Date: Thu,  5 Jun 2025 11:28:53 -0700
Message-ID: <20250605183111.163594-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: o8yDIceZxeYvGCBd0DqHEGEih8LlZ4p1
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2bf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pCKbN_IlIROpsMws84IA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: o8yDIceZxeYvGCBd0DqHEGEih8LlZ4p1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX/rCwBkQjn6IJ
 1wYutkXhiofMM+Zxxk4uESl+xhiSsPlwYEszO7Vyo+WEE6cSc7wB0PnRXZa9f1oEIANwZqthln5
 lXruEPXTbg8fozmQRqWmu7hhPNmlwgE3/18ZOwP+++I1aSHbX54Fx9Ix5c8W94nhuxLVrbc1KNs
 em+b9GHT28GkLI+02TTdbC6idvJYkvFK5dMnGfZFMh94io6PqRBxMFVvbhlEFoiPzSudI8n3+iM
 tyrfBttXN5HRy1wSRwLRVrL3xkqdqwN2yuk7Qv+12fKa0vWhK3riAZ4R/FngOgBhutqUBpClk7/
 Wp0zt/nhn+GLV7IUo/ipJ6NeG4wQvGwbbtlbzqvTdoJG8emtX49wX0pNhTvvWeE0RkXS0aAAews
 zAkKzpjoI0WPUGt8xveAkgt9tf0hgDzIxVC/thJTLJYaG4rfmdItIH8tVPvOjpN3c/VHKN++
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165
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
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c10eca404e0..50b866dcf439 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -763,7 +763,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.49.0

