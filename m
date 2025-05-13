Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEF4AB5223
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB5510E57F;
	Tue, 13 May 2025 10:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5FE7310E563
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:22 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-5c-682319f01bfd
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
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 yskelg@gmail.com, yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com
Subject: [PATCH v15 26/43] dept: print staged wait's stacktrace on report
Date: Tue, 13 May 2025 19:07:13 +0900
Message-Id: <20250513100730.12664-27-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRTH+917d+/danWbUbcHVCt7kmX2OIFF9E/XIgiEoPqjll7ayGls
 ZhlEzsxMU6x8lKXNadehU+cmaI/Z0lyaZJY2H5mphbh8kbWRr2or+ufw4XvO+Zx/Do3LXoqW
 0KrIaF4TqYiQkxJCMjLHsOnb4lXKLUK/GNw/kgi4X24ioaWsBIGpUoeBq34/tHuGEUy9foND
 dmYLgvy+jzhUOnoQ2IzxJLR+mQtt7jESGjNTSLhSUE7C26FpDLqzbmFQYjkEn4QBAprSDRhk
 u0i4l30F85ZBDCaEYgqEOH/oN+ZQMN0XCI09ThHYujbC3bxuEp7aGglwVPdj0Pr4Pgk9pt8i
 aHI0EOBJWwotN1NFUDpqIGHII+AguMcoeGfXY+DQLwRzgleY+P2XCF6m2jFILKzAoK3zCYKa
 pF4MLCYnCXXuYQyslkwcJovqEfSnjVBw9cYEBfd0aQhSrmYRkNC9HaZ+ei/n/ggE3QMzAaUz
 TrR3N2fKMyGubngM5xKs57lJ93uSs3n0BPfKwHKPcj5SXEJNF8XpLec4q3EDV/DUhXH5424R
 Zym+TnKW8VsUlzzShnGjzc3U4WXHJMHhfIQqhtds3nNSomy3VmBnp3dfKK3zUHHIFZiMxDTL
 bGOHUozUfy4qa0U+Jpm1bEfHBO7jBcwK1po6IEpGEhpnnLPZ9tzOv0N+TAibpnvoXaZpgvFn
 y3plvljK7GB/Vj8i/zmXsyVm+1+P2JvPFDUTPpYx29l0fQnhc7LMbTGbMdCA/i0sZp8bO4h0
 JNWjWcVIpoqMUStUEdsClLGRqgsBYVFqC/K+l3Bp+ng1Gm8JrUUMjeRzpA2ulUqZSBGjjVXX
 IpbG5QukuipvJA1XxF7kNVEnNOcieG0tWkoT8kXSrZ7z4TLmtCKaP8PzZ3nN/y5Gi5fEIcN8
 v9G+cedkFh1QKL1W2BW/PlQWFbzrYMqRAiIo+E5l7458G1MtO2X+tmgw+9jIgdfpuGC43CBv
 Lso4U3PUNbTs64dnjozQF2vC9q0zh123xSdSU1XqlQGqfUTQYBP9XVWflzNPOHVYnZs0O2TG
 z9F2+7F25+DlIPVn+2r7E0mInNAqFYEbcI1W8QfkDbBfWgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTcRSH/b93V6uXJfXWkGoR3UgdZRyoJCLqzS70qaKgXPnSlm7JlpZF
 sKWLshQz1PKSS2vanGZbF60UUTSXpKvZzPBSo6KRlzC3Ulc2i74cHp7f4Xe+HAaX3CUXMCrN
 SUGrUSTKKBEh2r0+bfW3+UuUUYHCKPCNXSSg6J6VAmd1JQLrAwMG3pZt0O0fRDD5shOH/Fwn
 glsf+nB40NqPoL7iPAWuj7OgyzdCgSP3MgVpZfcoePU1gEFvXg4GlbZdMGD+TEB7dikG+V4K
 CvPTsOD4gsG42UKDWb8UPBUFNAQ+yMHR7yahudhBQv27VXDjZi8Fz+odBLTWejBwPSmioN86
 RUJ7axsB/iwpOK9mklA1XErBV78ZB7NvhIbXjSYMWk1zoSY92Hrh+28Snmc2YnDh9n0Munqe
 Imi4+B4Dm9VNQbNvEAO7LReHifIWBJ6sIRqMV8ZpKDRkIbhszCMgvTcaJn8GLxePycFQUkNA
 1S832hTDW29aEd88OILz6fZT/ITvDcXX+00E/6KU4+sK+mg+veEdzZtsyby9YiVf9syL8bdG
 fSRvs1yieNtoDs1nDHVh/HBHB70n/IBoQ7yQqEoRtJExcSJlt/0+lhTYeLqq2U/rkVeegUIZ
 jl3LlVe70DRT7DLu7dtxfJrD2EWcPfMzmYFEDM66Z3DdxT1/l+aw27kswx06AzEMwS7lqt9L
 prWYXcf9rK2j/nUu5CprGv/2hAb9r/IOYpolbDSXbaokspHIhEIsKEylSVErVInREboEZapG
 dTri6Am1DQUfyHwucLUWjbm2NSGWQbKZ4jbvYqWEVKToUtVNiGNwWZjY8DioxPGK1DOC9sRh
 bXKioGtCUoaQzRPH7hPiJOwxxUkhQRCSBO3/FGNCF+iR4F+2afMwEVMmzdsgd66J7VIP7Ij8
 9Can83iJp+WR89VUiHL5jyN49FmPfufE+CzjZITP6eg71ydv2rJxxHh7d9Qld8OiFZtfs1O/
 8VWWpHBARcY8zejW2LRId/n+gzV7CjpD7HH6hwWzLeShnusDlEv4JN17LVktTWkLL24YkhE6
 pUK+EtfqFH8ALWISYDwDAAA=
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

