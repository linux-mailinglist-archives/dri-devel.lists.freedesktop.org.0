Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C562F9B3F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5FE6E1CE;
	Mon, 18 Jan 2021 08:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDE56E1CE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 08:26:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F808B75A;
 Mon, 18 Jan 2021 08:26:05 +0000 (UTC)
Subject: Re: [BUG] DRM kernel NULL pointer dereference (linux-next 20210115)
To: Andy Lavr <andy.lavr@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Arnd Bergmann <arnd@arndb.de>
References: <8304b313-9610-08bb-589c-0daa8ff7bd6c@gmail.com>
 <9f067539-07b1-7aa6-3112-0eb25b1b606f@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7851c78c-8c57-3c84-cd49-a72703095a5d@suse.de>
Date: Mon, 18 Jan 2021 09:25:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9f067539-07b1-7aa6-3112-0eb25b1b606f@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0306459487=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0306459487==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HxZgVvF2yDnhvDejqbhL78QKVrDS9I5Ih"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HxZgVvF2yDnhvDejqbhL78QKVrDS9I5Ih
Content-Type: multipart/mixed; boundary="SpeQhFrPcsnJnvqgu4TnOsKwv35FF4sEs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andy Lavr <andy.lavr@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <7851c78c-8c57-3c84-cd49-a72703095a5d@suse.de>
Subject: Re: [BUG] DRM kernel NULL pointer dereference (linux-next 20210115)
References: <8304b313-9610-08bb-589c-0daa8ff7bd6c@gmail.com>
 <9f067539-07b1-7aa6-3112-0eb25b1b606f@gmail.com>
In-Reply-To: <9f067539-07b1-7aa6-3112-0eb25b1b606f@gmail.com>

--SpeQhFrPcsnJnvqgu4TnOsKwv35FF4sEs
Content-Type: multipart/mixed;
 boundary="------------603CB973D1A79439D759FDDC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------603CB973D1A79439D759FDDC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

(cc'ing dri-devel)

Hi

thanks for reporting the bug.

Am 17.01.21 um 12:12 schrieb Andy Lavr:
> Hey,
>=20
>=20
> You forgot to add these commits to linux-next:
>=20
>=20
>   drm: Move struct drm_device.pdev to legacy
>=20
> https://patchwork.kernel.org/project/intel-gfx/cover/20210107080748.476=
8-1-tzimmermann@suse.de/
>=20
>=20
> I committed these patches to my local tree and that solved my problem.
>=20
>=20
>   * v3,4/8] drm/i915: Remove references to struct drm_device.pdev
>     <https://patchwork.kernel.org/project/intel-gfx/patch/2021010708074=
8.4768-5-tzimmermann@suse.de/>
>   * [v3,5/8] drm/i915/gt: Remove references to struct drm_device.pdev
>     <https://patchwork.kernel.org/project/intel-gfx/patch/2021010708074=
8.4768-6-tzimmermann@suse.de/>
>   * [v3,6/8] drm/i915/gvt: Remove references to struct drm_device.pdev
>     <https://patchwork.kernel.org/project/intel-gfx/patch/2021010708074=
8.4768-7-tzimmermann@suse.de/>
>   * [v3,8/8] drm: Upcast struct drm_device.dev to struct pci_device;
>     replace pdev
>     <https://patchwork.kernel.org/project/intel-gfx/patch/2021010708074=
8.4768-9-tzimmermann@suse.de/>

These patches have not been merged yet as they have to wait for some=20
preparation in the i915 driver.

I reduced the final patch, so it should change the buggy code. Could you =

please apply only the attached patchfile and report if it fixes the issue=
?

Best regards
Thomas

>=20
>=20
>=20
> Thanks to all!
>=20
>=20
> 16.01.2021 15:17, Andy Lavr:
>>
>> Hey,
>>
>>
>> *linux-next 20210114 work fine.*
>>
>>
>> *linux-next 20210115:*
>>
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.185982] *BUG: kernel NULL=
 pointer=20
