Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A2085D444
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A4110E6B4;
	Wed, 21 Feb 2024 09:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id C53AE10E6A8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:49:52 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-f8-65d5c73b58e0
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
Subject: [PATCH v12 23/27] dept: Make Dept able to work with an external wgen
Date: Wed, 21 Feb 2024 18:49:29 +0900
Message-Id: <20240221094933.36348-24-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240221094933.36348-1-byungchul@sk.com>
References: <20240221094933.36348-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUiTaxjHvZ93l6uHFXSfCspFHSgtjYyL3qHC+4sRRcU5B6qVT22k5pnv
 QaC5ymbKKtRKyWm2lq5cm5GWK1PSlplm0zxhlp7ezJlhbWSul83oy8WP6/r/f58ugVbUsTME
 TUKypE1QxSk5GSMbDikLX9HSJUW0O0Ph5IkI8HzOYaCk2sJBx9UqBJaaLAoG70XDU68bwXhb
 Ow1FBR0Iyvqf01DT3IfAYT7MwZNXk8HlGeHAWZDLQfaFag4eD/ko6C08RUGVLQZaDeUUNIy9
 ZaBokIPiomzKP95RMGaq5MGUOQ8GzOd48PVHgrOvmwXHs4Vw9nwvB/UOJwPNtQMUPLlZwkGf
 5QcLrc33Geg4mcfClQ/lHAx5TTSYPCM8dDYYKbDq/KKjn76z0JLXQMHRimsUuP67heB2zksK
 bJZuDpo8bgrstgIavl66h2Agf5iHIyfGeCjOykeQe6SQgfZvLSzoeqNg/EsJt3Y5aXKP0ERn
 TyMOr5EhD8oxqTv3nCe62894YrSlELt5AblQP0iRslEPS2yVxzliGz3FE/2wiyIfHj3iyf0z
 4wx55SqiNs38W7YyVorTpEraxat3ydQ177roRP2a9BrDZToTuZfokSBgcSnObdquR8ETaO1/
 QQeYE//EPT1jEzxNnIPteW9YPZIJtHhsEjZ/bOMC3aliDL7j2xrIMOI8XNuqYwMsF5fhToeT
 ++WcjausDROeYP/+crF7IqMQo3DX4+t0wInF7GA8aO1lfhX+wHfNPYwByY0oqBIpNAmp8SpN
 3NJF6owETfqiPQfibcj/UKZDvn9q0WjHlkYkCkgZIlffcEkKVpWalBHfiLBAK6fJmTT/Sh6r
 yjgoaQ/s1KbESUmNaKbAKKfLl3jTYhXiPlWytF+SEiXt7yslBM/IRDnC3L3WVf/X/wthrF2L
 S3emXAqfv3kyHxKtrugDb/JGRZtx2a0pkV9UJr3za4ki76FRsWn2ML5rmBSbs3zL7qD1WU99
 qa/r5xqMn2J2hG4I73mR/iO6qv/0SxIRtC2/Oz10wHIxNKqzujus9P3DqxVD1xL/qsPyWTLj
 uoqwxYX5SiZJrYpcQGuTVD8BAivVvEwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTYRiGe9/v6Gr1saQ+LDAGHehokfWA0eFXb0UHiggq0JUfbXnIttKM
 AstZNrW0UEstbNY0XWnfDK2cLcXDksx0WtkylU7SzE6TTDtMoz8PF/d9c/16eEqVxwTwuuhD
 kj5aE6lmFbRiU0jigpCGdimoOmM8ZKQGgfd7Mg15pVYWWm6VILCWn8DQV7cWng16EAw/fkJB
 dmYLgqs9rygor+9CYC86yULbm4ng8g6w4MxMYSGxoJSFpx9HMLizzmMokTdCU7oZg2PoPQ3Z
 fSzkZidi3/mAYchSzIElYSb0FuVwMNKzGJxdHQzUXnYyYO+cB5euuFmosjtpqK/sxdB2L4+F
 LusfBprqG2loyUhj4OYnMwsfBy0UWLwDHLQ68jGUGX22U99+M9CQ5sBw6tptDK4X9xFUJ3dj
 kK0dLNR6PRhsciYFPwvrEPSe7ecgKXWIg9wTZxGkJGXR8ORXAwNGdzAM/8hjV4eQWs8ARYy2
 OGIfzKfJI7NI7ua84oixupMj+fJhYiuaSwqq+jC5+tXLELn4DEvkr+c5Yup3YfKpuZkjjReH
 afLGlY23TN+pWBEuRepiJf2ilWEKbfmHdirGtOpIefoNKgF5lpiQHy8KS8WyntfUKLPCbPH5
 86Ex9hdmiLa0d4wJKXhKOD1eLPr8mDUhnp8sbBQfjGwf3dDCTLGyyciMslJYJrbanew/Z6BY
 UuYY8/j58hu5nrGNSggW25/eodKRIh+NK0b+uujYKI0uMnihIUIbH607snDvgSgZ+X7Gcnwk
 oxJ9b1tbgwQeqScotRUuScVoYg3xUTVI5Cm1v5KO80XKcE38UUl/IFR/OFIy1KBpPK2eqly/
 QwpTCfs0h6QISYqR9P9bzPsFJKCC+bjWYEld1TrjS9LWKmtWDB8Qvr9h/rYLok1rthWuuF5j
 fVbROC+BCw1NnDPLPWhL7lC57X86u5sm9QtTutdvWPcyyxwfWBoTVyg99AY6oHlNjpx07Jx6
 e1jZns0VdZ/lgrSI5fdbi5cEBO1etFLY8Dal0x6xg7ywHb98cJdlk5o2aDWL51J6g+Yv+4ut
 jC8DAAA=
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

