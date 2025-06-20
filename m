Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595AFAE1F24
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 17:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D2010E23A;
	Fri, 20 Jun 2025 15:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmfpQmFN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9E710EB7F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFciNa018307
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=bbS3jgW54Jt4lQMJG3Lpe1Nffh0n3Bcu06/
 LNWEz4XQ=; b=WmfpQmFN4q12wIJUuT6mbPBjwKMW172yqiR+uusC1TBzshUsQiP
 tOhQfyXT/o9IzYfGIsSDy9MHRllJ32bTrlmCZ6Q5CL+JXvUZA41alidmDVnUdnLN
 gEFSr+gKF96gtRc0Ji07UaQZ//B1rdyctPSrbOcoXrwDBZp/6jUc8fqOtK+ZtnCs
 pTFcQgyB/zkyfu8QeQ0zxe6JfKmM9UPwHtRzrjWj8I8kwH9wZqdei7LvtfZj0Ktp
 bQfFjVcpvKmzelfpE2yKzv9TPYD/oKgRkjWVFahX1hE3V+F64kVZbEPUBZv5AM+S
 kCxm79gpn/S/gtmurCu2wItr1j1Vzu8fAag==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47daf380mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-747cebffd4eso1631851b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 08:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750434346; x=1751039146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbS3jgW54Jt4lQMJG3Lpe1Nffh0n3Bcu06/LNWEz4XQ=;
 b=NGE8xmTt2pHT6UYVGYD/OVRjSdHnqzls8i8R12Me2BuFEd24g64Kp/dQSb9UTstK1P
 63WS6Hgd6sFiFsHad0hwgkBBkYZo4uhncpQy6aI0BC/CttIV+BEf52CYB6kaFjvwQfKH
 aXxLzDdKduQpyx8q1VKT9M/958KzIVUr4U04wesjAB1ewf+GRF7MtRCwIdD6pwPKy6Ld
 a5HqlGDWz5IRTMhPiF/v6baQ47q0lqI81SZZTAHkdnlRSC93kw9JoFcBmKl+dJNdCLxx
 lv+vGyIm62Ra1veV/WuZ9fu6yXzSwd7o3ZVgM1FnCjVnV66UwIhV79iASysfSmLugLIW
 jKfw==
X-Gm-Message-State: AOJu0YwGFnbEX/eHAGFsHRVsy/ZU9dcktMdBdOdYn1m7pFQH7oQvg/d9
 BtJUMNV7AM3aG/uSVmBMeHAPwk81EnBstZVGCwUjL+Wx0aMUxGnRy+Xbs/ju2xwRb6CFJlaScAe
 jJCjCEyyiXopMkFe4pOoQc/b2Rn1AJU4oZIP47YTyVTXlvVguVnJjJ8CO4PoNrQ4ujsN6Y9LLS+
 XQ1GY=
X-Gm-Gg: ASbGnctHNAMHN4AYvuOvxJAxxiy80iVdyqunAOrzR8IpFh/H3NYuzoyX9HvG2YTXO6C
 8ZEDACNW91d2CwewIiWLd+iTsou2uzIp9YFuSma2/SpQmhQYI10IH7tugCyMGU0WVl6lAVADUq2
 ZIBCTFfuh3mvZTD7rR3z+5gEj3jLPOqCEw3xMqK4LcN5+G4U4y4cefp7AuqKc/JKDp3R8h4mMdi
 /h7udRK63ckKVzoipWlG+OBu38W5QGks6vudjMgkKmS/oqRTQdc1UMlLEFqCIpKWzSDESiZnFov
 Dpn/Db54ZYNW0FVFDpyhsctgkhM1ugq3
X-Received: by 2002:a05:6a00:238c:b0:742:ae7e:7da8 with SMTP id
 d2e1a72fcca58-7490d64699fmr5349379b3a.8.1750434346089; 
 Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVF8N8GgFu4/lrQ5XPorlr3lnveUTsCwOD2UXh/OMW5et3HBHydbLvMS9YAB8c/mkJVUmR3g==
X-Received: by 2002:a05:6a00:238c:b0:742:ae7e:7da8 with SMTP id
 d2e1a72fcca58-7490d64699fmr5349336b3a.8.1750434345576; 
 Fri, 20 Jun 2025 08:45:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a498853sm2387442b3a.53.2025.06.20.08.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 08:45:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list),
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/2] drm/gpuvm: Locking helpers
Date: Fri, 20 Jun 2025 08:45:34 -0700
Message-ID: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+XsHGRA c=1 sm=1 tr=0 ts=6855822b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GKy6C-6KEHNy0sv7olcA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMiBTYWx0ZWRfX+gkCCMYErXf9
 aEdH5Iub89msvQ06yd3EGcH2kfB0gCC5108e6BJKbqggnQEs3LjBGolH34tWjKg4SgQt1tOYh2o
 4xDGJdr1zlNaMoi2LkuQsAbISxp2GDoTSo/fDvVvod4K4PewBT4V7nadcBUvG/CwqP8lFQHSz+9
 x/NbeBEQOOCQJMTwkLaPQXD0K38W0Mlju39YILnZkq7SEiOroJh4bu6YdZ9haf8DzkivparrLc9
 t8xjQRfAC8N9/Uq115vd5D9y4otbxoD4m2mYNIaxvnZGgeZJfYSB9uLOKjbgdUrJCIYrlUcHBDF
 VrmHv9YzhrWC6Ow2ajewfKdvYPBm3pdQlFarQwrzDuFg3fUO/PJykCItCv1ldezDhgcs0JdGyvQ
 oEOAYM5T5QUBpBdAzTyeS1aBeunvX7UBTuRIvs9hETWmiVcIdsYW00riBG3C5lHRTvXYMVo1
X-Proofpoint-ORIG-GUID: 0Z_hRnr3aSqNVSyulL2oTzEGWvwmooiP
X-Proofpoint-GUID: 0Z_hRnr3aSqNVSyulL2oTzEGWvwmooiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=855 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
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

First patch is just some cleanup.  The second patch adds helpers for
drivers to deal with "invisible" unmapped BO locking.  Ie. a VM_BIND
ioctl won't explicitly list BOs associated with unmapped/remapped VAs
making locking all the BOs involved in a VM_BIND ioclt harder than it
needs to be.  The helpers added solves that.

Rob Clark (2):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers

 drivers/gpu/drm/drm_gpuvm.c | 132 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_gpuvm.h     |   8 +++
 2 files changed, 137 insertions(+), 3 deletions(-)

-- 
2.49.0

