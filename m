Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E461F8BF9F4
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274D610FFEC;
	Wed,  8 May 2024 10:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B3EE113527
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:02:54 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-25-663b4a38f818
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
Subject: [PATCH v14 01/28] llist: Move llist_{head, node} definition to types.h
Date: Wed,  8 May 2024 18:46:58 +0900
Message-Id: <20240508094726.35754-2-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSaUxTaRQGYL/v3t57qZZc68IVjUsTRyNRUUGPa/ilXzQak8lMJmPMTMde
 pJFWLLIZjSgVFQEFZat1wmI6FapoazKCQAqmCCIISrAii6CiaCkGLLEWF+ry5+TJOW/eX4ej
 5DZJMKfWHhR1WmW0gpHS0qEpRUth6/rI0P9tYZCVHgqe96doMJZbGGi9VobAcvMYhkHHFng8
 5kLga35AQV5OK4Kivm4Kbtb3IKg2H2fg0YtAaPcMM9CYc4aBlJJyBtrejmPoys3GUGbdDk3n
 ijHYva9oyBtk4GJeCp4YrzF4TaUsmJIXQr/ZwMJ43wpo7OmQQHVnCBT828VAVXUjDfW3+jE8
 qjQy0GP5IoGm+gYaWrMyJHDVXczA2zETBSbPMAsP7YUYrusnilJHP0vgboYdQ+rlGxjan9xG
 UHPqGQarpYOBOx4XBps1h4KP/zkQ9GcOsXAi3cvCxWOZCM6cyKVB3xUOvg9GJmItueMapoje
 lkCqxwppcq9YIBWGbpboazpZUmiNIzbzElJSNYhJ0YhHQqylpxliHclmSdpQOybulhaWNOT7
 aPKiPQ/vDP5TukElRqvjRd3yTX9Lox6a71Mxl6SJHe5KJhnVcGkogBP4MKH2Sib70xfyfZTf
 DL9IcDq93zydny/YMgYkflO8Sypcbtns9zR+h1BR9RylIY6j+YXCy/Kp/rWMDxd69V0/KucJ
 Zdft32oC+NXCk1du5Ld8InM7xfAj84UTmg2q754l1Jqd9DkkK0STSpFcrY3XKNXRYcuikrTq
 xGV79musaOKVTEfGd91CI62/1iGeQ4opMnvQuki5RBkfm6SpQwJHKabLHCfXRMplKmXSIVG3
 /y9dXLQYW4dmc7QiSLZyLEEl5/cqD4r7RDFG1P28Yi4gOBlFnDdWjFfOnWEJmdUJWxfPX/vU
 uTNol75396rnkyImOxp58o9mjyHQcrp3QX7J4syzib+7HalHU3uY9w3NMNvk2zfncEn6aEub
 puYlD3Ha3G2/zMha3/2m3JLQFHjJ+O7x+QM3vJ8KVFcGzmaH/qGOaZs5OvCbc+NU/CHRUeVa
 8xEr6Ngo5YollC5W+RXFi365RgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5+7q9lpCZ0sKhbR3QtkvaSEfShPUiJEVwJbdczhJdnMMohm
 W2VeQsOpeQmbskxX1iaSprY0zWmZ5loXlku7mLQmlJPW7OKKvrz8eJ6H36eXwSVFZCAjT0kT
 FCmyJCklIkQx4eq1EB0eH5JzfxEU5IaAeyKLgPJ6AwX9t+oQGBoyMRjrjIIXk04E3idPcSjW
 9iO4NvwGh4auIQStNWcpGHzvD1b3OAUWbQ4F6qp6CgY+T2FgL7qMQZ1xB/Tm6zAwe0YJKB6j
 oKxYjU2fTxh49LU06FXLYKSmlIap4VCwDNlI6KiwkND6ejVcuWqnoKXVQkDX3REMBpvLKRgy
 /Caht6ubgP6CPBJuunQUfJ7U46B3j9PwzFyJwW3NtO38t18kPMozY3C++g4G1lf3ELRlvcXA
 aLBR0OF2YmAyanH4cb0TwcilLzScy/XQUJZ5CUHOuSICNPYw8H4vpyI38h3OcZzXmE7wrZOV
 BN+j4/im0jc0r2l7TfOVxuO8qWYVX9UyhvHXvrpJ3lh7keKNXy/TfPYXK8a7+vpovrvES/Dv
 rcVY7IL9oogjQpI8XVAEbzooSnhW8xhPrRCdtLmaKRVqY7KRH8Ox67jCEi/uY4pdzr186fnL
 AewSzpT3kfQxzjpFXHXfVh/PZWO4ppZ3KBsxDMEu4z7Uz/HFYjaMc2js9D/lYq7utvmvxo9d
 z70adSEfS6Y399SldD4SVaIZtShAnpKeLJMnhQUpExMyUuQngw4fSzai6W/Rn54quIsmBqPa
 Ecsg6SxxPxUeLyFl6cqM5HbEMbg0QNx5YUO8RHxElnFKUByLUxxPEpTtaAFDSOeJo/cIByXs
 UVmakCgIqYLif4sxfoEq5PhocXitZueNi/sYQ2aIbehHWuMDrWvziUJ6VtSZiJXzB5/bujXb
 Fg5En5WOrg6e6rZtz18T0afbGxl6SL0rsCk6TChDYlNu5MasM0F7vMOzK942bvGfmXq0RStt
 XhHXOxGy0+GV/HYY9u2OTfMUjh/Q9TxU2Zf+VLVFPG/ojJ8tJZQJstBVuEIp+wPFHbV0KQMA
 AA==
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
index 2bc8766ba20c..a1e4e046cfa5 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -202,6 +202,14 @@ struct hlist_node {
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

