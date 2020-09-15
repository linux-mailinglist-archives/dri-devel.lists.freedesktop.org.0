Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D426AFE9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 23:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE746E210;
	Tue, 15 Sep 2020 21:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88B96E1E0;
 Tue, 15 Sep 2020 21:49:59 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id lo4so7160095ejb.8;
 Tue, 15 Sep 2020 14:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lbqh4AT1ZomtE66U2qUa6kFUvkStHtV0IT0aN6KCAGQ=;
 b=L8SrHxtVh/9gIpxLoUj+yKmL5PAXPVItmeEs6QmM9Y4lJ2QJxfOqHmcXKBYR5q0o6m
 ARY0Q1i12e53VNwLnYIxGUAtpOJQfBnnVEoLXTjgO+ZjtYoo4VIWdQkcXLO1MC2Tkq7P
 DE2sdTEerQt4ot0qy9FYE60XbFKQp3td0NC9iYZcN/bcE1qmavq7LK5W3+YYCcwTSmy2
 X93rRjz+6BwpjmeNRJKULN9EJtVet36phCKLpf1axnsYtGfr8U5+BCrCQl59UOlI39uL
 WhxPMLGeYmFiTzMgcN5lH8d5c/Xw820yvw4gux/AS1lwAQP4e/49wsh1Wl+I57dAGeKH
 4DHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lbqh4AT1ZomtE66U2qUa6kFUvkStHtV0IT0aN6KCAGQ=;
 b=C/z6n5pS+1xC+M1IQTLJOSXZ4I9FQ4h3Uf+5wEP3bUCP1Obdfd8TelhsVa+PaLjRob
 LVY7T8Gjd1t8DjadPFA67DS725gbmM7YU7OKXuxajrFOrhDGVV2KZh1khXnrNEj3CxXo
 8XqMNk9as3slUwpIt0MVMZZ2fM6SGR5NHusUWDaz3qjYAzRzZno2j4B5VzhNBJOYjeu8
 QRkIjjl47MUiRPbWFwspmzzMz7J0d5725ClyB01y5Ea0CRaPsd7hq0z+ZT425Is9rQ2E
 sJALPda6F0AooyVgjEHjlfVKSWYLMJmFd2kZyjsAzrGnBEueYNIeW6STAFur/mHZjRW/
 gt3Q==
X-Gm-Message-State: AOAM531uhB8B6r3Xc2/TaH5ykEEGDxH6OFGTOZ0fbxSbjmCdFOyUJqmO
 ffMzgPMzYZ8QGkW5loUl62m3Gl9Eqd7LMXAAOM8=
X-Google-Smtp-Source: ABdhPJwFw1PqOQ2yPh5QDordqiWxvoA74Z+O9tMA/lbN8SWeP9mHNhI8fUZurynRPPgu9ukHloOnsQ5thMxRYsGBpwE=
X-Received: by 2002:a17:906:813:: with SMTP id
 e19mr21855444ejd.101.1600206598140; 
 Tue, 15 Sep 2020 14:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <7766386a-3a62-d7d9-9ff5-4283b72113ca@molgen.mpg.de>
In-Reply-To: <7766386a-3a62-d7d9-9ff5-4283b72113ca@molgen.mpg.de>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 16 Sep 2020 07:49:46 +1000
Message-ID: <CAPM=9tyLczggV7Eb7frO77YwYfRzuRbM8E7n=FXCay0jGVTqvA@mail.gmail.com>
Subject: Re: General protection fault: RIP: 0010:free_block+0xdc/0x1f0
To: Paul Menzel <pmenzel@molgen.mpg.de>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cc'ing some more people.

