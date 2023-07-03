Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26747458D2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DC210E1F2;
	Mon,  3 Jul 2023 09:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id B7F9610E1F2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:40 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-e5-64a299b173bd
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 01/25] llist: Move llist_{head,
 node} definition to types.h
Date: Mon,  3 Jul 2023 18:47:28 +0900
Message-Id: <20230703094752.79269-2-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxiGec/He04rnSediWdinKvBLZqhLLo9Mc6YYeLrjzkN0R+QqJ09
 kUZatCgCkwRWREVAIYEKIpSKtWlR8KCbAyGIEUFiqdowZkoHCJsoX0OLdiBKNf65cyX381y/
 bp5WN7CLeL3xkGQyahM1WMkoR8OrvpZLbbrVLycUUJi3GgIvTzBQXluDwXPFhaDmWhYFw3c2
 w59TIwim73fRYCn2IKjq76XhWpsfQZPjVwyPBj8Bb2AcQ0fxKQzmC7UYHjyfocBXUkSBS/4R
 Os/YKGgJ/suAZRjDOYuZmounFATtTg7smZEw4CjjYKY/Gjr83Sw0PV4JpRU+DDebOhhouzFA
 waOGcgz+mrcsdLa1M+ApzGfh8pgNw/MpOw32wDgHD1usFNRlz4lyXsyycDe/hYKc6qsUeP9q
 RNB8oo8CuaYbw+3ACAX1cjEN/1+6g2CgYJSDY3lBDs5lFSA4dayEga43d1nI9q2F6dfleOM6
 cntknCbZ9UdI05SVIfdsIvmjrJcj2c2POWKVD5N6xwpy4eYwRaomAyyRnScxkSeLOJI76qXI
 mNvNkfaz0wwZ9FqobRFxyvU6KVGfIplWbdijTMh7+IQ9cF6ZOnQFMlEzn4sUvCisEZ91zTIf
 2f7Ez4UYC1+KPT1BOsQLhKViff4/bC5S8rRwfJ7omLiPQ8Wnwi6x2uljQ8wIkeJIZ857Vglr
 xcpgO/4g/Vx01bW8FymEb8Wh1wUoxOq5G1+pH4ekomBWiI5XFejDw2fiLUcPcwaprCjMidR6
 Y4pBq09cE5WQZtSnRu1NMshoblH2jJn4G2jSE9uKBB5pwlU9v1Tp1Kw2JTnN0IpEntYsUJn7
 K3VqlU6bli6ZknabDidKya0ogmc0C1XfTB3RqYV92kPSfkk6IJk+thSvWJSJzFuXfBHWvefV
 06wle13blymtqVtjazW5TsvgaXtDmTu6z9U7+3PrdW9dxOjBq0xh386hhTsevIk1zM/4ziDE
 xE9mbbx+sYCtbkzS/u3+KRD3n21T5PrFF6c3J7nTPVu+Ot4Y9cNveTJZrjoalhG+rNu9IYb7
 /ft049Cm0t3Pdsbsz2/QMMkJ2ugVtClZ+w4jw7xDTQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRzGe99zznuOxxaHJXSooFhEYGRWGv8wJOhDx6KIIroQ6WqHNnIW
 m5p2AWtm3slKTV3lJaaopW0F3RRRvCxpmYppraWWlXkLdebSLq7oy8MPnoffp4ejlGZmMaeL
 ipYNUepIFeFpfleIac39vGJNYMnnAMhKDwT3ZDIN5qpKAm33KhBUPriAYbBxG7yeGkYw8+Il
 BbnZbQiK+t5R8KDJhaCm7CKBjo8LoNM9RsCenUbAVFJF4NXQLAZnzlUMFdad0HqlGEOd5zMN
 uYMECnJNeC6+YPBYylmwJKyE/rJ8Fmb71oHd1cVAw007AzVvVkPeLSeBZzV2Gpoe9WPoeGIm
 4Kr8zUBrUwsNbVkZDNwdLSYwNGWhwOIeY6G9rhBDdeKcLWniFwPNGXUYku7cx9DZ8xRBbXIv
 BmtlF4EG9zAGmzWbgh+ljQj6M0dYuJTuYaHgQiaCtEs5NLz82cxAojMYZqbNZEuI1DA8RkmJ
 ttNSzVQhLT0vFqXH+e9YKbH2DSsVWmMkW5m/VPJsEEtF425GspanEMk6fpWVUkc6sTTqcLBS
 y40ZWvrYmYt3Lz3Eb9bIkbpY2bA2NILXprd/YE7d5OMG7kECquVSkQ8nCkGi5YOL9TIRVond
 3R7Ky37CctGW8YlJRTxHCZd9xbJvL4i3WCgcEe+UOxkv08JKcbg16S8rhGDxtqeF/JMuEyuq
 6/6KfISN4sB0JvKycm7jzHORK4gvRPPKkZ8uKlav1kUGBxhPaOOjdHEBx07qrWjuM5bzs1mP
 0GTHtnokcEg1X9F9tkijZNSxxnh9PRI5SuWnMPXd1igVGnX8GdlwMtwQEykb69ESjlYtUmzf
 L0cohePqaPmELJ+SDf9bzPksTkB90Qv4tyNhSdrmLJIibz207HBBqWLTufGlVct7Nuzssc+M
 Ps8fWu/4NbkiLZRvfMj76bcc2JEW/mUo8NNEjr9HuB42ookBfFQbZH6/uSks4sd3R0pQmH7S
 kWEP+v1tT7rTpj1t0p7dXr3vScDANd/A61MTmw6GJn/tXejJV+81hqhoo1a9zp8yGNV/AArV
 ij0vAwAA
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

