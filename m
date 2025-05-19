Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB3ABB87E
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752E910E28C;
	Mon, 19 May 2025 09:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9E6310E1FB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:40 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-70-682af76d4e9d
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
Subject: [PATCH v16 03/42] dept: add single event dependency tracker APIs
Date: Mon, 19 May 2025 18:17:47 +0900
Message-Id: <20250519091826.19752-4-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSWUwTYRDH/Xa3u22huKnXKhq0EQ+MKF6ZGM948Pmg8YoPGpVGVtsI1bSK
 oMGAHHJ7JEAUrLVIbWiR2qLiUYIQLg9EwXIIKKgEwhXRVkE8CpGXyS8z8//NywhJaZVghlCp
 OsWrVfIQGS2mxH2e+sWqH36KpfkDc8D5PYGC7AIzDbV3TQjMhdEEdJcHQoOrF8GvV69JyEyv
 RXCrvZWEwoo2BHbjBRrqPntBvXOAhur0ZBpicgpoeNMzQkBLxlUCTNbt8MHQScGLy3oCMrtp
 yMqMIdyli4AhQx4Dhihf6DBeZ2CkPQCq2xwCsDcvgmvaFhqe2qspqCjqIKDucTYNbea/AnhR
 UUWBK80baq+kCiC/X09Dj8tAgsE5wMDbEh0BFbqpYIl1C+O//RFAZWoJAfG37xFQ3/QEQXHC
 RwKsZgcNZc5eAmzWdBKG75Qj6EjrYyAuZYiBrOg0BMlxGRTEtqyEXz/dl298D4DomxYK8n87
 0Ia12Kw1I1zWO0DiWNsZPOx8R2O7S0fh53oOP7reyuDY4mYG66ynsc3oh3OedhP41qBTgK15
 iTS2Dl5lcFJfPYH7a2qYnTP3i9cE8yHKMF69ZF2QWPHtTQF58iUXrm+zUFHINikJiYQcu4Kr
 evgQjbOzrokaZZqdzzU2DpGjPJmdzdlSOwVJSCwkWYcH13CjaSwwid3G5TpqxgIU68sN2h/Q
 oyxhV3JV9y79l/pwJkvJmEjEruKak8vG+lL3Tr1JS41KOTZLxP18a/kfmM49MzZSl5FEhybk
 IalSFRYqV4as8FdEqJTh/kdOhFqR+78MkSMHitBg7Z5SxAqRzFNisS9USAXyME1EaCnihKRs
 siTPtkAhlQTLI87y6hOH1adDeE0p8hZSsmmSZa4zwVL2mPwUf5znT/Lq8SkhFM2IQtrdre1I
 XZj7O6txb9S81+8OafdVWjZvvd8/uzgmZjhyy4NkyZevu1ZvGOn+8inFdLD9qGRj4qvlc6Z5
 SX2au/YGpbV6LnJWn4e5kRfBE3/0PR+XQRsmvt+xPmVWz/3yHecKNjV4G70e25ZNSfWwBSVu
 tvcY/4iGf+BAqkiT8CzbRyqjNAp5gB+p1sj/AV5ct3JbAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSW0xTaRDH/c6das1JJXq8BdPEqBgvGKtDNIT4IJ+a3bjG4OVFGz3axoLY
 CopmI9iCLFAQIrCiYEGtWIqUFu+UIChaLwiCRQhWIayCoESkrBUUC8aXyS/zn/nNy3CkzELP
 4tTRh0VttFIjZySU5M81+iWa/4NVy1uzAbxDKRScL7cy0HitFIG1MpGA3gcR0Drcj2Dk2XMS
 8nIaERR1viahst6DwFlykoHm7qnQ4h1gwJWTxoD+YjkDTX2jBHTkZhNQav8D3pjfUfDkdDEB
 eb0MnMvTE/7SQ4DPbGHBnDAfukryWRjtDAGXx01DXYGLBmf7Yjhb2MFAldNFQf2tLgKa75xn
 wGMdo+FJ/SMKhjNmQ2OWkYayT8UM9A2bSTB7B1h4UWMioN40HWwGvzX5yw8aHhprCEi+VEFA
 S9tdBNUpbwmwW90M1Hn7CXDYc0j4duUBgq6MjywkpftYOJeYgSAtKZcCQ4cCRr76LxcMhUDi
 BRsFZd/dKDwMWwutCNf1D5DY4DiCv3lfMtg5bKLw42IB385/zWJDdTuLTfZY7CgJxhereglc
 NOilsd3yD4Ptg9ksTv3YQuBPDQ3s5rk7JWv3ihp1nKhdFrZbovrSVE7GPBWOFntsVAJyTEtF
 AZzArxS8zW3UODP8AuHVKx85zoH8PMFhfEenIglH8u7JQmtBGxoPpvEbhMvuhokFip8vDDpv
 MOMs5RXCo4pM9EsaJJTaaiZEAfwqoT2tbqIv88+0lBZSp5HEhCZZUKA6Oi5KqdYoluoOqOKj
 1UeX7jkYZUf+DzL/PZp1Cw01R9QinkPyKVKbc5FKRivjdPFRtUjgSHmg1OJYqJJJ9yrjj4na
 g7u0sRpRV4tmc5R8hnTjNnG3jN+vPCweEMUYUfs7JbiAWQlo/fvH2SVhc9Kn/3V8pjFra9Cm
 8BlBJ07d69zi6r+Px/IjNpcd8awLtd8c3FHZLSXXNRlWrc46k/6f4qqy73pkQLcvcju3KOlu
 rr5t/79FxorMrytCZUW96fqx2Ji3oRkjTaNJ+sU+uiL5ekrm2Z6b+w6tGLn6QVHl2Hcq/Pvn
 7hs9c6rllE6lDAkmtTrlTyrxfgA9AwAA
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

