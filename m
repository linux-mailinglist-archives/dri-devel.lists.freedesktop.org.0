Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABD8153527
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 17:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C856F88E;
	Wed,  5 Feb 2020 16:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3006F6F88D;
 Wed,  5 Feb 2020 16:23:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BB5D0B1B4;
 Wed,  5 Feb 2020 16:23:09 +0000 (UTC)
Subject: Re: [PATCH 00/15] amdgpu: remove load and unload callbacks (v2)
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200205154000.536145-1-alexander.deucher@amd.com>
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
Message-ID: <7a461ea0-c3c5-9a62-9a6c-e3ad69dd30f7@suse.de>
Date: Wed, 5 Feb 2020 17:23:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205154000.536145-1-alexander.deucher@amd.com>
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
Content-Type: multipart/mixed; boundary="===============2043179968=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2043179968==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OkxvaPS9ECL923RQaH8DNIUdj6X2JmkqF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OkxvaPS9ECL923RQaH8DNIUdj6X2JmkqF
Content-Type: multipart/mixed; boundary="Q7mX1OZNZXR5HAgdlVHl7wc0VpAcf6XEm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Message-ID: <7a461ea0-c3c5-9a62-9a6c-e3ad69dd30f7@suse.de>
Subject: Re: [PATCH 00/15] amdgpu: remove load and unload callbacks (v2)
References: <20200205154000.536145-1-alexander.deucher@amd.com>
In-Reply-To: <20200205154000.536145-1-alexander.deucher@amd.com>

--Q7mX1OZNZXR5HAgdlVHl7wc0VpAcf6XEm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.02.20 um 16:39 schrieb Alex Deucher:
> These are deprecated and the drm will soon start warning when drivers s=
till
> use them.  It was a long and twisty road, but seems to work.
>=20
> v2: Add additional patch (13/15) which should fix the crash reported by=

> Thomas Zimmermann.

I tried again, but there's still a bug.

