Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A9278222D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BE210E196;
	Mon, 21 Aug 2023 04:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6461E10E194
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:05:00 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-bb-64e2ded5b546
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 13/25] dept: Distinguish each work from another
Date: Mon, 21 Aug 2023 12:46:25 +0900
Message-Id: <20230821034637.34630-14-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTHfZ77VirdrkXdHWyZa6oY3RCMmpPhFvaJGze3Je7D4jRa7XVU
 gWpBFCIbCDIQS4AM2ISYUknXQDfwFhRBCC8KAhMqVEQDlXZG5J3BWuVFthbjl5Nfzv9/fp+O
 hJDXUYESTWy8oItVRStoKSmd9C/9uN/hUofWZrKQdykU3P9mklBSaaHB9mcFAkt1KobRO5Hw
 0DOBYPFeDwFFBTYEpc4hAqrbHAgazOdp6Hv6Ftjd0zR0FGTTkHa1kob740sYBgvzMVSIe6Er
 14ihaX6EhKJRGoqL0rB3PMcwbypnwJSyEVzmywwsOcOgw9FPQcPjrfDblUEabjV0kNBW68LQ
 V1dCg8PyHwVdbXdJsOXpKfhjykjDuMdEgMk9zUBvkwFDVbpXlDG3TEG7vglDRtk1DPZH9Qga
 M4cxiJZ+GlrdExisYgEBC7/fQeDKmWTgwqV5BopTcxBkXygkoedVOwXpgzth8WUJHfEJ3zox
 TfDp1jN8g8dA8p1Gjr95eYjh0xsfM7xBPM1bzVv4q7dGMV8666Z4sTyL5sXZfIa/OGnH/FR3
 N8Pf/XWR5J/ai/A3Qfulu9VCtCZB0G377LA0qtJiJ07OBJx9WL0uBYnsReQn4dgdnOFKP/WG
 O6sWSR/TbDA3MDBP+Hgtu4Gz6p95O1IJwf68mjPP3KN9QQC7h7vd3LtyQLIbuZ7UBeRjGbuL
 c87Y8GvpB1xFVdOKyM+7F+vrVjpydif3j/Nv0ifl2Gw/rn5ymHl98C7XbB4gc5HMgFaVI7km
 NiFGpYneERKVGKs5G3JUGyMi70eZkpe+r0Wztn0tiJUghb/s8HsutZxSJcQlxrQgTkIo1sqC
 XjjVcplalZgk6LSHdKejhbgWFCQhFe/ItnvOqOXsD6p44YQgnBR0b1Is8QtMQRn5G8SamgLo
 XBM4/u2Ra1r59eN7p46tH0xLjkz7Uvi6OKw1PFhfMZT/5MexT8uyvgtRtrsPfKU9OBew/+1N
 ifE/vZ8UsKdr1YN9OcGNPWPBzdpz3eFDHw0ft3q++NzN6Cwxf42E1uifbY7I/fBUKKEklMW/
 3Ch5tTySVGhU1tQvj5Q5FGRclCpsC6GLU/0PNCIzHU0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzH+35/jx3Hz5X1m2zsNjMPUVvHp6ExNr+1ycMY4w8d95s76rK7
 5GJtpdAj1ZZCrJLT6ii/+iPcJUWk6UHX5aHiTqGJjlz04KEy/3z22uf9+bz+erOEooCax+r0
 MaJBr45U0jJSFr4mKaCz16UJnHigguyMQPB8TyGhoMJCQ9utcgSW6kQMA482Q9fIIILxZ60E
 5OW2IShy9hBQ3diLwFZ6ioaOvllg9wzR0JSbTkPStQoa2j9NYOi+kIOhXNoCzVnFGOpGP5CQ
 N0DD5bwkPDk+Yhg1lzFgTlgErtJLDEw4g6Cp10FBw5UmCmyvlsHFq900WG1NJDTWuDB03C2g
 odfyh4LmxicktGVnUnDzSzENn0bMBJg9Qww8ryvEUJk8aTsz/JuCx5l1GM6U3MZgf3kPQW3K
 WwySxUFDg2cQQ5WUS8DYjUcIXOc+M3A6Y5SBy4nnEKSfvkBC66/HFCR3q2D8ZwG9fo3QMDhE
 CMlVxwXbSCEpPC3mhTuXehghufYVIxRKx4Sq0qXCNesAFoq+eShBKkulBelbDiOkfbZj4UtL
 CyM8yR8nhT57Ht42f69srUaM1MWKhpWhETJthcVOHHX7mLqq5yYgiUtD3izPBfNPK8fJKaa5
 xfyLF6PEFPtyC/mqzPdUGpKxBHd2Bl/qfkZPBT5cGP/wwfPpB5JbxLcmjqEplnOreKe7Df+T
 LuDLK+umRd6Te+ne3ekbBafivzrfkVlIVoi8ypCvTh8bpdZFqlYYj2jj9DrTioPRURKa7Iw5
 fiK7Bn3v2FyPOBYpZ8oj5rs0Ckoda4yLqkc8Syh95f4/nBqFXKOOOyEaovcbjkWKxnrkz5JK
 P3nYbjFCwR1Sx4hHRPGoaPifYtZ7XgKK35lqDNMWXY2pcERbw1XNczaEttSaAiXbrhv3vbT+
 S2T5+1rbf3RaV38I7T+ZsjLg/MbtQ1alaZbjys5l1316Vg8fTMqKCdrb9zp6q3xsj76hxBTu
 Ffx2x57+JeschpAD5l3DmeaS2Tl+8Y1vfoW48zdZeg6nn2IH3B7DclET4n9TSRq16qClhMGo
 /gv9mtivLwMAAA==
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
index f62c7b6f42c6..d9ca9dd50219 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -515,6 +515,7 @@ extern void dept_ecxt_exit(struct dept_map *m, unsigned long e_f, unsigned long
 extern void dept_sched_enter(void);
 extern void dept_sched_exit(void);
 extern void dept_kernel_enter(void);
+extern void dept_work_enter(void);
 
 static inline void dept_ecxt_enter_nokeep(struct dept_map *m)
 {
@@ -567,6 +568,7 @@ struct dept_task { };
 #define dept_sched_enter()				do { } while (0)
 #define dept_sched_exit()				do { } while (0)
 #define dept_kernel_enter()				do { } while (0)
+#define dept_work_enter()				do { } while (0)
 #define dept_ecxt_enter_nokeep(m)			do { } while (0)
 #define dept_key_init(k)				do { (void)(k); } while (0)
 #define dept_key_destroy(k)				do { (void)(k); } while (0)
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 4165cacf4ebb..6cf17f206b78 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -1977,6 +1977,16 @@ void dept_hardirqs_off_ip(unsigned long ip)
 }
 EXPORT_SYMBOL_GPL(dept_hardirqs_off_ip);
 
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
 void dept_kernel_enter(void)
 {
 	struct dept_task *dt = dept_task();
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index c913e333cce8..fa23d876a8b5 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -52,6 +52,7 @@
 #include <linux/sched/debug.h>
 #include <linux/nmi.h>
 #include <linux/kvm_para.h>
+#include <linux/dept.h>
 
 #include "workqueue_internal.h"
 
@@ -2318,6 +2319,8 @@ __acquires(&pool->lock)
 
 	lockdep_copy_map(&lockdep_map, &work->lockdep_map);
 #endif
+	dept_work_enter();
+
 	/* ensure we're on the correct CPU */
 	WARN_ON_ONCE(!(pool->flags & POOL_DISASSOCIATED) &&
 		     raw_smp_processor_id() != pool->cpu);
-- 
2.17.1

