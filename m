Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086DA3C732
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 11:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E5D89083;
	Tue, 11 Jun 2019 09:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC2589083
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:27:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 36D19B008;
 Tue, 11 Jun 2019 09:27:14 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: drm-tip: Possible deadlock in DRM FB helpers
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
To: dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <498800f6-5e1b-58ed-a995-42314687dbf9@suse.de>
Date: Tue, 11 Jun 2019 11:27:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
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
Content-Type: multipart/mixed; boundary="===============1771664998=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1771664998==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pPZ319LiXH99mgBnmC0k0sD7uCLSEgUjZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pPZ319LiXH99mgBnmC0k0sD7uCLSEgUjZ
Content-Type: multipart/mixed; boundary="fb5exwa0TC6Nyags9985nk6IO9iBzqTrS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <498800f6-5e1b-58ed-a995-42314687dbf9@suse.de>
Subject: drm-tip: Possible deadlock in DRM FB helpers

--fb5exwa0TC6Nyags9985nk6IO9iBzqTrS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

since a few days, I get a deadlock warning about the DRM FB helpers in
drm-tip. I was able to trace the problem back to

  d81294afe drm/fb-helper: Remove drm_fb_helper_crtc

It moves around some lock operations, which breaks non-atomic drivers
(radeon, mgag200, ast). An lspci and dmesg snippet from my test system
is included below.

Best regards
Thomas


 * lspci -v

01:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] Oland [Radeon HD 8570 / R7 240/340 OEM] (prog-if 00 [VGA
controller])
        Subsystem: Dell Radeon R5 240 OEM
        Flags: bus master, fast devsel, latency 0, IRQ 32
        Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at f7c00000 (64-bit, non-prefetchable) [size=3D256K]
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
        Kernel driver in use: radeon
        Kernel modules: radeon, amdgpu

 * dmesg


