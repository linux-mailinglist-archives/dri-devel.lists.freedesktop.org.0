Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06505782223
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C561810E18F;
	Mon, 21 Aug 2023 04:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 864A110E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:04:59 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-2b-64e2ded49cc7
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 04/25] dept: Add lock dependency tracker APIs
Date: Mon, 21 Aug 2023 12:46:16 +0900
Message-Id: <20230821034637.34630-5-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0zMcRjHfb6/77j2dVhfspWb2KL8mHhmGDPzYWNt/jCZ6bjvdFyHK6eY
 iQ4pmZoTCRXO6Y5yZ36Ua1foh5ToJC3NHUOrRFy6Oj+u8M+z1/Z69n6eP94cKS+jJ3FqbZKo
 0yo1CkZKSXvGFEa+7PCoZlcfIyH7xGzwfk+nIL/EykDTTQsC6+1DBHQ+Xgmv+rsRDDU8IyHX
 2ISg0P2GhNvVHQgc5sMMNL8PApe3l4E6YyYDaZdLGHje5Seg/UwOARbbGqg/VUSA0/eRgtxO
 Bs7nphGB8YkAn6mYBVNqOHjMeSz43XOgrqOFBkfbDDh3sZ2BB446CqrveQhoLstnoMP6m4b6
 6loKmrKzaLjxuYiBrn4TCSZvLwsvnAUElBoCQUe//aKhJstJwNErtwhwvS5HUJH+lgCbtYWB
 h95uAuw2IwmD1x4j8JzsYeHICR8L5w+dRJB55AwFz37W0GBoj4ahgXxm6UL8sLuXxAb7Xuzo
 L6DwkyIB3897w2JDRRuLC2x7sN0cgS8/6CRwYZ+Xxrbi4wy29eWwOKPHReDPjY0srj07ROH3
 rlwiJiRWukglatR6UTdrSZw03hD4bten4OSrzlSUiizyDCThBH6e4B+soP5zZVsJOcwMP11o
 bfWN8Hg+TLBnfaAzkJQj+WOjBfOXBmZYjOOxcKdoWEg4ig8Xsn85R4JkfLRgL31K/g0NFSyl
 zhGW8PMFW3kZGmZ5YOer+92/w2kS4WXl2r88Uag0t1KnkKwAjSpGcrVWn6BUa+ZFxado1clR
 W3cm2FCgUaYD/o33UF/TuirEc0gxRhY32aOS00p9YkpCFRI4UjFeFvLDrZLLVMqUfaJu52bd
 Ho2YWIVCOEoRLJvbv1cl57cpk8QdorhL1P23BCeZlIrU/usOe3Roc/r6gdgpvv0NrrFX+U0X
 I0MUr/VRmw363U9mdm1dsOntfc2tR3enrYw5ffq3PqzRnTM1crA29EKSV2/94PBYVvmWD7T7
 t7TUPD9o0uZtGLW6pFaZ/JSKMhnDdmyPDTLmpyUHrZ+wYpG2fEPopYhlDZnGseEvghe3LK2P
 U1CJ8co5EaQuUfkHnxlnZ00DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfX/Pdxw/p82PMrkpW0iZ8jFm/vP1kIkN8zDd3G861ZU7ImNK
 h1RnZRI9kKNz66LcYZ5qp6YnD5VuHlJNJ3Sr5KGLlHLH/PPZa3u99977jw9Hygvp6Zxas0/U
 apSxCkZKSdctTZ3v6HCqQpoNgZCdGQLugTQKCspKGWi6YUFQeiuFANfjlfBqsBfB8LNGEnJz
 mhBc7mwn4VZNB4IK8zEGWromgsPdz0B9TgYDqVfKGGjuGSGg7dwZAizWCHiSZSTAPvSJglwX
 A/m5qYTndBMwZCphwZQcAE5zHgsjnaFQ3/GShurCehoqWufChYttDDysqKeg5q6TgJb7BQx0
 lI7R8KSmjoKmbAMN1z8bGegZNJFgcvez8MJeREC53tN24vsoDbUGOwEnrt4kwPHmAYLKtHcE
 WEtfMlDt7iXAZs0h4de1xwicp/tYOJ45xEJ+ymkEGcfPUdD4u5YGfVsYDP8sYFYsxdW9/STW
 2w7gisEiCjcYBXwvr53F+spWFhdZ92ObOQhfeegi8OVvbhpbS04x2PrtDIvT+xwE/vz8OYvr
 zg9TuMuRS6z32ypdphJj1YmidsHyKGm03rMuoXvqwWJ7MkpGFnk6knACv0h41FpGepnh5wiv
 Xw/9ZR/eX7AZPtLpSMqR/MnxgvnLM8YrpvBYuGP0CglH8QFC9qid8rKMDxNs5U/Jf6UzBUu5
 /S9L+HDB+uA+8rLck/na+Z7KQtIiNK4E+ag1iXFKdWxYsC4mOkmjPhi8Kz7OijxPYzoykn0X
 DbSsrEI8hxQTZFF+TpWcVibqkuKqkMCRCh+Z749OlVymUiYdErXxO7X7Y0VdFfLlKMVU2erN
 YpSc363cJ8aIYoKo/W8JTjI9GW20h0bOD0w7LFE3g4v/8H3X5EnqkJ6R9siju2cmVYr2S0ve
 7vGPHBhdrlnVXtXdMGGheV7DQM3a1SuCdxiw+U1wbWF4RPimNXUbEmaPRqwRzu4dCzmalbFl
 WlBe6tUYXwMeMxXP6BJ7LNUNszOR36ztt1v9t5U9PZyCFn85/6PA6FJQumhlaBCp1Sn/AHiA
 ENIwAwAA
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