On Tue, 15 Sep 2020 at 23:07, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Andrew folks, dear Linux folks,
>
>
> With Linux 5.9-rc4 on a Dell OptiPlex 5080 with Intel Core i7-10700 CPU
> @ 2.90GHz, and external
>
>      01:00.0 VGA compatible controller [0300]: Advanced Micro Devices,
> Inc. [AMD/ATI] Oland [Radeon HD 8570 / R7 240/340 OEM] [1002:6611] (rev 87)
>
> running graphical demanding applications glmark2 [1] and the Phoronix
> Test Suite [2] benchmark *pts/desktop-graphics* [3]
>
>      $ git describe --tags
>      v10.0.0m1-13-g0b5ddc3c0
>
> I got three general protection faults, and it restarted or froze (no
> input devices working, screen froze and even network card (no ping)).
>
> Here the system restarted itself:
>
> > kernel: general protection fault, probably for non-canonical address 0xdead000000000100: 0000 [#1] SMP NOPTI
> > kernel: CPU: 2 PID: 9702 Comm: glmark2 Kdump: loaded Not tainted 5.9.0-rc4.mx64.343 #1
> > kernel: Hardware name: Dell Inc. OptiPlex 5080/032W55, BIOS 1.1.7 08/17/2020
> > kernel: RIP: 0010:free_block+0xdc/0x1f0
>
> Here it froze:
>
> > [14639.665745] general protection fault, probably for non-canonical address 0xdead000000000100: 0000 [#1] SMP NOPTI
> > [14639.675917] CPU: 15 PID: 23094 Comm: pvpython Kdump: loaded Not tainted 5.9.0-rc4.mx64.343 #1
> > [14639.684431] Hardware name: Dell Inc. OptiPlex 5080/032W55, BIOS 1.1.7 08/17/2020
> > [14639.691823] RIP: 0010:free_block+0xdc/0x1f0
>
> Here it froze:
>
> > kernel: general protection fault, probably for non-canonical address 0xdead000000000100: 0000 [#1] SMP NOPTI
> > kernel: CPU: 15 PID: 23094 Comm: pvpython Kdump: loaded Not tainted 5.9.0-rc4.mx64.343 #1
> > kernel: Hardware name: Dell Inc. OptiPlex 5080/032W55, BIOS 1.1.7 08/17/2020
> > kernel: RIP: 0010:free_block+0xdc/0x1f0
>
> Running `scripts/decode_stacktrace.sh`:
>
> > linux-5.9_rc4-343.x86_64/source$ scripts/decode_stacktrace.sh vmlinux < optiplex-5080-linux-5.9-rc4-gp-pvpython.txt
> > [14528.718656] cgroup: fork rejected by pids controller in /user.slice/user-5272.slice/session-c6.scope
> > [14639.665745] general protection fault, probably for non-canonical address 0xdead000000000100: 0000 [#1] SMP NOPTI
> > [14639.675917] CPU: 15 PID: 23094 Comm: pvpython Kdump: loaded Not tainted 5.9.0-rc4.mx64.343 #1
> > [14639.684431] Hardware name: Dell Inc. OptiPlex 5080/032W55, BIOS 1.1.7 08/17/2020
> > [14639.691823] RIP: 0010:free_block (./include/linux/list.h:112 ./include/linux/list.h:135 ./include/linux/list.h:146 mm/slab.c:3336)
> > [14639.696006] Code: 00 48 01 d0 48 c1 e8 0c 48 c1 e0 06 4c 01 e8 48 8b 50 08 48 8d 4a ff 83 e2 01 48 0f 45 c1 48 8b 48 08 48 8b 50 10 4c 8d 78 08 <48> 89 51 08 48 89 0a 4c 89 da 48 2b 50 28 4c 89 60 08 48 89 68 10
> > All code
> > ========
> >    0: 00 48 01                add    %cl,0x1(%rax)
> >    3: d0 48 c1                rorb   -0x3f(%rax)
> >    6: e8 0c 48 c1 e0          callq  0xffffffffe0c14817
> >    b: 06                      (bad)
> >    c: 4c 01 e8                add    %r13,%rax
> >    f: 48 8b 50 08             mov    0x8(%rax),%rdx
> >   13: 48 8d 4a ff             lea    -0x1(%rdx),%rcx
> >   17: 83 e2 01                and    $0x1,%edx
> >   1a: 48 0f 45 c1             cmovne %rcx,%rax
> >   1e: 48 8b 48 08             mov    0x8(%rax),%rcx
> >   22: 48 8b 50 10             mov    0x10(%rax),%rdx
> >   26: 4c 8d 78 08             lea    0x8(%rax),%r15
> >   2a:*        48 89 51 08             mov    %rdx,0x8(%rcx)           <-- trapping instruction
> >   2e: 48 89 0a                mov    %rcx,(%rdx)
> >   31: 4c 89 da                mov    %r11,%rdx
> >   34: 48 2b 50 28             sub    0x28(%rax),%rdx
> >   38: 4c 89 60 08             mov    %r12,0x8(%rax)
> >   3c: 48 89 68 10             mov    %rbp,0x10(%rax)
> >
> > Code starting with the faulting instruction
> > ===========================================
> >    0: 48 89 51 08             mov    %rdx,0x8(%rcx)
> >    4: 48 89 0a                mov    %rcx,(%rdx)
> >    7: 4c 89 da                mov    %r11,%rdx
> >    a: 48 2b 50 28             sub    0x28(%rax),%rdx
> >    e: 4c 89 60 08             mov    %r12,0x8(%rax)
> >   12: 48 89 68 10             mov    %rbp,0x10(%rax)
> > [14639.714747] RSP: 0018:ffffc9001c26fab8 EFLAGS: 00010046
> > [14639.719970] RAX: ffffea000d193600 RBX: 0000000080000000 RCX: dead000000000100
> > [14639.727099] RDX: dead000000000122 RSI: ffff88842d5f3ef0 RDI: ffff88842b440300
> > [14639.734225] RBP: dead000000000122 R08: ffffc9001c26fb30 R09: ffff88842b441280
> > [14639.741351] R10: 000000000000000f R11: ffff8883464d80c0 R12: dead000000000100
> > [14639.748477] R13: ffffea0000000000 R14: ffff88842d5f3ff0 R15: ffffea000d193608
> > [14639.755604] FS:  00007fd3b7e8f040(0000) GS:ffff88842d5c0000(0000) knlGS:0000000000000000
> > [14639.763692] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [14639.769430] CR2: 00007fd344233548 CR3: 00000002f46aa003 CR4: 00000000007706e0
> > [14639.776556] PKRU: 55555554
> > [14639.779265] Call Trace:
> > [14639.781717] ___cache_free (mm/slab.c:3389 mm/slab.c:3455)
> > [14639.785463] kfree (./arch/x86/include/asm/irqflags.h:41 ./arch/x86/include/asm/irqflags.h:84 mm/slab.c:3757)
> > [14639.788432] kmem_freepages (mm/slab.h:266 mm/slab.h:437 mm/slab.c:1406)
> > [14639.792093] slab_destroy (mm/slab.c:1631)
> > [14639.795579] slabs_destroy (mm/slab.c:1639 (discriminator 12))
> > [14639.799152] ___cache_free (mm/slab.c:3406 mm/slab.c:3455)
> > [14639.802902] ? _cond_resched (kernel/sched/core.c:6123)
> > [14639.806650] kfree (./arch/x86/include/asm/irqflags.h:41 ./arch/x86/include/asm/irqflags.h:84 mm/slab.c:3757)
> > [14639.809644] amdgpu_vram_mgr_del (drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:439) amdgpu
> > [14639.814524] ttm_bo_cleanup_memtype_use (drivers/gpu/drm/ttm/ttm_bo.c:866 drivers/gpu/drm/ttm/ttm_bo.c:367) ttm
> > [14639.819748] ttm_bo_put (./include/linux/dma-resv.h:226 drivers/gpu/drm/ttm/ttm_bo.c:612 ./include/linux/kref.h:65 drivers/gpu/drm/ttm/ttm_bo.c:624) ttm
> > [14639.823768] amdgpu_bo_unref (drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:861) amdgpu
> > [14639.828313] amdgpu_vm_free_table (drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:953) amdgpu
> > [14639.833293] amdgpu_vm_free_pts (drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:975) amdgpu
> > [14639.838097] amdgpu_vm_fini (drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3119) amdgpu
> > [14639.842727] amdgpu_driver_postclose_kms (drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1116) amdgpu
> > [14639.848387] drm_file_free.part.9 (drivers/gpu/drm/drm_file.c:292) drm
> > [14639.853263] drm_release (./arch/x86/include/asm/atomic.h:123 ./include/asm-generic/atomic-instrumented.h:749 drivers/gpu/drm/drm_file.c:496) drm
> > [14639.857183] __fput (fs/file_table.c:282)
> > [14639.860238] task_work_run (kernel/task_work.c:143 (discriminator 1))
> > [14639.863811] exit_to_user_mode_prepare (./include/linux/tracehook.h:188 kernel/entry/common.c:163 kernel/entry/common.c:190)
> > [14639.868602] syscall_exit_to_user_mode (./arch/x86/include/asm/atomic.h:29 ./include/asm-generic/atomic-instrumented.h:28 ./include/linux/jump_label.h:254 ./arch/x86/include/asm/nospec-branch.h:288 ./arch/x86/include/asm/entry-common.h:80 kernel/entry/common.c:131 kernel/entry/common.c:267)
> > [14639.873304] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:125)
> > [14639.878353] RIP: 0033:0x7fd3d715cb5f
> > [14639.881925] Code: 20 00 f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 53 89 fb 48 83 ec 10 e8 bc fb ff ff 89 df 89 c2 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 15 89 d7 89 44 24 0c e8 fe fb ff ff 8b 44 24
> > All code
> > ========
> >    0: 20 00                   and    %al,(%rax)
> >    2: f7 d8                   neg    %eax
> >    4: 64 89 02                mov    %eax,%fs:(%rdx)
> >    7: b8 ff ff ff ff          mov    $0xffffffff,%eax
> >    c: c3                      retq
> >    d: 66 0f 1f 44 00 00       nopw   0x0(%rax,%rax,1)
> >   13: 53                      push   %rbx
> >   14: 89 fb                   mov    %edi,%ebx
> >   16: 48 83 ec 10             sub    $0x10,%rsp
> >   1a: e8 bc fb ff ff          callq  0xfffffffffffffbdb
> >   1f: 89 df                   mov    %ebx,%edi
> >   21: 89 c2                   mov    %eax,%edx
> >   23: b8 03 00 00 00          mov    $0x3,%eax
> >   28: 0f 05                   syscall
> >   2a:*        48 3d 00 f0 ff ff       cmp    $0xfffffffffffff000,%rax         <-- trapping instruction
> >   30: 77 15                   ja     0x47
> >   32: 89 d7                   mov    %edx,%edi
> >   34: 89 44 24 0c             mov    %eax,0xc(%rsp)
> >   38: e8 fe fb ff ff          callq  0xfffffffffffffc3b
> >   3d: 8b                      .byte 0x8b
> >   3e: 44                      rex.R
> >   3f: 24                      .byte 0x24
> >
> > Code starting with the faulting instruction
> > ===========================================
> >    0: 48 3d 00 f0 ff ff       cmp    $0xfffffffffffff000,%rax
> >    6: 77 15                   ja     0x1d
> >    8: 89 d7                   mov    %edx,%edi
> >    a: 89 44 24 0c             mov    %eax,0xc(%rsp)
> >    e: e8 fe fb ff ff          callq  0xfffffffffffffc11
> >   13: 8b                      .byte 0x8b
> >   14: 44                      rex.R
> >   15: 24                      .byte 0x24
> > [14639.900667] RSP: 002b:00007fff07ed2f40 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
> > [14639.908229] RAX: 0000000000000000 RBX: 0000000000000008 RCX: 00007fd3d715cb5f
> > [14639.915354] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000008
> > [14639.922480] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000000000e
> > [14639.929607] R10: 000000000000000c R11: 0000000000000293 R12: 0000000005168450
> > [14639.936732] R13: 0000000000000008 R14: 00000000007c8290 R15: 00007fff07ed31c0
> > [14639.943859] Modules linked in: rpcsec_gss_krb5 nfsv4 nfs 8021q garp stp mrp llc snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio i915 amdgpu gpu_sched ttm input_leds x86_pkg_temp_thermal iosf_mbi led_class drm_kms_helper kvm_intel snd_hda_codec_hdmi drm snd_hda_intel intel_gtt snd_intel_dspcfg kvm fb_sys_fops syscopyarea snd_hda_codec snd_hda_core sysfillrect wmi_bmof sysimgblt snd_pcm irqbypass wmi snd_timer snd deflate iTCO_wdt soundcore iTCO_vendor_support crc32c_intel efi_pstore video pstore nfsd auth_rpcgss nfs_acl lockd grace sunrpc efivarfs ip_tables x_tables unix ipv6 autofs4
> > [14639.996237] ---[ end trace c4d9d5f7e4b117a6 ]---
> > [14640.705681] RIP: 0010:free_block (./include/linux/list.h:112 ./include/linux/list.h:135 ./include/linux/list.h:146 mm/slab.c:3336)
> > [14640.709874] Code: 00 48 01 d0 48 c1 e8 0c 48 c1 e0 06 4c 01 e8 48 8b 50 08 48 8d 4a ff 83 e2 01 48 0f 45 c1 48 8b 48 08 48 8b 50 10 4c 8d 78 08 <48> 89 51 08 48 89 0a 4c 89 da 48 2b 50 28 4c 89 60 08 48 89 68 10
> > All code
> > ========
> >    0: 00 48 01                add    %cl,0x1(%rax)
> >    3: d0 48 c1                rorb   -0x3f(%rax)
> >    6: e8 0c 48 c1 e0          callq  0xffffffffe0c14817
> >    b: 06                      (bad)
> >    c: 4c 01 e8                add    %r13,%rax
> >    f: 48 8b 50 08             mov    0x8(%rax),%rdx
> >   13: 48 8d 4a ff             lea    -0x1(%rdx),%rcx
> >   17: 83 e2 01                and    $0x1,%edx
> >   1a: 48 0f 45 c1             cmovne %rcx,%rax
> >   1e: 48 8b 48 08             mov    0x8(%rax),%rcx
> >   22: 48 8b 50 10             mov    0x10(%rax),%rdx
> >   26: 4c 8d 78 08             lea    0x8(%rax),%r15
> >   2a:*        48 89 51 08             mov    %rdx,0x8(%rcx)           <-- trapping instruction
> >   2e: 48 89 0a                mov    %rcx,(%rdx)
> >   31: 4c 89 da                mov    %r11,%rdx
> >   34: 48 2b 50 28             sub    0x28(%rax),%rdx
> >   38: 4c 89 60 08             mov    %r12,0x8(%rax)
> >   3c: 48 89 68 10             mov    %rbp,0x10(%rax)
> >
> > Code starting with the faulting instruction
> > ===========================================
> >    0: 48 89 51 08             mov    %rdx,0x8(%rcx)
> >    4: 48 89 0a                mov    %rcx,(%rdx)
> >    7: 4c 89 da                mov    %r11,%rdx
> >    a: 48 2b 50 28             sub    0x28(%rax),%rdx
> >    e: 4c 89 60 08             mov    %r12,0x8(%rax)
> >   12: 48 89 68 10             mov    %rbp,0x10(%rax)
> > [14640.728612] RSP: 0018:ffffc9001c26fab8 EFLAGS: 00010046
> > [14640.733834] RAX: ffffea000d193600 RBX: 0000000080000000 RCX: dead000000000100
> > [14640.740962] RDX: dead000000000122 RSI: ffff88842d5f3ef0 RDI: ffff88842b440300
> > [14640.748092] RBP: dead000000000122 R08: ffffc9001c26fb30 R09: ffff88842b441280
> > [14640.755218] R10: 000000000000000f R11: ffff8883464d80c0 R12: dead000000000100
> > [14640.762348] R13: ffffea0000000000 R14: ffff88842d5f3ff0 R15: ffffea000d193608
> > [14640.769478] FS:  00007fd3b7e8f040(0000) GS:ffff88842d5c0000(0000) knlGS:0000000000000000
> > [14640.777558] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [14640.783327] CR2: 00007fd344233548 CR3: 00000002f46aa003 CR4: 00000000007706e0
> > [14640.790476] PKRU: 55555554
> > [14661.818409] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > [14661.824340] rcu:     6-...0: (1 GPs behind) idle=83a/1/0x4000000000000000 softirq=545426/545427 fqs=1448
> > [14661.833636]  (detected by 10, t=21025 jiffies, g=3736877, q=2158)
> > [14661.839726] Task dump for CPU 6:
> > [14661.842952] task:kworker/6:2     state:R  running task     stack:    0 pid: 7383 ppid:     2 flags:0x00004008
> > [14661.852856] Workqueue: events cache_reap
> > [14661.856779] Call Trace:
> > [14661.859230] ? cache_reap (mm/slab.c:3978)
> > [14661.862804] ? process_one_work (./arch/x86/include/asm/atomic.h:29 ./include/asm-generic/atomic-instrumented.h:28 ./include/linux/jump_label.h:254 ./include/linux/jump_label.h:264 ./include/trace/events/workqueue.h:108 kernel/workqueue.c:2274)
> > [14661.866987] ? cancel_delayed_work (kernel/workqueue.c:2358)
> > [14661.871254] ? worker_thread (./include/linux/list.h:282 kernel/workqueue.c:2416)
> > [14661.875087] ? cancel_delayed_work (kernel/workqueue.c:2358)
> > [14661.879354] ? kthread (kernel/kthread.c:292)
> > [14661.882756] ? kthread_use_mm (kernel/kthread.c:245)
> > [14661.886589] ? ret_from_fork (arch/x86/entry/entry_64.S:294)
> > [14726.905632] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > [14726.911561] rcu:     6-...0: (1 GPs behind) idle=83a/1/0x4000000000000000 softirq=545426/545427 fqs=1735
> > [14726.920856]  (detected by 10, t=86112 jiffies, g=3736877, q=3398)
> > [14726.926946] Task dump for CPU 6:
> > [14726.930172] task:kworker/6:2     state:R  running task     stack:    0 pid: 7383 ppid:     2 flags:0x00004008
> > [14726.940076] Workqueue: events cache_reap
> > [14726.943994] Call Trace:
> > [14726.946445] ? cache_reap (mm/slab.c:3978)
> > [14726.950019] ? process_one_work (./arch/x86/include/asm/atomic.h:29 ./include/asm-generic/atomic-instrumented.h:28 ./include/linux/jump_label.h:254 ./include/linux/jump_label.h:264 ./include/trace/events/workqueue.h:108 kernel/workqueue.c:2274)
> > [14726.954203] ? cancel_delayed_work (kernel/workqueue.c:2358)
> > [14726.958470] ? worker_thread (./include/linux/list.h:282 kernel/workqueue.c:2416)
> > [14726.962307] ? cancel_delayed_work (kernel/workqueue.c:2358)
> > [14726.966575] ? kthread (kernel/kthread.c:292)
> > [14726.969976] ? kthread_use_mm (kernel/kthread.c:245)
> > [14726.973809] ? ret_from_fork (arch/x86/entry/entry_64.S:294)
>
> Is that a known issue? Reproducing the problem often takes several
> hours, so some guidance on what to try would be great.
>
>
> Kind regards,
>
> Paul
>
>
> [1]: https://github.com/glmark2/glmark2
> [2]: https://phoronix-test-suite.com/
> [3]: https://openbenchmarking.org/suite/pts/desktop-graphics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
