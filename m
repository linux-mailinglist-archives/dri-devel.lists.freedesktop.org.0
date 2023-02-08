Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA6368EF5D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 13:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B2810E772;
	Wed,  8 Feb 2023 12:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8E110E772
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 12:56:22 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id y19so19202527ljq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 04:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHKqSgliJFaTj8hnqpvZXYSJZFNtXwpd9dTUnIFSw/M=;
 b=EurPR50Cx6SJCvS6JnOz6XezZChHTlF+uTRWJgtTOmWf3o33igg4YENw9l6XJiWfy8
 ZJaeEgNro+WHlLXuLmyfOdp5riM4nvw2IEI583y2xtASzDHLYD0zuU0zTNsjoFXzfpd6
 tvFTJnEZCsGdGtOjnidegTXtSuxc4cFXR1OqoxQs6ENu6IF7UH7aNsbjPb7cMkpO8mTU
 xTQ7x2P+L+VECkm9JChBjRBTonv1O8kDV2RZ0feQkfR6nch37MrU/I95H7BqraNUL4W9
 qfYU3gwG1b/6f0JrBeKTQQHMdVVeKEvfpU6TBrsCS7m41GaUymXzl5EHL1UiKNpZzJBt
 ZXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHKqSgliJFaTj8hnqpvZXYSJZFNtXwpd9dTUnIFSw/M=;
 b=6UexC1Zs9cCg1aY29HvfCSMLeIut22AvW0DENzKGx8UDbbQuB1gleLzmkA0PWzSCD/
 TlSBVVARE6Co4Qy2vJehSQ24XP1oqe/NHO0FJw06qkGqNzGeCp8mC12vOlVLeY9zovkS
 YP9fPoIkpx/s82xaH3inO2S3tQDse6IkF8DM3uiBWD31oV6sBmEv9nVGoHvkpmLEa5HV
 dxuStMdjYuSiD1+aEG8jrMozxWXVWU16nzlDHiyPt7X0D3BRvsrMQjbdY7yb86kKSHF4
 QGsO60oW5o7cPk/BbZe4phs9C7SRvtl68Oxi7iZB9aZi1ocVW9yBdTVOJNwtRi5bqxkC
 UBSA==
X-Gm-Message-State: AO0yUKWPemAFYK7jQSem7RRtEwJH3BXfRyr+5j8Vu3wyS5G2up8in+8o
 WQFkumN/TdmTL+LxgI+qhCgdWDfKZM457v7+res=
X-Google-Smtp-Source: AK7set91LRSZL1gXOK9+YVjQMh/vu8RZY8Qjqzs13/GyP6W/I4zRpdpfY2fZ/+cYnkfyT0vqzbtF6qgKofdKOOLD15M=
X-Received: by 2002:a05:651c:3c6:b0:290:5011:2332 with SMTP id
 f6-20020a05651c03c600b0029050112332mr1012334ljp.120.1675860980486; Wed, 08
 Feb 2023 04:56:20 -0800 (PST)
MIME-Version: 1.0
References: <202302081038.984b8c1-oliver.sang@intel.com>
 <92630398-efd1-24a4-be2b-9e4e7a577f13@amd.com>
 <CAM0jSHOcvZoyv-y6bnvFaUybRQsDx_mfOydL1uaNM4T4PgcA=A@mail.gmail.com>
 <ac595020-df15-6a33-ed18-d71afa2dd816@amd.com>