Wrapped the base APIs for easier annotation on wait and event.  Start
with supporting waiters on each single event.  More general support for
multiple events is a future work.  Do more when the need arises.

How to annotate:

1. Initaialize a map for the interesting wait.

   /*
    * Place along with the wait instance.
    */
   struct dept_map my_wait;

   /*
    * Place in the initialization code.
    */
   sdt_map_init(&my_wait);

2. Place the following at the wait code.

   sdt_wait(&my_wait);

3. Place the following at the event code.

   sdt_event(&my_wait);

That's it!

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept_sdt.h | 65 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 include/linux/dept_sdt.h

diff --git a/include/linux/dept_sdt.h b/include/linux/dept_sdt.h
new file mode 100644
index 000000000000..0535f763b21b
--- /dev/null
+++ b/include/linux/dept_sdt.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Single-event Dependency Tracker
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
+ *  Copyright (c) 2024 SK hynix, Inc., Byungchul Park
+ */
+
+#ifndef __LINUX_DEPT_SDT_H
+#define __LINUX_DEPT_SDT_H
+
+#include <linux/kernel.h>
+#include <linux/dept.h>
+
+#ifdef CONFIG_DEPT
+#define sdt_map_init(m)							\
+	do {								\
+		static struct dept_key __key;				\
+		dept_map_init(m, &__key, 0, #m);			\
+	} while (0)
+
+#define sdt_map_init_key(m, k)		dept_map_init(m, k, 0, #m)
+
+#define sdt_wait(m)							\
+	do {								\
+		dept_request_event(m);					\
+		dept_wait(m, 1UL, _THIS_IP_, __func__, 0);		\
+	} while (0)
+
+/*
+ * sdt_might_sleep() and its family will be committed in __schedule()
+ * when it actually gets to __schedule(). Both dept_request_event() and
+ * dept_wait() will be performed on the commit.
+ */
+
+/*
+ * Use the code location as the class key if an explicit map is not used.
+ */
+#define sdt_might_sleep_start(m)					\
+	do {								\
+		struct dept_map *__m = m;				\
+		static struct dept_key __key;				\
+		dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__);\
+	} while (0)
+
+#define sdt_might_sleep_end()		dept_clean_stage()
+
+#define sdt_ecxt_enter(m)		dept_ecxt_enter(m, 1UL, _THIS_IP_, "start", "event", 0)
+#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, __func__)
+#define sdt_ecxt_exit(m)		dept_ecxt_exit(m, 1UL, _THIS_IP_)
+#define sdt_request_event(m)		dept_request_event(m)
+#else /* !CONFIG_DEPT */
+#define sdt_map_init(m)			do { } while (0)
+#define sdt_map_init_key(m, k)		do { (void)(k); } while (0)
+#define sdt_wait(m)			do { } while (0)
+#define sdt_might_sleep_start(m)	do { } while (0)
+#define sdt_might_sleep_end()		do { } while (0)
+#define sdt_ecxt_enter(m)		do { } while (0)
+#define sdt_event(m)			do { } while (0)
+#define sdt_ecxt_exit(m)		do { } while (0)
+#define sdt_request_event(m)		do { } while (0)
+#endif
+#endif /* __LINUX_DEPT_SDT_H */
-- 
2.17.1

