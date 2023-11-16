Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C417EE271
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 15:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7147610E5F9;
	Thu, 16 Nov 2023 14:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E8D10E5DF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 14:15:55 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c50fbc218bso11133761fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 06:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700144153; x=1700748953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5+HyYqKye+EeqpuYqCTr3dhQvwqf8cR6fLNENWiQGmE=;
 b=YO6rxeMDzwpv1jVrSqvNhrara+2sO+Aw5sdr/EI/qiHvf0NAQ3WMr6tstYjGXaoCZn
 INchnXgJ6kjYQWBIkTopOHPxYt24n8YW7v6VAn6b58LdOnMC68V3HxSJ7ZDMKwVj/u98
 ZDdU7+NdWXr5jiUWBN48gsZ9cV/tQIAT2i8RMWGN/obMS/74U8IZSMa9x4HYj+fHcEo9
 hsw5is0MbvZmg/lGk/0VadIar7BiYJtSm8JkWNBqgXvfBIy4cTmE6aAnJgUiodT0/9I6
 Xz6VXEp0YZRp+o9T4yf9tT37SbcEv4akeiobsBZo02YByy9WJs6g0fwspONF6Zq/MtTn
 BNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700144153; x=1700748953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5+HyYqKye+EeqpuYqCTr3dhQvwqf8cR6fLNENWiQGmE=;
 b=f5uzBg8ykaP9X4DOugliLOmcqZGRYjWjcyaUsd9kTxpdQBjjpGpxtGZ4bs2Cd593Gj
 llUQ7sQJtpfeHBACaEKLBOmh2CyCLeRzVdd8QBRcWlIq9gsbN/oytoQhCxHCO+dkNkIs
 lbtBIfItGEWSNL0M6R7y9mm4cb6Ce7lHtE0/yFF+UboSaieoys35IJCF1OIdobk7lKjF
 zCAeL4wZxDWW2yNwz8njBU3mFK8eczfewXvHqrsnSa0Re0z04EIsgV8oqx9IHaTLx+G0
 xDbJ4tgFquq1KpVP+YGmdZHVU7AAsE/fR7+6jJzks0Moq3abQvYOlT75Xvzm/sjewNaH
 WVYg==
X-Gm-Message-State: AOJu0YxR3meVr4CTqpNXSaNF5LpfwLndd7grLBduDCGJtXxZuL1FoKvc
 64QdfFz16SX1089mf1Z2GOE=
X-Google-Smtp-Source: AGHT+IG2u0COh0G4pFq1m2nyi3zbqQlYpGZNjqZc5GSEh8PmH7+XEUQDPyk9LvstgBxH8R+3Kv1NZA==
X-Received: by 2002:a2e:848a:0:b0:2c5:6c7:9e73 with SMTP id
 b10-20020a2e848a000000b002c506c79e73mr6042857ljh.48.1700144152978; 
 Thu, 16 Nov 2023 06:15:52 -0800 (PST)
