Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M6DDXlqeGk1pwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 08:34:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA64390C07
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 08:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AC210E011;
	Tue, 27 Jan 2026 07:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Z7H6hJ1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C08B10E011
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 07:34:13 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-81f5381d168so5010379b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 23:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1769499253; x=1770104053;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MO/xBk1Z9Sg2T5LDtUgXSRnpiqznRJUad1HNlKnWIEg=;
 b=Z7H6hJ1BRtleYYTDDAt6ODMrZggZPHBRBfSupNNABDAHe/ikRW73RQ6QD+cRAHVTAg
 txLHmkGJzH5+DtfE9YuogmUVT7yk6f8vPjydHqLwO9kB88W3rAb9WxobAJ5pBV+RVgsP
 vhp59Lx2Kq064XMHvhr3DBoyygc3m8uH2bH8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769499253; x=1770104053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MO/xBk1Z9Sg2T5LDtUgXSRnpiqznRJUad1HNlKnWIEg=;
 b=F2Pa+5VpEfpOfmkz+TycW3KcPCg2teGyQp71R/vrars1hc3CPQlZCRh+9A5vnTRKkQ
 GRdtKaYlqf8nCaq9GDIhxDxuilQ2UdhRpkz4lRqKKWmRsK7G7dL0zXur9qoJpksKYYgj
 FuDURXuqHxrz2gNAWFZnJlRDIGE+3zJewOPWLW5wlho63DOGe8XVrgdm0SyabD67dZHZ
 TQDCmDuqhHDLGuEqQqPe9cuIHxG1JBjBiWGaw83iZW8kYzFCwZpms08vB5QTRnYmc61d
 71aXlkWsJg6MpfnRCWpyoq3urdlKfmbbU9Om2kcov5tnd9pUXRLxtJ65OKIk4/vTI8h8
 uPjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5xlqsqQ77W9CqdOOiyUKuPCSEgxUyOUk5GkWzOpanFi1XRvXrO4to+EOZ0y5G3btzUV0hChfdyzQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi8s/98f9UGTxDQOKGo4SCW8kQxXjbXo4sCq1xks9XIJkeUD3M
 HUYEq29tWQF9l97Rd+EzSWeU/pQiOx5032VWHoAWkb4Ay/CpvcR53TTpv/rDIh8D8A==
X-Gm-Gg: AZuq6aJPGHQaUp6DfVK5sXcPuCqhtJC2Mh6XydYWIfnJZoWqP36vPkgUYuQM1lQGVXK
 q62cFN0tCRRhvmQTacJC6pEHzxarGTpkyCad0wXhtlm+Hj690TlhbZ78gRyfCzOx16ZCOPafyDy
 uwRvH5kOfpvvVn+2jYREkq8bw46+UZY5VrO9PeD1lT8q/AqPhAfEXpg6GhHr3omVYCDOjSIXjQS
 GUV0HsE7cI3oLesoWwxY0Og/+O5ztGlmnUlh/QhUsy3+U+10calyQMfWZSe1LiRgSLkBn4qPQRJ
 LnLrrMWNAlqLG6RDe9/LV+OEqtOPzhB7rbSoQE1pAAHI57pdf4iVALI4LgyFlCvkUSk7URwZXes
 1A+R7dnt0WCpampQ3AzCVCf9fPnEunNzuMiJ6YXJv07nUwTFoNsZh/wzplFE4Vjhgh2HBx5Itz1
 sfEq4zjJrz1ZqYbVftkZFGEpnu/NdXww32MJfDnBFK7WbkwGwuJJWSwP0JW8esjV1/XhcESZKWl
 w==
X-Received: by 2002:a05:6a00:1c99:b0:81f:521c:b640 with SMTP id
 d2e1a72fcca58-823692e6deamr973608b3a.55.1769499251997; 
 Mon, 26 Jan 2026 23:34:11 -0800 (PST)
Received: from tigerii.tok.corp.google.com
 ([2a00:79e0:2031:6:d089:781c:105e:9178])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8231876e718sm11232295b3a.62.2026.01.26.23.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 23:34:11 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Tomasz Figa <tfiga@chromium.org>
