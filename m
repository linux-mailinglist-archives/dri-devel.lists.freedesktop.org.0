Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CDE2245D8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 23:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8322A6E1B8;
	Fri, 17 Jul 2020 21:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5346E2D1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 21:30:33 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f5so14208595ljj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tcwoPeZcUmmZK55W/4y74kWGLw1PTNzkeVRBgCwcmFs=;
 b=jsCwnicEIjKcX0BlOO4SSBC01sjaGh9hsow8FGe2PHaZQQ1RQQEpoaOfyawAGJk2P7
 pqU59+YUleCrZhy2J+o3fWYw0fLstHNlUh+j7NA5bP+41mF2FkMbX/BkvRESX9JpyqRT
 Bxg8RB+9X0IFMoOOUzUEtuYglex9gaFD0+5SB+9yNhq23EHgkOvjOxjhTys6t48ioap+
 yh+gl3RIRiFTvIFq/in8n33ri6Ui15SUuw6wc3DtjxIILiAa3UQExlwgTnUSiLcy+NYO
 u2pqjlKe6QE1kksoZ3qYTQWiJLSdQLiMhzNNYIpS/nTX0II4WCoA4q6HiRdpokOXqYgV
 mImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tcwoPeZcUmmZK55W/4y74kWGLw1PTNzkeVRBgCwcmFs=;
 b=gJ4Qdx8T6P56nodbHk29iW9NeLhKTSAJ3EUO4JmsTF4XPoVo8QDDDsEbM7hkvp4qdx
 azoWTT+aCCHZoxdkp2koMtCFh1RmnJSU81VvlMujfBtOTVLhO1XrRH0zDvxy87Xgf1OJ
 fuvNX7ERZiC9TDQxpXgkVwxSRToz2jrT57OncQa/HlKqVTrU6HJdkFh18+5vBfjqk80P
 nd3g0oTaKM8uEaJXL+EwmYk3/HyzDptgMhbuKa007Ix2N23up51zhlPnY3KbmlSZBvfC
 xeq9SI0lua6YeaPhlyu5tpuWJ99hi0TCG6T2wmldpXI1+fz017AKwl1YI3t7gioR/xZ6
 HxNg==
X-Gm-Message-State: AOAM532DJ+i1WlPOS4dZibZ7LM9LphvRyc5MnXmIxviH+0u3l8x1gitw
 o0AWSD65h2KX30kaZz1Xn5KEPw==
X-Google-Smtp-Source: ABdhPJzLYaBuywYktzKyT3d3L8nNk3BLkUvnFZ0Ezs1FOfyo79yp3odlXmEzukOR29ixImYnN724Ew==
X-Received: by 2002:a2e:b702:: with SMTP id j2mr4960261ljo.354.1595021431429; 
 Fri, 17 Jul 2020 14:30:31 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id y24sm2091249lfy.49.2020.07.17.14.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 14:30:30 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id A444C1021DF; Sat, 18 Jul 2020 00:30:26 +0300 (+03)
Date: Sat, 18 Jul 2020 00:30:26 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: James Jones <jajones@nvidia.com>
Subject: Re: [PATCH] drm/nouveau: Accept 'legacy' format modifiers
Message-ID: <20200717213026.eisp7qaf4ckskemx@box>
References: <20200717185757.2786-1-jajones@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717185757.2786-1-jajones@nvidia.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 11:57:57AM -0700, James Jones wrote:
> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
> family of modifiers to handle broken userspace
> Xorg modesetting and Mesa drivers.
> 
> Tested with Xorg 1.20 modesetting driver,
> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
> gnome & KDE wayland desktops from Ubuntu 18.04,
> and sway 1.5
> 
> Signed-off-by: James Jones <jajones@nvidia.com>

I tried and it crashes. Not sure if it's related.