>> dereference, address: 0000000000000010*
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.186988] #PF: supervisor r=
ead access=20
>> in kernel mode
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.187984] #PF: error_code(0=
x0000) -=20
>> not-present page
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.189016] PGD 0 P4D 0
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.190508] Oops: 0000 [#1] S=
MP PTI
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.191814] CPU: 6 PID: 1319 =
Comm: Xorg=20
>> Not tainted 5.11.13-dragon-sandybridge #202101150001
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.192847] Hardware name: De=
ll Inc.=20
>> Precision M6600/04YY4M, BIOS A18 09/14/2018
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.193877] *RIP:=20
>> 0010:drm_pci_set_busid+0x1a/0x80 [drm]*
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.194950] Code: fc 06 f8 c8=
 00 00 00=20
>> 00 00 00 00 00 00 00 00 00 0f 1f 44 00 00 55 53 50 48 89 f3 31 d2 81=20
>> 3f 04 00 01 00 48 8b 87 78 01 00 00 <48> 8b 48 10 7c 09 48 8b 91 d0 01=
=20
>> 00 00 8b 12 0f b6 89 e0 01 00 00
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.196094] RSP: 0018:ffffaac=
f485afd38=20
>> EFLAGS: 00010246
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.197695] RAX: 000000000000=
0000 RBX:=20
>> ffff95f1684e5000 RCX: ffffffff8b06f380
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.198872] RDX: 000000000000=
0000 RSI:=20
>> ffff95f1684e5000 RDI: ffff95f175240010
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.200037] RBP: 00000000ffff=
ffea R08:=20
>> 000000000000e200 R09: 0000000000000001
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.201205] R10: ffff95f16de8=
8b00 R11:=20
>> ffffffffc03e1990 R12: ffff95f1684e5000
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.202383] R13: 00007fff8865=
e240 R14:=20
>> ffff95f1752400a8 R15: ffff95f175240010
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.203554] FS: 000070bcd696d=
a40(0000)=20
>> GS:ffff95f41db80000(0000) knlGS:0000000000000000
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.204742] CS:=C2=A0 0010 DS=
: 0000 ES: 0000=20
>> CR0: 0000000080050033
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.205936] CR2: 000000000000=
0010 CR3:=20
>> 0000000186c28006 CR4: 00000000000606e0
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.207144] Call Trace:
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.208370] drm_setversion+0x=
13e/0x170=20
>> [drm]
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.209596]=C2=A0 ? drm_getst=
ats+0x20/0x20 [drm]
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.210799] drm_ioctl_kernel+=
0xe2/0x150=20
>> [drm]
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.211989] drm_ioctl+0x30b/0=
x440 [drm]
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.213170]=C2=A0 ? drm_getst=
ats+0x20/0x20 [drm]
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.214351] amdgpu_drm_ioctl+=
0x44/0x80=20
>> [amdgpu]
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.215696] __se_sys_ioctl+0x=
78/0xc0
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.216848] do_syscall_64+0x3=
3/0x70
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.218002]=20
>> entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.219177] RIP: 0033:0x70bcd=
6dd931b
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.220654] Code: 89 d8 49 8d=
 3c 1c 48=20
>> f7 d8 49 39 c4 72 b5 e8 1c ff ff ff 85 c0 78 ba 4c 89 e0 5b 5d 41 5c=20
>> c3 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b=
=20
>> 0d 1d 3b 0d 00 f7 d8 64 89 01 48
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.222211] RSP: 002b:00007ff=
f8865e208=20
>> EFLAGS: 00000202 ORIG_RAX: 0000000000000010
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.223778] RAX: ffffffffffff=
ffda RBX:=20
>> 00007fff8865e240 RCX: 000070bcd6dd931b
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.225145] RDX: 00007fff8865=
e240 RSI:=20
>> 00000000c0106407 RDI: 000000000000000c
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.226420] RBP: 00000000c010=
6407 R08:=20
>> 0000000000000031 R09: 0000000000000000
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.227691] R10: 000070bcd785=
0ec0 R11:=20
>> 0000000000000202 R12: 00005b60f67cbb50
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.228954] R13: 000000000000=
000c R14:=20
>> 00005b60f67cbb90 R15: 0000000000000000
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.229231] iwlwifi 0000:03:0=
0.0: Radio=20
>> type=3D0x0-0x3-0x1
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.230218] Modules linked in=
: vfat fat=20
>> intel_rapl_msr hid_generic mei_hdcp at24 dell_rbtn iwldvm dell_laptop =

