Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BA95839D1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 09:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D0494FDA;
	Thu, 28 Jul 2022 07:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C69BA4A9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 00:15:02 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id p5so298843edi.12
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 17:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zS7uGqcVS9fNV/9Dr1SlslXubIYTqgKHam9hR2jIQtg=;
 b=EJBakNoCfQWMvxfomK3I1SNDIBtUq+t3ci1A/kjhyPrPi2ShNW0MNZ33f/DOjbHbxj
 O1MlSIUoajRWiKG7iDQKJ1mBfjnrWR6svuYDJDMyER/iIEjcbf8ywRp8KMHgzjLm5t4C
 31tN3cVEaeKDQJVIw3MH7S+zqbe660oJkHngJ0fjrDjGgK6/fhEmHSorf7COrHdLoqEb
 SR+cQatN7eLLLiRWniEouRjD2kkA74a8kQ0gJc61xdwPwGHUvF7o6WLW9fgCRZ0cflfS
 G3n7SMZsrFWyucJ6ygbxXkQvA5eIK7PgTidsr5460uzJ3lfccl+J4URi7yo72/YD2t7f
 Bwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zS7uGqcVS9fNV/9Dr1SlslXubIYTqgKHam9hR2jIQtg=;
 b=zAjG9QuvoK5kCup7ASRm2Vac8btdtmbDT3tRsWCYZghPfCn5z0Z/nwgeb5kaSuVizL
 Sd9GYqNDjrCM9vDryQScqFyhOhdaAu0A8EnY6uBMC6N+HfGNz3WkegQRVtgXyDV4BceC
 h2T/6vLs6wzzUg8MYNI8enqyItEd1bUxbA6xsrFGbbv3592wcvWSZ26EYLy5LO+fAdyp
 NHjWJgKZZlRTuvD5gj8RXsYcTWwXkOBGDeX99gsYQ9CT3pFg0qe15O936PGvs41THTWw
 kXsBdz+8veRJ+39w+zW5jUQyakxl3/bpqOXk1iqnCTm2zy9eMo9xvwj0SagJAnkbmkML
 0/TQ==
X-Gm-Message-State: AJIora+fGJPafxJct79HObHRMzcsueCP4d8p5NLFj4Rm7GQO2INiQqNk
 lRJLWGmfJXFqMDmQFwQMW+iEupuer+xnr66PJt0=
X-Google-Smtp-Source: AGRyM1vPsG7anPMCjg2MiVC0DGJ3BLMqyvcweHdio8YAohftnt7IaSIb01frNon+ZStYJlumm60dQuI1/M2zDhJA+ps=
X-Received: by 2002:a05:6402:3892:b0:43b:d872:a66 with SMTP id
 fd18-20020a056402389200b0043bd8720a66mr25561051edb.139.1658967300827; Wed, 27
 Jul 2022 17:15:00 -0700 (PDT)
MIME-Version: 1.0
From: Dipanjan Das <mail.dipanjan.das@gmail.com>
Date: Wed, 27 Jul 2022 17:14:49 -0700
Message-ID: <CANX2M5Y0gdTHmp70sU4cqJyeQY28Dg-zp09UVzmayLx5ywhL5w@mail.gmail.com>
Subject: BUG: unable to handle kernel paging request in imageblit
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run, 
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a92b9705e4d26c85"
X-Mailman-Approved-At: Thu, 28 Jul 2022 07:49:19 +0000
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
Cc: fleischermarius@googlemail.com, syzkaller@googlegroups.com,
 its.priyanka.bose@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a92b9705e4d26c85
Content-Type: text/plain; charset="UTF-8"

Hi,

We would like to report the following bug which has been found by our
modified version of syzkaller.

