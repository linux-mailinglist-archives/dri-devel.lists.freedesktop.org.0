Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D850ACA6A5E
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 09:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D4710EA41;
	Fri,  5 Dec 2025 08:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92FDC10EA23
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 07:19:18 +0000 (UTC)
X-AuditID: a67dfc5b-c45ff70000001609-83-6932876ddb02
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
 yunseong.kim@ericsson.com, ysk@kzalloc.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com,
 corbet@lwn.net, catalin.marinas@arm.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, luto@kernel.org, sumit.semwal@linaro.org,
 gustavo@padovan.org, christian.koenig@amd.com, andi.shyti@kernel.org,
 arnd@arndb.de, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 rppt@kernel.org, surenb@google.com, mcgrof@kernel.org, petr.pavlu@suse.com,
 da.gomez@kernel.org, samitolvanen@google.com, paulmck@kernel.org,
 frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com,
 josh@joshtriplett.org, urezki@gmail.com, mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com, qiang.zhang@linux.dev, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, chuck.lever@oracle.com,
 neil@brown.name, okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com,
 trondmy@kernel.org, anna@kernel.org, kees@kernel.org,
 bigeasy@linutronix.de, clrkwllms@kernel.org, mark.rutland@arm.com,
 ada.coupriediaz@arm.com, kristina.martsenko@arm.com,
 wangkefeng.wang@huawei.com, broonie@kernel.org, kevin.brodsky@arm.com,
 dwmw@amazon.co.uk, shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com,
 yuzhao@google.com, baolin.wang@linux.alibaba.com, usamaarif642@gmail.com,
 joel.granados@kernel.org, richard.weiyang@gmail.com,
 geert+renesas@glider.be, tim.c.chen@linux.intel.com, linux@treblig.org,
 alexander.shishkin@linux.intel.com, lillian@star-ark.net,
 chenhuacai@kernel.org, francesco@valla.it, guoweikang.kernel@gmail.com,
 link@vivo.com, jpoimboe@kernel.org, masahiroy@kernel.org,
 brauner@kernel.org, thomas.weissschuh@linutronix.de, oleg@redhat.com,
 mjguzik@gmail.com, andrii@kernel.org, wangfushuai@baidu.com,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-modules@vger.kernel.org, rcu@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 2407018371@qq.com, dakr@kernel.org, miguel.ojeda.sandonis@gmail.com,
 neilb@ownmail.net, bagasdotme@gmail.com, wsa+renesas@sang-engineering.com,
 dave.hansen@intel.com, geert@linux-m68k.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: [PATCH v18 13/42] dept: apply sdt_might_sleep_{start,
 end}() to hashed-waitqueue wait
