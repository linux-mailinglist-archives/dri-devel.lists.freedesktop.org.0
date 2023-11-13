Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E22D7E9C43
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 13:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F59C10E09F;
	Mon, 13 Nov 2023 12:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E687710E374
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 12:38:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so38047135e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 04:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699879117; x=1700483917; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ukm8phRDPk8EbU35rBMhp9qJpmKB4f/zJ1Y/aXk5W+w=;
 b=FqDiY3Wzuozrlu0PLuFqv8PvYkfcy3Sb+IcoZisjFaK97DfLB0yV+JM1jYcvb4X2U7
 wPPZ2QJbwN9DnMtmzufjYs1NZqBS2v5rGUTVoNc0KvdtUEBSaOxD4AaiTRHDdzdxcGY0
 Uppt5niXa6xRsgKpJeViKcUwmxblX3TAGenePktltanlokmbu1QXor2hieh/ve11tRRJ
 VErwfvvTVEIg7D7eKio6hfiYBYm8tPD90sTJz5mPmXrEIXOqnMlkFRX2zB4USkQnSsbd
 WDqUkgfVtWgyrnyLiGojpAFNztezv6wRixqxEaWU2lau5d0KEiQeM7Mvxdi+a/3Y28mD
 ffvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699879117; x=1700483917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ukm8phRDPk8EbU35rBMhp9qJpmKB4f/zJ1Y/aXk5W+w=;
 b=IWaYqiojkk77CnEActENUf3lf8BWScidWK10tEtJUXTi4BtG5yoVNzHq4YT+oA4nf/
 mNqPzjPOaScdXaWG7+0753ItBjCvkPe2RdvhIYipveLj4ovEtDltGliTuqhglhZJi6Xp
 d8HvtNUSx1BAdgArLi/MqomOpFHMC6Skn/OGux3lRQ7XdKsFyaYulc8BZF7AH73mtJ+Y
 wio36/KhjLvZpf1mueyEGa2rliqwuHSVBNIU56XxKGi/0HWPNvvU9wVYxC5sWr5EhwDp
 uZK6naOWNVPJ2PiOKQDNlBMG0ZOiUtMfhphrwp6gJsIllVZZcFTtpMlE0Q0DnyAU//8e
 OVKg==
X-Gm-Message-State: AOJu0Yzqvsev86y8xwiFtChjokIRyrPHve5PIC88tgutq+VcEGTSFaqw
 IZUrNec9ZmRvdZigEA3NiIM=
X-Google-Smtp-Source: AGHT+IFHtTYLExf2ag11zaOn6IYxKYrcPWEfy4+eatoMQq2/CF8RAkgnpieT7o91vksj6nCsUrB4Yg==
X-Received: by 2002:a05:600c:d9:b0:402:cc5c:c98 with SMTP id
 u25-20020a05600c00d900b00402cc5c0c98mr5076290wmm.13.1699879117145; 
 Mon, 13 Nov 2023 04:38:37 -0800 (PST)
