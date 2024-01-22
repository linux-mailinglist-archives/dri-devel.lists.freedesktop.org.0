Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96C483766D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 23:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5612C10F09C;
	Mon, 22 Jan 2024 22:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from domac.alu.hr (domac.alu.unizg.hr [161.53.235.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45CC10F09C;
 Mon, 22 Jan 2024 22:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by domac.alu.hr (Postfix) with ESMTP id 6281F60177;
 Mon, 22 Jan 2024 23:39:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1705963174; bh=yNm4e/yx7WAH0UZMYe2d2vHo/7XrlmuUvyXLqnjuR+0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=haxDCP3PBwt7Wt2GTCyUJU7b8AXc06fzB283bLud8zmunlFkP+o7tKz7cFFdYsBYE
 9TWtGYS/iX/+5h4lmUQn3VOmdDzkjf4TLpS9Pu5yRmpciQUqchr2lZxZJnND/GISHr
 Q+7I+U0rtHElre7Ml46odw4zbuseozgCkVj9cBWdcHqTz295lE24LfAdAb0c0umvUi
 L6MgCX8liy/Fz0R66lB5ecMcoZbtLDcXWkFPcY/VRmr4MMMy7mD+vHgOTWHZotwIeU
 whErEVzLxlf71IIMFZLrL4b2uZdvsNBhmyfEHI4QjYkWuMwiyF4cHM99scAGGqn1cR
 8/X6SPHt+xxgQ==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
 by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oq-0DsTxHCgU; Mon, 22 Jan 2024 23:39:30 +0100 (CET)
Received: from [192.168.178.21] (dh207-42-16.xnet.hr [88.207.42.16])
 by domac.alu.hr (Postfix) with ESMTPSA id F06D560173;
 Mon, 22 Jan 2024 23:39:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1705963170; bh=yNm4e/yx7WAH0UZMYe2d2vHo/7XrlmuUvyXLqnjuR+0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fsduceS0tr7k6WupYksqrtjgoSFsRQp3d/XtfyNOJly9wZhTtLdZU+vleUjxUiYc8
 vjGS7w36BI5i/udQvVftm2hzQOPr3ubyWw5xMeNJw2eJZ3YJ11FCc1FgsjgkhuHhpH
 K2v5hxK8yjIGB4EKehHYpPY+kfKCN4tYkL1F0RQTkaAyUi7eg/r5wg7ywaTBrQJgwl
 lkQF9XbSa2268H0H0CZZymoXlbruRJZFsgPJjE4sc5+xsHfFfm72dgWtvHYRUBcDO9
 OIfUHyy+tH2o5hxILXue+IkIwceSaBHIhzEb97zLIAxKvewdLXlPqMTqcBmTn+ADGp
 IZWnx70NYwj2g==
Message-ID: <bb91dc43-d331-4999-b43f-a741c865f7f2@alu.unizg.hr>
Date: Mon, 22 Jan 2024 23:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG [RESEND]: kernel NULL pointer dereference, address:
 0000000000000008
To: "Ma, Jun" <majun@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <83b9077a-3de8-464a-bd64-d32869b3728c@alu.unizg.hr>
 <b6336db1-be2c-418d-b45d-e715ae19507a@alu.unizg.hr>
 <1bc1a054-2aa8-4229-9a05-df7bac1ec0d8@amd.com>
Content-Language: en-US, hr
From: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <1bc1a054-2aa8-4229-9a05-df7bac1ec0d8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Sathishkumar S <sathishkumar.sundararaju@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Francis <David.Francis@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22. 01. 2024. 09:34, Ma, Jun wrote:
> Perhaps similar to the problem I encountered earlier, you can
> try the following patch
>=20
> https://lists.freedesktop.org/archives/amd-gfx/2024-January/103259.html=


Appaarently, this patch prevented NULL dereference, it was no longer in t=
he log.

However, there is another hang in XWayland password entry dialog, but I d=
o not
think that I figured out what is wrong.

Best regards,
Mirsad

> Regards,
> Ma Jun
>=20
> On 1/21/2024 3:54 AM, Mirsad Todorovac wrote:
>> Hi,
>>
>> The last email did not pass to the most of the recipients due to banne=
d .xz attachment.
>>
>> As the .config is too big to send inline or uncompressed either, I wil=
l omit it in this
>> attempt. In the meantime, I had some success in decoding the stack tra=
ce, but sadly not
>> complete.
>>
>> I don't think this Oops is deterministic, but I am working on a reprod=
ucer.
>>
>> The platform is Ubuntu 22.04 LTS.
>>
>> Complete list of hardware and .config is available here:
>>
>> https://domac.alu.unizg.hr/~mtodorov/linux/bugreports/amdgpu/6.7.0-rtl=
-v02-nokcsan-09928-g052d534373b7/
>>
>> Best regards,
>> Mirsad
>>
>> ----------------------------------------------------------------------=
---------------------
>> kernel: [    5.576702] BUG: kernel NULL pointer dereference, address: =
0000000000000008
>> kernel: [    5.576707] #PF: supervisor read access in kernel mode
>> kernel: [    5.576710] #PF: error_code(0x0000) - not-present page
>> kernel: [    5.576712] PGD 0 P4D 0
>> kernel: [    5.576715] Oops: 0000 [#1] PREEMPT SMP NOPTI
>> kernel: [    5.576718] CPU: 9 PID: 650 Comm: systemd-udevd Not tainted=
 6.7.0-rtl-v0.2-nokcsan-09928-g052d534373b7 #2
>> kernel: [    5.576723] Hardware name: ASRock X670E PG Lightning/X670E =
PG Lightning, BIOS 1.21 04/26/2023
>> kernel: [    5.576726] RIP: 0010:gfx_v10_0_early_init (drivers/gpu/drm=
/amd/amdgpu/gfx_v10_0.c:4009 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7478)=
 amdgpu
>> kernel: [ 5.576872] Code: 8d 55 a8 4c 89 ff e8 e4 83 ec ff 41 89 c2 83=
 f8 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49 8b 87 08 87 01 00 =
4c 89 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 42 fb ff 41 89 c2 85=
 c0
>> All code
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>     0:	8d 55 a8             	lea    -0x58(%rbp),%edx
>>     3:	4c 89 ff             	mov    %r15,%rdi
>>     6:	e8 e4 83 ec ff       	call   0xffffffffffec83ef
>>     b:	41 89 c2             	mov    %eax,%r10d
>>     e:	83 f8 ed             	cmp    $0xffffffed,%eax
>>    11:	0f 84 b3 fd ff ff    	je     0xfffffffffffffdca
>>    17:	85 c0                	test   %eax,%eax
>>    19:	74 05                	je     0x20
>>    1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>>    20:	49 8b 87 08 87 01 00 	mov    0x18708(%r15),%rax
>>    27:	4c 89 ff             	mov    %r15,%rdi
>>    2a:*	48 8b 40 08          	mov    0x8(%rax),%rax		<-- trapping inst=
ruction
>>    2e:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>>    32:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>>    36:	e8 e4 42 fb ff       	call   0xfffffffffffb431f
>>    3b:	41 89 c2             	mov    %eax,%r10d
>>    3e:	85 c0                	test   %eax,%eax
>>
>> Code starting with the faulting instruction
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>     0:	48 8b 40 08          	mov    0x8(%rax),%rax
>>     4:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>>     8:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>>     c:	e8 e4 42 fb ff       	call   0xfffffffffffb42f5
>>    11:	41 89 c2             	mov    %eax,%r10d
>>    14:	85 c0                	test   %eax,%eax
>> kernel: [    5.576878] RSP: 0018:ffffa5b3c103f720 EFLAGS: 00010282
>> kernel: [    5.576881] RAX: 0000000000000000 RBX: ffffffffc1d73489 RCX=
: 0000000000000000
>> kernel: [    5.576884] RDX: 0000000000000000 RSI: 0000000000000000 RDI=
: ffff91ae4fa80000
>> kernel: [    5.576886] RBP: ffffa5b3c103f7b0 R08: 0000000000000000 R09=
: 0000000000000000
>> kernel: [    5.576889] R10: 00000000ffffffea R11: 0000000000000000 R12=
: ffff91ae4fa986e8
>> kernel: [    5.576892] R13: ffff91ae4fa986d8 R14: ffff91ae4fa986f8 R15=
: ffff91ae4fa80000
>> kernel: [    5.576895] FS:  00007fdaa343c8c0(0000) GS:ffff91bd58440000=
(0000) knlGS:0000000000000000
>> kernel: [    5.576898] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> kernel: [    5.576900] CR2: 0000000000000008 CR3: 00000001222d0000 CR4=
: 0000000000750ef0
>> kernel: [    5.576903] PKRU: 55555554
>> kernel: [    5.576905] Call Trace:
>> kernel: [    5.576907]  <TASK>
>> kernel: [    5.576909] ? show_regs (arch/x86/kernel/dumpstack.c:479)
>> kernel: [    5.576914] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x=
86/kernel/dumpstack.c:434)
>> kernel: [    5.576917] ? page_fault_oops (arch/x86/mm/fault.c:707)
>> kernel: [    5.576921] ? srso_alias_return_thunk (arch/x86/lib/retpoli=
ne.S:181)
>> kernel: [    5.576925] ? crypto_alloc_tfmmem.isra.0 (crypto/api.c:497)=

>> kernel: [    5.576930] ? do_user_addr_fault (arch/x86/mm/fault.c:1264)=

>> kernel: [    5.576934] ? exc_page_fault (./arch/x86/include/asm/paravi=
rt.h:693 arch/x86/mm/fault.c:1515 arch/x86/mm/fault.c:1563)
>> kernel: [    5.576937] ? asm_exc_page_fault (./arch/x86/include/asm/id=
tentry.h:570)
>> kernel: [    5.576942] ? gfx_v10_0_early_init (drivers/gpu/drm/amd/amd=
gpu/gfx_v10_0.c:4009 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7478) amdgpu
>> kernel: [    5.577056] amdgpu_device_init (drivers/gpu/drm/amd/amdgpu/=
amdgpu_device.c:2465 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4042) amd=
gpu
>> kernel: [    5.577158] ? srso_alias_return_thunk (arch/x86/lib/retpoli=
ne.S:181)
>> kernel: [    5.577161] ? pci_bus_read_config_word (drivers/pci/access.=
c:67 (discriminator 2))
>> kernel: [    5.577166] ? pci_read_config_word (drivers/pci/access.c:56=
3)
>> kernel: [    5.577168] ? srso_alias_return_thunk (arch/x86/lib/retpoli=
ne.S:181)
>> kernel: [    5.577171] ? do_pci_enable_device (drivers/pci/pci.c:1975 =
drivers/pci/pci.c:1949)
>> kernel: [    5.577176] amdgpu_driver_load_kms (drivers/gpu/drm/amd/amd=
gpu/amdgpu_kms.c:146) amdgpu
>> kernel: [    5.577275] amdgpu_pci_probe (drivers/gpu/drm/amd/amdgpu/am=
dgpu_drv.c:2237) amdgpu
>> kernel: [    5.577373] local_pci_probe (drivers/pci/pci-driver.c:324)
>> kernel: [    5.577377] pci_device_probe (drivers/pci/pci-driver.c:392 =
drivers/pci/pci-driver.c:417 drivers/pci/pci-driver.c:460)
>> kernel: [    5.577381] really_probe (drivers/base/dd.c:579 drivers/bas=
e/dd.c:658)
>> kernel: [    5.577386] __driver_probe_device (drivers/base/dd.c:800)
>> kernel: [    5.577389] driver_probe_device (drivers/base/dd.c:830)
>> kernel: [    5.577392] __driver_attach (drivers/base/dd.c:1217)
>> kernel: [    5.577396] ? __pfx___driver_attach (drivers/base/dd.c:1157=
)
>> kernel: [    5.577399] bus_for_each_dev (drivers/base/bus.c:368)
>> kernel: [    5.577402] driver_attach (drivers/base/dd.c:1234)
>> kernel: [    5.577405] bus_add_driver (drivers/base/bus.c:674)
>> kernel: [    5.577409] driver_register (drivers/base/driver.c:246)
>> kernel: [    5.577411] ? __pfx_amdgpu_init (drivers/gpu/drm/amd/amdgpu=
/amdgpu_drv.c:2497) amdgpu
>> kernel: [    5.577521] __pci_register_driver (drivers/pci/pci-driver.c=
:1456)
>> kernel: [    5.577524] amdgpu_init (drivers/gpu/drm/amd/amdgpu/amdgpu_=
drvc:2805) amdgpu
>> kernel: [    5.577628] do_one_initcall (init/main.c:1236)
>> kernel: [    5.577632] ? kmalloc_trace (mm/slub.c:3816 mm/slub.c:3860 =
mm/slub.c:4007)
>> kernel: [    5.577637] do_init_module (kernel/module/main.c:2533)
>> kernel: [    5.577640] load_module (kernel/module/main.c:2984)
>> kernel: [    5.577647] init_module_from_file (kernel/module/main.c:315=
1)
>> kernel: [    5.577649] ? srso_alias_return_thunk (arch/x86/lib/retpoli=
ne.S:181)
>> kernel: [    5.577652] ? init_module_from_file (kernel/module/main.c:3=
151)
>> kernel: [    5.577657] idempotent_init_module (kernel/module/main.c:31=
68)
>> kernel: [    5.577661] __x64_sys_finit_module (./include/linux/file.h:=
45 kernel/module/main.c:3190 kernel/module/main.c:3172 kernel/module/main=
=2Ec:3172)
>> kernel: [    5.577664] do_syscall_64 (arch/x86/entry/common.c:52 arch/=
x86/entry/common.c:83)
>> kernel: [    5.577668] ? srso_alias_return_thunk (arch/x86/lib/retpoli=
ne.S:181)
>> kernel: [    5.577671] ? ksys_mmap_pgoff (mm/mmap.c:1428)
>> kernel: [    5.577675] ? srso_alias_return_thunk (arch/x86/lib/retpoli=
ne.S:181)
>> kernel: [    5.577678] ? srso_alias_return_thunk (arch/x86/lib/retpoli=
ne.S:181)
>> kernel: [    5.577681] ? syscall_exit_to_user_mode (kernel/entry/commo=
n.c:215)
>> kernel: [    5.577684] ? srso_alias_return_thunk (arch/x86/lib/retpoli=
ne.S:181)
>> kernel: [    5.577687] ? do_syscall_64 (./arch/x86/include/asm/cpufeat=
ureh:171 arch/x86/entry/common.c:98)
>> kernel: [    5.577689] ? srso_alias_return_thunk (arch/x86/lib/retpoli=
ne.S:181)
>> kernel: [    5.577692] ? do_syscall_64 (./arch/x86/include/asm/cpufeat=
ureh:171 arch/x86/entry/common.c:98)
>> kernel: [    5.577695] ? srso_alias_return_thunk (arch/x86/lib/retpoli=
ne.S:181)
>> kernel: [    5.577698] ? do_syscall_64 (./arch/x86/include/asm/cpufeat=
ureh:171 arch/x86/entry/common.c:98)
>> kernel: [    5.577700] ? srso_alias_return_thunk (arch/x86/lib/retpoli=
ne.S:181)
>> kernel: [    5.577703] ? sysvec_call_function (arch/x86/kernel/smp.c:2=
53 (discriminator 69))
>> kernel: [    5.577707] entry_SYSCALL_64_after_hwframe (arch/x86/entry/=
entry_64.S:129)
>> kernel: [    5.577709] RIP: 0033:0x7fdaa331e88d
>> kernel: [ 5.577724] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f=
 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 =
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01=
 48
>> All code
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>     0:	5b                   	pop    %rbx
>>     1:	41 5c                	pop    %r12
>>     3:	c3                   	ret
>>     4:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
>>     b:	00 00
>>     d:	f3 0f 1e fa          	endbr64
>>    11:	48 89 f8             	mov    %rdi,%rax
>>    14:	48 89 f7             	mov    %rsi,%rdi
>>    17:	48 89 d6             	mov    %rdx,%rsi
>>    1a:	48 89 ca             	mov    %rcx,%rdx
>>    1d:	4d 89 c2             	mov    %r8,%r10
>>    20:	4d 89 c8             	mov    %r9,%r8
>>    23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>>    28:	0f 05                	syscall
>>    2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- tra=
pping instruction
>>    30:	73 01                	jae    0x33
>>    32:	c3                   	ret
>>    33:	48 8b 0d 73 b5 0f 00 	mov    0xfb573(%rip),%rcx        # 0xfb5a=
d
>>    3a:	f7 d8                	neg    %eax
>>    3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>>    3f:	48                   	rex.W
>>
>> Code starting with the faulting instruction
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>     0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>>     6:	73 01                	jae    0x9
>>     8:	c3                   	ret
>>     9:	48 8b 0d 73 b5 0f 00 	mov    0xfb573(%rip),%rcx        # 0xfb58=
3
>>    10:	f7 d8                	neg    %eax
>>    12:	64 89 01             	mov    %eax,%fs:(%rcx)
>>    15:	48                   	rex.W
>> kernel: [    5.577729] RSP: 002b:00007ffeb4f87d28 EFLAGS: 00000246 ORI=
G_RAX: 0000000000000139
>> kernel: [    5.577733] RAX: ffffffffffffffda RBX: 000055aedf3eeeb0 RCX=
: 00007fdaa331e88d
>> kernel: [    5.577736] RDX: 0000000000000000 RSI: 000055aedf3efb80 RDI=
: 000000000000001a
>> kernel: [    5.577738] RBP: 0000000000020000 R08: 0000000000000000 R09=
: 0000000000000002
>> kernel: [    5.577741] R10: 000000000000001a R11: 0000000000000246 R12=
: 000055aedf3efb80
>> kernel: [    5.577744] R13: 000055aedf3f2060 R14: 0000000000000000 R15=
: 000055aedf2b1220
>> kernel: [    5.577748]  </TASK>
>> kernel: [    5.577750] Modules linked in: intel_rapl_msr intel_rapl_co=
mmon amdgpu(+) edac_mce_amd kvm_amd kvm snd_hda_codec_realtek snd_hda_cod=
ec_generic irqbypass ledtrig_audio crct10dif_pclmul polyval_clmulni polyv=
al_generic snd_hda_codec_hdmi ghash_clmulni_intel sha512_ssse3 sha256_sss=
e3 sha1_ssse3 amdxcp snd_hda_intel aesni_intel drm_exec snd_intel_dspcfg =
crypto_simd gpu_sched snd_intel_sdw_acpi cryptd nls_iso8859_1 drm_buddy s=
nd_hda_codec snd_seq_midi drm_suballoc_helper snd_seq_midi_event drm_ttm_=
helper joydev snd_hda_core input_leds ttm rapl snd_rawmidi snd_hwdep drm_=
display_helper snd_seq snd_pcm wmi_bmof cec k10temp snd_seq_device ccp rc=
_core snd_timer snd drm_kms_helper i2c_algo_bit soundcore mac_hid tcp_bbr=
 sch_fq msr parport_pc ppdev lp drm parport efi_pstore ip_tables x_tables=
 autofs4 btrfs blake2b_generic xor raid6_pq libcrc32c hid_generic usbhid =
hid crc32_pclmul nvme r8169 ahci nvme_core i2c_piix4 xhci_pci libahci xhc=
i_pci_renesas realtek video wmi gpio_amdpt
>> kernel: [    5.577817] CR2: 0000000000000008
>> kernel: [    5.577820] ---[ end trace 0000000000000000 ]---
>> kernel: [    5.914230] RIP: 0010:gfx_v10_0_early_init (drivers/gpu/drm=
/amd/amdgpu/gfx_v10_0.c:4009 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7478)=
 amdgpu
>> kernel: [ 5.914388] Code: 8d 55 a8 4c 89 ff e8 e4 83 ec ff 41 89 c2 83=
 f8 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49 8b 87 08 87 01 00 =
4c 89 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 42 fb ff 41 89 c2 85=
 c0
>> All code
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>     0:	8d 55 a8             	lea    -0x58(%rbp),%edx
>>     3:	4c 89 ff             	mov    %r15,%rdi
>>     6:	e8 e4 83 ec ff       	call   0xffffffffffec83ef
>>     b:	41 89 c2             	mov    %eax,%r10d
>>     e:	83 f8 ed             	cmp    $0xffffffed,%eax
>>    11:	0f 84 b3 fd ff ff    	je     0xfffffffffffffdca
>>    17:	85 c0                	test   %eax,%eax
>>    19:	74 05                	je     0x20
>>    1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>>    20:	49 8b 87 08 87 01 00 	mov    0x18708(%r15),%rax
>>    27:	4c 89 ff             	mov    %r15,%rdi
>>    2a:*	48 8b 40 08          	mov    0x8(%rax),%rax		<-- trapping inst=
ruction
>>    2e:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>>    32:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>>    36:	e8 e4 42 fb ff       	call   0xfffffffffffb431f
>>    3b:	41 89 c2             	mov    %eax,%r10d
>>    3e:	85 c0                	test   %eax,%eax
>>
>> Code starting with the faulting instruction
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>     0:	48 8b 40 08          	mov    0x8(%rax),%rax
>>     4:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>>     8:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>>     c:	e8 e4 42 fb ff       	call   0xfffffffffffb42f5
>>    11:	41 89 c2             	mov    %eax,%r10d
>>    14:	85 c0                	test   %eax,%eax
>> rsyslogd: rsyslogd's groupid changed to 111
>> kernel: [    5.914394] RSP: 0018:ffffa5b3c103f720 EFLAGS: 00010282
>> kernel: [    5.914397] RAX: 0000000000000000 RBX: ffffffffc1d73489 RCX=
: 0000000000000000
>> kernel: [    5.914399] RDX: 0000000000000000 RSI: 0000000000000000 RDI=
: ffff91ae4fa80000
>> kernel: [    5.914402] RBP: ffffa5b3c103f7b0 R08: 0000000000000000 R09=
: 0000000000000000
>> kernel: [    5.914405] R10: 00000000ffffffea R11: 0000000000000000 R12=
: ffff91ae4fa986e8
>> kernel: [    5.914408] R13: ffff91ae4fa986d8 R14: ffff91ae4fa986f8 R15=
: ffff91ae4fa80000
>> kernel: [    5.914410] FS:  00007fdaa343c8c0(0000) GS:ffff91bd58440000=
(0000) knlGS:0000000000000000
>> kernel: [    5.914414] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> kernel: [    5.914416] CR2: 0000000000000008 CR3: 00000001222d0000 CR4=
: 0000000000750ef0
>> kernel: [    5.914419] PKRU: 55555554
>>
>> Best regards,
>> Mirsad
>>
>> On 1/18/24 18:23, Mirsad Todorovac wrote:
>>> Hi,
>>>
>>> Unfortunately, I was not able to reboot in this kernel again to do th=
e stack decode, but I thought
>>> that any information about the NULL pointer dereference is better tha=
n no info.
>>>
>>> The system is Ubuntu 23.10 Mantic with AMD product: Navi 23 [Radeon R=
X 6600/6600 XT/6600M]
>>> graphic card.
>>>
>>> Please find the config and the hw listing attached.
>>>
>>> Best regards,
>>> Mirsad
>>
>>
>>
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576702] BUG: kernel NULL pointer derefe=
rence, address: 0000000000000008
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576707] #PF: supervisor read access in =
kernel mode
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576710] #PF: error_code(0x0000) - not-p=
resent page
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576712] PGD 0 P4D 0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576715] Oops: 0000 [#1] PREEMPT SMP NOP=
TI
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576718] CPU: 9 PID: 650 Comm: systemd-u=
devd Not tainted 6.7.0-rtl-v0.2-nokcsan-09928-g052d534373b7 #2
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576723] Hardware name: ASRock X670E PG =
Lightning/X670E PG Lightning, BIOS 1.21 04/26/2023
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576726] RIP: 0010:gfx_v10_0_early_init+=
0x5ab/0x8d0 [amdgpu]
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576872] Code: 8d 55 a8 4c 89 ff e8 e4 8=
3 ec ff 41 89 c2 83 f8 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49=
 8b 87 08 87 01 00 4c 89 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 4=
