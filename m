Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5151D215F
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F856EA82;
	Wed, 13 May 2020 21:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574CA6E0C2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:46:42 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y16so1346944wrs.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V5e2yBBjg+EwlqyNC0zOA3/qvhI00DKgKtd35XQEuV4=;
 b=u6nApRWvUlxkoFToMR9zh7MFuN2eypUcrfAV2LVJ5j17sJkEVNJzaqkCTBZaeNEbhs
 kPmcPgyNHSx50I5+pDYuL3xlnrfudpumlKzR1/VJbpehjwDRghtoIPeW825VinMDCTLb
 BRrJtkDC4r4LipKrcYWciwka0Tt5BIEIyBrZRomIG6Q/tpTIwedu1cMg7JVgRhJhV+FH
 6iLMXXp01Mp+pVp168jUQG/7eok3rbtdodg9+RGRWLbFs0RAsZlISwR9g15PHv5z20vu
 xOoWaacA12KBS8GNymmWH2wlpShiwnEVih79MvEjxqpexBJ29zKI1KfnJ16WUWfhoXpP
 HUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V5e2yBBjg+EwlqyNC0zOA3/qvhI00DKgKtd35XQEuV4=;
 b=DdgKsXAOxD0dVGkAqULeOF7f9/RQ/SQdud1Uzc5fj95xAc8na6GfBZf4fp5cEIQ6+S
 phlPBcML2TBCbSlY5lAyef+29MSHNFywlgnMpLXRkDfYiQ/DhIudmZh+Lm+BGLJo7rn6
 Hd1nNzKug0XjwLbmvn82DAAw99E8m2fboC1Cc4OCs+E6Wr3ZF9UdVBGNS8hPwHgQdmDf
 W0gnHXFOSWv1mNEx+CAvkA7U0YQB0TRp00M7uNXVpUsl8Ma+1W2cc3k4FoX+E65nBN31
 SRH/8GYjwkC7A5H4v83nkexYMAT5Ev1pkWGjI/fAFWZ0EPOrZeCQBza7Qbyk6lWNnhIM
 r6WQ==
X-Gm-Message-State: AOAM5316qf5fTX9XgIlas8vPsNDnpbCQa5sTVLoV/PGNLHyHR4qN5tCg
 4fEZYp1yj7jUUGIlF2PzvV5g4E7l
X-Google-Smtp-Source: ABdhPJz12roq4TaoNTi96whZswnrScljpc8xFO3UJxp1whOek2Uw1YdqobjGFDzXBifp7yRRB7np1w==
X-Received: by 2002:adf:e28c:: with SMTP id v12mr1675009wri.157.1589406400638; 
 Wed, 13 May 2020 14:46:40 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:40 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/11] tty/sysrq: constify the the sysrq_key_op(s)
Date: Wed, 13 May 2020 22:43:43 +0100
Message-Id: <20200513214351.2138580-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All the users threat them as immutable - annotate them as such.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 drivers/tty/sysrq.c   | 52 +++++++++++++++++++++----------------------
 include/linux/sysrq.h |  2 +-
 2 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 091c64a3cef0..477cdc1e9cf3 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -106,7 +106,7 @@ static void sysrq_handle_loglevel(int key)
 	pr_info("Loglevel set to %d\n", i);
 	console_loglevel = i;
 }
