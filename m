Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4171527FE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 10:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8388089933;
	Wed,  5 Feb 2020 09:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC9089933;
 Wed,  5 Feb 2020 09:04:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F2EA2ABE9;
 Wed,  5 Feb 2020 09:04:51 +0000 (UTC)
Subject: Re: [PATCH 00/14] amdgpu: remove load and unload callbacks
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200205034852.4157-1-alexander.deucher@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <22ba2906-cd75-28df-3ffd-c7ccfd55aa98@suse.de>
Date: Wed, 5 Feb 2020 10:04:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205034852.4157-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1295608804=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1295608804==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cpH11ckwvaqrsmJQBLLR4qsp4dTR8vag4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cpH11ckwvaqrsmJQBLLR4qsp4dTR8vag4
Content-Type: multipart/mixed; boundary="oC3YZT1YNvSM6ljBuEEbcDIlDC6CzzSC9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Message-ID: <22ba2906-cd75-28df-3ffd-c7ccfd55aa98@suse.de>
Subject: Re: [PATCH 00/14] amdgpu: remove load and unload callbacks
References: <20200205034852.4157-1-alexander.deucher@amd.com>
In-Reply-To: <20200205034852.4157-1-alexander.deucher@amd.com>

--oC3YZT1YNvSM6ljBuEEbcDIlDC6CzzSC9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Alex

Am 05.02.20 um 04:48 schrieb Alex Deucher:
> These are deprecated and the drm will soon start warning when drivers s=
till
> use them.  It was a long and twisty road, but seems to work.
>=20
> Alex Deucher (14):
>   drm/amdgpu: rename amdgpu_debugfs_preempt_cleanup
>   drm/amdgpu/ttm: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/pm: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/sa: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/fence: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/gem: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/regs: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/firmware: move debugfs init into core amdgpu debugfs
>   drm/amdgpu: don't call drm_connector_register for non-MST ports
>   drm/amdgpu/display: move debugfs init into core amdgpu debugfs
>   drm/amd/display: move dpcd debugfs members setup
>   drm/amdgpu/display: add a late register connector callback
>   drm/amdgpu/ring: move debugfs init into core amdgpu debugfs
>   drm/amdgpu: drop legacy drm load and unload callbacks

Trying out the patches (on drm-tip) resulted in a NULL-pointer access
during startup.

[   10.059945]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   10.067285] BUG: KASAN: null-ptr-deref in drm_dp_aux_register+0xcc/0xf=
0
[   10.073941] Read of size 8 at addr 0000000000000050 by task
systemd-udevd/379
[   10.081118]
[   10.089117]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   10.096675] BUG: kernel NULL pointer dereference, address:
0000000000000050
[   10.103674] #PF: supervisor read access in kernel mode
[   10.108840] #PF: error_code(0x0000) - not-present page
[   10.114004] PGD 0 P4D 0
[   10.116557] Oops: 0000 [#1] SMP KASAN PTI
[   10.120586] CPU: 2 PID: 379 Comm: systemd-udevd Tainted: G    B
 E     5.5.0-1-default+ #235
[   10.129500] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24
10/24/2018
[   10.136775] RIP: 0010:drm_dp_aux_register+0xcc/0xf0
[   10.136778] Code: 41 5c c3 4c 89 e7 e8 53 b4 28 00 85 c0 74 eb 48 89
ef 89 44 24 04 e8 23 1d 02 00 8b 44 24 04 eb d9 48 8d 7b 50 e8 d4 98 8f
ff <48> 8b 73 50 48 85 f6 75 aa 48 89 df e8 c3 98 8f ff 48 8b 33 eb 9d
[   10.136779] RSP: 0018:ffffc90000a3f0b0 EFLAGS: 00010286
[   10.165792] RAX: ffff8886dc5505c0 RBX: 0000000000000000 RCX:
dffffc0000000000
[   10.165793] RDX: 0000000000000007 RSI: 0000000000000004 RDI:
0000000000000297
[   10.165805] RBP: ffff8886c1f1c900 R08: ffffffff9f19ec71 R09:
fffffbfff4246b5d
[   10.165806] R10: fffffbfff4246b5c R11: ffffffffa1235ae3 R12:
ffff8886c1f1c908
[   10.165807] R13: 0000000000000000 R14: 0000000000000001 R15:
ffff8886bbd64000
[   10.165809] FS:  00007f094629adc0(0000) GS:ffff8886fb600000(0000)
knlGS:0000000000000000
[   10.165810] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.165812] CR2: 0000000000000050 CR3: 00000006dc558006 CR4:
00000000001606e0
[   10.165813] Call Trace:
[   10.165995]  amdgpu_atombios_dp_aux_init+0xa2/0xf0 [amdgpu]
[   10.230952]  amdgpu_connector_add+0x8c3/0x1320 [amdgpu]
[   10.231113]  ? amdgpu_connector_is_dp12_capable+0xf0/0xf0 [amdgpu]
[  OK     10.242611]  ? amdgpu_connector_is_dp12_capable+0xf0/0xf0 [amdgp=
u]
[   10.242783]
amdgpu_atombios_get_connector_info_from_object_table+0x9fd/0xd60 [amdgpu]=