[    4.959319] fbcon: radeondrmfb (fb0) is primary device
[    4.993952] Console: switching to colour frame buffer device 240x67
[    4.994040]
[    4.994041] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    4.994041] WARNING: possible circular locking dependency detected
[    4.994042] 5.2.0-rc4-1-default+ #39 Tainted: G            E
[    4.994043] ------------------------------------------------------
[    4.994043] systemd-udevd/369 is trying to acquire lock:
[    4.994044] 00000000fb622acb (&client->modeset_mutex){+.+.}, at:
drm_fb_helper_pan_display+0x103/0x1f0 [drm_kms_helper]
[    4.994055]
[    4.994055] but task is already holding lock:
[    4.994055] 0000000028767ae4 (crtc_ww_class_mutex){+.+.}, at:
drm_modeset_lock+0x42/0xf0 [drm]
[    4.994072]
[    4.994072] which lock already depends on the new lock.
[    4.994072]
[    4.994072]
[    4.994072] the existing dependency chain (in reverse order) is:
[    4.994073]
[    4.994073] -> #3 (crtc_ww_class_mutex){+.+.}:
[    4.994076]        lock_acquire+0x9e/0x170
[    4.994079]        __ww_mutex_lock.constprop.18+0x97/0xf40
[    4.994080]        ww_mutex_lock+0x30/0x90
[    4.994091]        drm_modeset_lock+0x42/0xf0 [drm]
[    4.994102]        drm_modeset_lock_all_ctx+0x1f/0xe0 [drm]
[    4.994113]        drm_modeset_lock_all+0x5e/0x1a0 [drm]
[    4.994163]        intel_modeset_init+0x60b/0xda0 [i915]
[    4.994196]        i915_driver_load+0xd17/0x1730 [i915]
[    4.994228]        i915_pci_probe+0x44/0x130 [i915]
[    4.994231]        local_pci_probe+0x42/0x80
[    4.994232]        pci_device_probe+0xf1/0x170
[    4.994234]        really_probe+0xef/0x390
[    4.994235]        driver_probe_device+0xb4/0x100
[    4.994237]        device_driver_attach+0x4f/0x60
[    4.994238]        __driver_attach+0x88/0x140
[    4.994239]        bus_for_each_dev+0x66/0x90
[    4.994240]        bus_add_driver+0x134/0x1e0
[    4.994241]        driver_register+0x6b/0xb0
[    4.994244]        do_one_initcall+0x5d/0x2b4
[    4.994246]        do_init_module+0x5a/0x220
[    4.994248]        load_module+0x17d4/0x1a90
[    4.994249]        __do_sys_finit_module+0x8f/0xd0
[    4.994251]        do_syscall_64+0x60/0x1c0
[    4.994252]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
[    4.994253]
[    4.994253] -> #2 (crtc_ww_class_acquire){+.+.}:
[    4.994255]        lock_acquire+0x9e/0x170
[    4.994270]        drm_modeset_acquire_init+0xcc/0x100 [drm]
[    4.994280]        drm_modeset_lock_all+0x44/0x1a0 [drm]
[    4.994320]        intel_modeset_init+0x60b/0xda0 [i915]
[    4.994352]        i915_driver_load+0xd17/0x1730 [i915]
[    4.994385]        i915_pci_probe+0x44/0x130 [i915]
[    4.994387]        local_pci_probe+0x42/0x80
[    4.994387]        pci_device_probe+0xf1/0x170
[    4.994389]        really_probe+0xef/0x390
[    4.994390]        driver_probe_device+0xb4/0x100
[    4.994391]        device_driver_attach+0x4f/0x60
[    4.994392]        __driver_attach+0x88/0x140
[    4.994393]        bus_for_each_dev+0x66/0x90
[    4.994394]        bus_add_driver+0x134/0x1e0
[    4.994395]        driver_register+0x6b/0xb0
[    4.994396]        do_one_initcall+0x5d/0x2b4
[    4.994398]        do_init_module+0x5a/0x220
[    4.994399]        load_module+0x17d4/0x1a90
[    4.994400]        __do_sys_finit_module+0x8f/0xd0
[    4.994402]        do_syscall_64+0x60/0x1c0
[    4.994403]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
[    4.994403]
[    4.994403] -> #1 (&dev->mode_config.mutex){+.+.}:
[    4.994405]        lock_acquire+0x9e/0x170
[    4.994408]        __mutex_lock+0x62/0x8c0
[    4.994413]        drm_setup_crtcs+0x17c/0xc50 [drm_kms_helper]
[    4.994418]
__drm_fb_helper_initial_config_and_unlock+0x34/0x530 [drm_kms_helper]
[    4.994450]        radeon_fbdev_init+0x110/0x130 [radeon]
[    4.994477]        radeon_modeset_init.cold.12+0x198/0x4ec [radeon]
[    4.994500]        radeon_driver_load_kms+0xc1/0x250 [radeon]
[    4.994508]        drm_dev_register+0x10f/0x150 [drm]
[    4.994517]        drm_get_pci_dev+0x95/0x190 [drm]
[    4.994519]        local_pci_probe+0x42/0x80
[    4.994520]        pci_device_probe+0xf1/0x170
[    4.994521]        really_probe+0xef/0x390
[    4.994522]        driver_probe_device+0xb4/0x100
[    4.994523]        device_driver_attach+0x4f/0x60
[    4.994524]        __driver_attach+0x88/0x140
[    4.994525]        bus_for_each_dev+0x66/0x90
[    4.994526]        bus_add_driver+0x134/0x1e0
[    4.994527]        driver_register+0x6b/0xb0
[    4.994528]        do_one_initcall+0x5d/0x2b4
[    4.994530]        do_init_module+0x5a/0x220
[    4.994531]        load_module+0x17d4/0x1a90
[    4.994532]        __do_sys_finit_module+0x8f/0xd0
[    4.994533]        do_syscall_64+0x60/0x1c0
[    4.994535]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
[    4.994535]
[    4.994535] -> #0 (&client->modeset_mutex){+.+.}:
[    4.994537]        __lock_acquire+0xa85/0xe90
[    4.994538]        lock_acquire+0x9e/0x170
[    4.994540]        __mutex_lock+0x62/0x8c0
[    4.994545]        drm_fb_helper_pan_display+0x103/0x1f0 [drm_kms_help=
er]
[    4.994547]        fb_pan_display+0x92/0x120
[    4.994549]        bit_update_start+0x1a/0x40
[    4.994550]        fbcon_switch+0x392/0x580
[    4.994552]        redraw_screen+0x12c/0x220
[    4.994553]        do_bind_con_driver.cold.30+0xe1/0x10d
[    4.994554]        do_take_over_console+0x113/0x190
[    4.994555]        do_fbcon_takeover+0x58/0xb0
[    4.994557]        notifier_call_chain+0x47/0x70
[    4.994558]        blocking_notifier_call_chain+0x44/0x60
[    4.994559]        register_framebuffer+0x231/0x310
[    4.994564]
__drm_fb_helper_initial_config_and_unlock+0x2fd/0x530 [drm_kms_helper]
[    4.994590]        radeon_fbdev_init+0x110/0x130 [radeon]
[    4.994615]        radeon_modeset_init.cold.12+0x198/0x4ec [radeon]
[    4.994638]        radeon_driver_load_kms+0xc1/0x250 [radeon]
[    4.994647]        drm_dev_register+0x10f/0x150 [drm]
[    4.994655]        drm_get_pci_dev+0x95/0x190 [drm]
[    4.994657]        local_pci_probe+0x42/0x80
[    4.994658]        pci_device_probe+0xf1/0x170
[    4.994659]        really_probe+0xef/0x390
[    4.994660]        driver_probe_device+0xb4/0x100
[    4.994661]        device_driver_attach+0x4f/0x60
[    4.994662]        __driver_attach+0x88/0x140
[    4.994663]        bus_for_each_dev+0x66/0x90
[    4.994664]        bus_add_driver+0x134/0x1e0
[    4.994665]        driver_register+0x6b/0xb0
[    4.994666]        do_one_initcall+0x5d/0x2b4
[    4.994668]        do_init_module+0x5a/0x220
[    4.994669]        load_module+0x17d4/0x1a90
[    4.994670]        __do_sys_finit_module+0x8f/0xd0
[    4.994671]        do_syscall_64+0x60/0x1c0
[    4.994673]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
[    4.994673]
[    4.994673] other info that might help us debug this:
[    4.994673]
[    4.994673] Chain exists of:
[    4.994673]   &client->modeset_mutex --> crtc_ww_class_acquire -->
crtc_ww_class_mutex
[    4.994673]
[    4.994675]  Possible unsafe locking scenario:
[    4.994675]
[    4.994675]        CPU0                    CPU1
[    4.994676]        ----                    ----
[    4.994676]   lock(crtc_ww_class_mutex);
[    4.994677]                                lock(crtc_ww_class_acquire)=
;
[    4.994677]                                lock(crtc_ww_class_mutex);
[    4.994678]   lock(&client->modeset_mutex);
[    4.994679]
[    4.994679]  *** DEADLOCK ***
[    4.994679]
[    4.994679] 11 locks held by systemd-udevd/369:
[    4.994680]  #0: 000000002a864971 (&dev->mutex){....}, at:
device_driver_attach+0x1d/0x60
[    4.994682]  #1: 0000000079b4fff6 (drm_global_mutex){+.+.}, at:
drm_dev_register+0x27/0x150 [drm]
[    4.994691]  #2: 00000000ae4b249f (registration_lock){+.+.}, at:
register_framebuffer+0x29/0x310
[    4.994694]  #3: 00000000baa4b33b (console_lock){+.+.}, at:
register_framebuffer+0x2ad/0x310
[    4.994696]  #4: 0000000052aa04e9 (&fb_info->lock){+.+.}, at:
lock_fb_info+0x18/0x40
[    4.994698]  #5: 00000000ee198c3a ((fb_notifier_list).rwsem){++++},
at: blocking_notifier_call_chain+0x2a/0x60
[    4.994701]  #6: 00000000283d5679 (&helper->lock){+.+.}, at:
drm_fb_helper_pan_display+0x48/0x1f0 [drm_kms_helper]
[    4.994707]  #7: 000000007cd70e4c (&dev->master_mutex){+.+.}, at:
drm_master_internal_acquire+0x1b/0x40 [drm]
[    4.994715]  #8: 0000000069bce718 (&dev->mode_config.mutex){+.+.},
at: drm_modeset_lock_all+0x3a/0x1a0 [drm]
[    4.994726]  #9: 00000000aa42b785 (crtc_ww_class_acquire){+.+.}, at:
drm_modeset_lock_all+0x44/0x1a0 [drm]
[    4.994738]  #10: 0000000028767ae4 (crtc_ww_class_mutex){+.+.}, at:
drm_modeset_lock+0x42/0xf0 [drm]
[    4.994750]
[    4.994750] stack backtrace:
[    4.994752] CPU: 7 PID: 369 Comm: systemd-udevd Tainted: G
 E     5.2.0-rc4-1-default+ #39
