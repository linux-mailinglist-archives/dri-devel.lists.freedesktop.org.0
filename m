Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65ACA6A55
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 09:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B22910EA42;
	Fri,  5 Dec 2025 08:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6792C10EA23
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 07:19:17 +0000 (UTC)
X-AuditID: a67dfc5b-c45ff70000001609-45-6932876db4e0
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
Subject: [PATCH v18 11/42] dept: apply sdt_might_sleep_{start,end}() to swait
Date: Fri,  5 Dec 2025 16:18:24 +0900
Message-Id: <20251205071855.72743-12-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251205071855.72743-1-byungchul@sk.com>
References: <20251205071855.72743-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTH99z73NtLQ5ObSuQRsrk0IUYNKEbNWeJePmzJ/SDLFmNi3Acs
 coXrWsCCCCZGEOVNRYZSIiAtFEh52dDia2djRUUrIDAGdFrs0AoSyth4lVrRUrMvJ7/8f+f8
 Px2OVrqYCE5KyRB1KWqNipVj+VRoXbS2YIu0eakiGlxuDwNDuXYM1W2tLLyruiGDQstFBuaW
 nsngva0Tgb6/jAZn3x0aWq/mUjB7eZmF8lEPCxUTuRim3L8z8H5knILhBS+CRs8yBR57AQJD
 XTsLk/p/WXjb00tDRXkfgtrRERpmJv5GcLXzOYJXpddo+HN+mgVH+WkWpvqrKTCesDHQ3z2J
 4FJVGYKxpzYK8kxtLOgvWTD0T/opcOnLKGixxIG7cQxDV2kdBfor4VBVkUcFxmsKuk0uDI05
 UfDCXCkD/2gsOJ4PMTA5VsaC+2E+A5a/HiAotM5jsLwMCNvTjVCbX4/hYo2Lhds2B4YBazUL
 OVWLDPTZuxhoG3dS0NX5CIOjsglDr/VX5ptEYfFUCRaa269Twqk/3rFCa00rEuYa8mjhnnea
 Fnzzg6xgWzBi4XEdEeqLfJTwS0+0cKtyRCYYLYeFk/enGKHdvEEw3Z6gfojZK9+RKGqkTFG3
 6at98uSZ0UEm7QGX5WywynLQE7YYhXCE30ryX//GFCMuyEWDO1dill9HnM4leoXD+M9J+9mx
 wIqco/mBtaRgqSQoVvFxZKB5Ga0w5qPIlTc9eIUV/HbSMXSe/ti/lrRctgc5JJCXD/uCrOS3
 EUPxYrCU8C0hxF3kkX08WEPump24FCmM6JNmpJRSMrVqSbM1Jjk7RcqK2Z+qtaDAzzUe8/90
 E8307epAPIdUoQr7kVhJyagz07O1HYhwtCpM4dVslpSKRHX2UVGXGq87rBHTO1Akh1Xhii0L
 RxKVfJI6Q/xZFNNE3f+W4kIictD3px1t4zc/i7OGxnvXxGZ+ffZlvHcwzT9x3hfVUB9n7k4S
 SYJ/5vHq/55lHC8+oN1/5t7uqBvTXEJE03e9F1YdI5/6kgpnTbsNcz8awp+kXoj81nDo5D8b
 m87cLzmqqt+RO/ulNKw6x6831/QYI/dEHsy6lUFqv0g4nn/gbZh3vanhhAqnJ6tjN9C6dPUH
 ZhZjZG8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTdxTG/d93OrtcK5EbHdE0mewNB2awY0YW/eSNGYZEE5LFqA3cwA0t
 Qqu8Jdso2AGdI1DTklERRNswQIEWhsg6mzqYwBCwvFQHK2wdGwHFIK+FgoVkX05+5zzPkzwf
 DoPL2sn9jJh+WVCnK5RySkJITn9WGKkqOipG9dowKNZ9A+NeHwmjWicBS4vFBNxoaqQgYG6n
 odj2AwmPxwoIGLzXgMC7VIxgZd2Mg65ji4CAoZuGxbU/aDBqEWw5uhGYhgw4eAYf4tDYqsXg
 dfMmBbOPFhAYp3wUVMxoCZi3XkNQOW2mYabrJLzwdpKwNfEvBmPLcwisvk0MfM4iBAFTGlTX
 2oNx0ysK1vsHcKgwDiK4NTWBw8LMJILW7j8ROOoKKPinrA0Ht+9tGF6ap6DH+B0FL4ZuYPCy
 mYKaAgcJQ7/PIqgyGxBMP3dgUHi7iQJTlY2AjskHNAzNbmAwbjJg0GCLB691moC+slosWDfo
 agkDc0UhFhz/YWC824nBmrWePm5B/IqulODr7T9hvO5pgOIbbzYift1vQPyipRDndWXB9dHc
 PM5ftWfzlr45ivcvjVC8Y7mG4HtrOf5OiR/jy/sj+Y7KCTrhxJeSuGRBKWYJ6o8/vyhJXZga
 ITO6mByP5QGdj55QesQwHPsJVzLyhR6FMBQbwXk8a/g2h7KHOPv306QeSRicdR/kitZKd4S9
 bDznrt9E20yw73Itq/3ENkvZWM41en3Hw7EHuYZm5w6HBO/GMf8Oy9gYrlq/QpYhSQ3aVY9C
 xfQslUJUxhzRpKXmpos5R5IuqWwo+E7WrzbK76NF90kXYhkk3y11ZkeLMlKRpclVuRDH4PJQ
 6ZwySpRJkxW5eYL60gX1FaWgcaEDDCEPk55KFC7K2BTFZSFNEDIE9f8qxoTsz0dvfX239KlY
 aYp471N3k3fZc+6MkLcrUec8G7WaKO/K+9ny23HpsL/ONyxWV4YnhDftaYH7rRl1ew9/S/0S
 09B1vs1r1Do/mqwKqz5QHmv/69fxwEjmY/rhOyVJkfGZNaqBiL8z9RXeDxf6evb8OD++75gl
 TsW/X/Us5ZALy0qYvdojJzSpiugPcLVG8QZ6wBFfSgMAAA==
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

Make dept able to track dependencies by swaits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/swait.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index d324419482a0..277ac74f61c3 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -6,6 +6,7 @@
 #include <linux/stddef.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+#include <linux/dept_sdt.h>
 #include <asm/current.h>
 
 /*
@@ -161,6 +162,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 	struct swait_queue __wait;					\
 	long __ret = ret;						\
 									\
+	sdt_might_sleep_start(NULL);					\
 	INIT_LIST_HEAD(&__wait.task_list);				\
 	for (;;) {							\
 		long __int = prepare_to_swait_event(&wq, &__wait, state);\
@@ -176,6 +178,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 		cmd;							\
 	}								\
 	finish_swait(&wq, &__wait);					\
+	sdt_might_sleep_end();						\
 __out:	__ret;								\
 })
 
-- 
2.17.1

