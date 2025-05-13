Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826FFAB51FF
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6163410E562;
	Tue, 13 May 2025 10:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03C4610E383
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:07 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-5b-682319ee0be8
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
Subject: [PATCH v15 10/43] dept: distinguish each work from another
Date: Tue, 13 May 2025 19:06:57 +0900
Message-Id: <20250513100730.12664-11-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTdxjG9z/n9H8Olc6TejvWTbFIjExQprLXxJFFP/jng4nGgIox2MjZ
 WrlaoMimC53FOBwNYhDBC+WSUqEKFo3gwDHACqiIglAN4sDFrOGmnW1A8NJi/PLml+d53+f5
 8nK03C5RcJqkNFGbpEpQYikjHfMvDZlYHKheO2nE4H5zgoHzNVYM3VeqEViv6Slw3t4K/Z5R
 BNP3H9BQWNCNoHToGQ3X7IMImiy/Yej590vodU9g6Cg4ieFYeQ2GhyMzFAycyaeg2rYNnptf
 MnA3r4yCQieGc4XHKO/4j4IpcxUL5qwgGLYUszAzFAYdg30SaHr6DRRdHMDQ2NTBgL1+mIKe
 m+cxDFo/SOCuvZ0Bj3EJdJ/KlcDl8TIMIx4zDWb3BAuPmk0U2E0LodbgDTz+/3sJ3MltpuB4
 xVUKep/8ieDWiX8osFn7MLS6RymosxXQ8LbyNoJh4xgL2X9MsXBOb0RwMvsMA4aBDTA96W2+
 8CYM9CW1DFx+14d++J5YL1oRaR2doImhLoO8dT/GpMljYkhnmUAaip+xxHDrKUtMtnRSZwkm
 5Y1OipS63BJiq/odE5srnyU5Y70UGe/qYrd/FSPdFCcmaHSidk3Efqm6NluXMs4ermh5RWWh
 RpyD/DiBXy8M1/TTOYib5Uud6T4Z8ysFh2OK9vF8PkCoy30pyUFSjub75gj9F54gnzGP3yIY
 W7MYHzN8kHDvZsksy/hwwZHfS3/KXyZU1zbPsp9Xf1fZNbsj5zcIeaZqxhcq8Kf9BL1hnPl0
 sFj42+Jg8pDMhL6oQnJNki5RpUlYH6rOTNIcDj2QnGhD3u8yH53ZW49c3TtbEM8hpb+s3blc
 LZeodKmZiS1I4GjlfJn+hleSxakyfxa1ybHa9AQxtQUt4RjlItm3now4Of+TKk2MF8UUUfvZ
 pTg/RRbSrUxb8MKFi2JTmPplI/bvkn85FGCJj/1V8XBV1KXl6q8PrtvXVkGmw44qUGjDgbP0
 5rYdR2RzN/V01qwIWR2c4hh67oxeuita2YYiwq83GKObY6I2NkRGf3i9elK7W9FunRMU9JdF
 meEfGFPiKS7fG7H7CBe4JzfSODX0Y7i65FCokklVq8KCaW2q6iN1Dzi1WQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfSzUcRzH+/6eXV37Tapfer7Qes6W+mxatfrDb22sh5Wtf3Lxq7t5qN2h
 znoglIjQEFJHdeROOJQ8lLl1dSkUnYdQzMQ8tbiLiI6tfz577f3+vD/vfz4Mbp9HOjLyoGBB
 ESQNkFAiQuTlHrltZMUG2c4fY5vAMh5DwP1CHQWNz7QIdKURGAy88YAW6xCCqY8NOKSlNCLI
 7u7EodTYhaA67zoFTb2LodkySoEpJY6CyEeFFHwanMagIzUZA63eE75p+gioS8zBIG2Agsy0
 SMw2+jGY1OTToAl3hp68DBqmu13B1GUmwZBlIqG6fQukP+igoKraRICxvAeDpor7FHTpZkmo
 M74jwJqwEhqT4kkoGMmhYNCqwUFjGaXhc40aA6N6GRRF2a7eGJsh4W18DQY3Hhdj0NxWieBV
 zHcM9DozBQbLEAYl+hQc/uS+QdCTMExD9O1JGjIjEhDERacSENXhBlMTtuascVeIeFhEQMFf
 Mzqwj9c90CHeMDSK81ElF/k/li8UX21VE/z7HI5/mdFJ81Gv2mlerQ/hS/I284+qBjA++5eF
 5PX5tyhe/yuZ5mOHmzF+pL6ePrL6lGivnxAgDxUUO/b5iGRF0aEXRuhLj2t/YuGoiopFDMOx
 u7in70NikR1DsRu51tZJfI4d2HVcSXwfGYtEDM6aF3ItWW1ozljCHuISDOHEHBOsM/eh4uE8
 i9ndXGty83yYY9dy2qKaebaz6X9z6+d37Fk3LlGtJRKRSI0W5CMHeVBooFQe4LZd6S9TBckv
 bfc9H6hHtv/RXJlOKkfjTR61iGWQZJH43cB6mT0pDVWqAmsRx+ASB3HEC5sk9pOqwgTF+dOK
 kABBWYtWMoRkufiwt+Bjz56TBgv+gnBBUPx3McbOMRwVutet0p1Msha7HDte37ZfhaeW3Szr
 9bzp4uTsEtcNCi+t/5rfo7Izn9OHm5K82cvs0rRpS9escSJr/9djpYwiX/W6d6Kh5vnEjNDe
 8Lpgx70M87P+03uuMqb4mF2EqMf3YOW2UieHO0enrj2p6zfc3brQaWvu2RPnGrON7clhWm8J
 oZRJXTfjCqX0H7RVwqA7AwAA
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

Workqueue already provides concurrency control.  By that, any wait in a
work doesn't prevents events in other works with the control enabled.
Thus, each work would better be considered a different context.

So let dept assign a different context id to each work.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 kernel/workqueue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index cf6203282737..5a6ab354c416 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -55,6 +55,7 @@
 #include <linux/kvm_para.h>
 #include <linux/delay.h>
 #include <linux/irq_work.h>
+#include <linux/dept.h>
 
 #include "workqueue_internal.h"
 
@@ -3155,6 +3156,8 @@ __acquires(&pool->lock)
 
 	lockdep_copy_map(&lockdep_map, &work->lockdep_map);
 #endif
+	dept_update_cxt();
+
 	/* ensure we're on the correct CPU */
 	WARN_ON_ONCE(!(pool->flags & POOL_DISASSOCIATED) &&
 		     raw_smp_processor_id() != pool->cpu);
-- 
2.17.1

