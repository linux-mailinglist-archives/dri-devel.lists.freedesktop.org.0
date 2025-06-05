Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858B9ACF6CA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77A810E9F9;
	Thu,  5 Jun 2025 18:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkWZuV7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0874010E9C6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HV3rW006413
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=GjwdFtRmZCc
 ujedmTouJ/e/3QiW6i5MklXvEyiWEeF0=; b=kkWZuV7avWl80lhhB/hYQfk7lUC
 6ExfCDrzM83Xwna53MMUjXxiazcxrSxAsGzeE65ihvVDCymzW84/GWfwdqWB4sa5
 C16lWV87dXMvGc6HZ92FI0PbHMYkOmUt4wblVak9HqGGe0uen1FBf2BsjNJAEwjy
 /c/2iU+I+K3rbtane0VO8QWDqyaiWL2U2zoG66heRi0cbYyOQ/ikJvzek73kWwh1
 D1tjYiOrm5vT6Ymg9bWJWJJHwwtzugOwkPgijgVJ7wR4hEX1/5dzmXsnndVMLM3Z
 MHTIGDiCa1zKKVJTH9bQFm+f+vGZo7HFMibe5ROQ7oyFXdwou8/2Re7O8Ng==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2ac8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74620e98ec8so1219708b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148378; x=1749753178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GjwdFtRmZCcujedmTouJ/e/3QiW6i5MklXvEyiWEeF0=;
 b=qecLF0wWDuRXeAhpDVCx/mppVKbqrxFLYFClz01L+TDCJtde/f43HhTZ0TuVt5WHa3
 NzsLkWXsYEL1oukagppJleVXc6r9w64AofGD79pxNFMsEVTNQLyo7HC/jf/EDu7ENz2L
 TVwABtwF+BME25j7Yh3KIs3OKk6aGMCtnOgmW/xawjw7/ZQMAU8VgSckvvUqiEuNzSbg
 vTzgVtHuu1mBuqQWUJ7hISxqCnECGW6lEfRdaFeDFxwZyEdDTh43YStB2+mhxR/T7t9C
 a/cGTyn0IM+WbRdLIZqGW7bhyTFOVZjgCHpo+4KTrEAGpqS176E6r4BqJsyBlPlVeSiF
 RdHg==
X-Gm-Message-State: AOJu0YzpC7X0z1CAATq9j6jb7pEZUN2lt/G/cUOS3v4JYldmvyAzqqxP
 +TsLFBil32QSBzVPnDcrDK4/tSCPqZkB3pE+D3AM8iyjTxwtfI5nnn7pDuRABgRp0mkX1g0uxQi
 8N3fMcbLDeML7O+kundiJlFYiIz9sGyL6WCo+0eqiTBF1Dl+bvK/fttGndfLek+HqxAfgkIygGl
 9Z8a0=
X-Gm-Gg: ASbGncvhLloGPIxxT6czbWTTmacESN1pPQw+/3OF2ODspnHozWxvWXCq+mHP14DFoht
 bpvpV5S+2f/RHwMtrERTvpJ/qJmLNC186fQRUf//bKxwjs0zt/PJgKQsfFjoTrCes1qEl5OH3GG
 XFR1V73f/rtyljZjRxOd3kRZCWGuagcbN0jJoDPv6YzvsxjT2OfR6c9V3BvDyjvy4gpOiPK+3wp
 Gm7ZsIURDmZ7OeGMBTtCuBadjHkj5ZiSuOzODd8SZBfspAAytbrbJnllLVlmSM25tOFWaUgw24B
 IRewlPTbwVIOlqP5mk9P9g==
X-Received: by 2002:a05:6a00:f06:b0:742:a24d:aede with SMTP id
 d2e1a72fcca58-748185160dcmr6346521b3a.8.1749148378405; 
 Thu, 05 Jun 2025 11:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuKpjDQOHpbnp+mogU9n35DFZViXAwwcqPGcim05ueVVuUmQIJFSRRzTywH2aBcEBZ1w/yng==
X-Received: by 2002:a05:6a00:f06:b0:742:a24d:aede with SMTP id
 d2e1a72fcca58-748185160dcmr6346484b3a.8.1749148378012; 
 Thu, 05 Jun 2025 11:32:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affcfa19sm13531812b3a.132.2025.06.05.11.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:57 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 21/40] drm/msm: Mark VM as unusable on GPU hangs
Date: Thu,  5 Jun 2025 11:29:06 -0700
Message-ID: <20250605183111.163594-22-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xI3vQ9NhC_4vdfdqFAFV6bZZpmqYEGjR
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2db cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: xI3vQ9NhC_4vdfdqFAFV6bZZpmqYEGjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX3I4aQRu92jgs
 eaiYwmTvrbP1tHiNwYP9g0vEKOj6gWr5id1ItUhpoWumupj7s0cp5nbSDmRaw30ayJ6konFj25P
 toSNreBzGySjGf3P3Ap/puj7cZZjbIjbi3Sc7YKTsoE3GdSP8E4ZFWbDlHEwwiXQ7Bhr7um9rrl
 L99YXQCuWXU32EPxyzc6BVItz9j/OhR7/l2vimh/zafRfNJAQgB2gf4Qj7aEnS6TOwgLyzEXVhF
 u2PFjK1NSwbBnnSyJdhhusxGqPcUcmHY+sxuzQiTQu3j45wOng1U819iZ8jWFAS3GvBjE5ORxKE
 BOEQxJ1ZNgQSeK+w5j7izvZtguaVM0fVJ5IMGV6B74etl07SGV/BNROw4KKYJMifNHMUY1Gp0Y2
 pJfT+BrASGj0CpKyTq7TnZhv5FtitfroO7MstRFnflDTP6Gqf7xn3jq6FFgWeag+gYj6a5vF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165
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

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ec1a7a837e52..5e8c419ed834 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,23 @@ struct msm_gem_vm {
 
 	/** @managed: is this a kernel managed VM? */
 	bool managed;
+
+	/**
+	 * @unusable: True if the VM has turned unusable because something
+	 * bad happened during an asynchronous request.
+	 *
+	 * We don't try to recover from such failures, because this implies
+	 * informing userspace about the specific operation that failed, and
+	 * hoping the userspace driver can replay things from there. This all
+	 * sounds very complicated for little gain.
+	 *
+	 * Instead, we should just flag the VM as unusable, and fail any
+	 * further request targeting this VM.
+	 *
+	 * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
+	 * situation, where the logical device needs to be re-created.
+	 */
+	bool unusable;
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9d58d6f643af..fe43fd4049de 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -679,6 +679,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0314e15d04c2..6503ce655b10 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm)
-		to_msm_vm(submit->vm)->faults++;
+	if (submit->vm) {
+		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+		vm->faults++;
+
+		/*
+		 * If userspace has opted-in to VM_BIND (and therefore userspace
+		 * management of the VM), faults mark the VM as unusuable.  This
+		 * matches vulkan expectations (vulkan is the main target for
+		 * VM_BIND)
+		 */
+		if (!vm->managed)
+			vm->unusable = true;
+	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
-- 
2.49.0

