Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF80C5B2F5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D2B89C7F;
	Fri, 14 Nov 2025 03:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwMh9cbb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZgIdb7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6037989950
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMaxXG1614442
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=mtv+8EhagHKvGGr8Q7UOic
 IGOvkdKrYSjC6CU8FsMI4=; b=IwMh9cbbtfAbVgc8f7TVeHElqknQclxr1GlFLZ
 QLRdYU1xV1HIH8HFUbK5Cd32OI8/CUiIh9NbqP9gxMnP09o7/Lwl2zeBPCWW0V6J
 BtsX4a049fLK8zeXRqcOmVH4hDPwX5jLpG43kDAo/gqOVxs1aWga6KVH1MqetkGF
 yq7fEcSINzDOkZW6bkbyJBMx/F604ScCkqkyKyT6bQHR+UaY/cyP+qieGaJUlqpQ
 54FyXILfTeqvc3McOMnMMKTXGnqq/rYjGsX5wmrf5KWQTPl0Elu4J+2qF0g8cmUP
 /xByGBYMJH5uAqxwz4PSFO9597v6Bqo7wCgE2sUisN3d11Nw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h0pf5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4edb7c81e0fso45119451cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091817; x=1763696617;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mtv+8EhagHKvGGr8Q7UOicIGOvkdKrYSjC6CU8FsMI4=;
 b=aZgIdb7CfJaYY58ussMxj4/+C5hL4HhF6xyYYIxPGPvaU43ArjoLCtfUHlK50+jZJE
 KbsunF6z54HQKZlILPVtVIaTM6OUO3iwWuYnkQmYLRaZUUb22ikyEnpBvaHsrMHvxCU4
 AR3zDPGyK44Z9fL5Up4tyoHmIu93pN1dZHtJzkm4esZghlQid0jxBHLXTTzrtS9N+sV0
 es7s0ojy42dTApGS/IyadR3zy50Ao36EAKJCI4HBQwLv/vITq/gMbcUYR1BkPboEZWTW
 ovmhDdr86KZUAs19gj94axw9xdExRYOAcovWaIm4FmJ5Pmbxx2PNMRHziLqUDX/IQw07
 L50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091817; x=1763696617;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mtv+8EhagHKvGGr8Q7UOicIGOvkdKrYSjC6CU8FsMI4=;
 b=Ua/BWO4/hBvFxvoCX++VPe+AAyYQGnp6qA9PI6l8wkCKmEhh8szbFoKgN/Plv2KR3m
 7bo9FItbdJwEaUVj3TuoMYCHcQkGnnMKFnWG5YuODE1Dw/V8SGiJ7ki0411SKVzQGHTI
 xXOAU7zQOfwyNSiPFsi8yH4oUrCce/Q4O2aSmcr0sMsJFcI/759wAWg46i1lHE+Vx7VK
 jcn5zid8uOt+TJpHsS5z98LqjFZk6d1xXqMLWPorUkffTP/bk5mXVLYXdAIzYp4Vt1E3
 iBaisJ8OJLc6U2g+sbyRZW6+p/KBvcRVOquXxnOXqAAFJZtox529xlY1RAKMa8QzDJRL
 092g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwRcEaQXvzOSc2SAg3CraJQpTWC+0Uptlta/bjdgpqnqXp/M6LhJy3h3Mbdkd+wgD1WTgwl9Qlg5U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgHUcKCMNAhm8Zj/wss1TxLSWtHjztX1eECdIfiy+G5UO4v9Ke
 Ko4aIzqif67dd4qiKzNv7JPsVkWKwNsC2q3N3H47M0lqmgpg3G8K6BAE3rZ/yB93yADL3tkR6Bq
 xNTjHZ+BsbYH7flAqjwxHCL1eXZp2Rg2dYzlf59Qn/1XMuss94DHnZdLC4iq8NOibAYQuyfU=
X-Gm-Gg: ASbGncubFxWBbQ2KxYj198UMKTyMQbb4UhNt/XCMq7PyWiZJnwMW2VM/7iTlNGoSWp0
 YL8WlLdot9fcxr5N4qXorct65Ajj8Ad6PO67QIeyHrhYXIpJyFgvkONumvttk8R3A1Smr5Ea1Xh
 PiEhEQWr+qGtkgKOrpj7gSfDg2vYEKovO31MOX466EttbpMfVTRRL4XKN2KzfcIGSxXGchOcbhn
 Gn127goxK96QBPuxUBG/BD1f9XPWWHlh/BL1hOttI/aOzKzxiTNPllWrS8x3AYcm2FXVaWr65Ty
 MtU2J7KuxPeL2WqOK8j1oIwApkdTsPF75MZMlPkGYskVm/GMW01QFHub4g9jhhF0pifUnWMv/Wk
 /G7oueBdQyl4KxMG3nN1SJHTwVLrUKic65ma10mO9j+/tDW4Bo19kLKm1bE+TLlTv080l07IecO
 6rIbYyP/S9sqBV
