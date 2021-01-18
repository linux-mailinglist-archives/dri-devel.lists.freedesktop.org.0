Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B5C2F9BD3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 10:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB6089DFE;
	Mon, 18 Jan 2021 09:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9629389DFE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 09:22:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32A35AC6E;
 Mon, 18 Jan 2021 09:22:15 +0000 (UTC)
Subject: Re: [BUG] DRM kernel NULL pointer dereference (linux-next 20210115)
To: Andy Lavr <andy.lavr@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Arnd Bergmann <arnd@arndb.de>
References: <8304b313-9610-08bb-589c-0daa8ff7bd6c@gmail.com>
 <9f067539-07b1-7aa6-3112-0eb25b1b606f@gmail.com>
 <7851c78c-8c57-3c84-cd49-a72703095a5d@suse.de>
 <3581d927-f07f-a664-6faf-b7ce81cf5bb0@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7251acbb-5d41-bdf6-f636-8847edd0345e@suse.de>
Date: Mon, 18 Jan 2021 10:22:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3581d927-f07f-a664-6faf-b7ce81cf5bb0@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1505728200=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1505728200==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="idJqUbK6Y6JDOMib7AAvr53ACkP4qJEnd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--idJqUbK6Y6JDOMib7AAvr53ACkP4qJEnd
Content-Type: multipart/mixed; boundary="t8NKeNsiG4Fz6r2EKkMKhvSG1gXz1ABXq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andy Lavr <andy.lavr@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <7251acbb-5d41-bdf6-f636-8847edd0345e@suse.de>
Subject: Re: [BUG] DRM kernel NULL pointer dereference (linux-next 20210115)
References: <8304b313-9610-08bb-589c-0daa8ff7bd6c@gmail.com>
 <9f067539-07b1-7aa6-3112-0eb25b1b606f@gmail.com>
 <7851c78c-8c57-3c84-cd49-a72703095a5d@suse.de>
 <3581d927-f07f-a664-6faf-b7ce81cf5bb0@gmail.com>
In-Reply-To: <3581d927-f07f-a664-6faf-b7ce81cf5bb0@gmail.com>

--t8NKeNsiG4Fz6r2EKkMKhvSG1gXz1ABXq
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.01.21 um 10:14 schrieb Andy Lavr:
>=20
>  > attached patchfile and report if it fixes the issue?
>=20
>=20
> Yes, fixed. Thanks.

OK. Can I add you in Tested-by and Reported-by tag to the fix?

Best regards
Thomas

>=20
>=20
> 18.01.2021 08:25, Thomas Zimmermann =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> (cc'ing dri-devel)
>>
>> Hi
>>
>> thanks for reporting the bug.
>>
>> Am 17.01.21 um 12:12 schrieb Andy Lavr:
>>> Hey,
>>>
>>>
>>> You forgot to add these commits to linux-next:
>>>
>>>
>>> =C2=A0 drm: Move struct drm_device.pdev to legacy
>>>
>>> https://patchwork.kernel.org/project/intel-gfx/cover/20210107080748.4=
768-1-tzimmermann@suse.de/=20
>>>
>>>
>>>
>>> I committed these patches to my local tree and that solved my problem=
=2E
>>>
>>>
>>> =C2=A0 * v3,4/8] drm/i915: Remove references to struct drm_device.pde=
v
>>> <https://patchwork.kernel.org/project/intel-gfx/patch/20210107080748.=
4768-5-tzimmermann@suse.de/>=20
>>>
>>> =C2=A0 * [v3,5/8] drm/i915/gt: Remove references to struct drm_device=
=2Epdev
>>> <https://patchwork.kernel.org/project/intel-gfx/patch/20210107080748.=
4768-6-tzimmermann@suse.de/>=20
>>>
>>> =C2=A0 * [v3,6/8] drm/i915/gvt: Remove references to struct drm_devic=
e.pdev
>>> <https://patchwork.kernel.org/project/intel-gfx/patch/20210107080748.=
4768-7-tzimmermann@suse.de/>=20
>>>
>>> =C2=A0 * [v3,8/8] drm: Upcast struct drm_device.dev to struct pci_dev=
ice;
>>> =C2=A0=C2=A0=C2=A0 replace pdev
>>> <https://patchwork.kernel.org/project/intel-gfx/patch/20210107080748.=
4768-9-tzimmermann@suse.de/>=20
>>>
>>
>> These patches have not been merged yet as they have to wait for some=20
>> preparation in the i915 driver.
>>
>> I reduced the final patch, so it should change the buggy code. Could=20
>> you please apply only the attached patchfile and report if it fixes=20
>> the issue?
>>
>> Best regards
>> Thomas
>>
>>>
>>>
>>>
>>> Thanks to all!
>>>
>>>
>>> 16.01.2021 15:17, Andy Lavr:
>>>>
>>>> Hey,
>>>>
>>>>
>>>> *linux-next 20210114 work fine.*
>>>>
>>>>
>>>> *linux-next 20210115:*
>>>>
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.185982] *BUG: kernel NU=
LL pointer=20
>>>> dereference, address: 0000000000000010*
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.186988] #PF: supervisor=
 read=20
