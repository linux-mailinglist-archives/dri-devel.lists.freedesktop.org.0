Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D985D43B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1079010E6AF;
	Wed, 21 Feb 2024 09:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id D182F10E6A8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:49:46 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-b6-65d5c7385d59
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
Subject: [PATCH v12 03/27] dept: Add single event dependency tracker APIs
Date: Wed, 21 Feb 2024 18:49:09 +0900
Message-Id: <20240221094933.36348-4-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240221094933.36348-1-byungchul@sk.com>
References: <20240221094933.36348-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe2xLcRTH97vvda1cRVyTsDRZyGze5IQRkeCKiNk8EiSU3lizh2npzCub
 1WuvzOjKNmwjVVspLZlXqWK1LRirKWYowbLN2LTUNrTDPyeffM85n5w/DoNLr5HhjDJ1i6BK
 lSfLKBEh6hRXxIDzqTDR/C4GDuVNBO+3AwSUmU0UNJ6vRmC6lIVB270F8MzXgaD3wSMc9LpG
 BBVvX+FwqbYVgc24h4Km94PA5e2ioE6XS0H2KTMFj9v7MGgpLsKg2rIYGgorMbD7PxKgb6Og
 VJ+NBconDPyGKhoMmZHgMZbQ0Pd2EtS1NpNgezEOjp1ooeCGrY6A2iseDJqulVHQavpNQkPt
 fQIaD+WTcO5zJQXtPgMOBm8XDU/s5Rhc0AZE+3p+keDMt2Ow7/RFDFzPryO4eeANBhZTMwV3
 vB0YWC06HH6euYfAU9BJw948Pw2lWQUIcvcWE/Co30mCtmUa9P4oo+bM4O90dOG81prO23zl
 BF9fyfFXS17RvPbmC5ovt2zlrcYo/tSNNoyv6PaSvKXqIMVbuotoPqfThfGfHz6k+ftHewn+
 vUuPxY1cJYpVCMlKjaCaMHudKNFRWEKmPRu+zacfnYlc0hwUynDsVO6Drp7+z1n911GQKXYM
 53b78SAPZSM4a/4HMgeJGJzdH8YZvzyggo0h7ELO/fouGWSCjeRMxuyBZQk7jdtjKyH/Skdz
 1RfsA6JQdjp3trRjIJcGZp4+vowHpRz7m+EcPQf/XTGCu210E4VIUo5CqpBUmapJkSuTp45P
 zEhVbhu/YVOKBQU+yrCrb/UV1N2Y4EAsg2RiSWKNS5CSco06I8WBOAaXDZUQ6YFIopBnbBdU
 m9aqtiYLagcayRCy4ZLJvnSFlN0o3yIkCUKaoPrfxZjQ8EwUqxkbvX9+VOZXdvca38zC5bdi
 ZG09sTumLHlSqj25WTEsPmHR2pCIlSvmmual1d8OLzaqj4clLa0enB99RO497J+nEU95uX5R
 Q9x37bD2sOW7i8iiy07xzoplIX57jdjqnBVvU8QkRfebKc+KGjrL3RzuKGjiSI/uqtnm+BEZ
 P0pGqBPlk6JwlVr+BxcEsThNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTYRTHe573NleLl2X5doFiJMWyG2Se6EL0paeo6EIEfcmRL27lJba8
 UqBtmlmKRrbSVaax1lxps4tWk6HlWpGXnGmiKyUqa2q3WfNSTaMvhx///zm/T0dCyU3MHIkm
 4aioTVDFKVgpLd2xVr8UXO3iitqvs6DwzArw/8ihwVRpY6HlVgUC251MDP1PNkPHsA/B6Itm
 CoxFLQiu9vZQcKfRi8BhOcFC27vp4PEPseAuOs2CvryShdbPYxi6z5/FUGHfDs8LyjA4Ax9o
 MPazUGLU4+D4iCFgtnJgzgiHPksxB2O9K8HtfcVAwyU3A46uJXDxcjcLjxxuGhpr+jC0PTCx
 4LX9YeB541MaWgrzGLg5WMbC52EzBWb/EAcvnaUYqgxBW/b33wy48pwYsq/dxuB5/RBBXc5b
 DHbbKxYa/D4M1fYiCkauP0HQlz/AQdaZAAclmfkITmedp6F53MWAoTsSRn+Z2I1rSYNviCKG
 6hTiGC6lybMygdQW93DEUNfFkVJ7Eqm2KEn5o35Mrn7zM8RuPcUS+7ezHMkd8GAy2NTEkacX
 RmnyzmPEO+ftl66LEeM0yaJ2+YZoqbq+oJg50hGWOmycn4E88lwUIhH4VULm+EM0wSy/SOjs
 DFATHMovEKrz3jO5SCqh+JNTBcuXF+xEMYPfInS+ecxMMM2HCzaLfvJYxkcKJxzFzD/pfKGi
 yjkpCuFXCzdKfJO5PLjT3nqXKkDSUjTFikI1CcnxKk1c5DLdYXVagiZ12cHEeDsK/oz5+Fhh
 DfrRtrke8RKkmCZT3/eIckaVrEuLr0eChFKEyuiUYCSLUaWli9rEA9qkOFFXj+ZKaEWYbOs+
 MVrOx6qOiodF8Yio/d9iScicDCQt+FCumLvNW+XxLhz/GRigp09LOae5tFc7EosH76k62q1O
 os/nFudEVH4K89Fd5fyulJiokb2mG5uuiM2Ju22z4tdHeNc4e9VK8ybrn76pB57lz3absnsM
 C5LGZORUqmO5cs8hZXpenXG2oqTsWGaUa2bnVgPlaore0OpuyVLQOrVqpZLS6lR/AYOUIwov
 AwAA
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

