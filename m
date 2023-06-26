Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5C973EC72
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394E810E24E;
	Mon, 26 Jun 2023 21:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF12910E1E3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:53 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-95-64997d6a6eda
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 01/25] llist: Move llist_{head, node} definition to types.h
Date: Mon, 26 Jun 2023 20:56:36 +0900
Message-Id: <20230626115700.13873-2-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSW0xTWRSG2eeyz6FSc1KNc0Sj2IRgmIBg0Kw4aCTRuDXRGH0x44NUe2Zo
 hGKKgExCwqV4KaCgQhVRoJgOAdTa8oADh+kAIohCHQjTMRW1maiMIIq2WsFLqfFl5cv61/89
 LZ5W/clG8jr9Ucmg16SrsYJRTEVY4g7nX9QmDA3yUFmWAL53JxmovdGKwXW9BUFrWyEFE7e3
 wT/+SQSz94dpMFe5EDQ8fURDW984ArmpCMPIfwth1DeNYaCqFENx4w0MD17OUeCpPktBi30n
 DFZYKHAGnjNgnsBwyVxMBccLCgLWZg6sBdHgbarhYO5pIgyMj7EgP/wRLl7xYOiUBxjoa/dS
 MPJHLYbx1i8sDPb1M+CqLGfh2isLhpd+Kw1W3zQHfzvrKbAZg6L/52QKjr/9zMKdcmeQrt6k
 YPTfDgRdJ59QYG8dw9Djm6TAYa+i4ePvtxF4T09xUFIW4OBS4WkEpSXVDAx/usOC0bMOZj/U
 4s0/kZ7JaZoYHblE9tcz5K5FJLdqHnHE2PWQI/X2bOJoiiWNnRMUaZjxscTefAoT+8xZjpim
 RiniGevE5NXQEEf6L8wyu5f/rEjWSum6HMmwZlOqIu3M2GV05LLi2PkSG1uAungT4nlRSBLr
 ntAmFB5Cb4WRmWcsxIhudyC0XyxEiY7yZ6wJKXhaaFwgPu/v5eaDRcIu0f1ODjEjRIt33z8L
 lZXCOvFEkcx+k64UW2zOkChcWC923LOgeVYFb4o83XheKgql4WJv8zn8rbBU/KvJzVQgZT0K
 a0YqnT4nQ6NLT4pPy9PrjsUfysywo+BbWfPn9rejGdfebiTwSB2hTFhxQatiNTlZeRndSORp
 9WLlkg9mrUqp1eT9JhkyDxiy06WsbrSMZ9Q/KNf6c7Uq4VfNUemwJB2RDN9Tig+PLEAHU/x1
 MdH++KhNq1Yn9cSoT9lsFVand6Y3T3a69HVxOam/GKIyxRF56x53L309rrhT9TjCZKC25IaV
 1Wxr3Jn/OmxfILkuRVu4OvZA9gt+YO2OycpdyY6NsbL3/spIRUGpsYgUjwy9ySzcEHnrWuqe
 jup8194rZm5RirS9T+bVTFaaJjGWNmRpvgKDLJEiUgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfX/PHWc/p/FbJG6alklN2cfDzGzWb7aMabPlD27uxx13J3dE
 hvVw0bNq1Ull18WVinLXH1GXdimVh6KWtBNuJilFukgP3GX+ee+1vT+f119vBpeYSB9GqTkj
 aDUylZQSEaK92xI3nLhUIA+eTQmC7PRgcE0kE1BUXUVB171KBFW18RgMtYTD68kRBNPPO3Ew
 5HUhKPnwFofa1gEEtvIECro/LoYe1xgF7XlpFCSWVlPwcngGA0d+DgaVlgh4mmXCoGlqkADD
 EAWFhkTMHZ8xmDJX0GCO8wdn+Q0aZj6EQPtALwnNxe0k2PrXQ8FNBwUNtnYCWuucGHQ/LKJg
 oOoPCU9b2wjoys4g4e6oiYLhSTMOZtcYDa+ajBjU6N22LzM2DK78mCPhSUaTm27dx6DnTT2C
 xuT3GFiqeilodo1gYLXk4fC7rAWBM/MrDUnpUzQUxmciSEvKJ6Bz9gkJekcYTP8qonZu55tH
 xnBebz3H2yaNBN9h4vgHN97SvL6xn+aNlrO8tTyQL20YwviScRfJWypSKN4ynkPzqV97MN7R
 20Dxoy9e0Hzb9Wlin2+UaLtcUCljBO3GHUdEimu9xSi6WHQ+N6mGjEONTCryYjg2lHNm6QkP
 U+w6rq9vCvewN7uas2Z8IlORiMHZ0oXcYNtj2lMsZfdyfRO2eSZYf67j56f5ZzEbxl1NsJH/
 pH5cZU3TvMiL3czVPzMhD0vcNwkOO5WFREa0oAJ5KzUxaplSFRakO6mI1SjPBx09pbYg93LM
 l2ay69BEd7gdsQySLhIHr7oul5CyGF2s2o44Bpd6i5f9MsglYrks9oKgPXVYe1Yl6OxoBUNI
 l4v3HBSOSNjjsjPCSUGIFrT/W4zx8olDzpYtNfFWdpP22JLIH6cvzoUNWu60DNvfdT8PTFsj
 Kwl5F3AgP9OLe+n7zO+0oj567YOjzDH/jq3NF3Mybi//lrR+X1ms2tAwQupuce+jVIFD6ZVR
 +wsGCg91+n//vnvxXZWPJiYgV7GyTtJRFr01UpTuN16NIi47ri6ofjQxatwVKiV0CllIIK7V
 yf4Ci/xDFDUDAAA=
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 26 Jun 2023 21:03:34 +0000
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
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, paolo.valente@linaro.org,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, penberg@kernel.org, minchan@kernel.org,
 max.byungchul.park@gmail.com, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
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
index ea8cf60a8a79..b12a44400877 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -187,6 +187,14 @@ struct hlist_node {
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

