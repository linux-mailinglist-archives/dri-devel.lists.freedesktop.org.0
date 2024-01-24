Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904EA83A950
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285D510F717;
	Wed, 24 Jan 2024 12:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AD9D10F703
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:10 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-05-65b0fbb6d9f7
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 12/26] dept: Distinguish each work from another
Date: Wed, 24 Jan 2024 20:59:23 +0900
Message-Id: <20240124115938.80132-13-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTH9zz3tR1drhfjrvQDpsaZsCAw1JywZWKm8ZpFojGLm5poM26k
 ESqWyovJEhgVEYSKDlFEw4t2pdSCBQ0OqgiCggOqdloJbyUMRAoYtjarMDde4peTX/7nn9/5
 cliCv0uFsBqtXtJp1YkqWk7Kp4Iqwu/M1UmRb3vXQNHZSPD9nUtCWa2VBqetBoG1IQvDRPsO
 eOn3Ipjr7iWgpNiJoMIzQEBDxyACh/lnGp6PfgIu3wwNncX5NGRX1dLwdHIeQ//F8xhq7Lvg
 yblKDC2BcRJKJmi4UpKNF8ZrDAGThQFT5joYMZcyMO+Jgs7BFxQ4+j6Hy9f6aWh2dJLQ0TiC
 4flvZTQMWv+j4EnHYxKcRQUU3JyupGHSbyLA5Jth4FlLOYY6w4Io56/3FDwqaMGQc/0WBter
 JgT3cocx2K0vaGjzeTHU24sJePdrO4KRwikGTp0NMHAlqxBB/qmLJPT++4gCQ/8mmPunjI6N
 Edu8M4RoqE8THf5yUuyqFMS7pQOMaLjXx4jl9hNivTlMrGqewGLFrI8S7ZYztGifPc+IeVMu
 LE739DDi40tzpDjqKsG7lfvlX8VLiZpUSRfx9WF5QunTGZT8Jjjd3WgkMlE1l4dkrMBtFNqf
 5ZIfOLv7Br3INLdecLsDxCKv5NYI9QVjVB6SswR3+mPB/LZ7qRTMfSMEJodwHmJZklsnDPmj
 FmMFt1moriyilp2hQk1dy5JHtpDfvNy3dIvnNgnDFiOz3DktE3qGjy7zauGB2U2eQ4py9JEF
 8RptapJak7hxQ0KGVpO+4cdjSXa08FCmn+YPNKJZ595WxLFIFaSItdRKPKVOTclIakUCS6hW
 KtyrbRKviFdnnJR0xw7pTiRKKa1IyZKqTxVf+NPiee6IWi8dlaRkSfdhi1lZSCYKndV7tF9e
 Gkx2PIylD/zQVl0UuyX/zavPsvT2bU2CRRZy4XdP7drt3wdbf9kft/m1bToo7mCyfpcx7Ez0
 7WjliiHvvlV/mka3RmjjQnv/cL63RX5n48ciwuF+Om9U9nu6+D2ab0NdVyXDceWWmCrdir1V
 xeOFxoGdbdHebpzTtVNFpiSoo8IIXYr6f6shTHFMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+//P1dXqMI1OJRQjE4wuRsoLRgVBHYIuRFFYUcNOObxkm1p2
 gdW0i2WmZOYtdNbSqalnUnYxlpZl4dQcecFmSTevi9rmlmZp0ZeHH8/78vv0sIQin5rHqmPj
 RU2sKlpJy0jZljD90ntjVeIKU4EPZFxeAS7nBRLyK8tpaL1bhqC85gyG/ucbocM9hGCsuYWA
 7KxWBEUf3hFQ02hHUFdylob2jzPB5nLQ0JR1iQZ9cSUNbYPjGHquZ2IokzbD66sGDBbvFxKy
 +2nIy9bjyfiKwWs0MWDUBUBfSS4D4x+Cocn+loKGgiYK6rqXQM7NHhoe1zWR0Fjbh6H9YT4N
 9vLfFLxufElCa0YaBRUjBhoG3UYCjC4HA28shRiqkidt535MUPAizYLh3K1qDLauRwieXHiP
 QSp/S0ODawiDWcoi4Oed5wj6rgwzkHLZy0DemSsILqVcJ6Hl1wsKkntCYMyTT68LExqGHISQ
 bD4m1LkLSeGVgRce5L5jhOQn3YxQKCUI5pIgofhxPxaKvrsoQTJdpAXpeyYjpA7bsDBitTLC
 yxtjpPDRlo23+YfLVh8Uo9WJomb5mgOyyNw2B4ob8D3eWZtO6FApl4p8WJ5bxeubb9NTTHOB
 fGenl5hiP24hb077TKUiGUtw56fzJd+a/z75cut572AvTkUsS3IBfK87eKqWc6F8qSGD+udc
 wJdVWf56fCb7ipxucooVXAj/3pTOXEWyQjTNhPzUsYkxKnV0yDJtVGRSrPr4sogjMRKa3Izx
 9HhGLXK2b6xHHIuUM+TrTJWiglIlapNi6hHPEko/eefcu6JCflCVdELUHNmvSYgWtfVoPksq
 58g37RIPKLjDqngxShTjRM3/K2Z95ulQ+LUBa4H/jkdOs2QY0EbJ2rqe7UUTszZvn50Zag8s
 yJl1dqXFP2frsO3U7pR9o0l+XWG9Vq/kXHm6xRq03TfOEkD2w77S2eHunYoIp2f508TaT2vN
 96vbJceGE4sO9Xo6UuL0oYf2hHboKs7DYPrDw57Fo0cD7eRJT17xaJduQklqI1XBQYRGq/oD
 klMBFy8DAAA=
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
Cc: hamohammed.sa@gmail.com, hdanton@sina.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 linux-mm@kvack.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 chris.p.wilson@intel.com, joel@joelfernandes.org, 42.hyeyoo@gmail.com,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 her0gyugyu@gmail.com, kernel_team@skhynix.com,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, boqun.feng@gmail.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 gwan-gyeong.mun@intel.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 longman@redhat.com, tglx@linutronix.de, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 penberg@kernel.org, minchan@kernel.org, max.byungchul.park@gmail.com,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
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

