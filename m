Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4101BA467
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 15:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111DE6E2CC;
	Mon, 27 Apr 2020 13:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70166E1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 13:17:33 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d16so13405628edv.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kPbcyKCI5i3qhhr4VnjGEeB5Mry38hN4MavGhs0oYH0=;
 b=yC2lPAJSkKEH0EdCtgumeYPVVLpieM/Gr4gXXWrvf1MMDYwkdx5NkGdNdqGbIvdvg1
 cBn9I0bRdvULNtxB47ZXsGPytqtYN+AtnKVb4NrqwpInuNu/cmo9QWBeDxx5A3C8g3Xk
 Et4o63zSDBBK9BJ4xAjb0Tj0awbxzejOQcT7QHzDreX7ev+aih8xkJ9/SIBzVcSARbe8
 bO/61HLuo8uz+8OVHNKsjsRjw2QIEVomxADZwehqrBidh55ieEc652u9d0WP5/OerJi1
 Dyg2YEq67IMjxd+8NGGgJ7hnX7SmT80/K1Kq+GZLp+dP/DgKuPSsPoZLMYv6pvi9Pix9
 V7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kPbcyKCI5i3qhhr4VnjGEeB5Mry38hN4MavGhs0oYH0=;
 b=OvXoV0xVbJptg9QG+DL5oiZyJQBgWxjLMPaQjb8Kx+d5r0M5+Mj8lF64gai4lob+bq
 LykH2qmEv9UVfjeWmTn21avr8NecYsWdPHffvqw7kG07s5pgDqbBRuK2JD8V22zm9l8O
 i/WX2Dz4lhAKUi+MuGGv1tu5pZDAvVEWiqxOBhjz/lU0Tt5B5vjc+JLu3utlT9Q3nKAt
 stiQGmZbYwIdDgVF60zTmDZyq6kwXmKiE4vFfqUJWofXZLnp1b1r6h+ZGAf0zp2m6A/j
 eWPHbuKjR0tGEEMJCYYDD7DIKyU6ct2S3E7iuMZW/zkrjIkvrhtZg7BvExt0zIgiokVF
 GkXA==
X-Gm-Message-State: AGi0Pub7PJpjBDvAJMVQOYznnno8rrN2LzChHxAGComspIakruRiF55K
 8DAyR7COqXua6rgqmwebiVnOISGIxJDeV3cwUSwUHQ==
X-Google-Smtp-Source: APiQypI/Ac1KvRBBQ1CHpy6widveJlXQ8a8HhDGWaeRH1VHLOGHM6CYz2UVKZqmoHVTNlueRmHspZxDRKSmMUpi3d7c=
X-Received: by 2002:a50:9e6a:: with SMTP id z97mr1252640ede.375.1587993451949; 
 Mon, 27 Apr 2020 06:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000089155205a43d9596@google.com>
