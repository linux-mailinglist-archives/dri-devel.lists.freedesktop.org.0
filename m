Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65F88BF9F8
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FC0113530;
	Wed,  8 May 2024 10:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2FB38113536
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:02:55 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-95-663b4a39c48b
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
Subject: [PATCH v14 08/28] dept: Distinguish each work from another
Date: Wed,  8 May 2024 18:47:05 +0900
Message-Id: <20240508094726.35754-9-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSeUiTcRjH+/3e09XidRa9GVQsKjJSi46ngyiiersgkCIMqpWvOZpTZmoK
 gbW5zFLs0NUS8WIburS2EjusZTmPlVmZRzgvIpM8QtvIlGxa/fPw4ft8+PL88bCE7CEVyCrV
 Z0WNWqGS0xJSMjirYNXGvZsjQ81pa+Da1VDw/EgjIbfcSkNTWSkC64MLGPprdkOrdwDB+Ju3
 BBiymxAU9LgJeODsRFBluUjDh8+zodkzTEN99hUatEXlNLz7NoGhI+c6hlLbAXBlFWJwjPWR
 YOin4Y5Bi33jK4YxUwkDppSl0GsxMjDRsxrqO1soqPq0Em7nddDwtKqeBGdlL4YPj3Np6LRO
 UuBy1pHQdC2DgrtDhTR885oIMHmGGXjvyMdwT+cr0o/+pqA2w4FBX3wfQ3P7EwTP0rox2Kwt
 NLz0DGCw27IJ+GWuQdCbOchA6tUxBu5cyERwJTWHBF3HOhj/mUtv2yi8HBgmBJ09Uajy5pNC
 QyEvPDK6GUH37BMj5NviBbslSCh62o+FghEPJdhKLtOCbeQ6I6QPNmNhqLGREepujZPC52YD
 PhgYLtkSIaqUCaImZOsJSZSrLhvHDgecM1Z0oRRUxqUjP5bn1vIN78zUfzY+dNFTTHPL+ba2
 MWKK53CLeXvGl2mH4AYkfHHjrikO4Hbw1Ub3dE5yS/lXeTenfSm3jm9wjZJ/Oxfxpfcc07kf
 t55v7xtCUyzzOU+0RiYdSXzOT5Z/3Zf574j5/AtLG5mFpPloRgmSKdUJ0Qqlam1wVJJaeS74
 VEy0DfmeyXR+4mglGmkKq0Yci+SzpI55myJllCIhLim6GvEsIZ8jrbm0IVImjVAkJYuamOOa
 eJUYV40WsKR8nnSNNzFCxp1WnBXPiGKsqPm/xaxfYAoq8fbY83oWdB0mVmQhZ4w9xRgw7lrY
 fWKf+ujoLv8crz19+c5jluJ2N3VEbV6iL/qoX1RxaHFp2Y3Wk5Pa5ye37A8zfE/+mqT7nTp3
 /+CjsBxtcG/otqDwblpfG41/FKoMz5ND+tPC/eVd263dt+5bZuqKjky6ncr3e1qXnVnJmuVk
 XJRidRChiVP8AaNl6EpIAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRzF+/3ua45WlyV5sSdLCXpYQda3FtGLukTvf4r+qVXXHOqUTU2F
 SNOepqmlqzV1mS3xkTV710RcmjayleYrdbmkKS0X2cSlZc7on8OHcw7nryMipFoqUKRUxQpq
 lSJSRotJ8S556tI12+Vhy0cdsyH70nLw/DxPgr6ynAbb3TIE5Q9SMAzUbYO2YReC0TdvCdDm
 2hDc7O0m4EF9DwJzyWkamvumQYvHTUNjbjoNqbcqaXj3dQxDV14OhjLTTrBmFWGo8TpJ0A7Q
 cEObiiekH4PXWMqAMTkYHCU6BsZ6V0BjTysFlvxGCsydi+F6QRcNL8yNJNQ/cWBofqanoad8
 nAJrfQMJtuwMCioGi2j4OmwkwOhxM/C+xoDhXtrE2tmhPxS8yqjBcLb4PoaWjucIqs9/wmAq
 b6XB4nFhqDLlEvDrTh0CR+Y3Bs5c8jJwIyUTQfqZPBLSukJhdERPb1jLW1xugk+rOsGbhw0k
 /7qI45/quhk+rbqT4Q2mOL6qZBF/68UA5m/+8FC8qfQCzZt+5DD8xW8tmB9samL4hmujJN/X
 osV7Zh0UrzsmRCrjBfWy9YfF4daGXBzjnpGge2RHyeguexH5iTh2Jad7aKV9TLMLufZ2L+Fj
 f3Y+V5XxhfIxwbrEXHHTVh/PYDdztbruSZ9kg7mXBVcn+xI2lHttHSL/bc7jyu7VTPp+7Cqu
 wzmIfCyd6DxP1TFZSGxAU0qRv1IVH6VQRoaGaCLCE1XKhJCj0VEmNHEX48mx7CfoZ/O2WsSK
 kGyqxEbLw6SUIl6TGFWLOBEh85fUnVsdJpUcUyQmCeroQ+q4SEFTi2aJSFmAZPt+4bCUPa6I
 FSIEIUZQ/0+xyC8wGQW07bySxS7Ykvk0pHLJ9H5n4ALLwaBmeXdO58LVJUnz/yj2xUcYV6bn
 WWJi028r+y9PHy+2V7xp1Q3Ko09M/b7W/dvqnXtgvzS52n7KYD9UOHNv0qbSkZHPwfv0Gx/b
 dBUu5+78I9M+Bn0oTHFkaYXxOcsK9WInNqvsIaq+FL1xh4zUhCtWLCLUGsVflGbi5CoDAAA=
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
index 4e359f76ac3c..319a5b43df89 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -509,6 +509,7 @@ extern void dept_ecxt_exit(struct dept_map *m, unsigned long e_f, unsigned long
 extern void dept_sched_enter(void);
 extern void dept_sched_exit(void);
 extern void dept_kernel_enter(void);
+extern void dept_work_enter(void);
 
 static inline void dept_ecxt_enter_nokeep(struct dept_map *m)
 {
@@ -559,6 +560,7 @@ struct dept_task { };
 #define dept_sched_enter()				do { } while (0)
 #define dept_sched_exit()				do { } while (0)
 #define dept_kernel_enter()				do { } while (0)
+#define dept_work_enter()				do { } while (0)
 #define dept_ecxt_enter_nokeep(m)			do { } while (0)
 #define dept_key_init(k)				do { (void)(k); } while (0)
 #define dept_key_destroy(k)				do { (void)(k); } while (0)
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 9aba9eb22760..a8e693fd590f 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -1933,6 +1933,16 @@ void noinstr dept_hardirqs_off(void)
 	dept_task()->hardirqs_enabled = false;
 }
 
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
 void noinstr dept_kernel_enter(void)
 {
 	struct dept_task *dt = dept_task();
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index d2dbe099286b..e7b3818a26eb 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -55,6 +55,7 @@
 #include <linux/kvm_para.h>
 #include <linux/delay.h>
 #include <linux/irq_work.h>
+#include <linux/dept.h>
 
 #include "workqueue_internal.h"
 
@@ -3184,6 +3185,8 @@ __acquires(&pool->lock)
 
 	lockdep_copy_map(&lockdep_map, &work->lockdep_map);
 #endif
+	dept_work_enter();
+
 	/* ensure we're on the correct CPU */
 	WARN_ON_ONCE(!(pool->flags & POOL_DISASSOCIATED) &&
 		     raw_smp_processor_id() != pool->cpu);
-- 
2.17.1

