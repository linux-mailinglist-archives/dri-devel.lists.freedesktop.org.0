Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB5C8002C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 20:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CEA6EF3D;
	Fri,  2 Aug 2019 18:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 925576EF42
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 18:29:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8F41972167; Fri,  2 Aug 2019 18:29:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111021] [kernel 5.2.1][amdgpu][CIK] BUG: KASAN: null-ptr-deref
 in amdgpu_ib_schedule+0x82/0x790 [amdgpu]
Date: Fri, 02 Aug 2019 18:29:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111021-502-cCmJZhJXet@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111021-502@http.bugs.freedesktop.org/>
References: <bug-111021-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0082949397=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0082949397==
Content-Type: multipart/alternative; boundary="15647705972.D4a90De4f.10608"
Content-Transfer-Encoding: 7bit


--15647705972.D4a90De4f.10608
Date: Fri, 2 Aug 2019 18:29:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111021

--- Comment #7 from erhard_f@mailbox.org ---
Created attachment 144933
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144933&action=3Dedit
kernel dmesg (5.3-rc2)

[...]
[  214.315038] cp queue preemption time out
[  214.315406] Resetting wave fronts (nocpsch) on dev 00000000c3d0b577
[  214.316011]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  214.316631] BUG: KASAN: null-ptr-deref in amdgpu_ib_schedule+0x7c/0x7f0
[amdgpu]
[  214.316664] Read of size 8 at addr 0000000000000038 by task xmr-stak/1130