In-Reply-To: <00000000000089155205a43d9596@google.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 27 Apr 2020 10:17:20 -0300
Message-ID: <CAAEAJfBZ8bypsLpPm2rFi8SxCkcRKhOgNxDRn+zxQqC22gFP2w@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in vkms_dumb_create
To: syzbot <syzbot+e3372a2afe1e7ef04bc7@syzkaller.appspotmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 David Airlie <airlied@linux.ie>, syzkaller-bugs@googlegroups.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Apr 2020 at 00:48, syzbot
<syzbot+e3372a2afe1e7ef04bc7@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    c578ddb3 Merge tag 'linux-kselftest-5.7-rc3' of git://git...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10fbf0d8100000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b7a70e992f2f9b68
> dashboard link: https://syzkaller.appspot.com/bug?extid=e3372a2afe1e7ef04bc7
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15438330100000
>
> Bisection is inconclusive: the first bad commit could be any of:
>
> 85b5bafb drm/cma-helper: Remove drm_fb_cma_fbdev_init_with_funcs()
> dff1c703 drm/tinydrm: Use drm_fbdev_generic_setup()
> 23167fa9 drm/panel: simple: Add support for Rocktech RK070ER9427 LCD panel
> 9060d7f4 drm/fb-helper: Finish the generic fbdev emulation
> 2230ca12 dt-bindings: display: Document the EDT et* displays in one file.
> e896c132 drm/debugfs: Add internal client debugfs file
> 894a677f drm/cma-helper: Use the generic fbdev emulation
> aa7e6455 drm/panel: Add support for the EDT ETM0700G0BDH6
> 244007ec drm/pl111: Set .gem_prime_vmap and .gem_prime_mmap
> aad34de2 drm/panel: Add support for the EDT ETM0700G0EDH6
> 7a6aca49 dt-bindings: Add vendor prefix for DLC Display Co., Ltd.
> d536540f drm/fb-helper: Add generic fbdev emulation .fb_probe function
> 0ca0c827 drm/panel: simple: Add DLC DLC0700YZG-1 panel
> c76f0f7c drm: Begin an API for in-kernel clients
> 5ba57bab drm: vkms: select DRM_KMS_HELPER
> 5fa8e4a2 drm/panel: Make of_drm_find_panel() return an ERR_PTR() instead of NULL
> 008095e0 drm/vc4: Add support for the transposer block
> c59eb3cf drm/panel: Let of_drm_find_panel() return -ENODEV when the panel is disabled
> 1ebe99a7 drm/vc4: Call drm_atomic_helper_fake_vblank() in the commit path
> 2e64a174 drm/of: Make drm_of_find_panel_or_bridge() fail when the device is disabled
> 1b9883ea drm/vc4: Support the case where the DSI device is disabled
> 6fb42b66 drm/atomic: Call fake_vblank() from the generic commit_tail() helpers
> b0b7aa40 dt-bindings: display: Add DT bindings for BOE HV070WSA-100 panel
> b25c60af drm/crtc: Add a generic infrastructure to fake VBLANK events
> 184d3cf4 drm/vc4: Use wait_for_flip_done() instead of wait_for_vblanks()
> ae8cf41b drm/panel: simple: Add support for BOE HV070WSA-100 panel to simple-panel
> 814bde99 drm/connector: Make ->atomic_commit() optional
> 955f60db drm: Add support for extracting sync signal drive edge from videomode
> 3b39ad7a drm/panel: simple: Add newhaven, nhd-4.3-480272ef-atxl LCD
> 425132fd drm/connector: Pass a drm_connector_state to ->atomic_commit()
> a5d2ade6 drm/panel: simple: Add support for Innolux G070Y2-L01
> b82c1f8f drm/atomic: Avoid connector to writeback_connector casts
> 03fa9aa3 dt-bindings: Add DataImage, Inc. vendor prefix
> 73915b2b drm/writeback: Fix the "overview" section of the doc
> 97ceb1fb drm/panel: simple: Add support for DataImage SCF0700C48GGU18
> e22e9531 Merge drm-upstream/drm-next into drm-misc-next
> 3d5664f9 drm/panel: ili9881c: Fix missing assignment to error return ret
> a0120245 drm/crc: Only report a single overflow when a CRC fd is opened
> 7ad4e463 drm/panel: p079zca: Refactor panel driver to support multiple panels
> 8adbbb2e drm/stm: ltdc: rework reset sequence
> 48bd379a drm/panel: p079zca: Add variable unprepare_delay properties
> 7868e507 drm/stm: ltdc: filter mode pixel clock vs pad constraint
> 731edd4c dt-bindings: Add Innolux P097PFG panel bindings
> f8878bb2 drm: print plane state normalized zpos value
> ca52bea9 drm/atomic-helper: Use bitwise or for filling a bitmask
> de04a462 drm/panel: p079zca: Support Innolux P097PFG panel
> 2bb7a39c dt-bindings: Add vendor prefix for kingdisplay
> a65020d0 drm/v3d: Fix a grammar nit in the scheduler docs.
> 2dd4f211 drm/v3d: Add missing v3d documentation structure.
> ebc950fd dt-bindings: Add KINGDISPLAY KD097D04 panel bindings
> cd0e0ca6 drm/panel: type promotion bug in s6e8aa0_read_mtp_id()
> e0d01811 drm/v3d: Remove unnecessary dma_fence_ops.
> 624bb0c0 drm/v3d: Delay the scheduler timeout if we're still making progress.
> b6d83fcc drm/panel: p079zca: Use of_device_get_match_data()
> 408633d2 drm/v3d: use new return type vm_fault_t in v3d_gem_fault
> decac6b0 dt-bindings: display: sun4i-drm: Add R40 display engine compatible
> 0b7510d1 drm/tilcdc: Use drm_connector_has_possible_encoder()
> d978a94b drm/sun4i: Add R40 display engine compatible
> af11942e drm/sun4i: tcon-top: Cleanup clock handling
> f8222409 drm/msm: Use drm_connector_has_possible_encoder()
> 38cb8d96 drm: Add drm_connector_has_possible_encoder()
> da82107e drm/sun4i: tcon: Release node when traversing of graph
> 7a667775 dt-bindings: display: sun4i-drm: Add R40 TV TCON description
> 7b71ca24 drm/radeon: Use drm_connector_for_each_possible_encoder()
> 4a068c5c drm/sun4i: DW HDMI: Release nodes if error happens during CRTC search
> ddba766d drm/nouveau: Use drm_connector_for_each_possible_encoder()
> 98c0e348 drm/amdgpu: Use drm_connector_for_each_possible_encoder()
> e0f56782 drm/sun4i: mixer: Order includes alphabetically
> 05db311a drm/sun4i: tcon-top: Add helpers for mux switching
> 83aefbb8 drm: Add drm_connector_for_each_possible_encoder()
> 20431c05 drm/i915: Nuke intel_mst_best_encoder()
> 5e496566 drm/sun4i: tcon-top: Remove mux configuration at probe time
> 0d998891 drm/fb-helper: Eliminate the .best_encoder() usage
> ac1fe132 dt-bindings: display: sun4i-drm: Fix order of DW HDMI PHY compatibles
> 03e3ec9a drm/panel: simple: Add Sharp LQ035Q7DB03 panel support
> c91b007e drm/vkms: Add extra information about vkms
> 5685ca0c drm/tinydrm: Fix doc build warnings
> 854502fa drm/vkms: Add basic CRTC initialization
> ae61f61f drm/client: Fix: drm_client_new: Don't require DRM to be registered
> c04372ea drm/vkms: Add mode_config initialization
> 41111ce1 drm/vkms: vkms_driver can be static
> 559e50fd drm/vkms: Add dumb operations
> 1c7c5fd9 drm/vkms: Introduce basic VKMS driver
> 657cd71e drm: gma500: Changed __attribute__((packed)) to __packed
> d1648930 drm/vkms: Add connectors helpers
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17b65cdfe00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+e3372a2afe1e7ef04bc7@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: use-after-free in vkms_dumb_create+0x286/0x290 drivers/gpu/drm/vkms/vkms_gem.c:142
> Read of size 8 at addr ffff88809e537110 by task syz-executor.0/9558
>
> CPU: 0 PID: 9558 Comm: syz-executor.0 Not tainted 5.7.0-rc2-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x188/0x20d lib/dump_stack.c:118
>  print_address_description.constprop.0.cold+0xd3/0x315 mm/kasan/report.c:382
>  __kasan_report.cold+0x35/0x4d mm/kasan/report.c:511
>  kasan_report+0x33/0x50 mm/kasan/common.c:625
>  vkms_dumb_create+0x286/0x290 drivers/gpu/drm/vkms/vkms_gem.c:142
>  drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
>  drm_ioctl_kernel+0x220/0x2f0 drivers/gpu/drm/drm_ioctl.c:787
>  drm_ioctl+0x4c9/0x980 drivers/gpu/drm/drm_ioctl.c:887
>  vfs_ioctl fs/ioctl.c:47 [inline]
>  ksys_ioctl+0x11a/0x180 fs/ioctl.c:763
>  __do_sys_ioctl fs/ioctl.c:772 [inline]
>  __se_sys_ioctl fs/ioctl.c:770 [inline]
>  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
>  do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
>  entry_SYSCALL_64_after_hwframe+0x49/0xb3
> RIP: 0033:0x45c829
> Code: 0d b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007f19a3e30c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00000000004e2d80 RCX: 000000000045c829
> RDX: 0000000020000080 RSI: 00000000c02064b2 RDI: 0000000000000003
> RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
> R13: 000000000000028b R14: 00000000004d3188 R15: 00007f19a3e316d4
>
> Allocated by task 9558:
>  save_stack+0x1b/0x40 mm/kasan/common.c:49
>  set_track mm/kasan/common.c:57 [inline]
>  __kasan_kmalloc mm/kasan/common.c:495 [inline]
>  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:468
>  kmem_cache_alloc_trace+0x153/0x7d0 mm/slab.c:3551
>  __vkms_gem_create+0x44/0xf0 include/linux/slab.h:555
>  vkms_gem_create drivers/gpu/drm/vkms/vkms_gem.c:111 [inline]
>  vkms_gem_create drivers/gpu/drm/vkms/vkms_gem.c:100 [inline]
>  vkms_dumb_create+0x110/0x290 drivers/gpu/drm/vkms/vkms_gem.c:138
>  drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
>  drm_ioctl_kernel+0x220/0x2f0 drivers/gpu/drm/drm_ioctl.c:787
>  drm_ioctl+0x4c9/0x980 drivers/gpu/drm/drm_ioctl.c:887
>  vfs_ioctl fs/ioctl.c:47 [inline]
>  ksys_ioctl+0x11a/0x180 fs/ioctl.c:763
>  __do_sys_ioctl fs/ioctl.c:772 [inline]
>  __se_sys_ioctl fs/ioctl.c:770 [inline]
>  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
>  do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
>  entry_SYSCALL_64_after_hwframe+0x49/0xb3
>
> Freed by task 9558:
>  save_stack+0x1b/0x40 mm/kasan/common.c:49
>  set_track mm/kasan/common.c:57 [inline]
>  kasan_set_free_info mm/kasan/common.c:317 [inline]
>  __kasan_slab_free+0xf7/0x140 mm/kasan/common.c:456
>  __cache_free mm/slab.c:3426 [inline]
>  kfree+0x109/0x2b0 mm/slab.c:3757
>  drm_gem_object_free+0xf0/0x1f0 drivers/gpu/drm/drm_gem.c:983
>  kref_put include/linux/kref.h:65 [inline]
>  drm_gem_object_put_unlocked drivers/gpu/drm/drm_gem.c:1017 [inline]
>  drm_gem_object_put_unlocked+0x190/0x1c0 drivers/gpu/drm/drm_gem.c:1002
>  vkms_gem_create drivers/gpu/drm/vkms/vkms_gem.c:116 [inline]
>  vkms_gem_create drivers/gpu/drm/vkms/vkms_gem.c:100 [inline]
>  vkms_dumb_create+0x14d/0x290 drivers/gpu/drm/vkms/vkms_gem.c:138
>  drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
>  drm_ioctl_kernel+0x220/0x2f0 drivers/gpu/drm/drm_ioctl.c:787
>  drm_ioctl+0x4c9/0x980 drivers/gpu/drm/drm_ioctl.c:887
>  vfs_ioctl fs/ioctl.c:47 [inline]
>  ksys_ioctl+0x11a/0x180 fs/ioctl.c:763
>  __do_sys_ioctl fs/ioctl.c:772 [inline]
>  __se_sys_ioctl fs/ioctl.c:770 [inline]
>  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
>  do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
>  entry_SYSCALL_64_after_hwframe+0x49/0xb3
>
> The buggy address belongs to the object at ffff88809e537000
>  which belongs to the cache kmalloc-1k of size 1024
> The buggy address is located 272 bytes inside of
>  1024-byte region [ffff88809e537000, ffff88809e537400)
> The buggy address belongs to the page:
> page:ffffea0002794dc0 refcount:1 mapcount:0 mapping:00000000e8234a18 index:0x0
> flags: 0xfffe0000000200(slab)
> raw: 00fffe0000000200 ffffea00027a3608 ffffea0002749008 ffff8880aa000c40
> raw: 0000000000000000 ffff88809e537000 0000000100000002 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>  ffff88809e537000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff88809e537080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >ffff88809e537100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                          ^
>  ffff88809e537180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff88809e537200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