In-Reply-To: <ac595020-df15-6a33-ed18-d71afa2dd816@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 8 Feb 2023 12:55:53 +0000
Message-ID: <CAM0jSHPfDf9-SKcvwPoP8L0J=RTRrMXuAyg9cYh3w+So7gP=Wg@mail.gmail.com>
Subject: Re: [drm-misc:drm-misc-next] [drm/ttm] 1802537820:
 WARNING:at_drivers/gpu/drm/drm_gem_vram_helper.c:#drm_gem_vram_offset
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: lkp@intel.com, Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 oe-lkp@lists.linux.dev, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Feb 2023 at 12:41, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 08.02.23 um 10:38 schrieb Matthew Auld:
> > On Wed, 8 Feb 2023 at 08:32, Christian K=C3=B6nig <christian.koenig@amd=
.com> wrote:
> >> Hey guys,
> >>
> >> I'm pretty sure this is a bug in bochs which happens to surface becaus=
e
> >> of a recent TTM change, we have seen similar problems in the past with
> >> this driver.
> >>
> >> What happens is that userspace tries to bind a BO to a CRTC before the
> >> BO has even a backing store.
> >>
> >> Any idea how to fix this? I can just remove the warning, but that's no=
t
> >> really a good solution.
> > IIUC this driver is just using ttm_bo_move_memcpy() underneath for its
> > bo_move callback, which looks to be doing:
> >
> > if (!bo->resource)
> >      return 0;
> >
> > Which doesn't make any sense to me.There should at least be a
> > move_null(), and maybe also a multi-hop to handle clearing. Otherwise
> > bo->resource is likely always NULL (and we hit the above warning),
> > even after the dummy move. What do you think?
>
> Oh, good point. That should indeed be move_null().
>
> Do you want to write a patch or should I take care of this?

I can try to type that.

