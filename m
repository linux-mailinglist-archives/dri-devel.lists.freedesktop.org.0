Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CDEB2CFE9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 01:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E9810E0B5;
	Tue, 19 Aug 2025 23:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kr3KqPQ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAA010E0B5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0pvY019895
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=uXtfjUzzByf11+oWG4pmF8mNkBkkbpFfD4T
 0474ANBY=; b=kr3KqPQ2BQHM8y9CIGwXmvqiMqQObMhTD79qY4GbG9+5kLjJsmf
 xpUor5AIH/xYM78EW+1aJjagj8CJ9GvfJSKYTbVsdkZtjppE8Lz1jpRdidJ4AG0y
 NKvJj8FnI+AFb8wND1dbasNCdM5r3QyEXE6DK7qifZ9tXmOc1ndriLLHaAyzAd3L
 DEng6MW4Dg+5AHMCom5acBZFX8tDZdzSRd49gOYZlsI90ztEGjUHSrCj+TInoZgU
 LAdSdkgQZkyv2A2R8jC2jNDyDyq67HsdYVau2D3TyFMcGwI1wnKEkuM2SdilTEW1
 +nkQdaekBLqhadKUGlgi8yGQ0FVu3HZsghA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tfg8wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24457fe8844so69286855ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 16:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755646150; x=1756250950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uXtfjUzzByf11+oWG4pmF8mNkBkkbpFfD4T0474ANBY=;
 b=rd0DFudApZlKkMsP0KpeR/BsbRHm7kcych4PH7Rb9vN+bJ9OKZ6jtOvmvHzyp+sO6u
 Ef9cchMT6OPKVC0XnEJWzpvTB0QOHvj8XdnVX9DzJWlY/1ss8STnjf9knTftgM9PcTDO
 J66zZrHT5nslsg3RupvCUI9bFn9CQIb00EbSQebzyHuBLM8eJFhc3wl2oTpGEFozLZLX
 C6dNAL90oWPC0jZgLB36tqOILBlz6Fg3Cnbc5Ys/IDG3/2r+LgrsIhBCau23g+4xvsnT
 uQwzj7twg3QDmjSU53L/6cvCZGrN90PZ5iLVDDUK8+kXnK/Rr3EnQjGXSkqUl89StgTI
 0OcQ==
X-Gm-Message-State: AOJu0YzGSWjId3fQRDaCoy9TGTmP0WZr87BNf8gdfDBQywgK2u1lTPLL
 2enhadsXZiADl+moxEgBO7iU1as7pLTY7DUMqD2synyE9a/V6Rq8mXYcR0VNxj/nrfo14BaJDFn
 sadiXuT7XadgXxX/8xyVZfuoh4mVBC/5HNNWvgDricC7zkOTYeP13Drokf4uQlxi80jEPqJSkAh
 lkMfQ=
X-Gm-Gg: ASbGncsUjzGMhmqBWrun6L4u4W4Qm8Nntbos+/nkSc/UvsVjq3KyhUKprKINvfB+TBV
 uNWOp9i1Rkrc58Nwq0PnFX4g+nJqxl60ghuLareUrFzW/JB3QkyQLwjI1GEl8bwkILR5zulGrC+
 VWFUmv8wqack8NvL2Pp3ppUYw5Y09Oom1SbfA9FYOFO8uiciAA18Ftx1OdJ3il5zE5erxcgApqE
 6IJxuasDOwBOzoG3D8XLwpKV6KRKHuD6j6e9OHHROQKB6jG9agEBEG6yKJE8498L+YZSvddM4fF
 Qxrx5MjMvQuxeS0BWxvXRAk7osKFVaSkBQAfTPxogelFcx2yRKU=
X-Received: by 2002:a17:903:181:b0:242:89fd:48cc with SMTP id
 d9443c01a7336-245ef25b64fmr7800885ad.50.1755646150140; 
 Tue, 19 Aug 2025 16:29:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqUzvFcXROWico6d5Pqt2w0AvN4+pGykRNe2nE6KgbOBguGbbEYaRHz4y5taRq3of+8i1TGQ==
X-Received: by 2002:a17:903:181:b0:242:89fd:48cc with SMTP id
 d9443c01a7336-245ef25b64fmr7800625ad.50.1755646149739; 
 Tue, 19 Aug 2025 16:29:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51a97csm8052695ad.132.2025.08.19.16.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 16:29:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/3] drm/msm: A few GEM/VM_BIND fixes
Date: Tue, 19 Aug 2025 16:29:00 -0700
Message-ID: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EuuLbScA c=1 sm=1 tr=0 ts=68a508c7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=7-57VTQsmsoFMMg7Vz0A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 0OlEYsXkiv9HW1llb5IimGwYvOPvwK9t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX1tMkvz5/eIjT
 Gur9Vn/Pg15s8WdSpXbmICdTFVvg1Emlxw7gwJ8OqxXnhLNPDXeqTaldENnb7n40UAQWmtTEcpv
 ltmSrSWTtu/DDJnx59Tf23MlLjaI3N+5TuuQmlnDysb/lKtaNRPjbRzwryFVi5Mm/mcCoVGh6yo
 X0cDKf5v7k0sOc0L8xexE6VJqkLwv8ag1F1kZrtbWSbHI3jnKR4ugTLElKg7ZzONuxuJ/Q6YYoi
 0fqxWxFqk6t46/4vaj0/zugfGayUJDc1katWw31tsTRU6CYCrCHJRGiDr/3juOg+aqYxn5FN+CO
 ouMFUZfOzNp5rrwPY5u81BH5hAwSO8nuqILv5RXJAiMh4YiPd1Kw4MvmONWkKwQdYzHqq6Yv7HJ
 RcxZBEjPlYPNyt/1NAggUp1yVkVHVA==
X-Proofpoint-ORIG-GUID: 0OlEYsXkiv9HW1llb5IimGwYvOPvwK9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196
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

Fixes for a few issues found in vkd3d-proton testing.

Rob Clark (3):
  drm/msm: Fix obj leak in VM_BIND error path
  drm/msm: Fix missing VM_BIND offset/range validation
  drm/msm: Fix 32b size truncation

 drivers/gpu/drm/msm/msm_gem.c     | 17 ++++++++---------
 drivers/gpu/drm/msm/msm_gem.h     |  6 +++---
 drivers/gpu/drm/msm/msm_gem_vma.c | 31 +++++++++++++++++++++++++------
 3 files changed, 36 insertions(+), 18 deletions(-)

-- 
2.50.1

