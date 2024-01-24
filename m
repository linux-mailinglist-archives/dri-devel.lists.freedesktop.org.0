Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B785383A96B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F5310F6E2;
	Wed, 24 Jan 2024 12:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id DDAFD10F72E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:09 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-a5-65b0fbb529a6
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 06/26] dept: Add proc knobs to show stats and dependency
 graph
Date: Wed, 24 Jan 2024 20:59:17 +0900
Message-Id: <20240124115938.80132-7-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTYRTHe573uuXkbV18S6IYWNHVbnKKiL5ED0QURX3oPvRFR15iK8si
 07Tb1HKBLsvCS6wxl9qmpKWyjDQLzXLVsrnKtBS1lTlraRdn9OXw4/z/5/fp8JSympnBa+IP
 Sdp4dayKldPygaDCRZUj5VJ4d0cYGDLDwTd0job8MisLraUlCKwVqRh6H26AV8P9CEaan1Jg
 zGlFUPi+g4KKBg+CWvMpFtq6gsHp87LQlJPBQlpxGQvP+kYxuHMvYSixbYIn2UUYHP5PNBh7
 WbhqTMNjoweD32ThwJQSBp3mKxyMvl8KTZ6XDNS2L4C8624WamqbaGio6sTQdjefBY/1DwNP
 Gh7R0GrIYuDW5yIW+oZNFJh8Xg6eOwowlKePic58+81AY5YDw5kbtzE4X99DUHfuHQab9SUL
 D3z9GOy2HAp+3nyIoPPCAAenM/0cXE29gCDjdC4NT381MpDuXgkjP/LZdavJg34vRdLtR0jt
 cAFNHheJpPpKB0fS69o5UmA7TOzm+aS4pheTwkEfQ2yW8yyxDV7iiH7AicnnlhaOPLo8QpMu
 pxFvCd0pXxMlxWoSJe2StfvlMf43xw8+jjiaXVnPpqCShXok40Vhhdid8hHrET/O3/XBgTUr
 zBVdLj8V4CnCbNGe9ZHRIzlPCWcniuYvzWwgmCxsFXMbr9MBpoUw0dlbiQKsEFaKaXXd1D//
 LLGk3DHOMiFCvJXXPt5XjnXeWS5yAakonJWJ9uJr6N/BdPG+2UVnI0UBmmBBSk18YpxaE7ti
 cUxSvObo4siEOBsaeyjTidFdVWiwdVs9EnikClKss5RJSkadqEuKq0ciT6mmKFzTSyWlIkqd
 dEzSJuzTHo6VdPUolKdVIYplw0eilEK0+pB0QJIOStr/KeZlM1LQ5eomQ2nIxuWLVK+i28I3
 Skalh9zRaaa+qJkEzV2RQnDPedlJa0OIO395cqZM803Ys3vq0GbbnOSetZm+AyeGNNPytq+v
 +pVjmBMkT92cseOrN9lz3923d2bUh8TyuxN2Od7O7NpZtyo6+GKLKnSNYZ7rGp6o3R3R/2Lr
 bHp1tjdBReti1EvnU1qd+i/8N+rITAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/xzsuv502v/K422JCysRnsvAHfmPM+MOG0S2/1aku3VWE
 tijhVMpW0VWrcM4VnUtb9OBWlGo90C1Jtcpjczriyrk8VJt/3ntt74e/3iwh11PerEodK2rU
 ykgFLSWle4KSV1e6zaK/tVsGWWn+4PxxiYT88jIaOu+XIih7eA7DyLMd8GrcjsDd1kFAbnYn
 guKhfgIeNg4gqDWep6HrnQfYnA4amrOv0JB8s5yGF58nMfTlXMNQatkNrZklGKyujyTkjtCg
 z03GU/IJg8tgYsCQ5APDxjwGJocCoHmgm4KGgmYKantXwo3CPhpqaptJaKwaxtD1OJ+GgbK/
 FLQ2PiehMyudgnujJTR8HjcQYHA6GHhpLcJgTplaS/3+h4KmdCuG1FsPMNheVyOouzSIwVLW
 TUOD046hwpJNwK87zxAMZ3xh4EKaiwH9uQwEVy7kkNDxu4mClL5AcP/Mp7cECQ12ByGkVJwU
 aseLSKGlhBce5fUzQkpdLyMUWeKECqOvcLNmBAvFY05KsJgu04Jl7Boj6L7YsDDa3s4Iz6+7
 SeGdLRfvXXhQuumYGKmKFzVrgkOk4a43Z060rD+VWVlPJ6HSVTrEsjy3jp/QeeiQhKW55XxP
 j4uYZk9uKV+R/oHSISlLcBdn88avbfS0MY/bx+c0FZLTTHI+vG2kEk2zjAvkk+vez5R5bglf
 arbOsIRbz9+70TuTl09lBk1XmUwkLUKzTMhTpY6PUqoiA/20EeEJatUpv9DoKAuauowhcTKr
 Cv3o2lGPOBYp5si2mMpFOaWM1yZE1SOeJRSesh6v+6JcdkyZcFrURB/VxEWK2nq0gCUV82U7
 D4ghci5MGStGiOIJUfPfxazEOwktwAW7ur8t2rlbmrpxbUjQhgh9TRe5uNCr82neeEP73OFl
 XP/t/ca24xNvQwNWbg9+khgzVG6Xhp2s3jdbJzntl17tYZ/wuVt1qG/bGVHtdphXmF84YnHx
 27HDEtORsKWHvhn+xB3OTPS+e0s9qgs+G7Onv2PO3tB5MXrdo+Wbt/b6KkhtuDLAl9Bolf8A
 egzQ2y4DAAA=
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