Wrapped the base APIs for easier annotation on typical lock.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept_ldt.h | 77 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 include/linux/dept_ldt.h

diff --git a/include/linux/dept_ldt.h b/include/linux/dept_ldt.h
new file mode 100644
index 000000000000..062613e89fc3
--- /dev/null
+++ b/include/linux/dept_ldt.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Lock Dependency Tracker
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
+ */
+
+#ifndef __LINUX_DEPT_LDT_H
+#define __LINUX_DEPT_LDT_H
+
+#include <linux/dept.h>
+
+#ifdef CONFIG_DEPT
+#define LDT_EVT_L			1UL
+#define LDT_EVT_R			2UL
+#define LDT_EVT_W			1UL
+#define LDT_EVT_RW			(LDT_EVT_R | LDT_EVT_W)
+#define LDT_EVT_ALL			(LDT_EVT_L | LDT_EVT_RW)
+
+#define ldt_init(m, k, su, n)		dept_map_init(m, k, su, n)
+#define ldt_lock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "trylock", "unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_L, i, "lock", sl);		\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "lock", "unlock", sl);\
+		}							\
+	} while (0)
+
+#define ldt_rlock(m, sl, t, n, i, q)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_trylock", "read_unlock", sl);\
+		else {							\
+			dept_wait(m, q ? LDT_EVT_RW : LDT_EVT_W, i, "read_lock", sl);\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_lock", "read_unlock", sl);\
+		}							\
+	} while (0)
+
+#define ldt_wlock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_trylock", "write_unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_RW, i, "write_lock", sl);	\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_lock", "write_unlock", sl);\
+		}							\
+	} while (0)
+
+#define ldt_unlock(m, i)		dept_ecxt_exit(m, LDT_EVT_ALL, i)
+
+#define ldt_downgrade(m, i)						\
+	do {								\
+		if (dept_ecxt_holding(m, LDT_EVT_W))			\
+			dept_map_ecxt_modify(m, LDT_EVT_W, NULL, LDT_EVT_R, i, "downgrade", "read_unlock", -1);\
+	} while (0)
+
+#define ldt_set_class(m, n, k, sl, i)	dept_map_ecxt_modify(m, LDT_EVT_ALL, k, 0UL, i, "lock_set_class", "(any)unlock", sl)
+#else /* !CONFIG_DEPT */
+#define ldt_init(m, k, su, n)		do { (void)(k); } while (0)
+#define ldt_lock(m, sl, t, n, i)	do { } while (0)
+#define ldt_rlock(m, sl, t, n, i, q)	do { } while (0)
+#define ldt_wlock(m, sl, t, n, i)	do { } while (0)
+#define ldt_unlock(m, i)		do { } while (0)
+#define ldt_downgrade(m, i)		do { } while (0)
+#define ldt_set_class(m, n, k, sl, i)	do { } while (0)
+#endif
+#endif /* __LINUX_DEPT_LDT_H */
-- 
2.17.1

