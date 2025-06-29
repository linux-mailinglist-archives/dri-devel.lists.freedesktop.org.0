Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DFAAECD67
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E3C88EA1;
	Sun, 29 Jun 2025 14:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrLv/1jz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD04310E35B
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TB0JlM010328
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=k07yEnAyEzE
 a9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=; b=BrLv/1jz9HuoGFdTMkip3HYRli4
 mZUyfD8ATY8tG0dbrEqCF+eY7hbeRdvP5hBt+g0GP+PkyDeJL5+LuxFHp7KBU9kh
 xCu4c5ivPZtVQuGgC736sAROPGlmBn9/gMAqJx/5Aiqm8kgd/1v1kExS+jQh+6lc
 JRxd35QrvyQPrCj1nEeMyXIhX3zT/vUZjUaGlMOoo2YXmXSi5jGBQuEY2aIAK74J
 +yMjdY38vniDkBYiBow/vCT8ll/bSMOn7aif0pRjENgvU+ZqfsL/nuzS+MwmReXM
 Evn4MUrEY4AYWf7XaOQgS7HLaTqKXlGtQ7Ir5cBt83nUXr7R7ozV32P4F3A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a61s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2c36d3f884so1014732a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206098; x=1751810898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k07yEnAyEzEa9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=;
 b=Ps3wZ/dkJzWJh5g7iiR9wsAaQaA2QAWjIEuVFgk30ULqE/SuY28GSQRVYEiTcJMKNz
 bggvVNJTIgnQWwjlFafH9cPaFvP6eb8kg2KuBbRRTQuzWFD7Tdl2e3SzfeZotxrnysPy
 yPfkvUEzvui0H/NBTZgvVHghiAetp3HqRW6LOIifw1Oy0508jldUhpL3N7EiGY2nZvGj
 czKKyG4OkQ2qp/xwalwIRmtkJrfbI7gtYwbfoxE4DMPn+/aMBbGvKMtHIEIZ/Gwvxv5R
 4jeMqywlGnpRMWltkcXjh4QYuvtOyfkI141C8FD6L5Rl0fvoI3ButvfdXuaHR6TZUTvI
 fmMw==
X-Gm-Message-State: AOJu0Yz9TgWJv+LBRxi7cZQJhUCEnkitvoGxAdWZMBmwtEQ2zF/CIxMk
 uDofTq6lKYEd+V3U/vqrS3IJPCEDLU8bK1M+sIxu9BI6cSqZzCi9a6XJJypFL0rpuqWUxFwndhR
 +hWzYcxYgQTUB9vrQzCDFvjZ0gcooxEwZPVjoFk6vX+Bm1dOB19cCuYWDcWa6eGrAYHigFTh7yD
 vV7B8=
X-Gm-Gg: ASbGncua9sC1uqCAUYODPIMntrkjcgetxa5ORnem7JDEWNECZtd/h3gE4Nn2sRxuEAW
 hvpbfROIr0FRUuN/HmRcqcw3m9poqgKij3f3lN1NGFjwQQp7F0dJHUE4yfGTJTFIgW7+9LdjFIf
 FrkwRmzzTrt4LDdSIGC/lP99qqHg0A/r30bHpaG4LkIyoH9nNRjWDAvVaD9vanFxJVJPae7WkaM
 Rm6neHA+A8Xv86MefKOOoxGjDyWqWuoL72kzsxfMP+gz5NudrMcsvIMB2qWuN4AqtzxotnC5s97
 ktfevsTL6Y8oaVMONQyKhEvlVc1jJ+zg
X-Received: by 2002:a05:6a21:393:b0:220:33e9:15da with SMTP id
 adf61e73a8af0-220a12a6673mr15927719637.2.1751206098449; 
 Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUhzRnC2Gzmes1F+eCUOlvqyKWiSWRnUQbOPPUCyCwcoSzMtVgC+1PBHnNQkUf+FfAkfUkNw==
X-Received: by 2002:a05:6a21:393:b0:220:33e9:15da with SMTP id
 adf61e73a8af0-220a12a6673mr15927685637.2.1751206098054; 
 Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5571b7asm6905338b3a.85.2025.06.29.07.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 40/42] drm/msm: Bump UAPI version
Date: Sun, 29 Jun 2025 07:03:43 -0700
Message-ID: <20250629140537.30850-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686148d3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: dBwzQQQLsqM4zTt9fzOO1k9mEyJ4JAnx
X-Proofpoint-GUID: dBwzQQQLsqM4zTt9fzOO1k9mEyJ4JAnx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfX458GyhyDGDPq
 rHbIei2vVfEj6v5B84sNpkGBN/pkk04HkzUnY21RZAd7T699isfZ26jH/rFONbAAiCZRIb9I82c
 Ds+DCMLB9ZLe/h6AdAw+eIhB1Kz6MH5p74qxNHn0i7BhK9byF0J1hqPVU55xJpY5fK1fZP1nJKp
 C9TuNYBrqAca536N5RR02xx7U+gsTr4b7/7WJda0JPhjbgd50JZvKinF9zY31QmJyl4Qx4ke7t/
 9eMQgLKLYKdjnL+8qcFT6kA7o1hRMomlu7D8D5uxQ9vxzTLdyF+9zETaw3xKVoVmdhUgY6SCLC1
 IcJoS6ANVaRjqB88OzCUvHr88sHi3ijYuEXf9NQwV/7lKGhZDrwCwoOthAIbCO2/9wI/0V9Exq9
 L4MbKxuWIx1Adt9UfQ6kRwB+xH55HQFYIUALYOW8WDT9F3J6wobo3v4W4Vp/AZV2o0gnME++
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290118
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

