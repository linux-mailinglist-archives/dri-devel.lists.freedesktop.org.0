Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA9EAE8D3E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0784A10E7CA;
	Wed, 25 Jun 2025 18:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0eXiFIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B4E10E7CE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAMeUL002448
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=iz489B2Vnt2
 sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=; b=C0eXiFIoHrho4Cfeajp5hMIWveM
 i56buHxm6tliHu720mJsTe0PQhcF7wxbusDXvjaYI6DvvFDSUdvtMkpi1odH0t0P
 3ejFlwHdcPJRwtNOJoPUJHz66jwrCpM1ppSudM4uPn6gLVV3LwmCMIuewz6blYlu
 BDbR9bVm4iL+JZ1mrv4DjjmmVVJf90ntEZ4Xvq+dSsdPfvTkoUP5D7lNTsT3Wd8r
 PZE0dqrmEJWd4arNv8UAC0zCk1pqco/ySqaNjlkqIPs6KMRtqqMvZutHlXTwVt1W
 8JWcOFya2ch7nFeuv2vX/MsajM6agYOYyKCES+Xf6GuhVB+JcwiisuAfkTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdasne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23689228a7fso2463085ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877891; x=1751482691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iz489B2Vnt2sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=;
 b=CqIs4rW3I6xhy+duKPw/u8e6bSiSO5OpOAnYMbn1zcEscTH0R+xnFIvw7qU3aaNeOR
 13JfuXVQSMZFPu6Dftphg93gEe+bZG4RLW7il9c1R4YNUK0KNZCel4EnwuElkW5aOBzI
 hiHcxZY6Vg49PzoC7HhbJkBEVHzNhiXV8XOXWAW0TiS/erpLXbQvB+Yk9TyZKd9kulQL
 aNMPflCqvCVMLcdvlsU2oPhTWoYUdd98mWfIN+miu0/JHBJHWdxLOuRaQ4jW6wi8yBVT
 g6k5Em1BV1ZG/g5AcMTtknjF6BrWVFW4ILF2P4QPHj29ATtcHan1cFAa+ne0OZKOSVyc
 QxJg==
X-Gm-Message-State: AOJu0Yw7vczhk24i18CXSQtr+ImfbHIB8+GiZe98y2IwjSHAW0/sCDtC
 QB0c62fGCmtMns0W1my7dVXgytTxM5pj3l2fOYGEzGNoqHvhAIW0JWrK/ILMRSzlRCiko602eFW
 ITw+hhzT+2AkJvtiE4t3t4iCH1TAblGvhb1XsWMeUoleyNlTBCxPSZ+fx705CdxfhJ5SRBNxYjh
 /tmV4=
X-Gm-Gg: ASbGncuygjvyKLxKdBjGtSEEgO/NtTqAdfeQuHuxGlG54dJtnwK5Kv2d2yBShsIWwl8
 gYLcH5hIOZ5IpEOIN5UaSqPJIkbcBxxbCqOjwQZd0TzuxJHS73lKiX39e2Wm3T0tXnT3ArjpkHM
 g/Kq4R/JCEZ3V4bp5KJkOOndzWvDxNyVUlk3ViG+RZeW3V2VWMBMnXXAce7CatFzI3eG9AJDaV7
 9f4mER/PrYlY7jqwd9ihLMwPle4R3N1lFVneA1TBsLkjAfXQdxxuY3AxPO9OwOrTgKcMRIsNmwB
 Lww83IOQiPFPYQyLFsH1wVQxtBprg//S
X-Received: by 2002:a17:902:d501:b0:234:e3b7:5ce0 with SMTP id
 d9443c01a7336-2382407a220mr64201345ad.47.1750877890594; 
 Wed, 25 Jun 2025 11:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGELzNE88dk/4uZ9frRWF/+bGLdgcTXmuMfsYcOrT4v6Lw6umM/ReeIdKxbfbzYz91MBR74A==
