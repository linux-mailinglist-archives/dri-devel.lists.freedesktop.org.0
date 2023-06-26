Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DDE73EC7C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3B210E259;
	Mon, 26 Jun 2023 21:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CD4110E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:53 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-eb-64997d6b36ff
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 06/25] dept: Add proc knobs to show stats and dependency
 graph
Date: Mon, 26 Jun 2023 20:56:41 +0900
Message-Id: <20230626115700.13873-7-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSXUxTZxjHfc/Hew4dNWed0eNHpulU4scQjZAnmVHjxXwv1Cjc+HHBGns2
 GguSVvmYuiDUCSgoGgQFGRRTCSDqqQlVaFerYFFBEMLQFDZw6lipxM6iHRVtMd48+eX5/5/f
 1cPTKgc7j9elHZAMaRq9GisYhS+65lv9kfPauNu9CEpOxkHgTT4DlVcbMXQ3NSBovHGUgtG2
 zfDHxBiCyc5HNJSVdiOoGR6k4Ub7EAJ7XS6G3r9nQl9gHENH6QkMebVXMfR4QxR4zp2hoEHe
 Cg9OmylwBl8yUDaKoaIsjwqPfygIWuo5sOQsgZG6CxyEhldDx1A/C/anK+B8lQdDq72DgXbb
 CAW9tyoxDDV+YOFBu5uB7pIiFq68MmPwTlhosATGOXjsrKbgmiks+jdkp+DX/6ZYuFfkDNOl
 6xT0PWlB4Mj/iwK5sR/DncAYBVa5lIb/L7chGCn2cXDsZJCDiqPFCE4cO8fAo/f3WDB54mHy
 XSXe+B25MzZOE5M1k9gnqhly3yySmxcGOWJyPOVItXyQWOuWk9rWUYrU+AMskesLMJH9ZzhS
 6OujiKe/FZNXXV0ccZdPMtsX7Fas00p6XYZkWLX+B0WK7W4lTh9IyPrNOz8HNa8sRDwvCmtF
 r/xNIYqaxuMFMhthLMSIAwNBOsKzhEWitehFeK/gaaH2C/Gl+y4XCb4SEsXxKXm6xAhLxIfm
 iyjCSiFe9Dg76U/ShWLDNec0RwkJYstD83RHFe7kelw4IhWFs1FiUZWL+nQwV7xdN8CcRspq
 NKMeqXRpGakanX5tbEp2mi4rdu/+VBmFv8pyJLTHhvzdSS4k8EgdrYz7ulyrYjUZxuxUFxJ5
 Wj1LOftdmVal1Gqyf5YM+5MNB/WS0YXm84x6jnLNRKZWJfykOSDtk6R0yfA5pfioeTno0vM8
 T5U/vXPns/zJ63MTt+5MOLStOdO3ZXH2nMGKJ8M9K5qv7Pg9Nu7PnpjNW75/C9ZnOSWKArd6
 MRdjSo622NYl/vi863AzGdNl2d774n2/tJFdvf1JmjVfGuXc2cum6l+fOrRh1WuDWK5LMd53
 bKIdQ01Lg8XbW2xm/+WQ2/tYzRhTNKuX0waj5iM2ypM5UQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe1CMexjH/d7L792Wbd5ZDW86TmaHYULKKI/RuMyZo5cZBsMYd5t9Rzu1
 YZfIjJkum1MqZGRD2N2a1VRubyG07JQuq1SUJFu0DNLNpO1IG2fLnH+e+cz3+5nvX4+ElJvo
 aRJ1zCFBG6OMVmApJV23NGl+1PELqqDEuzMhMz0IXIMpFOTcLMLQeKMQQVFJAgFdleHwaqgH
 wcizBhIMWY0ITJ3tJJRUdSCw5idiaPrgDc2ufgz2rDQMSbk3MTzvdhPgOH+WgEJxLdSeMRNg
 G/5EgaELwyVDEuE5nwkYthQwYImfBc78iwy4O4PB3tFCQ8VlOw3Wtrlw4YoDQ5nVTkFVqZOA
 pgc5GDqKftFQW1VDQWNmBg3X+8wYuocsJFhc/Qy8sBkJuKX3rH1xWwk48e0nDdUZNg/l3Sag
 +fVDBI9S3hEgFrVgqHD1EFAsZpHw41olAuepXgaS04cZuJRwCkFa8nkKGkaradA7QmDkew5e
 EcZX9PSTvL74CG8dMlL8UzPH37/YzvD6R20MbxQP88X5AXxuWRfBmwZcNC8WpGJeHDjL8Cd7
 mwne0VKG+b76eoavyR6h1k/fJg1TCdHqWEG7YNkeaWTpkxx8oDX06NVuv3h0b95J5CXh2EXc
 P6kiPcaYnc21tg6TY+zDzuCKMz56cqmEZHMncp9qnjBjxWR2I9f/UxyXKHYWV2e+jMZYxoZw
 Dtsz8veoP1d4yzbOXmwo97DOPO7IPU6ioxyfQVIjmlCAfNQxsRqlOjokUBcVGRejPhq4d79G
 RJ7HsRx3Z5aiwabwcsRKkGKSLOjPbJWcVsbq4jTliJOQCh/ZlO8GlVymUsYdE7T7d2sPRwu6
 cuQnoRRTZWu2CHvk7D7lISFKEA4I2v9bQuI1LR69eT99oe9Bjf/OXyl/OJc/NyVcIz/3em9u
 SKYqe6pHS1X5g6pFC1cGa5MsaQ/ur8m7s91gn7OUg1WJ/9b7LR7YER5n3tC39fUJVl8rjZgc
 EXau8/HWujeheYFr0YDdbGzXvNq4d/Yu378nznXqUv8qCfB3X/nq/TLZJKzedDr97WjEEgWl
 i1QGB5BanfI/rX9FNzQDAAA=
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 26 Jun 2023 21:03:34 +0000
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
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, paolo.valente@linaro.org,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, penberg@kernel.org, minchan@kernel.org,
 max.byungchul.park@gmail.com, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
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
index d3b6d2f4cd7b..c5e23e9184b8 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -74,6 +74,7 @@
 #include <linux/dept.h>
 #include <linux/utsname.h>
 #include <linux/kernel.h>