It'd be useful to show Dept internal stats and dependency graph on
runtime via proc for better information. Introduced the knobs.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 kernel/dependency/Makefile        |  1 +
 kernel/dependency/dept.c          | 24 +++-----
 kernel/dependency/dept_internal.h | 26 +++++++++
 kernel/dependency/dept_proc.c     | 95 +++++++++++++++++++++++++++++++
 4 files changed, 131 insertions(+), 15 deletions(-)
 create mode 100644 kernel/dependency/dept_internal.h
 create mode 100644 kernel/dependency/dept_proc.c

diff --git a/kernel/dependency/Makefile b/kernel/dependency/Makefile
index b5cfb8a03c0c..92f165400187 100644
--- a/kernel/dependency/Makefile
+++ b/kernel/dependency/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_DEPT) += dept.o
+obj-$(CONFIG_DEPT) += dept_proc.o
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 7e12e46dc4b7..19406093103e 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -74,6 +74,7 @@
 #include <linux/dept.h>
 #include <linux/utsname.h>
 #include <linux/kernel.h>
+#include "dept_internal.h"
 
 static int dept_stop;
 static int dept_per_cpu_ready;
@@ -260,20 +261,13 @@ static bool valid_key(struct dept_key *k)
  *       have been freed will be placed.
  */
 
