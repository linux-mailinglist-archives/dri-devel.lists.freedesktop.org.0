Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F22AB51ED
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCB910E2B2;
	Tue, 13 May 2025 10:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Tue, 13 May 2025 10:22:52 UTC
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9712610E1F9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:22:52 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-d8-682319edcf23
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
Subject: [PATCH v15 01/43] llist: move llist_{head, node} definition to types.h
Date: Tue, 13 May 2025 19:06:48 +0900
Message-Id: <20250513100730.12664-2-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTdxTG/b93qjWvHdFX0OBqjJlmKt5yCGLwFv/7sEWiUbO5bM14Y6tQ
 sQUUE02LxSBYREwBQbFWUggUwWIydNYhBASJiIAVFFGqorVUEqCNVby0GL+c/PI8z3nOl8OR
 sjt0BKdSp4oatSJJzkgoiXeG5Wfv3IXKFeUeOfgmsik4X2tjoOtKNQLbNT0B7pat8Mg/guDj
 vfskFJm6EFwaekrCtdZBBI7KTAZ6Xs6EXt8oA+2mXAaOX65l4IFnkoCBwgICqu2/wjPrMAUd
 +RYCitwMlBYdJ4LjDQEBaxULVt0icFWWsDA5FA3tg04aHI+XwrmyAQZuOtopaG1wEdBz4zwD
 g7YvNHS0tlHgz4uErjNGGmreWRjw+K0kWH2jLHQ3mgloNc+GOkOw8MT4ZxruGBsJOFF+lYDe
 /v8Q3Mp+ToDd5mSg2TdCQL3dRMKHihYErjwvC1mnAiyU6vMQ5GYVUmAYWAMf3wcvX5iIBv3F
 OgpqPjlRfBy2ldkQbh4ZJbGh/hD+4HvIYIffTOG7FgFfL3nKYsOtxyw229NwfeUSfPmmm8CX
 xnw0tledZLB9rIDFOd5eAr/r7GS3zftdsi5RTFKli5rl6/+WKCva9GxKseRwrc5C6dANLgdx
 nMCvFspf/ZKDwqbQ3d1Oh5jhFwt9fQEyxOH8AqHeOBzUJRzJO6cLjy70o5DxA/+b8KLbQYWY
 4hcJ92wmNsRSfo1QUFpHfiuNEqrrGqc4jF8rfKronMrLgpl8czUVKhX4s2FCS+Zd9tvCXOF2
 ZR+Vj6RmNK0KyVTq9GSFKmn1MmWGWnV42T8Hku0o+F7Wo5N/NKCxru1NiOeQfIa0zf2jUkYr
 0rUZyU1I4Eh5uFT/b1CSJioyjoiaA39p0pJEbROK5Cj5HOlK/6FEGb9XkSruF8UUUfPdJbiw
 CB3amzB69fXppSXj468uBp4TEc9m+beO57oC6ifNO/3FE8d29eQZd/Qe3Bijznatjd2X3PDl
 //7oPfOj5jtnp76tMJYlzNoUnmWYGRvTZooaHkrbTZnObZj+ZE9Gc4rsdqYkviPOe/pMzebr
 xdt+wgnxpi2FnrO0bqBAgx1/rtI2HqU9ckqrVEQvITVaxVfKGFVYWgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzH+/6e+3H2k/DDPJ2ap3nIHB9j+Eu/eRqThRlu9Zu7qavdVZyN
 3amMKIlET66jK3eXztU8pLNWpNPk9CRJiJlTqXHXROKO+eez197v996ff94MHmQmpzJKVYKo
 VsljpBRLsFtXJy/qnzJHsdTlGQtezykC8sutFLhuWhBYK/UYuB+Fw4uhPgQ/nz7DISfbhaDo
 3WscKuu7EThKT1DQ8mEctHoHKHBmn6Eg+Vo5Bc97RzDoupSFgcW+Bd6YPhLQmGnEIMdNQV5O
 MuY7nzAYNplpMOlCoac0l4aRd2Hg7G4noa7ASYKjcyFcKeyioNrhJKD+bg8GLVX5FHRbf5PQ
 WN9AwFDGNHCdTyeh7IuRgt4hEw4m7wANzTUGDOoNk8CW4ms9+W2UhMfpNRicvH4Lg9aX9xE8
 OPUWA7u1nYI6bx8GFfZsHH6UPELQk9FPQ+rZYRry9BkIzqReIiClSwY/v/s+F3jCQH/VRkDZ
 r3a0fq1gLbQioa5vABdSKg4LP7xtlOAYMhDCEyMv3Mt9TQspDzppwWBPFCpKFwjXqt2YUPTV
 Swp282lKsH/NooW0/lZM+NLURG+bvoddEy3GKJNE9ZK1B1hFSYOejr/MHinXGQkdqmLSUCDD
 c8t5d7OT9DPFzeU7OoZxPwdzs/iK9I8+nWVwrn0M/6LgJfIbE7it/PtmB+Fnggvln1qzaT9L
 OBmflWfD/5XO5C22mr8cyK3gf5U0/c0H+TKZBguRiVgDCjCjYKUqKVaujJEt1hxSaFXKI4uj
 4mLtyLcg07GR83eRpyW8FnEMko6VNLhnK4JIeZJGG1uLeAaXBkv0d3ySJFquPSqq4/arE2NE
 TS2axhDSyZKNkeKBIO6gPEE8JIrxovq/izGBU3VI/up4efSyeQONUYMBi5bWGkNWy/ZJZs4N
 KWr9XHxxe8b4NXtD2Yljvn0/t/vCeodkU650tnMwYKUrf3TzKll1Q+fDyPm735jjDTuqbhco
 89PSl+i0VqNHVTQxorvjctmGQrYtIswyY11qf9SuSu3gWXHG1eLltnm5zybsC+94uNC584aU
 0CjkYQtwtUb+ByZCBgM9AwAA
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
dept for tracking dependencies uses llist in its header. To avoid header
dependency, move those to types.h.

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
index 49b79c8bb1a9..c727cc2249e8 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -204,6 +204,14 @@ struct hlist_node {
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

