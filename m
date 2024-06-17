Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803C690C44F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8715510E5B3;
	Tue, 18 Jun 2024 07:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 410 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2024 21:55:14 UTC
Received: from domac.alu.hr (domac.alu.hr [161.53.235.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAF310E131;
 Mon, 17 Jun 2024 21:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by domac.alu.hr (Postfix) with ESMTP id 9F8976018F;
 Mon, 17 Jun 2024 23:48:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
 by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OW_G-Ho5VqqT; Mon, 17 Jun 2024 23:48:19 +0200 (CEST)
Received: from [192.168.178.20] (dh207-41-66.xnet.hr [88.207.41.66])
 by domac.alu.hr (Postfix) with ESMTPSA id 76D6260173;
 Mon, 17 Jun 2024 23:48:18 +0200 (CEST)
Message-ID: <838a42ea-b61d-4aee-96cb-bac544794349@gmail.com>
Date: Mon, 17 Jun 2024 23:48:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mirsad Todorovac <mtodorovac69@gmail.com>
Subject: Re: [BUG] 6.10-rc3 [drm:amdgpu_fill_buffer [amdgpu]] *ERROR* Trying
 to clear memory with ring turned off [DUPLICATE]
To: linux-kernel@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Le Ma <le.ma@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Ma Jun
 <Jun.Ma2@amd.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <4b7fd2f2-7ab2-412c-a65c-db172c819200@gmail.com>
Content-Language: en-US
In-Reply-To: <4b7fd2f2-7ab2-412c-a65c-db172c819200@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 18 Jun 2024 07:29:33 +0000
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

On 6/12/24 21:15, Mirsad Todorovac wrote:
> Hi, all!
> 
> Running the vanilla torvalds tree kernel 6.10-rc3, there occurred an error in boot with
> amdgpu.
> 
> Here is the complete output:
> 
> kernel: [    8.704024] WARNING: CPU: 24 PID: 689 at drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1379 amdgpu_bo_release_notify (drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1382 (discriminator 1)) amdgpu
> kernel: [    8.704146] Modules linked in: binfmt_misc amd_atl intel_rapl_msr intel_rapl_common edac_mce_amd kvm_amd kvm snd_hda_codec_realtek snd_hda_codec_generic amdgpu(+) crct10dif_pclmul nls_iso8859_1 snd_hda_scodec_component polyval_clmulni snd_hda_codec_hdmi polyval_generic ghash_clmulni_intel snd_hda_intel sha256_ssse3 sha1_ssse3 snd_intel_dspcfg snd_intel_sdw_acpi aesni_intel snd_hda_codec crypto_simd cryptd snd_seq_midi amdxcp snd_seq_midi_event snd_hda_core drm_exec gpu_sched joydev snd_rawmidi snd_hwdep rapl drm_buddy input_leds drm_suballoc_helper snd_seq drm_ttm_helper wmi_bmof snd_pcm snd_seq_device ttm k10temp ccp snd_timer drm_display_helper snd drm_kms_helper i2c_algo_bit soundcore mac_hid tcp_bbr sch_fq msr parport_pc ppdev lp parport efi_pstore drm ip_tables x_tables autofs4 btrfs blake2b_generic xor raid6_pq libcrc32c hid_generic usbhid hid nvme crc32_pclmul ahci i2c_piix4 nvme_core r8169 xhci_pci libahci xhci_pci_renesas realtek video wmi gpio_amdpt
> kernel: [    8.704200] CPU: 24 PID: 689 Comm: systemd-udevd Not tainted 6.10.0-rc1-next-20240528 #1
> kernel: [    8.704202] Hardware name: ASRock X670E PG Lightning/X670E PG Lightning, BIOS 1.21 04/26/2023
> kernel: [    8.704203] RIP: 0010:amdgpu_bo_release_notify (drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1382 (discriminator 1)) amdgpu
> kernel: [ 8.704324] Code: 0b e9 a3 fe ff ff 48 ba ff ff ff ff ff ff ff 7f 31 f6 4c 89 ef e8 c2 c4 dc ee eb 99 e8 eb bc dc ee eb b2 0f 0b e9 3c fe ff ff <0f> 0b eb a7 be 03 00 00 00 e8 b4 4b a1 ee eb 9b e8 4d 5c 36 ef 66
> All code
> ========
>    0:	0b e9                	or     %ecx,%ebp
>    2:	a3 fe ff ff 48 ba ff 	movabs %eax,0xffffffba48fffffe
>    9:	ff ff 
>    b:	ff                   	(bad)  
>    c:	ff                   	(bad)  
>    d:	ff                   	(bad)  
>    e:	ff                   	(bad)  
>    f:	7f 31                	jg     0x42
>   11:	f6 4c 89 ef e8       	testb  $0xe8,-0x11(%rcx,%rcx,4)
>   16:	c2 c4 dc             	ret    $0xdcc4
>   19:	ee                   	out    %al,(%dx)
>   1a:	eb 99                	jmp    0xffffffffffffffb5
>   1c:	e8 eb bc dc ee       	call   0xffffffffeedcbd0c
>   21:	eb b2                	jmp    0xffffffffffffffd5
>   23:	0f 0b                	ud2    
>   25:	e9 3c fe ff ff       	jmp    0xfffffffffffffe66
>   2a:*	0f 0b                	ud2    		<-- trapping instruction
>   2c:	eb a7                	jmp    0xffffffffffffffd5
>   2e:	be 03 00 00 00       	mov    $0x3,%esi
>   33:	e8 b4 4b a1 ee       	call   0xffffffffeea14bec
>   38:	eb 9b                	jmp    0xffffffffffffffd5
>   3a:	e8 4d 5c 36 ef       	call   0xffffffffef365c8c
>   3f:	66                   	data16
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	0f 0b                	ud2    
>    2:	eb a7                	jmp    0xffffffffffffffab
>    4:	be 03 00 00 00       	mov    $0x3,%esi
>    9:	e8 b4 4b a1 ee       	call   0xffffffffeea14bc2
>    e:	eb 9b                	jmp    0xffffffffffffffab
>   10:	e8 4d 5c 36 ef       	call   0xffffffffef365c62
>   15:	66                   	data16
> kernel: [    8.704325] RSP: 0018:ffffb74b014d3380 EFLAGS: 00010282
> kernel: [    8.704327] RAX: 00000000ffffffea RBX: ffff940781ec5c48 RCX: 0000000000000000
> kernel: [    8.704328] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> kernel: [    8.704329] RBP: ffffb74b014d33b8 R08: 0000000000000000 R09: 0000000000000000
> kernel: [    8.704330] R10: 0000000000000000 R11: 0000000000000000 R12: ffff9407dc80ef58
> kernel: [    8.704330] R13: ffff940781ec5c00 R14: 0000000000000000 R15: 0000000000000000
> kernel: [    8.704331] FS:  0000783805ca28c0(0000) GS:ffff941698600000(0000) knlGS:0000000000000000
> kernel: [    8.704333] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> kernel: [    8.704334] CR2: 00007ec7be572000 CR3: 000000010f7e4000 CR4: 0000000000750ef0
> kernel: [    8.704335] PKRU: 55555554
> kernel: [    8.704335] Call Trace:
> kernel: [    8.704337]  <TASK>
> kernel: [    8.704339] ? show_regs+0x71/0x90 
> kernel: [    8.704344] ? __warn+0x88/0x140 
> kernel: [    8.704347] ? amdgpu_bo_release_notify (drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1382 (discriminator 1)) amdgpu
> kernel: [    8.704464] ? report_bug+0x1ab/0x1c0 
> kernel: [    8.704468] ? handle_bug+0x46/0x90 
> kernel: [    8.704471] ? exc_invalid_op+0x19/0x80 
> kernel: [    8.704473] ? asm_exc_invalid_op+0x1b/0x20 
> kernel: [    8.704478] ? amdgpu_bo_release_notify (drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1382 (discriminator 1)) amdgpu
> kernel: [    8.704595] ttm_bo_release (drivers/gpu/drm/ttm/ttm_bo.c:341) ttm
> kernel: [    8.704601] ttm_bo_put (drivers/gpu/drm/ttm/ttm_bo.c:401) ttm
> kernel: [    8.704604] amdgpu_bo_free_kernel (drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:875 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:459) amdgpu
> kernel: [    8.704721] dm_helpers_free_gpu_mem (./include/linux/list.h:218 ./include/linux/list.h:229 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:1085) amdgpu
> kernel: [    8.704915] dcn315_clk_mgr_construct (drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c:655) amdgpu
> kernel: [    8.705113] dc_clk_mgr_create (drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/clk_mgr.c:267) amdgpu
> kernel: [    8.705302] dc_create (drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1068 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1427) amdgpu
> kernel: [    8.705468] ? srso_alias_return_thunk+0x5/0xfbef5 
> kernel: [    8.705470] ? dmi_matches+0xa0/0x230 
> kernel: [    8.705474] amdgpu_dm_init+0x2b3/0x2c30 amdgpu
> kernel: [    8.705643] ? prb_read_valid+0x1c/0x30 
> kernel: [    8.705646] ? srso_alias_return_thunk+0x5/0xfbef5 
> kernel: [    8.705647] ? console_unlock+0x77/0x120 
> kernel: [    8.705649] ? srso_alias_return_thunk+0x5/0xfbef5 
> kernel: [    8.705650] ? __wake_up_klogd.part.0+0x40/0x70 
> kernel: [    8.705652] ? srso_alias_return_thunk+0x5/0xfbef5 
> kernel: [    8.705653] ? dev_printk_emit+0x86/0xc0 
> kernel: [    8.705656] ? srso_alias_return_thunk+0x5/0xfbef5 
> kernel: [    8.705661] dm_hw_init (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2572) amdgpu
> kernel: [    8.705806] amdgpu_device_init (drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2653 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2870 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4303) amdgpu
> kernel: [    8.705925] ? srso_alias_return_thunk+0x5/0xfbef5 
> kernel: [    8.705927] ? pci_read_config_word+0x29/0x60 
> kernel: [    8.705929] ? srso_alias_return_thunk+0x5/0xfbef5 
> kernel: [    8.705930] ? do_pci_enable_device+0xe3/0x110 
> kernel: [    8.705934] amdgpu_driver_load_kms (drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:146) amdgpu
> kernel: [    8.706050] amdgpu_pci_probe (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2291) amdgpu
> kernel: [    8.706165] local_pci_probe+0x48/0xb0 
> kernel: [    8.706167] pci_device_probe+0xc8/0x290 
> kernel: [    8.706170] really_probe+0xf4/0x3b0 
> kernel: [    8.706173] __driver_probe_device+0x8a/0x180 
> kernel: [    8.706175] driver_probe_device+0x23/0xd0 
> kernel: [    8.706177] __driver_attach+0x10f/0x220 
> kernel: [    8.706178] ? __pfx___driver_attach+0x10/0x10 
> kernel: [    8.706180] bus_for_each_dev+0x7a/0xe0 
> kernel: [    8.706182] driver_attach+0x1e/0x30 
> kernel: [    8.706184] bus_add_driver+0x11f/0x260 
> kernel: [    8.706185] driver_register+0x64/0x140 
> kernel: [    8.706188] ? __pfx_amdgpu_init (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2525) amdgpu
> kernel: [    8.706301] __pci_register_driver+0x61/0x70 
> kernel: [    8.706303] amdgpu_init (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2836) amdgpu
> kernel: [    8.706416] do_one_initcall+0x46/0x330 
> kernel: [    8.706419] ? kmalloc_trace_noprof+0x115/0x340 
> kernel: [    8.706423] do_init_module+0x6a/0x270 
> kernel: [    8.706426] load_module+0x21e9/0x22b0 
> kernel: [    8.706431] init_module_from_file+0x9c/0xf0 
> kernel: [    8.706433] ? srso_alias_return_thunk+0x5/0xfbef5 
> kernel: [    8.706434] ? init_module_from_file+0x9c/0xf0 
> kernel: [    8.706437] idempotent_init_module+0x184/0x240 
> kernel: [    8.706440] __x64_sys_finit_module+0x64/0xd0 
> kernel: [    8.706442] x64_sys_call+0x1903/0x26f0 
> kernel: [    8.706444] do_syscall_64+0x70/0x130 
> kernel: [    8.706446] ? srso_alias_return_thunk+0x5/0xfbef5 
> kernel: [    8.706447] ? do_syscall_64+0x7c/0x130 
> kernel: [    8.706449] entry_SYSCALL_64_after_hwframe+0x76/0x7e 
> kernel: [    8.706451] RIP: 0033:0x783805b1e88d
> kernel: [ 8.706452] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
> All code
> ========
>    0:	5b                   	pop    %rbx
>    1:	41 5c                	pop    %r12
>    3:	c3                   	ret    
>    4:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
>    b:	00 00 
>    d:	f3 0f 1e fa          	endbr64 
>   11:	48 89 f8             	mov    %rdi,%rax
>   14:	48 89 f7             	mov    %rsi,%rdi
>   17:	48 89 d6             	mov    %rdx,%rsi
>   1a:	48 89 ca             	mov    %rcx,%rdx
>   1d:	4d 89 c2             	mov    %r8,%r10
>   20:	4d 89 c8             	mov    %r9,%r8
>   23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>   28:	0f 05                	syscall 
>   2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
>   30:	73 01                	jae    0x33
>   32:	c3                   	ret    
>   33:	48 8b 0d 73 b5 0f 00 	mov    0xfb573(%rip),%rcx        # 0xfb5ad
>   3a:	f7 d8                	neg    %eax
>   3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>   3f:	48                   	rex.W
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>    6:	73 01                	jae    0x9
>    8:	c3                   	ret    
>    9:	48 8b 0d 73 b5 0f 00 	mov    0xfb573(%rip),%rcx        # 0xfb583
>   10:	f7 d8                	neg    %eax
>   12:	64 89 01             	mov    %eax,%fs:(%rcx)
>   15:	48                   	rex.W
> kernel: [    8.706453] RSP: 002b:00007ffc702d1148 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> kernel: [    8.706455] RAX: ffffffffffffffda RBX: 0000594fe0ca0410 RCX: 0000783805b1e88d
> kernel: [    8.706456] RDX: 0000000000000000 RSI: 0000594fe0e08280 RDI: 0000000000000018
> kernel: [    8.706456] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
> kernel: [    8.706457] R10: 0000000000000018 R11: 0000000000000246 R12: 0000594fe0e08280
> kernel: [    8.706458] R13: 0000594fe0df04e0 R14: 0000000000000000 R15: 0000594fe0e005f0
> kernel: [    8.706461]  </TASK>
> kernel: [    8.706462] ---[ end trace 0000000000000000 ]---
> 
> Hope this helps.
> 
> Best regards,
> Mirsad Todorovac

This is apparently a duplicate of <CABXGCsN6j9GMTx+f_pYShOpLKL5b6kmJ3w-FeYHHw9nUWYjyHg@mail.gmail.com>
from 2024-05-17.

However, 6.10-rc3 from Jun 09 was still affected.

6.10-rc4 is clear of this msg.

Hope this helps.

Best regards,
Mirsad Todorovac





