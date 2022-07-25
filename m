Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95928580BD9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E4D10F523;
	Tue, 26 Jul 2022 06:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4470FBFB31
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:09:46 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 o20-20020a17090aac1400b001f2da729979so1028709pjq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=EIR4ZSRfe0O4gYDWp/Ksyq990maSjPAWqyDxtmRA+zo=;
 b=bCkocGqt6oLGbhoYQ9wVKcAOsRPyKF55rWTnZE7j05IDTE07VSu2cK1obe1StiGUM/
 vWSs3poFkgxPhr2JQ1/bJpVyED+6057Yes13wUIovsz6ZE6Lgc/pIb2AnRbQaTd4DNG+
 m5DUHEShIyOZ9CkJiUrUpgSJrCLOHmOsyzTAqo8EhUeBuyTsnqHgdDzKdQXrX//Y2OOK
 E6vDws2ObHfoSrDD5ILgra3SRjtM0fi/AXeJ17Nys+Gz5V19zLJ7nbpom2RgISRXItqT
 e0ZWduGUvIAeJ5SYi5PRhfIu49mkh2OpENaGsXmfcMpVuvaQ2ZSnLw8gDYpzRkHF4H6x
 4Inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EIR4ZSRfe0O4gYDWp/Ksyq990maSjPAWqyDxtmRA+zo=;
 b=WJlS/9qD/0gEqzFV/Jy1u/buPsNK3fzNaN/eO1ruEmn+/TKuOQrNKsbKK5UnjbvoHM
 QvaVbJScuTmvugUJYG0rBmBJWjVvDBVABgo2T/n7XdnsJ2RDGau4GDQGqcpP8p3+ZiIS
 sPdouHFKsYpnUs8fP2vPk4RZF0lqyKzp3M3CxXO3tkCQBAILmo8b3RsoijLpxBUjcyRk
 0WkTyRkkj66OxWea0e+lkZz4itblg5aM5CusN0UH8JhYi4+5fXVCftCOEaErDeoPDAkB
 XXNW3oRPre0qgMtXPabjaQgktdJCoe3lPdKJJAYJ/xTuqUDwtGMHhaO4VlsIgpQBdnYd
 lmXg==
X-Gm-Message-State: AJIora9Paqp1PMhwLutIQWXUDEPsZhc8l+keCEyZwaIsmXfi3wmREyRn
 bVH4ByzEgKGAzzrVkxfyMmV8Q6rWUpBQkex/ilk7JGzdfVYsILld
X-Google-Smtp-Source: AGRyM1u+116EzlkFwbGEi02F/+1TWYUflmXrUKxAtYHuNaO7oK2tYsdEoftL7wUpsM5w3xn0pHjUw1irvJfvrYWntTk=
X-Received: by 2002:a17:903:1245:b0:16c:f984:8462 with SMTP id
 u5-20020a170903124500b0016cf9848462mr12655769plh.0.1658761785454; Mon, 25 Jul
 2022 08:09:45 -0700 (PDT)
MIME-Version: 1.0
From: Kyryl Melekhin <k.melekhin@gmail.com>
Date: Mon, 25 Jul 2022 11:09:33 +0000
Message-ID: <CABgARp9CRZO2ODUR1=j5TiWCL1DKRg_pYKLbihnQ81oZT=X5mA@mail.gmail.com>
Subject: [amdgpu] drm/ttm framebuffer race condition into fork()
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="000000000000fd4b5505e4a292e2"
X-Mailman-Approved-At: Tue, 26 Jul 2022 06:47:09 +0000
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

--000000000000fd4b5505e4a292e2
Content-Type: text/plain; charset="UTF-8"

Hello Dri-devel,