>
> Thanks for pointing that out,
> Christian.
>
> >
> >> Regards,
> >> Christian.
> >>
> >> Am 08.02.23 um 05:32 schrieb kernel test robot:
> >>> Greeting,
> >>>
> >>> FYI, we noticed WARNING:at_drivers/gpu/drm/drm_gem_vram_helper.c:#drm=
_gem_vram_offset due to commit (built with gcc-11):
> >>>
> >>> commit: 1802537820389183dfcd814e0f6a60d1496a75ef ("drm/ttm: stop allo=
cating dummy resources during BO creation")
> >>> git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> >>>
> >>> in testcase: boot
> >>>
> >>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp=
 2 -m 16G
> >>>
> >>> caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> >>>
> >>>
> >>> If you fix the issue, kindly add following tag
> >>> | Reported-by: kernel test robot <oliver.sang@intel.com>
> >>> | Link: https://lore.kernel.org/oe-lkp/202302081038.984b8c1-oliver.sa=
ng@intel.com
> >>>
> >>>
> >>> [   25.994992][    T1] ------------[ cut here ]------------
> >>> [ 25.995050][ T1] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_gem_v=
ram_helper.c:255 drm_gem_vram_offset (??:?)
> >>> [   25.995080][    T1] Modules linked in:
> >>> [   25.995100][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G      =
          T  6.2.0-rc6-01191-g180253782038 #1 a8db67375c3ac749313dafaec43f3=
9836e38fae9
> >>> [   25.995117][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> >>> [ 25.995128][ T1] RIP: 0010:drm_gem_vram_offset (??:?)
> >>> [ 25.995144][ T1] Code: 02 00 00 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a =
48 c1 ea 03 80 3c 02 00 74 05 e8 7f 1f eb fe 48 8b 9b 20 02 00 00 48 85 db =
75 06 <0f> 0b 31 c0 eb 4b 48 8d 7b 10 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a
> >>> All code
> >>> =3D=3D=3D=3D=3D=3D=3D=3D
> >>>      0:        02 00                   add    (%rax),%al
> >>>      2:        00 b8 ff ff 37 00       add    %bh,0x37ffff(%rax)
> >>>      8:        48 89 fa                mov    %rdi,%rdx
> >>>      b:        48 c1 e0 2a             shl    $0x2a,%rax
> >>>      f:        48 c1 ea 03             shr    $0x3,%rdx
> >>>     13:        80 3c 02 00             cmpb   $0x0,(%rdx,%rax,1)
> >>>     17:        74 05                   je     0x1e
> >>>     19:        e8 7f 1f eb fe          callq  0xfffffffffeeb1f9d
> >>>     1e:        48 8b 9b 20 02 00 00    mov    0x220(%rbx),%rbx
> >>>     25:        48 85 db                test   %rbx,%rbx
> >>>     28:        75 06                   jne    0x30
> >>>     2a:*       0f 0b                   ud2             <-- trapping i=
nstruction
> >>>     2c:        31 c0                   xor    %eax,%eax
> >>>     2e:        eb 4b                   jmp    0x7b
> >>>     30:        48 8d 7b 10             lea    0x10(%rbx),%rdi
> >>>     34:        b8 ff ff 37 00          mov    $0x37ffff,%eax
> >>>     39:        48 89 fa                mov    %rdi,%rdx
> >>>     3c:        48 c1 e0 2a             shl    $0x2a,%rax
> >>>
> >>> Code starting with the faulting instruction
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>      0:        0f 0b                   ud2
> >>>      2:        31 c0                   xor    %eax,%eax
> >>>      4:        eb 4b                   jmp    0x51
> >>>      6:        48 8d 7b 10             lea    0x10(%rbx),%rdi
> >>>      a:        b8 ff ff 37 00          mov    $0x37ffff,%eax
> >>>      f:        48 89 fa                mov    %rdi,%rdx
> >>>     12:        48 c1 e0 2a             shl    $0x2a,%rax
> >>> [   25.995156][    T1] RSP: 0000:ffffc9000001f028 EFLAGS: 00210246
> >>> [   25.995174][    T1] RAX: dffffc0000000000 RBX: 0000000000000000 RC=
X: 0000000000000000
> >>> [   25.995186][    T1] RDX: 1ffff11026dee544 RSI: ffff8881372d4b10 RD=
I: ffff888136f72a20
> >>> [   25.995196][    T1] RBP: ffffc9000001f030 R08: 0000000000000000 R0=
9: 0000000000000000
> >>> [   25.995206][    T1] R10: 0000000000000000 R11: 0000000000000000 R1=
2: ffff8881372d4b00
> >>> [   25.995215][    T1] R13: ffff888136e9ee00 R14: ffff888136f4a060 R1=
5: 0000000000000500
> >>> [   25.995225][    T1] FS:  0000000000000000(0000) GS:ffff8883aee0000=
0(0000) knlGS:0000000000000000
> >>> [   25.995236][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> >>> [   25.995247][    T1] CR2: 00000000f7fa1cd4 CR3: 0000000006015000 CR=
4: 00000000000406b0
> >>> [   25.995262][    T1] Call Trace:
> >>> [   25.995271][    T1]  <TASK>
> >>> [ 25.995287][ T1] bochs_plane_update (bochs.c:?)
> >>> [ 25.995308][ T1] ? rcu_read_lock_bh_held (??:?)
> >>> [ 25.995337][ T1] ? bochs_pci_probe (bochs.c:?)
> >>> [ 25.995352][ T1] ? srcu_read_unlock (blk-mq.c:?)
> >>> [ 25.995396][ T1] bochs_pipe_enable (bochs.c:?)
> >>> [ 25.995410][ T1] ? drm_dev_printk (??:?)
> >>> [ 25.995435][ T1] ? bochs_pipe_update (bochs.c:?)
> >>> [ 25.995454][ T1] ? bochs_plane_update (bochs.c:?)
> >>> [ 25.995473][ T1] ? bochs_pipe_update (bochs.c:?)
> >>> [ 25.995487][ T1] ? bochs_pipe_update (bochs.c:?)
> >>> [ 25.995507][ T1] drm_simple_kms_crtc_enable (drm_simple_kms_helper.c=
:?)
> >>> [ 25.995533][ T1] drm_atomic_helper_commit_modeset_enables (??:?)
> >>> [ 25.995570][ T1] drm_atomic_helper_commit_tail (??:?)
> >>> [ 25.995591][ T1] commit_tail (drm_atomic_helper.c:?)
> >>> [ 25.995631][ T1] drm_atomic_helper_commit (??:?)
> >>> [ 25.995652][ T1] ? commit_work (??:?)
> >>> [ 25.995670][ T1] drm_atomic_commit (??:?)
> >>> [ 25.995689][ T1] ? drm_atomic_nonblocking_commit (??:?)
> >>> [ 25.995703][ T1] ? __drm_atomic_helper_set_config (??:?)
> >>> [ 25.995716][ T1] ? malformed_message+0xe0/0xe0
> >>> [ 25.995741][ T1] ? update_output_state (??:?)
> >>> [ 25.995757][ T1] ? malformed_message+0xe0/0xe0
> >>> [ 25.995804][ T1] drm_client_modeset_commit_atomic (drm_client_modese=
t.c:?)
> >>> [ 25.995836][ T1] ? kmalloc_array (core.c:?)
> >>> [ 25.995894][ T1] ? mutex_trylock (mutex.c:?)
> >>> [ 25.995910][ T1] ? mark_lock+0x67/0x227
> >>> [ 25.995951][ T1] ? drm_fb_helper_lastclose (??:?)
> >>> [ 25.995966][ T1] drm_client_modeset_commit_locked (??:?)
> >>> [ 25.995988][ T1] drm_client_modeset_commit (??:?)
> >>> [ 25.996008][ T1] __drm_fb_helper_restore_fbdev_mode_unlocked (drm_fb=
_helper.c:?)
> >>> [ 25.996032][ T1] drm_fb_helper_set_par (??:?)
> >>> [ 25.996054][ T1] set_con2fb_map (fbcon.c:?)
> >>> [ 25.996090][ T1] do_fb_registered (fbcon.c:?)
> >>> [ 25.996119][ T1] fbcon_fb_registered (??:?)
> >>> [ 25.996138][ T1] do_register_framebuffer (fbmem.c:?)
> >>> [ 25.996158][ T1] ? get_fb_info+0xaa/0xaa
> >>> [ 25.996218][ T1] register_framebuffer (??:?)
> >>> [ 25.996241][ T1] __drm_fb_helper_initial_config_and_unlock (drm_fb_h=
elper.c:?)
> >>> [ 25.996268][ T1] ? __drm_fb_helper_find_sizes (drm_fb_helper.c:?)
> >>> [ 25.996321][ T1] drm_fb_helper_initial_config (??:?)
> >>> [ 25.996341][ T1] drm_fbdev_client_hotplug (drm_fbdev_generic.c:?)
> >>> [ 25.996363][ T1] drm_fbdev_generic_setup (??:?)
> >>> [ 25.996389][ T1] bochs_pci_probe (bochs.c:?)
> >>> [ 25.996413][ T1] ? bochs_hw_init (bochs.c:?)
> >>> [ 25.996429][ T1] ? trace_hardirqs_on (??:?)
> >>> [ 25.996456][ T1] ? bochs_hw_init (bochs.c:?)
> >>> [ 25.996477][ T1] local_pci_probe (pci-driver.c:?)
> >>> [ 25.996507][ T1] pci_call_probe (pci-driver.c:?)
> >>> [ 25.996520][ T1] ? rcu_read_lock_bh_held (??:?)
> >>> [ 25.996543][ T1] ? local_pci_probe (pci-driver.c:?)
> >>> [ 25.996563][ T1] ? __kasan_check_read (??:?)
> >>> [ 25.996830][ T1] ? pci_match_id (??:?)
> >>> [ 25.996854][ T1] ? pci_match_device (pci-driver.c:?)
> >>> [ 25.996882][ T1] pci_device_probe (pci-driver.c:?)
> >>> [ 25.996904][ T1] really_probe (dd.c:?)
> >>> [ 25.996933][ T1] __driver_probe_device (dd.c:?)
> >>> [ 25.996955][ T1] ? __device_attach_driver (dd.c:?)
> >>> [ 25.996970][ T1] driver_probe_device (dd.c:?)
> >>> [ 25.996992][ T1] __driver_attach (dd.c:?)
> >>> [ 25.997014][ T1] ? __device_attach_driver (dd.c:?)
> >>> [ 25.997030][ T1] bus_for_each_dev (??:?)
> >>> [ 25.997050][ T1] ? next_device (core.c:?)
> >>> [ 25.997069][ T1] ? do_raw_spin_unlock (??:?)
> >>> [ 25.997107][ T1] driver_attach (??:?)
> >>> [ 25.997127][ T1] bus_add_driver (??:?)
> >>> [ 25.997158][ T1] driver_register (??:?)
> >>> [ 25.997182][ T1] __pci_register_driver (??:?)
> >>> [ 25.997202][ T1] ? etnaviv_init (bochs.c:?)
> >>> [ 25.997221][ T1] bochs_pci_driver_init (bochs.c:?)
> >>> [ 25.997240][ T1] do_one_initcall (??:?)
> >>> [ 25.997260][ T1] ? rcu_lock_acquire (??:?)
> >>> [ 25.997277][ T1] ? lock_is_held (signal.c:?)
> >>> [ 25.997293][ T1] ? rcu_read_lock_sched_held (??:?)
> >>> [ 25.997311][ T1] ? rcu_read_lock_bh_held (??:?)
> >>> [ 25.997325][ T1] ? ____kasan_kmalloc (common.c:?)
> >>> [ 25.997348][ T1] ? __kasan_check_read (??:?)
> >>> [ 25.997376][ T1] do_initcalls (main.c:?)
> >>> [ 25.997419][ T1] kernel_init_freeable (main.c:?)
> >>> [ 25.997434][ T1] ? rest_init (main.c:?)
> >>> [ 25.997461][ T1] kernel_init (main.c:?)
> >>> [ 25.997481][ T1] ret_from_fork (??:?)
> >>> [   25.997537][    T1]  </TASK>
> >>> [   25.997547][    T1] irq event stamp: 177845
> >>> [ 25.997555][ T1] hardirqs last enabled at (177851): console_trylock_=
spinning (printk.c:?)
> >>> [ 25.997573][ T1] hardirqs last disabled at (177856): console_trylock=
_spinning (printk.c:?)
> >>> [ 25.997589][ T1] softirqs last enabled at (176444): __do_softirq (??=
:?)
> >>> [ 25.997608][ T1] softirqs last disabled at (176437): __irq_exit_rcu =
(softirq.c:?)
> >>> [   25.997623][    T1] ---[ end trace 0000000000000000 ]---
> >>> [   26.013462][   T14] general protection fault, probably for non-can=
onical address 0xdffffc0000000004: 0000 [#1] SMP KASAN
> >>> [   26.013480][   T14] KASAN: null-ptr-deref in range [0x000000000000=
0020-0x0000000000000027]
> >>> [   26.013490][   T14] CPU: 0 PID: 14 Comm: kworker/0:1 Tainted: G   =
     W       T  6.2.0-rc6-01191-g180253782038 #1 a8db67375c3ac749313dafaec4=
3f39836e38fae9
> >>> [   26.013503][   T14] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> >>> [   26.013509][   T14] Workqueue: events drm_fb_helper_damage_work
> >>> [ 26.013528][ T14] RIP: 0010:ttm_mem_io_reserve (??:?)
> >>> [ 26.013544][ T14] Code: f6 31 ff 45 31 c0 c3 55 b8 ff ff 37 00 48 c1=
 e0 2a 48 89 e5 41 55 49 89 fd 48 8d 7e 20 48 89 fa 41 54 49 89 f4 48 c1 ea=
 03 53 <80> 3c 02 00 74 05 e8 05 60 e5 fe 49 83 7c 24 20 00 74 07 31 c0 e9
> >>> All code
> >>> =3D=3D=3D=3D=3D=3D=3D=3D
> >>>      0:        f6 31                   divb   (%rcx)
> >>>      2:        ff 45 31                incl   0x31(%rbp)
> >>>      5:        c0 c3 55                rol    $0x55,%bl
> >>>      8:        b8 ff ff 37 00          mov    $0x37ffff,%eax
> >>>      d:        48 c1 e0 2a             shl    $0x2a,%rax
> >>>     11:        48 89 e5                mov    %rsp,%rbp
> >>>     14:        41 55                   push   %r13
> >>>
> >>>
> >>> To reproduce:
> >>>
> >>>           # build kernel
> >>>        cd linux
> >>>        cp config-6.2.0-rc6-01191-g180253782038 .config
> >>>        make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 olddefconfig pr=
epare modules_prepare bzImage modules
> >>>        make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 INSTALL_MOD_PAT=
H=3D<mod-install-dir> modules_install
> >>>        cd <mod-install-dir>
> >>>        find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> >>>
> >>>
> >>>           git clone https://github.com/intel/lkp-tests.git
> >>>           cd lkp-tests
> >>>           bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-s=
cript is attached in this email
> >>>
> >>>           # if come across any failure that blocks the test,
> >>>           # please remove ~/.lkp and /lkp dir to run from a clean sta=
te.
> >>>
> >>>
> >>>
>
