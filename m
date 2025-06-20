Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C61AE1F26
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 17:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A697D10EB83;
	Fri, 20 Jun 2025 15:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBdG1v4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B58010E23A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFcIee015336
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=C2Mw8hDedlh
 HIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=; b=fBdG1v4OHwDOATjWpu/VacCWiaE
 KMa/eig7Meb6q+zYF5fn4ALlF7D7vCgah2Pzdw9mk21oLl/RJXvd1bArRnao224E
 7QsXk62dWFUEDU0HWZb3KfVxH4UHvQIETWDnGamP5hbffECt93++APkU8/j0+nEl
 9PGhnbFs8hjfmhDbHPwuQuSYjqaDiER/VovIZKevpDIDekCOV4xKt7HJzHn7U/OE
 kmx/HT/WnOuSD30vtekl41h1edn0m9JU0JS+OwmF75FuRIFrAzuFt2FHst7SFaJZ
 tOtj+JCzNvHijNFRw97Xn2t+aItkUtuzLOLisgZvNsfjyIWo9kDSlp72S3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47daf380mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-236725af87fso24108745ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 08:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750434347; x=1751039147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2Mw8hDedlhHIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=;
 b=hIFkXaTbXANVMUUjLH4txNaW84kxtc2ulAspr2jRGjmE/7XnPnMl84qG8xUPvlYuKo
 pKIr8g8S2gwzVvF6h0HBRDXB9WGO+UQ7P68xcH0om83r+3Tfz+talAiGcqCkvJOie9Pk
 FwE+oRkIku3XZrhD5vQjHUFBf61u3DC9cAiCsT2b2VVqarabgHIOOwsWf3ZPaftRh4Sc
 nh8fp8N+Suj3fXZxVWGPUID/IGdCt2o109wN5/ZoTHZNYrs/WIPh4IfDc1ZrhbuBX0FZ
 yTJ1EkJr8ZaE+yLbZvq/HxESZ0uy7Cv+Cynrni4+8lqWhgkv9ddq2kgEl2NKHSdBR2Dn
 GZHQ==
X-Gm-Message-State: AOJu0YyRchuGOEoCQhIniAYMphxKEEQQwIAGNWGZkQbFqmJKgUNO+I7V
 Q5Td2utMuBBv1TVjJzL+QgI73U7CKETNAdJJeOyQ5ElZMY1bCUGSVNqg3eQlxYzdlDLFyhzcXO9
 65fgP9dFqCsZ65bigLF5jPmf7S9MVMFal9ctEh/cFOq/pHYbXzzuURPeOIhEEt8ltmTU/bfX1XR
 Rxp60=
X-Gm-Gg: ASbGncsQFKIvzIOWDzn1TReOZe0pwBho/bppBp/XRhug9Itupyr2MAM8Qz8ytOUfXxD
 cLP4xjYIEJiSckBuIFsPR069xb9Sj6GKIkqR0cPlDwuVlsRgIbj+chGnfIodcIgWz7bNhhhaY0f
 p9gQLKeavVOsRXBYjaZPcmyx2Z6w0WP5Pk9sJNZOtfM2bQW+qVZKJnBrdC4ZQglZ94Jdorj7kCw
 S8iXfyMGx6+xAJ441xD2IHvMGErGQkU+AmoxrXUqnUKhRbQxRrFDXEP+xNxiaLtc/5oziZI+nJQ
 yN8VAJydqzf3zCU+5RSF8RQPSQEIrXU0
X-Received: by 2002:a17:902:f70d:b0:234:e3b7:5ce0 with SMTP id
 d9443c01a7336-237d99d83f3mr42383325ad.47.1750434347247; 
 Fri, 20 Jun 2025 08:45:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDiFB/XTk6onD/OV+d4aZvXfxm168CHsEY2UxE+rWdnNuvA7GDtDI7V0CiMaCnXa9H6JV/nw==
X-Received: by 2002:a17:902:f70d:b0:234:e3b7:5ce0 with SMTP id
 d9443c01a7336-237d99d83f3mr42383045ad.47.1750434346876; 
 Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d875c1f7sm20922405ad.257.2025.06.20.08.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/2] drm/gpuvm: Fix doc comments
Date: Fri, 20 Jun 2025 08:45:35 -0700
Message-ID: <20250620154537.89514-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
References: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+XsHGRA c=1 sm=1 tr=0 ts=6855822c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMiBTYWx0ZWRfXw+Sq5DyNx0yQ
 i1R/ErLlyN7KN4JA5vQcgL7vW/7ITDfshR6LGjbcLwnLjNRkX2fGB017d1W6zEBVNWGRiLax9bk
 tU/XO4aZV+xpOCRrtRC/AWsYIy9j1iuVNaOKeigool+e6aMMvfzDbWG4ayLZq1SNbvjgJrzcMrO
 +Jxh56Ek1uaCJeeC5+6uBcg94o8z+Za2lqcgywDm3Efl7D1UHidUz2bVJnobiV7GzXAi3f5QTeX
 vBrEhe1JRhWgOAyz8FyrGKf2TZ3TThNaZomCnxQsZmEVRkfSOxay4eLiXwmSWkiRrZNHR2ZrmXj
 8dawixw0dUc6PBBBNkxrL+Xf8pI/6tNIQDXCnUZGzzQmreLw0Uw80BkIv1mwtGfq0vEhzw3y0F2
 W8YjWuKI1nKCYBi83Pj2NOZYXUxslXTVWngPNppE1mzFUg9oIkgGmpBg8mIiHP1Q4LXwHNYD
X-Proofpoint-ORIG-GUID: p0_hFWnr1w8H4kNlvrhdCSEqkeQFJhYM
X-Proofpoint-GUID: p0_hFWnr1w8H4kNlvrhdCSEqkeQFJhYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200112
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

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

v2: Don't rename the arg names in prototypes to match function
    declarations [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..0ca717130541 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2299,13 +2299,13 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 }
 
 /**
- * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
+ * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
  * @req_obj: the &drm_gem_object to map
  * @req_offset: the offset within the &drm_gem_object
- * @priv: pointer to a driver private data structure
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the split and merge
@@ -2349,7 +2349,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
 /**
- * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
+ * drm_gpuvm_sm_unmap() - calls the &drm_gpuva_ops to split on unmap
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the range to unmap
-- 
2.49.0

