Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7947083CA
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 16:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0626510E531;
	Thu, 18 May 2023 14:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A17410E531
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 14:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1684419394; i=deller@gmx.de;
 bh=LwPqTfkemnXFB3jCyVxpWMsHqU0ymB2h6P0xlROe5aw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=TtXYNe5xAOeA9y374E+iJRzY4md4Plyfpzk5MbuVwz4PYygtvSTWSyLRxfHG+49Tr
 +xHy9hVv4x2bhoDjDM6o4qdqYUk0GAS34kiwYnbGQIaUWhBnP2IFdU6yIujinn+ENg
 YDhjlXGXRzYPfXa5xxTU4Tw2Eko5xrgznULGzCm8X+CGyjDwaGtMoB+M7BDaMI+Pkp
 t1BTX/e0Ba+ByPJyGJ9v9stRfMsg71f9q1LANhImQb8SWJWYKPgYmq/hVuUB4d+V81
 zJQpjleJZodO72MMBPAJGI12okzLjTQOVnMafMY2f1cP+B5dPNEGJGvLTmiZbDFrUL
 byMT1oUjgJtkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.154.30]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My36N-1qMfpl1sKt-00zYSz; Thu, 18
 May 2023 16:16:34 +0200
Message-ID: <be824fbc-cde4-9a2a-8fb4-1ca23f498dca@gmx.de>
Date: Thu, 18 May 2023 16:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in
 dlfb_submit_urb/usb_submit_urb (2)
To: Alan Stern <stern@rowland.harvard.edu>
References: <0000000000004a222005fbf00461@google.com> <ZGXVANMhn5j/jObU@ls3530>
 <4cd17511-2b60-4c37-baf3-c477cf6d1761@rowland.harvard.edu>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
In-Reply-To: <4cd17511-2b60-4c37-baf3-c477cf6d1761@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pXKVZVha4wUECO7qMwhTGTdVsINqMFOlbpu1MpJn6W53oDupfEv
 1KnTp+8JBwTKRNhRqhvS1h4A3rWC8LUP3vbiakRhhD0JiuqgR7HPVt4tTCzzFEkkFoARBkL
 0v8HArqHVpNEG8Ok6rdmhqo2sD3TRkawveMV0evjEY0G1xQ9ARakyYDGb8fyywNfir3/qD+
 vrm5ouc+9fEl33ny2IHgw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P9sz6OUoUZE=;bHncezcc/bG0/tm7YZZlinfSFvB
 NMhIS8paNawMRgiRfr4BCZzkvovir9IadAH7H2EQXGu7jAe+3mZK+PHICY+Jegy2n2f+gV5eu
 L46x/n1l0HRw/xhg094dyTmtoulG73b7ykqCFE47hWqHnRZrOH8RUd3X7uN8MwLVjSdXWKovY
 mFWVi3hgip+chTVQAHEr1nGeGOioms62x1Lmzdisfr7BndieNp4EwYGtUZWo3ePQm1XiD0qh/
 JjxY6IIV4tNkyw753hAf//0ce2OfawBrotfl/BHf7m0MlMA0ujjI3BZNLd0m1C3smChmohDcq
 kAuHZIFYoE6W/VyRG1AYwhEjlbZqmJ886v9wz7Cg9o5ulGPJH6fbXwpFyXUY/RcDkL5Cm3aIp
 nWI6QUDm+h6r5gWV04D2jHHadhndv6sz/iBWza4Lp810kYf6gkFG6IMEdO6iZWTaV4HvLF2Mr
 gA+l4yZR0/ie8lwlEuRsZgP/O3bggQKnMKa9h/ciHPjH5sHxgkLf+4MQ7nJWNi3wguHQlSSb+
 JDHNBP2PMuIUJ4k7iyqG1dS33Fh9cTiGbp+DhztTYkoAo3x8QzlIqnlvrnFquweJFdQ+xRo3l
 vNWAHR3WPQ92FPwsZT8N7da/rhx9iwheeaUBnVd4Fzl2Hn10HQPov6bKs3r7HINgF1142Q4gE
 Pcag/iMhJq9V7CZvRgze1PPaIJ9f+pmYVyHf8WhZrdwwco5A8QXA3HWm/K1zFNE3x4bRDMeBM
 b1gP+o4orrh80E/wn3jGH0/OXO/9t64y28uf+x46oODSRd02XuJhjHINi4I2n0SkUv6AyFWUJ
 w1cqCwvKk73LBTUGM8ugpDaZ2AWFE4gGKGrWRADXPr+6zMAzDMDkitOQHMka6VjtDKio57DEw
 rmHu/3eoGoCjgOn0mmTuwIN0YW3miqzIp5TK+oJBpjkROhwx+/EcwrHVLn5Vjo+vTC/wNCATy
 dtGtarLkjrlaA2JJfVnucx2dE/8=
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
Cc: linux-fbdev@vger.kernel.org,
 syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 bernie@plugable.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/18/23 15:54, Alan Stern wrote:
> On Thu, May 18, 2023 at 09:34:24AM +0200, Helge Deller wrote:
>> * syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>:
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    a4422ff22142 usb: typec: qcom: Add Qualcomm PMIC Type-=
C dr..
>>> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh=
/usb.git usb-testing
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1524556628=
0000
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D2414a945e4=
542ec1
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=3D0e22d63dcebb=
802b9bc8
>>> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Bin=
utils for Debian) 2.35.2
>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1720fd3a=
280000
>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D171a73ea28=
0000
>>>
>>> Downloadable assets:
>>> disk image: https://storage.googleapis.com/syzbot-assets/414817142fb7/=
disk-a4422ff2.raw.xz
>>> vmlinux: https://storage.googleapis.com/syzbot-assets/448dba0d344e/vml=
inux-a4422ff2.xz
>>> kernel image: https://storage.googleapis.com/syzbot-assets/d0ad9fe848e=
2/bzImage-a4422ff2.xz
>>>
>>> IMPORTANT: if you fix the issue, please add the following tag to the c=
ommit:
>>> Reported-by: syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com
>>>
>>> usb 1-1: Read EDID byte 0 failed: -71
>>> usb 1-1: Unable to get valid EDID from device/display
>>> ------------[ cut here ]------------
>>> usb 1-1: BOGUS urb xfer, pipe 3 !=3D type 1
>>> WARNING: CPU: 0 PID: 9 at drivers/usb/core/urb.c:504 usb_submit_urb+0x=
ed6/0x1880 drivers/usb/core/urb.c:504
>>> Modules linked in:
>>> CPU: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.4.0-rc1-syzkaller-00016-=
ga4422ff22142 #0
>>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIO=
S Google 04/28/2023
>>> Workqueue: usb_hub_wq hub_event
>>> RIP: 0010:usb_submit_urb+0xed6/0x1880 drivers/usb/core/urb.c:504
>>> Code: 7c 24 18 e8 7c dc 5a fd 48 8b 7c 24 18 e8 42 ca 0b ff 41 89 d8 4=
4 89 e1 4c 89 ea 48 89 c6 48 c7 c7 60 34 cc 86 e8 0a fa 25 fd <0f> 0b e9 5=
8 f8 ff ff e8 4e dc 5a fd 48 81 c5 b8 05 00 00 e9 84 f7
>>> RSP: 0018:ffffc9000009ed48 EFLAGS: 00010282
>>> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
>>> RDX: ffff888103650000 RSI: ffffffff81163677 RDI: 0000000000000001
>>> RBP: ffff88810cb32940 R08: 0000000000000001 R09: 0000000000000000
>>> R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000003
>>> R13: ffff88810cf426b8 R14: 0000000000000003 R15: ffff888104272100
>>> FS:  0000000000000000(0000) GS:ffff8881f6600000(0000) knlGS:0000000000=
000000
>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> CR2: 0000562147be3b70 CR3: 0000000110380000 CR4: 00000000003506f0
>>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>> Call Trace:
>>>   <TASK>
>>>   dlfb_submit_urb+0x92/0x180 drivers/video/fbdev/udlfb.c:1980
>>>   dlfb_set_video_mode+0x21f0/0x2950 drivers/video/fbdev/udlfb.c:315
>>>   dlfb_ops_set_par+0x2a7/0x8d0 drivers/video/fbdev/udlfb.c:1111
>>>   dlfb_usb_probe+0x149a/0x2710 drivers/video/fbdev/udlfb.c:1743
>>>   usb_probe_interface+0x30f/0x960 drivers/usb/core/driver.c:396
>>>   call_driver_probe drivers/base/dd.c:579 [inline]
>>>   really_probe+0x240/0xca0 drivers/base/dd.c:658
>>>   __driver_probe_device+0x1df/0x4b0 drivers/base/dd.c:800
>>>   driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:830
>>>   __device_attach_driver+0x1d4/0x2e0 drivers/base/dd.c:958
>>>   bus_for_each_drv+0x149/0x1d0 drivers/base/bus.c:457
>>>   __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
>>>   bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
>>>   device_add+0x112d/0x1a40 drivers/base/core.c:3625
>>>   usb_set_configuration+0x1196/0x1bc0 drivers/usb/core/message.c:2211
>>>   usb_generic_driver_probe+0xcf/0x130 drivers/usb/core/generic.c:238
>>>   usb_probe_device+0xd8/0x2c0 drivers/usb/core/driver.c:293
>>>   call_driver_probe drivers/base/dd.c:579 [inline]
>>>   really_probe+0x240/0xca0 drivers/base/dd.c:658
>>>   __driver_probe_device+0x1df/0x4b0 drivers/base/dd.c:800
>>>   driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:830
>>>   __device_attach_driver+0x1d4/0x2e0 drivers/base/dd.c:958
>>>   bus_for_each_drv+0x149/0x1d0 drivers/base/bus.c:457
>>>   __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
>>>   bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
>>>   device_add+0x112d/0x1a40 drivers/base/core.c:3625
>>>   usb_new_device+0xcb2/0x19d0 drivers/usb/core/hub.c:2575
>>>   hub_port_connect drivers/usb/core/hub.c:5407 [inline]
>>>   hub_port_connect_change drivers/usb/core/hub.c:5551 [inline]
>>>   port_event drivers/usb/core/hub.c:5711 [inline]
>>>   hub_event+0x2e3d/0x4ed0 drivers/usb/core/hub.c:5793
>>>   process_one_work+0x99a/0x15e0 kernel/workqueue.c:2405
>>>   worker_thread+0x67d/0x10c0 kernel/workqueue.c:2552
>>>   kthread+0x344/0x440 kernel/kthread.c:379
>>>   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
>>
>> I think this is an informational warning from the USB stack,
>
> It is not informational.  It is a warning that the caller has a bug.