[drm:drm_ioctl] pid=3327, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[drm:vblank_disable_fn] disabling vblank on crtc 0
[drm:drm_ioctl] pid=3351, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[drm:drm_ioctl] pid=3351, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[drm:drm_ioctl] pid=3351, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[drm:drm_ioctl] pid=3351, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
BUG: unable to handle page fault for address: 00000000ffff059c
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 13 PID: 3351 Comm: alacritty Tainted: G          I       5.8.0-rc5-00191-g086f86c033f9 #53
Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS Gaming 3 Pro/X299 AORUS Gaming 3 Pro-CF, BIOS F5d 11/28/2019
RIP: 0010:kmem_cache_alloc_trace (/home/kas/linux/torvalds/mm/slub.c:272 /home/kas/linux/torvalds/mm/slub.c:278 /home/kas/linux/torvalds/mm/slub.c:292 /home/kas/linux/torvalds/mm/slub.c:2791 /home/kas/linux/torvalds/mm/slub.c:2832 /home/kas/linux/torvalds/mm/slub.c:2849) 
Code: 8b 51 08 48 89 c8 65 48 03 05 d4 0e ca 70 48 8b 70 08 48 39 f2 75 e7 4c 8b 38 4d 85 ff 0f 84 8f 01 00 00 8b 45 20 48 8b 7d 00 <49> 8b 1c 07 40 f6 c7 0f 0f 85 95 01 00 00 48 8d 8a 80 00 00 00 4c
All code
========
   0:	8b 51 08             	mov    0x8(%rcx),%edx
   3:	48 89 c8             	mov    %rcx,%rax
   6:	65 48 03 05 d4 0e ca 	add    %gs:0x70ca0ed4(%rip),%rax        # 0x70ca0ee2
   d:	70 
   e:	48 8b 70 08          	mov    0x8(%rax),%rsi
  12:	48 39 f2             	cmp    %rsi,%rdx
  15:	75 e7                	jne    0xfffffffffffffffe
  17:	4c 8b 38             	mov    (%rax),%r15
  1a:	4d 85 ff             	test   %r15,%r15
  1d:	0f 84 8f 01 00 00    	je     0x1b2
  23:	8b 45 20             	mov    0x20(%rbp),%eax
  26:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
  2a:*	49 8b 1c 07          	mov    (%r15,%rax,1),%rbx		<-- trapping instruction
  2e:	40 f6 c7 0f          	test   $0xf,%dil
  32:	0f 85 95 01 00 00    	jne    0x1cd
  38:	48 8d 8a 80 00 00 00 	lea    0x80(%rdx),%rcx
  3f:	4c                   	rex.WR

Code starting with the faulting instruction
===========================================
   0:	49 8b 1c 07          	mov    (%r15,%rax,1),%rbx
   4:	40 f6 c7 0f          	test   $0xf,%dil
   8:	0f 85 95 01 00 00    	jne    0x1a3
   e:	48 8d 8a 80 00 00 00 	lea    0x80(%rdx),%rcx
  15:	4c                   	rex.WR