2 fb ff 41 89 c2 85 c0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576878] RSP: 0018:ffffa5b3c103f720 EFLA=
GS: 00010282
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576881] RAX: 0000000000000000 RBX: ffff=
ffffc1d73489 RCX: 0000000000000000
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576884] RDX: 0000000000000000 RSI: 0000=
000000000000 RDI: ffff91ae4fa80000
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576886] RBP: ffffa5b3c103f7b0 R08: 0000=
000000000000 R09: 0000000000000000
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576889] R10: 00000000ffffffea R11: 0000=
000000000000 R12: ffff91ae4fa986e8
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576892] R13: ffff91ae4fa986d8 R14: ffff=
91ae4fa986f8 R15: ffff91ae4fa80000
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576895] FS:=C2=A0 00007fdaa343c8c0(0000=
) GS:ffff91bd58440000(0000) knlGS:0000000000000000
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576898] CS:=C2=A0 0010 DS: 0000 ES: 000=
0 CR0: 0000000080050033
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576900] CR2: 0000000000000008 CR3: 0000=
0001222d0000 CR4: 0000000000750ef0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576903] PKRU: 55555554
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576905] Call Trace:
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576907]=C2=A0 <TASK>
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576909]=C2=A0 ? show_regs+0x72/0x90
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576914]=C2=A0 ? __die+0x25/0x80
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576917]=C2=A0 ? page_fault_oops+0x154/0=
x4c0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576921]=C2=A0 ? srso_alias_return_thunk=
+0x5/0xfbef5
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576925]=C2=A0 ? crypto_alloc_tfmmem.isr=
a.0+0x35/0x70
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576930]=C2=A0 ? do_user_addr_fault+0x30=
e/0x6e0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576934]=C2=A0 ? exc_page_fault+0x84/0x1=
b0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576937]=C2=A0 ? asm_exc_page_fault+0x27=
/0x30
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576942]=C2=A0 ? gfx_v10_0_early_init+0x=
5ab/0x8d0 [amdgpu]
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577056]=C2=A0 amdgpu_device_init+0xefa/=
0x2de0 [amdgpu]
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577158]=C2=A0 ? srso_alias_return_thunk=
+0x5/0xfbef5
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577161]=C2=A0 ? pci_bus_read_config_wor=
d+0x47/0x90
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577166]=C2=A0 ? pci_read_config_word+0x=
27/0x60
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577168]=C2=A0 ? srso_alias_return_thunk=
+0x5/0xfbef5
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577171]=C2=A0 ? do_pci_enable_device+0x=
e1/0x110
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577176]=C2=A0 amdgpu_driver_load_kms+0x=
1a/0x1c0 [amdgpu]
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577275]=C2=A0 amdgpu_pci_probe+0x1a8/0x=
5e0 [amdgpu]
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577373]=C2=A0 local_pci_probe+0x48/0xb0=

