Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0153C873167
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96C311301D;
	Wed,  6 Mar 2024 08:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2A5210FFDA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:55:30 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-08-65e82f7e84b4
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
Subject: [PATCH v13 14/27] cpu/hotplug: Use a weaker annotation in AP thread
Date: Wed,  6 Mar 2024 17:55:00 +0900
Message-Id: <20240306085513.41482-15-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306085513.41482-1-byungchul@sk.com>
References: <20240306085513.41482-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0hTYRgH8N73XLdaHJbUSStjFIGRN7SeIKIPXU5XovsN6qSHtlKrWatF
 heWFMjUN5kolvLFETXNGdHGyFM1l2qplVmZqklpTw9pwadlW9OXhx3P5f3pYQllF+bOauBOS
 Nk6MUdFyUj44pWDR+ZB+KbSlay5kpYWC68clEvIqy2mwV5QhKL97AcNAwxp443YiGGt5ToDR
 YEdQ0P2BgLuNnQgsJRdpeNU7FRyuYRpshis0JBZV0vDi6ziGjuxrGMrMG6E5sxCD1dNHgnGA
 hlxjIvaWfgweUykDpoT50FOSw8B4dxjYOtsosLxbCDdudtBQY7GR0Hi/B8Orh3k0dJZPUNDc
 2ESCPSudgttDhTR8dZsIMLmGGXhpzcdwJ8kblPL9NwVP0q0YUoqrMDjePkJQe6kLg7m8jYZ6
 lxNDtdlAwM9bDQh6MgYZSE7zMJB7IQPBleRsEpI6ImFsNI9esVSodw4TQlL1KcHizieFp4W8
 8CDnAyMk1b5jhHzzSaG6JEgoqhnAQsGIixLMpZdpwTxyjRFSBx1YGGptZYSm62Ok0Osw4s3+
 e+TLoqUYjU7Shiw/IFcXptnJYx9lp53ZBxPQBJOKZCzPRfAVn7/g/3bbfv3t09wCvr3dQ/js
 x83lq9M/Uz4TnFPOF7euTkUsO43bwDsMUT6S3Hy+3yL6qOAW81kp8/4FBvJld6x/Q2Te9tWh
 q7TPSi6Sb0ks8Fru3Rll+eau29S/g5n845J2MhMp8tGkUqTUxOliRU1MRLBaH6c5HRx1NNaM
 vI9kOje+9z4asW+tQxyLVFMUK2R9kpISdfH62DrEs4TKT3H2Z6+kVESL+jOS9uh+7ckYKb4O
 BbCkaoYi3H0qWskdEk9IRyTpmKT9P8WszD8BbXpYyanXhwRaB9v69ShAlJLnbXCsXBigu2cM
 j6xv8NsXGLv3cFVxxer3Ow6c28mHe1L9VLptkWfXve7Z4l472tT0jFxycPKAciLHM2t5Z3DG
 N491+rbtuyYyu4+XmQ1zQj6t0q/LOF5Uq64h13wMUs/mZgVaMxcrh27s/n3d5ukrUpHxajEs
 iNDGi38AaAC9E0QDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSWUwTYRDAcb89vt1Wq5tK4gY0aiOaaORIxIxHjA9GV6Pog0fUqFTYQMNp
 CyieYKFB5BANRQG1HClXvQoPXgUCilYFERpEQRRSFcIKXkU5FKnGl8kvM8n/aVhSeYH2ZDVR
 saI2Sh2hwnJKHrhKv/Skb5/od69HBtnpfuD6nkpBwQ0LhpbrlQgs1UkE9D/cAC+HJQRjTc9J
 yM1pQVDY84aE6sZuBLay0xjanNPB4RrCYM85i0FffAPDi4FxArqM5wmotG6Bp+eKCKgb+UhB
 bj+G/Fw9MTn6CBgxVzBgTvSG3rI8BsZ7/MHe3U5Dw2U7DbbXS+DSlS4M9212Chpv9xLQdrcA
 Q7dlgoanjY8paMnOoOHaYBGGgWEzCWbXEAOtdSYCbiZP1gzfftPwKKOOAEPJLQIcr+4hqEl9
 R4DV0o6hwSURUGXNIWG09CGC3sxPDKSkjzCQn5SJ4GyKkYLkrgAY+1mA164UGqQhUkiuOizY
 hk2U8KSIF+7kvWGE5JrXjGCyxglVZYuF4vv9hFD41UUL1oozWLB+Pc8IaZ8chDDY3MwIjy+O
 UYLTkUts89ojXx0iRmjiRa3vmiB5WFF6CxXzVnZEMh5MRBNMGpKxPLeMH7b/+mvMLeI7OkZI
 tz24eXxVxgfabZKT5HxJ8/o0xLIzuc28IyfYTYrz5vtsajcV3HI+27DgX3AuX3mz7m9ENrnO
 GszCbiu5AL5JX4jPIbkJTalAHpqo+Ei1JiLARxcelhClOeITHB1pRZOvYj4xnn0bfW/bUI84
 FqmmKdbKPopKWh2vS4isRzxLqjwUx0edolIRok44KmqjD2jjIkRdPfJiKdUsxaZdYpCSC1XH
 iuGiGCNq/18JVuaZiGwpqafiomsnpq72VY22mmaEBjnLY0qqQ6h1pYGBnwt/13RurL9qNDRJ
 4f769i7MHWtyOftnHzj1Q5M1tNf0LHraM7/ngYOxu/flfZ7fu/VQ8I7a9+LCjJWZBmPQBUmy
 LJrjc3ezbWeZPymVl9csK9EOPMArtvOKL0mdmfs7w67lqyhdmNp/ManVqf8AuIaq+yYDAAA=
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

cb92173d1f0 ("locking/lockdep, cpu/hotplug: Annotate AP thread") was
introduced to make lockdep_assert_cpus_held() work in AP thread.

However, the annotation is too strong for that purpose. We don't have to
use more than try lock annotation for that.

rwsem_acquire() implies:

   1. might be a waiter on contention of the lock.
   2. enter to the critical section of the lock.

All we need in here is to act 2, not 1. So trylock version of annotation
is sufficient for that purpose. Now that dept partially relies on
lockdep annotaions, dept interpets rwsem_acquire() as a potential wait
and might report a deadlock by the wait. So replaced it with trylock
version of annotation.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 kernel/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index a86972a91991..b708989f789f 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -535,7 +535,7 @@ int lockdep_is_cpus_held(void)
 
 static void lockdep_acquire_cpus_lock(void)
 {
-	rwsem_acquire(&cpu_hotplug_lock.dep_map, 0, 0, _THIS_IP_);
+	rwsem_acquire(&cpu_hotplug_lock.dep_map, 0, 1, _THIS_IP_);
 }
 
 static void lockdep_release_cpus_lock(void)
-- 
2.17.1

