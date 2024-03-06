Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D3087314F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1304110EC05;
	Wed,  6 Mar 2024 08:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E96610EC05
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:55:26 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-38-65e82f7c082d
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
Subject: [PATCH v13 01/27] llist: Move llist_{head, node} definition to types.h
Date: Wed,  6 Mar 2024 17:54:47 +0900
Message-Id: <20240306085513.41482-2-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306085513.41482-1-byungchul@sk.com>
References: <20240306085513.41482-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0zMcRjHfT7fn3dz9t2x+cqIM7/ph8kem9H8wfcPrMk/+IObvtNRx+5U
 smxxlZ+VkMg5d1dOKpWrJtTtZMpJV3LqUI00aq6yuOiH4y788+y153k/rz1/PCwhr6aCWJX6
 iKhRK+MUtJSUDkw1rUwJ7RPD0vuWQs75MPB+P02CvryUhtayEgSlVScw9D/dDB0jHgTjzS0E
 5OW2IjB96CKgqqEbQV3RSRpe9U4Dl3eIBkfuORp0BeU0vPwygaHzykUMJdat0HTBjME++pmE
 vH4arufpsL/0YRi1FDNgSV0IPUX5DEx8CAdHdzsFdW+XwzVDJw21dQ4SGmp6MLx6qKehu/Q3
 BU0Nz0hozcmk4O6gmYYvIxYCLN4hBtrsRgwVaX5RxjcfBY2ZdgwZhfcwuN48QmA7/R6DtbSd
 hideD4ZKay4BY7efIujJGmAg/fwoA9dPZCE4l36FhLTOCBj/qacj1wpPPEOEkFaZJNSNGEnh
 uZkXHuR3MUKa7S0jGK0JQmXRMqGgth8LpmEvJViLz9CCdfgiI5wdcGFh0OlkhGdXx0mh15WH
 o4J2SdfFiHGqRFETun6vNDbDaWAO35AeNd6qplORjT2LJCzPreabcrqY/3y3rYAKMM0t5t3u
 USLAM7h5fGXmp8k+wXmkfKFzU4Cnc9t4Z+6byV2SW8i/KDOjAMu4CN5w34P/OoP5kgr7pEfC
 reGzB7PpAMv9mWadyc9Sf+Yny5vtLf+OmMU/LnKTF5DMiKYUI7lKnRivVMWtDolNVquOhuw7
 FG9F/meyHJ/YXYOGW6PrEccixVRZpOSzKKeUidrk+HrEs4RihixlrFeUy2KUycdEzaE9moQ4
 UVuPZrOkYqZs1UhSjJzbrzwiHhTFw6Lm/xSzkqBUJAlll/yOd3y1Xf5xM6Ukq1zbsaisW/da
 krTv1m5fVNeWOYamtWEbfmUHGwoz5Y13DhRH5+/95HxXtcDXQQ3pdwZXu+eeyh9bUBv9+nZE
 SMNWn06vvhkud0Xe275xPmFzG8/UmDpXNF+61ubYEeKLUqf3i96v69ujG2+c+jieoGmpUJDa
 WGX4MkKjVf4BXK6NJEgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0hTYRgH8N73nPOe42hxmlKH+lAsJLJSuxgPdiWiDlERQVRC1KGOuZqr
 NrOMEu+UOs1orovK1Fqmlja1q5poWitblsMurFEmLXEqmLNMqVzRl4cfz//h/+nhKJWZmcFp
 dHGyXidp1URBK7YsT114KuyrHF5xQQV52eHgGz5DQ0FVJYGOWxUIKmuTMfS2boA3I14EYy9e
 UmA2dSAo/vSBgto2N4KGshQCnT1TwOkbJGA3ZRFILa0i8KpvHIMr/zyGCttmeH6uBEPTqIcG
 cy+BK+ZUPDG+Yhi1lrNgTQqG7rLLLIx/WgR2dxcDLYV2Bhrez4dLRS4C9Q12GtrudWPofFBA
 wF35m4HnbU9p6MgzMnBzoIRA34iVAqtvkIXXTRYM1WkTbRnffjHwxNiEIePqbQzOdw8RNJ75
 iMFW2UWgxefFUGMzUfDzeiuC7px+FtKzR1m4kpyDICs9n4Y0VwSM/SggayLFFu8gJabVHBcb
 Riy0+KxEEO9f/sCKaY3vWdFiOybWlIWIpfW9WCwe8jGirfwsEW1D51kxs9+JxQGHgxWfXhyj
 xR6nGW+dGaVYsV/WauJlfdiqvYqYDEcRe6RQccJyrY4koUYuEwVwAr9UuPm6lPGb8HOFt29H
 Kb+D+NlCjfHL3z3FexXCVcd6vwP5LYLD9I71m+aDhfZbJchvJR8hFN314n+ds4SK6qa/PQH8
 MiF3IJf4rZq4eZFaTM4hhQVNKkdBGl18rKTRRoQaDsUk6DQnQvcdjrWhiXexnh7Pu4eGOzc0
 I55D6snKNQEeWcVI8YaE2GYkcJQ6SHnqZ4+sUu6XEk7K+sN79Me0sqEZzeRo9XTlxh3yXhV/
 QIqTD8nyEVn/P8VcwIwk5L6z2zCttSinw7vrV2RidF92VLUHO92bLO3Xt//gIzqjjVTstMdC
 +sl1L135VnvX4sIbkWvrAo/Wrs5NmX86dImkO/jRE8lqjVGthsxHgceFRFPgPOwa2bY9LDEd
 L7iYklg2uZ2bY26XZu2M84Tos6Z+7mkOVVUFb7w/aeX3nClq2hAjLQqh9AbpD3/EcVYqAwAA
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