Let's see if this works...

#syz test: upstream c578ddb3

From 58035231aa036d5710286e242ec9b6d1f2995c85 Mon Sep 17 00:00:00 2001
From: Ezequiel Garcia <ezequiel@collabora.com>
Date: Mon, 27 Apr 2020 10:15:06 -0300
Subject: [PATCH] vkms: Hold gem object while in use

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
index 2e01186fb943..023e6a45fbf8 100644
--- a/drivers/gpu/drm/vkms/vkms_gem.c
+++ b/drivers/gpu/drm/vkms/vkms_gem.c
@@ -113,7 +113,6 @@ struct drm_gem_object *vkms_gem_create(struct
drm_device *dev,
  return ERR_CAST(obj);

  ret = drm_gem_handle_create(file, &obj->gem, handle);
- drm_gem_object_put_unlocked(&obj->gem);
  if (ret)
  return ERR_PTR(ret);

@@ -142,6 +141,8 @@ int vkms_dumb_create(struct drm_file *file, struct
drm_device *dev,
  args->size = gem_obj->size;
  args->pitch = pitch;

+ drm_gem_object_put_unlocked(gem_obj);
+
  DRM_DEBUG_DRIVER("Created object of size %lld\n", size);

  return 0;
-- 
2.26.0.rc2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
