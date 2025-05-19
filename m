Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E0ABB872
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2423510E26E;
	Mon, 19 May 2025 09:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id B041910E1FB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:39 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-4d-682af76c7dad
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
Subject: [PATCH v16 01/42] llist: move llist_{head, node} definition to types.h
Date: Mon, 19 May 2025 18:17:45 +0900
Message-Id: <20250519091826.19752-2-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxScRSH+997ufdC0W70dtW2is1ebL1Y2k5btVab3bVe17f6UJS3YCE6
 VMy2Ni00i8BsqUvNgBwxwTJoRSVlOk0zy4qQzKysWYRms6AsegFbX86e7fx+z/lyaFzSJoil
 FaosXq2SKaWkiBANTTAvVH5LkC954V8Jwa9FBFRdtpPQdcmGwH41HwN/y3roDg0i+Nn5CIfy
 0i4Epjcvcbja2ofAbT1CwtN3E8ETHCahvVRHwtELl0l4HAhj0Ft2GgObYxO8sgwQ0HHKjEG5
 n4TK8qNYZHzAYNRSS4ElLx76rRUUhN8kQnufVwDungVwtrqXhAZ3OwGtrn4Mnt6sIqHP/kcA
 Ha1tBIQMcdBVohdA3SczCYGQBQdLcJiCJ41GDFqN06BeGxEWfvktgHv6RgwKa65g4Hl+C8Ht
 otcYOOxeEpqDgxg4HaU4/LjYgqDfMERBwclRCirzDQh0BWUEaHuT4ef3yOVzXxMh/3w9AXW/
 vGjNKs5ebUdc8+AwzmmdOdyP4DOSc4eMBHffzHI3Kl5SnPZ2D8UZHdmc05rAXWjwY5xpJCjg
 HLXHSc4xcpriTgx5MO7Tw4fU1hk7RCtTeaVCw6sXr94tkpf6TVSGSXSwzv2NyEN36BNISLNM
 Ens9cFHwn1uKAyjKJDOX9flG8ShPYWaxTv1AJCOiccY7nu0+93wsNJnZzHY0FGFRJph41tUd
 JKMsZpLZzyW3qH/SmaytvnFMJGSWsz265rGuJJLx2KqJqJRlKoVsWWMF+a8Qw961+ohTSGxE
 42qRRKHSpMkUyqRF8lyV4uCivelpDhT5L8vh8E4XGuna3oQYGkkniOvd8+USgUyTmZvWhFga
 l04R1zrnySXiVFnuIV6dvkudreQzm1AcTUini5eGclIlzH5ZFn+A5zN49f8tRgtj89AZV3tW
 /4vpiscdccc2zP6u01G+mBWdse+kb7N83Qr9vpsPijU2y+JA53D6umTPnDzzrBjD+vA2y4Dw
 2h/XpKkj3t05NVpNSlKK7n1KmpW3J6W3ZOhly44UqsJ7txRrD21cRhFtO7Lvrxus2VNS9tG3
 Kd67r6qnIHFjQrZhrdu0UEpkymWJCbg6U/YXs+vX6FsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUiTaxiHe57309XibUm9GFGMpDJOJ6Wdc0MRfVA9FEkIFQSRM1/cappn
 M08GlaaGaVoWJpraNFmyzdLNQk+uZDuullR23NEUtaN0pKVpH25p2cc0+ufmgvt3X/c/P55S
 mJkwXpuUIumT1DolK6Nl0esyf9F9jNCsyfMsA/94Dg1lt6wstN+0ILA2ZGDwtW6HrsAIgs+P
 n1JQXNSOoHKgj4IGdz8CR80ZFjpezgWvf4wFT1EeC5nXb7HwbHgKQ++VSxgstl3wwjREQ9vF
 KgzFPhauFmfi4HiFYdJk5sCUHg6DNaUcTA1Egqe/kwFXuYcBR88qKKnoZaHZ4aHB3TiIoeOv
 Mhb6rd8YaHM/pCFQsAjaC/MZqB2tYmE4YKLA5B/j4J8WIwa3cQHUZQWtZz98ZeBBfguGs9X1
 GLzddxHcy/kPg83ayYLLP4LBbiui4NONVgSDBW84yD4/ycHVjAIEedlXaMjqVcHnieDn8vFI
 yLhWR0Ptl060cQOxVlgRcY2MUSTL/if55P+XJY6AkSaPqkTSVNrHkax7PRwx2o4Re00Eud7s
 w6TyvZ8hNvM5ltjeX+JI7hsvJqNPnnC7F++XrY+XdNpUSf/rhliZpshXySVXyo7XOj7S6eg+
 n4tCeFFYK7ZeGEbTzArLxefPJ6lpDhWWivb8ISYXyXhK6JwtdpV3z4TmC9FiW3MOnmZaCBcb
 u/zsNMsFlfi28C73Q7pEtNS1zIhChN/EnjzXzK0imPFaKuiLSGZEs8woVJuUmqjW6lSrDUc0
 aUna46sPHU20oWCDTCenChvReMd2JxJ4pJwjr3Os1CgYdaohLdGJRJ5ShsrN9hUahTxenXZC
 0h89qD+mkwxOtIinlQvlO/ZJsQohQZ0iHZGkZEn/c4v5kLB0NCBEhTe/vr/573bekvJ7yeje
 +iFqVxhz2f8u9u3aQFv+xJ2vfywff70+Oq609zRJKHsUFYhZnNz0/wJV3NPInVF7Dlcl2Bi7
 UOM81T2vryl8S4x3/7OtN5VOe5+wqXo4pCn1XI8bn769x8VNbJtXHSpm+5QH5k+WGNNUKQMH
 H74cVNIGjToygtIb1N8B2g1/pz0DAAA=
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

llist_head and llist_node can be used by some other header files.  For
example, dept for tracking dependencies uses llist in its header.  To
avoid header dependency, move them to types.h.

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