>>>> access in kernel mode
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.187984] #PF: error_code=
(0x0000) -=20
>>>> not-present page
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.189016] PGD 0 P4D 0
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.190508] Oops: 0000 [#1]=
 SMP PTI
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.191814] CPU: 6 PID: 131=
9 Comm:=20
>>>> Xorg Not tainted 5.11.13-dragon-sandybridge #202101150001
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.192847] Hardware name: =
Dell Inc.=20
>>>> Precision M6600/04YY4M, BIOS A18 09/14/2018
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.193877] *RIP:=20
>>>> 0010:drm_pci_set_busid+0x1a/0x80 [drm]*
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.194950] Code: fc 06 f8 =
c8 00 00=20
>>>> 00 00 00 00 00 00 00 00 00 00 0f 1f 44 00 00 55 53 50 48 89 f3 31 d2=
=20
>>>> 81 3f 04 00 01 00 48 8b 87 78 01 00 00 <48> 8b 48 10 7c 09 48 8b 91 =

>>>> d0 01 00 00 8b 12 0f b6 89 e0 01 00 00
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.196094] RSP:=20
>>>> 0018:ffffaacf485afd38 EFLAGS: 00010246
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.197695] RAX: 0000000000=
000000=20
>>>> RBX: ffff95f1684e5000 RCX: ffffffff8b06f380
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.198872] RDX: 0000000000=
000000=20
>>>> RSI: ffff95f1684e5000 RDI: ffff95f175240010
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.200037] RBP: 00000000ff=
ffffea=20
>>>> R08: 000000000000e200 R09: 0000000000000001
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.201205] R10: ffff95f16d=
e88b00=20
>>>> R11: ffffffffc03e1990 R12: ffff95f1684e5000
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.202383] R13: 00007fff88=
65e240=20
>>>> R14: ffff95f1752400a8 R15: ffff95f175240010
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.203554] FS:=20
>>>> 000070bcd696da40(0000) GS:ffff95f41db80000(0000) knlGS:0000000000000=
000
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.204742] CS:=C2=A0 0010 =
DS: 0000 ES:=20
>>>> 0000 CR0: 0000000080050033
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.205936] CR2: 0000000000=
000010=20
>>>> CR3: 0000000186c28006 CR4: 00000000000606e0
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.207144] Call Trace:
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.208370]=20
>>>> drm_setversion+0x13e/0x170 [drm]
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.209596]=C2=A0 ? drm_get=
stats+0x20/0x20=20
>>>> [drm]
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.210799]=20
>>>> drm_ioctl_kernel+0xe2/0x150 [drm]
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.211989] drm_ioctl+0x30b=
/0x440 [drm]
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.213170]=C2=A0 ? drm_get=
stats+0x20/0x20=20
>>>> [drm]
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.214351]=20
>>>> amdgpu_drm_ioctl+0x44/0x80 [amdgpu]
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.215696] __se_sys_ioctl+=
0x78/0xc0
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.216848] do_syscall_64+0=
x33/0x70
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.218002]=20
>>>> entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.219177] RIP: 0033:0x70b=
cd6dd931b
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.220654] Code: 89 d8 49 =
8d 3c 1c=20
>>>> 48 f7 d8 49 39 c4 72 b5 e8 1c ff ff ff 85 c0 78 ba 4c 89 e0 5b 5d 41=
=20
>>>> 5c c3 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 =