>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577377]=C2=A0 pci_device_probe+0xc8/0x2=
90
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577381]=C2=A0 really_probe+0x1d2/0x440
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577386]=C2=A0 __driver_probe_device+0x8=
a/0x190
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577389]=C2=A0 driver_probe_device+0x23/=
0xd0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577392]=C2=A0 __driver_attach+0x10f/0x2=
20
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577396]=C2=A0 ? __pfx___driver_attach+0=
x10/0x10
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577399]=C2=A0 bus_for_each_dev+0x7a/0xe=
0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577402]=C2=A0 driver_attach+0x1e/0x30
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577405]=C2=A0 bus_add_driver+0x127/0x24=
0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577409]=C2=A0 driver_register+0x64/0x14=
0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577411]=C2=A0 ? __pfx_amdgpu_init+0x10/=
0x10 [amdgpu]
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577521]=C2=A0 __pci_register_driver+0x6=
8/0x80
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577524]=C2=A0 amdgpu_init+0x69/0xff0 [a=
mdgpu]
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577628]=C2=A0 do_one_initcall+0x46/0x33=
0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577632]=C2=A0 ? kmalloc_trace+0x136/0x3=
70
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577637]=C2=A0 do_init_module+0x6a/0x280=

>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577640]=C2=A0 load_module+0x2419/0x2500=

