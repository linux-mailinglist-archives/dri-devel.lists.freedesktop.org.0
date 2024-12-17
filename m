Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AFD9F5AD1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F252E10E11C;
	Tue, 17 Dec 2024 23:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=heusel.eu header.i=christian@heusel.eu header.b="j+em2cLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 509 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2024 23:59:01 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F9910E084;
 Tue, 17 Dec 2024 23:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
 s=s1-ionos; t=1734479939; x=1735084739; i=christian@heusel.eu;
 bh=1XCFiCgzLVhNA6DW4D4vJsYGUJP4oCAMXWLpvHo9V2Q=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=j+em2cLrztwBonNikQCxIKYiJSFRMcsIyfg48bqjdSF3rjFCcSK9cTBRFO/bHBYw
 mmyHRY4YhPwE/e3O8SmPJZdbRDkjbdhSx5DE1PzcSXh4JOVyGYIR0ggTnjWfr3pSj
 gM3C+kv+CUd2UKQuseYVxTuNhkq2R8yBCu+ROTeOuHMEvKys9LyErt3RHkb3fF8IV
 MS7ptGR7HzLsXLA5TJJ8nZKxK27jqoKHx1s/g5urnhPeAX4UItuhlyF0Mk/N1d/ni
 0vVp9kCHO1TyipRVLpzkjgN9TW/qWCxiyo3d/y4I+mroSAQ1kLlz8Szo9eI+dQjeR
 muene4N7Z5XqNQGiRw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MXoxG-1t56ZS3Fgi-00Q3OO; Wed, 18
 Dec 2024 00:43:39 +0100
Date: Wed, 18 Dec 2024 00:43:30 +0100
From: Christian Heusel <christian@heusel.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
 linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
 akpm@linux-foundation.org, 
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, 
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, 
 sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6.12 000/172] 6.12.6-rc1 review
Message-ID: <6177fdae-91f3-4170-a6ee-41c46d5703a5@heusel.eu>
References: <20241217170546.209657098@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hx3kpyr4mtleg4zb"
Content-Disposition: inline
In-Reply-To: <20241217170546.209657098@linuxfoundation.org>
X-Provags-ID: V03:K1:h9y4SHqMrFRyK0WUs6mqUvN1Yaf47H7/Tp8ddoJGQzTDa57Qgf7
 srmsQ3C+YQnxYF1k93tntN+BWdEjYRyfEKKmtJcCJcCTJfKmRtJP3wKrGj5Ssx00aJ3Ti4A
 h39tKxrdUrQc5Ou7fbC2cGFpGIBrPOk+BkJXnKbZYyirh1h7+1KDiEW/5Zq4OmE0Pb9BPN2
 s01vwqxHUb5Sdk1oj2imQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DwuqBUaKrso=;VPBjBw3w0558KDUzF1efHYnUPej
 BRmbvZleTV0clt3mfotd7sUgQVc59NaCbcZZ7iyEYnuHP3DuolXNTOVe9T2kf+Epy4gvZe34p
 wveGANIxuWvqw6RwflqZmg2IqDgecajOQtoapbc1ULPtZ32wICDN0AV4xw1E83OAeu+xwzR9e
 pHM2auv2KyjyY7cUSk0zMXE0deNdmW8YJaaOW76UDnqv8KpIWyGIBfIq0p1y5c831vPwj/aUC
 JUkX075lnrmnQOZN+uiJ/GgXp4rqWrWSsrSd6dvI3552qNDfmPP5kQG5lEDEzgB8FA7aVshVI
 5F7T8dnByF4lniGce/01mu23iCRQ5IGe+/mxAAyCZg4zYVQK8RbEskP8JULDRVcEghyF3olY/
 uiCJvUKch0pXtVcXOyXXvbBCjihJLEjEN5eVI08uE/Dl8Meod7qD7ckC8eN5fP6v2575hHGKx
 BCTmGqKXq4Iq8cMvv8+PQDIASQsVa7cF9kjrgAdl0+qzr9ex4wbyV4IVS2qaXc5aPyr2TpEGX
 X1YIoPzKEadaKofH6Frlbg67GrL1nPXmLz2A/cDZKKXUUXLeYPczWyUA6QXAoB9UpXz+U4lEq
 UkmjWHrnw37qyGcQJmTN8cI6LnICIZioRk3pkCyx98jEbYlwojYrq1OtOK6P2YsjMC6O9KPyY
 vBjiKiNBAdjPvT3W3rYNIUN87EhJUboonp7DF+YRRidORkviyOAq+IRUSsbe/M+7hJjCsVDDH
 GAP1vD2oL6TSYvwZV/11jxyB/aTsEkJu+ny3REdqO+Ge6HRPWUCgcqtMJD1JmSc6QKhOKF6EY
 IBVnlSDgxyRInkDWMqKUfqYyYLDZ6f0ou8fN+cxvMmwgpaP0tDg8NcTorbRAVeWBRI76n6UHu
 KwVTDeBYrEotWao+9p1YqRHos3tRY7jOCVzoI0Jy8s3CTCl6UUSdIggtcLqzxBqtNqCcDfhj1
 UUKgUmfLixvuzIpr/Xk8cgQH4dP+LAT0Yj0XMeS+1qJHv/oaX5os/XWluk1AsiYbrJxSFnfv4
 ZeXm+NCT8kGA6lD/Kx624irxUrYvZh3jFDqlhmd
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


--hx3kpyr4mtleg4zb
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="kvpfw5bx3oxql3cy"
Content-Disposition: inline
Subject: Re: [PATCH 6.12 000/172] 6.12.6-rc1 review
MIME-Version: 1.0


--kvpfw5bx3oxql3cy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/12/17 06:05PM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.6 release.
> There are 172 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>=20
> Responses should be made by Thu, 19 Dec 2024 17:05:03 +0000.
> Anything received after that time might be too late.

Hey everyone,

when testing the 6.12.6-rc1 release candidate on my Steam Deck I have
found that the following issue came up (once). On my laptop everything
works fine and even though the issue below came up the device was ususal
like always.

I added the relevant Maintainers into CC so they can judge if it's
something serious or not. I have also added a full dmesg as an
attachment. If anybody has idea about possible reproducers I would be
interested in that aswell, as I only saw the issue once so far.

Cheers,
Chris

kernel: CPU: 4 UID: 0 PID: 436 Comm: kworker/u32:4 Not tainted 6.12.6-rc1-1=
home #1 c49ee701ad1a1a28c82c80281ff6159df069d19b
kernel: Hardware name: Valve Jupiter/Jupiter, BIOS F7A0131 01/30/2024
kernel: Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
kernel: RIP: 0010:check_flush_dependency+0xfc/0x120
kernel: Code: 8b 45 18 48 8d b2 c0 00 00 00 49 89 e8 48 8d 8b c0 00 00 00 4=
8 c7 c7 e0 a1 ae a8 c6 05 29 03 16 02 01 48 89 c2 e8 04 8e fd ff <0f> 0b e9=
 1f ff ff ff 80 3d 14 03 16 02 00 75 93 e9 4a ff ff ff 66
kernel: RSP: 0018:ffffa65802707c60 EFLAGS: 00010082
kernel: RAX: 0000000000000000 RBX: ffff958c80050800 RCX: 0000000000000027
kernel: RDX: ffff958fb00218c8 RSI: 0000000000000001 RDI: ffff958fb00218c0
kernel: RBP: ffffffffc0a2eb00 R08: 0000000000000000 R09: ffffa65802707ae0
kernel: R10: ffffffffa92b54e8 R11: 0000000000000003 R12: ffff958c899b3580
kernel: R13: ffff958c8cc71c00 R14: ffffa65802707c90 R15: 0000000000000001
kernel: FS:  0000000000000000(0000) GS:ffff958fb0000000(0000) knlGS:0000000=
000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 00007f764c0d5000 CR3: 00000001b6222000 CR4: 0000000000350ef0
kernel: Call Trace:
kernel:  <TASK>
kernel:  ? check_flush_dependency+0xfc/0x120
kernel:  ? __warn.cold+0x93/0xf6
kernel:  ? check_flush_dependency+0xfc/0x120
kernel:  ? report_bug+0xff/0x140
kernel:  ? handle_bug+0x58/0x90
kernel:  ? exc_invalid_op+0x17/0x70
kernel:  ? asm_exc_invalid_op+0x1a/0x20
kernel:  ? __pfx_amdgpu_device_delay_enable_gfx_off+0x10/0x10 [amdgpu 857ac=
a8165f9b9ab3793f37419bdc9a45d24aff0]
kernel:  ? check_flush_dependency+0xfc/0x120
kernel:  __flush_work+0x110/0x2c0
kernel:  cancel_delayed_work_sync+0x5e/0x80
kernel:  amdgpu_gfx_off_ctrl+0xad/0x140 [amdgpu 857aca8165f9b9ab3793f37419b=
dc9a45d24aff0]
kernel:  amdgpu_ring_alloc+0x43/0x60 [amdgpu 857aca8165f9b9ab3793f37419bdc9=
a45d24aff0]
kernel:  amdgpu_ib_schedule+0xf0/0x730 [amdgpu 857aca8165f9b9ab3793f37419bd=
c9a45d24aff0]
kernel:  amdgpu_job_run+0x8c/0x170 [amdgpu 857aca8165f9b9ab3793f37419bdc9a4=
5d24aff0]
kernel:  ? mod_delayed_work_on+0xa4/0xb0
kernel:  drm_sched_run_job_work+0x25c/0x3f0 [gpu_sched da7f9c92395781c75e4a=
c0d605a4cf839a336d2f]
kernel:  ? srso_return_thunk+0x5/0x5f
kernel:  process_one_work+0x17e/0x330
kernel:  worker_thread+0x2ce/0x3f0
kernel:  ? __pfx_worker_thread+0x10/0x10
kernel:  kthread+0xd2/0x100
kernel:  ? __pfx_kthread+0x10/0x10
kernel:  ret_from_fork+0x34/0x50
kernel:  ? __pfx_kthread+0x10/0x10
kernel:  ret_from_fork_asm+0x1a/0x30
kernel:  </TASK>
kernel: ---[ end trace 0000000000000000 ]---


--kvpfw5bx3oxql3cy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg-steamdeck.log"
Content-Transfer-Encoding: quoted-printable

Dec 17 21:11:57 archlinux-steamdeck kernel: Linux version 6.12.6-rc1-1home =
(linux@archlinux) (gcc (GCC) 14.2.1 20240910, GNU ld (GNU Binutils) 2.43.0)=
 #1 SMP PREEMPT_DYNAMIC Tue, 17 Dec 2024 19:08:03 +0000