[  214.316724] CPU: 5 PID: 1130 Comm: xmr-stak Not tainted 5.3.0-rc2 #1
[  214.316754] Hardware name: System manufacturer System Product Name/M5A78=
L-M
LX3, BIOS 1401    05/05/2016
[  214.316783] Call Trace:
[  214.316818]  dump_stack+0x7c/0xc0
[  214.317258]  ? amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.317696]  ? amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.317730]  __kasan_report.cold.6+0x5/0x3c
[  214.318168]  ? amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.318606]  amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.318640]  ? kasan_unpoison_shadow+0x30/0x40
[  214.318672]  ? __kasan_kmalloc.constprop.7+0xc1/0xd0
[  214.319110]  ? amdgpu_sync_create+0x32/0x50 [amdgpu]
[  214.319568]  amdgpu_amdkfd_submit_ib+0x13c/0x230 [amdgpu]
[  214.320026]  ? amdgpu_amdkfd_get_num_gws+0x20/0x20 [amdgpu]
[  214.320487]  ? dbgdev_wave_control_diq+0x280/0x280 [amdgpu]
[  214.320520]  ? wake_up_klogd+0x2b/0x30
[  214.320550]  ? vprintk_emit+0xdc/0x260
[  214.320581]  ? memset+0x1f/0x40
[  214.321040]  deallocate_vmid.isra.12+0x25a/0x270 [amdgpu]
[  214.321503]  destroy_queue_nocpsch_locked+0x33d/0x360 [amdgpu]
[  214.321962]  ? init_mqd_sdma+0x90/0x90 [amdgpu]
[  214.322424]  process_termination_nocpsch+0xb1/0x280 [amdgpu]
[  214.322886]  kfd_process_dequeue_from_all_devices+0x79/0xa0 [amdgpu]
[  214.323345]  kfd_process_notifier_release+0x1ab/0x250 [amdgpu]
[  214.323382]  __mmu_notifier_release+0x9d/0x1c0
[  214.323414]  ? check_chain_key+0x1d7/0x2e0
[  214.323446]  exit_mmap+0x7c/0x280
[  214.323479]  ? __ia32_sys_munmap+0x30/0x30
[  214.323512]  ? aio_poll_wake+0x3c0/0x3c0
[  214.323543]  ? lock_downgrade+0x390/0x390
[  214.323574]  ? up_read+0x12c/0x370
[  214.323606]  ? rwlock_bug.part.2+0x50/0x50
[  214.323638]  mmput+0x99/0x1f0
[  214.323671]  do_exit+0x3cc/0x12e0
[  214.323703]  ? queued_spin_lock_slowpath+0x366/0x420
[  214.323735]  ? check_chain_key+0x1d7/0x2e0
[  214.323766]  ? mm_update_next_owner+0x340/0x340
[  214.323798]  ? lock_downgrade+0x390/0x390
[  214.323830]  ? do_raw_spin_lock+0x10e/0x1d0
[  214.323861]  ? match_held_lock+0x2e/0x240
[  214.323892]  do_group_exit+0x86/0x130
[  214.323925]  get_signal+0x1bc/0xeb0
[  214.323958]  ? refcount_sub_and_test_checked+0xaf/0x150
[  214.323992]  do_signal+0x9e/0xad0
[  214.324024]  ? wake_up_q+0x72/0x90
[  214.324054]  ? rwsem_wake.isra.9+0xb3/0xf0
[  214.324085]  ? rwsem_mark_wake+0x4d0/0x4d0
[  214.324116]  ? setup_sigcontext+0x250/0x250
[  214.324149]  ? __x64_sys_futex+0x1d3/0x240
[  214.324179]  ? down_read_nested+0x2b0/0x2b0
[  214.324211]  ? trace_hardirqs_on_thunk+0x1a/0x20
[  214.324242]  ? mark_held_locks+0x29/0xa0
[  214.324272]  ? exit_to_usermode_loop+0x41/0x130
[  214.324303]  exit_to_usermode_loop+0x59/0x130
[  214.324334]  do_syscall_64+0x1fd/0x250
[  214.324368]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  214.324398] RIP: 0033:0x7fd134c26f6c
[  214.324433] Code: Bad RIP value.
[  214.324462] RSP: 002b:00007fd11b7fdd30 EFLAGS: 00000246 ORIG_RAX:
00000000000000ca
[  214.324496] RAX: fffffffffffffe00 RBX: 00007fd125838c48 RCX:
00007fd134c26f6c
[  214.324525] RDX: 0000000000000000 RSI: 0000000000000080 RDI:
00007fd125838c74
[  214.324554] RBP: 0000000000000000 R08: 0000000000000000 R09:
00007fd108000b20
[  214.324582] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000007
[  214.324611] R13: 00007fd125838c20 R14: 0000000000000000 R15:
00007fd125838c74
[  214.324640]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  214.324666] Disabling lock debugging due to kernel taint
[  214.324680] BUG: kernel NULL pointer dereference, address: 0000000000000=
038
[  214.324691] #PF: supervisor read access in kernel mode
[  214.324700] #PF: error_code(0x0000) - not-present page
[  214.324708] PGD 0 P4D 0=20
[  214.324722] Oops: 0000 [#1] SMP KASAN NOPTI
[  214.324736] CPU: 5 PID: 1130 Comm: xmr-stak Tainted: G    B=20=20=20=20=
=20=20=20=20=20=20=20=20
5.3.0-rc2 #1
[  214.324746] Hardware name: System manufacturer System Product Name/M5A78=
L-M
LX3, BIOS 1401    05/05/2016
[  214.325166] RIP: 0010:amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.325180] Code: 00 00 49 8d 7d 70 e8 e3 d0 73 df 49 8b 45 70 49 8d 7d =
10
48 89 44 24 38 e8 d1 d0 73 df 49 8b 6d 10 48 8d 7d 38 e8 c4 d0 73 df <48> 8=
b 45
38 48 89 44 24 20 45 84 e4 0f 84 e8 21 30 00 48 83 7c 24
[  214.325191] RSP: 0018:ffff888378a9f6b0 EFLAGS: 00010286
[  214.325204] RAX: 0000000000000000 RBX: ffff88837a5884d8 RCX:
ffffffffa0105081
[  214.325214] RDX: 0000000000000007 RSI: dffffc0000000000 RDI:
ffffffffa1968f34
[  214.325224] RBP: 0000000000000000 R08: fffffbfff42e638d R09:
fffffbfff42e638d
[  214.325234] R10: fffffbfff42e638c R11: ffffffffa1731c63 R12:
0000000000000001
[  214.325244] R13: ffff8883475050a8 R14: 0000000000000001 R15:
0000000000ffd000
[  214.325255] FS:  00007fd11b7fe700(0000) GS:ffff8883e6880000(0000)
knlGS:0000000000000000
[  214.325265] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  214.325275] CR2: 0000000000000038 CR3: 0000000373628000 CR4:
00000000000406e0
[  214.325283] Call Trace:
[  214.325299]  ? kasan_unpoison_shadow+0x30/0x40
[  214.325312]  ? __kasan_kmalloc.constprop.7+0xc1/0xd0
[  214.325729]  ? amdgpu_sync_create+0x32/0x50 [amdgpu]
[  214.326163]  amdgpu_amdkfd_submit_ib+0x13c/0x230 [amdgpu]
[  214.326597]  ? amdgpu_amdkfd_get_num_gws+0x20/0x20 [amdgpu]
[  214.327035]  ? dbgdev_wave_control_diq+0x280/0x280 [amdgpu]
[  214.327048]  ? wake_up_klogd+0x2b/0x30
[  214.327059]  ? vprintk_emit+0xdc/0x260
[  214.327070]  ? memset+0x1f/0x40
[  214.327507]  deallocate_vmid.isra.12+0x25a/0x270 [amdgpu]
[  214.327946]  destroy_queue_nocpsch_locked+0x33d/0x360 [amdgpu]
[  214.328382]  ? init_mqd_sdma+0x90/0x90 [amdgpu]
[  214.328819]  process_termination_nocpsch+0xb1/0x280 [amdgpu]
[  214.329257]  kfd_process_dequeue_from_all_devices+0x79/0xa0 [amdgpu]
[  214.329694]  kfd_process_notifier_release+0x1ab/0x250 [amdgpu]
[  214.329709]  __mmu_notifier_release+0x9d/0x1c0
[  214.329721]  ? check_chain_key+0x1d7/0x2e0
[  214.329732]  exit_mmap+0x7c/0x280
[  214.329746]  ? __ia32_sys_munmap+0x30/0x30
[  214.329758]  ? aio_poll_wake+0x3c0/0x3c0
[  214.329771]  ? lock_downgrade+0x390/0x390
[  214.329782]  ? up_read+0x12c/0x370
[  214.329795]  ? rwlock_bug.part.2+0x50/0x50
[  214.329808]  mmput+0x99/0x1f0
[  214.329820]  do_exit+0x3cc/0x12e0
[  214.329834]  ? queued_spin_lock_slowpath+0x366/0x420
[  214.329846]  ? check_chain_key+0x1d7/0x2e0
[  214.329858]  ? mm_update_next_owner+0x340/0x340
[  214.329871]  ? lock_downgrade+0x390/0x390
[  214.329884]  ? do_raw_spin_lock+0x10e/0x1d0
[  214.329896]  ? match_held_lock+0x2e/0x240
[  214.329908]  do_group_exit+0x86/0x130
[  214.329921]  get_signal+0x1bc/0xeb0
[  214.329934]  ? refcount_sub_and_test_checked+0xaf/0x150
[  214.329947]  do_signal+0x9e/0xad0
[  214.329959]  ? wake_up_q+0x72/0x90
[  214.329970]  ? rwsem_wake.isra.9+0xb3/0xf0
[  214.329981]  ? rwsem_mark_wake+0x4d0/0x4d0
[  214.329994]  ? setup_sigcontext+0x250/0x250
[  214.330006]  ? __x64_sys_futex+0x1d3/0x240
[  214.330017]  ? down_read_nested+0x2b0/0x2b0
[  214.330029]  ? trace_hardirqs_on_thunk+0x1a/0x20
[  214.330041]  ? mark_held_locks+0x29/0xa0
[  214.330052]  ? exit_to_usermode_loop+0x41/0x130
[  214.330064]  exit_to_usermode_loop+0x59/0x130
[  214.330076]  do_syscall_64+0x1fd/0x250
[  214.330089]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  214.330100] RIP: 0033:0x7fd134c26f6c
[  214.330112] Code: Bad RIP value.
[  214.330121] RSP: 002b:00007fd11b7fdd30 EFLAGS: 00000246 ORIG_RAX:
00000000000000ca
[  214.330134] RAX: fffffffffffffe00 RBX: 00007fd125838c48 RCX:
00007fd134c26f6c
[  214.330143] RDX: 0000000000000000 RSI: 0000000000000080 RDI:
00007fd125838c74
[  214.330153] RBP: 0000000000000000 R08: 0000000000000000 R09:
00007fd108000b20
[  214.330162] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000007
[  214.330171] R13: 00007fd125838c20 R14: 0000000000000000 R15:
00007fd125838c74
[  214.330181] Modules linked in: fuse cfg80211 rfkill dm_crypt nhpoly1305_=
sse2
nhpoly1305 chacha_x86_64 chacha_generic adiantum poly1305_generic
algif_skcipher crct10dif_pclmul crc32_generic crc32_pclmul ghash_generic
gf128mul gcm dm_mod input_leds led_class xts joydev hid_generic ctr usbhid =
hid
cbc ext4 crc16 mbcache jbd2 ecb amdgpu aesni_intel aes_x86_64 glue_helper
crypto_simd evdev cryptd k10temp fam15h_power sr_mod cdrom hwmon gpu_sched
snd_hda_codec_realtek i2c_algo_bit snd_hda_codec_generic ttm snd_hda_codec_=
hdmi
ohci_pci drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect sysim=
gblt
fb_sys_fops cfbcopyarea fb font fbdev snd_hda_intel drm snd_hda_codec alx m=
dio
snd_hwdep drm_panel_orientation_quirks backlight ehci_pci snd_hda_core ohci=
_hcd
snd_pcm ehci_hcd acpi_cpufreq snd_timer usbcore button processor snd usb_co=
mmon
soundcore i2c_piix4 lzo sg zstd zram zsmalloc
[  214.330329] CR2: 0000000000000038
[  214.330342] ---[ end trace c1688762b8700f92 ]---
[  214.330760] RIP: 0010:amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.330773] Code: 00 00 49 8d 7d 70 e8 e3 d0 73 df 49 8b 45 70 49 8d 7d =
10
48 89 44 24 38 e8 d1 d0 73 df 49 8b 6d 10 48 8d 7d 38 e8 c4 d0 73 df <48> 8=
b 45
38 48 89 44 24 20 45 84 e4 0f 84 e8 21 30 00 48 83 7c 24
[  214.330784] RSP: 0018:ffff888378a9f6b0 EFLAGS: 00010286
[  214.330796] RAX: 0000000000000000 RBX: ffff88837a5884d8 RCX:
ffffffffa0105081
[  214.330806] RDX: 0000000000000007 RSI: dffffc0000000000 RDI:
ffffffffa1968f34
[  214.330816] RBP: 0000000000000000 R08: fffffbfff42e638d R09:
fffffbfff42e638d
[  214.330826] R10: fffffbfff42e638c R11: ffffffffa1731c63 R12:
0000000000000001
[  214.330835] R13: ffff8883475050a8 R14: 0000000000000001 R15:
0000000000ffd000
[  214.330847] FS:  00007fd11b7fe700(0000) GS:ffff8883e6880000(0000)
knlGS:0000000000000000
[  214.330857] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  214.330866] CR2: 00007fd134c26f42 CR3: 0000000373628000 CR4:
00000000000406e0
[  214.330876] Fixing recursive fault but reboot is needed!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15647705972.D4a90De4f.10608
Date: Fri, 2 Aug 2019 18:29:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [kernel 5.2.1][amdgpu][CIK] BUG: KASAN: null-ptr-deref in=
 amdgpu_ib_schedule+0x82/0x790 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111021#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [kernel 5.2.1][amdgpu][CIK] BUG: KASAN: null-ptr-deref in=
 amdgpu_ib_schedule+0x82/0x790 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111021">bug 11102=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
