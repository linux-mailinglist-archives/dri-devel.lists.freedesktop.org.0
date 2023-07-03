Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B1745904
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B045F10E202;
	Mon,  3 Jul 2023 09:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7239710E1F0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:40 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-08-64a299b2432f
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 03/25] dept: Add single event dependency
 tracker APIs
Date: Mon,  3 Jul 2023 18:47:30 +0900
Message-Id: <20230703094752.79269-4-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0xTZxjG/c7lO22146Qz4YhRSBMlYfECXvLGLMs0Ub7EkZCZLJvLsjX2
 KM3KxYLlFgMOUFYBUYOlQEYBUxoolx38Q0Wwwwmi4SJWKYpVCF64T7Z2VNhci/OfN788z/s8
 fz0yWnWdDZPpktJEQ5JGr8YKRjG7pmaLZKnVbu9+uQHOF20H71+FDFS1ODAMNjcicFw5RcHk
 7VgY9s0gWOoboMFcNoigZuwpDVe6PQg67D9heDDxEbi88xh6y85iyKtrwXB/epmC0UsXKGiU
 4uBeaS0FTv8rBsyTGCrNeVTgvKbAb2vgwJa7CcbtFRwsj0VDr+cRCx2PPwHLL6MYbnT0MtB9
 dZyCB9erMHgc71i4132HgcHzxSw0zdVimPbZaLB55zkYclopaM0PFJ3+818WeoqdFJy+/CsF
 rpF2BJ2FzymQHI8w3PLOUNAmldHwtv42gvGSWQ4KivwcVJ4qQXC24BIDA//0sJA/uguWFqvw
 53vIrZl5muS3pZMOn5Uhd2sFcq3iKUfyOx9zxCqdIG32KFJ3Y5IiNQtelkgNP2MiLVzgiGnW
 RZG5/n6O3ClfYsiEy0zFrz+s+FQr6nVG0bDtsx8UCV2lFWzKcGiGzxyei1wqE5LLBH6nUF3Y
 zn3gvrE3bJAxHym43X46yGv5CKGt+GVAV8ho/sxqwf5HHw4aH/PfCFP111YCDL9JaHcsrASU
 /C7B6jSz70vDhcZW54ou53cLLxZLUJBVgZ9RiwcHSwX+jFx4eG7k/8A64Te7mylFSita1YBU
 uiRjokan37k1ITNJl7H1SHKihAKLsp1c/vYqWhg81IV4GVKvUbqza7QqVmNMzUzsQoKMVq9V
 5o1Va1VKrSYzSzQkf284oRdTu9B6GaMOVcb40rUq/pgmTfxRFFNEwweXksnDctHe/dnGAxmR
 BZb4Z++ytdVf4HMxI6uPD9v64vdugO/SNn9l3JHeXLR/Y5h0sTLZtDElZ0qIywrJuhneGeI3
 HV11bKilOK5naqRu6g35OqfOMz30ImLPycXIg6asOfc+9ORh7N+08mJU7Mxi+cRyyPywvrM/
 5+aXEQd/l1sObW4qf4XUTGqCJjqKNqRq/gOTtbUrTQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5/L/xxXi9OSPFhRjCIoMoOMtwsRRXToRhAURWWjHXSl07Yy
 Z2nmrTInGtjSls1pa+rMOvahm7Im3grNckyLJSl2sSzL2mppl2n05eXH87zP8+lhSYWZDmc1
 2qOiTquKU2IZJdu2KnOxVGxVR5orKCjMiwTft7MUmGsdGDpvVCNw3D5NwGDTRuj2DyEYbX9C
 gqmoE0FZ30sSbjf3Iqi3Z2DoGpgKbt8whrai8xgyy2sxPP0wRoD34gUCqqWt8LjASoAz8JYC
 0yCGy6ZMInjeERCwVTFgS58P/fYSBsb6lkJbr4eGxittNNS/WATFpV4MD+rbKGi+009A1z0z
 hl7HHxoeN7dS0FlopKHmkxXDB7+NBJtvmIFnTgsBN7OCbTlff9PQYnQSkFNxiwD38/sIGs6+
 IkByeDA0+oYIqJOKSPh5vQlBf/5HBrLzAgxcPp2P4Hz2RQqe/GqhIcsbBaM/zHjtKqFxaJgU
 suqOC/V+CyU8svLC3ZKXjJDV8IIRLNIxoc6+UCh/MEgIZSM+WpCqzmFBGrnACLkf3YTwqaOD
 EVovjVLCgNtEbJ+1R7ZaLcZpkkTdkjUHZLGughI6sTss2W+ak47cilwUwvLcMr697ws9zphb
 wPf0BMhxDuXm8nXGN0FdxpLcmcm8/XM7Hjemc7v599fvTgQobj5/3zEyEZBzUbzFaaL/lc7h
 q286J/QQbjn/+kc+GmdF8Mdb3IsLkMyCJlWhUI02KV6liYuK0B+ONWg1yREHE+IlFNyMLXWs
 8A761rXRhTgWKafIe06UqRW0KklviHchniWVofLMvqtqhVytMqSIuoRo3bE4Ue9CM1lKGSbf
 tEs8oOBiVEfFw6KYKOr+uwQbEp6OtOs2pc6UYvY3dpyy7FAYajwb9m0Ob3EebD40Y7pkr658
 uPxadPLULWuM642O2qaMPMM0c+S2xOzPO+8Fdt+w4oQGz8qw3JbsJWlYP5AW873ii2v9m5Pl
 EQ6Pl927qDhxdcHP1IeV6zaXprBpfqXlROvegdkrlRk5866tGExJr+w+oqT0saqlC0mdXvUX
 eQqn0i8DAAA=
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