>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577647]=C2=A0 init_module_from_file+0x9=
c/0xf0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577649]=C2=A0 ? srso_alias_return_thunk=
+0x5/0xfbef5
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577652]=C2=A0 ? init_module_from_file+0=
x9c/0xf0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577657]=C2=A0 idempotent_init_module+0x=
184/0x240
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577661]=C2=A0 __x64_sys_finit_module+0x=
64/0xd0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577664]=C2=A0 do_syscall_64+0x76/0x140
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577668]=C2=A0 ? srso_alias_return_thunk=
+0x5/0xfbef5
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577671]=C2=A0 ? ksys_mmap_pgoff+0x123/0=
x270
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577675]=C2=A0 ? srso_alias_return_thunk=
+0x5/0xfbef5
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577678]=C2=A0 ? srso_alias_return_thunk=
+0x5/0xfbef5
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577681]=C2=A0 ? syscall_exit_to_user_mo=
de+0x97/0x1e0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577684]=C2=A0 ? srso_alias_return_thunk=
+0x5/0xfbef5
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577687]=C2=A0 ? do_syscall_64+0x85/0x14=
0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577689]=C2=A0 ? srso_alias_return_thunk=
+0x5/0xfbef5
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577692]=C2=A0 ? do_syscall_64+0x85/0x14=
0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577695]=C2=A0 ? srso_alias_return_thunk=
+0x5/0xfbef5
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577698]=C2=A0 ? do_syscall_64+0x85/0x14=
0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577700]=C2=A0 ? srso_alias_return_thunk=
+0x5/0xfbef5
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577703]=C2=A0 ? sysvec_call_function+0x=
4e/0xb0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577707]=C2=A0 entry_SYSCALL_64_after_hw=
frame+0x6e/0x76
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577709] RIP: 0033:0x7fdaa331e88d
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577724] Code: 5b 41 5c c3 66 0f 1f 84 0=
0 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d=
 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0=