Currently, print nothing about what event wakes up in report.  However,
it makes hard to interpret dept's report.

Make it print wait's stacktrace that the event wakes up.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept.h     |  5 ++++
 include/linux/sched.h    |  2 ++
 kernel/dependency/dept.c | 59 ++++++++++++++++++++++++++++++++++------
 3 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index 10536418ab41..551168220954 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -226,6 +226,11 @@ struct dept_ecxt {
 			 */
 			unsigned long	event_ip;
 			struct dept_stack *event_stack;
+
+			/*
+			 * wait that this event ttwu
+			 */
+			struct dept_stack *ewait_stack;
 		};
 	};
 };
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 541ddacdc3d0..43927e61921b 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -865,6 +865,7 @@ struct dept_task {
 	const char			*stage_w_fn;
 	unsigned long			stage_ip;
 	bool				stage_timeout;
+	struct dept_stack		*stage_wait_stack;
 	arch_spinlock_t			stage_lock;
 
 	/*
@@ -906,6 +907,7 @@ struct dept_task {
 	.stage_w_fn = NULL,					\
 	.stage_ip = 0UL,					\
 	.stage_timeout = false,					\
+	.stage_wait_stack = NULL,				\
 	.stage_lock = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED,\
 	.missing_ecxt = 0,					\
 	.hardirqs_enabled = false,				\
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 27ca8f723ccc..278194093108 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -522,6 +522,7 @@ static void initialize_ecxt(struct dept_ecxt *e)
 	e->enirqf = 0UL;
 	e->event_ip = 0UL;
 	e->event_stack = NULL;
+	e->ewait_stack = NULL;
 }
 SET_CONSTRUCTOR(ecxt, initialize_ecxt);
 
@@ -577,6 +578,8 @@ static void destroy_ecxt(struct dept_ecxt *e)
 		put_stack(e->ecxt_stack);
 	if (e->event_stack)
 		put_stack(e->event_stack);
+	if (e->ewait_stack)
+		put_stack(e->ewait_stack);
 }
 SET_DESTRUCTOR(ecxt, destroy_ecxt);
 
@@ -793,6 +796,11 @@ static void print_dep(struct dept_dep *d)
 
 		pr_warn("[E] %s(%s:%d):\n", e_fn, fc_n, fc->sub_id);
 		print_ip_stack(e->event_ip, e->event_stack);
+
+		if (valid_stack(e->ewait_stack)) {
+			pr_warn("(wait to wake up)\n");
+			print_ip_stack(0, e->ewait_stack);
+		}
 	}
 
 	if (!irqf) {
@@ -806,6 +814,11 @@ static void print_dep(struct dept_dep *d)
 
 		pr_warn("[E] %s(%s:%d):\n", e_fn, fc_n, fc->sub_id);
 		print_ip_stack(e->event_ip, e->event_stack);
+
+		if (valid_stack(e->ewait_stack)) {
+			pr_warn("(wait to wake up)\n");
+			print_ip_stack(0, e->ewait_stack);
+		}
 	}
 }
 
@@ -1656,7 +1669,8 @@ static void add_wait(struct dept_class *c, unsigned long ip,
 
 static struct dept_ecxt_held *add_ecxt(struct dept_map *m,
 		struct dept_class *c, unsigned long ip, const char *c_fn,
-		const char *e_fn, int sub_l)
+		const char *e_fn, int sub_l,
+		struct dept_stack *ewait_stack)
 {
 	struct dept_task *dt = dept_task();
 	struct dept_ecxt_held *eh;
@@ -1690,6 +1704,7 @@ static struct dept_ecxt_held *add_ecxt(struct dept_map *m,
 	e->class = get_class(c);
 	e->ecxt_ip = ip;
 	e->ecxt_stack = ip ? get_current_stack() : NULL;
+	e->ewait_stack = ewait_stack ? get_stack(ewait_stack) : NULL;
 	e->event_fn = e_fn;
 	e->ecxt_fn = c_fn;
 
@@ -1796,7 +1811,7 @@ static int find_hist_pos(unsigned int wg)
 
 static void do_event(struct dept_map *m, struct dept_map *real_m,
 		struct dept_class *c, unsigned int wg, unsigned long ip,
-		const char *e_fn)
+		const char *e_fn, struct dept_stack *ewait_stack)
 {
 	struct dept_task *dt = dept_task();
 	struct dept_wait_hist *wh;
@@ -1824,7 +1839,7 @@ static void do_event(struct dept_map *m, struct dept_map *real_m,
 	 */
 	if (find_ecxt_pos(real_m, c, false) != -1)
 		return;
-	eh = add_ecxt(m, c, 0UL, NULL, e_fn, 0);
+	eh = add_ecxt(m, c, 0UL, NULL, e_fn, 0, ewait_stack);
 
 	if (!eh)
 		return;
@@ -2361,7 +2376,8 @@ static void __dept_wait(struct dept_map *m, unsigned long w_f,
  */
 static void __dept_event(struct dept_map *m, struct dept_map *real_m,
 		unsigned long e_f, unsigned long ip, const char *e_fn,
-		bool sched_map, unsigned int wg)
+		bool sched_map, unsigned int wg,
+		struct dept_stack *ewait_stack)
 {
 	struct dept_class *c;
 	struct dept_key *k;
@@ -2383,7 +2399,7 @@ static void __dept_event(struct dept_map *m, struct dept_map *real_m,
 	c = check_new_class(&m->map_key, k, sub_id(m, e), m->name, sched_map);
 
 	if (c)
-		do_event(m, real_m, c, wg, ip, e_fn);
+		do_event(m, real_m, c, wg, ip, e_fn, ewait_stack);
 }
 
 void dept_wait(struct dept_map *m, unsigned long w_f,
@@ -2499,6 +2515,9 @@ static void __dept_clean_stage(struct dept_task *dt)
 	dt->stage_w_fn = NULL;
 	dt->stage_ip = 0UL;
 	dt->stage_timeout = false;
+	if (dt->stage_wait_stack)
+		put_stack(dt->stage_wait_stack);
+	dt->stage_wait_stack = NULL;
 }
 
 void dept_clean_stage(void)
@@ -2562,6 +2581,14 @@ void dept_request_event_wait_commit(void)
 
 	wg = next_wgen();
 	WRITE_ONCE(dt->stage_m.wgen, wg);
+
+	/*
+	 * __schedule() can be hit multiple times between
+	 * dept_stage_wait() and dept_clean_stage().  In that case,
+	 * keep the first stacktrace only.  That's enough.
+	 */
+	if (!dt->stage_wait_stack)
+		dt->stage_wait_stack = get_current_stack();
 	arch_spin_unlock(&dt->stage_lock);
 
 	__dept_wait(&dt->stage_m, 1UL, ip, w_fn, 0, true, sched_map, timeout);
@@ -2580,6 +2607,7 @@ void dept_ttwu_stage_wait(struct task_struct *requestor, unsigned long ip)
 	struct dept_map m;
 	struct dept_map *real_m;
 	bool sched_map;
+	struct dept_stack *ewait_stack;
 
 	if (unlikely(!dept_working()))
 		return;
@@ -2598,6 +2626,10 @@ void dept_ttwu_stage_wait(struct task_struct *requestor, unsigned long ip)
 	m = dt_req->stage_m;
 	sched_map = dt_req->stage_sched_map;
 	real_m = dt_req->stage_real_m;
+	ewait_stack = dt_req->stage_wait_stack;
+	if (ewait_stack)
+		get_stack(ewait_stack);
+
 	__dept_clean_stage(dt_req);
 	arch_spin_unlock(&dt_req->stage_lock);
 
@@ -2608,8 +2640,12 @@ void dept_ttwu_stage_wait(struct task_struct *requestor, unsigned long ip)
 	if (!m.keys)
 		goto exit;
 
-	__dept_event(&m, real_m, 1UL, ip, "try_to_wake_up", sched_map, m.wgen);
+	__dept_event(&m, real_m, 1UL, ip, "try_to_wake_up", sched_map,
+			m.wgen, ewait_stack);
 exit:
+	if (ewait_stack)
+		put_stack(ewait_stack);
+
 	dept_exit(flags);
 }
 
@@ -2689,7 +2725,7 @@ void dept_map_ecxt_modify(struct dept_map *m, unsigned long e_f,
 	k = m->keys ?: &m->map_key;
 	c = check_new_class(&m->map_key, k, sub_id(m, new_e), m->name, false);
 
-	if (c && add_ecxt(m, c, new_ip, new_c_fn, new_e_fn, new_sub_l))
+	if (c && add_ecxt(m, c, new_ip, new_c_fn, new_e_fn, new_sub_l, NULL))
 		goto exit;
 
 	/*
@@ -2741,7 +2777,7 @@ void dept_ecxt_enter(struct dept_map *m, unsigned long e_f, unsigned long ip,
 	k = m->keys ?: &m->map_key;
 	c = check_new_class(&m->map_key, k, sub_id(m, e), m->name, false);
 
-	if (c && add_ecxt(m, c, ip, c_fn, e_fn, sub_l))
+	if (c && add_ecxt(m, c, ip, c_fn, e_fn, sub_l, NULL))
 		goto exit;
 missing_ecxt:
 	dt->missing_ecxt++;
@@ -2841,7 +2877,7 @@ void dept_event(struct dept_map *m, unsigned long e_f,
 
 	flags = dept_enter();
 
-	__dept_event(m, m, e_f, ip, e_fn, false, READ_ONCE(*wg_p));
+	__dept_event(m, m, e_f, ip, e_fn, false, READ_ONCE(*wg_p), NULL);
 
 	/*
 	 * Keep the map diabled until the next sleep.
@@ -2913,6 +2949,11 @@ void dept_task_exit(struct task_struct *t)
 		dt->stack = NULL;
 	}
 
+	if (dt->stage_wait_stack) {
+		put_stack(dt->stage_wait_stack);
+		dt->stage_wait_stack = NULL;
+	}
+
 	for (i = 0; i < dt->ecxt_held_pos; i++) {
 		if (dt->ecxt_held[i].class) {
 			put_class(dt->ecxt_held[i].class);
-- 
2.17.1

