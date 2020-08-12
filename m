Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23890243496
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65516E52E;
	Thu, 13 Aug 2020 07:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Wed, 12 Aug 2020 18:14:46 UTC
Received: from rfvt.org.uk (rfvt.org.uk [37.187.119.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1ADD6E0E1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 18:14:46 +0000 (UTC)
Received: from wylie.me.uk (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by rfvt.org.uk (Postfix) with ESMTPS id 74EC67FA23;
 Wed, 12 Aug 2020 19:07:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wylie.me.uk;
 s=mydkim005; t=1597255673;
 bh=h0hRlqlU6i8IKTlGWKGfYX9TWxkBBj50G9yr+mms0sw=;
 h=From:To:Subject:References:Date:In-Reply-To;
 b=Ff6akSLlYfQeHmlKvE3rUfzkb0K3XxyhPnKCMWowIbl1wWeKqReo5tTrvdAypHF/U
 7nNUEGRA43l07O7uIJ4hhtIt4VcEzh6T+Ljn04Apr3nnhG6A2LE0zTBwCzzbZO0saI
 CoHvRYVRPwMm3XNjRObAne3punyNFUikTH1ejfxRxfAt0N/GjknAq8zahXlj78Yw4U
 zPyMKCmZkPDXgQzbJ473O1jtA86PxX3+BcdSYH7wq/t6ZMsxRKl946+06pkFJDmA8F
 bR9u38oMj4hkCB4ct0G8/xbkmzoUsvzgnTDCqz3gCaJCTYbpglu42J37Ef868ljlct
 TfHg7G3AUUSXw==
From: alan@wylie.me.uk (Alan J. Wylie)
To: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Nouveau] BUG: unable to handle page fault for address
 nouveau_fence_new
References: <24352.4560.859204.187678@wylie.me.uk>
Date: Wed, 12 Aug 2020 19:07:53 +0100
In-Reply-To: <24352.4560.859204.187678@wylie.me.uk> (Alan J. Wylie's message
 of "Tue, 28 Jul 2020 12:53:52 +0100")
Message-ID: <87wo2368li.fsf@wylie.me.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Another two spontaneous reboots today. Latest one occured whilst I was
away from the computer, output is below. A different call trace this
time. No response to my previous report, so adding some e-mail addresses
from get_maintainer.pl / git blame.

It's an old graphics card, and this time I note references to RAM and
memory. Is there any possibility it's hardware? Is there a GPU
equivalent to memtest86+ ?

On Tue, 28 Jul 2020, "Alan J. Wylie" <alan@wylie.me.uk> writes:

> I've had several recent crashes of the nouveau kernel driver over the past
> month or so.
>
> My suspicion is that Firefox is causing it.
>
> The screen goes black and then the computer reboots.
>
> Nothing much in the syslogs, however I've managed to get netconsole output.
>
> It happens very infrequently and I'm afraid I don't know how to reproduce it,
> however I'll be more than happy to help by providing more information or
> debugging.
>
> Hardware:
> 01:00.0 VGA compatible controller: NVIDIA Corporation GK107 [GeForce GT 640] (rev a1)
>
> Kernel:
> Linux frodo 5.7.10 #21 SMP PREEMPT Wed Jul 22 13:01:11 BST 2020 x86_64 AMD FX(tm)-8350 Eight-Core Processor AuthenticAMD GNU/Linux
>
> Software:
> Recent Gentoo
> Nightly Firefox.
>
> [I] media-libs/mesa (20.0.8@04/07/20): OpenGL-like graphic library for Linux
> [I] x11-apps/mesa-progs (8.4.0@07/04/19): Mesa's OpenGL utility and demo programs (glxgears and glxinfo)
> [I] x11-drivers/xf86-video-nouveau (1.0.16@17/06/20): Accelerated Open Source driver for nVidia cards
> [I] x11-base/xorg-server (1.20.8-r1(0/1.20.8)@22/07/20): X.Org X servers
>
netconsole:

BUG: unable to handle page fault for address: 000000010050786b
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0 
Oops: 0000 [#1] PREEMPT SMP
CPU: 2 PID: 1084 Comm: X Not tainted 5.8.1 #25
Hardware name: Gigabyte Technology Co., Ltd. GA-990XA-UD3/GA-990XA-UD3, BIOS F12 05/30/2012
RIP: 0010:__kmalloc+0xb1/0x2c0
Code: 89 c8 65 48 03 05 3f 29 df 53 48 8b 70 08 48 39 f2 75 e7 4c 8b 28 4d 85 ed 0f 84 d8 00 00 00 41 8b 47 20 49 8b 3f 48 8d 4a 08 <49> 8b 5c 05 00 4c 89 e8 65 48 0f c7 0f 0f 94 c0 84 c0 74 b9 41 8b
RSP: 0018:ffff976e40eb7910 EFLAGS: 00010202
RAX: 0000000000000030 RBX: 0000000000000000 RCX: 0000000001ab8932
RDX: 0000000001ab892a RSI: 0000000001ab892a RDI: 0000000000028a20
RBP: 0000000000000cc0 R08: 000000000000001a R09: 000000000000001a
R10: ffff8deed1efc090 R11: 000000000011b18f R12: 0000000000000052
R13: 000000010050783b R14: ffff8def75c07480 R15: ffff8def75c07480
FS:  00007f71b5e96dc0(0000) GS:ffff8def76c80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000010050786b CR3: 0000000227119000 CR4: 00000000000406e0
Call Trace:
 nvif_object_init+0x7c/0x160 [nouveau]
 nvif_mem_init_type+0xc8/0x1b0 [nouveau]
 ? nvkm_vram_map+0x56/0x80 [nouveau]
 ? nvkm_uvmm_mthd+0x794/0x7c0 [nouveau]
 ? nvkm_vmm_get_locked+0x37f/0x540 [nouveau]
 nouveau_mem_vram+0xf1/0x1a0 [nouveau]
 nouveau_vram_manager_new+0x91/0xd0 [nouveau]
 ttm_bo_mem_space+0xd7/0x320 [ttm]
 ttm_bo_validate+0x12e/0x1a0 [ttm]
 ? drm_vma_offset_add+0x41/0x90 [drm]
 ? nv10_bo_put_tile_region+0x90/0x90 [nouveau]
 ttm_bo_init_reserved+0x2ad/0x320 [ttm]
 ttm_bo_init+0x89/0x100 [ttm]
 ? nv10_bo_put_tile_region+0x90/0x90 [nouveau]
 nouveau_bo_init+0xc1/0xf0 [nouveau]
 ? nv10_bo_put_tile_region+0x90/0x90 [nouveau]
 nouveau_gem_new+0xcf/0x120 [nouveau]
 ? nouveau_gem_new+0x120/0x120 [nouveau]
 nouveau_gem_ioctl_new+0x67/0xf0 [nouveau]
 ? nouveau_gem_new+0x120/0x120 [nouveau]
 drm_ioctl_kernel+0xcc/0x110 [drm]
 drm_ioctl+0x202/0x390 [drm]
 ? nouveau_gem_new+0x120/0x120 [nouveau]
 nouveau_drm_ioctl+0x91/0xd0 [nouveau]
 ksys_ioctl+0xa4/0xd0
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x3e/0x70
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f71b5568dd7
Code: 00 00 90 48 8b 05 a9 40 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 79 40 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007fff1a291988 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fff1a2919d0 RCX: 00007f71b5568dd7
RDX: 00007fff1a2919d0 RSI: 00000000c0306480 RDI: 000000000000000a
RBP: 00000000c0306480 R08: 0000000000000000 R09: 00005575014822e0
R10: 00007f71b562d9e0 R11: 0000000000000246 R12: 00007fff1a2919d0
R13: 000000000000000a R14: 0000557500582e00 R15: 0000000000000000
Modules linked in: essiv authenc dm_crypt binfmt_misc netconsole configfs sha256_generic libsha256 cfg80211 8021q veth cpuid i2c_dev asus_atk0110 acpi_power_meter it87 hwmon_vid nouveau af_packet bridge stp evdev mxm_wmi llc snd_hda_codec_realtek snd_hda_codec_hdmi snd_hda_codec_generic video snd_hda_intel ttm snd_intel_dspcfg drm_kms_helper snd_hda_codec snd_hda_core kvm_amd kvm snd_pcm syscopyarea snd_timer sysfillrect fam15h_power k10temp sysimgblt snd irqbypass fb_sys_fops soundcore i2c_piix4 wmi acpi_cpufreq softdog nfs nfsd auth_rpcgss lockd grace drm sunrpc drm_panel_orientation_quirks backlight agpgart usbhid ohci_pci ghash_clmulni_intel cryptd ehci_pci ohci_hcd sr_mod ehci_hcd cdrom xhci_pci xhci_hcd usbcore usb_common 8250 8250_base serial_core
CR2: 000000010050786b
---[ end trace 67649d0c2234e455 ]---
RIP: 0010:__kmalloc+0xb1/0x2c0
Code: 89 c8 65 48 03 05 3f 29 df 53 48 8b 70 08 48 39 f2 75 e7 4c 8b 28 4d 85 ed 0f 84 d8 00 00 00 41 8b 47 20 49 8b 3f 48 8d 4a 08 <49> 8b 5c 05 00 4c 89 e8 65 48 0f c7 0f 0f 94 c0 84 c0 74 b9 41 8b
RSP: 0018:ffff976e40eb7910 EFLAGS: 00010202
RAX: 0000000000000030 RBX: 0000000000000000 RCX: 0000000001ab8932
RDX: 0000000001ab892a RSI: 0000000001ab892a RDI: 0000000000028a20
RBP: 0000000000000cc0 R08: 000000000000001a R09: 000000000000001a
R10: ffff8deed1efc090 R11: 000000000011b18f R12: 0000000000000052
R13: 000000010050783b R14: ffff8def75c07480 R15: ffff8def75c07480
FS:  00007f71b5e96dc0(0000) GS:ffff8def76c80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000010050786b CR3: 0000000227119000 CR4: 00000000000406e0
Kernel panic - not syncing: Fatal exception
Kernel Offset: 0x2b000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
Rebooting in 20 seconds..

And passed through decode_stacktrace.sh

# uname -a
Linux frodo 5.8.1 #25 SMP PREEMPT Tue Aug 11 19:47:00 BST 2020 x86_64 AMD FX(tm)-8350 Eight-Core Processor AuthenticAMD GNU/Linux

# /work/src.git/linux-stable/scripts/decode_stacktrace.sh  /work/src.git/linux-stable/arch/x86/boot/compressed/vmlinux /work/src.git/linux-stable/ /lib/modules/5.8.1 < ~alan/nouveau/bug.001
BUG: unable to handle page fault for address: 000000010050786b
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP
CPU: 2 PID: 1084 Comm: X Not tainted 5.8.1 #25
Hardware name: Gigabyte Technology Co., Ltd. GA-990XA-UD3/GA-990XA-UD3, BIOS F12 05/30/2012
RIP: 0010:__kmalloc (??:?) 
Code: 89 c8 65 48 03 05 3f 29 df 53 48 8b 70 08 48 39 f2 75 e7 4c 8b 28 4d 85 ed 0f 84 d8 00 00 00 41 8b 47 20 49 8b 3f 48 8d 4a 08 <49> 8b 5c 05 00 4c 89 e8 65 48 0f c7 0f 0f 94 c0 84 c0 74 b9 41 8b
All code
========
   0:	89 c8                	mov    %ecx,%eax
   2:	65 48 03 05 3f 29 df 	add    %gs:0x53df293f(%rip),%rax        # 0x53df2949
   9:	53 
   a:	48 8b 70 08          	mov    0x8(%rax),%rsi
   e:	48 39 f2             	cmp    %rsi,%rdx
  11:	75 e7                	jne    0xfffffffffffffffa
  13:	4c 8b 28             	mov    (%rax),%r13
  16:	4d 85 ed             	test   %r13,%r13
  19:	0f 84 d8 00 00 00    	je     0xf7
  1f:	41 8b 47 20          	mov    0x20(%r15),%eax
  23:	49 8b 3f             	mov    (%r15),%rdi
  26:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  2a:*	49 8b 5c 05 00       	mov    0x0(%r13,%rax,1),%rbx		<-- trapping instruction
  2f:	4c 89 e8             	mov    %r13,%rax
  32:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
  37:	0f 94 c0             	sete   %al
  3a:	84 c0                	test   %al,%al
  3c:	74 b9                	je     0xfffffffffffffff7
  3e:	41                   	rex.B
  3f:	8b                   	.byte 0x8b

Code starting with the faulting instruction
===========================================
   0:	49 8b 5c 05 00       	mov    0x0(%r13,%rax,1),%rbx
   5:	4c 89 e8             	mov    %r13,%rax
   8:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
   d:	0f 94 c0             	sete   %al
  10:	84 c0                	test   %al,%al
  12:	74 b9                	je     0xffffffffffffffcd
  14:	41                   	rex.B
  15:	8b                   	.byte 0x8b
RSP: 0018:ffff976e40eb7910 EFLAGS: 00010202
RAX: 0000000000000030 RBX: 0000000000000000 RCX: 0000000001ab8932
RDX: 0000000001ab892a RSI: 0000000001ab892a RDI: 0000000000028a20
RBP: 0000000000000cc0 R08: 000000000000001a R09: 000000000000001a
R10: ffff8deed1efc090 R11: 000000000011b18f R12: 0000000000000052
R13: 000000010050783b R14: ffff8def75c07480 R15: ffff8def75c07480
FS:  00007f71b5e96dc0(0000) GS:ffff8def76c80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000010050786b CR3: 0000000227119000 CR4: 00000000000406e0
Call Trace:
nvif_object_init (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nvif/object.c:279) nouveau
nvif_mem_init_type (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nvif/mem.c:72) nouveau
? nvkm_vram_map (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.c:49) nouveau
? nvkm_uvmm_mthd (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:218 /work/src.git/linux-stable/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:340) nouveau
? nvkm_vmm_get_locked (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1769 (discriminator 4)) nouveau
nouveau_mem_vram (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_mem.c:155) nouveau
nouveau_vram_manager_new (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_ttm.c:76 /work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_ttm.c:59) nouveau
ttm_bo_mem_space (/work/src.git/linux-stable/drivers/gpu/drm/ttm/ttm_bo.c:1068) ttm
ttm_bo_validate (/work/src.git/linux-stable/drivers/gpu/drm/ttm/ttm_bo.c:1142 /work/src.git/linux-stable/drivers/gpu/drm/ttm/ttm_bo.c:1218) ttm
? drm_vma_offset_add (/work/src.git/linux-stable/drivers/gpu/drm/drm_vma_manager.c:215) drm
? nv10_bo_put_tile_region (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_bo.c:134) nouveau
ttm_bo_init_reserved (/work/src.git/linux-stable/drivers/gpu/drm/ttm/ttm_bo.c:1335) ttm
ttm_bo_init (/work/src.git/linux-stable/drivers/gpu/drm/ttm/ttm_bo.c:1369) ttm
? nv10_bo_put_tile_region (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_bo.c:134) nouveau
nouveau_bo_init (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_bo.c:317) nouveau
? nv10_bo_put_tile_region (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_bo.c:134) nouveau
nouveau_gem_new (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_gem.c:203) nouveau
? nouveau_gem_new (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_gem.c:263) nouveau
nouveau_gem_ioctl_new (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_gem.c:272) nouveau
? nouveau_gem_new (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_gem.c:263) nouveau
drm_ioctl_kernel (/work/src.git/linux-stable/drivers/gpu/drm/drm_ioctl.c:793) drm
drm_ioctl (/work/src.git/linux-stable/./include/linux/thread_info.h:119 /work/src.git/linux-stable/./include/linux/thread_info.h:152 /work/src.git/linux-stable/./include/linux/uaccess.h:151 /work/src.git/linux-stable/drivers/gpu/drm/drm_ioctl.c:888) drm
? nouveau_gem_new (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_gem.c:263) nouveau
nouveau_drm_ioctl (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_drm.c:1120) nouveau
ksys_ioctl (??:?) 
__x64_sys_ioctl (??:?) 
do_syscall_64 (??:?) 
entry_SYSCALL_64_after_hwframe (??:?) 
RIP: 0033:0x7f71b5568dd7
Code: 00 00 90 48 8b 05 a9 40 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 79 40 0c 00 f7 d8 64 89 01 48
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	90                   	nop
   3:	48 8b 05 a9 40 0c 00 	mov    0xc40a9(%rip),%rax        # 0xc40b3
   a:	64 c7 00 26 00 00 00 	movl   $0x26,%fs:(%rax)
  11:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  18:	c3                   	retq   
  19:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  20:	00 00 00 
  23:	b8 10 00 00 00       	mov    $0x10,%eax
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d 79 40 0c 00 	mov    0xc4079(%rip),%rcx        # 0xc40b3
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d 79 40 0c 00 	mov    0xc4079(%rip),%rcx        # 0xc4089
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
RSP: 002b:00007fff1a291988 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fff1a2919d0 RCX: 00007f71b5568dd7
RDX: 00007fff1a2919d0 RSI: 00000000c0306480 RDI: 000000000000000a
RBP: 00000000c0306480 R08: 0000000000000000 R09: 00005575014822e0
R10: 00007f71b562d9e0 R11: 0000000000000246 R12: 00007fff1a2919d0
R13: 000000000000000a R14: 0000557500582e00 R15: 0000000000000000
Modules linked in: essiv authenc dm_crypt binfmt_misc netconsole configfs sha256_generic libsha256 cfg80211 8021q veth cpuid i2c_dev asus_atk0110 acpi_power_meter it87 hwmon_vid nouveau af_packet bridge stp evdev mxm_wmi llc snd_hda_codec_realtek snd_hda_codec_hdmi snd_hda_codec_generic video snd_hda_intel ttm snd_intel_dspcfg drm_kms_helper snd_hda_codec snd_hda_core kvm_amd kvm snd_pcm syscopyarea snd_timer sysfillrect fam15h_power k10temp sysimgblt snd irqbypass fb_sys_fops soundcore i2c_piix4 wmi acpi_cpufreq softdog nfs nfsd auth_rpcgss lockd grace drm sunrpc drm_panel_orientation_quirks backlight agpgart usbhid ohci_pci ghash_clmulni_intel cryptd ehci_pci ohci_hcd sr_mod ehci_hcd cdrom xhci_pci xhci_hcd usbcore usb_common 8250 8250_base serial_core
CR2: 000000010050786b
---[ end trace 67649d0c2234e455 ]---
RIP: 0010:__kmalloc (??:?) 
Code: 89 c8 65 48 03 05 3f 29 df 53 48 8b 70 08 48 39 f2 75 e7 4c 8b 28 4d 85 ed 0f 84 d8 00 00 00 41 8b 47 20 49 8b 3f 48 8d 4a 08 <49> 8b 5c 05 00 4c 89 e8 65 48 0f c7 0f 0f 94 c0 84 c0 74 b9 41 8b
All code
========
   0:	89 c8                	mov    %ecx,%eax
   2:	65 48 03 05 3f 29 df 	add    %gs:0x53df293f(%rip),%rax        # 0x53df2949
   9:	53 
   a:	48 8b 70 08          	mov    0x8(%rax),%rsi
   e:	48 39 f2             	cmp    %rsi,%rdx
  11:	75 e7                	jne    0xfffffffffffffffa
  13:	4c 8b 28             	mov    (%rax),%r13
  16:	4d 85 ed             	test   %r13,%r13
  19:	0f 84 d8 00 00 00    	je     0xf7
  1f:	41 8b 47 20          	mov    0x20(%r15),%eax
  23:	49 8b 3f             	mov    (%r15),%rdi
  26:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  2a:*	49 8b 5c 05 00       	mov    0x0(%r13,%rax,1),%rbx		<-- trapping instruction
  2f:	4c 89 e8             	mov    %r13,%rax
  32:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
  37:	0f 94 c0             	sete   %al
  3a:	84 c0                	test   %al,%al
  3c:	74 b9                	je     0xfffffffffffffff7
  3e:	41                   	rex.B
  3f:	8b                   	.byte 0x8b

Code starting with the faulting instruction
===========================================
   0:	49 8b 5c 05 00       	mov    0x0(%r13,%rax,1),%rbx
   5:	4c 89 e8             	mov    %r13,%rax
   8:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
   d:	0f 94 c0             	sete   %al
  10:	84 c0                	test   %al,%al
  12:	74 b9                	je     0xffffffffffffffcd
  14:	41                   	rex.B
  15:	8b                   	.byte 0x8b
RSP: 0018:ffff976e40eb7910 EFLAGS: 00010202
RAX: 0000000000000030 RBX: 0000000000000000 RCX: 0000000001ab8932
RDX: 0000000001ab892a RSI: 0000000001ab892a RDI: 0000000000028a20
RBP: 0000000000000cc0 R08: 000000000000001a R09: 000000000000001a
R10: ffff8deed1efc090 R11: 000000000011b18f R12: 0000000000000052
R13: 000000010050783b R14: ffff8def75c07480 R15: ffff8def75c07480
FS:  00007f71b5e96dc0(0000) GS:ffff8def76c80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000010050786b CR3: 0000000227119000 CR4: 00000000000406e0
Kernel panic - not syncing: Fatal exception
Kernel Offset: 0x2b000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
Rebooting in 20 seconds..

-- 
Alan J. Wylie                                          https://www.wylie.me.uk/

Dance like no-one's watching. / Encrypt like everyone is.
Security is inversely proportional to convenience
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