f 00 f7 d8 64 89 01 48
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577729] RSP: 002b:00007ffeb4f87d28 EFLA=
GS: 00000246 ORIG_RAX: 0000000000000139
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577733] RAX: ffffffffffffffda RBX: 0000=
55aedf3eeeb0 RCX: 00007fdaa331e88d
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577736] RDX: 0000000000000000 RSI: 0000=
55aedf3efb80 RDI: 000000000000001a
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577738] RBP: 0000000000020000 R08: 0000=
000000000000 R09: 0000000000000002
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577741] R10: 000000000000001a R11: 0000=
000000000246 R12: 000055aedf3efb80
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577744] R13: 000055aedf3f2060 R14: 0000=
000000000000 R15: 000055aedf2b1220
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577748]=C2=A0 </TASK>
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577750] Modules linked in: intel_rapl_m=
sr intel_rapl_common amdgpu(+) edac_mce_amd kvm_amd kvm snd_hda_codec_rea=
ltek snd_hda_codec_generic irqbypass ledtrig_audio crct10dif_pclmul polyv=
al_clmulni polyval_generic snd_hda_codec_hdmi ghash_clmulni_intel sha512_=
ssse3 sha256_ssse3 sha1_ssse3 amdxcp snd_hda_intel aesni_intel drm_exec s=
nd_intel_dspcfg crypto_simd gpu_sched snd_intel_sdw_acpi cryptd nls_iso88=
59_1 drm_buddy snd_hda_codec snd_seq_midi drm_suballoc_helper snd_seq_mid=
i_event drm_ttm_helper joydev snd_hda_core input_leds ttm rapl snd_rawmid=
i snd_hwdep drm_display_helper snd_seq snd_pcm wmi_bmof cec k10temp snd_s=
eq_device ccp rc_core snd_timer snd drm_kms_helper i2c_algo_bit soundcore=
 mac_hid tcp_bbr sch_fq msr parport_pc ppdev lp drm parport efi_pstore ip=