erhard_f&#64;mailbox.org" title=3D"erhard_f&#64;mailbox.org">erhard_f&#64;m=
ailbox.org</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144933=
" name=3D"attach_144933" title=3D"kernel dmesg (5.3-rc2)">attachment 144933=
</a> <a href=3D"attachment.cgi?id=3D144933&amp;action=3Dedit" title=3D"kern=
el dmesg (5.3-rc2)">[details]</a></span>
kernel dmesg (5.3-rc2)

[...]
[  214.315038] cp queue preemption time out
[  214.315406] Resetting wave fronts (nocpsch) on dev 00000000c3d0b577
[  214.316011]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  214.316631] BUG: KASAN: null-ptr-deref in amdgpu_ib_schedule+0x7c/0x7f0
[amdgpu]
[  214.316664] Read of size 8 at addr 0000000000000038 by task xmr-stak/1130

[  214.316724] CPU: 5 PID: 1130 Comm: xmr-stak Not tainted 5.3.0-rc2 #1
[  214.316754] Hardware name: System manufacturer System Product Name/M5A78=
L-M
LX3, BIOS 1401    05/05/2016
[  214.316783] Call Trace:
[  214.316818]  dump_stack+0x7c/0xc0
[  214.317258]  ? amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.317696]  ? amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.317730]  __kasan_report.cold.6+0x5/0x3c
[  214.318168]  ? amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.318606]  amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.318640]  ? kasan_unpoison_shadow+0x30/0x40
[  214.318672]  ? __kasan_kmalloc.constprop.7+0xc1/0xd0
[  214.319110]  ? amdgpu_sync_create+0x32/0x50 [amdgpu]
[  214.319568]  amdgpu_amdkfd_submit_ib+0x13c/0x230 [amdgpu]
[  214.320026]  ? amdgpu_amdkfd_get_num_gws+0x20/0x20 [amdgpu]
[  214.320487]  ? dbgdev_wave_control_diq+0x280/0x280 [amdgpu]
[  214.320520]  ? wake_up_klogd+0x2b/0x30
[  214.320550]  ? vprintk_emit+0xdc/0x260
[  214.320581]  ? memset+0x1f/0x40
[  214.321040]  deallocate_vmid.isra.12+0x25a/0x270 [amdgpu]
[  214.321503]  destroy_queue_nocpsch_locked+0x33d/0x360 [amdgpu]
[  214.321962]  ? init_mqd_sdma+0x90/0x90 [amdgpu]
[  214.322424]  process_termination_nocpsch+0xb1/0x280 [amdgpu]
[  214.322886]  kfd_process_dequeue_from_all_devices+0x79/0xa0 [amdgpu]
[  214.323345]  kfd_process_notifier_release+0x1ab/0x250 [amdgpu]
[  214.323382]  __mmu_notifier_release+0x9d/0x1c0
[  214.323414]  ? check_chain_key+0x1d7/0x2e0
[  214.323446]  exit_mmap+0x7c/0x280
[  214.323479]  ? __ia32_sys_munmap+0x30/0x30
[  214.323512]  ? aio_poll_wake+0x3c0/0x3c0
[  214.323543]  ? lock_downgrade+0x390/0x390
[  214.323574]  ? up_read+0x12c/0x370
[  214.323606]  ? rwlock_bug.part.2+0x50/0x50
[  214.323638]  mmput+0x99/0x1f0
[  214.323671]  do_exit+0x3cc/0x12e0
[  214.323703]  ? queued_spin_lock_slowpath+0x366/0x420
[  214.323735]  ? check_chain_key+0x1d7/0x2e0
[  214.323766]  ? mm_update_next_owner+0x340/0x340
[  214.323798]  ? lock_downgrade+0x390/0x390
[  214.323830]  ? do_raw_spin_lock+0x10e/0x1d0
[  214.323861]  ? match_held_lock+0x2e/0x240
[  214.323892]  do_group_exit+0x86/0x130
[  214.323925]  get_signal+0x1bc/0xeb0
[  214.323958]  ? refcount_sub_and_test_checked+0xaf/0x150
[  214.323992]  do_signal+0x9e/0xad0
[  214.324024]  ? wake_up_q+0x72/0x90
[  214.324054]  ? rwsem_wake.isra.9+0xb3/0xf0
[  214.324085]  ? rwsem_mark_wake+0x4d0/0x4d0
[  214.324116]  ? setup_sigcontext+0x250/0x250
[  214.324149]  ? __x64_sys_futex+0x1d3/0x240
[  214.324179]  ? down_read_nested+0x2b0/0x2b0
[  214.324211]  ? trace_hardirqs_on_thunk+0x1a/0x20
[  214.324242]  ? mark_held_locks+0x29/0xa0
[  214.324272]  ? exit_to_usermode_loop+0x41/0x130
[  214.324303]  exit_to_usermode_loop+0x59/0x130
[  214.324334]  do_syscall_64+0x1fd/0x250
[  214.324368]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  214.324398] RIP: 0033:0x7fd134c26f6c
[  214.324433] Code: Bad RIP value.
[  214.324462] RSP: 002b:00007fd11b7fdd30 EFLAGS: 00000246 ORIG_RAX:
00000000000000ca
[  214.324496] RAX: fffffffffffffe00 RBX: 00007fd125838c48 RCX:
00007fd134c26f6c
[  214.324525] RDX: 0000000000000000 RSI: 0000000000000080 RDI:
00007fd125838c74
[  214.324554] RBP: 0000000000000000 R08: 0000000000000000 R09:
00007fd108000b20
[  214.324582] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000007
[  214.324611] R13: 00007fd125838c20 R14: 0000000000000000 R15:
00007fd125838c74
[  214.324640]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  214.324666] Disabling lock debugging due to kernel taint
[  214.324680] BUG: kernel NULL pointer dereference, address: 0000000000000=
038
[  214.324691] #PF: supervisor read access in kernel mode
[  214.324700] #PF: error_code(0x0000) - not-present page
[  214.324708] PGD 0 P4D 0=20
[  214.324722] Oops: 0000 [#1] SMP KASAN NOPTI
[  214.324736] CPU: 5 PID: 1130 Comm: xmr-stak Tainted: G    B=20=20=20=20=
=20=20=20=20=20=20=20=20
5.3.0-rc2 #1
[  214.324746] Hardware name: System manufacturer System Product Name/M5A78=
L-M
LX3, BIOS 1401    05/05/2016
[  214.325166] RIP: 0010:amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.325180] Code: 00 00 49 8d 7d 70 e8 e3 d0 73 df 49 8b 45 70 49 8d 7d =
10
48 89 44 24 38 e8 d1 d0 73 df 49 8b 6d 10 48 8d 7d 38 e8 c4 d0 73 df &lt;48=
&gt; 8b 45
38 48 89 44 24 20 45 84 e4 0f 84 e8 21 30 00 48 83 7c 24
[  214.325191] RSP: 0018:ffff888378a9f6b0 EFLAGS: 00010286
[  214.325204] RAX: 0000000000000000 RBX: ffff88837a5884d8 RCX:
ffffffffa0105081
[  214.325214] RDX: 0000000000000007 RSI: dffffc0000000000 RDI:
ffffffffa1968f34
[  214.325224] RBP: 0000000000000000 R08: fffffbfff42e638d R09:
fffffbfff42e638d
[  214.325234] R10: fffffbfff42e638c R11: ffffffffa1731c63 R12:
0000000000000001
[  214.325244] R13: ffff8883475050a8 R14: 0000000000000001 R15:
0000000000ffd000
[  214.325255] FS:  00007fd11b7fe700(0000) GS:ffff8883e6880000(0000)
knlGS:0000000000000000
[  214.325265] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  214.325275] CR2: 0000000000000038 CR3: 0000000373628000 CR4:
00000000000406e0
[  214.325283] Call Trace:
[  214.325299]  ? kasan_unpoison_shadow+0x30/0x40
[  214.325312]  ? __kasan_kmalloc.constprop.7+0xc1/0xd0
[  214.325729]  ? amdgpu_sync_create+0x32/0x50 [amdgpu]
[  214.326163]  amdgpu_amdkfd_submit_ib+0x13c/0x230 [amdgpu]
[  214.326597]  ? amdgpu_amdkfd_get_num_gws+0x20/0x20 [amdgpu]
[  214.327035]  ? dbgdev_wave_control_diq+0x280/0x280 [amdgpu]
[  214.327048]  ? wake_up_klogd+0x2b/0x30
[  214.327059]  ? vprintk_emit+0xdc/0x260
[  214.327070]  ? memset+0x1f/0x40
[  214.327507]  deallocate_vmid.isra.12+0x25a/0x270 [amdgpu]
[  214.327946]  destroy_queue_nocpsch_locked+0x33d/0x360 [amdgpu]
[  214.328382]  ? init_mqd_sdma+0x90/0x90 [amdgpu]
[  214.328819]  process_termination_nocpsch+0xb1/0x280 [amdgpu]
[  214.329257]  kfd_process_dequeue_from_all_devices+0x79/0xa0 [amdgpu]
[  214.329694]  kfd_process_notifier_release+0x1ab/0x250 [amdgpu]
[  214.329709]  __mmu_notifier_release+0x9d/0x1c0
[  214.329721]  ? check_chain_key+0x1d7/0x2e0
[  214.329732]  exit_mmap+0x7c/0x280
[  214.329746]  ? __ia32_sys_munmap+0x30/0x30
[  214.329758]  ? aio_poll_wake+0x3c0/0x3c0
[  214.329771]  ? lock_downgrade+0x390/0x390
[  214.329782]  ? up_read+0x12c/0x370
[  214.329795]  ? rwlock_bug.part.2+0x50/0x50
[  214.329808]  mmput+0x99/0x1f0
[  214.329820]  do_exit+0x3cc/0x12e0
[  214.329834]  ? queued_spin_lock_slowpath+0x366/0x420
[  214.329846]  ? check_chain_key+0x1d7/0x2e0
[  214.329858]  ? mm_update_next_owner+0x340/0x340
[  214.329871]  ? lock_downgrade+0x390/0x390
[  214.329884]  ? do_raw_spin_lock+0x10e/0x1d0
[  214.329896]  ? match_held_lock+0x2e/0x240
[  214.329908]  do_group_exit+0x86/0x130
[  214.329921]  get_signal+0x1bc/0xeb0
[  214.329934]  ? refcount_sub_and_test_checked+0xaf/0x150
[  214.329947]  do_signal+0x9e/0xad0
[  214.329959]  ? wake_up_q+0x72/0x90
[  214.329970]  ? rwsem_wake.isra.9+0xb3/0xf0
[  214.329981]  ? rwsem_mark_wake+0x4d0/0x4d0
[  214.329994]  ? setup_sigcontext+0x250/0x250
[  214.330006]  ? __x64_sys_futex+0x1d3/0x240
[  214.330017]  ? down_read_nested+0x2b0/0x2b0
[  214.330029]  ? trace_hardirqs_on_thunk+0x1a/0x20
[  214.330041]  ? mark_held_locks+0x29/0xa0
[  214.330052]  ? exit_to_usermode_loop+0x41/0x130
[  214.330064]  exit_to_usermode_loop+0x59/0x130
[  214.330076]  do_syscall_64+0x1fd/0x250
[  214.330089]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  214.330100] RIP: 0033:0x7fd134c26f6c
[  214.330112] Code: Bad RIP value.
[  214.330121] RSP: 002b:00007fd11b7fdd30 EFLAGS: 00000246 ORIG_RAX:
00000000000000ca
[  214.330134] RAX: fffffffffffffe00 RBX: 00007fd125838c48 RCX:
00007fd134c26f6c
[  214.330143] RDX: 0000000000000000 RSI: 0000000000000080 RDI:
00007fd125838c74
[  214.330153] RBP: 0000000000000000 R08: 0000000000000000 R09:
00007fd108000b20
[  214.330162] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000007
[  214.330171] R13: 00007fd125838c20 R14: 0000000000000000 R15:
00007fd125838c74
[  214.330181] Modules linked in: fuse cfg80211 rfkill dm_crypt nhpoly1305_=
sse2
nhpoly1305 chacha_x86_64 chacha_generic adiantum poly1305_generic
algif_skcipher crct10dif_pclmul crc32_generic crc32_pclmul ghash_generic
gf128mul gcm dm_mod input_leds led_class xts joydev hid_generic ctr usbhid =
hid
cbc ext4 crc16 mbcache jbd2 ecb amdgpu aesni_intel aes_x86_64 glue_helper
crypto_simd evdev cryptd k10temp fam15h_power sr_mod cdrom hwmon gpu_sched
snd_hda_codec_realtek i2c_algo_bit snd_hda_codec_generic ttm snd_hda_codec_=
hdmi
ohci_pci drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect sysim=
gblt
fb_sys_fops cfbcopyarea fb font fbdev snd_hda_intel drm snd_hda_codec alx m=
dio
snd_hwdep drm_panel_orientation_quirks backlight ehci_pci snd_hda_core ohci=
_hcd
snd_pcm ehci_hcd acpi_cpufreq snd_timer usbcore button processor snd usb_co=
mmon
soundcore i2c_piix4 lzo sg zstd zram zsmalloc
[  214.330329] CR2: 0000000000000038
[  214.330342] ---[ end trace c1688762b8700f92 ]---
[  214.330760] RIP: 0010:amdgpu_ib_schedule+0x7c/0x7f0 [amdgpu]
[  214.330773] Code: 00 00 49 8d 7d 70 e8 e3 d0 73 df 49 8b 45 70 49 8d 7d =
10
48 89 44 24 38 e8 d1 d0 73 df 49 8b 6d 10 48 8d 7d 38 e8 c4 d0 73 df &lt;48=
&gt; 8b 45
38 48 89 44 24 20 45 84 e4 0f 84 e8 21 30 00 48 83 7c 24
[  214.330784] RSP: 0018:ffff888378a9f6b0 EFLAGS: 00010286
[  214.330796] RAX: 0000000000000000 RBX: ffff88837a5884d8 RCX:
ffffffffa0105081
[  214.330806] RDX: 0000000000000007 RSI: dffffc0000000000 RDI:
ffffffffa1968f34
[  214.330816] RBP: 0000000000000000 R08: fffffbfff42e638d R09:
fffffbfff42e638d
[  214.330826] R10: fffffbfff42e638c R11: ffffffffa1731c63 R12:
0000000000000001
[  214.330835] R13: ffff8883475050a8 R14: 0000000000000001 R15:
0000000000ffd000
[  214.330847] FS:  00007fd11b7fe700(0000) GS:ffff8883e6880000(0000)
knlGS:0000000000000000
[  214.330857] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  214.330866] CR2: 00007fd134c26f42 CR3: 0000000373628000 CR4:
00000000000406e0
[  214.330876] Fixing recursive fault but reboot is needed!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15647705972.D4a90De4f.10608--

--===============0082949397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0082949397==--
