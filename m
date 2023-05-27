Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C85567132D6
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 08:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601AB10E219;
	Sat, 27 May 2023 06:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9317810E219
 for <dri-devel@lists.freedesktop.org>; Sat, 27 May 2023 06:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1685170184; i=deller@gmx.de;
 bh=O1urCmQR7e2fkkDcmrMR+OyF/CqGxIyPnJkhQVNxNO8=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=CNh7tf5ZaSi8AvR0zreF969g15UG72nZwCvcgZFkzOD1ego9XsJ3gXB+9+gaoL28c
 SYNbcQ+Lh8AyRGsENki5e1RzUhr1KMxlZc3hIgit4Uku5P6EPMWi2kkRUOUPj9rzPU
 HqptWPrHKK+XgcDlbBp9xGZbxJ4BA0PmqGKNc4BI1ac/c2IY0PZOOSjIicSnV9WkHR
 UWekJLjFdBJa+v63dUW1xKLEpSg2Ppmf3UxILWdBSWWJB40vXvm5xwAPtfygRNnn2y
 OK0kIx2iA98TEapIrrJqAIuFcA8g3mDZJDsiXCR7nh/f/kyNigwGFs0j42JXuC9OBu
 O5gwzJA3EE9Jg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.182]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxUs7-1qHrpO3xSz-00xpsY; Sat, 27
 May 2023 08:49:44 +0200
Message-ID: <77f5c7f1-83fc-514c-14b9-453311b01188@gmx.de>
Date: Sat, 27 May 2023 08:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [syzbot] [fbdev?] general protection fault in soft_cursor
Content-Language: en-US
To: syzbot <syzbot+d910bd780e6efac35869@syzkaller.appspotmail.com>,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <000000000000a15f4b05fca4ffa0@google.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <000000000000a15f4b05fca4ffa0@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A9wQ4XWgzzXsikYdt/ESEErIkMxZqK6bw8O8G7pFq9w3IuTySb0
 Yy8CTzzZknau+T5EwQzLlfEaPkR9EsaiZ9mNiz1aVKjCr4gmOStfMu09IwtFfqvBh86s87b
 SHuQED1hVBZy4qehZMVAZd1eWOakhX/lIdhWElFkkrJKphU57HGKDbvrqXF7rhKAD7cCT7H
 NS1WnqMbnSEBHtctnEjyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eBJtMBuTGLw=;4P9a9lhcVLdSi28JP7BzxqrR3KT
 GKWaFiY1ySVkAPu3VZVY+W0cY3EmBSMRPxp1MCnHv4YK45sfiIMuW2qBn5RGP+DmIVNpKRSvE
 8hxXlsKl8rbCE5mjyFFLQaZ0y8SkDd5lp224cFLRGXvvDrWqpepHKeKPGhGvwJqugQZ19jyny
 5Qf1sbPCZ0bl53WFhAzpbzliQhCD/S+msep6Veo7RKfVftzT5NfOEewAvtSlE9EYHuuBV/tTj
 UsL044eF4UtfWlo0mDtV8/iLC2W98hJGQIVTmbzG/fkzGcv30Zu5yy3E5KETp0T0FksCiBwQx
 wnZiSJYvNeXDI1n3zaORmjP2YrBSgR2RD3IzmSnVaPWQP0rfnHLzNoaTCb6q1+cbyCo3o+JFg
 uYaqhkfaMWHTNJCFKFaXaF6hMldKzypY0MBRuBDoDm99XnJ0kWcgQ2y9ptBMRWBbs/ox58GlZ
 XO/wDjIggyb6r4Uq3lAZEg1MlSey/LEPIYnUujJJ6vqwsTtuKF35qcmjmQZwGpDs7r9uqFXVs
 CxGLbhZ0003XWR1G1aS6Xs+TwASLGOs450Ycg/KjorNzASPC+hW/JmP+T3WSwzr7+FSdXmEMa
 e4bjXqS2CuNg0Q3UX/QrXGCWRTne8o7dlS/lGUXB0RA13NIYUI+xDSXVqLN7IQERfbE1Yr105
 ehUwHCSs/qVvFN1m7MX3Azz8PEDn9Q/sGaB9yaTKPri4TIwtWTZczK3y/APjjAJoQA7DJAZPH
 v4wt8qLFjNOUUQjh5VCk8H7H5cqFO0rqkfuTaWTc2SRro1DVtMYEdyyjWhYvgjdHh0AXeNuRT
 u8K4EaTE+myk4cW7vXM6Tk+QNZtN6NPMcqQuPzhi0auSBpxlhU2Kv+5gyAtmF/8G1MzvwdvFK
 /Lh8delguDXtxMzhv1UtMRO5STv3oAMk29WLHARVSZ7WVEHvBeSslhPXSQwNIOnMWkUwyakkl
 fT9WrB3d/+++EO1ZlsfA4xGy2Gk=
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

On 5/27/23 06:07, syzbot wrote:
> syzbot found the following issue on:
>
> HEAD commit:    eb0f1697d729 Merge branch 'for-next/core', remote-tracki=
ng..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linu=
x.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D10e08bde2800=
00
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8860074b9a9d=
6c45
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dd910bd780e6efa=
c35869
> compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for De=
bian) 2.35.2
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D103d17a928=
0000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1151bb192800=
00
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/034232da7cff/di=
sk-eb0f1697.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/b11411bec33e/vmlin=
ux-eb0f1697.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/a53c52e170dd/=
Image-eb0f1697.gz.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the com=
mit:
> Reported-by: syzbot+d910bd780e6efac35869@syzkaller.appspotmail.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: null-ptr-deref in soft_cursor+0x384/0x6b4 drivers/video/fbde=
v/core/softcursor.c:70
> Read of size 16 at addr 0000000000000200 by task kworker/u4:1/12
>
> CPU: 0 PID: 12 Comm: kworker/u4:1 Not tainted 6.4.0-rc3-syzkaller-geb0f1=
697d729 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS =
Google 04/28/2023
> Workqueue: events_power_efficient fb_flashcursor
> Call trace:
>   dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:233
>   show_stack+0x2c/0x44 arch/arm64/kernel/stacktrace.c:240
>   __dump_stack lib/dump_stack.c:88 [inline]
>   dump_stack_lvl+0xd0/0x124 lib/dump_stack.c:106
>   print_report+0xe4/0x514 mm/kasan/report.c:465
>   kasan_report+0xd4/0x130 mm/kasan/report.c:572
>   kasan_check_range+0x264/0x2a4 mm/kasan/generic.c:187
>   __asan_memcpy+0x3c/0x84 mm/kasan/shadow.c:105
>   soft_cursor+0x384/0x6b4 drivers/video/fbdev/core/softcursor.c:70
>   bit_cursor+0x113c/0x1a64 drivers/video/fbdev/core/bitblit.c:377
>   fb_flashcursor+0x35c/0x54c drivers/video/fbdev/core/fbcon.c:380
>   process_one_work+0x788/0x12d4 kernel/workqueue.c:2405
>   worker_thread+0x8e0/0xfe8 kernel/workqueue.c:2552
>   kthread+0x288/0x310 kernel/kthread.c:379
>   ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:853
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

#syz test: https://github.com/hdeller/linux.git  9ee79acc491c58252a91df942=
cb704aa06853734

