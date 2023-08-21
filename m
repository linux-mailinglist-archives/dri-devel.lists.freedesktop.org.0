Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16131782221
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAB510E18D;
	Mon, 21 Aug 2023 04:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Mon, 21 Aug 2023 04:04:44 UTC
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CEAD10E189
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:04:44 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-f9-64e2ded4f362
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 01/25] llist: Move llist_{head,
 node} definition to types.h
Date: Mon, 21 Aug 2023 12:46:13 +0900
Message-Id: <20230821034637.34630-2-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0yMcRjA+37fn53O3p22XmI4YjKJYc8wPzab9x+bCX9g0829dFzHLiIb
 KyXkQugHnXaVnXOd4r0MUUvmKkR0U8hNd+KacjndKZVU5p9nn+35PJ+/HpZQVFFTWI3uoKjX
 qbRKWkbKesKKFzhdbnVswfBMyDHEQqDvNAnGChsNzeVlCGyVaRi6nq6H1mA3gsGmVwTk5zYj
 KO74SEClw4Wg2nKChpbPE8EZ8NHQmHuWhvTSChpefxvC0J53EUOZtAGeXyjBUDvwlYT8LhoK
 89Px6PBiGDBbGTCnRoHbcpWBoY5F0Oh6S0H1+/lwpaidhkfVjSQ47rsxtFQZaXDZRih47mgg
 oTknm4Jb30to+BY0E2AO+Bh4U2vCcDtjNJT58w8F9dm1GDKv38HgfPcQQc3pTxgk21sangS6
 MdilXAJ+33iKwH2uh4GThgEGCtPOITh7Mo+EV8P1FGS0L4XBfiO9ZrnwpNtHCBn2w0J10EQK
 z0p44cHVj4yQUfOeEUzSIcFuiRZKH3VhodgfoATJeoYWJP9FRsjqcWLh+8uXjNBQMEgKn535
 eGPkNtlKtajVJIv6haviZQmGNx7qwDXZkc5ySEU1bBYKZXluCZ/TZ6P/s+R2jDPNzeXb2gaI
 MQ7nZvD27C9UFpKxBHdqAm/pbRqXJnFb+IA/iMaY5KL4kXs+aozl3FLe5LuD/0Wn82W3a8dD
 odwyXnpYNe4rRp0fHR5yLMpz50N5v+Mu8e9gMv/Y0kZeQHITCrEihUaXnKjSaJfEJKToNEdi
 du1PlNDoR5mPDW2/j/zNcXWIY5EyTB4/1a1WUKrkpJTEOsSzhDJcHvmrQ62Qq1UpR0X9/p36
 Q1oxqQ5FsqQyQr44eFit4PaoDor7RPGAqP+/xWzolFRU4H1XZCwKmb/G29ow7XhhyO5VFf2r
 1+V4rJtZqfOykV5+U9kWfaPKU9rgKrobsdWauSf20rQ5L3o37TZF5aXPCtNFbLO3tsvDqUrO
 gHvneevj6iOb5ml3VlomG7x9caa9tzydwxMfuKf6+vqvldTtCDAtm9Z+mC1LO2YPWaGIGVGS
 SQmqRdGEPkn1FylsathNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxiGed9zznsOdV1OKsajsGCakBlQhCjzURfjjzlPXLYsmYaEmEhj
 j1KBwlpEMJqgLY7xYcAFOrWYClobwK9TjSgCFcKXRGG0UWGAtqJIRKrMogjCAOOfJ1dyX7l+
 PRylsjLLOZ0+QzLoNSlqoqAVv2wyrfYM+rQxJbUESgpjIPAujwbrlRoC3ZerEdRcP4phpGUb
 PJoYRTB1v4sCS2k3gnPeAQqutw4iqHccI+Ae+ho8AT+BjtICAqbKKwT+eTWNob/sJIZq+Wfo
 LK7A4JocpsEyQuCMxYTnzksMk/YqFuw5EeBznGZh2hsLHYMPGWgu72Cgvi8KTp3tJ3CnvoOG
 1lofBvdtK4HBmlkGOlvbaeguKWLg0lgFgVcTdgrsAT8LPS4bhqvmudrx/2YYaCtyYTh+/hoG
 T28dgoa8pxjkmocEmgOjGJxyKQUfL7Yg8J14zUJu4SQLZ46eQFCQW0ZD16c2Bsz9cTD1wUq2
 bBKbR/2UaHYeFOsnbLR4r0IQb50eYEVzQx8r2uQDotMRKVbeGcHiufEAI8pVfxJRHj/Jivmv
 PVgce/CAFdv/nqLFIY8F/xqWoPheK6XoMiXDms2JiqTCnmdMerki6/llyEENXD4K5gR+nSD7
 Wsk8E/5b4fHjSWqeQ/gVgrPoBZOPFBzF/7FIcLy5vyAt5ncKgfEJNM80HyHM3vQz86zk4wSb
 /xr+HA0Xqq+6FkLB/HeCXHd7wVfNOW+9z+hipLChoCoUotNnpmp0KXHRxuSkbL0uK3pPWqqM
 5n7GfmS6pBa9c29rQjyH1F8pE8N8WhWjyTRmpzYhgaPUIcrQ916tSqnVZB+SDGm7DQdSJGMT
 CuVo9VLl9ngpUcXv02RIyZKULhm+rJgLXp6DMt46a8OODPy4LPFJULTFFr9iUXmW6fDagn2h
 pjSqbuuOG5U2745w+82+59bZqKUNfVF5M/urloxt/dQ7lbA+qDEvmjhWF99tazGfMqyKcv8e
 2jvc3vjNxvQZ9NcFff5G5w+us/8GmsL3bti+rMvd+FOuPW3llh4+Ytdvh0sdhV3xpExNG5M0
 sZGUwaj5HwEiwkAvAwAA
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

llist_head and llist_node can be used by very primitives. For example,
Dept for tracking dependency uses llist things in its header. To avoid
header dependency, move those to types.h.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/llist.h | 8 --------
 include/linux/types.h | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/llist.h b/include/linux/llist.h
index 85bda2d02d65..99cc3c30f79c 100644
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
index 688fb943556a..0ddb0d722b3d 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -193,6 +193,14 @@ struct hlist_node {
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