-enum object_t {
-#define OBJECT(id, nr) OBJECT_##id,
-	#include "dept_object.h"
-#undef  OBJECT
-	OBJECT_NR,
-};
-
 #define OBJECT(id, nr)							\
 static struct dept_##id spool_##id[nr];					\
 static DEFINE_PER_CPU(struct llist_head, lpool_##id);
 	#include "dept_object.h"
 #undef  OBJECT
 
-static struct dept_pool pool[OBJECT_NR] = {
+struct dept_pool dept_pool[OBJECT_NR] = {
 #define OBJECT(id, nr) {						\
 	.name = #id,							\
 	.obj_sz = sizeof(struct dept_##id),				\
@@ -303,7 +297,7 @@ static void *from_pool(enum object_t t)
 	if (DEPT_WARN_ON(!irqs_disabled()))
 		return NULL;
 
-	p = &pool[t];
+	p = &dept_pool[t];
 
 	/*
 	 * Try local pool first.
@@ -338,7 +332,7 @@ static void *from_pool(enum object_t t)
 
 static void to_pool(void *o, enum object_t t)
 {
-	struct dept_pool *p = &pool[t];
+	struct dept_pool *p = &dept_pool[t];
 	struct llist_head *h;
 
 	preempt_disable();
@@ -2092,7 +2086,7 @@ void dept_map_copy(struct dept_map *to, struct dept_map *from)
 	clean_classes_cache(&to->map_key);
 }
 
-static LIST_HEAD(classes);
+LIST_HEAD(dept_classes);
 
 static bool within(const void *addr, void *start, unsigned long size)
 {
@@ -2124,7 +2118,7 @@ void dept_free_range(void *start, unsigned int sz)
 	while (unlikely(!dept_lock()))
 		cpu_relax();
 
-	list_for_each_entry_safe(c, n, &classes, all_node) {
+	list_for_each_entry_safe(c, n, &dept_classes, all_node) {
 		if (!within((void *)c->key, start, sz) &&
 		    !within(c->name, start, sz))
 			continue;
@@ -2200,7 +2194,7 @@ static struct dept_class *check_new_class(struct dept_key *local,
 	c->sub_id = sub_id;
 	c->key = (unsigned long)(k->base + sub_id);
 	hash_add_class(c);
-	list_add(&c->all_node, &classes);
+	list_add(&c->all_node, &dept_classes);
 unlock:
 	dept_unlock();
 caching:
@@ -2915,8 +2909,8 @@ static void migrate_per_cpu_pool(void)
 		struct llist_head *from;
 		struct llist_head *to;
 
-		from = &pool[i].boot_pool;
-		to = per_cpu_ptr(pool[i].lpool, boot_cpu);
+		from = &dept_pool[i].boot_pool;
+		to = per_cpu_ptr(dept_pool[i].lpool, boot_cpu);
 		move_llist(to, from);
 	}
 }
diff --git a/kernel/dependency/dept_internal.h b/kernel/dependency/dept_internal.h
new file mode 100644
index 000000000000..007c1eec6bab
--- /dev/null
+++ b/kernel/dependency/dept_internal.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Dept(DEPendency Tracker) - runtime dependency tracker internal header
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
+ */
+
+#ifndef __DEPT_INTERNAL_H
+#define __DEPT_INTERNAL_H
+
+#ifdef CONFIG_DEPT
+
+enum object_t {
+#define OBJECT(id, nr) OBJECT_##id,
+	#include "dept_object.h"
+#undef  OBJECT
+	OBJECT_NR,
+};
+
+extern struct list_head dept_classes;
+extern struct dept_pool dept_pool[];
+
+#endif
+#endif /* __DEPT_INTERNAL_H */
diff --git a/kernel/dependency/dept_proc.c b/kernel/dependency/dept_proc.c
new file mode 100644
index 000000000000..7d61dfbc5865
--- /dev/null
+++ b/kernel/dependency/dept_proc.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Procfs knobs for Dept(DEPendency Tracker)
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (C) 2021 LG Electronics, Inc. , Byungchul Park
+ */
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+#include <linux/dept.h>
+#include "dept_internal.h"
+
+static void *l_next(struct seq_file *m, void *v, loff_t *pos)
+{
+	/*
+	 * XXX: Serialize list traversal if needed. The following might
+	 * give a wrong information on contention.
+	 */
+	return seq_list_next(v, &dept_classes, pos);
+}
+
+static void *l_start(struct seq_file *m, loff_t *pos)
+{
+	/*
+	 * XXX: Serialize list traversal if needed. The following might
+	 * give a wrong information on contention.
+	 */
+	return seq_list_start_head(&dept_classes, *pos);
+}
+
+static void l_stop(struct seq_file *m, void *v)
+{
+}
+
+static int l_show(struct seq_file *m, void *v)
+{
+	struct dept_class *fc = list_entry(v, struct dept_class, all_node);
+	struct dept_dep *d;
+	const char *prefix;
+
+	if (v == &dept_classes) {
+		seq_puts(m, "All classes:\n\n");
+		return 0;
+	}
+
+	prefix = fc->sched_map ? "<sched> " : "";
+	seq_printf(m, "[%p] %s%s\n", (void *)fc->key, prefix, fc->name);
+
+	/*
+	 * XXX: Serialize list traversal if needed. The following might
+	 * give a wrong information on contention.
+	 */
+	list_for_each_entry(d, &fc->dep_head, dep_node) {
+		struct dept_class *tc = d->wait->class;
+
+		prefix = tc->sched_map ? "<sched> " : "";
+		seq_printf(m, " -> [%p] %s%s\n", (void *)tc->key, prefix, tc->name);
+	}
+	seq_puts(m, "\n");
+
+	return 0;
+}
+
+static const struct seq_operations dept_deps_ops = {
+	.start	= l_start,
+	.next	= l_next,
+	.stop	= l_stop,
+	.show	= l_show,
+};
+
+static int dept_stats_show(struct seq_file *m, void *v)
+{
+	int r;
+
+	seq_puts(m, "Availability in the static pools:\n\n");
+#define OBJECT(id, nr)							\
+	r = atomic_read(&dept_pool[OBJECT_##id].obj_nr);		\
+	if (r < 0)							\
+		r = 0;							\
+	seq_printf(m, "%s\t%d/%d(%d%%)\n", #id, r, nr, (r * 100) / (nr));
+	#include "dept_object.h"
+#undef  OBJECT
+
+	return 0;
+}
+
+static int __init dept_proc_init(void)
+{
+	proc_create_seq("dept_deps", S_IRUSR, NULL, &dept_deps_ops);
+	proc_create_single("dept_stats", S_IRUSR, NULL, dept_stats_show);
+	return 0;
+}
+
+__initcall(dept_proc_init);
-- 
2.17.1

