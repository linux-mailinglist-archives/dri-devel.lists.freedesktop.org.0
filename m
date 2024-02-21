Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ACB85D43C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE1910E6AE;
	Wed, 21 Feb 2024 09:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id D29ED10E6AF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:49:46 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-96-65d5c7387f8b
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
Subject: [PATCH v12 01/27] llist: Move llist_{head, node} definition to types.h
Date: Wed, 21 Feb 2024 18:49:07 +0900
Message-Id: <20240221094933.36348-2-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240221094933.36348-1-byungchul@sk.com>
References: <20240221094933.36348-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0xTZxgHcN5zec+h0nlSyXbELC4Vxft0inuye1zC3kUlZi7RoMZ1cmKr
 BbVFkCUuRbm4So24ABPQFHC1g6JyKtFN23QwqUjECtUxghWIUZAik63NKkxtNX558stz+X96
 eFp1mU3iddk5kiFbo1djBaMYS6hdAt7b0rLOoiQoK10GoX8PM1BzzoHBd7YRgeNCAQUjV7+A
 P8NBBJM3btJQWe5DUDt4l4YL7QEELvtBDD333wB/aBxDR/kRDIfqz2G4NTpFQX/FcQoa5XXQ
 eayOAk/kIQOVIxiqKw9R0TJMQcTWwIHNNBeG7FUcTA0uh47AHRZcfYvgxKl+DFdcHQy0Xxqi
 oOe3GgwBx3MWOtuvMeArs7DQ9LgOw2jYRoMtNM5Bt8dKwfnCaFDxP89Y8Fo8FBSfbqbA/9dl
 BO7DAxTIjjsY2kJBCpxyOQ1Pz1xFMHR0jIOi0ggH1QVHERwpqmDg5v9eFgr7U2Hyvxr82Qek
 LThOk0JnHnGFrQy5XieSX6vucqTQ3ccRq7yPOO0LSf2VEYrUToRYIjf8gIk8cZwj5jE/RR53
 dXHk2k+TDLnvr6TWz8pQfJQp6XW5kuHdT75RaIu7TnF7Tir2W39uwSbk5s0onheFlaLXbOFe
 W37S+tJYSBF7eyN0zInCO6LT8oA1IwVPCyXTRPvfN3BsMENIF9uetKOYGWGu2O18ysSsFFLF
 Zvke/Sp0tth43vPS8cIq8ZfqIBuzKrpz+1YLHQsVhZJ4sbnDz746mCn+bu9ljiGlFcU1IJUu
 OzdLo9OvXKrNz9btX7p9d5aMoi9lOzC1+RKa8G1oRQKP1AlK7UW/pGI1ucb8rFYk8rQ6Ucnk
 RVvKTE3+d5Jh9zbDPr1kbEWzeEb9lvK9cF6mStihyZF2SdIeyfB6SvHxSSaUX+PZ7uub83G6
 Y/rMjOSAO/F5sXHtl6umhXdgLrJkhVWf8uOWtEdfzclBi60DcV+nxun+2Lxl9rfX530/uMa8
 Vrt4IFC1KaGntCR1tXera3hFyuemt+OaCg5+augyZQQe1L1pcY/WB8u6328qWZ+80+Lb+2Ha
 cPLGBblp5EBL+omh1fPVjFGrWb6QNhg1LwC9bUM1TgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSf0yMcRwHcN/v8zzf5+k4e5Y2jx/z47bm16RG9pkMfxgPxowN87ObHu5W
 l9wlMmflUqSiLKGyKzmpQ56roZTWzeVEHR1iCc2vJkpccxW5Y/757LXP+7P3Xx+OCixkxnPa
 2HhJH6uOUREFrVgTYZoNjU+l0KsuDNkZoeD5cYyGgutWAq5r5QislckYuu4th+f93QgGH7VQ
 kJfrQlD09hUFlY4OBLWlRwi0vhsNbk8PAWfuCQKmi9cJPP48hKH9TA6Gcnk1NJ0qxlDv/UhD
 XheB/DwT9o1PGLyWMhYsScHQWXqehaG3YeDseMaAvdDJQO3LWXDuQjuBO7VOGhy3OjG0VhcQ
 6LAOM9DkuE+DKzuTgatfiwl87rdQYPH0sPCk3oyhIsXXlvr9NwONmfUYUktuYHC/qEFQd+wN
 Btn6jIDd043BJudSMHD5HoLOrC8sHM3wspCfnIXgxNEzNLT8amQgpT0cBn8WkCURor27hxJT
 bPvF2n4zLT4oFsTb51+xYkrdS1Y0y/tEW+lM8eKdLiwW9XkYUS47TkS5L4cV07+4sfi1uZkV
 758dpMV37jy8duJmxcIoKUabIOnnLIpUaFKbL7BxhYoD5ktVJAnVcekogBP4eYL8rYH1m/DT
 hLY2L+V3ED9FsGV+YNKRgqP4tJFCae8j4g/G8GsE+zcH8pvmg4UntgHabyUfLtyQX1P/SicL
 5RX1fx3Azxeu5Hczfgf6bp4+rqJOIYUZjShDQdrYBJ1aGxMeYojWJMZqD4Ts3KOTke9pLMah
 7FvoR+vyBsRzSDVKqbnplgIZdYIhUdeABI5SBSnp/b6VMkqdeFDS79mh3xcjGRrQBI5WjVWu
 3ChFBvK71fFStCTFSfr/KeYCxiehu8kObfyy6etqhpWjjORwm77lnHPRgqIJe9dHbtpspgYq
 pvZmZ6SVlMct3pH50bLJEjLJrK8arMia8XpdY5P1Yc5coZ8aGxzw/sHzjfZVp71jjLs0C8eN
 q+x1VW+4dNx0syPthVHdpzN1bivZoltx0HgolHxwbd86HBmxZenJGaqouyraoFGHzaT0BvUf
 NFPz6TADAAA=
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

llist_head and llist_node can be used by very primitives. For example,
Dept for tracking dependency uses llist things in its header. To avoid
header dependency, move those to types.h.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/llist.h | 8 --------
 include/linux/types.h | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/llist.h b/include/linux/llist.h
index 2c982ff7475a..3ac071857612 100644
--- a/include/linux/llist.h
+++ b/include/linux/llist.h
@@ -53,14 +53,6 @@
 #include <linux/stddef.h>
 #include <linux/types.h>
 
-struct llist_head {
-	struct llist_node *first;
-};
-
-struct llist_node {
-	struct llist_node *next;
-};
-
 #define LLIST_HEAD_INIT(name)	{ NULL }
 #define LLIST_HEAD(name)	struct llist_head name = LLIST_HEAD_INIT(name)
 
diff --git a/include/linux/types.h b/include/linux/types.h
index 253168bb3fe1..10d94b7f9e5d 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -199,6 +199,14 @@ struct hlist_node {
 	struct hlist_node *next, **pprev;
 };
 
+struct llist_head {
+	struct llist_node *first;
+};
+
+struct llist_node {
+	struct llist_node *next;
+};
+
 struct ustat {
 	__kernel_daddr_t	f_tfree;
 #ifdef CONFIG_ARCH_32BIT_USTAT_F_TINODE
-- 
2.17.1

