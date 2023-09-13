Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471D7A4203
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877FB10E1E2;
	Mon, 18 Sep 2023 07:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8399 seconds by postgrey-1.36 at gabe;
 Wed, 13 Sep 2023 12:11:41 UTC
Received: from 13.mo584.mail-out.ovh.net (13.mo584.mail-out.ovh.net
 [178.33.251.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE34410E4AE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 12:11:41 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.138.246])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 95EA423E01
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 08:32:36 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-c88lw (unknown [10.110.103.253])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 29CA21FD87;
 Wed, 13 Sep 2023 08:32:34 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.98])
 by ghost-submission-6684bf9d7b-c88lw with ESMTPSA
 id ILxbD6JzAWVKNAAAV6PKcA
 (envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 13 Sep 2023 08:32:34 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00241428889-f3c2-4350-b7c2-ccf44e00b95d,
 DC2EF514C16DA978A4B56AB6E34F69DC0F88BBA7)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 91.157.108.232
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/tests: provide exit function
Date: Wed, 13 Sep 2023 11:32:23 +0300
Message-Id: <20230913083223.28684-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8332785210841409190
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudeikedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeftdelueetieetvdettdetueeivedujeefffdvteefkeelhefhleelfeetteejjeenucfkphepuddvjedrtddrtddruddpledurdduheejrddutdekrddvfedvpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, arthurgrillo@riseup.net,
 boris.brezillon@collabora.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 linux-kernel-mentees@lists.linuxfoundation.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Running drm_exec_test by modprobing the module I
observe the following output:

[  424.471936] KTAP version 1
[  424.471942] 1..1
[  424.472446]     KTAP version 1
[  424.472450]     # Subtest: drm_exec
[  424.472453]     # module: drm_exec_test
[  424.472459]     1..7
[  424.479082] ==================================================================
[  424.479095] BUG: KASAN: slab-use-after-free in drm_dev_put.part.0+0x4b/0x90 [drm]
[  424.479426] Read of size 8 at addr ffff888132d3e028 by task kunit_try_catch/1866
[  424.479436]
[  424.479442] CPU: 1 PID: 1866 Comm: kunit_try_catch Tainted: G                 N 6.6.0-rc1-dirty #2
[  424.479446] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
[  424.479446] Call Trace:
[  424.479446]  <TASK>
[  424.479446]  dump_stack_lvl+0x43/0x60
[  424.479446]  print_report+0xcf/0x660
[  424.479446]  ? __virt_addr_valid+0xd9/0x160
[  424.479446]  ? drm_dev_put.part.0+0x4b/0x90 [drm]
[  424.479446]  kasan_report+0xda/0x110
[  424.479446]  ? drm_dev_put.part.0+0x4b/0x90 [drm]
[  424.479446]  drm_dev_put.part.0+0x4b/0x90 [drm]
[  424.479446]  release_nodes+0x83/0x160
[  424.479446]  devres_release_all+0xe6/0x130
[  424.479446]  ? __pfx_devres_release_all+0x10/0x10
[  424.479446]  ? mutex_unlock+0x80/0xd0
[  424.479446]  ? __pfx_mutex_unlock+0x10/0x10
[  424.479446]  device_unbind_cleanup+0x16/0xc0
[  424.479446]  device_release_driver_internal+0x28b/0x2e0
[  424.479446]  bus_remove_device+0x124/0x1d0
[  424.479446]  device_del+0x23d/0x580
[  424.479446]  ? __pfx_device_del+0x10/0x10
[  424.479446]  ? kasan_set_track+0x21/0x30
[  424.479446]  ? _raw_spin_lock_irqsave+0x98/0xf0
[  424.479446]  platform_device_del.part.0+0x19/0xe0
[  424.479446]  kunit_remove_resource+0xfa/0x140 [kunit]
[  424.479446]  kunit_cleanup+0x47/0xa0 [kunit]
[  424.479446]  ? __pfx_kunit_try_run_case_cleanup+0x10/0x10 [kunit]
[  424.479446]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kunit]
[  424.479446]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
[  424.479446]  kthread+0x184/0x1c0
[  424.479446]  ? __pfx_kthread+0x10/0x10
[  424.479446]  ret_from_fork+0x30/0x50
[  424.479446]  ? __pfx_kthread+0x10/0x10
[  424.479446]  ret_from_fork_asm+0x1b/0x30
[  424.479446]  </TASK>
[  424.479446]
[  424.479446] Allocated by task 1865:
[  424.479446]  kasan_save_stack+0x2f/0x50
[  424.479446]  kasan_set_track+0x21/0x30
[  424.479446]  __kasan_kmalloc+0xa6/0xb0
[  424.479446]  __kmalloc+0x5d/0x160
[  424.479446]  kunit_kmalloc_array+0x1c/0x50 [kunit]
[  424.479446]  drm_exec_test_init+0xef/0x260 [drm_exec_test]
[  424.479446]  kunit_try_run_case+0x6e/0x100 [kunit]
[  424.479446]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
[  424.479446]  kthread+0x184/0x1c0
[  424.479446]  ret_from_fork+0x30/0x50
[  424.479446]  ret_from_fork_asm+0x1b/0x30
[  424.479446]
[  424.479446] Freed by task 1866:
[  424.479446]  kasan_save_stack+0x2f/0x50
[  424.479446]  kasan_set_track+0x21/0x30
[  424.479446]  kasan_save_free_info+0x27/0x40
[  424.479446]  ____kasan_slab_free+0x166/0x1c0
[  424.479446]  slab_free_freelist_hook+0x9f/0x1e0
[  424.479446]  __kmem_cache_free+0x187/0x2d0
[  424.479446]  kunit_remove_resource+0xfa/0x140 [kunit]
[  424.479446]  kunit_cleanup+0x47/0xa0 [kunit]
[  424.479446]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
[  424.479446]  kthread+0x184/0x1c0
[  424.479446]  ret_from_fork+0x30/0x50
[  424.479446]  ret_from_fork_asm+0x1b/0x30
[  424.479446]
[  424.479446] The buggy address belongs to the object at ffff888132d3e000
[  424.479446]  which belongs to the cache kmalloc-256 of size 256
[  424.479446] The buggy address is located 40 bytes inside of
[  424.479446]  freed 256-byte region [ffff888132d3e000, ffff888132d3e100)
[  424.479446]
[  424.479446] The buggy address belongs to the physical page:
[  424.479446] page:0000000092ff6551 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888132d3f600 pfn:0x132d3c
[  424.479446] head:0000000092ff6551 order:2 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[  424.479446] ksm flags: 0x17ffffc0000840(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
[  424.479446] page_type: 0xffffffff()
[  424.479446] raw: 0017ffffc0000840 ffff888100042b40 ffffea00042c8000 dead000000000003
[  424.479446] raw: ffff888132d3f600 000000008020001f 00000001ffffffff 0000000000000000
[  424.479446] page dumped because: kasan: bad access detected
[  424.479446]
[  424.479446] Memory state around the buggy address:
[  424.479446]  ffff888132d3df00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  424.479446]  ffff888132d3df80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  424.479446] >ffff888132d3e000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  424.479446]                                   ^
[  424.479446]  ffff888132d3e080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  424.479446]  ffff888132d3e100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  424.479446] ==================================================================
[  424.481686] Disabling lock debugging due to kernel taint
[  424.484124]     not ok 1 sanitycheck
[  424.492981]     ok 2 test_lock
[  424.503610]     ok 3 test_lock_unlock
[  424.515058]     ok 4 test_duplicates
[  424.530453]     ok 5 test_prepare
[  424.539099]     ok 6 test_prepare_array
[  424.550730]     ok 7 test_multiple_loops
[  424.550743] # drm_exec: pass:6 fail:1 skip:0 total:7
[  424.550750] # Totals: pass:6 fail:1 skip:0 total:7
[  424.550756] not ok 5 drm_exec

