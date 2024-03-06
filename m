Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD18A873153
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2D610FFDA;
	Wed,  6 Mar 2024 08:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 226D210EB6A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:55:27 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-68-65e82f7c9f1f
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
Subject: [PATCH v13 04/27] dept: Add lock dependency tracker APIs
Date: Wed,  6 Mar 2024 17:54:50 +0900
Message-Id: <20240306085513.41482-5-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306085513.41482-1-byungchul@sk.com>
References: <20240306085513.41482-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/p+s4fjusrzDc1qwsYuFjzPP4mdmYfzxtOvpNN1dxJTK2
 S5dF5SEqEusq51Qcd1EeyinSeUgPtyR1Uxqlqyzu9DS5zvzz2Wvvz/vz3uezfSSU/AHjJ1FF
 xoiaSKVawUppac+E3KCTCzrF4PjUiXAxJRhcv5JoyDYVsVB7txBBUXE8hq6XG+GD24lg+N17
 CjLTaxHo21opKK5yICgznmKhoWMi2F19LNjSk1lIyDOxUNc9gqElIw1DoXkLvLmQi8E6+I2G
 zC4WrmUmYE/pxDBoKODAoPWHdmMWByNtC8HmaGSgrHkeXL3RwsLTMhsNVaXtGBoeZ7PgKBpl
 4E1VNQ21F1MZuNOby0K320CBwdXHQb01B8M9nSfo9M8/DLxKtWI4nX8fg/3jEwTlSZ8xmIsa
 Wah0OTFYzOkUDN16iaD9XA8HiSmDHFyLP4cgOTGDBl3LYhgeyGZXLxMqnX2UoLMcFcrcObTw
 OpcIj7JaOUFX3swJOeYjgsUYKOQ97cKCvt/FCOaCM6xg7k/jhLM9diz01tRwQvWVYVrosGfi
 rX67pCvCRLUqVtQsWBkqDdd5FjvU6XvsplWLtKhQfhb5SAgfQqy6euY/l5oyvMzyc0lT0yA1
 xlP42cSS+tWrU7xTSvJrNozxZH4NKS9569Vp3p8MmJK8LOMXE8/V1L/MWaTwntXLPvwScr73
 PDvGco/nXYLew1KPZ0BC9Hnd7L+BaeS5sYm+gGQ5aFwBkqsiYyOUKnXI/PC4SNWx+fujIszI
 80yGkyO7S1F/7fYKxEuQYoJstc83Uc4oY6PjIioQkVCKKbITQx2iXBamjDsuaqL2ao6oxegK
 NF1CK3xli9xHw+T8AWWMeFAUD4ma/10s8fHTopmbH26aqXYGVSc63Fr/+MOj6y5l4R0W6apt
 M4Z826I66e2hfT8+2Fr0QbuWhu20ZMH3ZyVrr9Nxj5fX2ZuX/5m0otXREJOc8OVZa9W4gBft
 l2//DpjzaRXz5Uob2bRUJydp6+tT5t0PsDBTtX4lzgYyfs/kocDG96NG3RPT630fbQo6Oly5
 MJDSRCv/ArCRjz1IAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRTH+93nNlpeltgtIWv0ACM1yjj0DikvQS8ilP6pUZccTq1NTc1K
 3RTzmZXO0mK+5rNWs4eVk6VozseylMpSK9HUnBtYk3xQTaN/Dh++5/Dl+4UjwCVacoVAHh7J
 K8NlCiklIkSHtqs3xvuO8n6DZh/IyfAD589UAgoNNRR03a9GUPMoEYOx5kB4P2VDMNv5Ggdt
 bheCoq/9ODxqGUBgqkiioHtoCfQ4HRRYctMpUJcYKHgzPodBX951DKqNB6H9WjEG5ukRArRj
 FBRo1ZhrjGIwra+iQZ+wFgYrbtMw93UTWAbekdB0x0KC6eMGuHW3j4J6k4WAlrpBDLqfF1Iw
 UPOHhPaWVgK6cjJJuGcvpmB8So+D3umg4a1Zh8EDjcst5cdvEl5lmjFIKX2IQU/vCwQNqV8w
 MNa8o6DJacOg1piLw0x5M4LBrAkakjOmaShIzEKQnpxHgKbPH2Z/FVJ7tnFNNgfOaWovcKYp
 HcG1FbPcs9v9NKdp+EhzOmMUV1vhzZXUj2Fc0aST5IxVVynOOHmd5tImejDObrXSXGv+LMEN
 9WixI54nRDvO8Ap5NK/03XVKFKJxBTs3uiymzJyAElC1JA0JBSyzha0z5JHzTDHr2Q8fpvF5
 dmdWsbWZ3xZ0nLGJ2FLr/nleyuxlG552LOgEs5b9ZUhdYDHjz7qa4v88vdjqB+YFFjJb2Wx7
 NjXPEtdNp7qIuoZEOrSoCrnLw6PDZHKFv48qNCQ2XB7jczoizIhc76K/NJdTh352BzYiRoCk
 i8V7hCO8hJRFq2LDGhErwKXu4viZIV4iPiOLjeOVESeVUQpe1Yg8BYR0mfhAEH9KwpyVRfKh
 PH+OV/7fYgLhigTUa/MPOD8X3N/r+Hxj3/DExeN/HMHRdWl4h2ndneCBfLcRj6VlDet8PXW6
 1pvCzCv2pMfu1jB1ycupAGtl2fLhsdnlM5Vxb27uXtXW2lF1rP1753dFxtn8/PIfufUlm8sD
 35au4Y9avMwed/VBblsj7DvTycvto58MhicrV7e9OhzUIiVUIbJN3rhSJfsLvl4JyioDAAA=
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

