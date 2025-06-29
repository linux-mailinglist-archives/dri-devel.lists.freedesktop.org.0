Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012CAED0A7
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C1910E381;
	Sun, 29 Jun 2025 20:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNA26lun";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD98F10E364
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJLu3A016772
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=k07yEnAyEzE
 a9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=; b=bNA26lunYr+ved4vKFT73ZKdg2I
 1epYMrVwBa5j/JKPC2aiwLSRVeTHlFzUqGPzH9kJRn6I6XHUb9gFL5gykmv2XTPY
 T378+Q/PSN/M5lQd2E9+cG6t3QPOCwuD/WItaZ0EoKAXcWZdm1fDswM1p1aEu5te
 Y0hZYHkh6pP7maHNBCGxtP/76DvHQTvrBoZB80TmrBQ2A4bCK6e38lzpatLP62Tw
 CJIgGvNHn3FmQ22nhz9RboXrNsMYUrA5gEhaxmiZA+ZrHhAvIy9yuvIzIGI4qsGu
 GthzmjiWBVeW2XHXyH2ODcKcHzBBybaTX6U/oQ3WyIxxjBGSvcdlskP0TpA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxanaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23692793178so30039045ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228236; x=1751833036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k07yEnAyEzEa9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=;
 b=E5aBoPOoybYOWmQCg/bBzkACSJ5tAohug2oEeVhI5tLah+optD8lgAYVzCXKDgRDcf
 F0L5QFqkId4mPivwGyyP634rMfrzmfrLEnaKUr+f+fgMUCCnDf2CXnVLXeI0u9P+a+/I
 ++jOs6CgB37DJowdwz5IQoHOemWyirjXqihOcbTqkCfZzvSk/Yar+ow1tFl90qk+/M2U
 GXnGxMblI8EgyhvUfKENRE/6ShlALXizqZRNhIsHeDuiERhKlg7DIAXjJ6FI8GDW+yxd
 rhbjXW+MD+SHYkPIcu2xBKhqAG+Pvj8eFeoEKi0faTdfiILTImY5WxdH7i6YVlDpRitS
 tIJg==
X-Gm-Message-State: AOJu0YzBF2bLRKQCBb1hude63MfYmjk0KFNmA+8GaWVxDmeM1tD8mhaU
 hwAb7DdNYBYUuZKwqjEyJz4DRUO7bxMIphAmQJP1nfuLpbGHF0EnkIb+hd8Xn2OLfZq6dIFbNvt
 DwrSWn1Vpejeui0dWwu8ZGWdhkyNkdhARNvMloDuAvkvkH9u+Zm77StHCOJDZQbtGje5CdDgTaR
 GpTPo=
X-Gm-Gg: ASbGnctVF7yQOU3d8OARb9GDOac0qshscmAyuUs/aTFVUju1VaUrlBxFnA4dXpkMtPX
 dBzcLX7XzpxQSOFg0rbSabQ8IGWKfUk6YD/zqI7Ba2d9ch4i4AxG8UAdqPseMZ1Lxgog4JrYTPl
 2ONUyXxE4w499dtpWfki8s2aILEpdzCq+cZeH/sqlKyS/x30oaeXbjComMVe62YrTviquqyvMJ0
 4RFn/GmkYzOLoiwmjmsjbYNm4D83np4xBLGFg0m2PQZVBoNxofqSE6a+VSm7oe5wLjrJVN7ihac
 EacuwgdfApI/ZD1YYWEskaR4s9jcbAXBIA==
X-Received: by 2002:a17:903:3d0d:b0:235:ea0d:ae21 with SMTP id
 d9443c01a7336-23ac487c9b4mr181492915ad.35.1751228236520; 
 Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbqKK4XP+eBPgJHXyazG13c3Qw9Vds2B4hlk1UpKPfkqCJy6P8j6VSj/+TGEYyxHjNQNNVqw==
X-Received: by 2002:a17:903:3d0d:b0:235:ea0d:ae21 with SMTP id
 d9443c01a7336-23ac487c9b4mr181492615ad.35.1751228236130; 
 Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e3013d7csm6301398a12.11.2025.06.29.13.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 40/42] drm/msm: Bump UAPI version
Date: Sun, 29 Jun 2025 13:13:23 -0700
Message-ID: <20250629201530.25775-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX4gp/vL0BIlgp
 P2C6IV6Fl9pWorWKI10XfJ4mFnVu8VH44+uREuYGvM5NW4qo13fpzcZY8a0ZXpPeVn/IIl6bdPo
 r3iN8KgOsqzahSYw1nHPYeuPs8mWIHZhzIsRijXO8Ia7V33wSilwAYRotprk1SPgv7OfjhgIrMU
 kBwOfsModSh1WWWX6WvIPJPalUjofIvkvHZfWx1S+IRiFqECRADMJMJvj3PI14u0HJDASPFLsr2
 KBAnC/1vCR/wnNc7JkngsmAspAkAjhmcGESTZ48AhJqb7OBy+OdgtW1OltqY2P7tUjrZ0DbXqaF
 b3oxHtBKv415fHGJc5zDUpIB75aLgl+AczkS/fafaeC1s3TC+73gPJ4l57ofQ/TZu1pt2Z1spio
 5ghyZ3bkMI6W9WMAS0RqjC6m22taEYGNm4QEsyINBJZsjNfoXPTc0NJvWSQ8Lne8GPht8xST
X-Proofpoint-GUID: F7uqayJvhQr00svhOpI1zpkhN42M01P-
X-Proofpoint-ORIG-GUID: F7uqayJvhQr00svhOpI1zpkhN42M01P-
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68619f4e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7881afa3a75a..9b1f1c1a41d4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.50.0

