Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0338E7A4200
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CCF10E1DF;
	Mon, 18 Sep 2023 07:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 9257 seconds by postgrey-1.36 at gabe;
 Wed, 13 Sep 2023 16:36:00 UTC
Received: from 12.mo582.mail-out.ovh.net (12.mo582.mail-out.ovh.net
 [178.32.125.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5DD10E125
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 16:35:59 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.20.216])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 7733626288
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 16:35:58 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-56jqj (unknown [10.109.146.24])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 62A251FEC1;
 Wed, 13 Sep 2023 16:35:57 +0000 (UTC)
Received: from RCM-web5.webmail.mail.ovh.net ([51.255.71.60])
 by ghost-submission-6684bf9d7b-56jqj with ESMTPSA
 id jSIeFu3kAWWHyC0A28VGTA
 (envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 13 Sep 2023 16:35:57 +0000
MIME-Version: 1.0
Date: Wed, 13 Sep 2023 19:35:57 +0300
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: mripard@kernel.org
Subject: Re: [PATCH] drm/tests: provide exit function
In-Reply-To: <4epqmvfgjlj4sz7zj6wy5z2qkezif2te3teiwhbf5wv3g3nkeo@36wbg7ksnpy4>
References: <20230913083223.28684-1-jose.pekkarinen@foxhound.fi>
 <63yq44aikrrymqz5e5mg5mwwnaetud7sdxju2lgtsupq52b7hm@fydwmsm4yh54>
 <46d60d7e69c470e9550a2e7b7c750f12@foxhound.fi>
 <4epqmvfgjlj4sz7zj6wy5z2qkezif2te3teiwhbf5wv3g3nkeo@36wbg7ksnpy4>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <ed95e5d9ad5ce41770716595e182949d@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.100.249
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16496122488594081446
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudeikedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpudekhedrvddvtddruddttddrvdegledphedurddvheehrdejuddriedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, boris.brezillon@collabora.com, dakr@redhat.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-13 17:41, mripard@kernel.org wrote:
> On Wed, Sep 13, 2023 at 05:01:40PM +0300, José Pekkarinen wrote:
>> On 2023-09-13 12:50, Maxime Ripard wrote:
>> > Hi,
>> >
>> > On Wed, Sep 13, 2023 at 11:32:23AM +0300, José Pekkarinen wrote:
>> > > Running drm_exec_test by modprobing the module I
>> > > observe the following output:
>> > >
>> > > [  424.471936] KTAP version 1
>> > > [  424.471942] 1..1
>> > > [  424.472446]     KTAP version 1
>> > > [  424.472450]     # Subtest: drm_exec
>> > > [  424.472453]     # module: drm_exec_test
>> > > [  424.472459]     1..7
>> > > [  424.479082]
>> > > ==================================================================
>> > > [  424.479095] BUG: KASAN: slab-use-after-free in
>> > > drm_dev_put.part.0+0x4b/0x90 [drm]
>> > > [  424.479426] Read of size 8 at addr ffff888132d3e028 by task
>> > > kunit_try_catch/1866
>> > > [  424.479436]
>> > > [  424.479442] CPU: 1 PID: 1866 Comm: kunit_try_catch Tainted: G
>> > > N 6.6.0-rc1-dirty #2
>> >
>> > That's suspicious
>> >
>> > > [  424.479446] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
>> > > BIOS 0.0.0 02/06/2015
>> > > [  424.479446] Call Trace:
>> > > [  424.479446]  <TASK>
>> > > [  424.479446]  dump_stack_lvl+0x43/0x60
>> > > [  424.479446]  print_report+0xcf/0x660
>> > > [  424.479446]  ? __virt_addr_valid+0xd9/0x160
>> > > [  424.479446]  ? drm_dev_put.part.0+0x4b/0x90 [drm]
>> > > [  424.479446]  kasan_report+0xda/0x110
>> > > [  424.479446]  ? drm_dev_put.part.0+0x4b/0x90 [drm]
>> > > [  424.479446]  drm_dev_put.part.0+0x4b/0x90 [drm]
>> > > [  424.479446]  release_nodes+0x83/0x160
>> > > [  424.479446]  devres_release_all+0xe6/0x130
>> > > [  424.479446]  ? __pfx_devres_release_all+0x10/0x10
>> > > [  424.479446]  ? mutex_unlock+0x80/0xd0
>> > > [  424.479446]  ? __pfx_mutex_unlock+0x10/0x10
>> > > [  424.479446]  device_unbind_cleanup+0x16/0xc0
>> > > [  424.479446]  device_release_driver_internal+0x28b/0x2e0
>> > > [  424.479446]  bus_remove_device+0x124/0x1d0
>> > > [  424.479446]  device_del+0x23d/0x580
>> > > [  424.479446]  ? __pfx_device_del+0x10/0x10
>> > > [  424.479446]  ? kasan_set_track+0x21/0x30
>> > > [  424.479446]  ? _raw_spin_lock_irqsave+0x98/0xf0
>> > > [  424.479446]  platform_device_del.part.0+0x19/0xe0
>> > > [  424.479446]  kunit_remove_resource+0xfa/0x140 [kunit]
>> > > [  424.479446]  kunit_cleanup+0x47/0xa0 [kunit]
>> > > [  424.479446]  ? __pfx_kunit_try_run_case_cleanup+0x10/0x10 [kunit]
>> > > [  424.479446]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
>> > > [kunit]
>> > > [  424.479446]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
>> > > [  424.479446]  kthread+0x184/0x1c0
>> > > [  424.479446]  ? __pfx_kthread+0x10/0x10
>> > > [  424.479446]  ret_from_fork+0x30/0x50
>> > > [  424.479446]  ? __pfx_kthread+0x10/0x10
>> > > [  424.479446]  ret_from_fork_asm+0x1b/0x30
>> > > [  424.479446]  </TASK>
>> > > [  424.479446]
>> > > [  424.479446] Allocated by task 1865:
>> > > [  424.479446]  kasan_save_stack+0x2f/0x50
>> > > [  424.479446]  kasan_set_track+0x21/0x30
>> > > [  424.479446]  __kasan_kmalloc+0xa6/0xb0
>> > > [  424.479446]  __kmalloc+0x5d/0x160
>> > > [  424.479446]  kunit_kmalloc_array+0x1c/0x50 [kunit]
>> > > [  424.479446]  drm_exec_test_init+0xef/0x260 [drm_exec_test]
>> > > [  424.479446]  kunit_try_run_case+0x6e/0x100 [kunit]
>> > > [  424.479446]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
>> > > [  424.479446]  kthread+0x184/0x1c0
>> > > [  424.479446]  ret_from_fork+0x30/0x50
>> > > [  424.479446]  ret_from_fork_asm+0x1b/0x30
>> > > [  424.479446]
>> > > [  424.479446] Freed by task 1866:
>> > > [  424.479446]  kasan_save_stack+0x2f/0x50
>> > > [  424.479446]  kasan_set_track+0x21/0x30
>> > > [  424.479446]  kasan_save_free_info+0x27/0x40
>> > > [  424.479446]  ____kasan_slab_free+0x166/0x1c0
>> > > [  424.479446]  slab_free_freelist_hook+0x9f/0x1e0
>> > > [  424.479446]  __kmem_cache_free+0x187/0x2d0
>> > > [  424.479446]  kunit_remove_resource+0xfa/0x140 [kunit]
>> > > [  424.479446]  kunit_cleanup+0x47/0xa0 [kunit]
>> > > [  424.479446]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
>> > > [  424.479446]  kthread+0x184/0x1c0
>> > > [  424.479446]  ret_from_fork+0x30/0x50
>> > > [  424.479446]  ret_from_fork_asm+0x1b/0x30
>> > > [  424.479446]
>> > > [  424.479446] The buggy address belongs to the object at
>> > > ffff888132d3e000
>> > > [  424.479446]  which belongs to the cache kmalloc-256 of size 256
>> > > [  424.479446] The buggy address is located 40 bytes inside of
>> > > [  424.479446]  freed 256-byte region [ffff888132d3e000,
>> > > ffff888132d3e100)
>> > > [  424.479446]
>> > > [  424.479446] The buggy address belongs to the physical page:
>> > > [  424.479446] page:0000000092ff6551 refcount:1 mapcount:0
>> > > mapping:0000000000000000 index:0xffff888132d3f600 pfn:0x132d3c
>> > > [  424.479446] head:0000000092ff6551 order:2 entire_mapcount:0
>> > > nr_pages_mapped:0 pincount:0
>> > > [  424.479446] ksm flags:
>> > > 0x17ffffc0000840(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
>> > > [  424.479446] page_type: 0xffffffff()
>> > > [  424.479446] raw: 0017ffffc0000840 ffff888100042b40
>> > > ffffea00042c8000 dead000000000003
>> > > [  424.479446] raw: ffff888132d3f600 000000008020001f
>> > > 00000001ffffffff 0000000000000000
>> > > [  424.479446] page dumped because: kasan: bad access detected
>> > > [  424.479446]
>> > > [  424.479446] Memory state around the buggy address:
>> > > [  424.479446]  ffff888132d3df00: fc fc fc fc fc fc fc fc fc fc fc
>> > > fc fc fc fc fc
>> > > [  424.479446]  ffff888132d3df80: fc fc fc fc fc fc fc fc fc fc fc
>> > > fc fc fc fc fc
>> > > [  424.479446] >ffff888132d3e000: fa fb fb fb fb fb fb fb fb fb fb
>> > > fb fb fb fb fb
>> > > [  424.479446]                                   ^
>> > > [  424.479446]  ffff888132d3e080: fb fb fb fb fb fb fb fb fb fb fb
>> > > fb fb fb fb fb
>> > > [  424.479446]  ffff888132d3e100: fc fc fc fc fc fc fc fc fc fc fc
>> > > fc fc fc fc fc
>> > > [  424.479446]
>> > > ==================================================================
>> > > [  424.481686] Disabling lock debugging due to kernel taint
>> > > [  424.484124]     not ok 1 sanitycheck
>> > > [  424.492981]     ok 2 test_lock
>> > > [  424.503610]     ok 3 test_lock_unlock
>> > > [  424.515058]     ok 4 test_duplicates
>> > > [  424.530453]     ok 5 test_prepare
>> > > [  424.539099]     ok 6 test_prepare_array
>> > > [  424.550730]     ok 7 test_multiple_loops
>> > > [  424.550743] # drm_exec: pass:6 fail:1 skip:0 total:7
>> > > [  424.550750] # Totals: pass:6 fail:1 skip:0 total:7
>> > > [  424.550756] not ok 5 drm_exec
>> > >
>> > > The ouptut suggest the init function is allocating a drm_device
>> > > that is not being freed. This patch provides the function and
>> > > add it to the kunit_suite to produce the following result of
>> > > the test:
>> > >
>> > > [ 3363.342560] KTAP version 1
>> > > [ 3363.342571] 1..1
>> > > [ 3363.343090]     KTAP version 1
>> > > [ 3363.343095]     # Subtest: drm_exec
>> > > [ 3363.343098]     # module: drm_exec_test
>> > > [ 3363.343103]     1..7
>> > > [ 3363.353659]     ok 1 sanitycheck
>> > > [ 3363.364281]     ok 2 test_lock
>> > > [ 3363.375616]     ok 3 test_lock_unlock
>> > > [ 3363.388741]     ok 4 test_duplicates
>> > > [ 3363.402544]     ok 5 test_prepare
>> > > [ 3363.413163]     ok 6 test_prepare_array
>> > > [ 3363.424614]     ok 7 test_multiple_loops
>> > > [ 3363.424630] # drm_exec: pass:7 fail:0 skip:0 total:7
>> > > [ 3363.424637] # Totals: pass:7 fail:0 skip:0 total:7
>> > > [ 3363.424643] ok 1 drm_exec
>> > >
>> > > Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> > > ---
>> > >  drivers/gpu/drm/tests/drm_exec_test.c | 14 ++++++++++++++
>> > >  1 file changed, 14 insertions(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/tests/drm_exec_test.c
>> > > b/drivers/gpu/drm/tests/drm_exec_test.c
>> > > index 563949d777dd..7ff6bc6467d4 100644
>> > > --- a/drivers/gpu/drm/tests/drm_exec_test.c
>> > > +++ b/drivers/gpu/drm/tests/drm_exec_test.c
>> > > @@ -42,6 +42,19 @@ static int drm_exec_test_init(struct kunit *test)
>> > >  	return 0;
>> > >  }
>> > >
>> > > +static void drm_exec_test_exit(struct kunit *test)
>> > > +{
>> > > +	struct drm_exec_priv *priv = test->priv;
>> > > +
>> > > +	drm_kunit_helper_free_device(test, priv->dev);
>> > > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
>> >
>> > This shouldn't be necessary at all since 4f2b0b583baa.
>> 
>> 
>> Reading this suggested patch I see only references to
>> platform_driver_unregister, platform_device_put, and
>> platform_device_del, not the ones used in this patch.
> 
> I mean, what is drm_kunit_helper_free_device calling?

     That seems to be triggering any registered release
action immediately, so it calls platform_device_del,
followed by platform_device_put, followed by
platform_driver_unregister. Reducing the patch to
just call the drm_dev_put that doesn't seem to happen
automatically still triggers this stacktrace:

[ 3300.409436] refcount_t: underflow; use-after-free.
[ 3300.409483] WARNING: CPU: 6 PID: 13758 at lib/refcount.c:28 
refcount_warn_saturate+0xcd/0x120
[ 3300.409504] Modules linked in: drm_exec_test drm_exec 
drm_kunit_helpers kunit snd_usb_audio snd_usbmidi_lib uvcvideo snd_ump 
snd_hwdep videobuf2_vmalloc snd_pcm videobuf2_memops snd
_rawmidi uvc videobuf2_v4l2 snd_seq_device snd_timer videodev snd 
soundcore videobuf2_common mc rfkill binfmt_misc intel_rapl_msr 
intel_rapl_common kvm_amd ccp rng_core kvm nls_ascii irqbypass nls_cp437 
crct10dif_pclmul crct10dif_common
  vfat crc32_pclmul fat ghash_clmulni_intel sha512_ssse3 sha512_generic 
aesni_intel crypto_simd cryptd iTCO_wdt pcspkr intel_pmc_bxt 
virtio_console iTCO_vendor_support intel_agp joydev evdev intel_gtt 
watchdog button serio_raw sg nft_ct
msr nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 parport_pc nf_tables 
ppdev lp libcrc32c parport nfnetlink loop fuse efi_pstore configfs 
efivarfs qemu_fw_cfg ip_tables x_tables autofs4 ext4 crc32c_generic 
crc16 mbcache jbd2 hid_generic us
bhid hid dm_mod virtio_gpu virtio_dma_buf drm_shmem_helper 
drm_kms_helper sr_mod virtio_net cdrom net_failover drm failover 
virtio_blk ahci
2023-09-13T18:21:01.438934+03:00 woodpecker kernel: [ 3300.410013]  
libahci virtio_pci libata xhci_pci virtio xhci_hcd i2c_i801 crc32c_intel 
virtio_pci_legacy_dev scsi_mod usbcore virtio_pci_modern_dev psmouse 
i2c_smbus scsi_common lpc_
ich usb_common virtio_ring
[ 3300.410081] CPU: 6 PID: 13758 Comm: kunit_try_catch Tainted: G    B   
          N 6.6.0-rc1+ #3
[ 3300.410092] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 
0.0.0 02/06/2015
[ 3300.410098] RIP: 0010:refcount_warn_saturate+0xcd/0x120
[ 3300.410113] Code: 0a 21 fc 01 01 e8 03 9d 7f ff 0f 0b eb 95 80 3d f9 
20 fc 01 00 75 8c 48 c7 c7 e0 10 a8 b9 c6 05 e9 20 fc 01 01 e8 e3 9c 7f 
ff <0f> 0b e9 72 ff ff ff 80 3d d4 20 fc
  01 00 0f 85 65 ff ff ff 48 c7
[ 3300.410122] RSP: 0018:ffff888284397bf0 EFLAGS: 00010286
[ 3300.410132] RAX: 0000000000000000 RBX: 0000000000000003 RCX: 
0000000000000000
[ 3300.410138] RDX: 0000000000000002 RSI: ffffffffb8567c64 RDI: 
ffffffffbb90c7a0
[ 3300.410145] RBP: ffff888271e3d004 R08: 0000000000000001 R09: 
ffffed1062726081
[ 3300.410151] R10: ffff88831393040b R11: 0000000000000001 R12: 
ffff888124145c80
[ 3300.410158] R13: ffff888284397c78 R14: ffffffffc0c11b20 R15: 
0000000000000010
[ 3300.410168] FS:  0000000000000000(0000) GS:ffff888313900000(0000) 
knlGS:0000000000000000
[ 3300.410176] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3300.410182] CR2: 00007ffdbe910148 CR3: 0000000119c3c000 CR4: 
0000000000350ee0
[ 3300.410191] Call Trace:
[ 3300.410197]  <TASK>
[ 3300.410203]  ? __warn+0xa1/0x1a0
[ 3300.410221]  ? refcount_warn_saturate+0xcd/0x120
[ 3300.410239]  ? report_bug+0x1f2/0x220
[ 3300.410258]  ? handle_bug+0x41/0x80
[ 3300.410272]  ? exc_invalid_op+0x13/0x40
[ 3300.410285]  ? asm_exc_invalid_op+0x16/0x20
[ 3300.410304]  ? preempt_count_sub+0x14/0xc0
[ 3300.410316]  ? refcount_warn_saturate+0xcd/0x120
[ 3300.410323]  release_nodes+0x83/0x160
[ 3300.410332]  devres_release_all+0xe6/0x130
[ 3300.410338]  ? __pfx_devres_release_all+0x10/0x10
[ 3300.410343]  ? mutex_unlock+0x80/0xd0
[ 3300.410349]  ? __pfx_mutex_unlock+0x10/0x10
[ 3300.410356]  device_unbind_cleanup+0x16/0xc0
[ 3300.410364]  device_release_driver_internal+0x28b/0x2e0
[ 3300.410372]  bus_remove_device+0x124/0x1d0
[ 3300.410378]  device_del+0x23d/0x580
[ 3300.410384]  ? __pfx_device_del+0x10/0x10
[ 3300.410389]  ? kasan_set_track+0x21/0x30
[ 3300.410395]  ? _raw_spin_lock_irqsave+0x98/0xf0
[ 3300.410402]  platform_device_del.part.0+0x19/0xe0
[ 3300.410408]  kunit_remove_resource+0xfa/0x140 [kunit]
[ 3300.410427]  kunit_cleanup+0x47/0xa0 [kunit]
[ 3300.410443]  ? __pfx_kunit_try_run_case_cleanup+0x10/0x10 [kunit]
[ 3300.410460]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 
[kunit]
[ 3300.410477]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
[ 3300.410494]  kthread+0x184/0x1c0
[ 3300.410499]  ? __pfx_kthread+0x10/0x10
[ 3300.410503]  ret_from_fork+0x30/0x50
[ 3300.410509]  ? __pfx_kthread+0x10/0x10
[ 3300.410513]  ret_from_fork_asm+0x1b/0x30
[ 3300.410522]  </TASK>
[ 3300.410524] ---[ end trace 0000000000000000 ]---
[ 3300.411310]     ok 1 sanitycheck
[ 3300.422160]     ok 2 test_lock
[ 3300.433030]     ok 3 test_lock_unlock
[ 3300.443877]     ok 4 test_duplicates
[ 3300.454591]     ok 5 test_prepare
[ 3300.467181]     ok 6 test_prepare_array
[ 3300.479030]     ok 7 test_multiple_loops
[ 3300.479052] # drm_exec: pass:7 fail:0 skip:0 total:7
[ 3300.479065] # Totals: pass:7 fail:0 skip:0 total:7
[ 3300.479076] ok 1 drm_exec

     Thanks!

     José.