======================================================
description: BUG: unable to handle kernel paging request in imageblit
affected file: drivers/gpu/drm/drm_fb_helper.c
kernel version: 5.4.206
kernel commit: 6584107915561f860b7b05dcca5c903dd62a308d
git tree: upstream
kernel config: https://syzkaller.appspot.com/text?tag=KernelConfig&x=1aab6d4187ddf667
crash reproducer: attached
======================================================
Crash log:
======================================================
BUG: unable to handle page fault for address: ffffc90000c19000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 119554067 P4D 119554067 PUD 119555067 PMD 10be9f067 PTE 0
Oops: 0002 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 27220 Comm: syz-executor.4 Tainted: G           OE     5.4.206+ #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
RIP: 0010:sys_imageblit+0x1137/0x16f0 drivers/video/fbdev/core/sysimgblt.c:275
Code: 24 18 23 18 4c 89 f0 48 c1 e8 03 33 5c 24 60 0f b6 14 30 4c 89
f0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 56 03 00 00 31 ff <41> 89
5f fc 44 89 e6 e8 0d 6f b2 fd 45 85 e4 75 0f e8 93 6d b2 fd
RSP: 0018:ffff8880824df250 EFLAGS: 00010246
RAX: 0000000000000003 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 0000000000000000
RBP: ffff88810f56c213 R08: ffff8880922f82c0 R09: 0000000000000008
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000007
R13: 0000000000000002 R14: ffffc90000c19000 R15: ffffc90000c19004
FS:  00007f9076748700(0000) GS:ffff88811a000000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc90000c19000 CR3: 0000000090190001 CR4: 0000000000162ef0
Call Trace:
 drm_fb_helper_sys_imageblit+0x1c/0x130 drivers/gpu/drm/drm_fb_helper.c:809
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:139 [inline]
 bit_putcs+0x904/0xd90 drivers/video/fbdev/core/bitblit.c:188
 fbcon_putcs+0x39c/0x4c0 drivers/video/fbdev/core/fbcon.c:1302
 fbcon_putc+0x86/0xb0 drivers/video/fbdev/core/fbcon.c:1312
 complement_pos+0x360/0x720 drivers/tty/vt/vt.c:817
 highlight_pointer drivers/tty/vt/selection.c:63 [inline]
 clear_selection+0x17/0x70 drivers/tty/vt/selection.c:83
 vc_do_resize+0x1026/0x13a0 drivers/tty/vt/vt.c:1253
 fbcon_do_set_font+0x579/0x9f0 drivers/video/fbdev/core/fbcon.c:2442
 fbcon_set_font+0xa43/0xda0 drivers/video/fbdev/core/fbcon.c:2542
 con_font_set drivers/tty/vt/vt.c:4591 [inline]
 con_font_op+0x75b/0xcc0 drivers/tty/vt/vt.c:4635
 vt_ioctl+0x1663/0x2580 drivers/tty/vt/vt_ioctl.c:898
 tty_ioctl+0xda5/0x14c0 drivers/tty/tty_io.c:2657
 vfs_ioctl fs/ioctl.c:47 [inline]
 file_ioctl fs/ioctl.c:510 [inline]
 do_vfs_ioctl+0xd30/0x1340 fs/ioctl.c:697
 ksys_ioctl+0x9b/0xc0 fs/ioctl.c:714
 __do_sys_ioctl fs/ioctl.c:721 [inline]
 __se_sys_ioctl fs/ioctl.c:719 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:719
 do_syscall_64+0xf6/0x7b0 arch/x86/entry/common.c:290
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7f90787974ed
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f9076747be8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f90788b5f60 RCX: 00007f90787974ed
RDX: 0000000020000480 RSI: 0000000000004b72 RDI: 0000000000000003
RBP: 00007f90788032e1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffed03d269f R14: 00007f90788b5f60 R15: 00007f9076747d80
Modules linked in: uio_ivshmem(OE) uio(E)
CR2: ffffc90000c19000
---[ end trace af2a9beecf656bf6 ]---
RIP: 0010:fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
RIP: 0010:sys_imageblit+0x1137/0x16f0 drivers/video/fbdev/core/sysimgblt.c:275
Code: 24 18 23 18 4c 89 f0 48 c1 e8 03 33 5c 24 60 0f b6 14 30 4c 89
f0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 56 03 00 00 31 ff <41> 89
5f fc 44 89 e6 e8 0d 6f b2 fd 45 85 e4 75 0f e8 93 6d b2 fd
RSP: 0018:ffff8880824df250 EFLAGS: 00010246
RAX: 0000000000000003 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 0000000000000000
RBP: ffff88810f56c213 R08: ffff8880922f82c0 R09: 0000000000000008
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000007
R13: 0000000000000002 R14: ffffc90000c19000 R15: ffffc90000c19004
FS:  00007f9076748700(0000) GS:ffff88811a000000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc90000c19000 CR3: 0000000090190001 CR4: 0000000000162ef0
----------------
Code disassembly (best guess):
   0: 24 18                and    $0x18,%al
   2: 23 18                and    (%rax),%ebx
   4: 4c 89 f0              mov    %r14,%rax
   7: 48 c1 e8 03          shr    $0x3,%rax
   b: 33 5c 24 60          xor    0x60(%rsp),%ebx
   f: 0f b6 14 30          movzbl (%rax,%rsi,1),%edx
  13: 4c 89 f0              mov    %r14,%rax
  16: 83 e0 07              and    $0x7,%eax
  19: 83 c0 03              add    $0x3,%eax
  1c: 38 d0                cmp    %dl,%al
  1e: 7c 08                jl     0x28
  20: 84 d2                test   %dl,%dl
  22: 0f 85 56 03 00 00    jne    0x37e
  28: 31 ff                xor    %edi,%edi