_tables x_tables autofs4 btrfs blake2b_generic xor raid6_pq libcrc32c hid=
_generic usbhid hid crc32_pclmul nvme r8169 ahci nvme_core i2c_piix4 xhci=
_pci libahci xhci_pci_renesas realtek video wmi gpio_amdpt
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577817] CR2: 0000000000000008
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577820] ---[ end trace 0000000000000000=
 ]---
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914230] RIP: 0010:gfx_v10_0_early_init+=
0x5ab/0x8d0 [amdgpu]
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914388] Code: 8d 55 a8 4c 89 ff e8 e4 8=
3 ec ff 41 89 c2 83 f8 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49=
 8b 87 08 87 01 00 4c 89 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 4=
2 fb ff 41 89 c2 85 c0
>>> rsyslogd: rsyslogd's groupid changed to 111
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914394] RSP: 0018:ffffa5b3c103f720 EFLA=
GS: 00010282
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914397] RAX: 0000000000000000 RBX: ffff=
ffffc1d73489 RCX: 0000000000000000
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914399] RDX: 0000000000000000 RSI: 0000=
000000000000 RDI: ffff91ae4fa80000
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914402] RBP: ffffa5b3c103f7b0 R08: 0000=
000000000000 R09: 0000000000000000
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914405] R10: 00000000ffffffea R11: 0000=
000000000000 R12: ffff91ae4fa986e8
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914408] R13: ffff91ae4fa986d8 R14: ffff=
91ae4fa986f8 R15: ffff91ae4fa80000
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914410] FS:=C2=A0 00007fdaa343c8c0(0000=
) GS:ffff91bd58440000(0000) knlGS:0000000000000000
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914414] CS:=C2=A0 0010 DS: 0000 ES: 000=
0 CR0: 0000000080050033
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914416] CR2: 0000000000000008 CR3: 0000=
0001222d0000 CR4: 0000000000750ef0
>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914419] PKRU: 55555554

--=20
Mirsad Goran Todorovac
Sistem in=C5=BEenjer
Grafi=C4=8Dki fakultet | Akademija likovnih umjetnosti
Sveu=C4=8Dili=C5=A1te u Zagrebu
=20
System engineer
Faculty of Graphic Arts | Academy of Fine Arts
University of Zagreb, Republic of Croatia
The European Union

"I see something approaching fast ... Will it be friends with me?"