>> dell_smm_hwmon mac80211 intel_rapl_common libarc4 snd_hda_codec_idt=20
>> snd_hda_codec_generic x86_pkg_temp_thermal ledtrig_audio=20
>> intel_powerclamp snd_hda_codec_hdmi crct10dif_pclmul iwlwifi=20
>> crc32_pclmul ghash_clmulni_intel snd_hda_intel rapl snd_intel_dspcfg=20
>> usbhid intel_cstate firewire_ohci dell_wmi sdhci_pci hid snd_hda_codec=
=20
>> firewire_core dell_smbios crc_itu_t mei_me dcdbas cfg80211=20
>> sparse_keymap cqhci i2c_i801 sdhci snd_hda_core joydev e1000e=20
>> snd_hwdep wmi_bmof dell_wmi_descriptor i2c_smbus mei tpm_tis=20
>> tpm_tis_core tpm dell_smo8800 xt_hl ip6_tables ip6t_rt nf_log_ipv4=20
>> nf_log_common ipt_REJECT nf_reject_ipv4 xt_LOG nft_limit xt_limit=20
>> xt_addrtype xt_tcpudp sch_cake tcp_yeah tcp_vegas xt_conntrack=20
>> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_compat nft_counter=20
>> coretemp nf_tables nfnetlink parport_pc ppdev lp parport binfmt_misc=20
>> ip_tables x_tables xfs raid10 raid456
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.232152]=C2=A0 async_raid6=
_recov async_pq=20
>> async_xor async_memcpy async_tx raid1 raid0 multipath linear amdgpu=20
>> iommu_v2 gpu_sched drm_ttm_helper ttm i2c_algo_bit drm_kms_helper cec =

>> aesni_intel sysimgblt syscopyarea sysfillrect fb_sys_fops crypto_simd =

>> cryptd psmouse input_leds drm ahci serio_raw libahci wmi video mac_hid=

>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.242819] CR2: 000000000000=
0010
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.244502] ---[ end trace=20
>> 47eef7912dfa1ae6 ]---
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.494899] *RIP:=20
>> 0010:drm_pci_set_busid+0x1a/0x80 [drm]*
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.496577] Code: fc 06 f8 c8=
 00 00 00=20