+#include "dept_internal.h"
 
 static int dept_stop;
 static int dept_per_cpu_ready;
@@ -261,20 +262,13 @@ static inline bool valid_key(struct dept_key *k)
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
@@ -304,7 +298,7 @@ static void *from_pool(enum object_t t)
 	if (DEPT_WARN_ON(!irqs_disabled()))
 		return NULL;
 
-	p = &pool[t];
+	p = &dept_pool[t];
 
 	/*
 	 * Try local pool first.
@@ -339,7 +333,7 @@ static void *from_pool(enum object_t t)
 
 static void to_pool(void *o, enum object_t t)
 {
-	struct dept_pool *p = &pool[t];
+	struct dept_pool *p = &dept_pool[t];
 	struct llist_head *h;
 
 	preempt_disable();
@@ -2136,7 +2130,7 @@ void dept_map_copy(struct dept_map *to, struct dept_map *from)
 	clean_classes_cache(&to->map_key);
 }
 
-static LIST_HEAD(classes);
+LIST_HEAD(dept_classes);
 
 static inline bool within(const void *addr, void *start, unsigned long size)
 {
@@ -2168,7 +2162,7 @@ void dept_free_range(void *start, unsigned int sz)
 	while (unlikely(!dept_lock()))
 		cpu_relax();
 
-	list_for_each_entry_safe(c, n, &classes, all_node) {
+	list_for_each_entry_safe(c, n, &dept_classes, all_node) {
 		if (!within((void *)c->key, start, sz) &&
 		    !within(c->name, start, sz))
 			continue;
@@ -2244,7 +2238,7 @@ static struct dept_class *check_new_class(struct dept_key *local,
 	c->sub_id = sub_id;
 	c->key = (unsigned long)(k->base + sub_id);
 	hash_add_class(c);
-	list_add(&c->all_node, &classes);
+	list_add(&c->all_node, &dept_classes);
 unlock:
 	dept_unlock();
 caching:
@@ -2958,8 +2952,8 @@ static void migrate_per_cpu_pool(void)
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

