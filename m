Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFBAE8D32
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0970010E7C6;
	Wed, 25 Jun 2025 18:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtyuO8Jk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174A510E7C8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:06 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAEJjo001282
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=C2Mw8hDedlh
 HIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=; b=YtyuO8Jk4sMJ2Ri/m2vw7QCCLe9
 tjKv2USWutaNQOLTXGaUx7HlhjrG9Q/96VntWuE7KCpdTkwXXe8t5N0cS75LuGYk
 s2JHO7AdW95w8iZgqvqjDnZNeRpWTloocpqwz//+wg2OZcct06JAJvdH8Kdscom5
 DrmM7SKvuYYwlZBPDdZlZlvFlfs3SOq25OId9IxsXTDcOdiDVpSKeoiFAB098n7p
 QTizKccSaKoGJekxblARNCidNcQ4Fg9VVBmVm4xhyg4ZNjPgyFhumRy3hBFUh91f
 GlXi4nMszFZxI61Mojkb3hAJGTgySUw2Itl0rebGrQlg/cwvU6K/XklOyCg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdasn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-234b133b428so1193615ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877884; x=1751482684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2Mw8hDedlhHIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=;
 b=HIHZ/dlKCZz/2fYYqrV5ZwH6UElEA5dVBTX90ZMWTMUruPqqxGBrlst33CDOaI2hlt
 M8yTX8dtcTYF2FsudoE7jZ44jGNrGTTzv/G0xGVApRdbu817PH7elntBO06Us6K1FJXh
 HoTF39qBPm6/E+mrEnQ+fYK6v01FmbcUAIqmyjm7UGNblFfA3EXZF7e9DWEj0dbUUHjR
 KrSy5MYNqx6wM7xSJia6ucGXnXtt4yxd1j/2Xd2JXPTsotm9hLN3zmOX96oP732MKCQg
 gLK4xLWZVbWI1Dxaos1fbwxwvqxAnmdoQ20hIcAvDKcLtw6i51LFFbS2WI5jRhct/uLY
 h0Gg==
X-Gm-Message-State: AOJu0YyVytguuIqMrzAnzRjwkTB6NzIRwbzitOJwiOamUdFuU+/PuJsn
 VG0N83894qJpQxruFD+Ccb4qiDBhoreBSRZMGA5TTWXh8AFLtGVFrlhE0xdPimtf5oLLEvCvADV
 xyH0Ulp9J+0oXG1WY9giowBGOnT7s2LabPOgysuvr4lBh4q/vLpaQ6xsKsx/PyeHPFauQfaa2/x
 8kmMs=
X-Gm-Gg: ASbGncstf34xzfNHjj9H4veopdgvDTaVCrNhUaUvNhUG1lfiixUrDfM6CnB9k/Qgz+A
 WFBoHgDA2RDCw2wI/QLnLEIR5HFmmu7eCSwzIK08B3ezba1Ncjpk5PtIACbWZKzKDHb2vWn5sYK
 MPEM5dGGNtid3X3X1jUTDUi+AglX1fpSdxl44O3fXqsEv8UJGDc/KKhJbiDq/QentRFkgnBHV+D
 hBuiULsGyBuHHJ1SZmxkTqMRqHXU/eUqwIrh6Sv5ZdaDB4/ZzwBKRQocICHAaxpuKeUNVbSgjX5
 Jp+7e7UxrkqFJtFtV5FRJFq39q5Qi5gu
X-Received: by 2002:a17:902:ef4e:b0:223:65dc:4580 with SMTP id
 d9443c01a7336-238e9df10bfmr9537255ad.52.1750877884572; 
 Wed, 25 Jun 2025 11:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPxt9zGsBsFtjOcbawB8rK4sT+s71VW3b7IpqZzz7IC1qwcaoAPSwP8cubRNnwku3ut/tWrw==
X-Received: by 2002:a17:902:ef4e:b0:223:65dc:4580 with SMTP id
 d9443c01a7336-238e9df10bfmr9536845ad.52.1750877884158; 
 Wed, 25 Jun 2025 11:58:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d86d5ea7sm137335695ad.206.2025.06.25.11.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 01/42] drm/gpuvm: Fix doc comments
Date: Wed, 25 Jun 2025 11:46:54 -0700
Message-ID: <20250625184918.124608-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685c46bd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX/EwXpwOsWduy
 MDTC3jQzrWB+ujPiqqkXHlh7a6sglwP4CtAaqfPD71NnFAB4/3NgDkuRNI2zTMX64oER+e9jgQu
 VoymPkCQt98298B46acJ3xzWPV8SfJPpwEEDN1wnobwSVwh0Hovk0Uu9hRVIz9sGgGJ/G2zwdsL
 +rdt4a/nWUpSCYyRsq6w0ESZPtxpba3KyiwGluDLMvQFghGFaApQzCww7hRcSliT5pkLphCan/b
 vmDDWFbISNpHhLCwYSG5PNkN0Pp9yebZ+Lb7nH9aNJjFyRlwmTuwqw9Yah5FG2EXMwxCy5Bi4Tc
 egp+LiydJ+dm/UyiXrQ33vvfRqZweEPgsjjh5sjiB4jwwFlCeQd7JzA1/zRGimEDB3OeZVlbj3m
 XKkgLoTSudzNB5ivcKc2xuUbYLqWL6fnuZv6PXReAGAAHNYjKuOj58F4gWiH3xWk+UeJgIiV
X-Proofpoint-GUID: EZxP8gIXp81rSP8urnpzRZlP3OTce3Iw
X-Proofpoint-ORIG-GUID: EZxP8gIXp81rSP8urnpzRZlP3OTce3Iw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

