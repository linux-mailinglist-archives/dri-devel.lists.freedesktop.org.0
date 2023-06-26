Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431073EC7A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F85C10E258;
	Mon, 26 Jun 2023 21:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id A2EDD10E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:54 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-6b-64997d6ca482
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 13/25] dept: Distinguish each work from another
Date: Mon, 26 Jun 2023 20:56:48 +0900
Message-Id: <20230626115700.13873-14-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSe0xTdxQHcH/38bu3lZKb+rqiUVNDzPCFBuXojBpN9P7hazOaBTelsXej
 kSJpAUFDgloXaYUIUguCSymuNlBBCyGolADy9EUdhAEWBOILBUmYrSAIK6j/nHxyzsn3/HNY
 Ul5FB7HqmDhRG6OMVmApJR0KyF+tSc5RhU6dhoxLoeD9eJGCvBIHBndxEQJH2VkCBup3w7++
 QQTjT1pIMJvcCPL7ukkoa+hB4LKfw9D6MhDavMMYmk1GDOcLSjA8ez9BgOdqJgFFzr3w6LKV
 gOqxNxSYBzDkms8T/vKWgDFbIQO2lGDot19jYKJvHTT3tNPg6loJOX95MFS6miloqOgnoPVe
 HoYexxQNjxqaKHBnpNFw64MVw3ufjQSbd5iBf6otBNzW+4PeTbgI+PO/SRoa06r9unGHgLbO
 +wiqLvYS4HS0Y3jgHSSg1Gki4fPNegT96UMMXLg0xkDu2XQExgtXKWj50kiD3rMBxkfz8PYf
 hQeDw6SgLz0luHwWSnho5YW717oZQV/VxQgWZ7xQag8RCioHCCF/xEsLzsJULDhHMhnBMNRG
 CJ72Six8ePqUEZqyx6kDiyOkW1RitDpB1K7dGimNuuOexLEf5ySacv+mU1A5Z0ASlufCePvr
 GvTdI6/uktPG3Aq+o2NsxnO5ZXxp2mvagKQsyRXM5t801THTgzncTr7elzVjigvm6xr11LRl
 3EY+3VqMv4Yu5YtuV88ESfz9+4+tM8fk3Ab+nKf2284VCT95I/yrF/I19g7qMpJZ0KxCJFfH
 JGiU6uiwNVFJMerENcdPapzI/1W25IkjFWjEfbAWcSxSBMhCl2Sr5LQyQZekqUU8SyrmyuaP
 mlVymUqZdFrUnjymjY8WdbVoEUspFsjW+06p5NwfyjjxhCjGitrvU4KVBKWgVfd+GQ0xX38c
 H1kfYawJ2ny8axnbGfm7xmhR9YZLg7OLCnW2M1nil+d9B1MNOwIDUg9kZWQvDhyoWL3HuPzo
 VsmCFw3kLlOd5p0rvHz29n3HEonx/Zu6f2vd/6m8JO+nX1terMwvC+s0dHRqfz48z6RNDvih
 PNbRuynzunRb3NShJFZB6aKU60JIrU75Pw6yyNRRAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSe0iTexgHcH/v5ffOt9Z5WWJvdmXnSKeijkbGE4UE3X4YWRBR+Ef10l5y
 OE02XRpFpqvMmmQ1l6lhs5aop3TaoYsT07x13UmxC9NqXcy8kTnL1Goa/fPw4fuF71+PglbZ
 2CCFNi5B1sdJOjXmGT5yRdoi3cEcTUi25y/IOhkC3sF0BvKulWJwXS1BUFp5mIKu+vXwdKgH
 wcjDxzRYLS4EF1+301DZ0IHAWZSKoeXtFGj19mNotpzAkFZ4DcP/3aMUuLNPU1Di2Aj3T9ko
 qBnuZMDahSHXmkb5zgcKhu3FHNhTgsFTdJ6D0deh0NzRxkJdfjMLzhcLIeeCG0OVs5mBhhse
 Clpu5WHoKP3Bwv2GJgZcWWYW/u2zYegestNg9/Zz8KSmgIIyk2/t46iTgqOfv7PQaK7x6VI5
 Ba3PbyOoTn9FgaO0DUOdt4eCCoeFhm9X6hF4Mns5OHJymIPcw5kIThzJZuDxWCMLJncYjHzN
 w6tWkrqefpqYKvYR51ABQ+7ZRHLzfDtHTNUvOFLgSCQVRQtIYVUXRS4OeFniKD6OiWPgNEcy
 elsp4m6rwqTv0SOONJ0bYTbPiuJXamSd1ijr/wnfxUeXu77j+MGpSZbcy2wK+k/IQP4KUVgq
 Dry7SY8bC/PEZ8+GJxwgzBUrzO/ZDMQraKFwktjZdJcbL6YKq8X6obMTZoRg8W6jiRm3Ulgm
 Ztqu4l+jc8SSspqJIX9ffvuBDY1bJYSJqe5afArxBcivGAVo44yxklYXttgQE50cp01avHtv
 rAP5Psd+cDTrBhpsWV+LBAVST1aGzD6nUbGS0ZAcW4tEBa0OUAZ+tWpUSo2UvF/W792pT9TJ
 hlo0Q8Gopykjtsm7VMIeKUGOkeV4Wf+7pRT+QSnILPfihUmfjvW1bEiIGcv55vXmbEoM3LP2
 0Fjj1k/lgV+uT34ZXD0z8clSV8n8sukR4d7wo+mh0sczUV+K3vBRkZ0kqN38Jz9pvpQanNXm
 xxxoT00e88uPWMPHTzN0xSy3zltXuSNs5M6WtdvFJZv+2GbUddvv+M8pNEYNWpgLf0d61Iwh
 WgpdQOsN0k8Tj+VLNQMAAA==
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
index 07895deca271..69c4f464d017 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -51,6 +51,7 @@
 #include <linux/sched/isolation.h>
 #include <linux/nmi.h>
 #include <linux/kvm_para.h>
+#include <linux/dept.h>
 
 #include "workqueue_internal.h"
 
@@ -2199,6 +2200,8 @@ __acquires(&pool->lock)
 
 	lockdep_copy_map(&lockdep_map, &work->lockdep_map);
 #endif
+	dept_work_enter();
+
 	/* ensure we're on the correct CPU */
 	WARN_ON_ONCE(!(pool->flags & POOL_DISASSOCIATED) &&
 		     raw_smp_processor_id() != pool->cpu);
-- 
2.17.1

