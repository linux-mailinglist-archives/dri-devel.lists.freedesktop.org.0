Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D0E85D43E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA0310E6B0;
	Wed, 21 Feb 2024 09:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5943110E6B0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:49:50 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-48-65d5c739e041
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
 rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
 daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com,
 tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
 jlayton@kernel.org, dan.j.williams@intel.com, hch@infradead.org,
 djwong@kernel.org, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com, chris.p.wilson@intel.com,
 gwan-gyeong.mun@intel.com, max.byungchul.park@gmail.com,
 boqun.feng@gmail.com, longman@redhat.com, hdanton@sina.com,
 her0gyugyu@gmail.com
Subject: [PATCH v12 12/27] dept: Distinguish each work from another
Date: Wed, 21 Feb 2024 18:49:18 +0900
Message-Id: <20240221094933.36348-13-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240221094933.36348-1-byungchul@sk.com>
References: <20240221094933.36348-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSW0yTZxjHfd/v2I6az4L6TWM0TZxRAuoA84xsi4eLvbtYYmK8GRejjk+p
 cpCiHEwWUaqyIgxYEAfEcFhqgTqwRQWkWDGCqIV2VDkjoE47wBLWdquwQ6vZzZNf/v/8f1cP
 TynbmXW8Ju2EpE1Tp6hYOS2fD6uNiu99Iu0YKsVQenEH+LwFNFQ3m1hw/NKEwNR6BoP7/hcw
 5J9DsGQfoKCi3IGgdnqCgtaeSQRW41kWBl+sBJfPw0JfeSEL+fXNLDhnlzGMXyrD0GT+Ch6V
 1GGwBV7RUOFmoaoiHwfPawwBQyMHhrzNMGOs5GB5eif0TT5lwDoaCT9dGWeh09pHQ0/bDIbB
 jmoWJk3/MvCo5wENjtIiBq69qWNh1m+gwODzcPCrrQZDiy4oOv/HPwz0FtkwnP/5OgbXyG0E
 XQVTGMympyzc881hsJjLKXh79T6CmeJ5Ds5dDHBQdaYYQeG5SzQM/N3LgG48Dpb+qmZ3x5N7
 cx6K6CzZxOqvocnDOpG0V05wRNc1ypEa80liMW4j9Z1uTGoXfQwxN37PEvNiGUf08y5M3vT3
 c+TB5SWavHBV4P3rv5Z/miSlaLIk7fbPE+XJlU4POv57eM5w2w9UHmoQ9EjGi0KseFlnxHrE
 v+OX3pWhmBW2iMPDASrEEcIm0VL0G6NHcp4SLnwgGhfsbKgIF/aJY3llXIhpYbP49mYxFfIo
 hF3ignP1e/1GsanF9s4jC8YNVXNMiJVCnPjEeYMKOUXhgkx0Xp2i3w8+FO8ah+kSpKhBKxqR
 UpOWlarWpMRGJ+emaXKiv01PNaPgQxm+W05oQ4uOA91I4JEqTJF8yyUpGXVWZm5qNxJ5ShWh
 oLODkSJJnXtK0qZ/oz2ZImV2o/U8rVqr+NifnaQUjqhPSMck6bik/b/FvGxdHtpz+BTZesdz
 9JOhDc59p/+UolYZRsa7Erx7D9r6YHfMQiET7emNLzF5nr8s+Kjj7PP+wcLpLd4SOqsy0n13
 bbo9cteXnx3a8GO7ce+1bH/MmpxEq94hC7NPhKdeX3Rr872HriTxgxmPH7ftsQR0G1fXZczm
 229xsRHoWUPr6c4xuYrOTFbv3EZpM9X/ARgKPolMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSeUiTcRjH+723s8mLWb0dkI7sMNMEraeMiA56CQwJoqg/cuhbLq/Y1JwQ
 zNSO2UwnZjqrqbVMLWuaWamJlmfe08wrG5VZ1qSc5NGxBf3z8OHzhc9fD4M768jljCwyWpBH
 SsMllIgQHfBP3Li1sVfYZE71gPTLm8A6dZGA3NISCjrvFyMoKU/AYPzlPng9PYFgrq0Dh6zM
 TgR574ZxKG8YQVBdeI6CnvdOYLJaKGjOTKEgsaCUgq4v8xgMXdViUGwMgNa0fAxqZ8YIyBqn
 QJeViNnOJwxmDEU0GFTuYC7MoWH+nQ80j/SRUH+9mYTqgQ2QfWOIgqrqZgIaKs0Y9DzNpWCk
 5A8JrQ1NBHSma0i49y2fgi/TBhwMVgsN3bV6DB4k2Wrnf/wmoVFTi8H5Ww8xML15hqDm4igG
 xpI+CuqtExiUGTNxmL3zEoE59SsNyZdnaNAlpCJISb5KQMevRhKShvxg7mcutdOfr5+w4HxS
 2Rm+elpP8C35HP8kZ5jmk2oGaF5vjOHLCj34gqpxjM/7biV5Y9Elijd+19K8+qsJ47+1t9N8
 07U5gn9vysICVx4VbQ8RwmWxgtx7R5AoNKfLgk5/XhTXX3kFV6G7rBoxDMf6ch+mnNTIgaHY
 tVx//wxuZxfWlSvTfCTVSMTg7AVHrnCyjbIPi9jd3KBKS9uZYN252YpU3N4Rs5u5ya7Fds2x
 q7jiB7X/Og42fVc3QdrZmfXjerse4WlIpEcLipCLLDI2QioL9/NShIUqI2VxXsFREUZkexnD
 2fn0SjTVs68OsQySLBSHPjYJzqQ0VqGMqEMcg0tcxMQZmxKHSJXxgjzquDwmXFDUoRUMIVkq
 3n9YCHJmT0qjhTBBOC3I/68Y47BchTIeBWd0H5kclb1oLW3bEljhL1buGR9ep3+77Lb/2HFJ
 svcuh4LZBbLRIl1B/OD6JcdCtgSZW/I9HeVrNmrWZ7/K9VZZPvhoyoN/HZS47n1+o8Vt0K34
 gtot8YCnV9wJz6hV25Sn7ufNa31zDqVpzwWsximXSknbzZR4devY75i3ZJWEUIRKfTxwuUL6
 FwSUBtwuAwAA