Received: from EliteBook.amd.com (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 p41-20020a05600c1da900b00406408dc788sm13879636wms.44.2023.11.13.04.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 04:38:36 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@gmail.com, ltuikov89@gmail.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexander.deucher@amd.com
Subject: [PATCH] drm/scheduler: improve GPU scheduler documentation
Date: Mon, 13 Nov 2023 13:38:32 +0100
Message-Id: <20231113123832.120710-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Start to improve the scheduler document. Especially document the
lifetime of each of the objects as well as the restrictions around
DMA-fence handling and userspace compatibility.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 126 ++++++++++++++++++++-----
 1 file changed, 104 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 506371c42745..36a7c5dc852d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -24,28 +24,110 @@
 /**
  * DOC: Overview
  *
- * The GPU scheduler provides entities which allow userspace to push jobs
- * into software queues which are then scheduled on a hardware run queue.
- * The software queues have a priority among them. The scheduler selects the entities
- * from the run queue using a FIFO. The scheduler provides dependency handling
- * features among jobs. The driver is supposed to provide callback functions for
- * backend operations to the scheduler like submitting a job to hardware run queue,
- * returning the dependencies of a job etc.
- *
- * The organisation of the scheduler is the following:
- *
- * 1. Each hw run queue has one scheduler
- * 2. Each scheduler has multiple run queues with different priorities
- *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
- * 3. Each scheduler run queue has a queue of entities to schedule
- * 4. Entities themselves maintain a queue of jobs that will be scheduled on
- *    the hardware.
- *
- * The jobs in a entity are always scheduled in the order that they were pushed.
- *
- * Note that once a job was taken from the entities queue and pushed to the
- * hardware, i.e. the pending queue, the entity must not be referenced anymore
- * through the jobs entity pointer.
+ * The GPU scheduler implements some logic to decide which command submission
+ * to push next to the hardware. Another major use case for the GPU scheduler
+ * is to enforce correct driver behavior around those command submission.
+ * Because of this it's also used by drivers which don't need the actual
+ * scheduling functionality.
+ *
+ * To fulfill this task the GPU scheduler uses of the following objects:
+ *
+ * 1. The job object which contains a bunch of dependencies in the form of
+ *    DMA-fence objects. Drivers can also implement an optional prepare_job
+ *    callback which returns additional dependencies as DMA-fence objects.
+ *    It's important to note that this callback must follow the DMA-fence rules,
+ *    so it can't easily allocate memory or grab locks under which memory is
+ *    allocated. Drivers should use this as base class for an object which
+ *    contains the necessary state to push the command submission to the
+ *    hardware.
+ *
+ *    The lifetime of the job object should at least be from pushing it into the
+ *    scheduler until the scheduler notes through the free callback that a job
+ *    isn't needed any more. Drivers can of course keep their job object alive
+ *    longer than that, but that's outside of the scope of the scheduler
+ *    component. Job initialization is split into two parts,
+ *    drm_sched_job_init() and drm_sched_job_arm(). It's important to note that
+ *    after arming a job drivers must follow the DMA-fence rules and can't
+ *    easily allocate memory or takes locks under which memory is allocated.
+ *
+ * 2. The entity object which is a container for jobs which should execute
+ *    sequentially. Drivers should create an entity for each individual context
+ *    they maintain for command submissions which can run in parallel.
+ *
+ *    The lifetime of the entity should *not* exceed the lifetime of the
+ *    userspace process it was created for and drivers should call the
+ *    drm_sched_entity_flush() function from their file_operations.flush
+ *    callback. Background is that for compatibility reasons with existing
+ *    userspace all results of a command submission should become visible
+ *    externally even after after a process exits. The only exception to that
+ *    is when the process is actively killed by a SIGKILL. In this case the
+ *    entity object makes sure that jobs are freed without running them while
+ *    still maintaining correct sequential order for signaling fences. So it's
+ *    possible that an entity object is not alive any more while jobs from it
+ *    are still running on the hardware.
+ *
+ * 3. The hardware fence object which is a DMA-fence provided by the driver as
+ *    result of running jobs. Drivers need to make sure that the normal
+ *    DMA-fence semantics are followed for this object. It's important to note
+ *    that the memory for this object can *not* be allocated in the run_job
+ *    callback since that would violate the requirements for the DMA-fence
+ *    implementation. The scheduler maintains a timeout handler which triggers
+ *    if this fence doesn't signal in a configurable time frame.
+ *
+ *    The lifetime of this object follows DMA-fence ref-counting rules, the
+ *    scheduler takes ownership of the reference returned by the driver and
+ *    drops it when it's not needed any more. Errors should also be signaled
+ *    through the hardware fence and are bubbled up back to the scheduler fence
+ *    and entity.
+ *
+ * 4. The scheduler fence object which encapsulates the whole time from pushing
+ *    the job into the scheduler until the hardware has finished processing it.
+ *    This is internally managed by the scheduler, but drivers can grab
+ *    additional reference to it after arming a job. The implementation
+ *    provides DMA-fence interfaces for signaling both scheduling of a command
+ *    submission as well as finishing of processing.
+ *
+ *    The lifetime of this object also follows normal DMA-fence ref-counting
+ *    rules. The finished fence is the one normally exposed outside of the
+ *    scheduler, but the driver can grab references to both the scheduled as
+ *    well as the finished fence when needed for pipe-lining optimizations.
+ *
+ * 5. The run queue object which is a container of entities for a certain
+ *    priority level. The lifetime of those objects are bound to the scheduler
+ *    lifetime.
+ *
+ *    This is internally managed by the scheduler and drivers shouldn't touch
+ *    them directly.
+ *
+ * 6. The scheduler object itself which does the actual work of selecting a job
+ *    and pushing it to the hardware. Both FIFO and RR selection algorithm are
+ *    supported, but FIFO is preferred for many use cases.
+ *
+ *    The lifetime of this object is managed by the driver using it. Before
+ *    destroying the scheduler the driver must ensure that all hardware
+ *    processing involving this scheduler object has finished by calling for
+ *    example disable_irq(). It is *not* sufficient to wait for the hardware
+ *    fence here since this doesn't guarantee that all callback processing has
+ *    finished.
+ *
+ * All callbacks the driver needs to implement are restricted by DMA-fence
+ * signaling rules to guarantee deadlock free forward progress. This especially
+ * means that for normal operation no memory can be allocated. All memory which
+ * is needed for pushing the job to the hardware must be allocated before
+ * arming a job. It also means that no locks can be taken under which memory
+ * might be allocated as well.
+ *
+ * Memory which is optional to allocate for device core dumping or debugging
+ * *must* be allocated with GFP_NOWAIT and appropriate error handling taking if
+ * that allocation fails. GFP_ATOMIC should only be used if absolutely
+ * necessary since dipping into the special atomic reserves is usually not
+ * justified for a GPU driver.
+ *
+ * The scheduler also used to provided functionality for re-submitting jobs
+ * with replacing the hardware fence during reset handling. This functionality
+ * is now marked as deprecated since this has proven to be fundamentally racy
+ * and not compatible with DMA-fence rules and shouldn't be used in any new
+ * code.
  */
 
 #include <linux/kthread.h>
-- 
2.34.1

