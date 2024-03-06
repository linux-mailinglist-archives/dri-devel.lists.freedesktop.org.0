Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A8873151
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0C511300B;
	Wed,  6 Mar 2024 08:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6FA410EC05
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:55:27 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-59-65e82f7c4dfc
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
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 hdanton@sina.com, her0gyugyu@gmail.com
Subject: [PATCH v13 03/27] dept: Add single event dependency tracker APIs
Date: Wed,  6 Mar 2024 17:54:49 +0900
Message-Id: <20240306085513.41482-4-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306085513.41482-1-byungchul@sk.com>
References: <20240306085513.41482-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0xTZxgH8L3vOec9h8YuJ5XEIyZiqmSLxguLLo/xmizTVxPNksXEzXhp
 4EQaC2qhXBQJyiV4waIJVoFhQe0qraKn9W5NrQNFB8PRKCKiICqEa9BWKkRt3fzy5Jc8/+f/
 6REYjZuLEfQpabIxRWfQEhWrGphQNXvP3B553usiAY4cmgeBd0UsVNQ6CTSfdyBwuvdi6K1b
 CY+D/QjGGv9hwFLajKCq8xkD7voOBB77PgIt3d+CPzBEoKH0IIG8U7UEHvaNY2g/dhSDQ1kD
 D0qqMXhDb1iw9BIot+Th8OjBELLV8GDLjYMuexkP453x0NDxiANP2yw4UdlO4KangYX6q10Y
 Wq5XEOhwfuLgQf09FpqPFHNwbrCaQF/QxoAtMMTDv14rhgv54aLCtx85uFvsxVB4+iIG/5Mb
 CG4VvcCgOB8RuBPox+BSShn48Gcdgq7DAzwUHArxUL73MIKDBcdYyG9fAGOjFWT5Qnqnf4ih
 +a4M6glaWXq/WqLXyp7xNP9WG0+tiom67DPpqZu9mFaNBDiq1OwnVBk5ytMDA35MB5uaeHrv
 +BhLu/0W/EvM76rFibJBny4b5y7dokrylZRxOx5PygxaYnORX3MARQmSOF8687aQ/2qzdRhH
 TMTvpNbWEBNxtDhNchW/5iJmxH6VdLppRcQTxVWSx+lDEbNinDTcV/PlVi0ukJ5evvZ/Z6zk
 uOD90hMl/iiZB80kYk0405hXFbYqnBkVpM6Xn5j/DiZLt+2tbAlSW9E3NUijT0lP1ukN8+ck
 ZaXoM+ckbE9WUPiXbHvGN1xFI82/+pAoIO0E9fKoN7KG06WnZiX7kCQw2mh19oduWaNO1GXt
 ko3bNxtNBjnVh6YIrHaS+odgRqJG3KpLk7fJ8g7Z+HWLhaiYXOQwLTQtm+6j56fvz3FcqjyR
 dfenuoy/05Jv/HVmNPOJs2Ho/voR81mk+Ozv27zujc+NNIfd2WJ6uM486vqDlC9S4EoLp4tf
 Gtfdl3AlgS+Qvl8dm/1btC/0s2H909rGk2tVlYVNsUtmbFpbv3KqmwzmTO7ZefzFq+HdJNd+
 OTsjW8umJuniZzLGVN1n2ZqmZUcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0hTYRgH8N73nPOeOVydluCpiGRlRdGNWjxUREXYW1YEQTeCWnVyo2mx
 pWUXsNQw8066WhrTYomumltEZQuZZM3QvIzUWiPNLqapmLNMu7iiLw8/eP7P/9MjY5QF3BSZ
 Lu6YZIjT6FVEzsq3rEief3rhJ2lRRsYsyM1YBIHBNBYK79gINNwuR2C7exZD15P10DLUg2Ck
 7gUDpvwGBMXtbxi4W+NH4Co9R6C5czx4A30EPPkXCSRfv0OgsXsUg68gD0O5YzM8zynBUDX8
 kQVTF4GrpmQ8Nj5hGLaW8WBNioSOUjMPo+2LweN/yUF1kYcD16t5cOWaj8Ajl4eFmvsdGJof
 FhLw235z8LzmGQsNuZkc3OotIdA9ZGXAGujjoanKgsGeMtZ2/usvDp5mVmE4f6MCg7etEsHj
 tLcYHLaXBKoDPRicjnwGftx8gqAj6wsPqRnDPFw9m4XgYmoBCyk+NYx8LySrl9Pqnj6GpjiP
 U9eQhaW1JSJ9YH7D05THr3hqccRTZ+lcev1RF6bFAwGOOsouEOoYyONp+hcvpr319Tx9dnmE
 pZ1eE946dbd85UFJr0uQDAtX7ZNr3Tlm7mhL+Ikh0/Qk5FWmoxCZKCwVsy39OGgizBZbW4eZ
 oMOECNGZ+YELmhF65OKN+qigJwkbRJfNjYJmhUixv7vs761CUIuv7z3g/3VOF8vtVX97QoRl
 YnZvNglaOZapSy4mOUhuQePKUJguLiFWo9OrFxgPaxPjdCcWHDgS60Bj32I9M5p7Hw02r3cj
 QYZUoYrVIR8lJadJMCbGupEoY1RhitM/OiWl4qAm8aRkOLLXEK+XjG40VcaqwhUbd0j7lEKM
 5ph0WJKOSob/WywLmZKEZk4wpw2m46b9FDYfil6zvetSY21UtDBR1xpR/tWSX+mMMNeN37Jz
 Gv08LnXCFUNFY873pj3hFalZdu/8dz/ntHkEMbL3wuRTXn9MYIk/ets6+/uZ2la2tu3MW1O7
 L7TSvlZu/1bqK2r5dVm9VR3J7nqhjZpRvypmE4nPOxWqT1SxRq1m8VzGYNT8AQw0yjwpAwAA
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

Wrapped the base APIs for easier annotation on wait and event. Start
with supporting waiters on each single event. More general support for
multiple events is a future work. Do more when the need arises.

How to annotate (the simplest way):

1. Initaialize a map for the interesting wait.

   /*
    * Recommand to place along with the wait instance.
    */
   struct dept_map my_wait;

   /*
    * Recommand to place in the initialization code.
    */
   sdt_map_init(&my_wait);

2. Place the following at the wait code.

   sdt_wait(&my_wait);

3. Place the following at the event code.

   sdt_event(&my_wait);

That's it!

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept_sdt.h | 62 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 include/linux/dept_sdt.h

diff --git a/include/linux/dept_sdt.h b/include/linux/dept_sdt.h
new file mode 100644
index 000000000000..12a793b90c7e
--- /dev/null
+++ b/include/linux/dept_sdt.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Single-event Dependency Tracker
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
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
+#else /* !CONFIG_DEPT */
+#define sdt_map_init(m)			do { } while (0)
+#define sdt_map_init_key(m, k)		do { (void)(k); } while (0)
+#define sdt_wait(m)			do { } while (0)
+#define sdt_might_sleep_start(m)	do { } while (0)
+#define sdt_might_sleep_end()		do { } while (0)
+#define sdt_ecxt_enter(m)		do { } while (0)
+#define sdt_event(m)			do { } while (0)
+#define sdt_ecxt_exit(m)		do { } while (0)
+#endif
+#endif /* __LINUX_DEPT_SDT_H */
-- 
2.17.1