The ouptut suggest the init function is allocating a drm_device
that is not being freed. This patch provides the function and
add it to the kunit_suite to produce the following result of
the test:

[ 3363.342560] KTAP version 1
[ 3363.342571] 1..1
[ 3363.343090]     KTAP version 1
[ 3363.343095]     # Subtest: drm_exec
[ 3363.343098]     # module: drm_exec_test
[ 3363.343103]     1..7
[ 3363.353659]     ok 1 sanitycheck
[ 3363.364281]     ok 2 test_lock
[ 3363.375616]     ok 3 test_lock_unlock
[ 3363.388741]     ok 4 test_duplicates
[ 3363.402544]     ok 5 test_prepare
[ 3363.413163]     ok 6 test_prepare_array
[ 3363.424614]     ok 7 test_multiple_loops
[ 3363.424630] # drm_exec: pass:7 fail:0 skip:0 total:7
[ 3363.424637] # Totals: pass:7 fail:0 skip:0 total:7
[ 3363.424643] ok 1 drm_exec

Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
 drivers/gpu/drm/tests/drm_exec_test.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 563949d777dd..7ff6bc6467d4 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -42,6 +42,19 @@ static int drm_exec_test_init(struct kunit *test)
 	return 0;
 }
 
+static void drm_exec_test_exit(struct kunit *test)
+{
+	struct drm_exec_priv *priv = test->priv;
+
+	drm_kunit_helper_free_device(test, priv->dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
+
+	drm_dev_put(priv->drm);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
+
+	kunit_kfree(test, priv);
+}
+
 static void sanitycheck(struct kunit *test)
 {
 	struct drm_exec exec;
@@ -204,6 +217,7 @@ static struct kunit_case drm_exec_tests[] = {
 static struct kunit_suite drm_exec_test_suite = {
 	.name = "drm_exec",
 	.init = drm_exec_test_init,
+	.exit = drm_exec_test_exit,
 	.test_cases = drm_exec_tests,
 };
 
-- 
2.39.2

