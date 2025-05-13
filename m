Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57971AB5208
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C049F10E56C;
	Tue, 13 May 2025 10:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6872C10E569
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:22 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-9d-682319f12074
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
Subject: [PATCH v15 30/43] cpu/hotplug: use a weaker annotation in AP thread
Date: Tue, 13 May 2025 19:07:17 +0900
Message-Id: <20250513100730.12664-31-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAz2Ta0yTZxTHfZ731lZLXjvnXumyzSrRYMaGQ3eWqDEmuGeJCyZ+8JYozXi1
 zbil3ISEBLQQLZcwDKJSakFXESrUUi9zlFQMHZeMgWJBhlDIIhJBMrDNCsjWovPLyT/nf/6/
 8+UcCaXoYMIl2uR0UZesTlSxMlo2varm87/XbdB82Xn/G/C9PkuDscnKQm9jAwKrIx/DZPu3
 MOCfQrDw+x8UVFb0IqgZe0aBwz2CwFl3moXHf4VBv2+Ghc6KIhbOXG1ioe/lIobhC+UYGuzf
 w6jlOQ3dZbUYKidZqKo8g4PlBYaApZ4DS14EjNdd5mBxLBo6RzwMOIe2wCXTMAstzk4a3PfG
 MTy+b2RhxPovA93uDhr8pUro/amEgZuvall46bdQYPHNcPDIZcbgNq8Fmz4ILJxbYuC3EheG
 wmu3MPQ//RVB61kvBrvVw8JD3xSGZnsFBfPX2xGMl05zUFAc4KAqvxRBUcEFGvTD22Dhn+Dm
 6tfRkH/FRsPNNx60eyexmqyIPJyaoYi+OYvM+56wxOk306SrViC/XH7GEX3rEEfM9gzSXBdJ
 rrZMYlIz62OIvf4cS+yz5RwxTPdj8qqnh9v/8RHZjgQxUZsp6r7YFS/TtFsWcKpXeurukwmU
 hxY5A5JKBD5GsDm87/X86A06pFl+kzA4GKBCeg3/mdBc8pwxIJmE4j0rhYHqpyhkfMDvE2r+
 dC0HaD5CmFhawiEt57cLrpHBd9BPhQabaxkkDfbfXO9Znlfw24QycwMdggp8lVQoLLYwbwPr
 hAd1g3QZkpvRinqk0CZnJqm1iTFRmuxk7amoH1KS7Ch4X5bcxaP30GzvgTbES5Bqlbxjcr1G
 wagz07KT2pAgoVRr5Pl3gy15gjo7R9SlHNdlJIppbUgpoVUfybf6sxIU/El1uvijKKaKuv9d
 LJGG56HTzpKu7+Juz7U+issZW7leEVZw4I43Z3t1YMG0Om7fZseOk/rajTvxXsPhiy5b7PmA
 ++C8Sbn10IukzaMTnxTHH7x02HPCEfNVuPxD6R5j1INhU5NyLUrpOzZU1HLFEGHM2pvRyqbH
 5ga/JTfrovJrHe/MW3Gtyxg210givXz4zyo6TaOOjqR0aer/AIXIDF5bAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/p7vj9Ntp+smMztN2JjLZx8PMs988zR8e5tmtfutOV7ir
 VMZKVyNqadJEuoqT6yiXKXR2SsdlUnoQ6lRMokS6pgdxNf757LX3+/N5v//5iAiZifIWqUPD
 BG2oUiOnJaRky9K4uT8mTVfNTyn0AVfvaRKuFJhpqL6dj8B8NxZDR8V6eN3XiWDwxUsC0tOq
 EWS3NhNw1+5EYM07RUPtx/FQ5+qmwZF2loa43AIaar4OYWi6mIoh37IZ3hs/kfA8JQdDegcN
 l9PjsHt8xtBvNDFgjJkJbXkZDAy1+oHD2UBBeaaDAuvbOXDpahMNpVYHCfaSNgy1D67Q4DT/
 oeC5/RkJfcmTofp8EgW3vuXQ8LXPSIDR1c3AK5sBg90wEQr17tSEn8MUPE2yYUi4dgdD3ZuH
 CB6dbsFgMTfQUO7qxFBkSSNg4EYFgrbkLgbiz/UzcDk2GcHZ+Isk6Jv8YfCXuzmz1w9iswpJ
 uPW7Aa1YzpuvmhFf3tlN8PqiY/yAq57mrX0Gkq/M4fj7Gc0Mr3/0luENlnC+KE/B55Z2YD67
 x0XxFtMZmrf0pDJ8Ylcd5r9VVTFbp+yWLAsUNOoIQTtv+UGJqsI4iI+0iCOL69tRDBpiEpFY
 xLELuYH3N8kRptnZXGNjPzHCnuw0rijpE5WIJCKCbRjLvc58g0aMCewmLvudbfSAZGdy7cPD
 eISl7CLO5mz8FzqVyy+0jQaJ3frvG1Wj+zLWn0sx5JMpSGJAY0zIUx0aEaJUa/x9dcGqqFB1
 pG/A4RALcn+Q8cTQ+RLUW7u+DLEiJB8nfdbho5JRyghdVEgZ4kSE3FMaW+yWpIHKqGhBe/iA
 Nlwj6MrQZBEp95Ju2CkclLFByjAhWBCOCNr/LhaJvWPQ5ubraw9F/9izfUnW3ujpVUFjepzF
 S+ru+XadCzDfNodE7tHPsETvTTCt+XJyX9YL264Webi81a/2+MrVXWOffK9X+/zxeHD02mLp
 QodGfCGsJmpWZYnPu/1ewR5ckv3DyeOPL2x4GjSpPSM1dUfCtrgzioJS7wXW4XWVOxWrFsXH
 bNmolpM6ldJPQWh1yr8J1dEwPQMAAA==
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

However, the annotation is too strong for that purpose.  We don't have
to use more than try lock annotation for that.

rwsem_acquire() implies:

   1. might be a waiter on contention of the lock.
   2. enter to the critical section of the lock.

All we need in here is to act 2, not 1.  So trylock version of
annotation is sufficient for that purpose.  Now that dept partially
relies on lockdep annotaions, dept interpets rwsem_acquire() as a
potential wait and might report a deadlock by the wait.

Replace it with trylock version of annotation.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 kernel/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b08bb34b1718..3eecd0a7b5b3 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -537,7 +537,7 @@ int lockdep_is_cpus_held(void)
 
 static void lockdep_acquire_cpus_lock(void)
 {
-	rwsem_acquire(&cpu_hotplug_lock.dep_map, 0, 0, _THIS_IP_);
+	rwsem_acquire(&cpu_hotplug_lock.dep_map, 0, 1, _THIS_IP_);
 }
 
 static void lockdep_release_cpus_lock(void)
-- 
2.17.1