Date: Fri,  5 Dec 2025 16:18:26 +0900
Message-Id: <20251205071855.72743-14-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251205071855.72743-1-byungchul@sk.com>
References: <20251205071855.72743-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTdxjF+d/7v7e3jc1uKpE7XObSxJloYGDUPDHLZvjC30XNkn3Y4jK3
 Rq7jhlJMQV6cc0DQKuJkTdplFKEg6RCqvNaXabOKGw7UWQSlmpYrWqsdIIZYGC9dV7r57Zdz
 nnNyPjwcrXnApHKSoUg0GnR6LavCqqkVTWkG00Ypo8ulAb8cZOB+hQdD5NUxDPUdThaitosK
 +GO0EoP3fDsCOXIMwdyijYYjl2MYouZ+BVgqEMTc/QisQ2YafN5fabCMB1n4MVyBYdpRgyD8
 ezZMyVcYiAWeUTA6O4nAEfyHgqDHhCBqzYMJ68v4vcWLoGk8QMNM+BGC3v4xBO7WShae1rpo
 GIlMszBgOcHC1FA9BfZKNwNDtyYQnLaZEYQeuikYmliiwG81U9DevRNkRwjHN7Bg7UqBeUeb
 Ahzla8F2e5iBx611CojZCyBwyoJhYOw+A/KNowy8GhmnwFkToqH7SVxrOtqC4acGPwtX3QMY
 ajpdDIw5Ywx4PTcZuNvujWfrzuJtOaSt5wJFjtyNssTZ4ERkccGMyPXJaZpU9ZSQhcg9lrhn
 7ZgMNguk5fgCRX64nUYu1wUUxN59gFT9NsWQntb15MzVMPVx2m7V+zmiXioWje998JUqt/fW
 cbRf5krPeDvociSz1UjJCfwm4emVCH7N/sBJxTKz/DrB55unlzmZf0foORliqpGKo/nhNYJp
 /vuEsZL/QmgYvZMIY36tEPKdoJZZzW8Rzi3+rPivdI3Q3ulJ3CvjumV0IcEafrPQWD2XKBX4
 RqUw9+ez/1e8KVxr9eFapLajpDakkQzF+TpJvyk9t8wglabvLcjvRvGHc3y79PklNOP9pA/x
 HNKuUHtKMiUNoysuLMvvQwJHa5PVk/oMSaPO0ZUdFI0FXxoP6MXCPrSaw9oU9cbZkhwN/7Wu
 SMwTxf2i8bVLccrUclSbfTYpMPaZNLiq0fR81V+d2/2KzI7gp+7ISGXR7lQmZZ/cZdsVOpS1
 JevOu65oxNT8Vl991fZB5R77hplS9brnN/YxycUkb+cv32nl7GvOb5IebN2w+cWON0oyhve4
 9ubPfpRuzj3sGPxwl1nz9k25a6Al6WBec1Fv1qPw6a3J1/9e0uLCXF3metpYqPsX41p+/mwD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRTH+917d+91ubithZeKFoMIAi2l5EQPKigvvZCCgiBy5CUvTqtt
 +Sgi3Vqaqelgk1qlaa7wkeajshoNI+lhumXlKNe01kycGTYTt8ym0T+Hzznf7/ly/jg0Ln0g
 WkQL6Vpena5UKUgxId6zXh+dlhcnrG4PrYB8w1no83hF8D7XTsB4IJ+Aqw11JExZ7lOQ33RZ
 BM97dQQ47tQi8IznI5gIWXAwtE0TMGXsoCAw+ZECUy6CaVsHArPTiIPL8QSHupZcDH42/iFh
 +OkYAtOAl4SyoVwCRq2FCK74LBQMPUuAEc8jEUy7BzHo/eVHYPX+wcBrz0MwZU6F8srm8Lr5
 Bwmh1904lJkcCG4MuHEYG+pH0NLxCYHtto6EryWtOPR458Hb8VESXpgukjDivIrB90YSKnQ2
 ETg7hxFcsxgR+D7YMNBXNZBgvtZEQFv/Qwqcw78x6DMbMaht2g0eq4+AVyWVWPjcsOtuFFjK
 9Fi4fMPAVP8Ig0lrDbW5GnEThmKCq2m+h3GGN1MkV3e9DnGhoBFxgWo9zhlKwu1T/yjOnWvO
 5Kpf+UkuOP6O5Gy/KgjuZSXL3bwQxLjS19Fc2xU3lbjloHhDMq8SMnj1qk1J4pSWzgvouIfO
 qnI04DnIQxagCJpl1rB97iJqhklmBetyTeIzLGOWsc1FPlEBEtM40yNn8yaLZ4UFzCH2em83
 McMEs5z1uS5iMyxh4tn60C3qX6icrW20z/ojwnNTb3CWpcxatrxgQlSCxBVoTg2SCekZaUpB
 tTZGk5qSnS5kxRw5ltaEwv9kPfO79AEK9CS0I4ZGikiJPTNWkIqUGZrstHbE0rhCJvGrVgtS
 SbIy+xSvPnZYfVLFa9rRYppQREl2HOCTpMxRpZZP5fnjvPq/itERi3LQ6a7WpdHnE8c+j50s
 Ly4U9nbFc8MbLer4wcZCR0DsXyr0lC5ftemElnHmZCXEF408s8fN10s2xAYLd92IXJLhWqM7
 pXJWyEN7Ytw6uvTS462R3+7VLJvQFuMyy8G5+5OGMnfK1x2R7/sZyospd50t2KaVtQ3WH+7M
 jOv/st2YuFBBaFKUsStxtUb5FyE0OqdLAwAA
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 05 Dec 2025 08:16:55 +0000
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

Make dept able to track dependencies by hashed-waitqueue waits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait_bit.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/wait_bit.h b/include/linux/wait_bit.h
index 9e29d79fc790..179a616ad245 100644
--- a/include/linux/wait_bit.h
+++ b/include/linux/wait_bit.h
@@ -6,6 +6,7 @@
  * Linux wait-bit related types and methods:
  */
 #include <linux/wait.h>
+#include <linux/dept_sdt.h>
 
 struct wait_bit_key {
 	unsigned long		*flags;
@@ -257,6 +258,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
 	struct wait_bit_queue_entry __wbq_entry;			\
 	long __ret = ret; /* explicit shadow */				\
 									\
+	sdt_might_sleep_start(NULL);					\
 	init_wait_var_entry(&__wbq_entry, var,				\
 			    exclusive ? WQ_FLAG_EXCLUSIVE : 0);		\
 	for (;;) {							\
@@ -274,6 +276,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
 		cmd;							\
 	}								\
 	finish_wait(__wq_head, &__wbq_entry.wq_entry);			\
+	sdt_might_sleep_end();						\
 __out:	__ret;								\
 })
 
-- 
2.17.1