* 2a: 41 89 5f fc          mov    %ebx,-0x4(%r15) <-- trapping instruction
  2e: 44 89 e6              mov    %r12d,%esi
  31: e8 0d 6f b2 fd        callq  0xfdb26f43
  36: 45 85 e4              test   %r12d,%r12d
  39: 75 0f                jne    0x4a
  3b: e8 93 6d b2 fd        callq  0xfdb26dd3

-- 
Thanks and Regards,

Dipanjan

--000000000000a92b9705e4d26c85
Content-Type: text/x-csrc; charset="US-ASCII"; name="repro.c"
Content-Disposition: attachment; filename="repro.c"
Content-Transfer-Encoding: base64
Content-ID: <f_l64a8o5t0>
X-Attachment-Id: f_l64a8o5t0

Ly8gYXV0b2dlbmVyYXRlZCBieSBzeXprYWxsZXIgKGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUv
c3l6a2FsbGVyKQoKI2RlZmluZSBfR05VX1NPVVJDRSAKCiNpbmNsdWRlIDxlbmRpYW4uaD4KI2lu
Y2x1ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxzdGRpbnQuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNp
bmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0cmluZy5oPgojaW5jbHVkZSA8c3lzL3N0YXQu
aD4KI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+CiNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KI2luY2x1
ZGUgPHVuaXN0ZC5oPgoKc3RhdGljIGxvbmcgc3l6X29wZW5fZGV2KHZvbGF0aWxlIGxvbmcgYTAs
IHZvbGF0aWxlIGxvbmcgYTEsIHZvbGF0aWxlIGxvbmcgYTIpCnsKCWlmIChhMCA9PSAweGMgfHwg
YTAgPT0gMHhiKSB7CgkJY2hhciBidWZbMTI4XTsKCQlzcHJpbnRmKGJ1ZiwgIi9kZXYvJXMvJWQ6
JWQiLCBhMCA9PSAweGMgPyAiY2hhciIgOiAiYmxvY2siLCAodWludDhfdClhMSwgKHVpbnQ4X3Qp
YTIpOwoJCXJldHVybiBvcGVuKGJ1ZiwgT19SRFdSLCAwKTsKCX0gZWxzZSB7CgkJY2hhciBidWZb
MTAyNF07CgkJY2hhciogaGFzaDsKCQlzdHJuY3B5KGJ1ZiwgKGNoYXIqKWEwLCBzaXplb2YoYnVm
KSAtIDEpOwoJCWJ1ZltzaXplb2YoYnVmKSAtIDFdID0gMDsKCQl3aGlsZSAoKGhhc2ggPSBzdHJj
aHIoYnVmLCAnIycpKSkgewoJCQkqaGFzaCA9ICcwJyArIChjaGFyKShhMSAlIDEwKTsKCQkJYTEg
Lz0gMTA7CgkJfQoJCXJldHVybiBvcGVuKGJ1ZiwgYTIsIDApOwoJfQp9Cgp1aW50NjRfdCByWzJd
ID0gezB4ZmZmZmZmZmZmZmZmZmZmZiwgMHhmZmZmZmZmZmZmZmZmZmZmfTsKCmludCBtYWluKHZv
aWQpCnsKCQlzeXNjYWxsKF9fTlJfbW1hcCwgMHgxZmZmZjAwMHVsLCAweDEwMDB1bCwgMHVsLCAw
eDMydWwsIC0xLCAwdWwpOwoJc3lzY2FsbChfX05SX21tYXAsIDB4MjAwMDAwMDB1bCwgMHgxMDAw
MDAwdWwsIDd1bCwgMHgzMnVsLCAtMSwgMHVsKTsKCXN5c2NhbGwoX19OUl9tbWFwLCAweDIxMDAw
MDAwdWwsIDB4MTAwMHVsLCAwdWwsIDB4MzJ1bCwgLTEsIDB1bCk7CgkJCQlpbnRwdHJfdCByZXMg
PSAwOwoJcmVzID0gLTE7CnJlcyA9IHN5el9vcGVuX2RldigweGMsIDQsIDEpOwoJaWYgKHJlcyAh
PSAtMSkKCQlyWzBdID0gcmVzOwoqKHVpbnQ4X3QqKTB4MjAwMDAwMDAgPSAyOwoqKHVpbnQ4X3Qq
KTB4MjAwMDAwMDEgPSAyOwoqKHVpbnQxNl90KikweDIwMDAwMDAyID0gMDsKKih1aW50MTZfdCop
MHgyMDAwMDAwNCA9IDA7CioodWludDE2X3QqKTB4MjAwMDAwMDYgPSAwOwoqKHVpbnQxNl90Kikw
eDIwMDAwMDA4ID0gMHgzMDA7CioodWludDE2X3QqKTB4MjAwMDAwMGEgPSAwOwoJc3lzY2FsbChf
X05SX2lvY3RsLCByWzBdLCAweDU0MWMsIDB4MjAwMDAwMDB1bCk7CglyZXMgPSAtMTsKcmVzID0g
c3l6X29wZW5fZGV2KDB4YywgNCwgMSk7CglpZiAocmVzICE9IC0xKQoJCXJbMV0gPSByZXM7Cioo
dWludDMyX3QqKTB4MjAwMDA0ODAgPSAwOwoqKHVpbnQzMl90KikweDIwMDAwNDg0ID0gMDsKKih1
aW50MzJfdCopMHgyMDAwMDQ4OCA9IDM7CioodWludDMyX3QqKTB4MjAwMDA0OGMgPSAweDFiOwoq
KHVpbnQzMl90KikweDIwMDAwNDkwID0gMHgyMDA7CioodWludDY0X3QqKTB4MjAwMDA0OTggPSAw
eDIwMDAwMDQwOwptZW1jcHkoKHZvaWQqKTB4MjAwMDAwNDAsICJceDExXHg2YVx4OWNceGFmXHhm
N1x4M2FceDg1XHgyOVx4NjJceDJlXHg2OVx4OGZceDFlXHhmM1x4ZmFceDRlXHgzYlx4YjRceDk1
XHgyOVx4MjJceDI4XHg3Ylx4ZjRceGQ0XHhkYlx4NThceDAxXHgwYlx4MGNceDkzXHgxMlx4N2Jc
eGQ1XHhhMVx4OGRceGJkXHgwOVx4ZTdceGRmXHg5MVx4OTBceGMxXHg3Mlx4OTZceDI5XHhkMFx4
MGZceDJkXHhjNVx4YzhceDRmXHg4Mlx4ZWFceGVjXHhkM1x4NTBceGM2XHhjYVx4NGVceDcwXHg0
Nlx4ODhceDE5XHhkZVx4MTRceGUzXHhkMFx4ZTRceDkxXHg1Y1x4NWRceDhkXHg2YVx4YmZceDcx
XHhlZVx4ZDJceGQ0XHgwNlx4OTVceGM1XHg1Y1x4NzhceDFkXHhjYVx4ZjhceDBhXHg0YVx4MjZc
eDllXHgxY1x4NDNceGM3XHhlZFx4OWVceGQ1XHhlNVx4ZTNceDg2XHhhMlx4OTBceDI0XHgyYVx4
OGJceDAwXHg3MFx4YTdceGMwXHgwOVx4MjNceDQxXHgwYVx4ZTJceGY5XHg1MVx4YWRceDQ2XHg1
OVx4M2JceGU4XHhiNVx4MDNceDAwXHgwMFx4MDBceGFmXHhhN1x4Y2RceDBmXHhjMlx4ZWFceDQ2
XHhiNFx4MjFceGE0XHhhYVx4NzRceDFjXHg4MFx4ODVceGZkXHgxN1x4ZDVceGQ5XHg5Y1x4ODJc
eDkyXHg1OVx4MThceDI5XHgzOVx4MDFceDQ2XHgxYlx4ZjdceDA4XHg5Y1x4MzhceDBlXHgxMlx4
N2ZceDhkXHhlNlx4ODdceDU4XHgxMVx4MzJceGM3XHgzMFx4ZGVceGYyXHg2Nlx4NTRceDRiXHhi
Ylx4YzZceDBkXHgyMVx4ZThceDlkXHg2NFx4NzlceDVkXHhlN1x4OWJceDU1XHhiYlx4MWVceGQ5
XHhkOFx4N2FceGE5XHhmM1x4YTNceGQ1XHgwMVx4MDVceDkxXHhmOFx4NmZceDZhXHg1Mlx4NTBc
eDM4XHhlZVx4NmNceGQ4XHhlNlx4OTJceDBjXHgzZlx4NmVceGRiXHhjNFx4MDRceDE2XHhlMFx4
NDVceDM1XHhkYlx4NzFceDg4XHgyYVx4YTVceDgyXHhkZVx4OWZceDI1XHg1ZVx4YWZceDVlXHhj
NVx4NzRceGU0XHg2M1x4M2NceDhkXHg0MVx4OTdceDE3XHg4ZFx4YTRceDlkXHhiMlx4YWJceGIw
XHhjNFx4MzlceDk4XHgzMVx4NmJceGJmXHgxZFx4YzZceDlhXHg3OVx4MGNceGM5XHg1YVx4OTNc
eDdlXHgwOVx4NzhceGM1XHgzOFx4MjlceDE3XHgwNFx4ZGZceDg3XHg2OVx4Y2VceGU1XHhiMVx4
ZjNceDAyXHg0MVx4OTJceDBhXHg3Mlx4ZWZceGJjXHhjY1x4ZWJceDYxXHgzMFx4ZmFceDg4XHhk
Ylx4MGVceDUwXHgxZVx4M2ZceDU4XHg4N1x4NDVceDlkXHhiNFx4YjdceDdjXHgxNVx4ODFceGY2
XHhkNVx4OGFceDNhXHgxZVx4NDdceDAwXHgxOFx4OGFceDg4XHg0N1x4NTJceGIyXHhhZlx4YzJc
eGM4XHgwZVx4N2JceGMzXHhjM1x4ZmNceGU3XHg4NFx4ZjZceDcwXHhhYVx4MDFceDMzXHgxZVx4
ZWVceDk1XHg0ZFx4MGNceDkzXHhiYlx4NjZceDQ1XHhmZlx4ZjNceGUzXHhmYVx4ZmJceGQ4XHgy
OFx4YWFceDEyXHhiN1x4ZTRceDk2XHhhNVx4YWNceDM5XHg0N1x4YTNceGVlXHhlY1x4OWNceDc0
XHhhMFx4NGFceDE0XHgzNFx4MGNceDhhXHhiNlx4N2NceDE0XHhhYlx4MzRceDQwXHgyMFx4OTlc
eDZmXHgyMVx4MTNceDZiXHg0Nlx4OWJceDhiXHhlMFx4OTVceDhkXHg3ZVx4OGJceGNjXHgzMlx4
NDlceDBiXHg3MFx4NzRceGM1XHhlM1x4NDRceGUwXHgwYlx4NmVceGQyXHhlMlx4ZWJceGY0XHhj
OVx4YTNceGFjXHg5Ylx4NmZceDc0XHhkM1x4ZDdceGU3XHhkM1x4ZWZceDc2XHhjN1x4YTdceDg5
XHhhOVx4MmRceGRlXHhlZFx4NzJceDE5XHhmMFx4YmZceGFjXHg3Y1x4N2FceGNlXHg4NVx4OGVc
eGM1XHg0M1x4MTFceGNlXHgzMlx4MGZceDEyXHg2MVx4NWFceGNiXHg0MFx4OGRceDU4XHhjNlx4
MmVceGEzXHg2M1x4OTRceGRkXHhmMlx4MWZceDBkXHg0N1x4ZTBceDZlXHg4OFx4MTVceDRiXHhh
Mlx4NjNceGQyXHhhOVx4NTBceGMxXHg4OFx4YzlceGNiXHg5OVx4ZGRceDk1XHgwNVx4ZmFceDdk
XHhmYVx4ZTBceDhlXHhkOFx4ZjZceDhmXHhiOFx4MmVceDk0XHhjYlx4OGRceDJmXHgxYVx4MzZc
eGVmXHg2Y1x4M2NceDljXHg1ZFx4MjJceDAxXHhmZVx4NTNceDhiXHg0ZVx4MDFceDMwXHgzMFx4
ZDJceGYyXHg4N1x4MWFceGJiXHgwNFx4ZDZceGM2XHg3MVx4Y2JceDM3XHg4Zlx4ZDBceGRhXHgy
Mlx4MDNceDRmXHgyOFx4MGZceGE4XHgxNVx4ZGVceDUwXHhjNFx4MmZceDI1XHhjM1x4OTNceGJj
XHhkY1x4ZjdceDUxXHg3MFx4YzdceGEwXHhkZFx4MmJceDliXHgyMlx4YTdceGVhXHhkZlx4YmJc
eDliXHg1ZVx4YTJceGQzXHg1OFx4ODRceDM4XHg1ZVx4MjBceDQ1XHhiZlx4ZTlceGYzXHg4OFx4
MDNceGRhXHhmMVx4NmZceDMzXHg3MVx4YjNceDhhXHhjMVx4MDlceGYwXHg4Y1x4NDlceDU4XHgy
NFx4MmFceDlkXHgyMVx4YTlceGUwXHhjMVx4MmNceGFmXHhiM1x4NWZceGQ3XHhmNFx4MzlceGMx
XHhkMFx4YWNceGJlXHhjMFx4MzdceGU4XHgzOFx4Y2NceDNmXHg2N1x4NDZceDEzXHhiN1x4NWZc
eGIzXHg3OFx4ZDdceDljXHg1ZVx4NzZceDMwXHg2Ylx4NWVceDdmXHg4NFx4MWRceDQ2XHgyOFx4
NjRceDY4XHg0Nlx4OWRceDBkXHgwNVx4MWZceDRhXHgzYlx4ZDVceDViXHg2Zlx4MWVceGUzXHhj
MVx4NzdceGNjXHhhMVx4NTZceDIxXHhjN1x4MWVceDA2XHg4Ylx4MWRceGEyXHg2OVx4M2RceDI4
XHgwMFx4MmJceDAwXHhlM1x4ODVceDAyXHg2Zlx4NmJceDlhXHgwZFx4NWJceDU1XHhjZFx4MGVc
eGI3XHgxZVx4MWRceDVjXHgzN1x4M2VceDE0XHg1NFx4OGJceDY5XHgyNVx4NGRceGU2XHhjNVx4
YmNceGQ5XHg1Ylx4ZmZceDA5XHgyOVx4ZDlceDM0XHg0NFx4YzVceGI5XHhhN1x4ZjZceDBjXHg4
Y1x4MDRceDAxXHhjNlx4ZjhceGQ2XHhmOFx4YmNceDNmXHg4Zlx4ZGJceGYwXHg0NFx4NjhceDZj
XHg1Ylx4NzRceGE5XHhjYVx4YjNceDVmXHg1Nlx4M2FceDllXHg2MVx4Y2FceDcyXHgwMVx4OTZc
eDdjXHgwOFx4MzlceDg2XHg1Y1x4ZTVceDhiXHgzOFx4NzlceDQ5XHgzMFx4OTVceDU0XHhjMlx4
MmFceGI1XHg1MVx4MGJceGEwXHhiOVx4MTNceGFjXHhjZlx4N2RceGVjXHgzZVx4ODhceDBhXHgy
Mlx4N2FceDAyXHhmOFx4ZjdceDY0XHhiMVx4OTNceDExXHg0YVx4ODhceGFkXHhmNFx4YzZceDMw
XHg2MFx4NTFceGU2XHg3NFx4ZDlceGQ0XHg2Ylx4MzVceDgwXHg4Ylx4MzlceDEyXHhhN1x4MTNc
eDYzXHhmOFx4MDJceGQxXHg3OVx4ODBceDBmXHg0Zlx4OTFceDhjXHg3Zlx4ZWNceDIwXHgyY1x4
MzVceDU0XHg3Zlx4ZWFceGVhXHg3ZFx4Y2FceGM3XHhlZVx4YjZceGNhXHg2ZVx4MjNceGM4XHg5
OVx4OTVceGMxXHg2ZFx4ZWZceGMwXHhkYVx4MTlceGYwXHgxNVx4MWFceDA3XHhmYVx4OGRceDdk
XHhlY1x4ZmFceDA5XHgzOVx4NjZceGQ3XHg2Zlx4NjRceDdlXHg5M1x4ZmNceGI2XHg0N1x4MTRc
eDk5XHgwYVx4ZTFceDc5XHgxNlx4Y2VceGUyXHhkMFx4NzlceGZlXHhhNlx4NmNceDJkXHgxYVx4
OGFceGYwXHgzYlx4YjhceDQyXHhiZVx4NWJceDhiXHg3Mlx4ZjFceGU5XHg0Y1x4OTFceDQyXHhi
NFx4NTZceDg3XHg2Ylx4MjZceGNhXHg4OVx4OTFceDdjXHhiNlx4ZDZceGI3XHgyY1x4N2VceDNj
XHhjZVx4NjRceDkzXHgwMFx4NDBceDZhXHg0NFx4MjhceDIzXHg2ZVx4YTBceDEyXHg4Zlx4OGZc
eDM1XHhlNFx4MzBceDUzXHhhOFx4Y2VceDA4XHg4ZFx4ZmFceDU5XHg4Ylx4ZjNceDliXHhjOFx4
YTZceDI4XHg1Zlx4MmNceDgzXHgxZVx4NmJceGEyXHhiZVx4ZjNceDkxXHhjNlx4M2NceGU5XHg2
OVx4NTZceGIyXHg4OVx4NzJceDUyXHg5NVx4MzRceGM0XHgzOFx4NzlceDE1XHhkMFx4MWVceDUx
XHhiNVx4OTJceGFkXHg4ZVx4YzhceDVkXHg2YVx4NWRceDAyXHhlOVx4ZDhceDc1XHhiOFx4MDhc
eDRkXHgwYlx4YmNceGNjXHgzZlx4ZjlceDA1XHgwMVx4MDFceGRlXHg1N1x4N2RceDllXHgzZFx4
OWJceGI4XHhjNlx4NGJceGE0XHhiNFx4ZTVceDczXHg2Y1x4NWRceDg5XHhhM1x4MTBceGZjXHhj
ZVx4MWVceGU5XHg2Zlx4MWZceGRkXHgwYVx4ZDRceGY4XHhjNVx4NWNceGIxXHhjZFx4MTBceDBk
XHg4Y1x4NzdceDEyXHg5NVx4YjdceDEyXHgyOVx4MThceGQ1XHg0M1x4ZWFceGJkXHhmNlx4Nzhc
eDk4XHhhM1x4MzZceDIzXHgyM1x4ZWRceDhjXHhhZFx4ZGRceDRmXHg3Ylx4MTlceDViXHhiM1x4
NWJceGUxXHgwOVx4NGVceGYyXHg2ZVx4YmVceDBiIiwgMTAyNCk7CglzeXNjYWxsKF9fTlJfaW9j
dGwsIHJbMV0sIDB4NGI3MiwgMHgyMDAwMDQ4MHVsKTsKCXJldHVybiAwOwp9Cg==
--000000000000a92b9705e4d26c85
Content-Type: application/octet-stream; name="repro.syz"
Content-Disposition: attachment; filename="repro.syz"
Content-Transfer-Encoding: base64
Content-ID: <f_l64a8o681>
X-Attachment-Id: f_l64a8o681