>>>> 48 8b 0d 1d 3b 0d 00 f7 d8 64 89 01 48
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.222211] RSP:=20
>>>> 002b:00007fff8865e208 EFLAGS: 00000202 ORIG_RAX: 0000000000000010
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.223778] RAX: ffffffffff=
ffffda=20
>>>> RBX: 00007fff8865e240 RCX: 000070bcd6dd931b
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.225145] RDX: 00007fff88=
65e240=20
>>>> RSI: 00000000c0106407 RDI: 000000000000000c
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.226420] RBP: 00000000c0=
106407=20
>>>> R08: 0000000000000031 R09: 0000000000000000
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.227691] R10: 000070bcd7=
850ec0=20
>>>> R11: 0000000000000202 R12: 00005b60f67cbb50
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.228954] R13: 0000000000=
00000c=20
>>>> R14: 00005b60f67cbb90 R15: 0000000000000000
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.229231] iwlwifi 0000:03=
:00.0:=20
>>>> Radio type=3D0x0-0x3-0x1
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.230218] Modules linked =
in: vfat=20
>>>> fat intel_rapl_msr hid_generic mei_hdcp at24 dell_rbtn iwldvm=20
>>>> dell_laptop dell_smm_hwmon mac80211 intel_rapl_common libarc4=20
>>>> snd_hda_codec_idt snd_hda_codec_generic x86_pkg_temp_thermal=20
>>>> ledtrig_audio intel_powerclamp snd_hda_codec_hdmi crct10dif_pclmul=20
>>>> iwlwifi crc32_pclmul ghash_clmulni_intel snd_hda_intel rapl=20
>>>> snd_intel_dspcfg usbhid intel_cstate firewire_ohci dell_wmi=20
>>>> sdhci_pci hid snd_hda_codec firewire_core dell_smbios crc_itu_t=20
>>>> mei_me dcdbas cfg80211 sparse_keymap cqhci i2c_i801 sdhci=20
>>>> snd_hda_core joydev e1000e snd_hwdep wmi_bmof dell_wmi_descriptor=20
>>>> i2c_smbus mei tpm_tis tpm_tis_core tpm dell_smo8800 xt_hl ip6_tables=
=20
>>>> ip6t_rt nf_log_ipv4 nf_log_common ipt_REJECT nf_reject_ipv4 xt_LOG=20
>>>> nft_limit xt_limit xt_addrtype xt_tcpudp sch_cake tcp_yeah tcp_vegas=
=20
>>>> xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_compat=20
>>>> nft_counter coretemp nf_tables nfnetlink parport_pc ppdev lp parport=
=20
>>>> binfmt_misc ip_tables x_tables xfs raid10 raid456
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.232152]=C2=A0 async_rai=
d6_recov=20
>>>> async_pq async_xor async_memcpy async_tx raid1 raid0 multipath=20
>>>> linear amdgpu iommu_v2 gpu_sched drm_ttm_helper ttm i2c_algo_bit=20
>>>> drm_kms_helper cec aesni_intel sysimgblt syscopyarea sysfillrect=20
>>>> fb_sys_fops crypto_simd cryptd psmouse input_leds drm ahci serio_raw=
=20
>>>> libahci wmi video mac_hid
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.242819] CR2: 0000000000=
000010
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.244502] ---[ end trace =

>>>> 47eef7912dfa1ae6 ]---
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.494899] *RIP:=20
>>>> 0010:drm_pci_set_busid+0x1a/0x80 [drm]*
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.496577] Code: fc 06 f8 =
c8 00 00=20
>>>> 00 00 00 00 00 00 00 00 00 00 0f 1f 44 00 00 55 53 50 48 89 f3 31 d2=
=20
>>>> 81 3f 04 00 01 00 48 8b 87 78 01 00 00 <48> 8b 48 10 7c 09 48 8b 91 =

>>>> d0 01 00 00 8b 12 0f b6 89 e0 01 00 00
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.498313] RSP:=20
>>>> 0018:ffffaacf485afd38 EFLAGS: 00010246
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.500089] RAX: 0000000000=
000000=20
>>>> RBX: ffff95f1684e5000 RCX: ffffffff8b06f380
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.501919] RDX: 0000000000=
000000=20
>>>> RSI: ffff95f1684e5000 RDI: ffff95f175240010
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.503708] RBP: 00000000ff=
ffffea=20
>>>> R08: 000000000000e200 R09: 0000000000000001
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.505483] R10: ffff95f16d=
e88b00=20
>>>> R11: ffffffffc03e1990 R12: ffff95f1684e5000
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.507276] R13: 00007fff88=
65e240=20
>>>> R14: ffff95f1752400a8 R15: ffff95f175240010
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.509058] FS:=20
>>>> 000070bcd696da40(0000) GS:ffff95f41db80000(0000) knlGS:0000000000000=
000
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.510866] CS:=C2=A0 0010 =
DS: 0000 ES:=20
>>>> 0000 CR0: 0000000080050033
>>>> Jan 15 17:34:30 wip kernel: [=C2=A0=C2=A0 35.512647] CR2: 0000000000=
000010=20
>>>> CR3: 0000000186c28006 CR4: 00000000000606e0
>>>>
>>>>
>>>>
>>>> --=20
>>>> Best regards, Andy Lavr.
>>>>
>>>> =C2=A0 CONFIDENTIAL NOTE
>>>>
>>>> =C2=A0 This email (including any attachments) is intended only for t=
he=20
>>>> person or entity to which it is addressed
>>>> =C2=A0 and may contain confidential and/or privileged material. Any =

