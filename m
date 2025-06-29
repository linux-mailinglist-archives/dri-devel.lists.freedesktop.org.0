Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264D6AED04A
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AEF10E0EA;
	Sun, 29 Jun 2025 20:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBueRC+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA6810E0CA
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:50 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TEMfbt015857
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/I8w26relc0
 8VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=; b=WBueRC+DWtG4IoBeo0td/gZKv9s
 LsG7wlfllHBIx3iAzAgDrI09reJm1oAWqhAwPNvi6WUmxXEH1YD3BleCbjGmnD9b
 PVLrrn1jtayMTJv+ScgufcCsct/69OQwB+MtqvgE26MEZXOs2OB6wtq4Om7sVca6
 oFu7J5NoSh4XnvbSt5xMkrcKckX76gT6IwY7IvJOIJMDKwIZIwcI7+LvRb20QSNs
 WOHos/5y/ZcHpzE0AMZTRbJddhmUe8Xel7aiYbmj26xO5I/0Yyp3+0LwmsdxOcqo
 HrZheKGcXcX6C3yDp59TyyOiEOuAwmDxzCkCgRO2ZoZybcojbrMl9JK7KUQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjpma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23494a515e3so27564845ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228148; x=1751832948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/I8w26relc08VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=;
 b=m/PrZDmGIQT64xAs9RZkl1eVZzeXUtKrnLImCjNEe7M5qGdEN5iMryjCQvtGfX+a/j
 FyzyTWa4qBzfYBkaV6eFWWrYfpojJJB5xqWZROHAmZHBmQG5epuTFKolvIjEPIg2tTtf
 cm7XZpJvHMw13I4bLFDvDu7eam9A4q6gvOtSZIkLkqLTR0AUPCdLvWiwHhzzdbGEshnB
 3PHd6tqQcoeMWAPgdsP1gSBR81GksDdbwtXmguVDTt2+RIpA04kIOZ9qI5SkTk9EaAPi
 REoK6nhYOZQNuDk9Ev/HMeM3Poz3QnDB2rtbv39cd9NIFWH1jYmzjJsK8YsX0aCvhwqU
 SQIA==
X-Gm-Message-State: AOJu0YydJIVog+yban+VyyqhyXpcCjETdQN8o/RmsCGO80k27CgfBUoj
 GqXXu3pXixgt2rPmOwV0Sew6K828mNITKs/nBRstSynQXnF6dk5+ZnCHQt/HVMAFDE4qt9p8j/z
 Juja3mu31AiRPTjc/kxwhQ3XGSHBT1S+He42WRuu2a4HtePICTMcgr3/KO0oLpNLnQLUqdVD0ee
 wMGNU=
X-Gm-Gg: ASbGncslc5uSbdoWIVa0dxjiJTaNmpYxppBNky9y4Mu9u/Ti3CUkvf/sZ4wGjrC7nzv
 +7SFUJe7zmfoKqAlkK2sStyp7Ijr9QpZGpVgF6h9CVH8R9BxLexD7rskb+AY5GbkPVCVZwX2h1m
 kVDX7TkEzOTzj08D0XxV5Bpa3OuNtE9RGu4igrBCTZFmn5wyKjjOzglpUQTbHRoIFGMfq8iOWjt
 qR+ZcJw6F09bV+P6CbvXE64kpdjLBJL7/HXrEAfY/u8izNConfJCW4vZTuVp0XFzxk5lWrgyh7G
 I5Nm6Cf1aDspe+rESsnlfChIzEFNlMP11g==
X-Received: by 2002:a17:902:ecd1:b0:234:a139:1210 with SMTP id
 d9443c01a7336-23ac4645042mr135124465ad.53.1751228148611; 
 Sun, 29 Jun 2025 13:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeOYc4WiR21Bq+E+1OUk+x6dI7IFpiybjWV5ofoONV3kzSQEbyT8y1EfO5WQ1B1UfNOdo3Mw==
X-Received: by 2002:a17:902:ecd1:b0:234:a139:1210 with SMTP id
 d9443c01a7336-23ac4645042mr135124245ad.53.1751228148224; 
 Sun, 29 Jun 2025 13:15:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c54b8sm67165975ad.217.2025.06.29.13.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:15:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 01/42] drm/gpuvm: Fix doc comments
Date: Sun, 29 Jun 2025 13:12:44 -0700
Message-ID: <20250629201530.25775-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: b2dpvqR9F8iWppaCVB0HLDMnXFLR0Quv
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619ef5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: b2dpvqR9F8iWppaCVB0HLDMnXFLR0Quv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXw38/eIxUGgUw
 6uWWHc73G/AEFcOUc2/Q4nu7CDX67nEP22P3BPMi1McY961IRLdPpZUVnAhv2zXta68viNplUi8
 vINyXciXFjXZNK6uQIbomiFYSjI4Gum+UzpitUTXWIAp6s0IKMJhycukZQPL8IWgGsoaBm+VL17
 YKAA+ErjnsCqyrZG5+ts7sTwW3tDCbbbSxkKK4QMs4njAwI84sSr7vNiaInZ6KbJZoYkIl1VruB
 97u01aGRzmLzO4PdL0uFJLQoL0+Nz8pUJQFEClP6swrhDb1LLbre8KE3ndA003koLBNYmqvryEc
 r70qJDZ07TY4NkBiwNjAwA0+rELe4CL0sNJW6T2DaPv+mMZ7KN68Q8E9p+PoxI8HmqNzmwlQ+ea
 ReK1194myoJ55Mr0jBK3pxpQ/0Uj7u6rzW5qJ6m+JFX9JwI0Z5NGWktby9He4NHo5SUNybFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0

