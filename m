Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A30512E07EF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5933E6E83C;
	Tue, 22 Dec 2020 09:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com
 [IPv6:2607:f8b0:4864:20::f4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB466E523
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 20:10:37 +0000 (UTC)
Received: by mail-qv1-xf4a.google.com with SMTP id 12so8880152qvk.23
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 12:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=ieaeMyCrk00dcucJz23SXmslO5kX5HWEa7JTBymav94=;
 b=nG02DRXatEl0T+ObNAeKHpzprM5RZUiynJ3nlSXAgVe7ejHfMmVCfiypzfc/S6+CIR
 Ag7h8JxZodkMPqbBAg8Ax9ANpTtB6HspKv+7Jv3gSKKC8e5oEBHVirMmhIdEVyJ3N8OB
 vpGi38KQ8KIaSiVLl8dLKVamqqDr3+lAhNtocQv9tgHQ8DLK+Qh7n21QGXOMntdP+L6B
 O931aqE2/RCoePDL8HE+s0xEzYDMFpfecJUXvPIgiuHep4g0iiPw6ICdqXkh8BEVeaev
 lTtsD3hO8CCAkp/KuJFz81MfyfhChuwOAUYBvVL/HiZkIJgZXVCTTV7w0kti99TVOLhQ
 v9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ieaeMyCrk00dcucJz23SXmslO5kX5HWEa7JTBymav94=;
 b=IFDPJYSFSn4fdICCd80ezRTc1DblvR0uOsfJQB7ijwFFy4VrQGBiaxT0vgoww2cyUe
 PKrOLQL3am9tiGmg1LqiIcNbPih+fgHtJZ4sYnsbHBI83uEQBkbV6GBYZ+QLdvHswht0
 2B11kb3Gb++86uWJDYQIgVlqQAXRWQtyqrEy5JcXsQ6pClODcov1TN5PLOLCJv3vCdZx
 E1C6KhGsfqqQPGF+PI8Zd3USs539sggGFKsC/0JB/j7cMYNn5L4lXDh6UQ+MyrBk4lrW
 sz98a6kMQQWk8EBMUjC7ZlGgrBqAFeR4g10K2dWv7sgcFqBdIwtCNZomN4eJFYxys8Lm
 zvCg==
X-Gm-Message-State: AOAM531042tpXBYZSmnr0jxQ3qJIjx8G76maKV+T81h8A99bfTU58Frc
 yVj776Vci66FacJaMEsis/f3vt4=
X-Google-Smtp-Source: ABdhPJwDi4F39nO8IpSpSY+yD9ueX70Bhb48bu4T3j+rgayrwo628LEqcH2Ohc/hvQ8yzulCsHAmgdc=
X-Received: from lpy-goobuntu.mtv.corp.google.com
 ([2620:15c:211:2:5265:f3ff:fe23:c8be])
 (user=lpy job=sendgmr) by 2002:a0c:f005:: with SMTP id
 z5mr19352054qvk.9.1608581436781; 
 Mon, 21 Dec 2020 12:10:36 -0800 (PST)
Date: Mon, 21 Dec 2020 12:10:19 -0800
In-Reply-To: <20201202123420.g3ivr5le4imcrdsa@DESKTOP-E1NTVVP.localdomain>
Message-Id: <20201221201019.2897731-1-lpy@google.com>
Mime-Version: 1.0
References: <20201202123420.g3ivr5le4imcrdsa@DESKTOP-E1NTVVP.localdomain>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v5] Add power/gpu_frequency tracepoint.
From: Peiyong Lin <lpy@google.com>
To: brian.starkey@arm.com
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:47 +0000
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
Cc: sidaths@google.com, yamada.masahiro@socionext.com,
 gregkh@linuxfoundation.org, rafael.j.wysocki@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, lpy@google.com,
 prahladk@google.com, mingo@redhat.com, rostedt@goodmis.org, pavel@ucw.cz,
 paul.walmsley@sifive.com, ulf.hansson@linaro.org, nd@arm.com,
 zzyiwei@android.com, android-kernel@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Historically there is no common trace event for GPU frequency, in
downstream Android each different hardware vendor implements their own
way to expose GPU frequency, for example as a debugfs node.  This patch
standardize it as a common trace event in upstream linux kernel to help
the ecosystem have a common implementation across hardware vendors.
Toolings in the Linux ecosystem will benefit from this especially in the
downstream Android, where this information is critical to graphics
developers.

Signed-off-by: Peiyong Lin <lpy@google.com>
---