[   10.976846]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   10.984099] BUG: KASAN: null-ptr-deref in drm_dp_aux_register+0xcc/0xf=
0
[   10.990705] Read of size 8 at addr 0000000000000050 by task
systemd-udevd/385
[   10.997828]
[   11.000633]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   11.007889] BUG: kernel NULL pointer dereference, address:
0000000000000050
[   11.014836] #PF: supervisor read access in kernel mode
[   11.019962] #PF: error_code(0x0000) - not-present page
[   11.025087] PGD 0 P4D 0
[   11.027614] Oops: 0000 [#1] SMP KASAN PTI
[   11.031614] CPU: 5 PID: 385 Comm: systemd-udevd Tainted: G    B
 E     5.5.0-1-default+ #235
[   11.040464] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24
10/24/2018
[   11.047671] RIP: 0010:drm_dp_aux_register+0xcc/0xf0
[   11.052536] Code: 41 5c c3 4c 89 e7 e8 53 b4 28 00 85 c0 74 eb 48 89
ef 89 44 24 04 e8 23 1d 02 00 8b 44 24 04 eb d9 48 8d 7b 50 e8 d4 98 8f
ff <48> 8b 73 50 48 85 f6 75 aa 48 89 df e8 c3 98 8f ff 48 8b 33 eb 9d
[   11.071266] RSP: 0018:ffffc90000a6f600 EFLAGS: 00010282
[   11.076480] RAX: ffff8886da438700 RBX: 0000000000000000 RCX:
dffffc0000000000
[   11.083599] RDX: 0000000000000007 RSI: 0000000000000004 RDI:
0000000000000297
[   11.090716] RBP: ffff8886c0ca8900 R08: ffffffffaf19ec71 R09:
fffffbfff6246b5d
[   11.097834] R10: fffffbfff6246b5c R11: ffffffffb1235ae3 R12:
ffff8886c0ca8908
[   11.104953] R13: ffff8886baa0d050 R14: ffff8886baa0d100 R15:
ffffffffc0bdb180
[   11.112073] FS:  00007fcdc3effdc0(0000) GS:ffff8886fc200000(0000)
knlGS:0000000000000000
[   11.120147] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.125878] CR2: 0000000000000050 CR3: 00000006da450006 CR4:
00000000001606e0
[   11.132997] Call Trace:
[   11.135441]  drm_connector_register.part.0+0x92/0xe0
[   11.140396]  drm_connector_register_all+0xb9/0x110
[   11.145178]  ? drm_connector_unregister_all+0xc0/0xc0
[   11.150221]  drm_modeset_register_all+0x5b/0x70
[   11.154742]  drm_dev_register+0x1cd/0x210
[   11.158886]  amdgpu_pci_probe+0x142/0x1d0 [amdgpu]
[   11.163809]  ? amdgpu_pmops_runtime_idle+0xf0/0xf0 [amdgpu]
[   11.169371]  local_pci_probe+0x74/0xc0
[   11.173115]  pci_device_probe+0x1c9/0x2d0
[   11.177115]  ? pci_device_remove+0x180/0x180
[   11.181378]  ? sysfs_do_create_link_sd.isra.0+0x74/0xd0
[   11.186595]  really_probe+0x184/0x530
[   11.190263]  driver_probe_device+0x119/0x180
[   11.194526]  device_driver_attach+0x87/0x90
[   11.198701]  ? device_driver_attach+0x90/0x90
[   11.203049]  __driver_attach+0xb0/0x1a0
[   11.206877]  ? device_driver_attach+0x90/0x90
[   11.211226]  bus_for_each_dev+0xdd/0x120
[   11.215141]  ? subsys_dev_iter_exit+0x10/0x10
[   11.219493]  bus_add_driver+0x22c/0x2e0
[   11.223321]  driver_register+0xd8/0x160
[   11.227148]  ? 0xffffffffc0d8f000
[   11.230456]  do_one_initcall+0xbd/0x3c0
[   11.234283]  ? trace_event_raw_event_initcall_finish+0x120/0x120
[   11.240275]  ? rcu_read_lock_sched_held+0x85/0x90
[   11.244970]  ? rcu_read_lock_bh_held+0xa0/0xa0
[   11.249404]  ? debug_lockdep_rcu_enabled.part.0+0x16/0x30
[   11.254792]  ? kmem_cache_alloc_trace+0x51e/0x6b0
[   11.259487]  ? kasan_unpoison_shadow+0x33/0x40
[   11.263924]  do_init_module+0xfd/0x390
[   11.267664]  load_module+0x255b/0x2910
[   11.271415]  ? layout_and_allocate+0x850/0x850
[   11.275849]  ? ima_post_read_file+0x141/0x150
[   11.280197]  ? ima_read_file+0x10/0x10
[   11.283938]  ? kernel_read+0x9b/0xc0
[   11.287513]  ? __do_sys_finit_module+0x110/0x180
[   11.292122]  __do_sys_finit_module+0x110/0x180
[   11.296558]  ? __ia32_sys_init_module+0x40/0x40
[   11.301088]  ? lockdep_hardirqs_off+0xbe/0x100
[   11.305523]  ? mark_held_locks+0x23/0xa0
[   11.309438]  ? do_syscall_64+0x14/0x2f0
[   11.313267]  do_syscall_64+0x72/0x2f0
[   11.316921]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   11.321960] RIP: 0033:0x7fcdc4b60059
[   11.325528] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f7 5d 0c 00 f7 d8 64 89 01 48
[   11.344260] RSP: 002b:00007ffc3abc6008 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   11.351815] RAX: ffffffffffffffda RBX: 0000564c25e0fb30 RCX:
00007fcdc4b60059
[   11.358934] RDX: 0000000000000000 RSI: 00007fcdc47a989d RDI:
0000000000000010
[   11.366050] RBP: 0000000000020000 R08: 0000000000000000 R09:
0000564c25e0f380
[   11.373169] R10: 0000000000000010 R11: 0000000000000246 R12:
00007fcdc47a989d
[   11.380289] R13: 0000000000000000 R14: 0000564c25e42910 R15:
0000564c25e0fb30
[   11.387412] Modules linked in: sr_mod(E) crc32c_intel(E) cdrom(E)
serio_raw(E) amdgpu(E+) uas(E) usb_storage(E) amd_iommu_v2(E)
gpu_sched(E) ttm(E) wmi(E) video(E) sg(E) dm_multipath(E) dm_mod(E)
scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh)
[   11.408846] CR2: 0000000000000050
[   11.412167] ---[ end trace fc1f8e4f7508319c ]---
[   11.416798] RIP: 0010:drm_dp_aux_register+0xcc/0xf0
[   11.421673] Code: 41 5c c3 4c 89 e7 e8 53 b4 28 00 85 c0 74 eb 48 89
ef 89 44 24 04 e8 23 1d 02 00 8b 44 24 04 eb d9 48 8d 7b 50 e8 d4 98 8f
ff <48> 8b 73 50 48 85 f6 75 aa 48 89 df e8 c3 98 8f ff 48 8b 33 eb 9d
[   11.440432] RSP: 0018:ffffc90000a6f600 EFLAGS: 00010282
[   11.445668] RAX: ffff8886da438700 RBX: 0000000000000000 RCX:
dffffc0000000000
[   11.452812] RDX: 0000000000000007 RSI: 0000000000000004 RDI:
0000000000000297
[   11.459956] RBP: ffff8886c0ca8900 R08: ffffffffaf19ec71 R09:
fffffbfff6246b5d
[   11.467100] R10: fffffbfff6246b5c R11: ffffffffb1235ae3 R12:
ffff8886c0ca8908
[   11.474243] R13: ffff8886baa0d050 R14: ffff8886baa0d100 R15:
ffffffffc0bdb180
[   11.481391] FS:  00007fcdc3effdc0(0000) GS:ffff8886fc200000(0000)
knlGS:0000000000000000
[   11.489488] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.495244] CR2: 0000000000000050 CR3: 00000006da450006 CR4:
00000000001606e0


