Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B0F324BC8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 09:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292266EC60;
	Thu, 25 Feb 2021 08:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5B96EC5E;
 Thu, 25 Feb 2021 08:11:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE7E5ACE5;
 Thu, 25 Feb 2021 08:11:18 +0000 (UTC)
Subject: Re: udldrmfb: causes WARN in i915 on X60 (x86-32)
To: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org, airlied@redhat.com,
 sean@poorly.run, dri-devel@lists.freedesktop.org
References: <20210224200912.GA27905@duo.ucw.cz>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de>
Date: Thu, 25 Feb 2021 09:11:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224200912.GA27905@duo.ucw.cz>
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
Content-Type: multipart/mixed; boundary="===============1246904063=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1246904063==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PdxeD5ut3tZI8Q9Hor7brMkIrWdARuWxB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PdxeD5ut3tZI8Q9Hor7brMkIrWdARuWxB
Content-Type: multipart/mixed; boundary="oBM3evNMO0ZXkWW1ASweRUGLFdVaInNUc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org, airlied@redhat.com,
 sean@poorly.run, dri-devel@lists.freedesktop.org
Message-ID: <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de>
Subject: Re: udldrmfb: causes WARN in i915 on X60 (x86-32)
References: <20210224200912.GA27905@duo.ucw.cz>
In-Reply-To: <20210224200912.GA27905@duo.ucw.cz>

--oBM3evNMO0ZXkWW1ASweRUGLFdVaInNUc
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.02.21 um 21:09 schrieb Pavel Machek:
> Hi!
>=20
> This is in -next, but I get same behaviour on 5.11; and no, udl does

Thanks for reporting. We are in the process of fixing the issue. The=20
latest patch is at [1].

Best regards
Thomas

[1]=20
https://lore.kernel.org/dri-devel/b44307cf-25f9-acd0-eb35-92e8716205de@su=
se.de/T/#m74795744a58836dcba055fdcd6a0697811b8c14b

> not work, but monitor is detected:
>=20
> pavel@amd:~/g/tui/crashled$ xrandr
> Screen 0: minimum 320 x 200, current 1024 x 768, maximum 4096 x 4096
> LVDS1 connected 1024x768+0+0 (normal left inverted right x axis y axis)=
 246mm x 185mm
>     1024x768      50.00*+  60.00    40.00
>     800x600       60.32    56.25
>     640x480       59.94
> VGA1 disconnected (normal left inverted right x axis y axis)
> DVI-1-0 connected 1024x768+0+0 304mm x 228mm
>     1024x768      60.00*+  75.03
>     800x600       75.00    60.32
>     640x480       75.00    59.94
>     720x400       70.08
>    1024x768 (0x45) 65.000MHz -HSync -VSync
>          h: width  1024 start 1048 end 1184 total 1344 skew    0 clock =
 48.36KHz
>          v: height  768 start  771 end  777 total  806           clock =
 60.00Hz
>    800x600 (0x47) 40.000MHz +HSync +VSync
>          h: width   800 start  840 end  968 total 1056 skew    0 clock =
 37.88KHz
>          v: height  600 start  601 end  605 total  628           clock =
 60.32Hz
>    640x480 (0x49) 25.175MHz -HSync -VSync
>          h: width   640 start  656 end  752 total  800 skew    0 clock =
 31.47KHz
>          v: height  480 start  490 end  492 total  525           clock =
 59.94Hz
> pavel@amd:~/g/tui/crashled$
>=20
>=20
> [13957.499755] wlan0: associated
> [13962.906368] udl 1-5:1.0: [drm] fb1: udldrmfb frame buffer device
> [13972.585101] ------------[ cut here ]------------
> [13972.585117] WARNING: CPU: 0 PID: 3159 at kernel/dma/mapping.c:192 dm=
a_map_sg_attrs+0x38/0x50
> [13972.585137] Modules linked in:
> [13972.585149] CPU: 0 PID: 3159 Comm: Xorg Not tainted 5.11.0-next-2021=
0223+ #176
> [13972.585158] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW (2.=
19 ) 03/31/2011
> [13972.585166] EIP: dma_map_sg_attrs+0x38/0x50
> [13972.585176] Code: f0 01 00 00 00 74 23 ff 75 0c 53 e8 72 1b 00 00 5a=
 59 85 c0 78 1c 8b 5d fc c9 c3 8d b4 26 00 00 00 00 0f 0b 8d b6 00 00 00 =
