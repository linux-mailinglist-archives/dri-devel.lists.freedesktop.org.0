Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5921CA6A7F
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 09:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAE610EA58;
	Fri,  5 Dec 2025 08:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB4FB10EA23
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 07:19:22 +0000 (UTC)
X-AuditID: a67dfc5b-c2dff70000001609-3e-6932876f9b85
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
Subject: [PATCH v18 19/42] dept: apply timeout consideration to
 hashed-waitqueue wait
Date: Fri,  5 Dec 2025 16:18:32 +0900
Message-Id: <20251205071855.72743-20-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251205071855.72743-1-byungchul@sk.com>
References: <20251205071855.72743-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAz2Sa0xTZxjHfU/POW/bWHPSme0IiZhGsgQHo8YtzzJv33yNMcEYt2UmzmY9
 g2blYosgTmO9YLvqqjSpjRQRt9h1lGBzWJQySbCMOlhAbkIBLxRrvVBQ0UJAhNUa9+2X/y3P
 h0cqUQ4xKVJdQbFgKNDoVayclk8svZRZaF6ryw7OZkD8lYWGN65rGCzieQa6670Iyv2LCc0e
 xLDYHETw0rfAgiMcYaEy6sLwpG0LDE7HEERazAj+DN5D0B9/xsKkj4XocDMF5y6INPhHmzDc
 OWen4L47SoPL+ZiCWXcthjFPJYb5sBqC3kcY2u8NMDAetbNw/+ZJBq6ZRjGIQ20ILE1xGsQH
 Cbd5eA2cr77DguXNKwTBxjEK+pqqWDC5Zhjo9XbTcOVRiIJ/g//QMNJ5BsPlwR4KwqMhBqZt
 qRA6+xDBkDOGwR1/hsHzwsnAH82dLARrPgTz479Y6HR1MXDZM8GAWDfAQms8RkGD6JDA3O+J
 QzqvdmCYurDAgLeHBse8hQXXURvavJnMlNtoUlddh8jrOTsiJxpKScevPPFX3sWkRtxPfrv+
 hCJi7c8ssU70U2SyqwuTQKsFEX/4CxLpd1LkkskhIdXtO3LSvpWv1wp6XYlg+HTjXnnezKnt
 RTZ84KGvgjGhMGNFMinPreMnrFf/5+OBk/gts9zHfCg0K3nLy7lVfMMv0URGLpVwfWm8edaW
 ND7gdvF36weSBZpL56OLD5JDCu5z/vnTLvxuNI33+lqSeVlCdwzOJVnJfcZftM4kR3nOJePH
 nG3Uu8IK/oYnRJ9Fihq0pBYpdQUl+Rqdfl1WXlmB7kDW94X5Iko8nPvw/O5GNNW9M4A4KVIt
 VbSUqnVKRlNiLMsPIF4qUS1XxPTZOqVCqyk7KBgKvzPs1wvGAEqV0qqPFGunS7VKLldTLPwo
 CEWC4b1LSWUpJpSVOp6zOie7z1UXWcZMmTcs7J08IWjGe/a1C9/41Ie2lqdUrOx7/nVH5d/G
 4YWUG+T04NP1B6d698xbtezFRcummx25gZ8qMgX/qm0rS49ojxWnK19WHd62M2L/avfGW72r
 R46s8BSZW93Xj8ZG9qi/vF2Ve7tRWKKQWSSfRFp+2JGuoo15GnWGxGDU/AcnI2JibAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzVSe0hTcRTud59zuLotyZsh6iCKIjPLOPSiIOgSJBVEEEGOvORyztjy1YPU
 tVwrTUeb1LJM54ppaZqW1cqU7GGWNlPRTM25Mi3LtDEfrbXon8N3zvfg++MIcPFdMkggUxzh
 lQqpXEIJCWH0OvXyxKxIWYRd6wdazUl43+sgoT2jjoCJcS0Bl8vLKJgx3aVBW3mRhOcdmQS0
 3CpF0DuhReCaMuGgqfUQMKNvpGHc3U2DIQOBx9aIwNiqx6Gz5TEOZXcyMPhZ8ZuC4YYxBIZ+
 BwX5QxkEjFrOIbjkNNEw9HQrfO19QIKn5xMGHb9GEFgcvzFw1GUhmDHGw9WiKq/d+J2CqeY3
 OOQbWhBc6+/BYWyoD8Gdxg8IbDcyKRjMrcbB7pgNbROjFLwwnKXga+tlDL5VUFCYaSOh9dUw
 ggKTHoGzy4aBuricAmNBJQG1ffdpaB2exuC9UY9BaeV26LU4CWjKLcK8db2q24Fgyldj3vEZ
 A8PNBxi4LVZ6UwniXJocgrNW1WCc5u0MxZVdKUPc1KQeceMlapzT5HrXhpFRnDtVlcKVNI1Q
 3OTEO4qz/SokuJdFLGc+M4lxec3LudpLPfSOzXuF62N5uSyZV67YGCOMc53dfjiHTh2syCPT
 UT+pQ34CllnNqutP038xxSxmOzvd+F8cwISyVdlOr0YowBl7CJvlzvER85jdbM+tdp+BYBax
 Ts+AL0jErGG/f3lN/wsNYUsr6nx6P+/d0DHpw2Imir2qc5G5SFiIZllRgEyRnCCVyaPCVfFx
 aQpZaviBxIRK5H0ny4npvHto3L61HjECJPEX1aWslIlJabIqLaEesQJcEiAakUfIxKJYadpR
 Xpm4X5kk51X1aKGAkASKtu3hY8TMQekRPp7nD/PK/ywm8AtKR7rjaz/o+sLz3UHdGz4+UgYL
 2y5ee/4ERUQ/655rX7Bsen4aCi5+bTXr1jTfW+Qgm5amUtl75pz66b/50M6+z+dnl2b/cK2q
 jhxy7DBzC6NDrwyYG8sD9lkfJh079mVLrIfxxCwJjAiqafKI+PgL5kBF6ECxBYkbiq4/juwK
 C8vbJSFUcdKVS3GlSvoHOHKecEoDAAA=
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

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to hashed-waitqueue wait, assuming an input 'ret' in
___wait_var_event() macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait_bit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait_bit.h b/include/linux/wait_bit.h
index 179a616ad245..9885ac4e1ded 100644
--- a/include/linux/wait_bit.h
+++ b/include/linux/wait_bit.h
@@ -258,7 +258,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
 	struct wait_bit_queue_entry __wbq_entry;			\
 	long __ret = ret; /* explicit shadow */				\
 									\
-	sdt_might_sleep_start(NULL);					\
+	sdt_might_sleep_start_timeout(NULL, __ret);			\
 	init_wait_var_entry(&__wbq_entry, var,				\
 			    exclusive ? WQ_FLAG_EXCLUSIVE : 0);		\
 	for (;;) {							\
-- 
2.17.1