Best regards
Thomas


>=20
> Alex Deucher (15):
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
>   drm/amdgpu/display: split dp connector registration
>   drm/amdgpu/ring: move debugfs init into core amdgpu debugfs
>   drm/amdgpu: drop legacy drm load and unload callbacks
>=20
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 11 ++-
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
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |  8 +--
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  1 -
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++----
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  3 +
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 13 ++--
>  19 files changed, 131 insertions(+), 88 deletions(-)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Q7mX1OZNZXR5HAgdlVHl7wc0VpAcf6XEm--

--OkxvaPS9ECL923RQaH8DNIUdj6X2JmkqF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl466+kACgkQaA3BHVML
eiP9EwgAlI+hH1/16XgnjFiig1R4oSYU5vCaU1wXT+73TypxYyHeC1ItNw6XFHMu
OsygKphsIAjTmQ+q4IoBcS9HK9lx5vveXMeuJtClPHKNIFhi3hp5TGBMDavrx6UD
v6gHlOF8HiIC3lfLMSU6JgQx0beU7qWS8HvUjeIr9OCngTHNHmITCBDAgTQk3Re/
hYQw7oZ4Nmc8lAY2oirSgy0Mb8BYpWOXyul2nIt7dWGGyhG7ZH6NwPpMRG6JF++A
xP/OEkaSOnvEuqDiI0qTbBsxP8EqEZ6KliWT8FUxfiGUM9JzgQhbq0Hk1LSVcOFB
8NYQOCnblCtpM3vIxl6jg4253YcHpA==
=62+m
-----END PGP SIGNATURE-----

--OkxvaPS9ECL923RQaH8DNIUdj6X2JmkqF--

--===============2043179968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2043179968==--