>> 00 00 00 00 00 00 00 00 00 0f 1f 44 00 00 55 53 50 48 89 f3 31 d2 81=20
>> 3f 04 00 01 00 48 8b 87 78 01 00 00 <48> 8b 48 10 7c 09 48 8b 91 d0 01=
=20
>> 00 00 8b 12 0f b6 89 e0 01 00 00
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.498313] RSP: 0018:ffffaac=
f485afd38=20
>> EFLAGS: 00010246
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.500089] RAX: 000000000000=
0000 RBX:=20
>> ffff95f1684e5000 RCX: ffffffff8b06f380
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.501919] RDX: 000000000000=
0000 RSI:=20
>> ffff95f1684e5000 RDI: ffff95f175240010
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.503708] RBP: 00000000ffff=
ffea R08:=20
>> 000000000000e200 R09: 0000000000000001
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.505483] R10: ffff95f16de8=
8b00 R11:=20
>> ffffffffc03e1990 R12: ffff95f1684e5000
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.507276] R13: 00007fff8865=
e240 R14:=20
>> ffff95f1752400a8 R15: ffff95f175240010
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.509058] FS: 000070bcd696d=
a40(0000)=20
>> GS:ffff95f41db80000(0000) knlGS:0000000000000000
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.510866] CS:=C2=A0 0010 DS=
: 0000 ES: 0000=20
>> CR0: 0000000080050033
>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.512647] CR2: 000000000000=
0010 CR3:=20
>> 0000000186c28006 CR4: 00000000000606e0
>>
>>
>>
>> --=20
>> Best regards, Andy Lavr.
>>
>>   CONFIDENTIAL NOTE
>>
>>   This email (including any attachments) is intended only for the pers=
on or entity to which it is addressed
>>   and may contain confidential and/or privileged material.  Any review=
, retransmission, dissemination or other
>>   use of, or taking of any action in reliance upon, this information b=
y persons or entities other than the
>>   intended recipient is prohibited. If you received this in error, ple=
ase notify the sender immediately and
>>   delete the material completely from your system. E-mail communicatio=
n cannot be guaranteed to be reliable,
>>   secure, error-free or virus-free. Accordingly, we cannot accept liab=
ility for any damage sustained as a
>>   result of any virus, error or incompleteness of this e-mail or any f=
ailure to deliver promptly or at all
>>   information exchanged between you and us by this means. If you suspe=
ct that this e-mail may have been
>>   intercepted or amended, please contact the sender. Any views or opin=
ions expressed in this email are solely
>>   those of the author and do not necessarily represent those of our en=
tity or related/associated entities.
>=20
> --=20
> Best regards, Andy Lavr.
>=20
>   CONFIDENTIAL NOTE
>=20
>   This email (including any attachments) is intended only for the perso=
n or entity to which it is addressed
>   and may contain confidential and/or privileged material.  Any review,=
 retransmission, dissemination or other
>   use of, or taking of any action in reliance upon, this information by=
 persons or entities other than the
>   intended recipient is prohibited. If you received this in error, plea=
se notify the sender immediately and
>   delete the material completely from your system. E-mail communication=
 cannot be guaranteed to be reliable,
>   secure, error-free or virus-free. Accordingly, we cannot accept liabi=
lity for any damage sustained as a
>   result of any virus, error or incompleteness of this e-mail or any fa=
ilure to deliver promptly or at all
>   information exchanged between you and us by this means. If you suspec=
t that this e-mail may have been
>   intercepted or amended, please contact the sender. Any views or opini=
ons expressed in this email are solely
>   those of the author and do not necessarily represent those of our ent=
ity or related/associated entities.
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------603CB973D1A79439D759FDDC
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-Upcast-struct-drm_device.dev-to-struct-pci_devic.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-drm-Upcast-struct-drm_device.dev-to-struct-pci_devic.pa";
 filename*1="tch"

=46rom 26be85bf5d99c8e2a4e682af4dbff825b417ec02 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Sat, 7 Nov 2020 21:05:28 +0100
Subject: [PATCH] drm: Upcast struct drm_device.dev to struct pci_device;
 replace pdev

We have DRM drivers based on USB, SPI and platform devices. All of them
are fine with storing their device reference in struct drm_device.dev.
PCI devices should be no exception. Therefore struct drm_device.pdev is
deprecated.

Instead upcast from struct drm_device.dev with to_pci_dev(). PCI-specific=

code can use dev_is_pci() to test for a PCI device. This patch changes
the DRM core code and documentation accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_agpsupport.c |  9 ++++++---
 drivers/gpu/drm/drm_bufs.c       |  4 ++--
 drivers/gpu/drm/drm_edid.c       |  7 ++++++-
 drivers/gpu/drm/drm_irq.c        | 12 +++++++-----
 drivers/gpu/drm/drm_pci.c        | 26 +++++++++++++++-----------
 drivers/gpu/drm/drm_vm.c         |  2 +-
 6 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsu=
