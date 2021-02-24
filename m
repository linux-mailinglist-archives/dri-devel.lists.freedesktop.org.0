Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D433244EE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 21:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471586E07F;
	Wed, 24 Feb 2021 20:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6D16E07F;
 Wed, 24 Feb 2021 20:09:17 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 0AAE61C0B80; Wed, 24 Feb 2021 21:09:13 +0100 (CET)
Date: Wed, 24 Feb 2021 21:09:12 +0100
From: Pavel Machek <pavel@ucw.cz>
To: kernel list <linux-kernel@vger.kernel.org>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 intel-gfx@lists.freedesktop.org, airlied@redhat.com,
 sean@poorly.run, tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Subject: udldrmfb: causes WARN in i915 on X60 (x86-32)
Message-ID: <20210224200912.GA27905@duo.ucw.cz>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: multipart/mixed; boundary="===============0976347468=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0976347468==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

This is in -next, but I get same behaviour on 5.11; and no, udl does
not work, but monitor is detected:

pavel@amd:~/g/tui/crashled$ xrandr=20
Screen 0: minimum 320 x 200, current 1024 x 768, maximum 4096 x 4096
LVDS1 connected 1024x768+0+0 (normal left inverted right x axis y axis) 246=
mm x 185mm
   1024x768      50.00*+  60.00    40.00 =20
   800x600       60.32    56.25 =20
   640x480       59.94 =20
VGA1 disconnected (normal left inverted right x axis y axis)
DVI-1-0 connected 1024x768+0+0 304mm x 228mm
   1024x768      60.00*+  75.03 =20
   800x600       75.00    60.32 =20
   640x480       75.00    59.94 =20
   720x400       70.08 =20
  1024x768 (0x45) 65.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.3=
6KHz
        v: height  768 start  771 end  777 total  806           clock  60.0=
0Hz
  800x600 (0x47) 40.000MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.8=
8KHz
        v: height  600 start  601 end  605 total  628           clock  60.3=
2Hz
  640x480 (0x49) 25.175MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.4=
7KHz
        v: height  480 start  490 end  492 total  525           clock  59.9=
4Hz
pavel@amd:~/g/tui/crashled$=20


[13957.499755] wlan0: associated
[13962.906368] udl 1-5:1.0: [drm] fb1: udldrmfb frame buffer device
[13972.585101] ------------[ cut here ]------------
[13972.585117] WARNING: CPU: 0 PID: 3159 at kernel/dma/mapping.c:192 dma_ma=
p_sg_attrs+0x38/0x50
[13972.585137] Modules linked in:
[13972.585149] CPU: 0 PID: 3159 Comm: Xorg Not tainted 5.11.0-next-20210223=
+ #176
[13972.585158] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW (2.19 )=
 03/31/2011
[13972.585166] EIP: dma_map_sg_attrs+0x38/0x50
[13972.585176] Code: f0 01 00 00 00 74 23 ff 75 0c 53 e8 72 1b 00 00 5a 59 =
85 c0 78 1c 8b 5d fc c9 c3 8d b4 26 00 00 00 00 0f 0b 8d b6 00 00 00 00 <0f=
> 0b 31 c0 eb e6 66 90 0f 0b 8d b4 26 00 00 00 00 8d b4 26 00 00
[13972.585186] EAX: c296c41c EBX: 00000000 ECX: 00000055 EDX: dbbc4800
[13972.585194] ESI: c69f9ea0 EDI: d2c313c0 EBP: c5cbdda8 ESP: c5cbdda4
[13972.585202] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210246
[13972.585211] CR0: 80050033 CR2: b6b99000 CR3: 05d42000 CR4: 000006b0
[13972.585219] Call Trace:
[13972.585227]  i915_gem_map_dma_buf+0xee/0x160
[13972.585240]  dma_buf_map_attachment+0xb8/0x140
[13972.585251]  drm_gem_prime_import_dev.part.0+0x33/0xc0
[13972.585262]  ? drm_gem_shmem_create+0x10/0x10
[13972.585271]  drm_gem_prime_import_dev+0x22/0x70
[13972.585280]  drm_gem_prime_fd_to_handle+0x186/0x1c0
[13972.585289]  ? drm_gem_prime_import_dev+0x70/0x70
[13972.585298]  ? drm_prime_destroy_file_private+0x20/0x20
[13972.585307]  drm_prime_fd_to_handle_ioctl+0x1c/0x30
[13972.585315]  drm_ioctl_kernel+0x8e/0xe0
[13972.585325]  ? drm_prime_destroy_file_private+0x20/0x20
[13972.585334]  drm_ioctl+0x1fd/0x380
[13972.585343]  ? drm_prime_destroy_file_private+0x20/0x20
[13972.585352]  ? ksys_write+0x5c/0xd0
[13972.585363]  ? vfs_write+0xeb/0x3f0
[13972.585371]  ? drm_ioctl_kernel+0xe0/0xe0
[13972.585380]  __ia32_sys_ioctl+0x369/0x7d0
[13972.585389]  ? exit_to_user_mode_prepare+0x4e/0x170
[13972.585398]  do_int80_syscall_32+0x2c/0x40
[13972.585409]  entry_INT80_32+0x111/0x111
[13972.585419] EIP: 0xb7f68092
[13972.585427] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 =
00 e9 80 ff ff ff ff a3 e8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3=
> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
[13972.585436] EAX: ffffffda EBX: 00000030 ECX: c00c642e EDX: bfaeda30
[13972.585444] ESI: 00915790 EDI: c00c642e EBP: 00000030 ESP: bfaed9e4
[13972.585452] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200296
[13972.585461]  ? asm_exc_nmi+0xcc/0x2bc
[13972.585470] ---[ end trace 46a21fad0595bc89 ]---
pavel@amd:~/g/tui/crashled$=20

Any ideas?

Best regards,

									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYDayaAAKCRAw5/Bqldv6
8iSEAKDBkf7JQqx5xJs5omtox+yEPx8jAwCeIQwmTgx3Sra8FoAllIGkX2a4kB0=
=1+My
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--

--===============0976347468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0976347468==--
