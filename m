Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A9F250068
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 17:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30C96E290;
	Mon, 24 Aug 2020 15:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272B16E290
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 15:07:47 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07OEwuOO191839;
 Mon, 24 Aug 2020 15:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=l1AEyXzH7zlSNEaTv5VG5Ok+VBmrQiP21evzrcvBBX8=;
 b=frIi7WtvzqlBw3+GerrRjHSaBPH3i+8eFV/QCEGRfLiBatGCngd3aDvtcAh02TVxIBRz
 FOw/xH6J5cZs8D+mfuCHyO2/jjonU4Y7qk4sV5N/tYXyN57TiOt/V6qWnA36RpQ7mbVk
 Be1Fl878fWxLsRdaR17O4V8MRo3jV6s/c+D29avST/UvJiTw2D8uCcehM1w7E7x0bSrq
 /z6bYIXWLXMf1QGB/g+j0IY8MM3LXLFmqCjri0t8INMG3iawsCnuaVWubkq8QGsNM0iw
 WIJpg8S5FS0ZGUbEF3ifetuK3z3A55u/WcROEmrA8AjKeWVBZ+6LAYpGcf3quBmpizd8 vg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 333cshw5m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 24 Aug 2020 15:07:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07OF1F45142381;
 Mon, 24 Aug 2020 15:05:39 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 333r9hcmqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 15:05:39 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07OF5bgd006612;
 Mon, 24 Aug 2020 15:05:37 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Aug 2020 08:05:36 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 3AE8E6A0132; Mon, 24 Aug 2020 11:06:51 -0400 (EDT)
Date: Mon, 24 Aug 2020 11:06:51 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: syzbot <syzbot+3f86afd0b1e4bf1cb64c@syzkaller.appspotmail.com>,
 thomas.tai@oracle.com, airlied@redhat.com, kraxel@redhat.com,
 virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Subject: Is: virtio_gpu_object_shmem_init  issues? Was:Re: upstream boot
 error: general protection fault in swiotlb_map
