Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F76883A94F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A469910F6BD;
	Wed, 24 Jan 2024 12:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Wed, 24 Jan 2024 12:14:54 UTC
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id E474810F6BD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:14:54 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-51-65b0fbb4aca7
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 01/26] llist: Move llist_{head, node} definition to types.h
Date: Wed, 24 Jan 2024 20:59:12 +0900
Message-Id: <20240124115938.80132-2-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSW0wTaRTH/b6Z+WboUjMpGkd8QBurCcYLBs1xo4ZkH3Z40JhojJFEbWSU
 slxMy3WzRkQEF0RBU1CsWkBrU6Bgi9EVSipqoRKhYsN2CSASd5EVRMGycvHSsvpy8ss5//xy
 Hv4cpWhiwjlNSpqkTVEnKYmMlo2FVq5tnG2QNkx4NkLp2Q3g/3CGBkN9LQGPtQZBbeNJDCOP
 f4Y/p0YRzD7toqBc70FQ+bKfgkbXAAKHOZfA81cLwesfJ+DWFxE4VV1P4NmbOQx9ZRcw1Nh2
 QEdJFQbn9DAN5SMErpSfwoHxGsO0ycKCKUcFQ+YKFuZeRoF7oIcBR+8auHytj0Czw02D694Q
 huf3DQQGar8w0OFqp8FTWsxA3dsqAm+mTBSY/OMsdDuNGBryAqL8yc8MtBU7MeTfuI3B+1cT
 gpYzgxhstT0EHvpHMdhtegpmbj1GMHRujIXTZ6dZuHLyHIKi02U0dH1qYyCvbxPMfjSQmB/F
 h6PjlJhnzxQdU0ZafFIliH9U9LNiXksvKxpt6aLdHClWN49gsXLCz4g2y+9EtE1cYMXCMS8W
 33Z2smL7pVlafOUtx7uW7ZdtjZeSNBmSdv32Q7KE/M5r7LGrsizjzTskB7VwhSiEE/ho4WJu
 G/OdHXWTJMiEXy34fNNUkBfxywV78T+BjIyj+IIfBPO7p/OhMH6n4Cgax0GmeZXwb1c3HWQ5
 v0m47rLS/0sjhJoG57wohN8s1F3und8rAplBy3k2KBX4ghDB0lH47YulwgOzjy5BciNaYEEK
 TUpGslqTFL0uITtFk7XucGqyDQUqZTo+F3cPTXh2tyKeQ8pQeYylXlIw6gxddnIrEjhKuUju
 W2qVFPJ4dfavkjb1oDY9SdK1omUcrVwi3ziVGa/gj6rTpF8k6Zik/X7FXEh4DtI7dKuGS1Kl
 9d7ImYN3PL7f7qpLa6L3xR7ZfTdu8knEgm5jxEwmdaDf2h2amL1yr8OZ82BP2QmDyur2Vxxe
 kS6b+Xz/aGxsXHJ4+DYhNO3D4iXmT6rzBTsMivd2fWOYzrXlp7+JL4I9kFgRo1S5Xz/72Hyo
 57+hR++LTuxvejGcu0ZJ6xLUUZGUVqf+Ctduq0FOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0yMcRzH+36f5/k+T8fZ08k8YmM3ZCEZtY9l1j94Zqtl/vBjpBsP3frB
 7kgZW7mEcgiJujjhtOunp5Afl1up5EelQlrdqjVEydTFuURl/vnstff7vddfH45S5TI+nDbu
 gKSL08SoiYJWhAUblpa7S6UAxzUfyDgdAM7hkzSYSgoJNBUXICgsT8bQV7Me3o30I3C/aqQg
 K7MJwfXuTgrKax0IbPnHCLT0ToNW5yCB+sx0AoYbJQRefxnF0HHpPIYCORRenMvDYHd9pCGr
 j0BOlgGPn08YXBYrC5akBdCTn83CaPdyqHe8ZaA6t54BW/tiuHK1g8BjWz0NtRU9GFoemgg4
 Cv8w8KL2GQ1NGUYGir7mEfgyYqHA4hxkodluxlCaMm5LHRpjoM5ox5B68w6G1vePEFSe7MIg
 F74lUO3sx1AmZ1Lw63YNgp4zAywcP+1iISf5DIL045doaPxdx0BKRyC4f5pISLBY3T9IiSll
 h0TbiJkWn+cJ4oPsTlZMqWxnRbN8UCzL9xNvPO7D4vXvTkaUraeIKH8/z4ppA61Y/NrQwIrP
 Lrtpsbc1C4fP2aZYvVuK0cZLumVrIhVRqQ1X2f25igTzrbskCVVyaciTE/iVgq1oiEww4X2F
 tjYXNcHe/DyhzPiBSUMKjuJPTBHyv72aHE3nwwRb+iCeYJpfIHxubKYnWMkHCtdqi+l/0rlC
 Qal9UuTJBwlFV9onc9X4pst6lj2HFGbkYUXe2rj4WI02JtBfHx2VGKdN8N+1L1ZG409jOTqa
 UYGGW9ZXIZ5D6qnKEGuJpGI08frE2CokcJTaW9k2q1hSKXdrEg9Lun07dQdjJH0Vms3R6pnK
 DZulSBW/V3NAipak/ZLuf4s5T58k9HLh/HivwPA39oiho3cNQyjNfmes87066GlzQrR84fKn
 JxH3N9VVrPJrCl203fUwOfuHh3H0jdc9khS5TnZEtPfO2KHBz71ClbZ5Fz1ig/3pnYt7jKYj
 4dPdYSh0OGjJqoB3vw3JAVNC9qz1tW+92d218VjQFm2fqeh1dk7NqUVjK9S0Pkqz3I/S6TV/
 AentXzAwAwAA
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

