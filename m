Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2233AECD06
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E560C10E21E;
	Sun, 29 Jun 2025 14:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJSAR4tE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1AE10E212
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBM446020199
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/I8w26relc0
 8VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=; b=JJSAR4tERUHwHwcadQJAfq5Q4Ua
 p0kSHSAWTYEHTVrc3octjQkZXECoUrtgSHD9JZKNY7VohX2hAvtwB16FLQ97wHl3
 EPGWRWHhGOhro8CYGSKUFIlMzPjGrhxU+iSCTfgkP51EYqkPGJMPXk718ZZdGBgk
 FNfGSQfvF8dD6KV4q4mindWrASbL/geWg+0uTpPCTTpWxUUfMnw63geI9xePVCaj
 dJjbuGaAeBneAhjFHD8MLiIIZy1iUFoKIqooIsfgoaL6JSTFNAWmF4HJG0rLuUim
 iVpyNiMq03kgEqMTjnmN2r/AfElSoZxZJgo7CFksbIID3YoUsU0DT9ZU+wg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95ht64c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-748fd21468cso3023030b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206020; x=1751810820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/I8w26relc08VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=;
 b=mUCYcQ9vE+mOG/F+4e4F2uA2bgwc/2DYeBZaXmeXP/lW5jXynJTX7yDhlzisOitq16
 06ODjd77U92VYiJ0ya/pbXlQxOxOK6bq5vFwV/4qaQQdvNXFnyEfb74Ued+Ar+jH4R0n
 clMZSalBWhghH/I9EIQxm7FO+hl+dCDIKcKMvw7IkcT+4E+HJ33frTLO7cjoRQAfKc+C
 r30c/Dd2CWkPu+UFUBQcewCliDS2JTMKFNpD0R4uw0SMGcliu7Bx5MJHtz7mXx26nQw0
 oG7ru5qx05Ay250Aub7UkVp0baxp96RKF2arx89eb7JV26Ain+yzcQRGCzphFJ5cOTGL
 RqqQ==
X-Gm-Message-State: AOJu0YwXCazLdmqJ8P9SnJS8jyDVoJDKTtOIAkOdyMk1wPO7N27F1uin
 30tiwKhUS+LZLsMsW8yugD7lRrRhD6Zyib7iJaqFi9krjQvy7CRK16ZyGQFqA3UcsaFGN3CB6Pt
 7dqVO8f8nM/1EBWOSKrz6gKxm/x7UtFUTznXwB8uZDpaA9y3hK6ozyk1o/ZuBCoxhZ4EfNdZEhk
 Vl1ng=
X-Gm-Gg: ASbGncuvyO20l87XovvnI8IxqFvqz9sfcLia+Cz1cC0zmfE035tZW+la1F0B6sPSYC5
 fnwyVSKACGi8WIOtBA2neoTSAGtI2ajaglQRxhZ/+s7Gm8UYibOWzHUEEbUmUanvcFMdZ9bYPXA
 jgHinmBCG+uOS9rqsRa0cIfEgwVGG9zSuA3MZFuo5CI9PaOOks6Tg79n/RIYqDQ8ozzop7eoWm6
 gyu74W4BBlRa99tNhUEL0VX7eCCpxavih7bCYxhUspjF+/wNzywsJ2o+yBMQlCgowk+FKyoislM
 aI1egHUI8LUp9ETA+yv7fFEEyLzwbc9s
X-Received: by 2002:a05:6a00:2ea7:b0:748:2b23:308c with SMTP id
 d2e1a72fcca58-74af6f445e8mr12526314b3a.14.1751206020538; 
 Sun, 29 Jun 2025 07:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWD00aCTKp3rmy1fVmYh7PmkKjE2n/hAouI0pUy6N9MI8tjXuNWwJzmYWFZ+STLslS/wIm7A==
X-Received: by 2002:a05:6a00:2ea7:b0:748:2b23:308c with SMTP id
 d2e1a72fcca58-74af6f445e8mr12526273b3a.14.1751206020100; 
 Sun, 29 Jun 2025 07:07:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5574604sm6982706b3a.86.2025.06.29.07.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:06:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 01/42] drm/gpuvm: Fix doc comments
Date: Sun, 29 Jun 2025 07:03:04 -0700
Message-ID: <20250629140537.30850-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXzdsSJN8z8sSx
 XlIYz6whqWJELjtl+aZVILQJEfQca25QjH0BoJwcBRZ30eEXIZ/tH0c1tTKksn3OMjXpNhnRXZG
 1+UVG4nGXYXirhbQJVbS9d0rTX3tnQCa83yWoCAR4u3Bzo2UuO9aVFiYnmxsvbfxzFQd4IMYtWJ
 YSCQFPToiq1z6VJPlGt77/voDdp+ZZosTPjUU+ihTuYDbCjZSyx6V/7Yl8wOmdetYZWKfY25ICJ
 0nlxKPcC+rKvFmisHJD6RY7QhCESZLYw10fVWF+k1GzTY2n5N1FtJod0F85q1gpmLAn7nyAgbj8
 MTNxvc0A4BcNypalOXtJS1eZ1gsyYtB9IawU60ijU9Z1V636tML70I7jIOiP304dyr1WDR/AufC
 nbJs2UDaj0TVv/9/JSmpescjNAocHW0AXCwvLVBwKc5iRwc7IrNmbbWCs1gdlWE8P0mNeDl0
X-Proofpoint-ORIG-GUID: _SexoR390SrN4N5KzIw8jrAPfkHrJvkd
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68614885 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: _SexoR390SrN4N5KzIw8jrAPfkHrJvkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