X-Received: by 2002:ac8:7e86:0:b0:4ed:aeaa:ec4d with SMTP id
 d75a77b69052e-4edf215e3f7mr30317921cf.77.1763091817462; 
 Thu, 13 Nov 2025 19:43:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkCf90PNJaJisIe8fXiiAkfLJ0FuBztAmHnHj5XsWFwPvVi9xjN+CMEzkU6HeCl+PoDf2CKA==
X-Received: by 2002:ac8:7e86:0:b0:4ed:aeaa:ec4d with SMTP id
 d75a77b69052e-4edf215e3f7mr30317771cf.77.1763091817016; 
 Thu, 13 Nov 2025 19:43:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/12] drm/msm/dpu: rework format handling code
Date: Fri, 14 Nov 2025 05:43:27 +0200
Message-Id: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+lFmkC/23MTQqDMBCG4avIrBuZxFi1q96jdJE/a6Aam2hoE
 e/e6KZQ3Ay8A9+zQDDemgCXbAFvog3WDSmKUwaqE8PDEKtTA0NWYoUl0eNMWud7MQWCuhSGayq
 obCAtRm9a+9612z11Z8Pk/GfHI92+x06kBAnHFqUsqKxVfXUh5K9ZPJXr+zwd2LjIfkTzT7BEV
 OJccWS1Qn5ErOv6BXm/KmPwAAAA
X-Change-ID: 20250705-dpu-formats-0d5ae4d1a1b9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2111;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FAspQ5te7jCD3MII2t3C1Xb9BvYL+gFWwTvuI21RIkQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVkJq/WsTptHImH1+zzrsWvVHNdYK/d/6Mak
 yMR/RIihOeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZAAKCRCLPIo+Aiko
 1dJ/B/9LsQjUuvstnTJ3Gu53nRpReK+fnzJdt/LeyMCZFxXwwQQNoXXc01qYAwLIY+Xoev/vROx
 A/P6NxL0Xk3LWTf8KvlATvOMMUmkfs8SHbg7AonsMvhRCeQys5f9CQoY1RZR8/m4hjjJlF/GqzE
 3r1aX9gVjvK49QkTojGaL1iPUVld2sUUovOKisCpEQTcq8BpWLZ4anX0rxCBDySUytKR/V0NPPW
 fcI/ZIJP2w0bfaA9zr0VUiOjd9zz0uQ/lGD7LnhQOCh+LDqPJsnzziWyR0pFmJo4EciIyshxXsb
 h6tb0ZIZHkRzymcmv5+cQpv/+TURyim5lRPkNynsKdLeGjrd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FoaqgriAEaW6ABp8aI8go2YKWzYHFW_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX6vkC6P0z76lZ
 t1JRcqyrkbjXvBYqFY5A9hH6dHWXmS1HtfUYRG+yJDD4DIFuW9dpgs9uBFh6TxpoGPhpOq71zTs
 SAydRSuKS53haHDgrTeI3mc7iBEkWB2PRBHBv3G6dx806b8QfzlvETPtCUvZHDu3YfVVwMK4iuY
 JMisUPQ3ylFfFJ0IcJfJjp6E/+o1KD95x6jqKg9x5rTrIKm3zCPY9DuB2iazxFAFMMCYF8qAlEn
 vnFSmSvwOihSat8cDpZwPuZmxSl36s5a1wwBIFaUBqnXvHx2uLghhR94zhTQ8tWmGz7BQWlv/1/
 5FQBiAbXQGH/iaZKdW/ZbwbQHVJ2ZBMgJPsdeGDl3YtZ/NrsLatIRpg33RoFYDA8vhtjEvNgQzm
 1uZgIb1HVXyOi7d4y6963H+fH4E0CA==
X-Proofpoint-GUID: FoaqgriAEaW6ABp8aI8go2YKWzYHFW_n
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=6916a56a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fDhhjkJkotr-cB4PFRIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027
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

- Rework mdp_format.c in order to make format table manageable
- Rework layout population for UBWC formats in DPU driver

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Readded disappeared YUV flag to PSEUDO_YUV_FMT_TILED
- Link to v2: https://lore.kernel.org/r/20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com

Changes in v2:
- Dropped DX flag from the tiled NV12 format structure (Jessica)
- Changed round_up(foo, 192) to the roundup() as the former one is
  supposed to be used with power of 2 argument (Jessica)
- Fixed undefined varuables warning in
  _dpu_format_populate_plane_sizes_ubwc() by dropping the always-true
  condition (LKP)
- Link to v1: https://lore.kernel.org/r/20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com

---
Dmitry Baryshkov (12):
      drm/msm/disp: set num_planes to 1 for interleaved YUV formats
      drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
      drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLEAVED_RGB_FMT_TILED
      drm/msm/disp: simplify RGB{,A,X} formats definitions
      drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
      drm/msm/disp: pull in common YUV format parameters
      drm/msm/disp: pull in common tiled YUV format parameters
      drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
      drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
      drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_populate_plane_sizes*()
      drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  174 ++--
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------------
 drivers/gpu/drm/msm/disp/mdp_format.c          |  614 +++++++------
 3 files changed, 391 insertions(+), 1552 deletions(-)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20250705-dpu-formats-0d5ae4d1a1b9

Best regards,
-- 
With best wishes
Dmitry

