Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F6AECD0F
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E775910E2A1;
	Sun, 29 Jun 2025 14:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaEk47AB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA1910E299
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T7UkMR003033
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Eq5kxLTTzjq
 j4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=; b=NaEk47ABuRzh6W5uqQPjv9TLdxf
 1PWwpI+Y+sqgKLCgOLoTOydS2tRKxmDgP804/pnd5VpgFzDKLHA3cy6BlXYPIQBv
 BsuXKWtP80gY6HkSxV+ze+Q58fD4ndag/1O4NK1894Kla8jD6GKZGUS+BGmfYBzd
 S1GCuS1Ps8LNGfHPEDWf/ysDhCcFZMK+FZebQUmlSso7DPNw7SYq3xkw7nDDrJs0
 bUyuupBqg3yC/C5OPfaahQY3YkVtb9bGQyy7+qrCiYTSJHIGONXRp/gG/gTNTzlt
 dlne/8NTDRTazDYqEnsppUpO+m9b9pcDxfTcGXeF1FKC6OCi2P77UPyZcxg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95ht64p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-740774348f6so2965787b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206026; x=1751810826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eq5kxLTTzjqj4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=;
 b=BS0GpNBLzDOqOjCttvVSrrSRPc68RosKRI+X6GUytKrACYf8oXRHbrANB8J6s49ppK
 /Ovu1QKqfrq0YqHGrcwGQQvJUlzQZnI85CDy4Ni3v/z2CTArYzqyLJ6ouQQ7bcTrmjTH
 qQ9Rbc8rNW1Y5KibK0Lk+KE2tNc2dfHgZeXNelpKnzjlxCJmyEfQign1MCP3EIAI+tQZ
 ucYmrGNs2K0OxXLkVX2lzlBMXxMSygMx53YhnAUT/JKygFIkyLiJrNgo+rNuLWyYKHRJ
 FWcicRZxSLVeDmh/w95Jj6KjFcwCTPnYaBydrkRrLLuNdu1kTunz8K4Q02JGyv69glg7
 XqTQ==
X-Gm-Message-State: AOJu0Yy8kJXnEc4c1oucztZPtsrhtmDLzlqKHMZJviNuMEsDi9dxQJ6r
 GGY75LHVDk3S4uEi5YKWRT7Ynh/lnFTOBCrSiuig55wdXXVlKXi8MdiXAkzarETbl/HLINwtRM/
 brAjVptlbVkUCc/ufg1DNzqQq1O2oGwqlWa3Dw/Xt/79qiyaDXUGsFcO9w/vSlF62N6YxC2R2kr
 IRSi4=
X-Gm-Gg: ASbGncsbrdSUb7r3EW1e/TMGVklarTnK14i2iYeeth6fbH+iLogIfWTP7LVbcYXEkPO
 PtkysFy+E4hnbQ0fGvIzNtPLAxVp1YvB2+eBE4Na/R96Gf+AUM7c0aLTOz8W0hTfv8m3h9un9Vs
 AbLaZ9mMI2su7Ke8kR3suMHtE58xcCvaUyIVM316DwXUTezJLpY+vuyz1cMrQWtucLiLcSqGZUq
 x4315BC5p5aHlPFezqJPLLL03z8lg9nrm2Fb2IOBKxfwym5ap81aYwAPz9dFU0ZtgGi2GAODrJV
 D7ZtJKmhmkk6HPeeKxQyWR0rsp+WLE0W
X-Received: by 2002:a05:6a00:190b:b0:746:27fc:fea9 with SMTP id
 d2e1a72fcca58-74af6f081bemr13138745b3a.11.1751206026247; 
 Sun, 29 Jun 2025 07:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESIXYyPL2Cjmw2iox/a/szKCrDIPjBJFXEGszT8sAnkZ3Ckn55G7xC/dDATm2HWxiGpLH3gg==
X-Received: by 2002:a05:6a00:190b:b0:746:27fc:fea9 with SMTP id
 d2e1a72fcca58-74af6f081bemr13138702b3a.11.1751206025796; 
 Sun, 29 Jun 2025 07:07:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31da944sm5863172a12.60.2025.06.29.07.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 05/42] drm/msm: Improve msm_context comments
Date: Sun, 29 Jun 2025 07:03:08 -0700
Message-ID: <20250629140537.30850-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX4XqD/2YYGpa4
 2er5DC46Kk+iyZBcG9JJ93armJCudkgJt8Cqg1YPgn228J6bdgRBpl3irZyThB9TyYHSwikjA69
 xwRn/kGpurPbAl4YbfFF4iKkfKvrg+Ya3QpUVpWQ38GpDi80NT0eHY3KBXeLIBJXn4OoL8fz6xe
 RJcmyjlascHmKMsQH5+LfbzncGKRxUqiVEv1Qa6cGAuybSy7zvngdrQfjrEUM0lnDedJKfz2LL/
 zFuBANBs6AhuX22WiDzLoERvzF6c8UJMHHxO/Zs4LYMQVlgyXSFVPjKi0awNmrUAD5DLmWdmOTC
 JBjg1RrrATkHdz7Ur79q/ALj+pYu3YT9GfUfn89+srZfa8dyc8dO8g44TiR4zf4oWsyL+4zqeer
 HvUnPYZycuDMfjI7Sd7h8YfqFC/6FunrACNA4yb+Mt1kaR0jShs6HL8pyVL73wKsjHNrx7cL
X-Proofpoint-ORIG-GUID: E2nOLC5eqDW_WgYyoQPpMwEd9h4P9YrH
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=6861488b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WI1w4SIrP7wptn5q9fwA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: E2nOLC5eqDW_WgYyoQPpMwEd9h4P9YrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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