( Apparently I have issues with subscribing to your
mailing list, It never sent me a confirmation email,
if you have the time pls manually subscribe me
cause this thing is broken:
https://lists.freedesktop.org/mailman/listinfo/dri-devel )

There is yet another race condition happening with ttm objects,
this time with fbdev.

Please consider the following simple code that shows the problem (or
email attached):
https://0x0.st/ojmf.c

The kernel assertion:

[ 2112.472011] ---[ end trace 0000000000000000 ]---
[ 2182.118552] usb 3-2.2.1.4: reset high-speed USB device number 8
using xhci_hcd
[ 2194.632197] ------------[ cut here ]------------
[ 2194.632199] WARNING: CPU: 6 PID: 383 at
drivers/gpu/drm/ttm/ttm_bo_vm.c:352 0xffffffff8169c28f
[ 2194.632201] CPU: 6 PID: 383 Comm: fb Tainted: G        W
5.19.0-rc7+ #22 353afba44cdabdab9fdfaa6990a088718abd5d85
[ 2194.632204] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X300M-STX, BIOS L1.72 10/08/2021
[ 2194.632205] RIP: 0010:0xffffffff8169c28f
[ 2194.632206] Code: 48 8d ba 50 01 00 00 b8 01 00 00 00 f0 0f c1 82
50 01 00 00 85 c0 74 16 8d 50 01 09 c2 78 01 c3 be 01 00 00 00 e9 91
47 e5 ff <0f> 0b eb d2 be 02 00 00 00 e9 83 47 e5 ff 0f 1f 00 41 57 41
56 41
[ 2194.632207] RSP: 0018:ffffc90000767d30 EFLAGS: 00010287
[ 2194.632209] RAX: ffff888100a627b8 RBX: ffff888101745ec0 RCX: ffff888102285128
[ 2194.632210] RDX: ffff888102b00058 RSI: 00007f89976fb000 RDI: ffff88811031d440
[ 2194.632211] RBP: ffff88810177c800 R08: ffff888102541138 R09: ffff88811f9d95e0
[ 2194.632212] R10: ffff8887fe2fc000 R11: 0000000000000000 R12: 0000000000000000
[ 2194.632213] R13: ffff888102c5fc00 R14: ffff88811031d390 R15: ffff88811031d440
[ 2194.632213] FS:  00007f89977afb68(0000) GS:ffff8887ded80000(0000)
knlGS:0000000000000000
[ 2194.632214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2194.632215] CR2: 00007f8994840000 CR3: 00000001047df000 CR4: 0000000000750ee0
[ 2194.632216] PKRU: 55555554
[ 2194.632217] Call Trace:
[ 2194.632218]  <TASK>
[ 2194.632219]  0xffffffff81040d1e
[ 2194.632220]  0xffffffff8104306b
[ 2194.632221]  0xffffffff81043306
[ 2194.632222]  ? 0xffffffff81608ae6
[ 2194.632222]  0xffffffff810437d1
[ 2194.632223]  0xffffffff81fa1884
[ 2194.632224]  0xffffffff8200006a
[ 2194.632225] RIP: 0033:0x00007f8997749429
[ 2194.632226] Code: 88 00 00 00 31 c0 48 89 e5 48 89 ef e8 e0 b5 00
00 bf ff ff ff ff e8 36 7a fc ff 4c 89 e7 e8 ae bc 01 00 b8 39 00 00
00 0f 05 <48> 89 c3 85 c0 75 50 b8 ba 00 00 00 64 48 8b 14 25 00 00 00
00 0f
[ 2194.632227] RSP: 002b:00007ffee0d808e0 EFLAGS: 00000246 ORIG_RAX:
0000000000000039
[ 2194.632228] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f8997749429
[ 2194.632229] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007f89977affd4
[ 2194.632230] RBP: 00007ffee0d808e0 R08: 0000000000000000 R09: 0000000000000000
[ 2194.632230] R10: 0000000000000008 R11: 0000000000000246 R12: 00007f89977affd4
[ 2194.632231] R13: 00007f89977afb9c R14: 00007ffee0d809a0 R15: 00007f89977b0a40
[ 2194.632232]  </TASK>

Apparently this commit does not fix it
dbd0da2453c694f2f74651834d90fb280b57f151

Hardware info:
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
Root Complex
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:02.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
PCIe GPP Bridge
00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
PCIe GPP Bridge
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal
PCIe GPP Bridge to Bus
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 51)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev 51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 7
04:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] Cezanne (rev c8)
04:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir
Radeon High Definition Audio Controller

Kyryl

--000000000000fd4b5505e4a292e2
Content-Type: application/octet-stream; name="fb.c"
Content-Disposition: attachment; filename="fb.c"
Content-Transfer-Encoding: base64
Content-ID: <f_l60ncukt0>
X-Attachment-Id: f_l60ncukt0

I2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+
CiNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KI2luY2x1ZGUgPHN5cy9tbWFuLmg+CiNpbmNsdWRlIDx1
bmlzdGQuaD4KI2luY2x1ZGUgPGxpbnV4L3Z0Lmg+CiNpbmNsdWRlIDxsaW51eC9mYi5oPgoKaW50
IF9mYl9pbml0KGNoYXIgKmRldikKewoJaW50IGZkID0gb3BlbihkZXYsIE9fUkRXUik7CglpZiAo
ZmQgPCAwKQoJCWdvdG8gZmFpbGVkOwoJc3RhdGljIHN0cnVjdCBmYl92YXJfc2NyZWVuaW5mbyB2
aW5mbzsJCS8qIGxpbnV4LXNwZWNpZmljIEZCIHN0cnVjdHVyZSAqLwoJc3RhdGljIHN0cnVjdCBm
Yl9maXhfc2NyZWVuaW5mbyBmaW5mbzsJCS8qIGxpbnV4LXNwZWNpZmljIEZCIHN0cnVjdHVyZSAq
LwoJaWYgKGlvY3RsKGZkLCBGQklPR0VUX1ZTQ1JFRU5JTkZPLCAmdmluZm8pIDwgMCkKCQlnb3Rv
IGZhaWxlZDsKCWlmIChpb2N0bChmZCwgRkJJT0dFVF9GU0NSRUVOSU5GTywgJmZpbmZvKSA8IDAp
CgkJZ290byBmYWlsZWQ7CglmY250bChmZCwgRl9TRVRGRCwgZmNudGwoZmQsIEZfR0VURkQpIHwg
RkRfQ0xPRVhFQyk7CgltbWFwKE5VTEwsIGZpbmZvLmxpbmVfbGVuZ3RoICogdmluZm8ueXJlc192
aXJ0dWFsLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLCBNQVBfU0hBUkVELCBmZCwgMCk7CglyZXR1
cm4gMDsKZmFpbGVkOgoJcGVycm9yKCJmYl9pbml0KCkiKTsKCWNsb3NlKGZkKTsKCXJldHVybiAx
Owp9CgppbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCnsKCWlmIChfZmJfaW5pdCgiL2Rl
di9mYjAiKSkgewoJCWZwcmludGYoc3RkZXJyLCAiZmJwYWQ6IGZhaWxlZCB0byBpbml0aWFsaXpl
IHRoZSBmcmFtZWJ1ZmZlclxuIik7CgkJcmV0dXJuIDE7Cgl9CglpbnQgcGlkOwoJaWYgKChwaWQg
PSBmb3JrKCkpID09IC0xKQoJCXJldHVybiAwOwoJaWYgKCFwaWQpIHsKCQlleGl0KDEpOwoJfQoJ
cmV0dXJuIDA7Cn0K
--000000000000fd4b5505e4a292e2--