Dec 17 21:11:57 archlinux-steamdeck kernel: Command line: BOOT_IMAGE=3D/vml=
inuz-linux root=3DUUID=3Db7c7e656-fdad-4a9c-bf62-5226971802ce rw loglevel=
=3D3 quiet
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-provided physical RAM map:
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x0000000000000=
000-0x000000000009efff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000000009f=
000-0x00000000000bffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x0000000000100=
000-0x0000000009afffff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x0000000009b00=
000-0x0000000009dfffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x0000000009e00=
000-0x0000000009efffff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x0000000009f00=
000-0x0000000009f20fff] ACPI NVS
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x0000000009f21=
000-0x000000006b367fff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000006b368=
000-0x000000006c567fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000006c568=
000-0x000000006c56efff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000006c56f=
000-0x000000006c56ffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000006c570=
000-0x000000007877efff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000007877f=
000-0x000000007af7efff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000007af7f=
000-0x000000007cf7efff] ACPI NVS
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000007cf7f=
000-0x000000007cffefff] ACPI data
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000007cfff=
000-0x000000007cffffff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000007d000=
000-0x000000007dffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000007f000=
000-0x000000007fffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x00000000a0000=
000-0x00000000a00fffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x00000000f8000=
000-0x00000000fbffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x00000000fec00=
000-0x00000000fec01fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x00000000fec10=
000-0x00000000fec10fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x00000000fec20=
000-0x00000000fec20fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x00000000fed80=
000-0x00000000fed81fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x00000000fedc0=
000-0x00000000feddffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x00000000fee00=
000-0x00000000fee00fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x00000000ff000=
000-0x00000000ffffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x0000000100000=
000-0x000000043f37ffff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: BIOS-e820: [mem 0x000000043f380=
000-0x000000047fffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: NX (Execute Disable) protection=
: active
Dec 17 21:11:57 archlinux-steamdeck kernel: APIC: Static calls initialized
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: update [mem 0x69c27018-0x=
69c32057] usable =3D=3D> usable
Dec 17 21:11:57 archlinux-steamdeck kernel: extended physical RAM map:
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
000000000000-0x000000000009efff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00000009f000-0x00000000000bffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
000000100000-0x0000000009afffff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
000009b00000-0x0000000009dfffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
000009e00000-0x0000000009efffff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
000009f00000-0x0000000009f20fff] ACPI NVS
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
000009f21000-0x0000000069c27017] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
000069c27018-0x0000000069c32057] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
000069c32058-0x000000006b367fff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00006b368000-0x000000006c567fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00006c568000-0x000000006c56efff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00006c56f000-0x000000006c56ffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00006c570000-0x000000007877efff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00007877f000-0x000000007af7efff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00007af7f000-0x000000007cf7efff] ACPI NVS
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00007cf7f000-0x000000007cffefff] ACPI data
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00007cfff000-0x000000007cffffff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00007d000000-0x000000007dffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00007f000000-0x000000007fffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
0000a0000000-0x00000000a00fffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
0000f8000000-0x00000000fbffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
0000fec00000-0x00000000fec01fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
0000fec10000-0x00000000fec10fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
0000fec20000-0x00000000fec20fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
0000fed80000-0x00000000fed81fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
0000fedc0000-0x00000000feddffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
0000fee00000-0x00000000fee00fff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
0000ff000000-0x00000000ffffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
000100000000-0x000000043f37ffff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: reserve setup_data: [mem 0x0000=
00043f380000-0x000000047fffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: efi: EFI v2.7 by Valve
Dec 17 21:11:57 archlinux-steamdeck kernel: efi: ACPI=3D0x7cffe000 ACPI 2.0=
=3D0x7cffe014 TPMFinalLog=3D0x7cf40000 SMBIOS=3D0x796fd000 SMBIOS 3.0=3D0x7=
96fb000 MEMATTR=3D0x7467b018 ESRT=3D0x74078d18 INITRD=3D0x6c578b18 RNG=3D0x=
7cfbb018 TPMEventLog=3D0x7cfba018=20
Dec 17 21:11:57 archlinux-steamdeck kernel: random: crng init done
Dec 17 21:11:57 archlinux-steamdeck kernel: efi: Remove mem95: MMIO range=
=3D[0xa0000000-0xa00fffff] (1MB) from e820 map
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: remove [mem 0xa0000000-0x=
a00fffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: efi: Remove mem96: MMIO range=
=3D[0xf8000000-0xfbffffff] (64MB) from e820 map
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: remove [mem 0xf8000000-0x=
fbffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: efi: Not removing mem97: MMIO r=
ange=3D[0xfec00000-0xfec01fff] (8KB) from e820 map
Dec 17 21:11:57 archlinux-steamdeck kernel: efi: Not removing mem98: MMIO r=
ange=3D[0xfec10000-0xfec10fff] (4KB) from e820 map
Dec 17 21:11:57 archlinux-steamdeck kernel: efi: Not removing mem99: MMIO r=
ange=3D[0xfec20000-0xfec20fff] (4KB) from e820 map
Dec 17 21:11:57 archlinux-steamdeck kernel: efi: Not removing mem100: MMIO =
range=3D[0xfed80000-0xfed81fff] (8KB) from e820 map
Dec 17 21:11:57 archlinux-steamdeck kernel: efi: Not removing mem101: MMIO =
range=3D[0xfedc0000-0xfeddffff] (128KB) from e820 map
Dec 17 21:11:57 archlinux-steamdeck kernel: efi: Not removing mem102: MMIO =
range=3D[0xfee00000-0xfee00fff] (4KB) from e820 map
Dec 17 21:11:57 archlinux-steamdeck kernel: efi: Remove mem103: MMIO range=
=3D[0xff000000-0xffffffff] (16MB) from e820 map
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: remove [mem 0xff000000-0x=
ffffffff] reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: SMBIOS 3.3.0 present.
Dec 17 21:11:57 archlinux-steamdeck kernel: DMI: Valve Jupiter/Jupiter, BIO=
S F7A0131 01/30/2024
Dec 17 21:11:57 archlinux-steamdeck kernel: DMI: Memory slots populated: 4/4
Dec 17 21:11:57 archlinux-steamdeck kernel: tsc: Fast TSC calibration using=
 PIT
Dec 17 21:11:57 archlinux-steamdeck kernel: tsc: Detected 2799.865 MHz proc=
essor
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: update [mem 0x00000000-0x=
00000fff] usable =3D=3D> reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: remove [mem 0x000a0000-0x=
000fffff] usable
Dec 17 21:11:57 archlinux-steamdeck kernel: last_pfn =3D 0x43f380 max_arch_=
pfn =3D 0x400000000
Dec 17 21:11:57 archlinux-steamdeck kernel: MTRR map: 7 entries (3 fixed + =
4 variable; max 20), built from 9 variable MTRRs
Dec 17 21:11:57 archlinux-steamdeck kernel: x86/PAT: Configuration [0-7]: W=
B  WC  UC- UC  WB  WP  UC- WT =20
Dec 17 21:11:57 archlinux-steamdeck kernel: last_pfn =3D 0x7d000 max_arch_p=
fn =3D 0x400000000
Dec 17 21:11:57 archlinux-steamdeck kernel: esrt: Reserving ESRT space from=
 0x0000000074078d18 to 0x0000000074078da0.
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: update [mem 0x74078000-0x=
74078fff] usable =3D=3D> reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: Using GB pages for direct mappi=
ng
Dec 17 21:11:57 archlinux-steamdeck kernel: Secure boot disabled
Dec 17 21:11:57 archlinux-steamdeck kernel: RAMDISK: [mem 0x6078c000-0x6337=
efff]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Early table checksum veri=
fication disabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: RSDP 0x000000007CFFE014 0=
00024 (v02 AMDYDE)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: XSDT 0x000000007CFCB188 0=
0010C (v01 AMDYDE EDK2     00000002      01000013)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: FACP 0x000000007CFEF000 0=
0010C (v05 AMDYDE EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: DSDT 0x000000007CFE0000 0=
0801B (v01 AMDYDE EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: FACS 0x000000007CEF7000 0=
00040
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: UEFI 0x000000007CF7E000 0=
00236 (v01 AMDYDE EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFF5000 0=
07237 (v02 AMD    EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFF4000 0=
0046D (v01 AMDyde EDK2     00001000 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: TPM2 0x000000007CFF3000 0=
0004C (v04 AMD    EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: ASF! 0x000000007CFF1000 0=
000A5 (v32 AMDYDE EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: BOOT 0x000000007CFF0000 0=
00028 (v01 AMDYDE EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: HPET 0x000000007CFEE000 0=
00038 (v01 AMDYDE EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: APIC 0x000000007CFED000 0=
00138 (v03 AMDYDE EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: MCFG 0x000000007CFEC000 0=
0003C (v01 AMDYDE EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SLIC 0x000000007CFEB000 0=
00176 (v01 AMDYDE EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: WDAT 0x000000007CFEA000 0=
0017C (v01 AMDYDE EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: WDRT 0x000000007CFE9000 0=
00047 (v01 AMD    EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFDF000 0=
00099 (v01 AMDyde EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFDE000 0=
0078E (v02 AMDRUS EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: VFCT 0x000000007CFD2000 0=
0B084 (v01 AMDYDE EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFD1000 0=
000F8 (v01 AMD    EDK2     00001000 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFCE000 0=
029BC (v02 AMD    EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: CRAT 0x000000007CFCD000 0=
007E8 (v01 AMD    EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: CDIT 0x000000007CFCC000 0=
00029 (v01 AMD    EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFFD000 0=
00503 (v01 AMD    EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFC9000 0=
01436 (v01 AMD    EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFC7000 0=
014AD (v01 AMD    EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFC1000 0=
051CF (v01 AMD    EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: FPDT 0x000000007CFC0000 0=
00044 (v01 AMD    EDK2     00000002 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: WSMT 0x000000007CFBE000 0=
00028 (v01 AMDYDE EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFBD000 0=
0008D (v01 AMD    EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: SSDT 0x000000007CFBC000 0=
00AE8 (v01 AMD    EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: BGRT 0x000000007CFBF000 0=
00038 (v01 AMDYDE EDK2     00000001 ACPI 00040000)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving FACP table memo=
ry at [mem 0x7cfef000-0x7cfef10b]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving DSDT table memo=
ry at [mem 0x7cfe0000-0x7cfe801a]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving FACS table memo=
ry at [mem 0x7cef7000-0x7cef703f]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving UEFI table memo=
ry at [mem 0x7cf7e000-0x7cf7e235]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cff5000-0x7cffc236]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cff4000-0x7cff446c]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving TPM2 table memo=
ry at [mem 0x7cff3000-0x7cff304b]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving ASF! table memo=
ry at [mem 0x7cff1000-0x7cff10a4]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving BOOT table memo=
ry at [mem 0x7cff0000-0x7cff0027]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving HPET table memo=
ry at [mem 0x7cfee000-0x7cfee037]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving APIC table memo=
ry at [mem 0x7cfed000-0x7cfed137]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving MCFG table memo=
ry at [mem 0x7cfec000-0x7cfec03b]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SLIC table memo=
ry at [mem 0x7cfeb000-0x7cfeb175]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving WDAT table memo=
ry at [mem 0x7cfea000-0x7cfea17b]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving WDRT table memo=
ry at [mem 0x7cfe9000-0x7cfe9046]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cfdf000-0x7cfdf098]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cfde000-0x7cfde78d]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving VFCT table memo=
ry at [mem 0x7cfd2000-0x7cfdd083]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cfd1000-0x7cfd10f7]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cfce000-0x7cfd09bb]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving CRAT table memo=
ry at [mem 0x7cfcd000-0x7cfcd7e7]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving CDIT table memo=
ry at [mem 0x7cfcc000-0x7cfcc028]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cffd000-0x7cffd502]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cfc9000-0x7cfca435]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cfc7000-0x7cfc84ac]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cfc1000-0x7cfc61ce]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving FPDT table memo=
ry at [mem 0x7cfc0000-0x7cfc0043]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving WSMT table memo=
ry at [mem 0x7cfbe000-0x7cfbe027]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cfbd000-0x7cfbd08c]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving SSDT table memo=
ry at [mem 0x7cfbc000-0x7cfbcae7]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Reserving BGRT table memo=
ry at [mem 0x7cfbf000-0x7cfbf037]
Dec 17 21:11:57 archlinux-steamdeck kernel: No NUMA configuration found
Dec 17 21:11:57 archlinux-steamdeck kernel: Faking a node at [mem 0x0000000=
000000000-0x000000043f37ffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: NODE_DATA(0) allocated [mem 0x4=
3f3552c0-0x43f37ffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: Zone ranges:
Dec 17 21:11:57 archlinux-steamdeck kernel:   DMA      [mem 0x0000000000001=
000-0x0000000000ffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel:   DMA32    [mem 0x0000000001000=
000-0x00000000ffffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel:   Normal   [mem 0x0000000100000=
000-0x000000043f37ffff]
Dec 17 21:11:57 archlinux-steamdeck kernel:   Device   empty
Dec 17 21:11:57 archlinux-steamdeck kernel: Movable zone start for each node
Dec 17 21:11:57 archlinux-steamdeck kernel: Early memory node ranges
Dec 17 21:11:57 archlinux-steamdeck kernel:   node   0: [mem 0x000000000000=
1000-0x000000000009efff]
Dec 17 21:11:57 archlinux-steamdeck kernel:   node   0: [mem 0x000000000010=
0000-0x0000000009afffff]
Dec 17 21:11:57 archlinux-steamdeck kernel:   node   0: [mem 0x0000000009e0=
0000-0x0000000009efffff]
Dec 17 21:11:57 archlinux-steamdeck kernel:   node   0: [mem 0x0000000009f2=
1000-0x000000006b367fff]
Dec 17 21:11:57 archlinux-steamdeck kernel:   node   0: [mem 0x000000006c56=
8000-0x000000006c56efff]
Dec 17 21:11:57 archlinux-steamdeck kernel:   node   0: [mem 0x000000006c57=
0000-0x000000007877efff]
Dec 17 21:11:57 archlinux-steamdeck kernel:   node   0: [mem 0x000000007cff=
f000-0x000000007cffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel:   node   0: [mem 0x000000010000=
0000-0x000000043f37ffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: Initmem setup node 0 [mem 0x000=
0000000001000-0x000000043f37ffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: On node 0, zone DMA: 1 pages in=
 unavailable ranges
Dec 17 21:11:57 archlinux-steamdeck kernel: On node 0, zone DMA: 97 pages i=
n unavailable ranges
Dec 17 21:11:57 archlinux-steamdeck kernel: On node 0, zone DMA32: 768 page=
s in unavailable ranges
Dec 17 21:11:57 archlinux-steamdeck kernel: On node 0, zone DMA32: 33 pages=
 in unavailable ranges
Dec 17 21:11:57 archlinux-steamdeck kernel: On node 0, zone DMA32: 4608 pag=
es in unavailable ranges
Dec 17 21:11:57 archlinux-steamdeck kernel: On node 0, zone DMA32: 1 pages =
in unavailable ranges
Dec 17 21:11:57 archlinux-steamdeck kernel: On node 0, zone DMA32: 18560 pa=
ges in unavailable ranges
Dec 17 21:11:57 archlinux-steamdeck kernel: On node 0, zone Normal: 12288 p=
ages in unavailable ranges
Dec 17 21:11:57 archlinux-steamdeck kernel: On node 0, zone Normal: 3200 pa=
ges in unavailable ranges
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PM-Timer IO Port: 0x408
Dec 17 21:11:57 archlinux-steamdeck kernel: CPU topo: Ignoring hot-pluggabl=
e APIC ID 0 in present package.
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x00] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x01] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x02] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x03] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x04] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x05] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x06] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x07] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x08] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x09] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x0a] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x0b] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x0c] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x0d] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x0e] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: LAPIC_NMI (acpi_id[0x0f] =
high edge lint[0x1])
Dec 17 21:11:57 archlinux-steamdeck kernel: IOAPIC[0]: apic_id 33, version =
33, address 0xfec00000, GSI 0-23
Dec 17 21:11:57 archlinux-steamdeck kernel: IOAPIC[1]: apic_id 34, version =
33, address 0xfec01000, GSI 24-55
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: INT_SRC_OVR (bus 0 bus_ir=
q 0 global_irq 2 dfl dfl)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: INT_SRC_OVR (bus 0 bus_ir=
q 9 global_irq 9 low level)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Using ACPI (MADT) for SMP=
 configuration information
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: HPET id: 0x10228210 base:=
 0xfed00000
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: update [mem 0x721e1000-0x=
72484fff] usable =3D=3D> reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: CPU topo: Max. logical packages=
:   1
Dec 17 21:11:57 archlinux-steamdeck kernel: CPU topo: Max. logical dies:   =
    1
Dec 17 21:11:57 archlinux-steamdeck kernel: CPU topo: Max. dies per package=
:   1
Dec 17 21:11:57 archlinux-steamdeck kernel: CPU topo: Max. threads per core=
:   2
Dec 17 21:11:57 archlinux-steamdeck kernel: CPU topo: Num. cores per packag=
e:     4
Dec 17 21:11:57 archlinux-steamdeck kernel: CPU topo: Num. threads per pack=
age:   8
Dec 17 21:11:57 archlinux-steamdeck kernel: CPU topo: Allowing 8 present CP=
Us plus 0 hotplug CPUs
Dec 17 21:11:57 archlinux-steamdeck kernel: CPU topo: Rejected CPUs 8
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x00000000-0x00000fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x0009f000-0x000bffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x000c0000-0x000fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x09b00000-0x09dfffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x09f00000-0x09f20fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x69c27000-0x69c27fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x69c32000-0x69c32fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x6b368000-0x6c567fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x6c56f000-0x6c56ffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x721e1000-0x72484fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x74078000-0x74078fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x7877f000-0x7af7efff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x7af7f000-0x7cf7efff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x7cf7f000-0x7cffefff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x7d000000-0x7dffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x7e000000-0x7effffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x7f000000-0x7fffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0x80000000-0xfebfffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfec00000-0xfec01fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfec02000-0xfec0ffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfec10000-0xfec10fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfec11000-0xfec1ffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfec20000-0xfec20fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfec21000-0xfed7ffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfed80000-0xfed81fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfed82000-0xfedbffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfedc0000-0xfeddffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfede0000-0xfedfffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfee00000-0xfee00fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: hibernation: Registered nos=
ave memory: [mem 0xfee01000-0xffffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: [mem 0x80000000-0xfebfffff] ava=
ilable for PCI devices
Dec 17 21:11:57 archlinux-steamdeck kernel: Booting paravirtualized kernel =
on bare hardware
Dec 17 21:11:57 archlinux-steamdeck kernel: clocksource: refined-jiffies: m=
ask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
Dec 17 21:11:57 archlinux-steamdeck kernel: setup_percpu: NR_CPUS:8192 nr_c=
pumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
Dec 17 21:11:57 archlinux-steamdeck kernel: percpu: Embedded 67 pages/cpu s=
237568 r8192 d28672 u524288
Dec 17 21:11:57 archlinux-steamdeck kernel: pcpu-alloc: s237568 r8192 d2867=
2 u524288 alloc=3D1*2097152
Dec 17 21:11:57 archlinux-steamdeck kernel: pcpu-alloc: [0] 0 1 2 3 [0] 4 5=
 6 7=20
Dec 17 21:11:57 archlinux-steamdeck kernel: Kernel command line: BOOT_IMAGE=
=3D/vmlinuz-linux root=3DUUID=3Db7c7e656-fdad-4a9c-bf62-5226971802ce rw log=
level=3D3 quiet
Dec 17 21:11:57 archlinux-steamdeck kernel: Unknown kernel command line par=
ameters "BOOT_IMAGE=3D/vmlinuz-linux", will be passed to user space.
Dec 17 21:11:57 archlinux-steamdeck kernel: Dentry cache hash table entries=
: 2097152 (order: 12, 16777216 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: Inode-cache hash table entries:=
 1048576 (order: 11, 8388608 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: Fallback order for Node 0: 0=20
Dec 17 21:11:57 archlinux-steamdeck kernel: Built 1 zonelists, mobility gro=
uping on.  Total pages: 3892604
Dec 17 21:11:57 archlinux-steamdeck kernel: Policy zone: Normal
Dec 17 21:11:57 archlinux-steamdeck kernel: mem auto-init: stack:all(zero),=
 heap alloc:on, heap free:off
Dec 17 21:11:57 archlinux-steamdeck kernel: software IO TLB: area num 8.
Dec 17 21:11:57 archlinux-steamdeck kernel: SLUB: HWalign=3D64, Order=3D0-3=
, MinObjects=3D0, CPUs=3D8, Nodes=3D1
Dec 17 21:11:57 archlinux-steamdeck kernel: ftrace: allocating 51143 entrie=
s in 200 pages
Dec 17 21:11:57 archlinux-steamdeck kernel: ftrace: allocated 200 pages wit=
h 3 groups
Dec 17 21:11:57 archlinux-steamdeck kernel: Dynamic Preempt: full
Dec 17 21:11:57 archlinux-steamdeck kernel: rcu: Preemptible hierarchical R=
CU implementation.
Dec 17 21:11:57 archlinux-steamdeck kernel: rcu:         RCU restricting CP=
Us from NR_CPUS=3D8192 to nr_cpu_ids=3D8.
Dec 17 21:11:57 archlinux-steamdeck kernel: rcu:         RCU priority boost=
ing: priority 1 delay 500 ms.
Dec 17 21:11:57 archlinux-steamdeck kernel:         Trampoline variant of T=
asks RCU enabled.
Dec 17 21:11:57 archlinux-steamdeck kernel:         Rude variant of Tasks R=
CU enabled.
Dec 17 21:11:57 archlinux-steamdeck kernel:         Tracing variant of Task=
s RCU enabled.
Dec 17 21:11:57 archlinux-steamdeck kernel: rcu: RCU calculated value of sc=
heduler-enlistment delay is 30 jiffies.
Dec 17 21:11:57 archlinux-steamdeck kernel: rcu: Adjusting geometry for rcu=
_fanout_leaf=3D16, nr_cpu_ids=3D8
Dec 17 21:11:57 archlinux-steamdeck kernel: RCU Tasks: Setting shift to 3 a=
nd lim to 1 rcu_task_cb_adjust=3D1 rcu_task_cpu_ids=3D8.
Dec 17 21:11:57 archlinux-steamdeck kernel: RCU Tasks Rude: Setting shift t=
o 3 and lim to 1 rcu_task_cb_adjust=3D1 rcu_task_cpu_ids=3D8.
Dec 17 21:11:57 archlinux-steamdeck kernel: RCU Tasks Trace: Setting shift =
to 3 and lim to 1 rcu_task_cb_adjust=3D1 rcu_task_cpu_ids=3D8.
Dec 17 21:11:57 archlinux-steamdeck kernel: NR_IRQS: 524544, nr_irqs: 1032,=
 preallocated irqs: 16
Dec 17 21:11:57 archlinux-steamdeck kernel: rcu: srcu_init: Setting srcu_st=
ruct sizes based on contention.
Dec 17 21:11:57 archlinux-steamdeck kernel: kfence: initialized - using 209=
7152 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
Dec 17 21:11:57 archlinux-steamdeck kernel: Console: colour dummy device 80=
x25
Dec 17 21:11:57 archlinux-steamdeck kernel: printk: legacy console [tty0] e=
nabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Core revision 20240827
Dec 17 21:11:57 archlinux-steamdeck kernel: clocksource: hpet: mask: 0xffff=
ffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
Dec 17 21:11:57 archlinux-steamdeck kernel: APIC: Switch to symmetric I/O m=
ode setup
Dec 17 21:11:57 archlinux-steamdeck kernel: ..TIMER: vector=3D0x30 apic1=3D=
0 pin1=3D2 apic2=3D-1 pin2=3D-1
Dec 17 21:11:57 archlinux-steamdeck kernel: clocksource: tsc-early: mask: 0=
xffffffffffffffff max_cycles: 0x285bc13aba8, max_idle_ns: 440795309353 ns
Dec 17 21:11:57 archlinux-steamdeck kernel: Calibrating delay loop (skipped=
), value calculated using timer frequency.. 5601.05 BogoMIPS (lpj=3D9332883)
Dec 17 21:11:57 archlinux-steamdeck kernel: Zenbleed: please update your mi=
crocode for the most optimal fix
Dec 17 21:11:57 archlinux-steamdeck kernel: x86/cpu: User Mode Instruction =
Prevention (UMIP) activated
Dec 17 21:11:57 archlinux-steamdeck kernel: LVT offset 1 assigned for vecto=
r 0xf9
Dec 17 21:11:57 archlinux-steamdeck kernel: LVT offset 2 assigned for vecto=
r 0xf4
Dec 17 21:11:57 archlinux-steamdeck kernel: Last level iTLB entries: 4KB 10=
24, 2MB 1024, 4MB 512
Dec 17 21:11:57 archlinux-steamdeck kernel: Last level dTLB entries: 4KB 20=
48, 2MB 2048, 4MB 1024, 1GB 0
Dec 17 21:11:57 archlinux-steamdeck kernel: process: using mwait in idle th=
reads
Dec 17 21:11:57 archlinux-steamdeck kernel: Spectre V1 : Mitigation: userco=
py/swapgs barriers and __user pointer sanitization
Dec 17 21:11:57 archlinux-steamdeck kernel: Spectre V2 : Mitigation: Retpol=
ines
Dec 17 21:11:57 archlinux-steamdeck kernel: Spectre V2 : Spectre v2 / Spect=
reRSB mitigation: Filling RSB on context switch
Dec 17 21:11:57 archlinux-steamdeck kernel: Spectre V2 : Spectre v2 / Spect=
reRSB : Filling RSB on VMEXIT
Dec 17 21:11:57 archlinux-steamdeck kernel: Spectre V2 : Enabling Speculati=
on Barrier for firmware calls
Dec 17 21:11:57 archlinux-steamdeck kernel: RETBleed: Mitigation: untrained=
 return thunk
Dec 17 21:11:57 archlinux-steamdeck kernel: Spectre V2 : mitigation: Enabli=
ng conditional Indirect Branch Prediction Barrier
Dec 17 21:11:57 archlinux-steamdeck kernel: Spectre V2 : Selecting STIBP al=
ways-on mode to complement retbleed mitigation
Dec 17 21:11:57 archlinux-steamdeck kernel: Spectre V2 : User space: Mitiga=
tion: STIBP always-on protection
Dec 17 21:11:57 archlinux-steamdeck kernel: Speculative Store Bypass: Mitig=
ation: Speculative Store Bypass disabled via prctl
Dec 17 21:11:57 archlinux-steamdeck kernel: Speculative Return Stack Overfl=
ow: Mitigation: Safe RET
Dec 17 21:11:57 archlinux-steamdeck kernel: x86/fpu: Supporting XSAVE featu=
re 0x001: 'x87 floating point registers'
Dec 17 21:11:57 archlinux-steamdeck kernel: x86/fpu: Supporting XSAVE featu=
re 0x002: 'SSE registers'
Dec 17 21:11:57 archlinux-steamdeck kernel: x86/fpu: Supporting XSAVE featu=
re 0x004: 'AVX registers'
Dec 17 21:11:57 archlinux-steamdeck kernel: x86/fpu: xstate_offset[2]:  576=
, xstate_sizes[2]:  256
Dec 17 21:11:57 archlinux-steamdeck kernel: x86/fpu: Enabled xstate feature=
s 0x7, context size is 832 bytes, using 'compacted' format.
Dec 17 21:11:57 archlinux-steamdeck kernel: Freeing SMP alternatives memory=
: 40K
Dec 17 21:11:57 archlinux-steamdeck kernel: pid_max: default: 32768 minimum=
: 301
Dec 17 21:11:57 archlinux-steamdeck kernel: LSM: initializing lsm=3Dcapabil=
ity,landlock,lockdown,yama,bpf
Dec 17 21:11:57 archlinux-steamdeck kernel: landlock: Up and running.
Dec 17 21:11:57 archlinux-steamdeck kernel: Yama: becoming mindful.
Dec 17 21:11:57 archlinux-steamdeck kernel: LSM support for eBPF active
Dec 17 21:11:57 archlinux-steamdeck kernel: Mount-cache hash table entries:=
 32768 (order: 6, 262144 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: Mountpoint-cache hash table ent=
ries: 32768 (order: 6, 262144 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: smpboot: CPU0: AMD Custom APU 0=
405 (family: 0x17, model: 0x90, stepping: 0x2)
Dec 17 21:11:57 archlinux-steamdeck kernel: Performance Events: Fam17h+ cor=
e perfctr, AMD PMU driver.
Dec 17 21:11:57 archlinux-steamdeck kernel: ... version:                0
Dec 17 21:11:57 archlinux-steamdeck kernel: ... bit width:              48
Dec 17 21:11:57 archlinux-steamdeck kernel: ... generic registers:      6
Dec 17 21:11:57 archlinux-steamdeck kernel: ... value mask:             000=
0ffffffffffff
Dec 17 21:11:57 archlinux-steamdeck kernel: ... max period:             000=
07fffffffffff
Dec 17 21:11:57 archlinux-steamdeck kernel: ... fixed-purpose events:   0
Dec 17 21:11:57 archlinux-steamdeck kernel: ... event mask:             000=
000000000003f
Dec 17 21:11:57 archlinux-steamdeck kernel: signal: max sigframe size: 1776
Dec 17 21:11:57 archlinux-steamdeck kernel: rcu: Hierarchical SRCU implemen=
tation.
Dec 17 21:11:57 archlinux-steamdeck kernel: rcu:         Max phase no-delay=
 instances is 1000.
Dec 17 21:11:57 archlinux-steamdeck kernel: Timer migration: 1 hierarchy le=
vels; 8 children per group; 1 crossnode level
Dec 17 21:11:57 archlinux-steamdeck kernel: MCE: In-kernel MCE decoding ena=
bled.
Dec 17 21:11:57 archlinux-steamdeck kernel: NMI watchdog: Enabled. Permanen=
tly consumes one hw-PMU counter.
Dec 17 21:11:57 archlinux-steamdeck kernel: smp: Bringing up secondary CPUs=
 ...
Dec 17 21:11:57 archlinux-steamdeck kernel: smpboot: x86: Booting SMP confi=
guration:
Dec 17 21:11:57 archlinux-steamdeck kernel: .... node  #0, CPUs:      #2 #4=
 #6 #1 #3 #5 #7
Dec 17 21:11:57 archlinux-steamdeck kernel: Spectre V2 : Update user space =
SMT mitigation: STIBP always-on
Dec 17 21:11:57 archlinux-steamdeck kernel: smp: Brought up 1 node, 8 CPUs
Dec 17 21:11:57 archlinux-steamdeck kernel: smpboot: Total of 8 processors =
activated (44815.41 BogoMIPS)
Dec 17 21:11:57 archlinux-steamdeck kernel: Memory: 15119304K/15570416K ava=
ilable (18432K kernel code, 2654K rwdata, 14220K rodata, 4252K init, 4084K =
bss, 439008K reserved, 0K cma-reserved)
Dec 17 21:11:57 archlinux-steamdeck kernel: devtmpfs: initialized
Dec 17 21:11:57 archlinux-steamdeck kernel: x86/mm: Memory block size: 128MB
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PM: Registering ACPI NVS =
region [mem 0x09f00000-0x09f20fff] (135168 bytes)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PM: Registering ACPI NVS =
region [mem 0x7af7f000-0x7cf7efff] (33554432 bytes)
Dec 17 21:11:57 archlinux-steamdeck kernel: clocksource: jiffies: mask: 0xf=
fffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
Dec 17 21:11:57 archlinux-steamdeck kernel: futex hash table entries: 2048 =
(order: 5, 131072 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: pinctrl core: initialized pinct=
rl subsystem
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: RTC time: 20:11:52, date: 2=
024-12-17
Dec 17 21:11:57 archlinux-steamdeck kernel: NET: Registered PF_NETLINK/PF_R=
OUTE protocol family
Dec 17 21:11:57 archlinux-steamdeck kernel: DMA: preallocated 2048 KiB GFP_=
KERNEL pool for atomic allocations
Dec 17 21:11:57 archlinux-steamdeck kernel: DMA: preallocated 2048 KiB GFP_=
KERNEL|GFP_DMA pool for atomic allocations
Dec 17 21:11:57 archlinux-steamdeck kernel: DMA: preallocated 2048 KiB GFP_=
KERNEL|GFP_DMA32 pool for atomic allocations
Dec 17 21:11:57 archlinux-steamdeck kernel: audit: initializing netlink sub=
sys (disabled)
Dec 17 21:11:57 archlinux-steamdeck kernel: audit: type=3D2000 audit(173446=
6312.189:1): state=3Dinitialized audit_enabled=3D0 res=3D1
Dec 17 21:11:57 archlinux-steamdeck kernel: thermal_sys: Registered thermal=
 governor 'fair_share'
Dec 17 21:11:57 archlinux-steamdeck kernel: thermal_sys: Registered thermal=
 governor 'bang_bang'
Dec 17 21:11:57 archlinux-steamdeck kernel: thermal_sys: Registered thermal=
 governor 'step_wise'
Dec 17 21:11:57 archlinux-steamdeck kernel: thermal_sys: Registered thermal=
 governor 'user_space'
Dec 17 21:11:57 archlinux-steamdeck kernel: thermal_sys: Registered thermal=
 governor 'power_allocator'
Dec 17 21:11:57 archlinux-steamdeck kernel: cpuidle: using governor ladder
Dec 17 21:11:57 archlinux-steamdeck kernel: cpuidle: using governor menu
Dec 17 21:11:57 archlinux-steamdeck kernel: Simple Boot Flag at 0x44 set to=
 0x1
Dec 17 21:11:57 archlinux-steamdeck kernel: acpiphp: ACPI Hot Plug PCI Cont=
roller Driver version: 0.5
Dec 17 21:11:57 archlinux-steamdeck kernel: PCI: ECAM [mem 0xf8000000-0xfbf=
fffff] (base 0xf8000000) for domain 0000 [bus 00-3f]
Dec 17 21:11:57 archlinux-steamdeck kernel: PCI: Using configuration type 1=
 for base access
Dec 17 21:11:57 archlinux-steamdeck kernel: kprobes: kprobe jump-optimizati=
on is enabled. All kprobes are optimized if possible.
Dec 17 21:11:57 archlinux-steamdeck kernel: HugeTLB: registered 1.00 GiB pa=
ge size, pre-allocated 0 pages
Dec 17 21:11:57 archlinux-steamdeck kernel: HugeTLB: 16380 KiB vmemmap can =
be freed for a 1.00 GiB page
Dec 17 21:11:57 archlinux-steamdeck kernel: HugeTLB: registered 2.00 MiB pa=
ge size, pre-allocated 0 pages
Dec 17 21:11:57 archlinux-steamdeck kernel: HugeTLB: 28 KiB vmemmap can be =
freed for a 2.00 MiB page
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Added _OSI(Module Device)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Added _OSI(Processor Devi=
ce)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Added _OSI(3.0 _SCP Exten=
sions)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Added _OSI(Processor Aggr=
egator Device)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: 13 ACPI AML tables succes=
sfully acquired and loaded
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: [Firmware Bug]: BIOS _OSI=
(Linux) query ignored
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: EC: EC started
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: EC: interrupt blocked
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: EC: EC_CMD/EC_SC=3D0x66, =
EC_DATA=3D0x62
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: Boo=
t DSDT EC used to handle transactions
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Interpreter enabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PM: (supports S0 S3 S4 S5)
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Using IOAPIC for interrup=
t routing
Dec 17 21:11:57 archlinux-steamdeck kernel: PCI: Using host bridge windows =
=66rom ACPI; if necessary, use "pci=3Dnocrs" and report a bug
Dec 17 21:11:57 archlinux-steamdeck kernel: PCI: Ignoring E820 reservations=
 for host bridge windows
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: Enabled 5 GPEs in block 0=
0 to 1F
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: \_SB_.PRWL: New power res=
ource
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI Root Bridge [PCI0] (d=
omain 0000 [bus 00-ff])
Dec 17 21:11:57 archlinux-steamdeck kernel: acpi PNP0A08:00: _OSC: OS suppo=
rts [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
Dec 17 21:11:57 archlinux-steamdeck kernel: acpi PNP0A08:00: _OSC: platform=
 does not support [SHPCHotplug LTR DPC]
Dec 17 21:11:57 archlinux-steamdeck kernel: acpi PNP0A08:00: _OSC: OS now c=
ontrols [PCIeHotplug PME AER PCIeCapability]
Dec 17 21:11:57 archlinux-steamdeck kernel: acpi PNP0A08:00: [Firmware Info=
]: ECAM [mem 0xf8000000-0xfbffffff] for domain 0000 [bus 00-3f] only partia=
lly covers this bridge
Dec 17 21:11:57 archlinux-steamdeck kernel: PCI host bridge to bus 0000:00
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [io  0x0000-0x0cf7 window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [io  0x0d00-0xffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [mem 0x000a0000-0x000bffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [mem 0x000c0000-0x000cffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [mem 0x000d0000-0x000effff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [mem 0x80000000-0xf7ffffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [mem 0xfc000000-0xfeafffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [mem 0xfed45000-0xfed814ff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [mem 0xfed81900-0xfed81fff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [mem 0xfedc0000-0xfedc0fff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [mem 0xfedc6000-0xfedc6fff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [mem 0x4a0200000-0xf8ffffffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: root bus resou=
rce [bus 00-ff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:00.0: [1022:1645] t=
ype 00 class 0x060000 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.0: [1022:1632] t=
ype 00 class 0x060000 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.2: [1022:1647] t=
ype 01 class 0x060400 PCIe Root Port
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.2: PCI bridge to=
 [bus 01]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.2:   bridge wind=
ow [mem 0x80600000-0x806fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.2: PME# supporte=
d from D0 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.3: [1022:1647] t=
ype 01 class 0x060400 PCIe Root Port
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.3: PCI bridge to=
 [bus 02]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.3:   bridge wind=
ow [mem 0x80500000-0x805fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.3: PME# supporte=
d from D0 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.4: [1022:1647] t=
ype 01 class 0x060400 PCIe Root Port
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.4: PCI bridge to=
 [bus 03]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.4:   bridge wind=
ow [io  0x2000-0x2fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.4:   bridge wind=
ow [mem 0x80400000-0x804fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.4: PME# supporte=
d from D0 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.0: [1022:1632] t=
ype 00 class 0x060000 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1: [1022:1648] t=
ype 01 class 0x060400 PCIe Root Port
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1: PCI bridge to=
 [bus 04]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1:   bridge wind=
ow [io  0x1000-0x1fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1:   bridge wind=
ow [mem 0x80000000-0x803fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1:   bridge wind=
ow [mem 0xf8e0000000-0xf8f01fffff 64bit pref]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1: enabling Exte=
nded Tags
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1: PME# supporte=
d from D0 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.2: [1022:1648] t=
ype 01 class 0x060400 PCIe Root Port
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.2: PCI bridge to=
 [bus 05]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.2: enabling Exte=
nded Tags
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.2: PME# supporte=
d from D0 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.3: [1022:1648] t=
ype 01 class 0x060400 PCIe Root Port
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.3: PCI bridge to=
 [bus 06]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.3: enabling Exte=
nded Tags
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.3: PME# supporte=
d from D0 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:14.0: [1022:790b] t=
ype 00 class 0x0c0500 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:14.3: [1022:790e] t=
ype 00 class 0x060100 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:18.0: [1022:1660] t=
ype 00 class 0x060000 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:18.1: [1022:1661] t=
ype 00 class 0x060000 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:18.2: [1022:1662] t=
ype 00 class 0x060000 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:18.3: [1022:1663] t=
ype 00 class 0x060000 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:18.4: [1022:1664] t=
ype 00 class 0x060000 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:18.5: [1022:1665] t=
ype 00 class 0x060000 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:18.6: [1022:1666] t=
ype 00 class 0x060000 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:18.7: [1022:1667] t=
ype 00 class 0x060000 conventional PCI endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:01:00.0: [2646:500d] t=
ype 00 class 0x010802 PCIe Endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:01:00.0: BAR 0 [mem 0x=
80600000-0x80603fff 64bit]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.2: PCI bridge to=
 [bus 01]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:02:00.0: [1217:8621] t=
ype 00 class 0x080501 PCIe Endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:02:00.0: BAR 0 [mem 0x=
80501000-0x80501fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:02:00.0: BAR 1 [mem 0x=
80500000-0x805007ff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:02:00.0: PME# supporte=
d from D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.3: PCI bridge to=
 [bus 02]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:03:00.0: [10ec:c822] t=
ype 00 class 0x028000 PCIe Endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:03:00.0: BAR 0 [io  0x=
2000-0x20ff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:03:00.0: BAR 2 [mem 0x=
80400000-0x8040ffff 64bit]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:03:00.0: supports D1 D2
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:03:00.0: PME# supporte=
d from D0 D1 D2 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.4: PCI bridge to=
 [bus 03]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.0: [1002:163f] t=
ype 00 class 0x030000 PCIe Legacy Endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.0: BAR 0 [mem 0x=
f8e0000000-0xf8efffffff 64bit pref]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.0: BAR 2 [mem 0x=
f8f0000000-0xf8f01fffff 64bit pref]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.0: BAR 4 [io  0x=
1000-0x10ff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.0: BAR 5 [mem 0x=
80300000-0x8037ffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.0: enabling Exte=
nded Tags
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.0: PME# supporte=
d from D1 D2 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.0: 126.016 Gb/s =
available PCIe bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:08.1=
 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.1: [1002:1640] t=
ype 00 class 0x040300 PCIe Legacy Endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.1: BAR 0 [mem 0x=
803c0000-0x803c3fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.1: enabling Exte=
nded Tags
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.1: PME# supporte=
d from D1 D2 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.2: [1022:1649] t=
ype 00 class 0x108000 PCIe Endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.2: BAR 2 [mem 0x=
80200000-0x802fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.2: BAR 5 [mem 0x=
803c4000-0x803c5fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.2: enabling Exte=
nded Tags
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.3: [1022:162c] t=
ype 00 class 0x0c0330 PCIe Endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.3: BAR 0 [mem 0x=
80000000-0x800fffff 64bit]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.3: enabling Exte=
nded Tags
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.3: PME# supporte=
d from D0 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.4: [1022:163b] t=
ype 00 class 0x0c0330 PCIe Endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.4: BAR 0 [mem 0x=
80100000-0x801fffff 64bit]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.4: enabling Exte=
nded Tags
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.4: PME# supporte=
d from D0 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.5: [1022:15e2] t=
ype 00 class 0x048000 PCIe Endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.5: BAR 0 [mem 0x=
80380000-0x803bffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.5: enabling Exte=
nded Tags
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.5: PME# supporte=
d from D0 D3hot D3cold
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1: PCI bridge to=
 [bus 04]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:05:00.0: [1022:145a] t=
ype 00 class 0x130000 PCIe Endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:05:00.0: enabling Exte=
nded Tags
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:05:00.0: 126.016 Gb/s =
available PCIe bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:08.2=
 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.2: PCI bridge to=
 [bus 05]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:06:00.0: [1022:145a] t=
ype 00 class 0x130000 PCIe Endpoint
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:06:00.0: enabling Exte=
nded Tags
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:06:00.0: 126.016 Gb/s =
available PCIe bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:08.3=
 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.3: PCI bridge to=
 [bus 06]
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKA =
configured for IRQ 0
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKA =
disabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKB =
configured for IRQ 0
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKB =
disabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKC =
configured for IRQ 0
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKC =
disabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKD =
configured for IRQ 0
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKD =
disabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKE =
configured for IRQ 0
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKE =
disabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKF =
configured for IRQ 0
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKF =
disabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKG =
configured for IRQ 0
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKG =
disabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKH =
configured for IRQ 0
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: PCI: Interrupt link LNKH =
disabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: EC: interrupt unblocked
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: EC: event unblocked
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: EC: EC_CMD/EC_SC=3D0x66, =
EC_DATA=3D0x62
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: EC: GPE=3D0xa
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: Boo=
t DSDT EC initialization complete
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: EC:=
 Used to handle transactions and events
Dec 17 21:11:57 archlinux-steamdeck kernel: iommu: Default domain type: Tra=
nslated
Dec 17 21:11:57 archlinux-steamdeck kernel: iommu: DMA domain TLB invalidat=
ion policy: lazy mode
Dec 17 21:11:57 archlinux-steamdeck kernel: SCSI subsystem initialized
Dec 17 21:11:57 archlinux-steamdeck kernel: libata version 3.00 loaded.
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: bus type USB registered
Dec 17 21:11:57 archlinux-steamdeck kernel: usbcore: registered new interfa=
ce driver usbfs
Dec 17 21:11:57 archlinux-steamdeck kernel: usbcore: registered new interfa=
ce driver hub
Dec 17 21:11:57 archlinux-steamdeck kernel: usbcore: registered new device =
driver usb
Dec 17 21:11:57 archlinux-steamdeck kernel: EDAC MC: Ver: 3.0.0
Dec 17 21:11:57 archlinux-steamdeck kernel: efivars: Registered efivars ope=
rations
Dec 17 21:11:57 archlinux-steamdeck kernel: NetLabel: Initializing
Dec 17 21:11:57 archlinux-steamdeck kernel: NetLabel:  domain hash size =3D=
 128
Dec 17 21:11:57 archlinux-steamdeck kernel: NetLabel:  protocols =3D UNLABE=
LED CIPSOv4 CALIPSO
Dec 17 21:11:57 archlinux-steamdeck kernel: NetLabel:  unlabeled traffic al=
lowed by default
Dec 17 21:11:57 archlinux-steamdeck kernel: mctp: management component tran=
sport protocol core
Dec 17 21:11:57 archlinux-steamdeck kernel: NET: Registered PF_MCTP protoco=
l family
Dec 17 21:11:57 archlinux-steamdeck kernel: PCI: Using ACPI for IRQ routing
Dec 17 21:11:57 archlinux-steamdeck kernel: PCI: pci_cache_line_size set to=
 64 bytes
Dec 17 21:11:57 archlinux-steamdeck kernel: resource: Expanded resource Res=
erved due to conflict with PCI Bus 0000:00
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: reserve RAM buffer [mem 0=
x0009f000-0x0009ffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: reserve RAM buffer [mem 0=
x09b00000-0x0bffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: reserve RAM buffer [mem 0=
x09f00000-0x0bffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: reserve RAM buffer [mem 0=
x69c27018-0x6bffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: reserve RAM buffer [mem 0=
x6b368000-0x6bffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: reserve RAM buffer [mem 0=
x6c56f000-0x6fffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: reserve RAM buffer [mem 0=
x721e1000-0x73ffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: reserve RAM buffer [mem 0=
x74078000-0x77ffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: reserve RAM buffer [mem 0=
x7877f000-0x7bffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: reserve RAM buffer [mem 0=
x7d000000-0x7fffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: e820: reserve RAM buffer [mem 0=
x43f380000-0x43fffffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.0: vgaarb: setti=
ng as boot VGA device
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.0: vgaarb: bridg=
e control possible
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.0: vgaarb: VGA d=
evice added: decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
Dec 17 21:11:57 archlinux-steamdeck kernel: vgaarb: loaded
Dec 17 21:11:57 archlinux-steamdeck kernel: hpet0: at MMIO 0xfed00000, IRQs=
 2, 8, 0
Dec 17 21:11:57 archlinux-steamdeck kernel: hpet0: 3 comparators, 32-bit 14=
=2E318180 MHz counter
Dec 17 21:11:57 archlinux-steamdeck kernel: clocksource: Switched to clocks=
ource tsc-early
Dec 17 21:11:57 archlinux-steamdeck kernel: VFS: Disk quotas dquot_6.6.0
Dec 17 21:11:57 archlinux-steamdeck kernel: VFS: Dquot-cache hash table ent=
ries: 512 (order 0, 4096 bytes)
Dec 17 21:11:57 archlinux-steamdeck kernel: pnp: PnP ACPI init
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:00: [mem 0xfec00000-0=
xfec01fff] could not be reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:00: [mem 0xfee00000-0=
xfee00fff] has been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:00: [mem 0xa0000000-0=
xa00fffff] has been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:03: [io  0x0400-0x04c=
f] has been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:03: [io  0x04d0-0x04d=
1] has been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:03: [io  0x04d6] has =
been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:03: [io  0x0c00-0x0c0=
1] has been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:03: [io  0x0c14] has =
been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:03: [io  0x0c50-0x0c5=
2] has been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:03: [io  0x0c6c] has =
been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:03: [io  0x0c6f] has =
been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:03: [io  0x0cd0-0x0cd=
b] has been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:04: [mem 0x000e0000-0=
x000fffff] could not be reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:04: [mem 0xff000000-0=
xffffffff] has been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: system 00:05: [mem 0xf8000000-0=
xfbffffff] has been reserved
Dec 17 21:11:57 archlinux-steamdeck kernel: pnp: PnP ACPI: found 6 devices
Dec 17 21:11:57 archlinux-steamdeck kernel: clocksource: acpi_pm: mask: 0xf=
fffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
Dec 17 21:11:57 archlinux-steamdeck kernel: NET: Registered PF_INET protoco=
l family
Dec 17 21:11:57 archlinux-steamdeck kernel: IP idents hash table entries: 2=
62144 (order: 9, 2097152 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: tcp_listen_portaddr_hash hash t=
able entries: 8192 (order: 5, 131072 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: Table-perturb hash table entrie=
s: 65536 (order: 6, 262144 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: TCP established hash table entr=
ies: 131072 (order: 8, 1048576 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: TCP bind hash table entries: 65=
536 (order: 9, 2097152 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: TCP: Hash tables configured (es=
tablished 131072 bind 65536)
Dec 17 21:11:57 archlinux-steamdeck kernel: MPTCP token hash table entries:=
 16384 (order: 6, 393216 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: UDP hash table entries: 8192 (o=
rder: 6, 262144 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: UDP-Lite hash table entries: 81=
92 (order: 6, 262144 bytes, linear)
Dec 17 21:11:57 archlinux-steamdeck kernel: NET: Registered PF_UNIX/PF_LOCA=
L protocol family
Dec 17 21:11:57 archlinux-steamdeck kernel: NET: Registered PF_XDP protocol=
 family
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.2: PCI bridge to=
 [bus 01]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.2:   bridge wind=
ow [mem 0x80600000-0x806fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.3: PCI bridge to=
 [bus 02]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.3:   bridge wind=
ow [mem 0x80500000-0x805fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.4: PCI bridge to=
 [bus 03]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.4:   bridge wind=
ow [io  0x2000-0x2fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:01.4:   bridge wind=
ow [mem 0x80400000-0x804fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1: PCI bridge to=
 [bus 04]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1:   bridge wind=
ow [io  0x1000-0x1fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1:   bridge wind=
ow [mem 0x80000000-0x803fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.1:   bridge wind=
ow [mem 0xf8e0000000-0xf8f01fffff 64bit pref]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.2: PCI bridge to=
 [bus 05]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:00:08.3: PCI bridge to=
 [bus 06]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 4 [io=
  0x0000-0x0cf7 window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 5 [io=
  0x0d00-0xffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 6 [me=
m 0x000a0000-0x000bffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 7 [me=
m 0x000c0000-0x000cffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 8 [me=
m 0x000d0000-0x000effff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 9 [me=
m 0x80000000-0xf7ffffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 10 [m=
em 0xfc000000-0xfeafffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 11 [m=
em 0xfed45000-0xfed814ff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 12 [m=
em 0xfed81900-0xfed81fff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 13 [m=
em 0xfedc0000-0xfedc0fff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 14 [m=
em 0xfedc6000-0xfedc6fff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:00: resource 15 [m=
em 0x4a0200000-0xf8ffffffff window]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:01: resource 1 [me=
m 0x80600000-0x806fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:02: resource 1 [me=
m 0x80500000-0x805fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:03: resource 0 [io=
  0x2000-0x2fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:03: resource 1 [me=
m 0x80400000-0x804fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:04: resource 0 [io=
  0x1000-0x1fff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:04: resource 1 [me=
m 0x80000000-0x803fffff]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci_bus 0000:04: resource 2 [me=
m 0xf8e0000000-0xf8f01fffff 64bit pref]
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.1: D0 power stat=
e depends on 0000:04:00.0
Dec 17 21:11:57 archlinux-steamdeck kernel: pci 0000:04:00.4: quirk_usb_ear=
ly_handoff+0x0/0x740 took 19222 usecs
Dec 17 21:11:57 archlinux-steamdeck kernel: PCI: CLS 64 bytes, default 64
Dec 17 21:11:57 archlinux-steamdeck kernel: PCI-DMA: Using software bounce =
buffering for IO (SWIOTLB)
Dec 17 21:11:57 archlinux-steamdeck kernel: software IO TLB: mapped [mem 0x=
00000000657fe000-0x00000000697fe000] (64MB)
Dec 17 21:11:57 archlinux-steamdeck kernel: Trying to unpack rootfs image a=
s initramfs...
Dec 17 21:11:57 archlinux-steamdeck kernel: LVT offset 0 assigned for vecto=
r 0x400
Dec 17 21:11:57 archlinux-steamdeck kernel: perf: AMD IBS detected (0x00000=
3ff)
Dec 17 21:11:57 archlinux-steamdeck kernel: Initialise system trusted keyri=
ngs
Dec 17 21:11:57 archlinux-steamdeck kernel: Key type blacklist registered
Dec 17 21:11:57 archlinux-steamdeck kernel: workingset: timestamp_bits=3D36=
 max_order=3D22 bucket_order=3D0
Dec 17 21:11:57 archlinux-steamdeck kernel: fuse: init (API version 7.41)
Dec 17 21:11:57 archlinux-steamdeck kernel: integrity: Platform Keyring ini=
tialized
Dec 17 21:11:57 archlinux-steamdeck kernel: integrity: Machine keyring init=
ialized
Dec 17 21:11:57 archlinux-steamdeck kernel: Key type asymmetric registered
Dec 17 21:11:57 archlinux-steamdeck kernel: Asymmetric key parser 'x509' re=
gistered
Dec 17 21:11:57 archlinux-steamdeck kernel: Block layer SCSI generic (bsg) =
driver version 0.4 loaded (major 246)
Dec 17 21:11:57 archlinux-steamdeck kernel: io scheduler mq-deadline regist=
ered
Dec 17 21:11:57 archlinux-steamdeck kernel: io scheduler kyber registered
Dec 17 21:11:57 archlinux-steamdeck kernel: io scheduler bfq registered
Dec 17 21:11:57 archlinux-steamdeck kernel: ledtrig-cpu: registered to indi=
cate activity on CPUs
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.2: PME: Sig=
naling with IRQ 25
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.2: AER: ena=
bled with IRQ 25
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.2: DPC: ena=
bled with IRQ 25
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.2: DPC: err=
or containment capabilities: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP =
PIO Log 6, DL_ActiveErr+
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.3: PME: Sig=
naling with IRQ 26
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.3: AER: ena=
bled with IRQ 26
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.3: DPC: ena=
bled with IRQ 26
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.3: DPC: err=
or containment capabilities: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP =
PIO Log 6, DL_ActiveErr+
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.4: PME: Sig=
naling with IRQ 27
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.4: AER: ena=
bled with IRQ 27
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.4: DPC: ena=
bled with IRQ 27
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:01.4: DPC: err=
or containment capabilities: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP =
PIO Log 6, DL_ActiveErr+
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:08.1: PME: Sig=
naling with IRQ 28
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:08.2: PME: Sig=
naling with IRQ 29
Dec 17 21:11:57 archlinux-steamdeck kernel: pcieport 0000:00:08.3: PME: Sig=
naling with IRQ 30
Dec 17 21:11:57 archlinux-steamdeck kernel: shpchp: Standard Hot Plug PCI C=
ontroller Driver version: 0.4
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: AC: AC Adapter [ACAD] (of=
f-line)
Dec 17 21:11:57 archlinux-steamdeck kernel: input: Power Button as /devices=
/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: button: Power Button [PWR=
B]
Dec 17 21:11:57 archlinux-steamdeck kernel: input: Lid Switch as /devices/L=
NXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input1
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: button: Lid Switch [LID]
Dec 17 21:11:57 archlinux-steamdeck kernel: input: Power Button as /devices=
/LNXSYSTM:00/LNXPWRBN:00/input/input2
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: button: Power Button [PWR=
F]
Dec 17 21:11:57 archlinux-steamdeck kernel: Monitor-Mwait will be used to e=
nter C-1 state
Dec 17 21:11:57 archlinux-steamdeck kernel: Estimated ratio of average max =
frequency by base frequency (times 1024): 1152
Dec 17 21:11:57 archlinux-steamdeck kernel: thermal LNXTHERM:00: registered=
 as thermal_zone0
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: thermal: Thermal Zone [TZ=
01] (57 C)
Dec 17 21:11:57 archlinux-steamdeck kernel: Serial: 8250/16550 driver, 32 p=
orts, IRQ sharing enabled
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: battery: Slot [BAT1] (bat=
tery present)
Dec 17 21:11:57 archlinux-steamdeck kernel: Non-volatile memory driver v1.3
Dec 17 21:11:57 archlinux-steamdeck kernel: Linux agpgart interface v0.103
Dec 17 21:11:57 archlinux-steamdeck kernel: Freeing initrd memory: 45004K
Dec 17 21:11:57 archlinux-steamdeck kernel: tpm_crb MSFT0101:00: Disabling =
hwrng
Dec 17 21:11:57 archlinux-steamdeck kernel: tpm tpm0: tpm_read_log_acpi: Fa=
iled to map ACPI memory
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: bus type drm_connector re=
gistered
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.3: xHCI Hos=
t Controller
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.3: new USB =
bus registered, assigned bus number 1
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.3: hcc para=
ms 0x0110ffe5 hci version 0x110 quirks 0x0000000000000010
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.3: xHCI Hos=
t Controller
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.3: new USB =
bus registered, assigned bus number 2
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.3: Host sup=
ports USB 3.1 Enhanced SuperSpeed
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb1: New USB device found,=
 idVendor=3D1d6b, idProduct=3D0002, bcdDevice=3D 6.12
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb1: New USB device string=
s: Mfr=3D3, Product=3D2, SerialNumber=3D1
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb1: Product: xHCI Host Co=
ntroller
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb1: Manufacturer: Linux 6=
=2E12.6-rc1-1home xhci-hcd
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb1: SerialNumber: 0000:04=
:00.3
Dec 17 21:11:57 archlinux-steamdeck kernel: hub 1-0:1.0: USB hub found
Dec 17 21:11:57 archlinux-steamdeck kernel: hub 1-0:1.0: 1 port detected
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb2: We don't know the alg=
orithms for LPM for this host, disabling LPM.
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb2: New USB device found,=
 idVendor=3D1d6b, idProduct=3D0003, bcdDevice=3D 6.12
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb2: New USB device string=
s: Mfr=3D3, Product=3D2, SerialNumber=3D1
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb2: Product: xHCI Host Co=
ntroller
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb2: Manufacturer: Linux 6=
=2E12.6-rc1-1home xhci-hcd
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb2: SerialNumber: 0000:04=
:00.3
Dec 17 21:11:57 archlinux-steamdeck kernel: hub 2-0:1.0: USB hub found
Dec 17 21:11:57 archlinux-steamdeck kernel: hub 2-0:1.0: 1 port detected
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.4: xHCI Hos=
t Controller
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.4: new USB =
bus registered, assigned bus number 3
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.4: hcc para=
ms 0x0128ffe5 hci version 0x110 quirks 0x0000000000000010
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.4: xHCI Hos=
t Controller
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.4: new USB =
bus registered, assigned bus number 4
Dec 17 21:11:57 archlinux-steamdeck kernel: xhci_hcd 0000:04:00.4: Host sup=
ports USB 3.1 Enhanced SuperSpeed
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb3: New USB device found,=
 idVendor=3D1d6b, idProduct=3D0002, bcdDevice=3D 6.12
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb3: New USB device string=
s: Mfr=3D3, Product=3D2, SerialNumber=3D1
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb3: Product: xHCI Host Co=
ntroller
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb3: Manufacturer: Linux 6=
=2E12.6-rc1-1home xhci-hcd
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb3: SerialNumber: 0000:04=
:00.4
Dec 17 21:11:57 archlinux-steamdeck kernel: hub 3-0:1.0: USB hub found
Dec 17 21:11:57 archlinux-steamdeck kernel: hub 3-0:1.0: 6 ports detected
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb4: We don't know the alg=
orithms for LPM for this host, disabling LPM.
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb4: New USB device found,=
 idVendor=3D1d6b, idProduct=3D0003, bcdDevice=3D 6.12
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb4: New USB device string=
s: Mfr=3D3, Product=3D2, SerialNumber=3D1
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb4: Product: xHCI Host Co=
ntroller
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb4: Manufacturer: Linux 6=
=2E12.6-rc1-1home xhci-hcd
Dec 17 21:11:57 archlinux-steamdeck kernel: usb usb4: SerialNumber: 0000:04=
:00.4
Dec 17 21:11:57 archlinux-steamdeck kernel: hub 4-0:1.0: USB hub found
Dec 17 21:11:57 archlinux-steamdeck kernel: hub 4-0:1.0: 2 ports detected
Dec 17 21:11:57 archlinux-steamdeck kernel: usbcore: registered new interfa=
ce driver usbserial_generic
Dec 17 21:11:57 archlinux-steamdeck kernel: usbserial: USB Serial support r=
egistered for generic
Dec 17 21:11:57 archlinux-steamdeck kernel: rtc_cmos 00:01: RTC can wake fr=
om S4
Dec 17 21:11:57 archlinux-steamdeck kernel: rtc_cmos 00:01: registered as r=
tc0
Dec 17 21:11:57 archlinux-steamdeck kernel: rtc_cmos 00:01: setting system =
clock to 2024-12-17T20:11:52 UTC (1734466312)
Dec 17 21:11:57 archlinux-steamdeck kernel: rtc_cmos 00:01: alarms up to on=
e month, 114 bytes nvram
Dec 17 21:11:57 archlinux-steamdeck kernel: simple-framebuffer simple-frame=
buffer.0: [drm] Registered 1 planes with drm panic
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] Initialized simpledrm 1.0=
=2E0 for simple-framebuffer.0 on minor 0
Dec 17 21:11:57 archlinux-steamdeck kernel: fbcon: Deferring console take-o=
ver
Dec 17 21:11:57 archlinux-steamdeck kernel: simple-framebuffer simple-frame=
buffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
Dec 17 21:11:57 archlinux-steamdeck kernel: hid: raw HID events driver (C) =
Jiri Kosina
Dec 17 21:11:57 archlinux-steamdeck kernel: drop_monitor: Initializing netw=
ork drop monitor service
Dec 17 21:11:57 archlinux-steamdeck kernel: NET: Registered PF_INET6 protoc=
ol family
Dec 17 21:11:57 archlinux-steamdeck kernel: Segment Routing with IPv6
Dec 17 21:11:57 archlinux-steamdeck kernel: RPL Segment Routing with IPv6
Dec 17 21:11:57 archlinux-steamdeck kernel: In-situ OAM (IOAM) with IPv6
Dec 17 21:11:57 archlinux-steamdeck kernel: NET: Registered PF_PACKET proto=
col family
Dec 17 21:11:57 archlinux-steamdeck kernel: microcode: Current revision: 0x=
08900203
Dec 17 21:11:57 archlinux-steamdeck kernel: resctrl: L3 allocation detected
Dec 17 21:11:57 archlinux-steamdeck kernel: resctrl: MB allocation detected
Dec 17 21:11:57 archlinux-steamdeck kernel: resctrl: L3 monitoring detected
Dec 17 21:11:57 archlinux-steamdeck kernel: IPI shorthand broadcast: enabled
Dec 17 21:11:57 archlinux-steamdeck kernel: sched_clock: Marking stable (67=
9693952, 373757)->(685049860, -4982151)
Dec 17 21:11:57 archlinux-steamdeck kernel: registered taskstats version 1
Dec 17 21:11:57 archlinux-steamdeck kernel: Loading compiled-in X.509 certi=
ficates
Dec 17 21:11:57 archlinux-steamdeck kernel: Loaded X.509 cert 'Build time a=
utogenerated kernel key: 66d38863f013dabad0e570149fb9f472d78a0994'
Dec 17 21:11:57 archlinux-steamdeck kernel: Demotion targets for Node 0: nu=
ll
Dec 17 21:11:57 archlinux-steamdeck kernel: Key type .fscrypt registered
Dec 17 21:11:57 archlinux-steamdeck kernel: Key type fscrypt-provisioning r=
egistered
Dec 17 21:11:57 archlinux-steamdeck kernel: PM:   Magic number: 4:55:195
Dec 17 21:11:57 archlinux-steamdeck kernel: RAS: Correctable Errors collect=
or initialized.
Dec 17 21:11:57 archlinux-steamdeck kernel: clk: Disabling unused clocks
Dec 17 21:11:57 archlinux-steamdeck kernel: PM: genpd: Disabling unused pow=
er domains
Dec 17 21:11:57 archlinux-steamdeck kernel: Freeing unused decrypted memory=
: 2028K
Dec 17 21:11:57 archlinux-steamdeck kernel: Freeing unused kernel image (in=
itmem) memory: 4252K
Dec 17 21:11:57 archlinux-steamdeck kernel: Write protecting the kernel rea=
d-only data: 32768k
Dec 17 21:11:57 archlinux-steamdeck kernel: Freeing unused kernel image (ro=
data/data gap) memory: 116K
Dec 17 21:11:57 archlinux-steamdeck kernel: x86/mm: Checked W+X mappings: p=
assed, no W+X pages found.
Dec 17 21:11:57 archlinux-steamdeck kernel: rodata_test: all tests were suc=
cessful
Dec 17 21:11:57 archlinux-steamdeck kernel: Run /init as init process
Dec 17 21:11:57 archlinux-steamdeck kernel:   with arguments:
Dec 17 21:11:57 archlinux-steamdeck kernel:     /init
Dec 17 21:11:57 archlinux-steamdeck kernel:   with environment:
Dec 17 21:11:57 archlinux-steamdeck kernel:     HOME=3D/
Dec 17 21:11:57 archlinux-steamdeck kernel:     TERM=3Dlinux
Dec 17 21:11:57 archlinux-steamdeck kernel:     BOOT_IMAGE=3D/vmlinuz-linux
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-3: new full-speed USB dev=
ice number 2 using xhci_hcd
Dec 17 21:11:57 archlinux-steamdeck kernel: ACPI: video: Video Device [VGA1=
] (multi-head: yes  rom: no  post: no)
Dec 17 21:11:57 archlinux-steamdeck kernel: i8042: PNP: PS/2 Controller [PN=
P0303:KBC0] at 0x60,0x64 irq 1
Dec 17 21:11:57 archlinux-steamdeck kernel: i8042: PNP: PS/2 appears to hav=
e AUX port disabled, if this is incorrect please boot with i8042.nopnp
Dec 17 21:11:57 archlinux-steamdeck kernel: input: Video Bus as /devices/LN=
XSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:0d/LNXVIDEO:01/input/input3
Dec 17 21:11:57 archlinux-steamdeck kernel: serio: i8042 KBD port at 0x60,0=
x64 irq 1
Dec 17 21:11:57 archlinux-steamdeck kernel: sdhci: Secure Digital Host Cont=
roller Interface driver
Dec 17 21:11:57 archlinux-steamdeck kernel: sdhci: Copyright(c) Pierre Ossm=
an
Dec 17 21:11:57 archlinux-steamdeck kernel: nvme nvme0: pci function 0000:0=
1:00.0
Dec 17 21:11:57 archlinux-steamdeck kernel: sdhci-pci 0000:02:00.0: SDHCI c=
ontroller found [1217:8621] (rev 1)
Dec 17 21:11:57 archlinux-steamdeck kernel: nvme nvme0: missing or invalid =
SUBNQN field.
Dec 17 21:11:57 archlinux-steamdeck kernel: mmc0: SDHCI controller on PCI [=
0000:02:00.0] using ADMA
Dec 17 21:11:57 archlinux-steamdeck kernel: nvme nvme0: 8/0/0 default/read/=
poll queues
Dec 17 21:11:57 archlinux-steamdeck kernel:  nvme0n1: p1 p2 p3 p4 p5 p6 p7 =
p8
Dec 17 21:11:57 archlinux-steamdeck kernel: raid6: skipped pq benchmark and=
 selected avx2x4
Dec 17 21:11:57 archlinux-steamdeck kernel: raid6: using avx2x2 recovery al=
gorithm
Dec 17 21:11:57 archlinux-steamdeck kernel: xor: automatically using best c=
hecksumming function   avx      =20
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-3: New USB device found, =
idVendor=3D28de, idProduct=3D1205, bcdDevice=3D 1.00
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-3: New USB device strings=
: Mfr=3D1, Product=3D2, SerialNumber=3D3
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-3: Product: Steam Deck Co=
ntroller
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-3: Manufacturer: Valve So=
ftware
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-3: SerialNumber: MEDA2090=
6627
Dec 17 21:11:57 archlinux-steamdeck kernel: input: AT Translated Set 2 keyb=
oard as /devices/platform/i8042/serio0/input/input4
Dec 17 21:11:57 archlinux-steamdeck kernel: Btrfs loaded, zoned=3Dyes, fsve=
rity=3Dyes
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-5: new full-speed USB dev=
ice number 3 using xhci_hcd
Dec 17 21:11:57 archlinux-steamdeck kernel: tsc: Refined TSC clocksource ca=
libration: 2799.999 MHz
Dec 17 21:11:57 archlinux-steamdeck kernel: clocksource: tsc: mask: 0xfffff=
fffffffffff max_cycles: 0x285c3fb0b68, max_idle_ns: 440795224466 ns
Dec 17 21:11:57 archlinux-steamdeck kernel: clocksource: Switched to clocks=
ource tsc
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-5: New USB device found, =
idVendor=3D13d3, idProduct=3D3553, bcdDevice=3D 0.00
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-5: New USB device strings=
: Mfr=3D1, Product=3D2, SerialNumber=3D3
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-5: Product: Bluetooth Rad=
io
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-5: Manufacturer: Realtek
Dec 17 21:11:57 archlinux-steamdeck kernel: usb 3-5: SerialNumber: 00e04c00=
0001
Dec 17 21:11:57 archlinux-steamdeck kernel: mmc0: new ultra high speed SDR1=
04 SDHC card at address aaaa
Dec 17 21:11:57 archlinux-steamdeck kernel: mmcblk0: mmc0:aaaa SC32G 29.7 G=
iB
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] amdgpu kernel modesetting=
 enabled.
Dec 17 21:11:57 archlinux-steamdeck kernel:  mmcblk0: p1 p2
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu: Virtual CRAT table crea=
ted for CPU
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu: Topology: Add CPU node
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: enabling d=
evice (0006 -> 0007)
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] initializing kernel modes=
etting (IP DISCOVERY 0x1002:0x163F 0x1002:0x0123 0xAE).
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] register mmio base: 0x803=
00000
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] register mmio size: 524288
Dec 17 21:11:57 archlinux-steamdeck kernel: usbcore: registered new interfa=
ce driver usbhid
Dec 17 21:11:57 archlinux-steamdeck kernel: usbhid: USB HID core driver
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] add ip block number 0 <nv=
_common>
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] add ip block number 1 <gm=
c_v10_0>
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] add ip block number 2 <na=
vi10_ih>
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] add ip block number 3 <ps=
p>
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] add ip block number 4 <sm=
u>
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] add ip block number 5 <dm>
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] add ip block number 6 <gf=
x_v10_0>
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] add ip block number 7 <sd=
ma_v5_2>
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] add ip block number 8 <vc=
n_v3_0>
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] add ip block number 9 <jp=
eg_v3_0>
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: Fe=
tched VBIOS from VFCT
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu: ATOM BIOS: 113-AMDAerit=
hJ-005
Dec 17 21:11:57 archlinux-steamdeck kernel: input: Valve Software Steam Dec=
k Controller as /devices/pci0000:00/0000:00:08.1/0000:04:00.4/usb3/3-3/3-3:=
1.0/0003:28DE:1205.0001/input/input5
Dec 17 21:11:57 archlinux-steamdeck kernel: hid-generic 0003:28DE:1205.0001=
: input,hidraw0: USB HID v1.11 Keyboard [Valve Software Steam Deck Controll=
er] on usb-0000:04:00.4-3/input0
Dec 17 21:11:57 archlinux-steamdeck kernel: input: Valve Software Steam Dec=
k Controller as /devices/pci0000:00/0000:00:08.1/0000:04:00.4/usb3/3-3/3-3:=
1.1/0003:28DE:1205.0002/input/input6
Dec 17 21:11:57 archlinux-steamdeck kernel: hid-generic 0003:28DE:1205.0002=
: input,hidraw1: USB HID v1.11 Mouse [Valve Software Steam Deck Controller]=
 on usb-0000:04:00.4-3/input1
Dec 17 21:11:57 archlinux-steamdeck kernel: hid-generic 0003:28DE:1205.0003=
: hiddev96,hidraw2: USB HID v1.11 Device [Valve Software Steam Deck Control=
ler] on usb-0000:04:00.4-3/input2
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: vgaarb: de=
activate vga console
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: Tr=
usted Memory Zone (TMZ) feature disabled as experimental (default)
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] vm size is 262144 GB, 4 l=
evels, block size is 9-bit, fragment size is 9-bit
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: VR=
AM: 1024M 0x000000F400000000 - 0x000000F43FFFFFFF (1024M used)
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: GA=
RT: 1024M 0x0000000000000000 - 0x000000003FFFFFFF
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] Detected VRAM RAM=3D1024M=
, BAR=3D1024M
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] RAM width 128bits LPDDR5
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] amdgpu: 1024M of VRAM mem=
ory ready
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] amdgpu: 7413M of GTT memo=
ry ready.
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] GART: num cpu pages 26214=
4, num gpu pages 262144
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] PCIE GART of 1024M enable=
d (table at 0x000000F43FC00000).
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] Loading DMUB firmware via=
 PSP: version=3D0x0300000A
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] use_doorbell being set to=
: [true]
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] Found VCN firmware Versio=
n ENC: 1.27 DEC: 2 VEP: 0 Revision: 0
Dec 17 21:11:57 archlinux-steamdeck kernel: input: Valve Software Steam Dec=
k Controller as /devices/pci0000:00/0000:00:08.1/0000:04:00.4/usb3/3-3/3-3:=
1.0/0003:28DE:1205.0001/input/input7
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: re=
serve 0xa00000 from 0xf43e000000 for PSP TMR
Dec 17 21:11:57 archlinux-steamdeck kernel: hid-steam 0003:28DE:1205.0001: =
input,hidraw0: USB HID v1.11 Keyboard [Valve Software Steam Deck Controller=
] on usb-0000:04:00.4-3/input0
Dec 17 21:11:57 archlinux-steamdeck kernel: input: Valve Software Steam Dec=
k Controller as /devices/pci0000:00/0000:00:08.1/0000:04:00.4/usb3/3-3/3-3:=
1.1/0003:28DE:1205.0002/input/input8
Dec 17 21:11:57 archlinux-steamdeck kernel: hid-steam 0003:28DE:1205.0002: =
input,hidraw1: USB HID v1.11 Mouse [Valve Software Steam Deck Controller] o=
n usb-0000:04:00.4-3/input1
Dec 17 21:11:57 archlinux-steamdeck kernel: hid-steam 0003:28DE:1205.0003: =
hiddev96: USB HID v1.11 Device [Valve Software Steam Deck Controller] on us=
b-0000:04:00.4-3/input2
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: SM=
U is initialized successfully!
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] Seamless boot condition c=
heck passed
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] Display Core v3.2.301 ini=
tialized on DCN 3.0.1
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] DP-HDMI FRL PCON supported
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] DMUB hardware initialized=
: version=3D0x0300000A
Dec 17 21:11:57 archlinux-steamdeck kernel: hid-steam 0003:28DE:1205.0003: =
Steam Controller 'FVAA21201907' connected
Dec 17 21:11:57 archlinux-steamdeck kernel: input: Steam Deck as /devices/p=
ci0000:00/0000:00:08.1/0000:04:00.4/usb3/3-3/3-3:1.2/0003:28DE:1205.0003/in=
put/input9
Dec 17 21:11:57 archlinux-steamdeck kernel: input: Steam Deck Motion Sensor=
s as /devices/pci0000:00/0000:00:08.1/0000:04:00.4/usb3/3-3/3-3:1.2/0003:28=
DE:1205.0003/input/input10
Dec 17 21:11:57 archlinux-steamdeck kernel: hid-steam 0003:28DE:1205.0004: =
hidraw2: USB HID v1.11 Device [Valve Software Steam Deck Controller] on usb=
-0000:04:00.4-3/input2
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] kiq ring mec 2 pipe 1 q 0
Dec 17 21:11:57 archlinux-steamdeck kernel: kfd kfd: amdgpu: Allocated 3969=
056 bytes on gart
Dec 17 21:11:57 archlinux-steamdeck kernel: kfd kfd: amdgpu: Total number o=
f KFD nodes to be created: 1
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu: Virtual CRAT table crea=
ted for GPU
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu: Topology: Add dGPU node=
 [0x163f:0x1002]
Dec 17 21:11:57 archlinux-steamdeck kernel: kfd kfd: amdgpu: added device 1=
002:163f
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: SE=
 1, SH per SE 1, CU per SH 8, active_cu_number 8
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng gfx_0.0.0 uses VM inv eng 0 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng gfx_0.1.0 uses VM inv eng 1 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng comp_1.0.0 uses VM inv eng 4 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng comp_1.1.0 uses VM inv eng 5 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng comp_1.2.0 uses VM inv eng 6 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng comp_1.3.0 uses VM inv eng 7 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng comp_1.0.1 uses VM inv eng 8 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng comp_1.1.1 uses VM inv eng 9 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng comp_1.2.1 uses VM inv eng 10 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng comp_1.3.1 uses VM inv eng 11 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng kiq_0.2.1.0 uses VM inv eng 12 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng sdma0 uses VM inv eng 13 on hub 0
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng vcn_dec_0 uses VM inv eng 0 on hub 8
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng vcn_enc_0.0 uses VM inv eng 1 on hub 8
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng vcn_enc_0.1 uses VM inv eng 4 on hub 8
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: ri=
ng jpeg_dec uses VM inv eng 5 on hub 8
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: amdgpu: Ru=
ntime PM not available
Dec 17 21:11:57 archlinux-steamdeck kernel: [drm] Initialized amdgpu 3.59.0=
 for 0000:04:00.0 on minor 1
Dec 17 21:11:57 archlinux-steamdeck kernel: fbcon: amdgpudrmfb (fb0) is pri=
mary device
Dec 17 21:11:57 archlinux-steamdeck kernel: fbcon: Deferring console take-o=
ver
Dec 17 21:11:57 archlinux-steamdeck kernel: amdgpu 0000:04:00.0: [drm] fb0:=
 amdgpudrmfb frame buffer device
Dec 17 21:11:57 archlinux-steamdeck kernel: BTRFS: device fsid b7c7e656-fda=
d-4a9c-bf62-5226971802ce devid 1 transid 3244 /dev/mmcblk0p2 (179:2) scanne=
d by mount (283)
Dec 17 21:11:57 archlinux-steamdeck kernel: BTRFS info (device mmcblk0p2): =
first mount of filesystem b7c7e656-fdad-4a9c-bf62-5226971802ce
Dec 17 21:11:57 archlinux-steamdeck kernel: BTRFS info (device mmcblk0p2): =
using crc32c (crc32c-intel) checksum algorithm
Dec 17 21:11:57 archlinux-steamdeck kernel: BTRFS info (device mmcblk0p2): =
using free-space-tree
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: systemd 257-1-arch running =
in system mode (+PAM +AUDIT -SELINUX -APPARMOR -IMA +IPE +SMACK +SECCOMP +G=
CRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC =
+KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P1=
1KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCO=
MMON +UTMP -SYSVINIT +LIBARCHIVE)
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Detected architecture x86-6=
4.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Hostname set to <archlinux-=
steamdeck>.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: bpf-restrict-fs: LSM BPF pr=
ogram attached
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Queued start job for defaul=
t target Graphical Interface.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Created slice Slice /system=
/dirmngr.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Created slice Slice /system=
/getty.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Created slice Slice /system=
/gpg-agent.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Created slice Slice /system=
/gpg-agent-browser.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Created slice Slice /system=
/gpg-agent-extra.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Created slice Slice /system=
/gpg-agent-ssh.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Created slice Slice /system=
/keyboxd.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Created slice Slice /system=
/modprobe.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Created slice User and Sess=
ion Slice.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Started Dispatch Password R=
equests to Console Directory Watch.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Started Forward Password Re=
quests to Wall Directory Watch.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Set up automount Arbitrary =
Executable File Formats File System Automount Point.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Expecting device /dev/mmcbl=
k0p1...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Reached target Local Encryp=
ted Volumes.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Reached target Login Prompt=
s.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Reached target Local Integr=
ity Protected Volumes.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Reached target Path Units.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Reached target Remote File =
Systems.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Reached target Slice Units.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Reached target Local Verity=
 Protected Volumes.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Listening on Device-mapper =
event daemon FIFOs.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Listening on Process Core D=
ump Socket.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Listening on Credential Enc=
ryption/Decryption.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Listening on Journal Socket=
 (/dev/log).
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Listening on Journal Socket=
s.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: TPM PCR Measurements was sk=
ipped because of an unmet condition check (ConditionSecurity=3Dmeasured-uki=
).
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Make TPM PCR Policy was ski=
pped because of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Listening on udev Control S=
ocket.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Listening on udev Kernel So=
cket.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Listening on User Database =
Manager Socket.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounting Huge Pages File Sy=
stem...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounting POSIX Message Queu=
e File System...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounting Kernel Debug File =
System...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounting Kernel Trace File =
System...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Create List of Sta=
tic Device Nodes...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Load Kernel Module=
 configfs...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Load Kernel Module=
 dm_mod...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Load Kernel Module=
 drm...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Load Kernel Module=
 fuse...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Load Kernel Module=
 loop...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Clear Stale Hibernate Stora=
ge Info was skipped because of an unmet condition check (ConditionPathExist=
s=3D/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d8=
76050dc67).
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Journal Service...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Load Kernel Module=
s...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: TPM PCR Machine ID Measurem=
ent was skipped because of an unmet condition check (ConditionSecurity=3Dme=
asured-uki).
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Remount Root and K=
ernel File Systems...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Early TPM SRK Setup was ski=
pped because of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Load udev Rules fr=
om Credentials...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Coldplug All udev =
Devices...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounted Huge Pages File Sys=
tem.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounted POSIX Message Queue=
 File System.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounted Kernel Debug File S=
ystem.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounted Kernel Trace File S=
ystem.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Finished Create List of Sta=
tic Device Nodes.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: modprobe@configfs.service: =
Deactivated successfully.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Finished Load Kernel Module=
 configfs.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: modprobe@drm.service: Deact=
ivated successfully.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Finished Load Kernel Module=
 drm.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: modprobe@fuse.service: Deac=
tivated successfully.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Finished Load Kernel Module=
 fuse.
Dec 17 21:11:57 archlinux-steamdeck kernel: loop: module loaded
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounting FUSE Control File =
System...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounting Kernel Configurati=
on File System...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Create Static Devi=
ce Nodes in /dev gracefully...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: modprobe@loop.service: Deac=
tivated successfully.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Finished Load Kernel Module=
 loop.
Dec 17 21:11:57 archlinux-steamdeck kernel: device-mapper: uevent: version =
1.0.3
Dec 17 21:11:57 archlinux-steamdeck kernel: device-mapper: ioctl: 4.48.0-io=
ctl (2023-03-01) initialised: dm-devel@lists.linux.dev
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: modprobe@dm_mod.service: De=
activated successfully.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Finished Load Kernel Module=
 dm_mod.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Repartition Root Disk was s=
kipped because no trigger condition checks were met.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounted FUSE Control File S=
ystem.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Mounted Kernel Configuratio=
n File System.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Finished Load udev Rules fr=
om Credentials.
Dec 17 21:11:57 archlinux-steamdeck systemd-journald[342]: Collecting audit=
 messages is disabled.
Dec 17 21:11:57 archlinux-steamdeck kernel: i2c_dev: i2c /dev entries driver
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Finished Load Kernel Module=
s.
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting Apply Kernel Varia=
bles...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Starting User Database Mana=
ger...
Dec 17 21:11:57 archlinux-steamdeck systemd[1]: Started Journal Service.
Dec 17 21:11:58 archlinux-steamdeck systemd-journald[342]: Received client =
request to flush runtime journal.
Dec 17 21:11:58 archlinux-steamdeck kernel: Adding 16777212k swap on /swap/=
swapfile.  Priority:-2 extents:2 across:17017632k SS
Dec 17 21:11:58 archlinux-steamdeck kernel: AMDI0020:00: ttyS4 at MMIO 0xfe=
dc9000 (irq =3D 3, base_baud =3D 3000000) is a 16550A
Dec 17 21:11:58 archlinux-steamdeck kernel: piix4_smbus 0000:00:14.0: SMBus=
 Host Controller at 0xb00, revision 0
Dec 17 21:11:58 archlinux-steamdeck kernel: piix4_smbus 0000:00:14.0: Using=
 register 0x02 for SMBus port selection
Dec 17 21:11:58 archlinux-steamdeck kernel: piix4_smbus 0000:00:14.0: Auxil=
iary SMBus Host Controller at 0xb20
Dec 17 21:11:58 archlinux-steamdeck kernel: i2c i2c-10: Successfully instan=
tiated SPD at 0x50
Dec 17 21:11:58 archlinux-steamdeck kernel: i2c i2c-10: Successfully instan=
tiated SPD at 0x51
Dec 17 21:11:58 archlinux-steamdeck kernel: opt3001 i2c-PRP0001:00: failed =
to read register 7e
Dec 17 21:11:58 archlinux-steamdeck kernel: i2c i2c-10: Successfully instan=
tiated SPD at 0x52
Dec 17 21:11:58 archlinux-steamdeck kernel: i2c i2c-10: Successfully instan=
tiated SPD at 0x53
Dec 17 21:11:58 archlinux-steamdeck kernel: opt3001 i2c-PRP0001:00: probe w=
ith driver opt3001 failed with error -121
Dec 17 21:11:58 archlinux-steamdeck kernel: i2c_designware AMDI0010:00: i2c=
_dw_handle_tx_abort: lost arbitration
Dec 17 21:11:58 archlinux-steamdeck kernel: ccp 0000:04:00.2: enabling devi=
ce (0000 -> 0002)
Dec 17 21:11:58 archlinux-steamdeck kernel: ccp 0000:04:00.2: tee enabled
Dec 17 21:11:58 archlinux-steamdeck kernel: ccp 0000:04:00.2: psp enabled
Dec 17 21:11:58 archlinux-steamdeck kernel: input: PC Speaker as /devices/p=
latform/pcspkr/input/input11
Dec 17 21:11:58 archlinux-steamdeck kernel: mousedev: PS/2 mouse device com=
mon for all mice
Dec 17 21:11:58 archlinux-steamdeck kernel: input: FTS3528:00 2808:1015 Tou=
chscreen as /devices/platform/AMDI0010:01/i2c-1/i2c-FTS3528:00/0018:2808:10=
15.0005/input/input12
Dec 17 21:11:58 archlinux-steamdeck kernel: input: FTS3528:00 2808:1015 as =
/devices/platform/AMDI0010:01/i2c-1/i2c-FTS3528:00/0018:2808:1015.0005/inpu=
t/input14
Dec 17 21:11:58 archlinux-steamdeck kernel: hid-generic 0018:2808:1015.0005=
: input,hidraw3: I2C HID v1.00 Device [FTS3528:00 2808:1015] on i2c-FTS3528=
:00
Dec 17 21:11:58 archlinux-steamdeck kernel: cfg80211: Loading compiled-in X=
=2E509 certificates for regulatory database
Dec 17 21:11:58 archlinux-steamdeck kernel: Loaded X.509 cert 'sforshee: 00=
b28ddf47aef9cea7'
Dec 17 21:11:58 archlinux-steamdeck kernel: Loaded X.509 cert 'wens: 61c038=
651aabdcf94bd0ac7ff06c7248db18c600'
Dec 17 21:11:58 archlinux-steamdeck kernel: sp5100_tco: SP5100/SB800 TCO Wa=
tchDog Timer Driver
Dec 17 21:11:58 archlinux-steamdeck kernel: sp5100-tco sp5100-tco: Using 0x=
fed80b00 for watchdog MMIO address
Dec 17 21:11:58 archlinux-steamdeck kernel: sp5100-tco sp5100-tco: initiali=
zed. heartbeat=3D60 sec (nowayout=3D0)
Dec 17 21:11:58 archlinux-steamdeck kernel: platform regulatory.0: Direct f=
irmware load for regulatory.db failed with error -2
Dec 17 21:11:58 archlinux-steamdeck kernel: cfg80211: failed to load regula=
tory.db
Dec 17 21:11:58 archlinux-steamdeck kernel: Bluetooth: Core ver 2.22
Dec 17 21:11:58 archlinux-steamdeck kernel: NET: Registered PF_BLUETOOTH pr=
otocol family
Dec 17 21:11:58 archlinux-steamdeck kernel: Bluetooth: HCI device and conne=
ction manager initialized
Dec 17 21:11:58 archlinux-steamdeck kernel: Bluetooth: HCI socket layer ini=
tialized
Dec 17 21:11:58 archlinux-steamdeck kernel: Bluetooth: L2CAP socket layer i=
nitialized
Dec 17 21:11:58 archlinux-steamdeck kernel: Bluetooth: SCO socket layer ini=
tialized
Dec 17 21:11:58 archlinux-steamdeck kernel: RAPL PMU: API unit is 2^-32 Jou=
les, 1 fixed counters, 163840 ms ovfl timer
Dec 17 21:11:58 archlinux-steamdeck kernel: RAPL PMU: hw unit of domain pac=
kage 2^-16 Joules
Dec 17 21:11:58 archlinux-steamdeck kernel: snd_pci_acp5x 0000:04:00.5: ena=
bling device (0000 -> 0002)
Dec 17 21:11:58 archlinux-steamdeck kernel: cryptd: max_cpu_qlen set to 1000
Dec 17 21:11:58 archlinux-steamdeck kernel: cdc_acm 3-3:1.3: ttyACM0: USB A=
CM device
Dec 17 21:11:58 archlinux-steamdeck kernel: usbcore: registered new interfa=
ce driver cdc_acm
Dec 17 21:11:58 archlinux-steamdeck kernel: cdc_acm: USB Abstract Control M=
odel driver for USB modems and ISDN adapters
Dec 17 21:11:59 archlinux-steamdeck kernel: AES CTR mode by8 optimization e=
nabled
Dec 17 21:11:59 archlinux-steamdeck kernel: FAT-fs (mmcblk0p1): Volume was =
not properly unmounted. Some data may be corrupt. Please run fsck.
Dec 17 21:11:59 archlinux-steamdeck kernel: usbcore: registered new interfa=
ce driver btusb
Dec 17 21:11:59 archlinux-steamdeck kernel: Bluetooth: hci0: RTL: examining=
 hci_ver=3D0a hci_rev=3D000c lmp_ver=3D0a lmp_subver=3D8822
Dec 17 21:11:59 archlinux-steamdeck kernel: Bluetooth: hci0: RTL: rom_versi=
on status=3D0 version=3D3
Dec 17 21:11:59 archlinux-steamdeck kernel: Bluetooth: hci0: RTL: loading r=
tl_bt/rtl8822cu_fw.bin
Dec 17 21:11:59 archlinux-steamdeck kernel: Bluetooth: hci0: RTL: loading r=
tl_bt/rtl8822cu_config.bin
Dec 17 21:11:59 archlinux-steamdeck kernel: Bluetooth: hci0: RTL: cfg_sz 6,=
 total sz 37346
Dec 17 21:11:59 archlinux-steamdeck kernel: rtw_8822ce 0000:03:00.0: enabli=
ng device (0000 -> 0003)
Dec 17 21:11:59 archlinux-steamdeck kernel: snd_hda_intel 0000:04:00.1: ena=
bling device (0000 -> 0002)
Dec 17 21:11:59 archlinux-steamdeck kernel: snd_hda_intel 0000:04:00.1: Han=
dle vga_switcheroo audio client
Dec 17 21:11:59 archlinux-steamdeck kernel: rtw_8822ce 0000:03:00.0: WOW Fi=
rmware version 9.9.4, H2C version 15
Dec 17 21:11:59 archlinux-steamdeck kernel: rtw_8822ce 0000:03:00.0: Firmwa=
re version 9.9.15, H2C version 15
Dec 17 21:11:59 archlinux-steamdeck kernel: snd_hda_intel 0000:04:00.1: bou=
nd 0000:04:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
Dec 17 21:11:59 archlinux-steamdeck kernel: input: HD-Audio Generic HDMI/DP=
,pcm=3D3 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input=
15
Dec 17 21:11:59 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:00: supply =
VA not found, using dummy regulator
Dec 17 21:11:59 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:00: supply =
VP not found, using dummy regulator
Dec 17 21:11:59 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:00: Cirrus =
Logic CS35L41 (35a40), Revision: B2
Dec 17 21:11:59 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:01: supply =
VA not found, using dummy regulator
Dec 17 21:11:59 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:01: supply =
VP not found, using dummy regulator
Dec 17 21:11:59 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:01: Reset l=
ine busy, assuming shared reset
Dec 17 21:11:59 archlinux-steamdeck kernel: rtw_8822ce 0000:03:00.0 wlo1: r=
enamed from wlan0
Dec 17 21:11:59 archlinux-steamdeck kernel: input: HD-Audio Generic HDMI/DP=
,pcm=3D7 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input=
16
Dec 17 21:11:59 archlinux-steamdeck kernel: input: HD-Audio Generic HDMI/DP=
,pcm=3D8 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input=
17
Dec 17 21:11:59 archlinux-steamdeck kernel: input: HD-Audio Generic HDMI/DP=
,pcm=3D9 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input=
18
Dec 17 21:11:59 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:01: Cirrus =
Logic CS35L41 (35a40), Revision: B2
Dec 17 21:11:59 archlinux-steamdeck kernel: input: FTS3528:00 2808:1015 as =
/devices/platform/AMDI0010:01/i2c-1/i2c-FTS3528:00/0018:2808:1015.0005/inpu=
t/input19
Dec 17 21:11:59 archlinux-steamdeck kernel: input: FTS3528:00 2808:1015 UNK=
NOWN as /devices/platform/AMDI0010:01/i2c-1/i2c-FTS3528:00/0018:2808:1015.0=
005/input/input21
Dec 17 21:11:59 archlinux-steamdeck kernel: hid-multitouch 0018:2808:1015.0=
005: input,hidraw3: I2C HID v1.00 Device [FTS3528:00 2808:1015] on i2c-FTS3=
528:00
Dec 17 21:11:59 archlinux-steamdeck kernel: kvm_amd: TSC scaling supported
Dec 17 21:11:59 archlinux-steamdeck kernel: kvm_amd: Nested Virtualization =
enabled
Dec 17 21:11:59 archlinux-steamdeck kernel: kvm_amd: Nested Paging enabled
Dec 17 21:11:59 archlinux-steamdeck kernel: kvm_amd: LBR virtualization sup=
ported
Dec 17 21:11:59 archlinux-steamdeck kernel: kvm_amd: SEV enabled (ASIDs 1 -=
 14)
Dec 17 21:11:59 archlinux-steamdeck kernel: kvm_amd: SEV-ES disabled (ASIDs=
 0 - 0)
Dec 17 21:11:59 archlinux-steamdeck kernel: kvm_amd: Virtual VMLOAD VMSAVE =
supported
Dec 17 21:11:59 archlinux-steamdeck kernel: kvm_amd: Virtual GIF supported
Dec 17 21:11:59 archlinux-steamdeck kernel: intel_rapl_common: Found RAPL d=
omain package
Dec 17 21:11:59 archlinux-steamdeck kernel: intel_rapl_common: Found RAPL d=
omain core
Dec 17 21:11:59 archlinux-steamdeck kernel: acp5x_mach acp5x_mach.0: ASoC: =
CPU DAI acp5x_i2s_playcap.1 not registered
Dec 17 21:11:59 archlinux-steamdeck kernel: input: acp5x Headset Jack as /d=
evices/pci0000:00/0000:00:08.1/0000:04:00.5/acp5x_mach.0/sound/card1/input22
Dec 17 21:11:59 archlinux-steamdeck kernel: Bluetooth: hci0: RTL: fw versio=
n 0xaed66dcb
Dec 17 21:11:59 archlinux-steamdeck kernel: Bluetooth: hci0: AOSP extension=
s version v1.00
Dec 17 21:11:59 archlinux-steamdeck kernel: Bluetooth: hci0: AOSP quality r=
eport is supported
Dec 17 21:12:00 archlinux-steamdeck kernel: Bluetooth: BNEP (Ethernet Emula=
tion) ver 1.3
Dec 17 21:12:00 archlinux-steamdeck kernel: Bluetooth: BNEP filters: protoc=
ol multicast
Dec 17 21:12:00 archlinux-steamdeck kernel: Bluetooth: BNEP socket layer in=
itialized
Dec 17 21:12:00 archlinux-steamdeck kernel: Bluetooth: MGMT ver 1.23
Dec 17 21:12:00 archlinux-steamdeck kernel: NET: Registered PF_ALG protocol=
 family
Dec 17 21:12:02 archlinux-steamdeck kernel: [drm] pre_validate_dsc:1589 MST=
_DSC dsc precompute is not needed
Dec 17 21:12:11 archlinux-steamdeck kernel: [drm] Failed to add display top=
ology, DTM TA is not initialized.
Dec 17 21:12:11 archlinux-steamdeck kernel: warning: `QSampleCache::L' uses=
 wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80=
211
Dec 17 21:12:11 archlinux-steamdeck kernel: Bluetooth: RFCOMM TTY layer ini=
tialized
Dec 17 21:12:11 archlinux-steamdeck kernel: Bluetooth: RFCOMM socket layer =
initialized
Dec 17 21:12:11 archlinux-steamdeck kernel: Bluetooth: RFCOMM ver 1.11
Dec 17 21:12:11 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:00: DSP1: c=
irrus/cs35l41-dsp1-spk-prot.wmfw: format 3 timestamp 0x62b5c26c
Dec 17 21:12:11 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:00: DSP1: c=
irrus/cs35l41-dsp1-spk-prot.wmfw: Fri 24 Jun 2022 14:55:56 GMT Daylight Time
Dec 17 21:12:11 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:00: DSP1: F=
irmware: 400a4 vendor: 0x2 v0.58.0, 2 algorithms
Dec 17 21:12:11 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:00: DSP1: c=
irrus/cs35l41-dsp1-spk-prot.bin: v0.58.0
Dec 17 21:12:11 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:00: DSP1: P=
rotection: e:\workspace\workspace\tibranch_release_playback_6.76_2\ormis\st=
aging\default_tunings\internal\CS35L
Dec 17 21:12:11 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: c=
irrus/cs35l41-dsp1-spk-prot.wmfw: format 3 timestamp 0x62b5c26c
Dec 17 21:12:11 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: c=
irrus/cs35l41-dsp1-spk-prot.wmfw: Fri 24 Jun 2022 14:55:56 GMT Daylight Time
Dec 17 21:12:12 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: F=
irmware: 400a4 vendor: 0x2 v0.58.0, 2 algorithms
Dec 17 21:12:12 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: c=
irrus/cs35l41-dsp1-spk-prot.bin: v0.58.0
Dec 17 21:12:12 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: P=
rotection: e:\workspace\workspace\tibranch_release_playback_6.76_2\ormis\st=
aging\default_tunings\internal\CS35L
Dec 17 21:12:15 archlinux-steamdeck kernel: wlo1: authenticate with 60:b5:8=
d:41:97:29 (local address=3D90:e8:68:74:6c:d1)
Dec 17 21:12:15 archlinux-steamdeck kernel: wlo1: send auth to 60:b5:8d:41:=
97:29 (try 1/3)
Dec 17 21:12:15 archlinux-steamdeck kernel: wlo1: send auth to 60:b5:8d:41:=
97:29 (try 2/3)
Dec 17 21:12:15 archlinux-steamdeck kernel: wlo1: send auth to 60:b5:8d:41:=
97:29 (try 3/3)
Dec 17 21:12:15 archlinux-steamdeck kernel: wlo1: authenticate with 60:b5:8=
d:41:97:29 (local address=3D90:e8:68:74:6c:d1)
Dec 17 21:12:15 archlinux-steamdeck kernel: wlo1: send auth to 60:b5:8d:41:=
97:29 (try 1/3)
Dec 17 21:12:15 archlinux-steamdeck kernel: wlo1: authenticated
Dec 17 21:12:15 archlinux-steamdeck kernel: wlo1: associate with 60:b5:8d:4=
1:97:29 (try 1/3)
Dec 17 21:12:15 archlinux-steamdeck kernel: wlo1: RX AssocResp from 60:b5:8=
d:41:97:29 (capab=3D0x1431 status=3D0 aid=3D3)
Dec 17 21:12:15 archlinux-steamdeck kernel: wlo1: associated
Dec 17 21:12:15 archlinux-steamdeck kernel: wlo1: Limiting TX power to 20 (=
20 - 0) dBm as advertised by 60:b5:8d:41:97:29
Dec 17 21:12:19 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:00: DSP1: L=
egacy support not available
Dec 17 21:12:19 archlinux-steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: L=
egacy support not available
Dec 17 21:12:25 archlinux-steamdeck kernel: wlo1: deauthenticating from 60:=
b5:8d:41:97:29 by local choice (Reason: 3=3DDEAUTH_LEAVING)
Dec 17 21:12:30 archlinux-steamdeck kernel: wlo1: authenticate with fa:48:b=
8:9b:59:04 (local address=3D90:e8:68:74:6c:d1)
Dec 17 21:12:30 archlinux-steamdeck kernel: wlo1: send auth to fa:48:b8:9b:=
59:04 (try 1/3)
Dec 17 21:12:30 archlinux-steamdeck kernel: wlo1: authenticate with fa:48:b=
8:9b:59:04 (local address=3D90:e8:68:74:6c:d1)
Dec 17 21:12:30 archlinux-steamdeck kernel: wlo1: send auth to fa:48:b8:9b:=
59:04 (try 1/3)
Dec 17 21:12:30 archlinux-steamdeck kernel: wlo1: authenticated
Dec 17 21:12:30 archlinux-steamdeck kernel: wlo1: associate with fa:48:b8:9=
b:59:04 (try 1/3)
Dec 17 21:12:30 archlinux-steamdeck kernel: wlo1: RX AssocResp from fa:48:b=
8:9b:59:04 (capab=3D0x1431 status=3D0 aid=3D4)
Dec 17 21:12:30 archlinux-steamdeck kernel: wlo1: associated
Dec 17 21:12:30 archlinux-steamdeck kernel: wlo1: Limiting TX power to 20 (=
20 - 0) dBm as advertised by fa:48:b8:9b:59:04
Dec 17 21:14:32 archlinux-steamdeck kernel: zsh[1439]: segfault at 55f6c9e8=
ad21 ip 000055f3780b1107 sp 00007ffcef3fa520 error 4 in zsh[5c107,55f378065=
000+b5000] likely on CPU 2 (core 1, socket 0)
Dec 17 21:14:32 archlinux-steamdeck kernel: Code: 53 48 8b 3f 48 85 ff 75 2=
1 eb 67 0f 1f 84 00 00 00 00 00 45 85 e4 74 7b 48 89 df ff 15 42 5a 08 00 4=
8 8b 7d 00 48 85 ff 74 48 <48> 8b 07 48 8b 5f 10 48 89 45 00 48 85 c0 74 29=
 48 89 68 08 ff 15
Dec 17 21:15:02 archlinux-steamdeck kernel: ------------[ cut here ]-------=
-----
Dec 17 21:15:02 archlinux-steamdeck kernel: workqueue: WQ_MEM_RECLAIM sdma0=
:drm_sched_run_job_work [gpu_sched] is flushing !WQ_MEM_RECLAIM events:amdg=
pu_device_delay_enable_gfx_off [amdgpu]
Dec 17 21:15:02 archlinux-steamdeck kernel: WARNING: CPU: 4 PID: 436 at ker=
nel/workqueue.c:3704 check_flush_dependency+0xfc/0x120
Dec 17 21:15:02 archlinux-steamdeck kernel: Modules linked in: ccm rfcomm s=
nd_seq_dummy snd_hrtimer snd_seq snd_seq_device cmac algif_hash algif_skcip=
her af_alg bnep intel_rapl_msr snd_soc_acp5x_mach intel_rapl_common snd_acp=
5x_i2s snd_acp5x_pcm_dma snd_sof_amd_acp70 snd_sof_amd_acp63 snd_soc_acpi_a=
md_match snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_s=
of_amd_acp snd_sof_pci kvm_amd snd_sof_xtensa_dsp snd_sof snd_sof_utils kvm=
 snd_pci_ps snd_soc_cs35l41_spi snd_amd_sdw_acpi soundwire_amd snd_soc_cs35=
l41 soundwire_generic_allocation snd_hda_codec_hdmi snd_soc_wm_adsp crct10d=
if_pclmul soundwire_bus crc32_pclmul snd_hda_intel rtw88_8822ce snd_soc_cs3=
5l41_lib polyval_clmulni snd_soc_nau8821 cs_dsp btusb polyval_generic rtw88=
_8822c snd_rpl_pci_acp6x ghash_clmulni_intel snd_intel_dspcfg rtw88_pci sha=
512_ssse3 snd_intel_sdw_acpi btrtl sha1_ssse3 snd_acp_pci snd_soc_core rtw8=
8_core snd_hda_codec aesni_intel snd_acp_legacy_common btintel vfat snd_com=
press hid_multitouch spd5118 fat gf128mul snd_hda_core crypto_simd snd_pci_=
acp6x btbcm
Dec 17 21:15:02 archlinux-steamdeck kernel:  ac97_bus snd_hwdep btmtk crypt=
d snd_pci_acp5x cdc_acm snd_pcm_dmaengine mac80211 rapl snd_rn_pci_acp3x wd=
at_wdt snd_pcm bluetooth snd_acp_config sp5100_tco libarc4 snd_timer snd_so=
c_acpi joydev mousedev cfg80211 pcspkr snd rfkill ccp snd_pci_acp3x soundco=
re ltrf216a opt3001 i2c_piix4 i2c_hid_acpi i2c_hid industrialio 8250_dw mac=
_hid i2c_smbus i2c_dev crypto_user dm_mod loop nfnetlink ip_tables x_tables=
 hid_steam ff_memless hid_generic mmc_block rpmb_core usbhid amdgpu btrfs b=
lake2b_generic crc16 libcrc32c amdxcp crc32c_generic i2c_algo_bit xor drm_t=
tm_helper raid6_pq ttm serio_raw drm_exec atkbd gpu_sched libps2 sdhci_pci =
drm_suballoc_helper vivaldi_fmap cqhci nvme crc32c_intel drm_buddy sdhci sh=
a256_ssse3 drm_display_helper nvme_core cec mmc_core i8042 video nvme_auth =
serio wmi spi_amd
Dec 17 21:15:02 archlinux-steamdeck kernel: CPU: 4 UID: 0 PID: 436 Comm: kw=
orker/u32:4 Not tainted 6.12.6-rc1-1home #1 c49ee701ad1a1a28c82c80281ff6159=
df069d19b
Dec 17 21:15:02 archlinux-steamdeck kernel: Hardware name: Valve Jupiter/Ju=
piter, BIOS F7A0131 01/30/2024
Dec 17 21:15:02 archlinux-steamdeck kernel: Workqueue: sdma0 drm_sched_run_=
job_work [gpu_sched]
Dec 17 21:15:02 archlinux-steamdeck kernel: RIP: 0010:check_flush_dependenc=
y+0xfc/0x120
Dec 17 21:15:02 archlinux-steamdeck kernel: Code: 8b 45 18 48 8d b2 c0 00 0=
0 00 49 89 e8 48 8d 8b c0 00 00 00 48 c7 c7 e0 a1 ae a8 c6 05 29 03 16 02 0=
1 48 89 c2 e8 04 8e fd ff <0f> 0b e9 1f ff ff ff 80 3d 14 03 16 02 00 75 93=
 e9 4a ff ff ff 66
Dec 17 21:15:02 archlinux-steamdeck kernel: RSP: 0018:ffffa65802707c60 EFLA=
GS: 00010082
Dec 17 21:15:02 archlinux-steamdeck kernel: RAX: 0000000000000000 RBX: ffff=
958c80050800 RCX: 0000000000000027
Dec 17 21:15:02 archlinux-steamdeck kernel: RDX: ffff958fb00218c8 RSI: 0000=
000000000001 RDI: ffff958fb00218c0
Dec 17 21:15:02 archlinux-steamdeck kernel: RBP: ffffffffc0a2eb00 R08: 0000=
000000000000 R09: ffffa65802707ae0
Dec 17 21:15:02 archlinux-steamdeck kernel: R10: ffffffffa92b54e8 R11: 0000=
000000000003 R12: ffff958c899b3580
Dec 17 21:15:02 archlinux-steamdeck kernel: R13: ffff958c8cc71c00 R14: ffff=
a65802707c90 R15: 0000000000000001
Dec 17 21:15:02 archlinux-steamdeck kernel: FS:  0000000000000000(0000) GS:=
ffff958fb0000000(0000) knlGS:0000000000000000
Dec 17 21:15:02 archlinux-steamdeck kernel: CS:  0010 DS: 0000 ES: 0000 CR0=
: 0000000080050033
Dec 17 21:15:02 archlinux-steamdeck kernel: CR2: 00007f764c0d5000 CR3: 0000=
0001b6222000 CR4: 0000000000350ef0
Dec 17 21:15:02 archlinux-steamdeck kernel: Call Trace:
Dec 17 21:15:02 archlinux-steamdeck kernel:  <TASK>
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? check_flush_dependency+0xfc/=
0x120
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? __warn.cold+0x93/0xf6
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? check_flush_dependency+0xfc/=
0x120
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? report_bug+0xff/0x140
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? handle_bug+0x58/0x90
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? exc_invalid_op+0x17/0x70
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? asm_exc_invalid_op+0x1a/0x20
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? __pfx_amdgpu_device_delay_en=
able_gfx_off+0x10/0x10 [amdgpu 857aca8165f9b9ab3793f37419bdc9a45d24aff0]
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? check_flush_dependency+0xfc/=
0x120
Dec 17 21:15:02 archlinux-steamdeck kernel:  __flush_work+0x110/0x2c0
Dec 17 21:15:02 archlinux-steamdeck kernel:  cancel_delayed_work_sync+0x5e/=
0x80
Dec 17 21:15:02 archlinux-steamdeck kernel:  amdgpu_gfx_off_ctrl+0xad/0x140=
 [amdgpu 857aca8165f9b9ab3793f37419bdc9a45d24aff0]
Dec 17 21:15:02 archlinux-steamdeck kernel:  amdgpu_ring_alloc+0x43/0x60 [a=
mdgpu 857aca8165f9b9ab3793f37419bdc9a45d24aff0]
Dec 17 21:15:02 archlinux-steamdeck kernel:  amdgpu_ib_schedule+0xf0/0x730 =
[amdgpu 857aca8165f9b9ab3793f37419bdc9a45d24aff0]
Dec 17 21:15:02 archlinux-steamdeck kernel:  amdgpu_job_run+0x8c/0x170 [amd=
gpu 857aca8165f9b9ab3793f37419bdc9a45d24aff0]
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? mod_delayed_work_on+0xa4/0xb0
Dec 17 21:15:02 archlinux-steamdeck kernel:  drm_sched_run_job_work+0x25c/0=
x3f0 [gpu_sched da7f9c92395781c75e4ac0d605a4cf839a336d2f]
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? srso_return_thunk+0x5/0x5f
Dec 17 21:15:02 archlinux-steamdeck kernel:  process_one_work+0x17e/0x330
Dec 17 21:15:02 archlinux-steamdeck kernel:  worker_thread+0x2ce/0x3f0
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? __pfx_worker_thread+0x10/0x10
Dec 17 21:15:02 archlinux-steamdeck kernel:  kthread+0xd2/0x100
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? __pfx_kthread+0x10/0x10
Dec 17 21:15:02 archlinux-steamdeck kernel:  ret_from_fork+0x34/0x50
Dec 17 21:15:02 archlinux-steamdeck kernel:  ? __pfx_kthread+0x10/0x10
Dec 17 21:15:02 archlinux-steamdeck kernel:  ret_from_fork_asm+0x1a/0x30
Dec 17 21:15:02 archlinux-steamdeck kernel:  </TASK>
Dec 17 21:15:02 archlinux-steamdeck kernel: ---[ end trace 0000000000000000=
 ]---
Dec 17 21:18:36 archlinux-steamdeck kernel: wlo1: deauthenticating from fa:=
48:b8:9b:59:04 by local choice (Reason: 3=3DDEAUTH_LEAVING)
Dec 17 21:18:37 archlinux-steamdeck systemd-shutdown[1]: Syncing filesystem=
s and block devices.
Dec 17 21:18:38 archlinux-steamdeck systemd-shutdown[1]: Sending SIGTERM to=
 remaining processes...
Dec 17 21:18:38 archlinux-steamdeck systemd-journald[342]: Received SIGTERM=
 from PID 1 (systemd-shutdow).

--kvpfw5bx3oxql3cy--

--hx3kpyr4mtleg4zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmdiDKIACgkQwEfU8yi1
JYV0dA//dMzjWjfaN5rYjHj19VaKH8OyvU6OVgs1H9/x46tA3bNOBIWSXzACtdDc
NBBmRaEFjjEC20NmkU+noreYErpFR+O6VuVk7XmsW63HnevuB6IHUUrN2jBWr0iL
4TSPcfqpuS6eE8l1eCLVaR5rB83A+5Pt6uyKNs2mi1qZs3CxU9ldujQFHlmYx760
Zi0Nxhb+nRY4fMOpHsWDuHVuRT7aTk7t3bzpzt/ElvCool6EXzfZ+fk0h9DQohG2
X9gBULebfyEoEnShbP1MxrGOV3A8E7xw0nTFI46iMruSKZ+3InIBfnQaIgqL8wMx
iD8Wkm+Nurts4M2bLiV2OWvDs/K2RlsW5ZhxIL9ejeANW+LJqlmq5T+M+TMCNN8E
GgTgXB1lEY3ofQ5pHO64hujOGj0gIh11kS2eiFi4tYPw0K6zUIWFmg9AMWhr7Fya
Vv7cSu5Jc6fTAOB94WzVnx2dIAowjMnSkEvhd55Iq7TbjSP/ATtJ7zgpbggxOacA
3s+8yMkJ849e87TmL6GIgSIOQHw5MPzKcPYJSM+XimBS/dTQQ1DoPCc2Bb7PGu0I
XJb8LqaeE8dVthLl+dUN53Gr1MqOQ88PpqbQXJVQyvNzqdZ9NqDmIefEOfZYZRHW
YbH1xf6dL7Bv7atn+7y6hSLUhZJXybn98Jb+DtrjERpS/4wH0FA=
=M0Td
-----END PGP SIGNATURE-----

--hx3kpyr4mtleg4zb--