[    4.994752] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24
10/24/2018
[    4.994753] Call Trace:
[    4.994756]  dump_stack+0x85/0xc0
[    4.994758]  print_circular_bug.cold.62+0x15c/0x195
[    4.994760]  check_prevs_add+0x7ff/0xf40
[    4.994763]  ? find_held_lock+0x34/0xa0
[    4.994774]  ? drm_modeset_lock+0x42/0xf0 [drm]
[    4.994775]  __lock_acquire+0xa85/0xe90
[    4.994777]  lock_acquire+0x9e/0x170
[    4.994782]  ? drm_fb_helper_pan_display+0x103/0x1f0 [drm_kms_helper]
[    4.994788]  ? drm_fb_helper_pan_display+0x103/0x1f0 [drm_kms_helper]
[    4.994790]  __mutex_lock+0x62/0x8c0
[    4.994795]  ? drm_fb_helper_pan_display+0x103/0x1f0 [drm_kms_helper]
[    4.994796]  ? ww_mutex_lock+0x30/0x90
[    4.994798]  ? _cond_resched+0x15/0x30
[    4.994799]  ? ww_mutex_lock+0x30/0x90
[    4.994810]  ? drm_modeset_lock+0x42/0xf0 [drm]
[    4.994816]  ? drm_fb_helper_pan_display+0x103/0x1f0 [drm_kms_helper]
[    4.994821]  drm_fb_helper_pan_display+0x103/0x1f0 [drm_kms_helper]
[    4.994823]  fb_pan_display+0x92/0x120
[    4.994825]  bit_update_start+0x1a/0x40
[    4.994826]  fbcon_switch+0x392/0x580
[    4.994829]  redraw_screen+0x12c/0x220
[    4.994831]  do_bind_con_driver.cold.30+0xe1/0x10d
[    4.994833]  do_take_over_console+0x113/0x190
[    4.994835]  do_fbcon_takeover+0x58/0xb0
[    4.994836]  notifier_call_chain+0x47/0x70
[    4.994838]  blocking_notifier_call_chain+0x44/0x60
[    4.994839]  ? lock_fb_info+0x18/0x40
[    4.994841]  register_framebuffer+0x231/0x310
[    4.994847]  __drm_fb_helper_initial_config_and_unlock+0x2fd/0x530
[drm_kms_helper]
[    4.994873]  radeon_fbdev_init+0x110/0x130 [radeon]
[    4.994899]  radeon_modeset_init.cold.12+0x198/0x4ec [radeon]
[    4.994923]  radeon_driver_load_kms+0xc1/0x250 [radeon]
[    4.994932]  drm_dev_register+0x10f/0x150 [drm]
[    4.994942]  drm_get_pci_dev+0x95/0x190 [drm]
[    4.994944]  local_pci_probe+0x42/0x80
[    4.994946]  pci_device_probe+0xf1/0x170
[    4.994948]  really_probe+0xef/0x390
[    4.994949]  driver_probe_device+0xb4/0x100
[    4.994951]  device_driver_attach+0x4f/0x60
[    4.994952]  __driver_attach+0x88/0x140
[    4.994953]  ? device_driver_attach+0x60/0x60
[    4.994954]  bus_for_each_dev+0x66/0x90
[    4.994956]  bus_add_driver+0x134/0x1e0
[    4.994957]  ? 0xffffffffc0870000
[    4.994959]  driver_register+0x6b/0xb0
[    4.994960]  ? 0xffffffffc0870000
[    4.994961]  do_one_initcall+0x5d/0x2b4
[    4.994964]  do_init_module+0x5a/0x220
[    4.994966]  load_module+0x17d4/0x1a90
[    4.994970]  ? __do_sys_finit_module+0x8f/0xd0
[    4.994971]  __do_sys_finit_module+0x8f/0xd0
[    4.994974]  do_syscall_64+0x60/0x1c0
[    4.994976]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[    4.994977] RIP: 0033:0x7f10b1261449
[    4.994978] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1f 4a 0c 00 f7 d8 64 89 01 48
[    4.994979] RSP: 002b:00007ffd6e07fd78 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    4.994980] RAX: ffffffffffffffda RBX: 00005627690c73d0 RCX:
00007f10b1261449
[    4.994981] RDX: 0000000000000000 RSI: 00007f10b13c289d RDI:
000000000000000e
[    4.994982] RBP: 0000000000020000 R08: 0000000000000000 R09:
00005627690ce930
[    4.994982] R10: 000000000000000e R11: 0000000000000246 R12:
00007f10b13c289d
[    4.994983] R13: 0000000000000000 R14: 00005627690feba0 R15:
00005627690c73d0




--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--fb5exwa0TC6Nyags9985nk6IO9iBzqTrS--

--pPZ319LiXH99mgBnmC0k0sD7uCLSEgUjZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlz/c+0ACgkQaA3BHVML
eiOPJgf+J5e+DIRuIugz5m9SQoP27wqq6d/MuF3EjXL85HeKfS2CcTM7nEgJ2u48
zqSYRi+gB0bJW8yKkyN+X7aXgufT6YfKJ0ias8AiNlsAJNDWk15BLxLjTIWGyVDN
Jhd0c2VKjRe02VbO3b7lhu+ML6+NtCQzWSPv2XdZHaHvcfGWbEnIn0JeF/IvbiB0
KaXO+Jz/K5qAO0Tn0/h6e0AOS5/p4JyOt4jiSkwyucaJ5ah764zHtqs0991kw7bx
Yt8OP4y6JLTg535uRc6NMR/jo7gBAyIIP69cjxW4gkOVXptDu/6d39cs4c/lHPwh
vIOEFyJ3zrH4WcHpZVPeGCoER+Xa7g==
=wCZD
-----END PGP SIGNATURE-----

--pPZ319LiXH99mgBnmC0k0sD7uCLSEgUjZ--

--===============1771664998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1771664998==--