X-CFilter-Loop: Reflected
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

Workqueue already provides concurrency control. By that, any wait in a
work doesn't prevents events in other works with the control enabled.
Thus, each work would better be considered a different context.

So let Dept assign a different context id to each work.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept.h     |  2 ++
 kernel/dependency/dept.c | 10 ++++++++++
 kernel/workqueue.c       |  3 +++
 3 files changed, 15 insertions(+)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index 4e359f76ac3c..319a5b43df89 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -509,6 +509,7 @@ extern void dept_ecxt_exit(struct dept_map *m, unsigned long e_f, unsigned long
 extern void dept_sched_enter(void);
 extern void dept_sched_exit(void);
 extern void dept_kernel_enter(void);
+extern void dept_work_enter(void);
 
 static inline void dept_ecxt_enter_nokeep(struct dept_map *m)
 {
@@ -559,6 +560,7 @@ struct dept_task { };
 #define dept_sched_enter()				do { } while (0)
 #define dept_sched_exit()				do { } while (0)
 #define dept_kernel_enter()				do { } while (0)
+#define dept_work_enter()				do { } while (0)
 #define dept_ecxt_enter_nokeep(m)			do { } while (0)
 #define dept_key_init(k)				do { (void)(k); } while (0)
 #define dept_key_destroy(k)				do { (void)(k); } while (0)
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 9aba9eb22760..a8e693fd590f 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -1933,6 +1933,16 @@ void noinstr dept_hardirqs_off(void)
 	dept_task()->hardirqs_enabled = false;
 }
 
+/*
+ * Assign a different context id to each work.
+ */
+void dept_work_enter(void)
+{
+	struct dept_task *dt = dept_task();
+
+	dt->cxt_id[DEPT_CXT_PROCESS] += 1UL << DEPT_CXTS_NR;
+}
+
 void noinstr dept_kernel_enter(void)
 {
 	struct dept_task *dt = dept_task();
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 2989b57e154a..4452864b918b 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -53,6 +53,7 @@
 #include <linux/nmi.h>
 #include <linux/kvm_para.h>
 #include <linux/delay.h>
+#include <linux/dept.h>
 
 #include "workqueue_internal.h"
 
@@ -2549,6 +2550,8 @@ __acquires(&pool->lock)
 
 	lockdep_copy_map(&lockdep_map, &work->lockdep_map);
 #endif
+	dept_work_enter();
+
 	/* ensure we're on the correct CPU */
 	WARN_ON_ONCE(!(pool->flags & POOL_DISASSOCIATED) &&
 		     raw_smp_processor_id() != pool->cpu);
-- 
2.17.1

