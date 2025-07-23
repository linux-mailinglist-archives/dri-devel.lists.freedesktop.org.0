Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05168B0FC84
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 00:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D798E10E864;
	Wed, 23 Jul 2025 22:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKX9qAAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A208F10E863
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHCuT7019532
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcS
 owvwXJBw=; b=BKX9qAACOypq9Ag3a8Xu0cg0OGsi6d8peARGUYNgHeyAeVeMLC6
 /d5xKbC77jzx63L3x8nsw1HKEHHaiMNzoptPWhtADvfZ2+VS9FNxn3e969zHmbrx
 ZwwpDowpS/xwL1f+JeqfdOX3wphq+JUArvuO5wMHQGR59Wb1FTf27Y2F55dxi9PW
 E5TqDpnUrfo+rEwAVKUbMwmHFzqxOY8yDh6ZVQj6Qv9yyjPxHbZu52Jj49o3w9PE
 0OmYQxXFjwj20Gjpo5/3v/CyLdzceHWam08SQwgiv98y/jpvKh/pOmr2ssoL55ol
 n6Rd5jrXEgHQv6Mgdz9VAhQHCn7hZHYJVFg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1e06c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-31220ecc586so280323a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 15:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753308742; x=1753913542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcSowvwXJBw=;
 b=LOgzEPb7I+Lm40KRbrXGw/WeyUYMobJKNH/eqYJQLRWJztkES0MdLD0Re09Hba9Lqp
 Iqj0pk63t3rG/X6trbVwOk1CKbBPb2M4jf2jFWcs5HA2jZvx2MhOvJlX2ZSZqXUIEcMn
 3kRf22KQ51ISeVEVTTJB11czNOeyRG+duEKwkR8C/TtD3o9hRvHsYI9XxVq6pdlLRu60
 ylJ1N2vfOdHGNY3eCDtJ41RO5lj7z0sEyWqxeXgc8HjSK562jVVq8lG4B4dLTGskgxPY
 obGy7Yn6N5B1vRdoamU0J562Tpzv72pPlQHKuskx9k6PAS0zTM4yKcqOhL/qLIJNB5+J
 wkng==
X-Gm-Message-State: AOJu0YxIcvoMXkSUxUid+O1q/PtjfvqKc0G+XsbXdkJ4KEdzDcaCOatJ
 SL4okEJih76KzNcpizjmOaHsDPSM/ZpcdmB7BRJNQA4lT+6U5pPjwOwNBrQtT+6IYkJ4MNP1vum
 YO91cLuIOjdFQm+kQ8H3L77881pyIqNGJBnQ1jBdXlQVKLmkDqIan1s1G5zqqlcwYaVU5cF5V6q
 k3MHA=
X-Gm-Gg: ASbGncv/SOX9grrVE9/kTO3HXpS2d93Usg1B0nGfLvXoL2BmvjXZcWYU/QxOhRZT3ME
 W4PGrBEpAO1a+Xgs8NmXBn5QfkkK03TxjjOpv/NHvuw/WbWqU4fzO/Gtd/kT+NJNqbdVmI2tkjG
 8uRupjJhLyL+Z1d0h+O3OGGG0291VDcA8znIMHfv4z/NY8v4QkqHNmUIv7vbtARVfd01hEBvx/M
 CgqJmTkUmku0ny2w3MfcJWkgMfcLk/aes6MMXgabm7SSwC/Y7VE5mcYRzKSAWR3YRGzfRm1yVp5
 Hs2GEuVS+uVTrkK662uDg2JT4CB3tcDE3aEJvnGOgc3iOeJ9Fkw=
X-Received: by 2002:a17:90b:3d4c:b0:313:f6fa:5bca with SMTP id
 98e67ed59e1d1-31e507c451bmr5990905a91.22.1753308742097; 
 Wed, 23 Jul 2025 15:12:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzd56I31a4tiJMX9/aFKEr6IuO0MhOWD335Z5swX27LPpZumR9v/x7YlbWBlBa4lwLXzCKwQ==
X-Received: by 2002:a17:90b:3d4c:b0:313:f6fa:5bca with SMTP id
 98e67ed59e1d1-31e507c451bmr5990882a91.22.1753308741676; 
 Wed, 23 Jul 2025 15:12:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e639f6c1esm72938a91.14.2025.07.23.15.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 15:12:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list), Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>,
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/gpuvm+msm: Handle in-place remaps
Date: Wed, 23 Jul 2025 15:12:10 -0700
Message-ID: <20250723221213.36325-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NFFiczi_L5zMinOSGyd9elxF0ILJ6pOR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MCBTYWx0ZWRfX+O1Ta5NJbLFu
 NSUKQrTz1A4jhu5yXrMwUvwpFrWUKjOrkyI8MLaXXNQJ8wd6yoxYqrnlOqWoMi0A39QfL/xr0f1
 84IlMKQcmTGmwvWKHh/DgzgywsUQ4e7eVQ1j0gQXMl+3rlz1gwdMlfKPw6UV+FawjfIZDlYWFxZ
 l+3L/VdggtTBUPsg5FU4nDIj7kd6BYtyavp4Xxtmo5xD+pRHDaVxEW2UqqLFq4g1h8yBU1MD+T/
 uuV6OgT26W8+2Ig2Q5bYV3AbrIyHki8zINgo6Zdesnk8uL5F9nZ+l6HEWFIdUJ48xpYM7Ip5vW2
 wtmJOTIJOAgcL65kQc1+ifFQapnj90rJn6C5fnBiJrdsgeQbYnJBiXQDa46+q26MfaREiIUFOtb
 GIacH0paKI0a9h+wTtfIK5IOZG62+1VAX7VioEygDEMVkQctPt06S5xKlXcizzTzc5ti7aj2
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=68815e47 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=r9eiMqSCUvIwoLEqkV8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: NFFiczi_L5zMinOSGyd9elxF0ILJ6pOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=718 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230190
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

turnip+msm uses a DUMP flag on the gpuva to indicate VA ranges to dump
(ie. for devcoredump).  In most cases (internal BOs like shader
instructions) this is known at the time the BO is MAPd, and the DUMP
flag can be set at the same time as the BO is initially bound into the
VM.  But for descriptor buffers, this isn't known until VkBuffer is
bound to the already mapped VkDeviceMemory, requiring an atomic remap
to set the flag.

The problem is that drmvm turns this into discreet unmap and remap
steps.  So there is a window where the VA is not mapped, which can
race with cmdstream exec (SUBMIT).

This series attempts to avoid that by turning an exact-remap into a
remap op instead, where the driver can handle the special case since
it can see both the unmap and map steps at the same time.

Rob Clark (2):
  drm/gpuvm: Send in-place re-maps to the driver as remap
  drm/msm: Handle in-place remaps

 drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c      | 17 +++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 3 files changed, 38 insertions(+), 3 deletions(-)

-- 
2.50.1