Changelog since v4:
 - Explicitly use class id and instance id to identify a GPU instance.
 - Change gpu_id to clock_id to call out its the clock domain in
   the GPU instance.

Changelog since v3:
 - Correct copyright title.

Changelog since v2:
 - Add more comments to indicate when the event should be emitted.
 - Change state to frequency.

Changelog since v1:
 - Use %u in TP_printk

 drivers/gpu/Makefile                    |  1 +
 drivers/gpu/trace/Kconfig               |  3 ++
 drivers/gpu/trace/Makefile              |  1 +
 drivers/gpu/trace/trace_gpu_frequency.c | 13 ++++++++
 include/trace/events/power.h            | 41 +++++++++++++++++++++++++
 5 files changed, 59 insertions(+)
 create mode 100644 drivers/gpu/trace/trace_gpu_frequency.c

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 835c88318cec..f289a47eb031 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_TEGRA_HOST1X)	+= host1x/
 obj-y			+= drm/ vga/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
+obj-$(CONFIG_TRACE_GPU_FREQUENCY)		+= trace/
diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
index c24e9edd022e..ac4aec8d5845 100644
--- a/drivers/gpu/trace/Kconfig
+++ b/drivers/gpu/trace/Kconfig
@@ -2,3 +2,6 @@
 
 config TRACE_GPU_MEM
 	bool
+
+config TRACE_GPU_FREQUENCY
+	bool
diff --git a/drivers/gpu/trace/Makefile b/drivers/gpu/trace/Makefile
index b70fbdc5847f..2b7ae69327d6 100644
--- a/drivers/gpu/trace/Makefile
+++ b/drivers/gpu/trace/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_TRACE_GPU_MEM) += trace_gpu_mem.o
+obj-$(CONFIG_TRACE_GPU_FREQUENCY) += trace_gpu_frequency.o
diff --git a/drivers/gpu/trace/trace_gpu_frequency.c b/drivers/gpu/trace/trace_gpu_frequency.c
new file mode 100644
index 000000000000..668fabd6b77a
--- /dev/null
+++ b/drivers/gpu/trace/trace_gpu_frequency.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GPU frequency trace points
+ *
+ * Copyright (C) 2020 Google LLC
+ */
+
+#include <linux/module.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/power.h>
+
+EXPORT_TRACEPOINT_SYMBOL(gpu_frequency);
diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index af5018aa9517..590e16169dd1 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -500,6 +500,47 @@ DEFINE_EVENT(dev_pm_qos_request, dev_pm_qos_remove_request,
 
 	TP_ARGS(name, type, new_value)
 );
+
+/**
+ * gpu_frequency - Reports the GPU frequency in GPU clock domains.
+ *
+ * This event should be emitted whenever there's a GPU frequency change happens,
+ * or a GPU goes from idle state to active state, or vice versa.
+ *
+ * When the GPU goes from idle state to active state, this event should report
+ * the GPU frequency of the active state. When the GPU goes from active state to
+ * idle state, this event should report a zero frequency value.
+ *
+ * @frequency:  New frequency (in KHz)
+ * @gpu_class_id: Id representing the class of the GPU
+ * @gpu_instance_id: Id representing the instance of class &gpu_class_id
+ * @clock_id: Id for the clock domain in &gpu_instance_id running at &frequency
+ */
+TRACE_EVENT(gpu_frequency,
+
+	TP_PROTO(unsigned int frequency, unsigned int gpu_class_id,
+		 unsigned int gpu_instance_id, unsigned int clock_id),
+
+	TP_ARGS(frequency, gpu_class_id, gpu_instance_id, clock_id),
+
+	TP_STRUCT__entry(
+		__field(unsigned int, frequency)
+		__field(unsigned int, gpu_class_id)
+		__field(unsigned int, gpu_instance_id)
+		__field(unsigned int, clock_id)
+	),
+
+	TP_fast_assign(
+		__entry->frequency = frequency;
+		__entry->gpu_class_id = gpu_class_id;
+		__entry->gpu_instance_id = gpu_instance_id;
+		__entry->clock_id = clock_id;
+	),
+
+	TP_printk("frequency=%u gpu_class_id=%u gpu_instance_id=%u clock_id=%u",
+		__entry->frequency, __entry->gpu_class_id,
+		__entry->gpu_instance_id, __entry->clock_id)
+);
 #endif /* _TRACE_POWER_H */
 
 /* This part must be outside protection */
-- 
2.29.2.684.gfbc64c5ab5-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