cjAgPSBzeXpfb3Blbl9kZXYkdHR5MSgweGMsIDB4NCwgMHgxKQppb2N0bCRUSU9DTF9TRVRTRUwo
cjAsIDB4NTQxYywgJigweDdmMDAwMDAwMDAwMCk9ezB4MiwgezB4MiwgMHgwLCAweDAsIDB4MCwg
MHgzMDB9fSkKcjEgPSBzeXpfb3Blbl9kZXYkdHR5MSgweGMsIDB4NCwgMHgxKQppb2N0bCRLREZP
TlRPUF9TRVQocjEsIDB4NGI3MiwgJigweDdmMDAwMDAwMDQ4MCk9ezB4MCwgMHgwLCAweDMsIDB4
MWIsIDB4MjAwLCAmKDB4N2YwMDAwMDAwMDQwKT0iMTE2YTljYWZmNzNhODUyOTYyMmU2OThmMWVm
M2ZhNGUzYmI0OTUyOTIyMjg3YmY0ZDRkYjU4MDEwYjBjOTMxMjdiZDVhMThkYmQwOWU3ZGY5MTkw
YzE3Mjk2MjlkMDBmMmRjNWM4NGY4MmVhZWNkMzUwYzZjYTRlNzA0Njg4MTlkZTE0ZTNkMGU0OTE1
YzVkOGQ2YWJmNzFlZWQyZDQwNjk1YzU1Yzc4MWRjYWY4MGE0YTI2OWUxYzQzYzdlZDllZDVlNWUz
ODZhMjkwMjQyYThiMDA3MGE3YzAwOTIzNDEwYWUyZjk1MWFkNDY1OTNiZThiNTAzMDAwMDAwYWZh
N2NkMGZjMmVhNDZiNDIxYTRhYTc0MWM4MDg1ZmQxN2Q1ZDk5YzgyOTI1OTE4MjkzOTAxNDYxYmY3
MDg5YzM4MGUxMjdmOGRlNjg3NTgxMTMyYzczMGRlZjI2NjU0NGJiYmM2MGQyMWU4OWQ2NDc5NWRl
NzliNTViYjFlZDlkODdhYTlmM2EzZDUwMTA1OTFmODZmNmE1MjUwMzhlZTZjZDhlNjkyMGMzZjZl
ZGJjNDA0MTZlMDQ1MzVkYjcxODgyYWE1ODJkZTlmMjU1ZWFmNWVjNTc0ZTQ2MzNjOGQ0MTk3MTc4
ZGE0OWRiMmFiYjBjNDM5OTgzMTZiYmYxZGM2OWE3OTBjYzk1YTkzN2UwOTc4YzUzODI5MTcwNGRm
ODc2OWNlZTViMWYzMDI0MTkyMGE3MmVmYmNjY2ViNjEzMGZhODhkYjBlNTAxZTNmNTg4NzQ1OWRi
NGI3N2MxNTgxZjZkNThhM2ExZTQ3MDAxODhhODg0NzUyYjJhZmMyYzgwZTdiYzNjM2ZjZTc4NGY2
NzBhYTAxMzMxZWVlOTU0ZDBjOTNiYjY2NDVmZmYzZTNmYWZiZDgyOGFhMTJiN2U0OTZhNWFjMzk0
N2EzZWVlYzljNzRhMDRhMTQzNDBjOGFiNjdjMTRhYjM0NDAyMDk5NmYyMTEzNmI0NjliOGJlMDk1
OGQ3ZThiY2MzMjQ5MGI3MDc0YzVlMzQ0ZTAwYjZlZDJlMmViZjRjOWEzYWM5YjZmNzRkM2Q3ZTdk
M2VmNzZjN2E3ODlhOTJkZGVlZDcyMTlmMGJmYWM3YzdhY2U4NThlYzU0MzExY2UzMjBmMTI2MTVh
Y2I0MDhkNThjNjJlYTM2Mzk0ZGRmMjFmMGQ0N2UwNmU4ODE1NGJhMjYzZDJhOTUwYzE4OGM5Y2I5
OWRkOTUwNWZhN2RmYWUwOGVkOGY2OGZiODJlOTRjYjhkMmYxYTM2ZWY2YzNjOWM1ZDIyMDFmZTUz
OGI0ZTAxMzAzMGQyZjI4NzFhYmIwNGQ2YzY3MWNiMzc4ZmQwZGEyMjAzNGYyODBmYTgxNWRlNTBj
NDJmMjVjMzkzYmNkY2Y3NTE3MGM3YTBkZDJiOWIyMmE3ZWFkZmJiOWI1ZWEyZDM1ODg0Mzg1ZTIw
NDViZmU5ZjM4ODAzZGFmMTZmMzM3MWIzOGFjMTA5ZjA4YzQ5NTgyNDJhOWQyMWE5ZTBjMTJjYWZi
MzVmZDdmNDM5YzFkMGFjYmVjMDM3ZTgzOGNjM2Y2NzQ2MTNiNzVmYjM3OGQ3OWM1ZTc2MzA2YjVl
N2Y4NDFkNDYyODY0Njg0NjlkMGQwNTFmNGEzYmQ1NWI2ZjFlZTNjMTc3Y2NhMTU2MjFjNzFlMDY4
YjFkYTI2OTNkMjgwMDJiMDBlMzg1MDI2ZjZiOWEwZDViNTVjZDBlYjcxZTFkNWMzNzNlMTQ1NDhi
NjkyNTRkZTZjNWJjZDk1YmZmMDkyOWQ5MzQ0NGM1YjlhN2Y2MGM4YzA0MDFjNmY4ZDZmOGJjM2Y4
ZmRiZjA0NDY4NmM1Yjc0YTljYWIzNWY1NjNhOWU2MWNhNzIwMTk2N2MwODM5ODY1Y2U1OGIzODc5
NDkzMDk1NTRjMjJhYjU1MTBiYTBiOTEzYWNjZjdkZWMzZTg4MGEyMjdhMDJmOGY3NjRiMTkzMTE0
YTg4YWRmNGM2MzA2MDUxZTY3NGQ5ZDQ2YjM1ODA4YjM5MTJhNzEzNjNmODAyZDE3OTgwMGY0Zjkx
OGM3ZmVjMjAyYzM1NTQ3ZmVhZWE3ZGNhYzdlZWI2Y2E2ZTIzYzg5OTk1YzE2ZGVmYzBkYTE5ZjAx
NTFhMDdmYThkN2RlY2ZhMDkzOTY2ZDc2ZjY0N2U5M2ZjYjY0NzE0OTkwYWUxNzkxNmNlZTJkMDc5
ZmVhNjZjMmQxYThhZjAzYmI4NDJiZTViOGI3MmYxZTk0YzkxNDJiNDU2ODc2YjI2Y2E4OTkxN2Ni
NmQ2YjcyYzdlM2NjZTY0OTMwMDQwNmE0NDI4MjM2ZWEwMTI4ZjhmMzVlNDMwNTNhOGNlMDg4ZGZh
NTk4YmYzOWJjOGE2Mjg1ZjJjODMxZTZiYTJiZWYzOTFjNjNjZTk2OTU2YjI4OTcyNTI5NTM0YzQz
ODc5MTVkMDFlNTFiNTkyYWQ4ZWM4NWQ2YTVkMDJlOWQ4NzViODA4NGQwYmJjY2MzZmY5MDUwMTAx
ZGU1NzdkOWUzZDliYjhjNjRiYTRiNGU1NzM2YzVkODlhMzEwZmNjZTFlZTk2ZjFmZGQwYWQ0Zjhj
NTVjYjFjZDEwMGQ4Yzc3MTI5NWI3MTIyOTE4ZDU0M2VhYmRmNjc4OThhMzM2MjMyM2VkOGNhZGRk
NGY3YjE5NWJiMzViZTEwOTRlZjI2ZWJlMGIifSkK
--000000000000a92b9705e4d26c85--