0m] Started    10.258253]  ?
amdgpu_atombios_has_dce_engine_info+0x110/0x110 [amdgpu]
[   10.258259]  ? match_held_lock+0x1b/0x240
1;39mForward Pas[   10.270175]  ? __lock_acquire+0x543/0xaf0
[   10.270188]  ? collect_percpu_times+0x3bb/0x400
[   10.270198]  ? rcu_read_lock_bh_held+0xa0/0xa0
[   10.284629]  ? debug_lockdep_rcu_enabled.part.0+0x16/0x30
[   10.284634]  ? __kmalloc+0x310/0x6e0
sword R=EF=BF=BD=E2=80=A6s to P[   10.293648]  ? drm_mode_crtc_set_gamma_=
size+0x44/0xf0
[   10.293834]  ? dce_v6_0_sw_init+0x3c4/0x720 [amdgpu]
[   10.293986]  dce_v6_0_sw_init+0x3c4/0x720 [amdgpu]
lymouth Director[   10.310201]  ? si_dma_sw_init+0x8b/0x120 [amdgpu]
[   10.310409]  amdgpu_device_ip_init+0xbd/0x64e [amdgpu]
y Watch.
[[   10.321430]  amdgpu_device_init.cold+0xb92/0xf26 [amdgpu]
[   10.321577]  ? amdgpu_driver_load_kms+0x7a/0x370 [amdgpu]
[   10.333506]  ? rcu_read_lock_sched_held+0x85/0x90
[   10.333689]  ? amdgpu_device_has_dc_support+0x30/0x30 [amdgpu]
  OK     10.344105]  ? debug_lockdep_rcu_enabled.part.0+0x16/0x30
[   10.344108]  ? kmem_cache_alloc_trace+0x51e/0x6b0
[   10.344112]  ? kstrdup+0x44/0x60
[   10.344269]  amdgpu_driver_load_kms+0xc7/0x370 [amdgpu]
[   10.344414]  ? amdgpu_register_gpu_instance+0xd0/0xd0 [amdgpu]
[   10.344581]  ? amdgpu_dm_initialize_drm_device+0xe88/0x1544 [amdgpu]
m] Reached targe[   10.376553]  amdgpu_pci_probe+0x12e/0x1d0 [amdgpu]
[   10.376698]  ? amdgpu_pmops_runtime_idle+0xf0/0xf0 [amdgpu]
[   10.388229]  local_pci_probe+0x74/0xc0
t Paths[   10.388233]  pci_device_probe+0x1c9/0x2d0
[   10.388252]  ? pci_device_remove+0x180/0x180
[   10.388258]  ? sysfs_do_create_link_sd.isra.0+0x74/0xd0
=2E
[   10.406977]  really_probe+0x184/0x530
[   10.406999]  driver_probe_device+0x119/0x180
[   10.407002]  device_driver_attach+0x87/0x90
[   10.407006]  ? device_driver_attach+0x90/0x90
[   10.407008]  __driver_attach+0xb0/0x1a0
[   10.407011]  ? device_driver_attach+0x90/0x90
[   10.407013]  bus_for_each_dev+0xdd/0x120
[   10.407016]  ? subsys_dev_iter_exit+0x10/0x10
[   10.407020]  bus_add_driver+0x22c/0x2e0
[   10.407025]  driver_register+0xd8/0x160
[   10.407027]  ? 0xffffffffc0c23000
[   10.407031]  do_one_initcall+0xbd/0x3c0
[   10.407034]  ? trace_event_raw_event_initcall_finish+0x120/0x120
[   10.407036]  ? rcu_read_lock_sched_held+0x85/0x90
[   10.407038]  ? rcu_read_lock_bh_held+0xa0/0xa0
[   10.407041]  ? debug_lockdep_rcu_enabled.part.0+0x16/0x30
[   10.407053]  ? kmem_cache_alloc_trace+0x51e/0x6b0
[   10.407056]  ? kasan_unpoison_shadow+0x33/0x40
[   10.407061]  do_init_module+0xfd/0x390
[   10.407065]  load_module+0x255b/0x2910
[   10.407077]  ? layout_and_allocate+0x850/0x850
[   10.407081]  ? ima_post_read_file+0x141/0x150
[   10.407084]  ? ima_read_file+0x10/0x10
[   10.407087]  ? kernel_read+0x9b/0xc0
[   10.407098]  ? __do_sys_finit_module+0x110/0x180
[   10.407100]  __do_sys_finit_module+0x110/0x180
[   10.407103]  ? __ia32_sys_init_module+0x40/0x40
[   10.407113]  ? lockdep_hardirqs_off+0xbe/0x100
[   10.407116]  ? mark_held_locks+0x23/0xa0
[   10.407118]  ? do_syscall_64+0x14/0x2f0
[   10.407121]  do_syscall_64+0x72/0x2f0
[   10.407125]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   10.407128] RIP: 0033:0x7f0946efb059
[   10.547382] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f7 5d 0c 00 f7 d8 64 89 01 48
[   10.547383] RSP: 002b:00007fff73b3e968 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   10.547386] RAX: ffffffffffffffda RBX: 00005590ab8e0220 RCX:
00007f0946efb059
[   10.547387] RDX: 0000000000000000 RSI: 00007f0946b4489d RDI:
0000000000000010
[   10.547388] RBP: 0000000000020000 R08: 0000000000000000 R09:
00005590ab8b9380
[   10.547389] R10: 0000000000000010 R11: 0000000000000246 R12:
00007f0946b4489d
[   10.547390] R13: 0000000000000000 R14: 00005590ab8ea990 R15:
00005590ab8e0220
[   10.547396] Modules linked in: crc32c_intel(E) uas(E) serio_raw(E)
usb_storage(E) amdgpu(E+) sr_mod(E) cdrom(E) amd_iommu_v2(E)
gpu_sched(E) ttm(E) wmi(E) video(E) sg(E) dm_multipath(E) dm_mod(E)
scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh)
[   10.547411] CR2: 0000000000000050
[   10.547447] ---[ end trace c841ccbdd3b7b879 ]---
[   10.547455] RIP: 0010:drm_dp_aux_register+0xcc/0xf0
[   10.547459] Code: 41 5c c3 4c 89 e7 e8 53 b4 28 00 85 c0 74 eb 48 89
ef 89 44 24 04 e8 23 1d 02 00 8b 44 24 04 eb d9 48 8d 7b 50 e8 d4 98 8f
ff <48> 8b 73 50 48 85 f6 75 aa 48 89 df e8 c3 98 8f ff 48 8b 33 eb 9d
[   10.547461] RSP: 0018:ffffc90000a3f0b0 EFLAGS: 00010286
[   10.547464] RAX: ffff8886dc5505c0 RBX: 0000000000000000 RCX:
dffffc0000000000
[   10.547466] RDX: 0000000000000007 RSI: 0000000000000004 RDI:
0000000000000297
[   10.547468] RBP: ffff8886c1f1c900 R08: ffffffff9f19ec71 R09:
fffffbfff4246b5d
[   10.547469] R10: fffffbfff4246b5c R11: ffffffffa1235ae3 R12:
ffff8886c1f1c908
[   10.547470] R13: 0000000000000000 R14: 0000000000000001 R15:
ffff8886bbd64000
[   10.547472] FS:  00007f094629adc0(0000) GS:ffff8886fb600000(0000)
knlGS:0000000000000000
[   10.547475] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.547476] CR2: 0000000000000050 CR3: 00000006dc558006 CR4:
00000000001606e0