I'm not a USB expert, so I searched for such bug reports, and it seems
people sometimes faced this warning with different USB devices.

>> since the syzbot usb device doesn't behave as expected.
>>
>> What happens with this patch applied?
>>
>> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.g=
it usb-testing
>>
>> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
>> index 9f3c54032556..dd77b9e757da 100644
>> --- a/drivers/usb/core/urb.c
>> +++ b/drivers/usb/core/urb.c
>> @@ -501,7 +501,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags=
)
>>
>>   	/* Check that the pipe's type matches the endpoint's type */
>>   	if (usb_pipe_type_check(urb->dev, urb->pipe))
>> -		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x !=3D type %x\n",
>> +		printk("BOGUS urb xfer, pipe %x !=3D type %x (hardware misbehaviour?=
)\n",
>>   			usb_pipetype(urb->pipe), pipetypes[xfertype]);
>>
>>   	/* Check against a simple/standard policy */
>
> You can't fix a bug by changing the line that reports it from dev_WARN
> to printk!

Of course this patch wasn't intended as "fix".
It was intended to see how the udlfb driver behaves in this situation, e.g=
.
if the driver then crashes afterwards.

Furthermore, why does usb_submit_urb() prints this WARNING and then contin=
ues?
If it's a real bug, why doesn't it returns an error instead?
So, in principle I still think this warning is kind of informational,
which of course points to some kind of problem which should be fixed.

> In this case it looks like dlfb_usb_probe() or one of the routines it
> calls is wrong; it assumes that an endpoint has the expected type
> without checking.  More precisely, it thinks an endpoint is BULK when
> actually it is INTERRUPT.  That's what needs to be fixed.

Maybe usb_submit_urb() should return an error so that drivers can
react on it, instead of adding the same kind of checks to all drivers?

Helge
