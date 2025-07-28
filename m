Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7213EB14349
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBA810E58E;
	Mon, 28 Jul 2025 20:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOV+dHYK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F038D10E002
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlK5X027687
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Vx9YOMF9/vaXXfGAitKrXqT/YmN37duAwQA
 vLpyxaqo=; b=SOV+dHYK+WJTfpTVBLvWtAMYbSlZzjo1WkmIzRaTjaOOviYOA0A
 JvCLdsPn/jE/Nncto1gn36Pyynu6vdxV4ForI/qlFJmJEBquwn3RKP3qSU5JwLBK
 arKBt2Hcp1qmIKlrBjlnIzYmqQEM7S71EdGONwPlvqFTy2vIHJzS2iExCf6Cwsuy
 YAuqT4JtQic/ytbL2etrz2qokMFPAhR8HBtaTg950tIshxXTwuCEF5Z1cZx+vbFM
 6RYC0rQNVKPUbOKSDw1vteVC+4IF01RcxlWMcNPyXNWiTHcDx+AmWA4AG9hvvWn+
 KGCxEfVezrIa55qdmphmQUCPa6BTNXRMDFg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860enu0gn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7492da755a1so4328257b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734858; x=1754339658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vx9YOMF9/vaXXfGAitKrXqT/YmN37duAwQAvLpyxaqo=;
 b=LDzvk2+of+wjWSL9AOURACb6FusHwBpIvqGMiV11SIs8WBdXqWrhMFcj7gOH7okHmo
 G7S2v/P/sJ9MXwko5Kyj1i42ztoaqo8tAUc/tRvbBsMyMKklSFVx283h/xjvBnrkWMdd
 QqDTtMpE0chb3Ctz+iiw0aby02G/Qz7W8jG4m5y4lWWyF5CxvSPEbhRxXLOyomEXgGfF
 bYrWIRQ7jlkmF72jhJbACCnGm+1K0p4JS1LJRzJHqjuEfBWNUN8KOOugnjVqpiM1vooV
 xooqS/gD0JOGo46qWRHjjUrT+l6DjIttE3+HO3E+55L44wz1FWZIwzRi8dEyJfCu3skN
 qvJw==
X-Gm-Message-State: AOJu0Yy1BinP0D1UGDRGZw+GcTA8MjbgKWTiYWGz7/8hUz21bd9dDeQk
 7DEfHdvPr3j/piz8yp9uVdKEzGbzqiYn1S58csvlikg00sgFZG4j8Mqh06Js64ZaHBaZMab5DAV
 2KUxqCXNndgbHqji+P0yhfrXpPGwTQyS2zOO043c5DpGJTfb5m3s1OluD8zsb8XfIcKBQFcPvu2
 oAI9E=
X-Gm-Gg: ASbGncvV9ha0SzVBlF8zrHfMoxuyqP02K72T9pg/B1ycq+8YB/qLbD1caOQ9BKmYiha
 t565oFQU6QRv0bb5NyH5M5epySMBup8OrMdv/Ezrd3Qu/2XDYjXyDzxbVcsZa9nK2AEX8ZDvzOF
 IilOykQpwgogHl/JqJedg6RkvZBGxej9YgfcZvzaMQ49jtpOU+8m84tbHtEB1vHX0fc/XXdeQp0
 oOqlkc7apPbqpALynVC9mXCDZi9cMGrPKsXAPI3IEAUV4rmpF6SpdHIIxiA/Tt3m2Il1lGTjOUM
 tFG4lsnZY1J9EjR8BVDKz+T66uLODDaa3wuEbgSgFQvcjY4XUVU=
X-Received: by 2002:a05:6a20:3d82:b0:238:3f54:78ef with SMTP id
 adf61e73a8af0-23d7020a87cmr21229907637.45.1753734858339; 
 Mon, 28 Jul 2025 13:34:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2NfubVkX7OmnivNJmSnmau6UKEHaNttBxrPWDyk7ZRlG/54KN/lEb53AfFRyD8rGryWhf+Q==
X-Received: by 2002:a05:6a20:3d82:b0:238:3f54:78ef with SMTP id
 adf61e73a8af0-23d7020a87cmr21229878637.45.1753734857904; 
 Mon, 28 Jul 2025 13:34:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f6ae43bsm5545654a12.49.2025.07.28.13.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:34:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/7] drm/msm: Various snapshot fixes
Date: Mon, 28 Jul 2025 13:34:00 -0700
Message-ID: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Bv2Ao2Js6oG9V3JOKYYC1cJadSDm6L2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE0OSBTYWx0ZWRfX07GS1ZSLeWbA
 G1tE2OcZelfYgx8UiIJKVIPDMC/R9F5iqDAKBehVpFjSHghOx7LiHeg/5ipqv7pwP8bWwjdUp/r
 pNZgm8Cdy7DOTkPNlqELvVFal6lEF2Nf8tRHvOj6AENvm/P7ZRnZ/vY4s5tq6QthDOLve0lvAh/
 EaUbHi4KHQjAjTT/zzOwhxlad1ywRgLoSa3o4qPFrEHeJ4d0LLev5qEWxNqHbzy5Qh6Kx/m6tGM
 8JTVM2lscJAkcl5e2zbNoFETKz4CZ+j5K7HArJSPbBqOSrElEnzzxh0uu3DVS7nbUAsb8mO9ElU
 SBb6Awbnbl3GzCFt/RIoCK5FK0i5Wyg/V0XRuSxJ7N4MEMctWbCqzmQoFJ0KVGtcnZBFY6adYqc
 /jtG0FBvGIO6WChjLaNEoMgfKXvndjIsJevqcwRmQx7oHHsUurV5kD03UC2Bq3i9wu/y7jLd
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=6887decb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=w1cFhwVCMIBtwBHhTYMA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Bv2Ao2Js6oG9V3JOKYYC1cJadSDm6L2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280149
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

Various fixes I've found so far while ingesting upstream devcore dumps
into internal tools.

Rob Clark (7):
  drm/msm: Add missing "location"s to devcoredump
  drm/msm: Fix section names and sizes
  drm/msm: Fix order of selector programming in cluster snapshot
  drm/msm: Constify snapshot tables
  drm/msm: Fix a7xx debugbus read
  drm/msm: Fix debugbus snapshot
  drm/msm: Fix a7xx TPL1 cluster snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 26 +++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 38 +++++++++----------
 .../drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 19 +++++++---
 .../drm/msm/adreno/adreno_gen7_2_0_snapshot.h | 10 +++--
 .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 34 ++++++++---------
 5 files changed, 73 insertions(+), 54 deletions(-)

-- 
2.50.1

