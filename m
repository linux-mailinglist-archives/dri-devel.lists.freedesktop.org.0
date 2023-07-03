Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B74745905
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1D910E1FE;
	Mon,  3 Jul 2023 09:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 76EAB10E1F0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:43 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-a6-64a299b3d23d
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 13/25] dept: Distinguish each work from
 another
Date: Mon,  3 Jul 2023 18:47:40 +0900
Message-Id: <20230703094752.79269-14-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSbUxTZxQHcJ/n3vvcS6XmpmK8ajKXJsbMF9T5dlzmy/yyu8QtTdgHM0xm
 Y6/S2CIpiKCS4aji0EvQiIiWScF0DXSAt8QgUkUYICJYtUoltZGKYkMRxyyBwWTUzS8nv5xz
 8s/5cDhKc51ZyBlTMyRLqt6kJSpaNRxvX+kurTCsDjckwpnTqyH67iQNtloXAW9NNQJX/TEM
 4bavoXcsgmCy+z4FJcVeBPb+ZxTUtwcReJw/E3g0MAd80RECncWnCORV1hJ4MDSFIXD+LIZq
 5VvoKqrA0DwxSENJmMClkjw8U15jmHBUseDIXQIh50UWpvrXQGfwCQOevuVQ+muAQJOnk4b2
 hhCGR402AkHXNANd7Xdo8J6RGfj9TQWBoTEHBY7oCAsPm8sx1Flngk789Z6BDrkZw4krVzH4
 nt5AcPPkcwyK6wmB1mgEg1sppuDv39oQhAqHWTh+eoKFS8cKEZw6fp6G+/90MGANrIfJcRvZ
 9oXYGhmhRKv7kOgZK6fFuxWCeP3iM1a03uxjxXLloOh2LhMrm8JYtI9GGVGp+oWIyuhZViwY
 9mHxTU8PK965MEmLA74SrFv0g+pLg2QyZkqWVVt2q1JqXT4q7e3crN76eblI4QtQHCfw64Se
 1mn80da+Iipmwi8V/P6JD07gPxXc8iumAKk4is+fLTjfdpMCxHFz+SQhMKqJ7dD8EuFesI7E
 rOY3CPfkMuq/zMVCdV3zB8fN9F+OF6KYNfx6IVAaJLFMgc+PEy44nP8fsUC47fTTRUhdjmZV
 IY0xNdOsN5rWJaZkpxqzEvccMCto5qEcOVPJDWjUm9SCeA5p49X+I3aDhtFnpmebW5DAUdoE
 dV7/ZYNGbdBnH5YsB360HDRJ6S1oEUdr56s/Hztk0PD79BnSfklKkywfp5iLW5iLyjZcOzKU
 ti3UkPTCP7W0K3/+4/jBb7YavVfN/ue2to7tyY2Rz74LfZWhQ59Y92bvf51XI3fvXiFbdf3T
 8h6ZTTbpQ13D4caE0pxNkd4/R+TNT8eP+qzmnGjNw6adAybdOe+tn8q+r1e2eDYOrvCudQvv
 dPY/zIPxu+DcjrtZth1aOj1Fv2YZZUnX/wuCRdYFTAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSf0yMcRwHcN/v8zzf5+k4e3bCM0x2m5ksMuKzMTP+8Gh++4PxB8/cMx2V
 dlcpP7bokHStIukH+rXT6ijPNb9Lrl11hOiW5NyU/LgpJS7l8qOYfz577fP+7P3Xh6M0+cw0
 Th8dKxuipUgtUdGqDcuSQ2y5xbpQx/MpkJkWCr5vKTQUVFoJtFyrQGCtPobB61gDLwZ7EPgf
 P6UgJ7sFQVHnawqqGzwIasqOE2jtngguXx8BZ/YZAskllQSefRrB4D6fhaFCWQ+PMoox1A1/
 oCHHSyA/JxmPjo8Yhi3lLFiSZkNXWR4LI50LwelpY6D+opOBmo55kHvJTeBejZOGhltdGFrv
 FBDwWH8z8KihiYaWTDMDVz8XE/g0aKHA4utj4XldIYYq02jbya+/GGg012E4WXodg+vlXQS1
 KW8wKNY2AvW+Hgw2JZuCH1ccCLrSe1k4kTbMQv6xdARnTpyn4enPRgZM7jDwDxWQlcvE+p4+
 SjTZDoo1g4W0+LBYEG/nvWZFU20HKxYqcaKtLFgsuefFYtGAjxGV8tNEVAayWDG114XFz0+e
 sGLTBT8tdrty8KYZO1TLdXKkPl42LFixWxVRaXVRMf2TEl5UT05CCp+KAjiBXyyYOjKoMRN+
 jtDePvzXgfwswWZ+z6QiFUfxp8YLZf2PSSriuEn8VsE9oBm7ofnZQrOnioxZzS8Rms0XqX+d
 QUJFVd1fB4zu3w2lozFr+DDBneshGUhViMaVo0B9dHyUpI8Mm2/cH5EYrU+Yv+dAlIJGX8Zy
 dCTzFvrWusaOeA5pJ6jbDxfpNIwUb0yMsiOBo7SB6uTOyzqNWiclHpINB3YZ4iJlox1N52jt
 VHX4Nnm3ht8rxcr7ZTlGNvxPMRcwLQnZpoecqxKCG2/gbrI2LVBf1Ptl/SKFHr/y1PagnQ57
 f0rczO+umJBmc2f5jY1LH6wuCfLffNvkP12aN9MZvsoy93tFn96/etHygq/VFx5cjr17fZCT
 t3gd0pDgv9QWOnTEd1Z6F+q1t9xvvLl5X0NWtxcn2Kh4T23GOms4++pqhJY2RkgLgymDUfoD
 Zj/+/y4DAAA=
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
index c913e333cce8..fa23d876a8b5 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -52,6 +52,7 @@
 #include <linux/sched/debug.h>
 #include <linux/nmi.h>
 #include <linux/kvm_para.h>
+#include <linux/dept.h>
 
 #include "workqueue_internal.h"
 
@@ -2318,6 +2319,8 @@ __acquires(&pool->lock)
 
 	lockdep_copy_map(&lockdep_map, &work->lockdep_map);
 #endif
+	dept_work_enter();
+
 	/* ensure we're on the correct CPU */
 	WARN_ON_ONCE(!(pool->flags & POOL_DISASSOCIATED) &&
 		     raw_smp_processor_id() != pool->cpu);
-- 
2.17.1

