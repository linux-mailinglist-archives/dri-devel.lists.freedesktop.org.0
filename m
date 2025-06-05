Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55FACF6DF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C373710EA10;
	Thu,  5 Jun 2025 18:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDgP4tdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432B510E9F1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:09 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HR9Gk029509
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=YGw3pq0xuYX
 eB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=; b=nDgP4tdd+Ws7bev+GhOhAZpuA2f
 M/5EBWVxMI9QxUQaxxy1c7EQj+40WKPc35VOwdybVzQVPvSLi/uNj5CVH7u0jtzH
 g34lyK9urU3eUUuTdkyfQwdmfZJwhkmTpsvodQBhbXN4pgDi6EcYO2ogcrXEzRvQ
 pt3uVuNQShO5jBWVOW8DYplSU8gcl/t6+18vrDdHeXgHEZeIpHYpFUuway26NujA
 9MbRlhmnyMWkka6pk/wuCxmJFr2MZrFGUPiXe/p90wq3HSuilqJKIDaFrive0Wb9
 OWcw7fHa6h0llk8l5P5ChrLd+NPdTD0hMz9NVSWqClEnrl6LQ3V9RWvnJHA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nt9vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-745e89b0c32so1725496b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148388; x=1749753188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGw3pq0xuYXeB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=;
 b=amGu9uIkBSLfzajOHbl2wNwPX8yVRLcA0k6qmoi4b2steX5XmsHFe6n6ypOkx3W0MX
 eFALL/tlK7b3mmjiLEVJeiwcwClWkYGfw9xKHw0oA2EFPfI+nfbudBpMmQylZfUSWthj
 5RlyD48+issSyGGyqxa1TI4R3Ba6HAgPIQEQdSiks7aqJ7A5R11ydUqhaReqKKCCzJ4X
 BLcBZBpnXfBCnP1W7oCxH5n4I4SbyMLr1TPnBvWL0pjvEBPxzqwIbWmNPjbyDoHlsJTr
 5gZuIOnOHgvKLhYyfBgUwNJfRf0/TCw9Clrm0GALCyWwg/MlAlpmcDZF3A8vZptztvPu
 WWOQ==
X-Gm-Message-State: AOJu0Yx5p2huUpSI+QYYcY9bIjNJpr3gJ227Ve7iLlmL/ro4Rn4RBZMq
 /GBsb/WJYzylAfHpvulp+AcMbjV7khHahqefZQ5Gujg09jiUZaZbHaVfbemzEXLak8CANNByPLw
 BnZ+E6cS7EQ5B+cNoR4i2+fWAqYmIlY77HqlnCWmoQsN/Mgcu042L+EZuUUN6GXeclcgt+D+pUy
 CvdxE=
X-Gm-Gg: ASbGnctoPOfNJlc557Ul/9aEEWsNqb2ubH0XTAcnxeF2zhO3Mh5FsULKQsUv/HmJy/b
 GhZdyRgyYhOY54D0tfdlG5DdvNwbRXzVVAaqWf+4pUjontTX/6E1vfS99ah6MQf+JOoDB5fZ6cV
 tp7zimNTUMCb4CEOnIhTBNxTZmJbt7ig3nc8a3hrowTI6hOhR1g83nUomdJY8wmPgfMbnB3usg6
 s8KJnrkK7abcE9L1FwAtmseeppxiWFowAZ51gga1z5y0oUbfFrMvqCu/K7phoG9wO6jL2ZMUEdc
 +E+KJ3fnEWy9BEzXbcf8fw==
X-Received: by 2002:a05:6a21:4cc5:b0:1f5:8fe3:4e29 with SMTP id
 adf61e73a8af0-21ee685066bmr387127637.3.1749148387731; 
 Thu, 05 Jun 2025 11:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZy4+h7p31V7pW53fals1CsboObn2Z1U4IfzK+Rx2MlP/oVXrylzGSxEK+JWTBZYf23+Ce6g==
X-Received: by 2002:a05:6a21:4cc5:b0:1f5:8fe3:4e29 with SMTP id
 adf61e73a8af0-21ee685066bmr387097637.3.1749148387380; 
 Thu, 05 Jun 2025 11:33:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affadf70sm13643103b3a.91.2025.06.05.11.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 28/40] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Thu,  5 Jun 2025 11:29:13 -0700
Message-ID: <20250605183111.163594-29-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TU5lpWFqeYfK39uSQEb6IPCvuiliHlll
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX4igC6i4qrNQJ
 Bh09O8WG/Gsg5tY19uzTkTrARhfpYdLU1bUxlaqQRPYuS7gOrntbaRLc/MTitO00uYMJ4f7AoV8
 U4hu9UgPb2nQKG5ZQSZdLAtgOHDByDiBtMvGwuUpXbeUVY7vtojMOQ9KCfIiElKbYesooQ7LTDw
 3fDgTyRY7cLJSNS2wSqnhfQPUSx7tpqwRBfHVgBB/2eNAQ6Mm2wY6UZWBl7tMTz8px6fGAfwyQe
 Ao3TJ2MLWNvoQiKdf5Hd7LvmD8kIV86gS1fqu+vf1ug/KrN8oypcP/s5siCRrq0kEUGPfrB+j/R
 bKI/XIsZB+2jxwl3GcNePi5mcqzsTqSEos6HnMhhBaiqvGAyWLApuMBAkAXMaK94xYfm57MwByk
 3neRB3xnfmvCKG+WL/IWTP/JjQ4hkN0EOml6DqIn11rnl62BAKrv90As1h4gPuTT+STF80cG
X-Proofpoint-ORIG-GUID: TU5lpWFqeYfK39uSQEb6IPCvuiliHlll
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e2e4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165
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

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ec349719b49a..106fec06c18d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -97,8 +97,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -903,7 +903,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.49.0