Received: from EliteBook.amd.com (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a7bce0a000000b004083a105f27sm3709072wmc.26.2023.11.16.06.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 06:15:52 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dakr@redhat.com, airlied@gmail.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/scheduler: improve GPU scheduler documentation v2
Date: Thu, 16 Nov 2023 15:15:46 +0100
Message-Id: <20231116141547.206695-1-christian.koenig@amd.com>
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

v2: Some improvements suggested by Danilo, add section about error
    handling.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst           |  36 +++++
 drivers/gpu/drm/scheduler/sched_main.c | 174 +++++++++++++++++++++----
 2 files changed, 188 insertions(+), 22 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index acc5901ac840..112463fa9f3a 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -552,12 +552,48 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
    :doc: Overview
 
+Job Object
+----------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Job Object
+
+Entity Object
+-------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Entity Object
+
+Hardware Fence Object
+---------------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Hardware Fence Object
+
+Scheduler Fence Object
+----------------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Scheduler Fence Object
+
+Scheduler and Run Queue Objects
+-------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Scheduler and Run Queue Objects
+
 Flow Control
 ------------
 
 .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
    :doc: Flow Control
 
+Error and Timeout handling
+--------------------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Error and Timeout handling
+
 Scheduler Function References
 -----------------------------
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 044a8c4875ba..026123497b0e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -24,28 +24,122 @@
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
+ * to push next to the hardware. Another major use case of the GPU scheduler
+ * is to enforce correct driver behavior around those command submissions.
+ * Because of this it's also used by drivers which don't need the actual
+ * scheduling functionality.
+ *
+ * All callbacks the driver needs to implement are restricted by DMA-fence
+ * signaling rules to guarantee deadlock free forward progress. This especially
+ * means that for normal operation no memory can be allocated in a callback.
+ * All memory which is needed for pushing the job to the hardware must be
+ * allocated before arming a job. It also means that no locks can be taken
+ * under which memory might be allocated as well.
+ *
+ * Memory which is optional to allocate, for example for device core dumping or
+ * debugging, *must* be allocated with GFP_NOWAIT and appropriate error
+ * handling taking if that allocation fails. GFP_ATOMIC should only be used if
+ * absolutely necessary since dipping into the special atomic reserves is
+ * usually not justified for a GPU driver.
+ */
+
+/**
+ * DOC: Job Object
+ *
+ * The base job object contains submission dependencies in the form of DMA-fence
+ * objects. Drivers can also implement an optional prepare_job callback which
+ * returns additional dependencies as DMA-fence objects. It's important to note
+ * that this callback can't allocate memory or grab locks under which memory is
+ * allocated.
+ *
+ * Drivers should use this as base class for an object which contains the
+ * necessary state to push the command submission to the hardware.
+ *
+ * The lifetime of the job object should at least be from pushing it into the
+ * scheduler until the scheduler notes through the free callback that a job
+ * isn't needed any more. Drivers can of course keep their job object alive
+ * longer than that, but that's outside of the scope of the scheduler
+ * component. Job initialization is split into two parts, drm_sched_job_init()
+ * and drm_sched_job_arm(). It's important to note that after arming a job
+ * drivers must follow the DMA-fence rules and can't easily allocate memory
+ * or takes locks under which memory is allocated.
+ */
+
+/**
+ * DOC: Entity Object
+ *
+ * The entity object which is a container for jobs which should execute
+ * sequentially. Drivers should create an entity for each individual context
+ * they maintain for command submissions which can run in parallel.
+ *
+ * The lifetime of the entity should *not* exceed the lifetime of the
+ * userspace process it was created for and drivers should call the
+ * drm_sched_entity_flush() function from their file_operations.flush
+ * callback. So it's possible that an entity object is not alive any
+ * more while jobs from it are still running on the hardware.
+ *
+ * Background is that for compatibility reasons with existing
+ * userspace all results of a command submission should become visible
+ * externally even after after a process exits. This is normal POSIX behavior
+ * for I/O operations.
+ *
+ * The problem with this approach is that GPU submissions contain executable
+ * shaders enabling processes to evade their termination by offloading work to
+ * the GPU. So when a process is terminated with a SIGKILL the entity object
+ * makes sure that jobs are freed without running them while still maintaining
+ * correct sequential order for signaling fences.
+ */
+
+/**
+ * DOC: Hardware Fence Object
+ *
+ * The hardware fence object is a DMA-fence provided by the driver as result of
+ * running jobs. Drivers need to make sure that the normal DMA-fence semantics
+ * are followed for this object. It's important to note that the memory for
+ * this object can *not* be allocated in the run_job callback since that would
+ * violate the requirements for the DMA-fence implementation. The scheduler
+ * maintains a timeout handler which triggers if this fence doesn't signal in
+ * a configurable time frame.
+ *
+ * The lifetime of this object follows DMA-fence ref-counting rules, the
+ * scheduler takes ownership of the reference returned by the driver and drops
+ * it when it's not needed any more.
+ */
+
+/**
+ * DOC: Scheduler Fence Object
+ *
+ * The scheduler fence object which encapsulates the whole time from pushing
+ * the job into the scheduler until the hardware has finished processing it.
+ * This is internally managed by the scheduler, but drivers can grab additional
+ * reference to it after arming a job. The implementation provides DMA-fence
+ * interfaces for signaling both scheduling of a command submission as well as
+ * finishing of processing.
+ *
+ * The lifetime of this object also follows normal DMA-fence ref-counting
+ * rules. The finished fence is the one normally exposed outside of the
+ * scheduler, but the driver can grab references to both the scheduled as well
+ * as the finished fence when needed for pipe-lining optimizations.
+ */
+
+/**
+ * DOC: Scheduler and Run Queue Objects
+ *
+ * The scheduler object itself does the actual work of selecting a job and
+ * pushing it to the hardware. Both FIFO and RR selection algorithm are
+ * supported, but FIFO is preferred for many use cases.
+ *
+ * The lifetime of the scheduler is managed by the driver using it. Before
+ * destroying the scheduler the driver must ensure that all hardware processing
+ * involving this scheduler object has finished by calling for example
+ * disable_irq(). It is *not* sufficient to wait for the hardware fence here
+ * since this doesn't guarantee that all callback processing has finished.
+ *
+ * The run queue object is a container of entities for a certain priority
+ * level. This object is internally managed by the scheduler and drivers
+ * shouldn't touch them directly. The lifetime of run queues are bound to the
+ * schedulers lifetime.
  */
 
 /**
@@ -72,6 +166,42 @@
  * limit.
  */
 
+/**
+ * DOC: Error and Timeout handling
+ *
+ * Errors schould be signaled by using dma_fence_set_error() on the hardware
+ * fence object before signaling it. Errors are then bubbled up from the
+ * hardware fence to the scheduler fence.
+ *
+ * The entity allows querying errors on the last run submission using the
+ * drm_sched_entity_error() function which can be used to cancel queued
+ * submissions in the run_job callback as well as preventing pushing further
+ * ones into the entity in the drivers submission function.
+ *
+ * When the hardware fence fails to signal in a configurable amount of time the
+ * timedout_job callback is issued. The driver should then follow the procedure
+ * described on the &struct drm_sched_backend_ops.timedout_job callback (TODO:
+ * The timeout handler should probably switch to using the hardware fence as
+ * parameter instead of the job. Otherwise the handling will always race
+ * between timing out and signaling the fence).
+ *
+ * The scheduler also used to provided functionality for re-submitting jobs
+ * with replacing the hardware fence during reset handling. This functionality
+ * is now marked as deprecated. This has proven to be fundamentally racy and
+ * not compatible with DMA-fence rules and shouldn't be used in any new code.
+ *
+ * Additional there is the drm_sched_increase_karma() function which tries to
+ * find the entity which submitted a job and increases it's 'karma'
+ * atomic variable to prevent re-submitting jobs from this entity. This has
+ * quite some overhead and re-submitting jobs is now marked as deprecated. So
+ * using this function is rather discouraged.
+ *
+ * Drivers can still re-create the GPU state should it be lost during timeout
+ * handling when they can guarantee that forward progress is made and this
+ * doesn't cause another timeout. But this is strongly hardware specific and
+ * out of the scope of the general GPU scheduler.
+ */
+
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
-- 
2.34.1