The device is

01:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Oland [Radeon HD 8570 / R7 240/340 OEM] [1002:6611] (prog-if
00 [VGA controller])
        Subsystem: Dell Radeon R5 240 OEM [1028:210b]
        Flags: bus master, fast devsel, latency 0, IRQ 30
        Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at f7e00000 (64-bit, non-prefetchable) [size=3D256K]
        I/O ports at e000 [size=3D256]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Legacy Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D=
1
Len=3D010 <?>
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [200] Resizable BAR <?>
        Capabilities: [270] Secondary PCI Express <?>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

Best regards
Thomas


>=20
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 67 ++++++++++++++++++-=

>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 17 -----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  3 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |  7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c        |  9 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h        |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      | 15 +----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |  4 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 14 +---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 +
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  1 -
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++----
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  3 +
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 -
>  18 files changed, 112 insertions(+), 78 deletions(-)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--oC3YZT1YNvSM6ljBuEEbcDIlDC6CzzSC9--

--cpH11ckwvaqrsmJQBLLR4qsp4dTR8vag4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl46hScACgkQaA3BHVML
eiOa3QgAuNHOGr/M8vSLztfjOVywa8PyWZFTmN40k9fdBMAcq8tg+GRNQcui60L4
ZTjGfUN6CPp0o4xzCiGgTlE1gPU2wSTBt9OUTduRDspstI67Q3WooeO9gYd1uxMr
5x/8n5dEUAnp58N4lpmktL5lso8G3Pfnv90duCjJEPHdL24iS5SqnJadkeLHPTR9
fQQYy+YTs17JoldkRxqx7d+Js2W5kYc9pD0Rsn8GjvOTAiGzoLu6y0MyfAI3GiIV
wXhui+tHL5vJAjH/G2woaGe26TEzqA1HVHR/vS0ILUH+jXvzR8xLlbzlvOTXSBLh
dRQ0EYqqyJGKM6Ys6MOhav7rLVPmIQ==
=Kryp
-----END PGP SIGNATURE-----

--cpH11ckwvaqrsmJQBLLR4qsp4dTR8vag4--

--===============1295608804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1295608804==--