00 <0f> 0b 31 c0 eb e6 66 90 0f 0b 8d b4 26 00 00 00 00 8d b4 26 00 00
> [13972.585186] EAX: c296c41c EBX: 00000000 ECX: 00000055 EDX: dbbc4800
> [13972.585194] ESI: c69f9ea0 EDI: d2c313c0 EBP: c5cbdda8 ESP: c5cbdda4
> [13972.585202] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 002=
10246
> [13972.585211] CR0: 80050033 CR2: b6b99000 CR3: 05d42000 CR4: 000006b0
> [13972.585219] Call Trace:
> [13972.585227]  i915_gem_map_dma_buf+0xee/0x160
> [13972.585240]  dma_buf_map_attachment+0xb8/0x140
> [13972.585251]  drm_gem_prime_import_dev.part.0+0x33/0xc0
> [13972.585262]  ? drm_gem_shmem_create+0x10/0x10
> [13972.585271]  drm_gem_prime_import_dev+0x22/0x70
> [13972.585280]  drm_gem_prime_fd_to_handle+0x186/0x1c0
> [13972.585289]  ? drm_gem_prime_import_dev+0x70/0x70
> [13972.585298]  ? drm_prime_destroy_file_private+0x20/0x20
> [13972.585307]  drm_prime_fd_to_handle_ioctl+0x1c/0x30
> [13972.585315]  drm_ioctl_kernel+0x8e/0xe0
> [13972.585325]  ? drm_prime_destroy_file_private+0x20/0x20
> [13972.585334]  drm_ioctl+0x1fd/0x380
> [13972.585343]  ? drm_prime_destroy_file_private+0x20/0x20
> [13972.585352]  ? ksys_write+0x5c/0xd0
> [13972.585363]  ? vfs_write+0xeb/0x3f0
> [13972.585371]  ? drm_ioctl_kernel+0xe0/0xe0
> [13972.585380]  __ia32_sys_ioctl+0x369/0x7d0
> [13972.585389]  ? exit_to_user_mode_prepare+0x4e/0x170
> [13972.585398]  do_int80_syscall_32+0x2c/0x40
> [13972.585409]  entry_INT80_32+0x111/0x111
> [13972.585419] EIP: 0xb7f68092
> [13972.585427] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00=
 00 00 e9 80 ff ff ff ff a3 e8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd =
80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
> [13972.585436] EAX: ffffffda EBX: 00000030 ECX: c00c642e EDX: bfaeda30
> [13972.585444] ESI: 00915790 EDI: c00c642e EBP: 00000030 ESP: bfaed9e4
> [13972.585452] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 002=
00296
> [13972.585461]  ? asm_exc_nmi+0xcc/0x2bc
> [13972.585470] ---[ end trace 46a21fad0595bc89 ]---
> pavel@amd:~/g/tui/crashled$
>=20
> Any ideas?
>=20
> Best regards,
>=20
> 									Pavel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--oBM3evNMO0ZXkWW1ASweRUGLFdVaInNUc--

--PdxeD5ut3tZI8Q9Hor7brMkIrWdARuWxB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA3W6UFAwAAAAAACgkQlh/E3EQov+AK
vhAAsmxWCfuZrGPxADD7lijvUQDV5iEGwfkBEUSZ8PfSVznzkzsvksmKnX0j+2REGegXLtzTr226
VtSrRfAmitJLWTvJIUHxogJdSXMafMi93SUF3U/skxSdvGt6rgPd0jGTiBjO6ytUsH8svkQD7+Jp
YMRZ2NUFbCbY2Om96pM8vU6quvja5CvOXcARySoOizfRDUIzioaFUmq53YZnHOHuLOHAJh3rfotv
RYCGPLDRcYgys5vBoXWvD8aAeAyTIHcc2mekdnmuDg0DJ7S84o4sqTaCH8W+ciu0uH9fngJ6oz1v
FNPSWq3EbKIbvhzLJGlMkA/YzsqHTQuCjudW6T8D7nfCLwhg5CyImfpvK2b2/Bbaxz8/xZpDPJuT
Mc8AL5+ZSoPw9DKuMDAUUySff9LYdmNjYKkEq2ZWYhwzf0uea2w/8Q7EPy7Jfp6DvJMsXEQF+vVn
t/+y29r1H0Q0S0NDcKbVGylBwSV6FFXxPft0b+SF2xvut32i4D/C+S9EexI9tnhy74V8SjhmnaS/
7G62Uz8Rbh33n75qjwnllYfwB9zuxSBloKhfShVvO31vlgN4I9nKCnYy9hJu7i3xPs1AwvmjWUMS
YxXFAvInWEOggm4hVmiiyqB7vyOb7dciOv6sbJsian1v5e4FaKjwiRCgTjKlDUj0DRFQm7lB2H+x
zfw=
=mk4m
-----END PGP SIGNATURE-----

--PdxeD5ut3tZI8Q9Hor7brMkIrWdARuWxB--

--===============1246904063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1246904063==--