-static struct sysrq_key_op sysrq_loglevel_op = {
+static const struct sysrq_key_op sysrq_loglevel_op = {
 	.handler	= sysrq_handle_loglevel,
 	.help_msg	= "loglevel(0-9)",
 	.action_msg	= "Changing Loglevel",
@@ -119,14 +119,14 @@ static void sysrq_handle_SAK(int key)
 	struct work_struct *SAK_work = &vc_cons[fg_console].SAK_work;
 	schedule_work(SAK_work);
 }
-static struct sysrq_key_op sysrq_SAK_op = {
+static const struct sysrq_key_op sysrq_SAK_op = {
 	.handler	= sysrq_handle_SAK,
 	.help_msg	= "sak(k)",
 	.action_msg	= "SAK",
 	.enable_mask	= SYSRQ_ENABLE_KEYBOARD,
 };
 #else
-#define sysrq_SAK_op (*(struct sysrq_key_op *)NULL)
+#define sysrq_SAK_op (*(const struct sysrq_key_op *)NULL)
 #endif
 
 #ifdef CONFIG_VT
@@ -135,14 +135,14 @@ static void sysrq_handle_unraw(int key)
 	vt_reset_unicode(fg_console);
 }
 
-static struct sysrq_key_op sysrq_unraw_op = {
+static const struct sysrq_key_op sysrq_unraw_op = {
 	.handler	= sysrq_handle_unraw,
 	.help_msg	= "unraw(r)",
 	.action_msg	= "Keyboard mode set to system default",
 	.enable_mask	= SYSRQ_ENABLE_KEYBOARD,
 };
 #else
-#define sysrq_unraw_op (*(struct sysrq_key_op *)NULL)
+#define sysrq_unraw_op (*(const struct sysrq_key_op *)NULL)
 #endif /* CONFIG_VT */
 
 static void sysrq_handle_crash(int key)
@@ -152,7 +152,7 @@ static void sysrq_handle_crash(int key)
 
 	panic("sysrq triggered crash\n");
 }
-static struct sysrq_key_op sysrq_crash_op = {
+static const struct sysrq_key_op sysrq_crash_op = {
 	.handler	= sysrq_handle_crash,
 	.help_msg	= "crash(c)",
 	.action_msg	= "Trigger a crash",
@@ -165,20 +165,20 @@ static void sysrq_handle_reboot(int key)
 	local_irq_enable();
 	emergency_restart();
 }
-static struct sysrq_key_op sysrq_reboot_op = {
+static const struct sysrq_key_op sysrq_reboot_op = {
 	.handler	= sysrq_handle_reboot,
 	.help_msg	= "reboot(b)",
 	.action_msg	= "Resetting",
 	.enable_mask	= SYSRQ_ENABLE_BOOT,
 };
 
-struct sysrq_key_op *__sysrq_reboot_op = &sysrq_reboot_op;
+const struct sysrq_key_op *__sysrq_reboot_op = &sysrq_reboot_op;
 
 static void sysrq_handle_sync(int key)
 {
 	emergency_sync();
 }
-static struct sysrq_key_op sysrq_sync_op = {
+static const struct sysrq_key_op sysrq_sync_op = {
 	.handler	= sysrq_handle_sync,
 	.help_msg	= "sync(s)",
 	.action_msg	= "Emergency Sync",
@@ -190,7 +190,7 @@ static void sysrq_handle_show_timers(int key)
 	sysrq_timer_list_show();
 }
 
-static struct sysrq_key_op sysrq_show_timers_op = {
+static const struct sysrq_key_op sysrq_show_timers_op = {
 	.handler	= sysrq_handle_show_timers,
 	.help_msg	= "show-all-timers(q)",
 	.action_msg	= "Show clockevent devices & pending hrtimers (no others)",
@@ -200,7 +200,7 @@ static void sysrq_handle_mountro(int key)
 {
 	emergency_remount();
 }
-static struct sysrq_key_op sysrq_mountro_op = {
+static const struct sysrq_key_op sysrq_mountro_op = {
 	.handler	= sysrq_handle_mountro,
 	.help_msg	= "unmount(u)",
 	.action_msg	= "Emergency Remount R/O",
@@ -213,13 +213,13 @@ static void sysrq_handle_showlocks(int key)
 	debug_show_all_locks();
 }
 
-static struct sysrq_key_op sysrq_showlocks_op = {
+static const struct sysrq_key_op sysrq_showlocks_op = {
 	.handler	= sysrq_handle_showlocks,
 	.help_msg	= "show-all-locks(d)",
 	.action_msg	= "Show Locks Held",
 };
 #else
-#define sysrq_showlocks_op (*(struct sysrq_key_op *)NULL)
+#define sysrq_showlocks_op (*(const struct sysrq_key_op *)NULL)
 #endif
 
 #ifdef CONFIG_SMP
@@ -266,7 +266,7 @@ static void sysrq_handle_showallcpus(int key)
 	}
 }
 
-static struct sysrq_key_op sysrq_showallcpus_op = {
+static const struct sysrq_key_op sysrq_showallcpus_op = {
 	.handler	= sysrq_handle_showallcpus,
 	.help_msg	= "show-backtrace-all-active-cpus(l)",
 	.action_msg	= "Show backtrace of all active CPUs",
@@ -284,7 +284,7 @@ static void sysrq_handle_showregs(int key)
 		show_regs(regs);
 	perf_event_print_debug();
 }
-static struct sysrq_key_op sysrq_showregs_op = {
+static const struct sysrq_key_op sysrq_showregs_op = {
 	.handler	= sysrq_handle_showregs,
 	.help_msg	= "show-registers(p)",
 	.action_msg	= "Show Regs",
@@ -296,7 +296,7 @@ static void sysrq_handle_showstate(int key)
 	show_state();
 	show_workqueue_state();
 }
-static struct sysrq_key_op sysrq_showstate_op = {
+static const struct sysrq_key_op sysrq_showstate_op = {
 	.handler	= sysrq_handle_showstate,
 	.help_msg	= "show-task-states(t)",
 	.action_msg	= "Show State",
@@ -307,7 +307,7 @@ static void sysrq_handle_showstate_blocked(int key)
 {
 	show_state_filter(TASK_UNINTERRUPTIBLE);
 }
-static struct sysrq_key_op sysrq_showstate_blocked_op = {
+static const struct sysrq_key_op sysrq_showstate_blocked_op = {
 	.handler	= sysrq_handle_showstate_blocked,
 	.help_msg	= "show-blocked-tasks(w)",
 	.action_msg	= "Show Blocked State",
@@ -321,21 +321,21 @@ static void sysrq_ftrace_dump(int key)
 {
 	ftrace_dump(DUMP_ALL);
 }
-static struct sysrq_key_op sysrq_ftrace_dump_op = {
+static const struct sysrq_key_op sysrq_ftrace_dump_op = {
 	.handler	= sysrq_ftrace_dump,
 	.help_msg	= "dump-ftrace-buffer(z)",
 	.action_msg	= "Dump ftrace buffer",
 	.enable_mask	= SYSRQ_ENABLE_DUMP,
 };
 #else
-#define sysrq_ftrace_dump_op (*(struct sysrq_key_op *)NULL)
+#define sysrq_ftrace_dump_op (*(const struct sysrq_key_op *)NULL)
 #endif
 
 static void sysrq_handle_showmem(int key)
 {
 	show_mem(0, NULL);
 }
-static struct sysrq_key_op sysrq_showmem_op = {
+static const struct sysrq_key_op sysrq_showmem_op = {
 	.handler	= sysrq_handle_showmem,
 	.help_msg	= "show-memory-usage(m)",
 	.action_msg	= "Show Memory",
@@ -366,7 +366,7 @@ static void sysrq_handle_term(int key)
 	send_sig_all(SIGTERM);
 	console_loglevel = CONSOLE_LOGLEVEL_DEBUG;
 }
-static struct sysrq_key_op sysrq_term_op = {
+static const struct sysrq_key_op sysrq_term_op = {
 	.handler	= sysrq_handle_term,
 	.help_msg	= "terminate-all-tasks(e)",
 	.action_msg	= "Terminate All Tasks",
@@ -396,7 +396,7 @@ static void sysrq_handle_moom(int key)
 {
 	schedule_work(&moom_work);
 }
-static struct sysrq_key_op sysrq_moom_op = {
+static const struct sysrq_key_op sysrq_moom_op = {
 	.handler	= sysrq_handle_moom,
 	.help_msg	= "memory-full-oom-kill(f)",
 	.action_msg	= "Manual OOM execution",
@@ -408,7 +408,7 @@ static void sysrq_handle_thaw(int key)
 {
 	emergency_thaw_all();
 }
-static struct sysrq_key_op sysrq_thaw_op = {
+static const struct sysrq_key_op sysrq_thaw_op = {
 	.handler	= sysrq_handle_thaw,
 	.help_msg	= "thaw-filesystems(j)",
 	.action_msg	= "Emergency Thaw of all frozen filesystems",
@@ -421,7 +421,7 @@ static void sysrq_handle_kill(int key)
 	send_sig_all(SIGKILL);
 	console_loglevel = CONSOLE_LOGLEVEL_DEBUG;
 }
-static struct sysrq_key_op sysrq_kill_op = {
+static const struct sysrq_key_op sysrq_kill_op = {
 	.handler	= sysrq_handle_kill,
 	.help_msg	= "kill-all-tasks(i)",
 	.action_msg	= "Kill All Tasks",
@@ -432,7 +432,7 @@ static void sysrq_handle_unrt(int key)
 {
 	normalize_rt_tasks();
 }
-static struct sysrq_key_op sysrq_unrt_op = {
+static const struct sysrq_key_op sysrq_unrt_op = {
 	.handler	= sysrq_handle_unrt,
 	.help_msg	= "nice-all-RT-tasks(n)",
 	.action_msg	= "Nice All RT Tasks",
@@ -442,7 +442,7 @@ static struct sysrq_key_op sysrq_unrt_op = {
 /* Key Operations table and lock */
 static DEFINE_SPINLOCK(sysrq_key_table_lock);
 
-static struct sysrq_key_op *sysrq_key_table[36] = {
+static const struct sysrq_key_op *sysrq_key_table[36] = {
 	&sysrq_loglevel_op,		/* 0 */
 	&sysrq_loglevel_op,		/* 1 */
 	&sysrq_loglevel_op,		/* 2 */
diff --git a/include/linux/sysrq.h b/include/linux/sysrq.h
index 479028391c08..3a582ec7a2f1 100644
--- a/include/linux/sysrq.h
+++ b/include/linux/sysrq.h
@@ -47,7 +47,7 @@ void handle_sysrq(int key);
 void __handle_sysrq(int key, bool check_mask);
 int register_sysrq_key(int key, const struct sysrq_key_op *op);
 int unregister_sysrq_key(int key, const struct sysrq_key_op *op);
-extern struct sysrq_key_op *__sysrq_reboot_op;
+extern const struct sysrq_key_op *__sysrq_reboot_op;
 
 int sysrq_toggle_support(int enable_mask);
 int sysrq_mask(void);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