Subject: [RFC PATCH] drm: gpu: msm: forbid mem reclaim from reset
Date: Tue, 27 Jan 2026 16:33:34 +0900
Message-ID: <20260127073341.2862078-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:senozhatsky@chromium.org,m:tfiga@chromium.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[senozhatsky@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DA64390C07
X-Rspamd-Action: no action

We sometimes get into a situtation where GPU hangcheck fails to
recover GPU:

[..]
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840161
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840162
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840162
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840163
[..]

The problem is that msm_job worker is blocked on gpu->lock

INFO: task ring0:155 blocked for more than 122 seconds.
Not tainted 6.6.99-08727-gaac38b365d2c #1
task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
Call trace:
__switch_to+0x108/0x208
schedule+0x544/0x11f0
schedule_preempt_disabled+0x30/0x50
__mutex_lock_common+0x410/0x850
__mutex_lock_slowpath+0x28/0x40
mutex_lock+0x5c/0x90
msm_job_run+0x9c/0x140
drm_sched_main+0x514/0x938
kthread+0x114/0x138
ret_from_fork+0x10/0x20

which is owned by recover worker, which is waiting for DMA fences
from a memory reclaim path, under the very same gpu->lock

INFO: task ring0:155 is blocked on a mutex likely owned by task gpu-worker:154.
task:gpu-worker state:D stack:0 pid:154 ppid:2 flags:0x00000008
Call trace:
__switch_to+0x108/0x208
schedule+0x544/0x11f0
schedule_timeout+0x1f8/0x770
dma_fence_default_wait+0x108/0x218
dma_fence_wait_timeout+0x6c/0x1c0
dma_resv_wait_timeout+0xe4/0x118
active_purge+0x34/0x98
drm_gem_lru_scan+0x1d0/0x388
msm_gem_shrinker_scan+0x1cc/0x2e8
shrink_slab+0x228/0x478
shrink_node+0x380/0x730
try_to_free_pages+0x204/0x510
__alloc_pages_direct_reclaim+0x90/0x158
__alloc_pages_slowpath+0x1d4/0x4a0
__alloc_pages+0x9f0/0xc88
vm_area_alloc_pages+0x17c/0x260
__vmalloc_node_range+0x1c0/0x420
kvmalloc_node+0xe8/0x108
msm_gpu_crashstate_capture+0x1e4/0x280
recover_worker+0x1c0/0x638
kthread_worker_fn+0x150/0x2d8
kthread+0x114/0x138

So no one can make any further progress.

Forbid recover/fault worker to enter memory reclaim (under
gpu->lock) to address this deadlock scenario.

Cc: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 995549d0bbbc..ddcd9e1c217a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -17,6 +17,7 @@
 #include <linux/string_helpers.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
+#include <linux/sched/mm.h>
 
 /*
  * Power Management:
@@ -469,6 +470,7 @@ static void recover_worker(struct kthread_work *work)
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
+	unsigned int noreclaim_flag;
 	struct task_struct *task;
 	int i;
 
@@ -506,6 +508,8 @@ static void recover_worker(struct kthread_work *work)
 			msm_gem_vm_unusable(submit->vm);
 	}
 
+	noreclaim_flag = memalloc_noreclaim_save();
+
 	get_comm_cmdline(submit, &comm, &cmd);
 
 	if (comm && cmd) {
@@ -524,6 +528,8 @@ static void recover_worker(struct kthread_work *work)
 	pm_runtime_get_sync(&gpu->pdev->dev);
 	msm_gpu_crashstate_capture(gpu, submit, NULL, comm, cmd);
 
+	memalloc_noreclaim_restore(noreclaim_flag);
+
 	kfree(cmd);
 	kfree(comm);
 
@@ -588,6 +594,7 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
+	unsigned int noreclaim_flag;
 
 	mutex_lock(&gpu->lock);
 
@@ -595,6 +602,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	if (submit && submit->fault_dumped)
 		goto resume_smmu;
 
+	noreclaim_flag = memalloc_noreclaim_save();
+
 	if (submit) {
 		get_comm_cmdline(submit, &comm, &cmd);
 
@@ -610,6 +619,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	msm_gpu_crashstate_capture(gpu, submit, fault_info, comm, cmd);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
+	memalloc_noreclaim_restore(noreclaim_flag);
+
 	kfree(cmd);
 	kfree(comm);
 
-- 
2.53.0.rc1.217.geba53bf80e-goog

