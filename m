Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02493707B07
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 09:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B6110E4E2;
	Thu, 18 May 2023 07:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C9510E4E2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1684395265; i=deller@gmx.de;
 bh=FZgYr3T8y3cSMK+jHqEyv7QLt7tFq/0H8uVHvwVWk6M=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=MoMpQNdr5zEiwQNd7K2aK1cI0p3ThRclSOgsj66q2WiUSF4ATCDeQLPKNbFg25Pxa
 WViYyUdePqRPGNXASfMIakglgGaIMzsAGjPJe5NKqpXZVM5og28cJrtnBpVVhpnE35
 TLsdiVhun9nSNcsyjvnB9B+1tAypfx13ifMBianCemABMQV08ns7mTrVNFAbr5iKsR
 NcKMmRNjLbRcFS5c7yqHngmNjjbhyZW2+GFOekGsIH1FczveHYzs1FT6HiardTQCJE
 89EWnOgrTO3mtW57/ye+SYtrtgmxvkKEtdd0kc20IFAa7SOJGS3rijHfVh2iZPlszz
 dzLJ3IB94J3IA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([94.134.154.30]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mwfac-1qO5QR39v0-00yCpu; Thu, 18
 May 2023 09:34:25 +0200
Date: Thu, 18 May 2023 09:34:24 +0200
From: Helge Deller <deller@gmx.de>
To: syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in
 dlfb_submit_urb/usb_submit_urb (2)
Message-ID: <ZGXVANMhn5j/jObU@ls3530>
References: <0000000000004a222005fbf00461@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000004a222005fbf00461@google.com>
X-Provags-ID: V03:K1:zUPAArKGm/akodQZev5TT6+LSpI5YI8YKdFYXuQvLW+d25TdLpO
 AiDNmIid9kSsAswtadv+D5hcPd2HAwUgjJMhHWJ2Lj/vvbKONOX3OgPg632rvOnlZYsqtSz
 VXA0BX5qOQlJTQpLwxh528FF+zHjsQERAbX92PlkSSrbIBLpCQkwuUue1VqjCBbPMpPCRKL
 O+i3QhySsy2Po63To/sdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ICelvk08EVc=;6E8igwb3dFTHD/FtKRA4efw+6S1
 PVOPtNEArRckGAnQHSJcT+eAVGKOkJo27ZCGxgCvWEFhrm3qltGr6ab1CIcQsons3EyJxwOew
 1WPS7i86IgE4XX7Ltl0EK81Ggq5xYOXu42iVj5AdlEzoJE6HdPm61sTeMMP74ADwil2qJcI+U
 IrISHQyC6njvLrqGfWrve6kRWD+3ZgEZImKVIVeGsNMTU018HEMkcwGvdyGlLDxlpAhvsujI1
 D3hSNGKJRuyiC4alwaTJJ100PyyJ1YLXLRMI1h5lz9OggxQdHrRFuu+dna42WkBZMXvW+QKxD
 mrtLGT2pn53YI83/8KOqDJb7IrCSanYkWBn2Hc+gqgFRCvsK2Nb+UPMc+DqEYIHo4bdEpU+z6
 nHcDJ1/E5JJ8BVcI7skdzx0Oqh3ciHGuas5hwkY6nrSPn62tpA4yBGmhGzj6tTnPsVKzLQ/X5
 ZrgnPcOKwUNvXr8KFPy5Z95/7z8Mqt2T1rbqBhmGvXYoDR9Nz47Gp/6faPGDmK62zOBgDy156
 SMzGh+64K1pfnixS7eRS68irtQWNwot0o04+29NjpZI0BHLimXVi1XNNM0uLCQOxUltFx65II
 Mj4gSokE5wvWdiuz4i2WVFWBYR0JnU0H/2KzSNj9mc/YR6Z4w0kBhDnKz14P7aVOZJml2E2AT
 ZVKjReq0nJhc+Z67idxbJKhn5JLsL4h+ng+8cxuC4nHRVtUTaYKRce/ZiF4KJjtqt++23KnEW
 TbSm0bMVjKVEmBZu60MWhvilE2Fejovz3e69iYYY/v25otUCmollDPr+ewpZnIFf2TEj+ZauJ
 R2u2RGN3jCH5kuiGoOs7BhUh30bpVkM8tSTQ4dPTsCye1kz811V6YEhgXClod/T5ULvfjSwsT
 WeUDHzTRyh0kxAG+p2HFpI8p7n8l4LkqTAiytFZ38xDZadPJ4eXxAiRienPK4nr/o88uDhodz
 lmU2vw==
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
Cc: linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 bernie@plugable.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>:
> syzbot found the following issue on:
>
> HEAD commit:    a4422ff22142 usb: typec: qcom: Add Qualcomm PMIC Type-C =
dr..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/u=
sb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D152455662800=
00
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D2414a945e454=
2ec1
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D0e22d63dcebb80=
2b9bc8
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binut=
ils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1720fd3a28=
0000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D171a73ea2800=
00
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/414817142fb7/di=
sk-a4422ff2.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/448dba0d344e/vmlin=
ux-a4422ff2.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d0ad9fe848e2/=
bzImage-a4422ff2.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the com=
mit:
> Reported-by: syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com
>
> usb 1-1: Read EDID byte 0 failed: -71
> usb 1-1: Unable to get valid EDID from device/display
> ------------[ cut here ]------------
> usb 1-1: BOGUS urb xfer, pipe 3 !=3D type 1
> WARNING: CPU: 0 PID: 9 at drivers/usb/core/urb.c:504 usb_submit_urb+0xed=
6/0x1880 drivers/usb/core/urb.c:504
> Modules linked in:
> CPU: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.4.0-rc1-syzkaller-00016-ga=
4422ff22142 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS =
Google 04/28/2023
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:usb_submit_urb+0xed6/0x1880 drivers/usb/core/urb.c:504
> Code: 7c 24 18 e8 7c dc 5a fd 48 8b 7c 24 18 e8 42 ca 0b ff 41 89 d8 44 =
89 e1 4c 89 ea 48 89 c6 48 c7 c7 60 34 cc 86 e8 0a fa 25 fd <0f> 0b e9 58 =
f8 ff ff e8 4e dc 5a fd 48 81 c5 b8 05 00 00 e9 84 f7
> RSP: 0018:ffffc9000009ed48 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> RDX: ffff888103650000 RSI: ffffffff81163677 RDI: 0000000000000001
> RBP: ffff88810cb32940 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000003
> R13: ffff88810cf426b8 R14: 0000000000000003 R15: ffff888104272100
> FS:  0000000000000000(0000) GS:ffff8881f6600000(0000) knlGS:000000000000=
0000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000562147be3b70 CR3: 0000000110380000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  dlfb_submit_urb+0x92/0x180 drivers/video/fbdev/udlfb.c:1980
>  dlfb_set_video_mode+0x21f0/0x2950 drivers/video/fbdev/udlfb.c:315
>  dlfb_ops_set_par+0x2a7/0x8d0 drivers/video/fbdev/udlfb.c:1111
>  dlfb_usb_probe+0x149a/0x2710 drivers/video/fbdev/udlfb.c:1743
>  usb_probe_interface+0x30f/0x960 drivers/usb/core/driver.c:396
>  call_driver_probe drivers/base/dd.c:579 [inline]
>  really_probe+0x240/0xca0 drivers/base/dd.c:658
>  __driver_probe_device+0x1df/0x4b0 drivers/base/dd.c:800
>  driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:830
>  __device_attach_driver+0x1d4/0x2e0 drivers/base/dd.c:958
>  bus_for_each_drv+0x149/0x1d0 drivers/base/bus.c:457
>  __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
>  bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
>  device_add+0x112d/0x1a40 drivers/base/core.c:3625
>  usb_set_configuration+0x1196/0x1bc0 drivers/usb/core/message.c:2211
>  usb_generic_driver_probe+0xcf/0x130 drivers/usb/core/generic.c:238
>  usb_probe_device+0xd8/0x2c0 drivers/usb/core/driver.c:293
>  call_driver_probe drivers/base/dd.c:579 [inline]
>  really_probe+0x240/0xca0 drivers/base/dd.c:658
>  __driver_probe_device+0x1df/0x4b0 drivers/base/dd.c:800
>  driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:830
>  __device_attach_driver+0x1d4/0x2e0 drivers/base/dd.c:958
>  bus_for_each_drv+0x149/0x1d0 drivers/base/bus.c:457
>  __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
>  bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
>  device_add+0x112d/0x1a40 drivers/base/core.c:3625
>  usb_new_device+0xcb2/0x19d0 drivers/usb/core/hub.c:2575
>  hub_port_connect drivers/usb/core/hub.c:5407 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5551 [inline]
>  port_event drivers/usb/core/hub.c:5711 [inline]
>  hub_event+0x2e3d/0x4ed0 drivers/usb/core/hub.c:5793
>  process_one_work+0x99a/0x15e0 kernel/workqueue.c:2405
>  worker_thread+0x67d/0x10c0 kernel/workqueue.c:2552
>  kthread+0x344/0x440 kernel/kthread.c:379
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308

I think this is an informational warning from the USB stack,
since the syzbot usb device doesn't behave as expected.

What happens with this patch applied?

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git =
usb-testing

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 9f3c54032556..dd77b9e757da 100644
=2D-- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -501,7 +501,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)

 	/* Check that the pipe's type matches the endpoint's type */
 	if (usb_pipe_type_check(urb->dev, urb->pipe))
-		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x !=3D type %x\n",
+		printk("BOGUS urb xfer, pipe %x !=3D type %x (hardware misbehaviour?)\n=
",
 			usb_pipetype(urb->pipe), pipetypes[xfertype]);

 	/* Check against a simple/standard policy */

Helge