RSP: 0018:ffffa8a381bcfba0 EFLAGS: 00010206
RAX: 0000000000000030 RBX: ffff9c0b15e05e00 RCX: 000000000003fe50
RDX: 000000000000fc8d RSI: 000000000000fc8d RDI: 000000000003fe50
RBP: ffff9c0b18407840 R08: 0000000000000000 R09: 0000000000000001
R10: ffff9c0b06c28000 R11: 0000000000000001 R12: 0000000000000dc0
[drm:drm_ioctl] pid=3327, dev=0xe200, auth=1, DRM_IOCTL_CRTC_GET_SEQUENCE
R13: 0000000000000060 R14: ffffffff8fa35a47 R15: 00000000ffff056c
FS:  00007fbe7a8e3900(0000) GS:ffff9c0b1f880000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000ffff059c CR3: 000000103c7fe004 CR4: 00000000003606e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
nouveau_fence_new (/home/kas/linux/torvalds/include/linux/slab.h:555 /home/kas/linux/torvalds/include/linux/slab.h:669 /home/kas/linux/torvalds/drivers/gpu/drm/nouveau/nouveau_fence.c:423) 
[drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
nouveau_gem_ioctl_pushbuf (/home/kas/linux/torvalds/drivers/gpu/drm/nouveau/nouveau_gem.c:852) 
[drm:drm_ioctl] pid=3327, dev=0xe200, auth=1, DRM_IOCTL_CRTC_QUEUE_SEQUENCE
? nouveau_gem_ioctl_new (/home/kas/linux/torvalds/drivers/gpu/drm/nouveau/nouveau_gem.c:680) 
? drm_ioctl_kernel (/home/kas/linux/torvalds/drivers/gpu/drm/drm_ioctl.c:793) 
? nouveau_gem_ioctl_new (/home/kas/linux/torvalds/drivers/gpu/drm/nouveau/nouveau_gem.c:680) 
drm_ioctl_kernel (/home/kas/linux/torvalds/drivers/gpu/drm/drm_ioctl.c:793) 
drm_ioctl (/home/kas/linux/torvalds/drivers/gpu/drm/drm_ioctl.c:888) 
? nouveau_gem_ioctl_new (/home/kas/linux/torvalds/drivers/gpu/drm/nouveau/nouveau_gem.c:680) 
? _raw_spin_unlock_irqrestore (/home/kas/linux/torvalds/arch/x86/include/asm/irqflags.h:41 /home/kas/linux/torvalds/arch/x86/include/asm/irqflags.h:84 /home/kas/linux/torvalds/include/linux/spinlock_api_smp.h:160 /home/kas/linux/torvalds/kernel/locking/spinlock.c:191) 
? lockdep_hardirqs_on (/home/kas/linux/torvalds/kernel/locking/lockdep.c:3727 (discriminator 3)) 
? _raw_spin_unlock_irqrestore (/home/kas/linux/torvalds/arch/x86/include/asm/preempt.h:102 /home/kas/linux/torvalds/include/linux/spinlock_api_smp.h:161 /home/kas/linux/torvalds/kernel/locking/spinlock.c:191) 
nouveau_drm_ioctl (/home/kas/linux/torvalds/drivers/gpu/drm/nouveau/nouveau_drm.c:1120) 
ksys_ioctl (/home/kas/linux/torvalds/fs/ioctl.c:48 /home/kas/linux/torvalds/fs/ioctl.c:753) 
__x64_sys_ioctl (/home/kas/linux/torvalds/fs/ioctl.c:762 /home/kas/linux/torvalds/fs/ioctl.c:760 /home/kas/linux/torvalds/fs/ioctl.c:760) 
do_syscall_64 (/home/kas/linux/torvalds/arch/x86/entry/common.c:384) 
entry_SYSCALL_64_after_hwframe (/home/kas/linux/torvalds/arch/x86/entry/entry_64.S:124) 
RIP: 0033:0x7fbe7ab9cd37
Code: Bad RIP value.

Code starting with the faulting instruction
===========================================
RSP: 002b:00007fff4c0cf0e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fff4c0cf150 RCX: 00007fbe7ab9cd37
RDX: 00007fff4c0cf150 RSI: 00000000c0406481 RDI: 0000000000000009
RBP: 00000000c0406481 R08: 000055db823225e8 R09: 000055db8231b5e8
R10: 00007fbe79ce0920 R11: 0000000000000246 R12: 000055db823115e0
R13: 0000000000000009 R14: 000055db8230ffc0 R15: 000055db8230f380
Modules linked in:
CR2: 00000000ffff059c
---[ end trace 9db4c132a431e9c9 ]---
RIP: 0010:kmem_cache_alloc_trace (/home/kas/linux/torvalds/mm/slub.c:272 /home/kas/linux/torvalds/mm/slub.c:278 /home/kas/linux/torvalds/mm/slub.c:292 /home/kas/linux/torvalds/mm/slub.c:2791 /home/kas/linux/torvalds/mm/slub.c:2832 /home/kas/linux/torvalds/mm/slub.c:2849) 
Code: 8b 51 08 48 89 c8 65 48 03 05 d4 0e ca 70 48 8b 70 08 48 39 f2 75 e7 4c 8b 38 4d 85 ff 0f 84 8f 01 00 00 8b 45 20 48 8b 7d 00 <49> 8b 1c 07 40 f6 c7 0f 0f 85 95 01 00 00 48 8d 8a 80 00 00 00 4c
All code
========
   0:	8b 51 08             	mov    0x8(%rcx),%edx
   3:	48 89 c8             	mov    %rcx,%rax
   6:	65 48 03 05 d4 0e ca 	add    %gs:0x70ca0ed4(%rip),%rax        # 0x70ca0ee2
   d:	70 
   e:	48 8b 70 08          	mov    0x8(%rax),%rsi
  12:	48 39 f2             	cmp    %rsi,%rdx
  15:	75 e7                	jne    0xfffffffffffffffe
  17:	4c 8b 38             	mov    (%rax),%r15
  1a:	4d 85 ff             	test   %r15,%r15
  1d:	0f 84 8f 01 00 00    	je     0x1b2
  23:	8b 45 20             	mov    0x20(%rbp),%eax
  26:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
  2a:*	49 8b 1c 07          	mov    (%r15,%rax,1),%rbx		<-- trapping instruction
  2e:	40 f6 c7 0f          	test   $0xf,%dil
  32:	0f 85 95 01 00 00    	jne    0x1cd
  38:	48 8d 8a 80 00 00 00 	lea    0x80(%rdx),%rcx
  3f:	4c                   	rex.WR

Code starting with the faulting instruction
===========================================
   0:	49 8b 1c 07          	mov    (%r15,%rax,1),%rbx
   4:	40 f6 c7 0f          	test   $0xf,%dil
   8:	0f 85 95 01 00 00    	jne    0x1a3
   e:	48 8d 8a 80 00 00 00 	lea    0x80(%rdx),%rcx
  15:	4c                   	rex.WR
RSP: 0018:ffffa8a381bcfba0 EFLAGS: 00010206
RAX: 0000000000000030 RBX: ffff9c0b15e05e00 RCX: 000000000003fe50
RDX: 000000000000fc8d RSI: 000000000000fc8d RDI: 000000000003fe50
RBP: ffff9c0b18407840 R08: 0000000000000000 R09: 0000000000000001
R10: ffff9c0b06c28000 R11: 0000000000000001 R12: 0000000000000dc0
R13: 0000000000000060 R14: ffffffff8fa35a47 R15: 00000000ffff056c
FS:  00007fbe7a8e3900(0000) GS:ffff9c0b1f880000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000ffff059c CR3: 000000103c7fe004 CR4: 00000000003606e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
BUG: sleeping function called from invalid context at include/linux/percpu-rwsem.h:49
in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 3351, name: alacritty
INFO: lockdep is turned off.
irq event stamp: 302346
hardirqs last enabled at (302345): kfree_call_rcu (/home/kas/linux/torvalds/arch/x86/include/asm/irqflags.h:41 (discriminator 2) /home/kas/linux/torvalds/arch/x86/include/asm/irqflags.h:84 (discriminator 2) /home/kas/linux/torvalds/kernel/rcu/tree.c:3287 (discriminator 2)) 
hardirqs last disabled at (302346): idtentry_enter_cond_rcu (/home/kas/linux/torvalds/arch/x86/entry/common.c:652) 
softirqs last enabled at (302186): __do_softirq (/home/kas/linux/torvalds/arch/x86/include/asm/preempt.h:26 /home/kas/linux/torvalds/kernel/softirq.c:320) 
softirqs last disabled at (302175): asm_call_on_stack (/home/kas/linux/torvalds/arch/x86/entry/entry_64.S:719) 
CPU: 13 PID: 3351 Comm: alacritty Tainted: G      D   I       5.8.0-rc5-00191-g086f86c033f9 #53
Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS Gaming 3 Pro/X299 AORUS Gaming 3 Pro-CF, BIOS F5d 11/28/2019
Call Trace:
dump_stack (/home/kas/linux/torvalds/lib/dump_stack.c:120) 
___might_sleep.cold (/home/kas/linux/torvalds/kernel/sched/core.c:6900) 
exit_signals (/home/kas/linux/torvalds/include/linux/percpu-rwsem.h:51 /home/kas/linux/torvalds/include/linux/cgroup-defs.h:733 /home/kas/linux/torvalds/kernel/signal.c:2828) 
do_exit (/home/kas/linux/torvalds/kernel/exit.c:764) 
? ksys_ioctl (/home/kas/linux/torvalds/fs/ioctl.c:48 /home/kas/linux/torvalds/fs/ioctl.c:753) 
rewind_stack_do_exit (/home/kas/linux/torvalds/arch/x86/entry/thunk_64.S:40) 
RIP: 0033:0x7fbe7ab9cd37
Code: Bad RIP value.

Code starting with the faulting instruction
===========================================
RSP: 002b:00007fff4c0cf0e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fff4c0cf150 RCX: 00007fbe7ab9cd37
RDX: 00007fff4c0cf150 RSI: 00000000c0406481 RDI: 0000000000000009
RBP: 00000000c0406481 R08: 000055db823225e8 R09: 000055db8231b5e8
R10: 00007fbe79ce0920 R11: 0000000000000246 R12: 000055db823115e0
R13: 0000000000000009 R14: 000055db8230ffc0 R15: 000055db8230f380

-- 
 Kirill A. Shutemov
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