Message-ID: <20200824150650.GD21321@char.us.oracle.com>
References: <0000000000000c1f0005ac333382@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0000000000000c1f0005ac333382@google.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9722
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9722
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240121
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, hch@lst.de,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 06, 2020 at 03:46:23AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    47ec5303 Merge git://git.kernel.org/pub/scm/linux/kernel/g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=16fe1dea900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7c06047f622c5724
> dashboard link: https://syzkaller.appspot.com/bug?extid=3f86afd0b1e4bf1cb64c
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+3f86afd0b1e4bf1cb64c@syzkaller.appspotmail.com
> 
> ceph: loaded (mds proto 32)
> NET: Registered protocol family 38
> async_tx: api initialized (async)
> Key type asymmetric registered
> Asymmetric key parser 'x509' registered
> Asymmetric key parser 'pkcs8' registered
> Key type pkcs7_test registered
> Asymmetric key parser 'tpm_parser' registered
> Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
> io scheduler mq-deadline registered
> io scheduler kyber registered
> io scheduler bfq registered
> hgafb: HGA card not detected.
> hgafb: probe of hgafb.0 failed with error -22
> usbcore: registered new interface driver udlfb
> uvesafb: failed to execute /sbin/v86d
> uvesafb: make sure that the v86d helper is installed and executable
> uvesafb: Getting VBE info block failed (eax=0x4f00, err=-2)
> uvesafb: vbe_init() failed with -22
> uvesafb: probe of uvesafb.0 failed with error -22
> vga16fb: mapped to 0x000000008aac772d
> Console: switching to colour frame buffer device 80x30
> fb0: VGA16 VGA frame buffer device
> input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
> ACPI: Power Button [PWRF]
> ioatdma: Intel(R) QuickData Technology Driver 5.00
> PCI Interrupt Link [GSIF] enabled at IRQ 21
> PCI Interrupt Link [GSIG] enabled at IRQ 22
> PCI Interrupt Link [GSIH] enabled at IRQ 23
> N_HDLC line discipline registered with maxframe=4096
> Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> 00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
> Cyclades driver 2.6
> Initializing Nozomi driver 2.1d
> RocketPort device driver module, version 2.09, 12-June-2003
> No rocketport ports found; unloading driver
> Non-volatile memory driver v1.3
> Linux agpgart interface v0.103
> [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 0
> [drm] Initialized vkms 1.0.0 20180514 for vkms on minor 1
> usbcore: registered new interface driver udl
> [drm] pci: virtio-vga detected at 0000:00:01.0
> fb0: switching to virtiodrmfb from VGA16 VGA
> Console: switching to colour VGA+ 80x25
> virtio-pci 0000:00:01.0: vgaarb: deactivate vga console
> Console: switching to colour dummy device 80x25
> [drm] features: -virgl +edid
> [drm] number of scanouts: 1
> [drm] number of cap sets: 0
> [drm] Initialized virtio_gpu 0.1.0 0 for virtio0 on minor 2
> general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-syzkaller #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> RIP: 0010:swiotlb_map+0x5ac/0x700 kernel/dma/swiotlb.c:683
> Code: 28 04 00 00 48 c1 ea 03 80 3c 02 00 0f 85 4d 01 00 00 4c 8b a5 18 04 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 0f 85 1e 01 00 00 48 8d 7d 50 4d 8b 24 24 48 b8 00 00
> RSP: 0000:ffffc9000034f3e0 EFLAGS: 00010246
> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff8162cc1d
> RDX: 0000000000000000 RSI: ffffffff8162cc98 RDI: ffff88802971a470
> RBP: ffff88802971a048 R08: 0000000000000001 R09: ffffffff8c5dba77
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 000000007ac00000 R14: dffffc0000000000 R15: 0000000000001000
> FS:  0000000000000000(0000) GS:ffff88802ce00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000ffffffff CR3: 0000000009a8d000 CR4: 0000000000350ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  dma_direct_map_page include/linux/dma-direct.h:170 [inline]
>  dma_direct_map_sg+0x3bb/0x670 kernel/dma/direct.c:368
>  dma_map_sg_attrs+0xd0/0x160 kernel/dma/mapping.c:183
>  drm_gem_shmem_get_pages_sgt drivers/gpu/drm/drm_gem_shmem_helper.c:700 [inline]
>  drm_gem_shmem_get_pages_sgt+0x1fc/0x310 drivers/gpu/drm/drm_gem_shmem_helper.c:679
>  virtio_gpu_object_shmem_init drivers/gpu/drm/virtio/virtgpu_object.c:153 [inline]
>  virtio_gpu_object_create+0x2fd/0xa70 drivers/gpu/drm/virtio/virtgpu_object.c:232
>  virtio_gpu_gem_create drivers/gpu/drm/virtio/virtgpu_gem.c:45 [inline]
>  virtio_gpu_mode_dumb_create+0x298/0x530 drivers/gpu/drm/virtio/virtgpu_gem.c:85
>  drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
>  drm_client_buffer_create drivers/gpu/drm/drm_client.c:267 [inline]
>  drm_client_framebuffer_create+0x1b7/0x770 drivers/gpu/drm/drm_client.c:412
>  drm_fb_helper_generic_probe+0x1e5/0x810 drivers/gpu/drm/drm_fb_helper.c:2086
>  drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:1635 [inline]
>  __drm_fb_helper_initial_config_and_unlock+0xbc6/0x12d0 drivers/gpu/drm/drm_fb_helper.c:1793
>  drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:1888 [inline]
>  drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:1880 [inline]
>  drm_fbdev_client_hotplug+0x2d4/0x580 drivers/gpu/drm/drm_fb_helper.c:2180
>  drm_fbdev_generic_setup+0x1c8/0x450 drivers/gpu/drm/drm_fb_helper.c:2262
>  virtio_gpu_probe+0x28f/0x2e0 drivers/gpu/drm/virtio/virtgpu_drv.c:127
>  virtio_dev_probe+0x445/0x6f0 drivers/virtio/virtio.c:248
>  really_probe+0x282/0x9f0 drivers/base/dd.c:553
>  driver_probe_device+0xfe/0x1d0 drivers/base/dd.c:738
>  device_driver_attach+0x228/0x290 drivers/base/dd.c:1013
>  __driver_attach drivers/base/dd.c:1090 [inline]
>  __driver_attach+0xda/0x240 drivers/base/dd.c:1044
>  bus_for_each_dev+0x147/0x1d0 drivers/base/bus.c:305
>  bus_add_driver+0x348/0x5a0 drivers/base/bus.c:622
>  driver_register+0x220/0x3a0 drivers/base/driver.c:171
>  do_one_initcall+0x10a/0x7b0 init/main.c:1201
>  do_initcall_level init/main.c:1274 [inline]
>  do_initcalls init/main.c:1290 [inline]
>  do_basic_setup init/main.c:1310 [inline]
>  kernel_init_freeable+0x589/0x638 init/main.c:1505
>  kernel_init+0xd/0x1c0 init/main.c:1399
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> Modules linked in:
> ---[ end trace 11a290451cfd19ed ]---
> RIP: 0010:swiotlb_map+0x5ac/0x700 kernel/dma/swiotlb.c:683
> Code: 28 04 00 00 48 c1 ea 03 80 3c 02 00 0f 85 4d 01 00 00 4c 8b a5 18 04 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 0f 85 1e 01 00 00 48 8d 7d 50 4d 8b 24 24 48 b8 00 00
> RSP: 0000:ffffc9000034f3e0 EFLAGS: 00010246
> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff8162cc1d
> RDX: 0000000000000000 RSI: ffffffff8162cc98 RDI: ffff88802971a470
> RBP: ffff88802971a048 R08: 0000000000000001 R09: ffffffff8c5dba77
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 000000007ac00000 R14: dffffc0000000000 R15: 0000000000001000
> FS:  0000000000000000(0000) GS:ffff88802ce00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000ffffffff CR3: 0000000009a8d000 CR4: 0000000000350ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

So it fails at

683                 dev_WARN_ONCE(dev, 1,                                           
684                         "swiotlb addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
685                         &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);   


which makes no sense to me as `dev` surely exists. I can see in the console log:

virtio-pci 0000:00:01.0: vgaarb: deactivate vga console

So what gives?

Code: 28 04 00 00 48 c1 ea 03 80 3c 02 00 0f 85 4d 01 00 00 4c 8b a5 18 04 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 0f 85 1e 01 00 00 48 8d 7d 50 4d 8b 24 24 48 b8 00 00
is
All code
========
   0:   28 04 00                sub    %al,(%rax,%rax,1)
   3:   00 48 c1                add    %cl,-0x3f(%rax)
   6:   ea                      (bad)
   7:   03 80 3c 02 00 0f       add    0xf00023c(%rax),%eax
   d:   85 4d 01                test   %ecx,0x1(%rbp)
  10:   00 00                   add    %al,(%rax)
  12:   4c 8b a5 18 04 00 00    mov    0x418(%rbp),%r12
  19:   48 b8 00 00 00 00 00    movabs $0xdffffc0000000000,%rax
  20:   fc ff df
  23:   4c 89 e2                mov    %r12,%rdx
  26:   48 c1 ea 03             shr    $0x3,%rdx
  2a:*  80 3c 02 00             cmpb   $0x0,(%rdx,%rax,1)               <-- trapping instruction
  2e:   0f 85 1e 01 00 00       jne    0x152
  34:   48 8d 7d 50             lea    0x50(%rbp),%rdi
  38:   4d 8b 24 24             mov    (%r12),%r12
  3c:   48                      rex.W
  3d:   b8                      .byte 0xb8

So %r12 was expected to have something valid, put in %rdx, and shifted by three (line 26). Then
we fetch from
base =  0000000000000000 (%rdx) + 0xdffffc0000000000(%rax)* scale 1.

and compare against 0 (if I am reading this right).

No clue here. 

I tried compiling the upstream kernel with the .config mentioned at the top
but sadly I can't find anything that similar to this code to figure out
what exactly it is trying to access and crash.

CC-ing a fellow engineer who is debugging this, but it looks to be related to VirtIO DRM.

> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
