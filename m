Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776CDAED04C
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D92A10E0FC;
	Sun, 29 Jun 2025 20:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7N3heOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4644910E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TITtB8008342
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Eq5kxLTTzjq
 j4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=; b=E7N3heOcx/wkizhHj/1SljOU1k1
 ZwEoyYKAwIV25v7ul4WeTbDK7Uz8du6VG7PEDFesXihyu5H1DFCPjpJMHW553nZf
 h5tf6u6wdMD9oIC4+P0BijzKS3o59vqc6pcZhIcdIvrpLctByQ7nhgifAX5vr/UQ
 OhNDYL02ZqJ415UASVkiEZh4ioUJl6oOTqPwFyW0G0yf7XRmTpGwuVACSkXy0Nwc
 etZoKq8Xufvh3tHS+WKLTycFtdnfXexcAwsMrJSW7+sLu72Fw95dDV988tIaftTX
 Z2irKmDx5PX3Zw0bDb6LUYfHRCNEboeOIyYTssYDc/We7NRMpbE1K8M9rbA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k2tev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2349fe994a9so9257135ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228155; x=1751832955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eq5kxLTTzjqj4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=;
 b=AWMlKkUDRFfXEH1lABAh0d94vWM/J6IiiWSPrNgtPL3Ul79ph0RgNCnETyW2bbhqfi
 u3CVvwX2R4zG683yEBXY2WEoUdpPGkecKRuzEEqV0dCriPnWNQDQSop/djRXLMouqwVh
 UYC9OUbYZrIJNvTAs7DZvsy1Rizi4q9Nm5+wk6b68Y2jhjSw3kLdfycl80gPWCPp0aMU
 h2PxuEYvHmSC6ZjcStbdoBUcigfF4ugg9ZvDNCs3tpM9pmMSseLpFKW8KYxIJY9pkebn
 Nyu6Ma2WXvLNRycmOXAGnmOmFfYiD+ch3jzNHSUhBLJLGKCkoEySwE3eudy3dSrSs8j1
 IwuQ==
X-Gm-Message-State: AOJu0YxRnzRm6TcJBN7Su6wBu/mQht9mQ5oXLKO3s6SW/2q7RR6pfVwb
 RVvM9oKEtPsnoy8gJ2CBnTtjMSGeCARaNnGqQ6zQ/Ut8q24OJ5BP76UZm4pC9Y898yA7nohQEi1
 hI6T1FTylsbaGI5/prV2W6lj7md8b9Ik5Wk4Cu841eRB3tDBxTPhgLT6PKF5rFH641jIyNiPSTc
 0y28s=
X-Gm-Gg: ASbGncs7VMJ2AzaAImFAlUTPOkC4OpdtaLYNDZ0BiHX8HwA+jgCsmvraJbWkYrIDqVL
 r92H6QBjPiNBMWlSStft2kv2NCo08iQq+XeGzC5HJuuUqwT5yz/PzBCMBusePP6u9+ojV9rUx5b
 W5aWy6EBvSkCbf7F1h/jbaIQbmUVjvFgAAN1MCK8RijBQi4Am97Uei92QaCX4IiJ3gQIoiE0rmB
 9FDS6cbQBgryFcqfAzkOXLk3dPxGsr3v3wENkQAL6Xs2rVVBW3LbPKnZ8KC5ik80HSS0iBjyOq+
 fi/3DZom4UkwGIGSGb7f2EHf3sigMJt9ZA==
X-Received: by 2002:a17:902:e881:b0:235:f143:9b07 with SMTP id
 d9443c01a7336-23ac3dec40amr193803015ad.5.1751228154659; 
 Sun, 29 Jun 2025 13:15:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7YzmMzYaVmo4a1PENReEL/5V/swGt42s5m7GGennouRebdx4cHCuSsKP1wUZ1/kFFwcF0lQ==
X-Received: by 2002:a17:902:e881:b0:235:f143:9b07 with SMTP id
 d9443c01a7336-23ac3dec40amr193802645ad.5.1751228154205; 
 Sun, 29 Jun 2025 13:15:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f2569sm66066195ad.64.2025.06.29.13.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:15:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 05/42] drm/msm: Improve msm_context comments
Date: Sun, 29 Jun 2025 13:12:48 -0700
Message-ID: <20250629201530.25775-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68619efb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WI1w4SIrP7wptn5q9fwA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfXwfq+uh9ZuwiP
 HnqggncMkht8COh/DyN9skCRKX/+hieeRpNUVi52F5mjV/C/WHTJXSOFpXUjfYM3iUZ2WwAC6TJ
 FBArrutO5hN7lzwrxrP6wi0AcJpR1B3HdQmsVGjxVJqbuVr6H00y3XguIKZ3xVFOmnsEvkr5AMa
 DwL8oNtbqvP7La0k35L0jOlmUDwUnOf0H/XaJTGgTrhNfHeSz2l2SmLTd9EkdTjrKBSlmxPrJMQ
 bOgdrgPTD4l0NtS/RF29rGrc9LmQ9f1tL11VUQRP+9LGnuq/ukV9Eg2ERybiVA7XvnUYEa4I0Dl
 TBEKip6XszFje7dYkWMyXNEmy7wuRjoavG9/h6mvcO1OTuXr9AuqE5DZucziiIX8XWtyNOP+TP7
 2vGRmRCQFqCHgYRZrVCJ/phV8DM44R6S4fVPnmSZt9qV8+G6uE8SgbL+9xIMUrIVCZ2HZu0P
X-Proofpoint-ORIG-GUID: ODFGyhrArX9YOkzPcHu7clDAsNciykOQ
X-Proofpoint-GUID: ODFGyhrArX9YOkzPcHu7clDAsNciykOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171
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
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 937b7cdddadd..d30a1eedfda6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -342,25 +342,39 @@ struct msm_gpu_perfcntr {
 
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
@@ -378,21 +392,21 @@ struct msm_context {
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
@@ -400,7 +414,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -408,7 +422,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -421,7 +435,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.50.0