There is a case where total maps for its wait/event is so large in size.
For instance, struct page for PG_locked and PG_writeback is the case.
The additional memory size for the maps would be 'the # of pages *
sizeof(struct dept_map)' if each struct page keeps its map all the way,
which might be too big to accept.

It'd be better to keep the minimum data in the case, which is timestamp
called 'wgen' that Dept makes use of. So made Dept able to work with an
external wgen when needed.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept.h     | 18 ++++++++++++++----
 include/linux/dept_sdt.h |  4 ++--
 kernel/dependency/dept.c | 30 +++++++++++++++++++++---------
 3 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index 0280e45cc2af..dea53ad5b356 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -482,6 +482,13 @@ struct dept_task {
 	bool				in_sched;
 };
 
+/*
+ * for subsystems that requires compact use of memory e.g. struct page
+ */
+struct dept_ext_wgen{
+	unsigned int wgen;
+};
+
 #define DEPT_TASK_INITIALIZER(t)				\
 {								\
 	.wait_hist = { { .wait = NULL, } },			\
@@ -512,6 +519,7 @@ extern void dept_task_exit(struct task_struct *t);
 extern void dept_free_range(void *start, unsigned int sz);
 extern void dept_map_init(struct dept_map *m, struct dept_key *k, int sub_u, const char *n);
 extern void dept_map_reinit(struct dept_map *m, struct dept_key *k, int sub_u, const char *n);
+extern void dept_ext_wgen_init(struct dept_ext_wgen *ewg);
 extern void dept_map_copy(struct dept_map *to, struct dept_map *from);
 
 extern void dept_wait(struct dept_map *m, unsigned long w_f, unsigned long ip, const char *w_fn, int sub_l, long timeout);
@@ -521,8 +529,8 @@ extern void dept_clean_stage(void);
 extern void dept_stage_event(struct task_struct *t, unsigned long ip);
 extern void dept_ecxt_enter(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *c_fn, const char *e_fn, int sub_l);
 extern bool dept_ecxt_holding(struct dept_map *m, unsigned long e_f);
-extern void dept_request_event(struct dept_map *m);
-extern void dept_event(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *e_fn);
+extern void dept_request_event(struct dept_map *m, struct dept_ext_wgen *ewg);
+extern void dept_event(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *e_fn, struct dept_ext_wgen *ewg);
 extern void dept_ecxt_exit(struct dept_map *m, unsigned long e_f, unsigned long ip);
 extern void dept_sched_enter(void);
 extern void dept_sched_exit(void);
@@ -551,6 +559,7 @@ extern void dept_hardirqs_off(void);
 struct dept_key  { };
 struct dept_map  { };
 struct dept_task { };
+struct dept_ext_wgen { };
 
 #define DEPT_MAP_INITIALIZER(n, k) { }
 #define DEPT_TASK_INITIALIZER(t)   { }
@@ -563,6 +572,7 @@ struct dept_task { };
 #define dept_free_range(s, sz)				do { } while (0)
 #define dept_map_init(m, k, su, n)			do { (void)(n); (void)(k); } while (0)
 #define dept_map_reinit(m, k, su, n)			do { (void)(n); (void)(k); } while (0)
+#define dept_ext_wgen_init(wg)				do { } while (0)
 #define dept_map_copy(t, f)				do { } while (0)
 
 #define dept_wait(m, w_f, ip, w_fn, sl, t)		do { (void)(w_fn); } while (0)
@@ -572,8 +582,8 @@ struct dept_task { };
 #define dept_stage_event(t, ip)				do { } while (0)
 #define dept_ecxt_enter(m, e_f, ip, c_fn, e_fn, sl)	do { (void)(c_fn); (void)(e_fn); } while (0)
 #define dept_ecxt_holding(m, e_f)			false
-#define dept_request_event(m)				do { } while (0)
-#define dept_event(m, e_f, ip, e_fn)			do { (void)(e_fn); } while (0)
+#define dept_request_event(m, wg)			do { } while (0)
+#define dept_event(m, e_f, ip, e_fn, wg)		do { (void)(e_fn); } while (0)
 #define dept_ecxt_exit(m, e_f, ip)			do { } while (0)
 #define dept_sched_enter()				do { } while (0)
 #define dept_sched_exit()				do { } while (0)
diff --git a/include/linux/dept_sdt.h b/include/linux/dept_sdt.h
index 21fce525f031..8cdac7982036 100644
--- a/include/linux/dept_sdt.h
+++ b/include/linux/dept_sdt.h
@@ -24,7 +24,7 @@
 
 #define sdt_wait_timeout(m, t)						\
 	do {								\
-		dept_request_event(m);					\
+		dept_request_event(m, NULL);				\
 		dept_wait(m, 1UL, _THIS_IP_, __func__, 0, t);		\
 	} while (0)
 #define sdt_wait(m) sdt_wait_timeout(m, -1L)
@@ -49,7 +49,7 @@
 #define sdt_might_sleep_end()		dept_clean_stage()
 
 #define sdt_ecxt_enter(m)		dept_ecxt_enter(m, 1UL, _THIS_IP_, "start", "event", 0)
-#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, __func__)
+#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, __func__, NULL)
 #define sdt_ecxt_exit(m)		dept_ecxt_exit(m, 1UL, _THIS_IP_)
 #else /* !CONFIG_DEPT */
 #define sdt_map_init(m)			do { } while (0)
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 5c996f11abd5..fb33c3758c25 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -2186,6 +2186,11 @@ void dept_map_reinit(struct dept_map *m, struct dept_key *k, int sub_u,
 }
 EXPORT_SYMBOL_GPL(dept_map_reinit);
 
+void dept_ext_wgen_init(struct dept_ext_wgen *ewg)
+{
+	ewg->wgen = 0U;
+}
+
 void dept_map_copy(struct dept_map *to, struct dept_map *from)
 {
 	if (unlikely(!dept_working())) {
@@ -2371,7 +2376,7 @@ static void __dept_wait(struct dept_map *m, unsigned long w_f,
  */
 static void __dept_event(struct dept_map *m, unsigned long e_f,
 			 unsigned long ip, const char *e_fn,
-			 bool sched_map)
+			 bool sched_map, unsigned int wg)
 {
 	struct dept_class *c;
 	struct dept_key *k;
@@ -2393,7 +2398,7 @@ static void __dept_event(struct dept_map *m, unsigned long e_f,
 	c = check_new_class(&m->map_key, k, sub_id(m, e), m->name, sched_map);
 
 	if (c && add_ecxt(m, c, 0UL, NULL, e_fn, 0)) {
-		do_event(m, c, READ_ONCE(m->wgen), ip);
+		do_event(m, c, wg, ip);
 		pop_ecxt(m, c);
 	}
 }
@@ -2606,7 +2611,7 @@ void dept_stage_event(struct task_struct *requestor, unsigned long ip)
 	if (!m.keys)
 		goto exit;
 
-	__dept_event(&m, 1UL, ip, "try_to_wake_up", sched_map);
+	__dept_event(&m, 1UL, ip, "try_to_wake_up", sched_map, m.wgen);
 exit:
 	dept_exit(flags);
 }
@@ -2785,10 +2790,11 @@ bool dept_ecxt_holding(struct dept_map *m, unsigned long e_f)
 }
 EXPORT_SYMBOL_GPL(dept_ecxt_holding);
 
-void dept_request_event(struct dept_map *m)
+void dept_request_event(struct dept_map *m, struct dept_ext_wgen *ewg)
 {
 	unsigned long flags;
 	unsigned int wg;
+	unsigned int *wg_p;
 
 	if (unlikely(!dept_working()))
 		return;
@@ -2801,21 +2807,25 @@ void dept_request_event(struct dept_map *m)
 	 */
 	flags = dept_enter_recursive();
 
+	wg_p = ewg ? &ewg->wgen : &m->wgen;
+
 	/*
 	 * Avoid zero wgen.
 	 */
 	wg = atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
-	WRITE_ONCE(m->wgen, wg);
+	WRITE_ONCE(*wg_p, wg);
 
 	dept_exit_recursive(flags);
 }
 EXPORT_SYMBOL_GPL(dept_request_event);
 
 void dept_event(struct dept_map *m, unsigned long e_f,
-		unsigned long ip, const char *e_fn)
+		unsigned long ip, const char *e_fn,
+		struct dept_ext_wgen *ewg)
 {
 	struct dept_task *dt = dept_task();
 	unsigned long flags;
+	unsigned int *wg_p;
 
 	if (unlikely(!dept_working()))
 		return;
@@ -2823,24 +2833,26 @@ void dept_event(struct dept_map *m, unsigned long e_f,
 	if (m->nocheck)
 		return;
 
+	wg_p = ewg ? &ewg->wgen : &m->wgen;
+
 	if (dt->recursive) {
 		/*
 		 * Dept won't work with this even though an event
 		 * context has been asked. Don't make it confused at
 		 * handling the event. Disable it until the next.
 		 */
-		WRITE_ONCE(m->wgen, 0U);
+		WRITE_ONCE(*wg_p, 0U);
 		return;
 	}
 
 	flags = dept_enter();
 
-	__dept_event(m, e_f, ip, e_fn, false);
+	__dept_event(m, e_f, ip, e_fn, false, READ_ONCE(*wg_p));
 
 	/*
 	 * Keep the map diabled until the next sleep.
 	 */
-	WRITE_ONCE(m->wgen, 0U);
+	WRITE_ONCE(*wg_p, 0U);
 
 	dept_exit(flags);
 }
-- 
2.17.1