>>>> review, retransmission, dissemination or other
>>>> =C2=A0 use of, or taking of any action in reliance upon, this inform=
ation=20
>>>> by persons or entities other than the
>>>> =C2=A0 intended recipient is prohibited. If you received this in err=
or,=20
>>>> please notify the sender immediately and
>>>> =C2=A0 delete the material completely from your system. E-mail=20
>>>> communication cannot be guaranteed to be reliable,
>>>> =C2=A0 secure, error-free or virus-free. Accordingly, we cannot acce=
pt=20
>>>> liability for any damage sustained as a
>>>> =C2=A0 result of any virus, error or incompleteness of this e-mail o=
r any=20
>>>> failure to deliver promptly or at all
>>>> =C2=A0 information exchanged between you and us by this means. If yo=
u=20
>>>> suspect that this e-mail may have been
>>>> =C2=A0 intercepted or amended, please contact the sender. Any views =
or=20
>>>> opinions expressed in this email are solely
>>>> =C2=A0 those of the author and do not necessarily represent those of=
 our=20
>>>> entity or related/associated entities.
>>>
>>> --=20
>>> Best regards, Andy Lavr.
>>>
>>> =C2=A0 CONFIDENTIAL NOTE
>>>
>>> =C2=A0 This email (including any attachments) is intended only for th=
e=20
>>> person or entity to which it is addressed
>>> =C2=A0 and may contain confidential and/or privileged material.=C2=A0=
 Any=20
>>> review, retransmission, dissemination or other
>>> =C2=A0 use of, or taking of any action in reliance upon, this informa=
tion=20
>>> by persons or entities other than the
>>> =C2=A0 intended recipient is prohibited. If you received this in erro=
r,=20
>>> please notify the sender immediately and
>>> =C2=A0 delete the material completely from your system. E-mail=20
>>> communication cannot be guaranteed to be reliable,
>>> =C2=A0 secure, error-free or virus-free. Accordingly, we cannot accep=
t=20
>>> liability for any damage sustained as a
>>> =C2=A0 result of any virus, error or incompleteness of this e-mail or=
 any=20
>>> failure to deliver promptly or at all
>>> =C2=A0 information exchanged between you and us by this means. If you=
=20
>>> suspect that this e-mail may have been
>>> =C2=A0 intercepted or amended, please contact the sender. Any views o=
r=20
>>> opinions expressed in this email are solely
>>> =C2=A0 those of the author and do not necessarily represent those of =
our=20
>>> entity or related/associated entities.
>>>
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--t8NKeNsiG4Fz6r2EKkMKhvSG1gXz1ABXq--

--idJqUbK6Y6JDOMib7AAvr53ACkP4qJEnd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAFU0YFAwAAAAAACgkQlh/E3EQov+Df
OxAArky2WtjQr0AARsd/Pzi3AXUyUqPAoyDJVmIkWBo+Dh3Rjiw3Hpdv6VCIgamJLe2tSzLxbsSH
LMi4bu+TE5WmUwJQnvMCDt9nrhqUXloiyp4KIxrdliixrEDt6h8HN80R8sn1gUVjPGAkJp7pfHzF
PGAdsjyTureujyA/e4Gb1Bnhw13xutm2VR6vXZInuQe1sNcpyOYkgeoNCFlV/+3QOJ9NWhBTdvdm
OQKF1WSmb5o+fUr8dDYAWHClSPET2ssSVE8uy27vocLo8b2nGivhWEyHLf2BJU7EybiYb3xN2/DU
9R697p7JHTa+K4/W25tLQDTTmds1q1pymkrC9bjRD5XiIgW1RD8bnmGQv+JuJfumKcAndlah+yYn
QcudY926nwwNu73ANDhc+osS+ModJfE3XBTdVDmPhrCQnlwg6mHo1KHbvPsM3Z6ya7AqnLxRq7Wt
5n8lXcdwDrqTLXZGB2Gc/1/0R8wf+oAiG5GBeqkDzQLtHDg7l3cnydxbvV6Ny3Xv7CIhLxWICXTn
ciFVlYO9RcWUo8lFeqMXjKN1rNzoi5o8odIDVc80igSvyTruY80BNUKt6vaIlDLjOuweD4IsoZdE
2G6WG8y2IF+iEXW7raEhgFEu033sM+mG1ElaaHrR4ZCINYZh2O/kqhyyNKjRE2f28ZDvh1jFOU4C
MI8=
=v6Xv
-----END PGP SIGNATURE-----

--idJqUbK6Y6JDOMib7AAvr53ACkP4qJEnd--

--===============1505728200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1505728200==--
