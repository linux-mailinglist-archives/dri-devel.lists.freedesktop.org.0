Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BAC87316E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C798113027;
	Wed,  6 Mar 2024 08:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BBFF10FFDA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:55:33 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-ca-65e82f7ffbf2
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
Subject: [PATCH v13 26/27] fs/jbd2: Use a weaker annotation in journal handling
Date: Wed,  6 Mar 2024 17:55:12 +0900
Message-Id: <20240306085513.41482-27-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306085513.41482-1-byungchul@sk.com>
References: <20240306085513.41482-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa2yLYRQHcM/zXlurvKklXpMgFffYRUzOEqRCeHwQQnwhQWNvrHQjHbsI
 yVgtdDpDdrENu6lmF5eOmMsutnQ3NmOzbjPDUmbRbWxaujVoJ76c/HLO/5xPh6eUD5ggXhtz
 TNLHaHQqVk7LhwMKVySFfJFCi20BcOlCKLh+nKMh704ZC+23SxGU3T+NYci2GexuJ4LJ1pcU
 ZGW0Iyj4+I6C+w39CKosZ1jocMyATtcoC80ZqSwkF91h4dVXL4a+zMsYSq1b4Xl6IYZazyAN
 WUMs5GYlY1/5gsFjLuHAnLQQBiw5HHg/hkFzfxcDVb3L4er1PhaeVjXT0FA5gKHjcR4L/WV/
 GHje0ERD+yUTA+UjhSx8dZspMLtGOXhdm4/hrsF3KGX8NwONploMKcX3MHT2PEFQfe4DBmtZ
 Fwv1LieGCmsGBRO3bAgG0oY5OHvBw0Hu6TQEqWczaTD0hcPkrzxWHUHqnaMUMVTEkyp3Pk1a
 CkXyKOcdRwzVvRzJtx4nFZZlpOjpECYFYy6GWEvOs8Q6dpkjxuFOTEba2jjSlD1JE0dnFt4e
 tFu+JlLSaeMkfci6/fKo259eU0fd0xNabDUoCU3IjEjGi8Iqsf+Zg/7vGqOZ8psVFovd3Z4p
 BwrzxQrTZ8ZvSnDKxeK2TX7PFLaJxvdG7DctLBRH7capvEJYLZp6bdy/m/PE0ru1U32Zr39x
 5CLrt1IIF1uTC3yW+zK/ePGNzcL+W5gtPrN00+lIkY+mlSClNiYuWqPVrQqOSozRJgQfOBJt
 Rb5nMp/y7qlEY+0765DAI1WAQi0blJSMJi42MboOiTylClScnHBISkWkJvGEpD+yT39cJ8XW
 oTk8rZqlWOmOj1QKBzXHpMOSdFTS/59iXhaUhEImUsZ/dO00hmtHrm202zfbb8398z3tRfm3
 tq4cwbv95Iv0t+qIJa1icEJEx/j5eEevWLp3wYZFV3Ln6x6ailMPD1Yq0nY4mR1eT1wmurHm
 Z25lWI/JtTTg+pbpQw7+ULORa1E1rs+WB5KHps+qyXT1lZs9aoMraG35AUvJrux4FR0bpQlb
 RuljNX8BC/lkdUgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0iTYRQH8J7nvW2rxcsa9aZFMZJIy7RaHCrCiOqlqxEU5Qcd9ZJLZ7ap
 aSWutKiZlYEt00RN1nLz0uyDXUxTtlLJTEXLWyWWyqYDa9LULs7oy+HH/xz+n46IkBkpP5E6
 LkHQxqliFbSElOzfnL4mbe2wEJL3aj1kXw8Bz4+rJORXWGloLbcgsD65iGHEvgu6JlwIpt6+
 I8CY04qg6EsfAU8c/QhqzJdoaB+cDx0eNw2NOZk0pD+ooOG9cxpD753bGCy2fdB8qxhDnXeI
 BOMIDXnGdDwzhjF4TaUMmPQBMGC+x8D0l1Bo7O+koOF+IwU13UGQW9BLw4uaRhIc1QMY2p/l
 09Bv/UNBs+MNCa3ZWRSUjRXT4JwwEWDyuBloqyvEUJkx03bl+28KXmfVYbhS8hhDx8fnCF5e
 /YzBZu2kocHjwlBlyyFg8qEdwcCNUQYuX/cykHfxBoLMy3dIyOhVwtTPfDpsE9/gchN8RtVZ
 vmaikOSbijn+6b0+hs942c3whbZEvsocyD94MYL5onEPxdtKr9G8bfw2wxtGOzA/1tLC8G/u
 TpH8YIcRh/sfk2w5IcSqkwTt2q1Rkujyr21E/MTc5CZ7LdKjSbEBiUUcu4GrNZgIn2l2Jffh
 g3fWcnY5V5X1jfKZYF0SrqRlp88L2AOc4ZMB+0yyAZy7yzB7L2U3clndduZf5zLOUlk3m4tn
 8ptjN2mfZaySe5teRN9CkkI0pxTJ1XFJGpU6Vhmsi4lOiVMnBx8/rbGhmXcxpU5nV6Mf7bvq
 EStCinnSMPGQIKNUSboUTT3iRIRCLr0wOSjIpCdUKecE7elIbWKsoKtH/iJSsUi6+4gQJWNP
 qhKEGEGIF7T/t1gk9tMj0O85vsomL4p4FBLUHOSKdJCagoPb/kQSqdfeL+v6tSTi83BqpN9o
 eOjCw0PygEnv0epM2fkC5871/atze0rKTgU83P1scXlt4N7gHmeP9Mw35b7H9vDxV8mOsM1a
 sdJxeAFLLLW05QqOxB3mR5oovXPRuuQV7u3nnt6F0UPB5jQFqYtWhQYSWp3qL1XXE88qAwAA
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

jbd2 journal handling code doesn't want jbd2_might_wait_for_commit()
to be placed between start_this_handle() and stop_this_handle(). So it
marks the region with rwsem_acquire_read() and rwsem_release().

However, the annotation is too strong for that purpose. We don't have to
use more than try lock annotation for that.

rwsem_acquire_read() implies:

   1. might be a waiter on contention of the lock.
   2. enter to the critical section of the lock.

All we need in here is to act 2, not 1. So trylock version of annotation
is sufficient for that purpose. Now that dept partially relies on
lockdep annotaions, dept interpets rwsem_acquire_read() as a potential
wait and might report a deadlock by the wait. So replaced it with
trylock version of annotation.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 fs/jbd2/transaction.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
index 5f08b5fd105a..2c159a547e15 100644
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@ -460,7 +460,7 @@ static int start_this_handle(journal_t *journal, handle_t *handle,
 	read_unlock(&journal->j_state_lock);
 	current->journal_info = handle;
 
-	rwsem_acquire_read(&journal->j_trans_commit_map, 0, 0, _THIS_IP_);
+	rwsem_acquire_read(&journal->j_trans_commit_map, 0, 1, _THIS_IP_);
 	jbd2_journal_free_transaction(new_transaction);
 	/*
 	 * Ensure that no allocations done while the transaction is open are
-- 
2.17.1