pport.c
index 8b690ef306de..7e765cb0efee 100644
--- a/drivers/gpu/drm/drm_agpsupport.c
+++ b/drivers/gpu/drm/drm_agpsupport.c
@@ -103,11 +103,13 @@ int drm_agp_info_ioctl(struct drm_device *dev, void=
 *data,
  */
 int drm_agp_acquire(struct drm_device *dev)
 {
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+
 	if (!dev->agp)
 		return -ENODEV;
 	if (dev->agp->acquired)
 		return -EBUSY;
-	dev->agp->bridge =3D agp_backend_acquire(dev->pdev);
+	dev->agp->bridge =3D agp_backend_acquire(pdev);
 	if (!dev->agp->bridge)
 		return -ENODEV;
 	dev->agp->acquired =3D 1;
@@ -402,14 +404,15 @@ int drm_agp_free_ioctl(struct drm_device *dev, void=
 *data,
  */
 struct drm_agp_head *drm_agp_init(struct drm_device *dev)
 {
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
 	struct drm_agp_head *head =3D NULL;
=20
 	head =3D kzalloc(sizeof(*head), GFP_KERNEL);
 	if (!head)
 		return NULL;
-	head->bridge =3D agp_find_bridge(dev->pdev);
+	head->bridge =3D agp_find_bridge(pdev);
 	if (!head->bridge) {
-		head->bridge =3D agp_backend_acquire(dev->pdev);
+		head->bridge =3D agp_backend_acquire(pdev);
 		if (!head->bridge) {
 			kfree(head);
 			return NULL;
diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index aeb1327e3077..e3d77dfefb0a 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -326,7 +326,7 @@ static int drm_addmap_core(struct drm_device *dev, re=
source_size_t offset,
 		 * As we're limiting the address to 2^32-1 (or less),
 		 * casting it down to 32 bits is no problem, but we
 		 * need to point to a 64bit variable first. */
-		map->handle =3D dma_alloc_coherent(&dev->pdev->dev,
+		map->handle =3D dma_alloc_coherent(dev->dev,
 						 map->size,
 						 &map->offset,
 						 GFP_KERNEL);
@@ -556,7 +556,7 @@ int drm_legacy_rmmap_locked(struct drm_device *dev, s=
truct drm_local_map *map)
 	case _DRM_SCATTER_GATHER:
 		break;
 	case _DRM_CONSISTENT:
-		dma_free_coherent(&dev->pdev->dev,
+		dma_free_coherent(dev->dev,
 				  map->size,
 				  map->handle,
 				  map->offset);
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 394cc55b3214..c2bbe7bee7b6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -32,6 +32,7 @@
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
=20
@@ -2075,9 +2076,13 @@ EXPORT_SYMBOL(drm_get_edid);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter)
 {
-	struct pci_dev *pdev =3D connector->dev->pdev;
+	struct drm_device *dev =3D connector->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
 	struct edid *edid;
=20
+	if (drm_WARN_ON_ONCE(dev, !dev_is_pci(dev->dev)))
+		return NULL;
+
 	vga_switcheroo_lock_ddc(pdev);
 	edid =3D drm_get_edid(connector, adapter);
 	vga_switcheroo_unlock_ddc(pdev);
diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 803af4bbd214..c3bd664ea733 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -122,7 +122,7 @@ int drm_irq_install(struct drm_device *dev, int irq)
 		dev->driver->irq_preinstall(dev);
=20
 	/* PCI devices require shared interrupts. */
-	if (dev->pdev)
+	if (dev_is_pci(dev->dev))
 		sh_flags =3D IRQF_SHARED;
=20
 	ret =3D request_irq(irq, dev->driver->irq_handler,
@@ -140,7 +140,7 @@ int drm_irq_install(struct drm_device *dev, int irq)
 	if (ret < 0) {
 		dev->irq_enabled =3D false;
 		if (drm_core_check_feature(dev, DRIVER_LEGACY))
-			vga_client_register(dev->pdev, NULL, NULL, NULL);
+			vga_client_register(to_pci_dev(dev->dev), NULL, NULL, NULL);
 		free_irq(irq, dev);
 	} else {
 		dev->irq =3D irq;
@@ -203,7 +203,7 @@ int drm_irq_uninstall(struct drm_device *dev)
 	DRM_DEBUG("irq=3D%d\n", dev->irq);
=20
 	if (drm_core_check_feature(dev, DRIVER_LEGACY))
-		vga_client_register(dev->pdev, NULL, NULL, NULL);
+		vga_client_register(to_pci_dev(dev->dev), NULL, NULL, NULL);
=20
 	if (dev->driver->irq_uninstall)
 		dev->driver->irq_uninstall(dev);
@@ -252,6 +252,7 @@ int drm_legacy_irq_control(struct drm_device *dev, vo=
id *data,
 {
 	struct drm_control *ctl =3D data;
 	int ret =3D 0, irq;
+	struct pci_dev *pdev;
=20
 	/* if we haven't irq we fallback for compatibility reasons -
 	 * this used to be a separate function in drm_dma.h
@@ -262,12 +263,13 @@ int drm_legacy_irq_control(struct drm_device *dev, =
void *data,
 	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return 0;
 	/* UMS was only ever supported on pci devices. */
-	if (WARN_ON(!dev->pdev))
+	if (WARN_ON(!dev_is_pci(dev->dev)))
 		return -EINVAL;
=20
 	switch (ctl->func) {
 	case DRM_INST_HANDLER:
-		irq =3D dev->pdev->irq;
+		pdev =3D to_pci_dev(dev->dev);
+		irq =3D pdev->irq;
=20
 		if (dev->if_version < DRM_IF_VERSION(1, 2) &&
 		    ctl->irq !=3D irq)
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 5370e6b492fd..2294a1580d35 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -70,7 +70,7 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev=
, size_t size, size_t ali
 		return NULL;
=20
 	dmah->size =3D size;
-	dmah->vaddr =3D dma_alloc_coherent(&dev->pdev->dev, size,
+	dmah->vaddr =3D dma_alloc_coherent(dev->dev, size,
 					 &dmah->busaddr,
 					 GFP_KERNEL);
=20
@@ -93,7 +93,7 @@ EXPORT_SYMBOL(drm_pci_alloc);
  */
 void drm_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
 {
-	dma_free_coherent(&dev->pdev->dev, dmah->size, dmah->vaddr,
+	dma_free_coherent(dev->dev, dmah->size, dmah->vaddr,
 			  dmah->busaddr);
 	kfree(dmah);
 }
@@ -112,16 +112,18 @@ static int drm_get_pci_domain(struct drm_device *de=
v)
 		return 0;
 #endif /* __alpha__ */
=20
-	return pci_domain_nr(dev->pdev->bus);
+	return pci_domain_nr(to_pci_dev(dev->dev)->bus);
 }
=20
 int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master)=

 {
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+
 	master->unique =3D kasprintf(GFP_KERNEL, "pci:%04x:%02x:%02x.%d",
 					drm_get_pci_domain(dev),
-					dev->pdev->bus->number,
-					PCI_SLOT(dev->pdev->devfn),
-					PCI_FUNC(dev->pdev->devfn));
+					pdev->bus->number,
+					PCI_SLOT(pdev->devfn),
+					PCI_FUNC(pdev->devfn));
 	if (!master->unique)
 		return -ENOMEM;
=20
@@ -131,12 +133,14 @@ int drm_pci_set_busid(struct drm_device *dev, struc=
t drm_master *master)
=20
 static int drm_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_b=
usid *p)
 {
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+
 	if ((p->busnum >> 8) !=3D drm_get_pci_domain(dev) ||
-	    (p->busnum & 0xff) !=3D dev->pdev->bus->number ||
-	    p->devnum !=3D PCI_SLOT(dev->pdev->devfn) || p->funcnum !=3D PCI_FU=
NC(dev->pdev->devfn))
+	    (p->busnum & 0xff) !=3D pdev->bus->number ||
+	    p->devnum !=3D PCI_SLOT(pdev->devfn) || p->funcnum !=3D PCI_FUNC(pd=
ev->devfn))
 		return -EINVAL;
=20
-	p->irq =3D dev->pdev->irq;
+	p->irq =3D pdev->irq;
=20
 	DRM_DEBUG("%d:%d:%d =3D> IRQ %d\n", p->busnum, p->devnum, p->funcnum,
 		  p->irq);
@@ -164,7 +168,7 @@ int drm_legacy_irq_by_busid(struct drm_device *dev, v=
oid *data,
 		return -EOPNOTSUPP;
=20
 	/* UMS was only ever support on PCI devices. */
-	if (WARN_ON(!dev->pdev))
+	if (WARN_ON(!dev_is_pci(dev->dev)))
 		return -EINVAL;
=20
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
@@ -188,7 +192,7 @@ void drm_pci_agp_destroy(struct drm_device *dev)
 static void drm_pci_agp_init(struct drm_device *dev)
 {
 	if (drm_core_check_feature(dev, DRIVER_USE_AGP)) {
-		if (pci_find_capability(dev->pdev, PCI_CAP_ID_AGP))
+		if (pci_find_capability(to_pci_dev(dev->dev), PCI_CAP_ID_AGP))
 			dev->agp =3D drm_agp_init(dev);
 		if (dev->agp) {
 			dev->agp->agp_mtrr =3D arch_phys_wc_add(
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 6d5a03b32238..9b3b989d7cad 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -278,7 +278,7 @@ static void drm_vm_shm_close(struct vm_area_struct *v=
ma)
 			case _DRM_SCATTER_GATHER:
 				break;
 			case _DRM_CONSISTENT:
-				dma_free_coherent(&dev->pdev->dev,
+				dma_free_coherent(dev->dev,
 						  map->size,
 						  map->handle,
 						  map->offset);
--=20
2.29.2


--------------603CB973D1A79439D759FDDC--

--SpeQhFrPcsnJnvqgu4TnOsKwv35FF4sEs--

--HxZgVvF2yDnhvDejqbhL78QKVrDS9I5Ih
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAFRhEFAwAAAAAACgkQlh/E3EQov+DJ
Aw//WuRrzWyh7nm7RmAMSA2keSqvakIbZd9U6W5b5sBuqn/Yq9KB9Y7j649kgxgknsnOxnIiiAOg
7T0m3u7tytOVpdGT5CRkGaz4YF8mfdKuM3sf5cTGSzybimwUQIBZg0LDql/Pu+vZfeOxeG/6esSN
kdNVbvlTJmKTRnAv93L7spuu1ze03GBfB+0hXCFdDkggTxJbPsNFV0o+skIOzkDTDqirSHWrOPY6
sZUVlGSckFi4KgJZfcRgHjzd9jedrzB0uy0tInNJxivO7wZID4xGVZffOxSWk+c+2KPl1wWnFu5+
ZxzngBx5NLQosWcMQvPmyBz8cVSvgTRpRDvVUy3ubY2yOdNDBECP5eqmWAITihrqgEMpuibjhJAY
Nm68xfq0WGrpV2YIRaGZEcEyh22BUHAsC+gyvybHO4Rx7w6871uPxXi8l9vqGolbJyVLkODT1sif
5h8xym0QOuUw57qfaPkdaUP9dexqHpGaiffTOkGb8siAXpf7vQ4er6XOVlWOU+vAEChnTXPn2/iK
W1ayJvidor3DMBFvbXew6rI7ic3r83J5qztFU0BvkX7gOUIxmFj/EsVQHhDRefazvYIA58LnTnBo
N1S/YWePgnHbUYsdMyuO1PzmTTuvC6Czuxqld6n7VK1P6Z9oeZrawMCxprstJyPaHL/omIxq1rHK
hAQ=
=wJjW
-----END PGP SIGNATURE-----

--HxZgVvF2yDnhvDejqbhL78QKVrDS9I5Ih--

--===============0306459487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0306459487==--