X-Received: by 2002:a17:902:d501:b0:234:e3b7:5ce0 with SMTP id
 d9443c01a7336-2382407a220mr64201115ad.47.1750877890193; 
 Wed, 25 Jun 2025 11:58:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237f7579cddsm81828815ad.202.2025.06.25.11.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 05/42] drm/msm: Improve msm_context comments
Date: Wed, 25 Jun 2025 11:46:58 -0700
Message-ID: <20250625184918.124608-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685c46c3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=t0yPb2BRG13ODCZxGvcA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXzp0LKBzKmRy1
 fqduzCHploVSTo9+wuKBKPPJuHiq0/TFooam9AgX4m9mOJtrmuLGjSZKHmSbPn9InHG388uhBG4
 7Juqvmss09Rp8ApAgK0h90lM2BS2tbvWayoguigNLR+V4JxeptduCNPkxLSHl1IKaTqFRqdLgu9
 AlbzNMTWe2+AIYxeADYjSXOBaICkcK3ugsb/0LsFCM/w7DN5LD0bibrx18DEgcxUxWrdkLH4nbO
 qzrfsrRS/ZnKiyAYwbzuZg6LGTrlzHbpKkvWwNTDU0/kGh9sXEDxRW5P+uk0LHhQImg0hZbXSEC
 7Re+HG9cTxHuArmgg8G2xrF2C06gcYxfnwpbXGlXZ+DcnZj8stJ/5/NEhGpS+9toCngz8bjo3aU
 QZUEG0dzVoFealmVMpSIs99ZFnEovA4n5TlEqNqYPyJYiJHA9sfhQvhTc+G8SrAetSFrNAtF
X-Proofpoint-GUID: Sajw0iq1xl_sQbfRil4wfDVfgIp7h-r7
X-Proofpoint-ORIG-GUID: Sajw0iq1xl_sQbfRil4wfDVfgIp7h-r7
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

From: Rob Clark <robdclark@chromium.org>

Just some tidying up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 957d6fb3469d..c699ce0c557b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -348,25 +348,39 @@ struct msm_gpu_perfcntr {
 
 /**
  * struct msm_context - per-drm_file context
- *
- * @queuelock:    synchronizes access to submitqueues list
- * @submitqueues: list of &msm_gpu_submitqueue created by userspace
- * @queueid:      counter incremented each time a submitqueue is created,
- *                used to assign &msm_gpu_submitqueue.id
- * @aspace:       the per-process GPU address-space
- * @ref:          reference count
- * @seqno:        unique per process seqno
  */
 struct msm_context {
+	/** @queuelock: synchronizes access to submitqueues list */
 	rwlock_t queuelock;
+
+	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
 	struct list_head submitqueues;
+
+	/**
+	 * @queueid:
+	 *
+	 * Counter incremented each time a submitqueue is created, used to
+	 * assign &msm_gpu_submitqueue.id
+	 */
 	int queueid;
+
+	/** @aspace: the per-process GPU address-space */
 	struct msm_gem_address_space *aspace;
+
+	/** @kref: the reference count */
 	struct kref ref;
+
+	/**
+	 * @seqno:
+	 *
+	 * A unique per-process sequence number.  Used to detect context
+	 * switches, without relying on keeping a, potentially dangling,
+	 * pointer to the previous context.
+	 */
 	int seqno;
 
 	/**
-	 * sysprof:
+	 * @sysprof:
 	 *
 	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
 	 * intended to be used by system profiling tools like Mesa's
@@ -384,21 +398,21 @@ struct msm_context {
 	int sysprof;
 
 	/**
-	 * comm: Overridden task comm, see MSM_PARAM_COMM
+	 * @comm: Overridden task comm, see MSM_PARAM_COMM
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *comm;
 
 	/**
-	 * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
+	 * @cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *cmdline;
 
 	/**
-	 * elapsed:
+	 * @elapsed:
 	 *
 	 * The total (cumulative) elapsed time GPU was busy with rendering
 	 * from this context in ns.
@@ -406,7 +420,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -414,7 +428,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -427,7 +441,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.49.0

