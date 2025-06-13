Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64084AD98D5
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 01:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A5410EA45;
	Fri, 13 Jun 2025 23:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYcXUohV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98FD10E4FA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DG7VbV006737
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=vo4XmmAgYUZTgkidya3fkre0Z5bz4I+Pzm+
 3AnuH5Yc=; b=iYcXUohVmqKL4uIdQlfsFSW8Sg28c4PoVHPpLqQ3WfbpCs4sso2
 ZVA8whL039C9NKvi0KGXrQQ3A9yCoT8n17jBTaNz93gDBOn3HZh+xp50TPdMcFmg
 Ab7mCELdJ2eeXCDeTep4TvOLi4U+OR75Vjr8f9gt/foxBvUIm31+E0/yD6LvWQa2
 +yjJVMP6z5UK/9n034UMhC40qKjj18H+St89RtznmcbtG2/nnRoOa3BHGJ3vtLK6
 HNETvXQNa3Ct50ItH1EhWQHB8P30yCZayH3S6MF9NLqcv3Orkg6tVqsk+wVUfAFl
 3lCe4LDU36K77zrihXYJoZ20rNqRU9AEDBA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2yfgvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2eea1c2e97so2006252a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 16:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749859030; x=1750463830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vo4XmmAgYUZTgkidya3fkre0Z5bz4I+Pzm+3AnuH5Yc=;
 b=cnQMhM9clKH3pZVdafviCP+rYdQjD1Qw4Vwwb0g47Pu8nFKQn7M5m0DZ3KDQryXEdy
 adlXTjhAdnya6ce2d8sWVhztlTFyEcUvwJLW2zNLIV3HJRHiP6bpiL6LQ00TiRYI6UiU
 AzzNxayo8Jlq8mxn5u/u2BHzO+XlTMdtomLjoq0wT+IVGXzej+LPcYJrl/O4/7yJsw8T
 OUM4n65A1l1Vk3dKh/bjjCpccoJgCsO2Qu3OhsSpXftyvMCZQ/oNwDS2ROcaZjsA2gpp
 xYW2h3PCNk3pqc5KX3CnqyDWGBvm5N/3PN9cYIGjecNOngqM4cxBHMz86kjh0hVCXVTC
 XbTQ==
X-Gm-Message-State: AOJu0Yz8JuZy5WSxDKbMPJo0LnfS7R/17W/8YfVXaLfy84tMYCLlCNSV
 0Fi25pMNLaVfd6k5pvBbtMnwkDi9xOyZ3pcjfA9Kz3w3bJPHfMT6HSEuVmso49VL1tN6RoxKmLd
 BEBjQ3NQktsr4G8rt1SUMZw3sUwPHXzLQzDmVsoOdhN1UQtEw2AiEpeNER9m9kt6P3VZhGgGomp
 JpF30=
X-Gm-Gg: ASbGncsgwLzGwJ2UVovmh1d7SxlofwHkGAaaLTw+gU4222iMZm4bcEMSE0wxv9G0RQr
 yeVvHOVimRUdUA49QVNQkgReVbJrV/BMLOYObl8QYwL0dUgB6jbnIexHxIrriW5BgPTHj86VFZl
 +yUoIoN7pg8p+Kc5o6wDOQ+hj/u4ZMGN7BVhCGE1ASauZXrdJ1M0SjNBj2EgtosFGoRD0GNalAF
 ZdlUS0JvSZbLm2QvkFOBsB+f219HBqEw3ONvpeQ1ycNFIgFI3urHxtITQb8FAUX7tqRBV+lBLZu
 egQafbOzjC3/KSaL77rhM74TFvZO+bc2
X-Received: by 2002:a05:6a20:2589:b0:1f5:6878:1a43 with SMTP id
 adf61e73a8af0-21fbd4ca4c9mr1765501637.14.1749859030151; 
 Fri, 13 Jun 2025 16:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnJbt5NIgLECytUdxWBytGTQ51ZldvE8PCrvMN8X7vGLEoCu4MjtZ4dgCdy6WCUnaT8c/EOw==
X-Received: by 2002:a05:6a20:2589:b0:1f5:6878:1a43 with SMTP id
 adf61e73a8af0-21fbd4ca4c9mr1765474637.14.1749859029726; 
 Fri, 13 Jun 2025 16:57:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe16432b0sm2384679a12.24.2025.06.13.16.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 16:57:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list),
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/gpuvm: Locking helpers
Date: Fri, 13 Jun 2025 16:57:01 -0700
Message-ID: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDE3NyBTYWx0ZWRfXy4jWWa4l07TN
 jr6MZoESKYI82lmqFn/ksIOYE+83/4z3/pZCpQ/SXj80+DSJ9cyzHRp30Vv0gXTqdzsYB6Sry0W
 LhOuUpsVpIDcMePT9XkCVDG88tlb9uvcl05vwok2coS1jNADjD9eMnS1l0A4whz9uPgwYbS3Eto
 KOiOnI6IxcEYPY58DMunAUYyUi+Lg4RdZ+lyl+mWtLoVxYMvdZyklfsJEKTrKghCvB6ulZp5bJy
 VaoI9e014fTdIjTr+5IlVgPHk+ZQ8tJrhBwd2Wrqlz2V+hhP29yd3NuK2RDZxydnBIgLtaG+4q/
 bT8FPubT1O5IG50hPgW6cZKQZSmOwfylROOOfclbRmUC8XejfhkUz+f12H/1sK0eV6bLhpbZDzw
 ftAEjoTy9qDOCuDzdSydOvw/rrdtCXot709/d3lVzyLgcbh6JanMb/87AxvVmrYwzqhEUzxD
X-Proofpoint-GUID: iTZSn5T8lWuB8eXwYsyd8bQ6Ww1w5-Sp
X-Proofpoint-ORIG-GUID: iTZSn5T8lWuB8eXwYsyd8bQ6Ww1w5-Sp
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684cbad7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=aKBb6tC2I0So4jIVd84A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=855 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130177
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

 drivers/gpu/drm/drm_gpuvm.c | 87 +++++++++++++++++++++++++++++++++++--
 include/drm/drm_gpuvm.h     | 14 ++++--
 2 files changed, 95 insertions(+), 6 deletions(-)

-- 
2.49.0

