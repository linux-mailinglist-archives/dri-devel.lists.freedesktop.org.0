Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC2D991FC4
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 18:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6D010E181;
	Sun,  6 Oct 2024 16:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="EXuIxqOh";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="XCqLBfu/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF8B10E181;
 Sun,  6 Oct 2024 16:56:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728233735; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=J6XCeTgFTk87OGMMGYYUG1INYnwKc6G8O2dv+Sx8dYo7kbcyqkPaZ/EfbnJCEPmjmR
 IFLVQAsBhnNbZvfFrrzUfU69yyTELLDHwnuN79SK+CKUxG/Fqz63BOEaQCbGzG8rFJz2
 NWjxn0Os2Ox+fDhMXxo0Oua1Ul/PXbAa0cKG3vep10NyBwsexl4QGmH+UyUC8igirXHp
 pwWVJae5eoREyEgc9iw/XXBPohgJTH+U2SdNISlk6pN5O2ALiHTDEOAWQJZwjzK0aN4K
 4bO8viibwN1jGrJUZ8uuwCvZEc8qXYaD5aIR11YKOoTxNKZOGglRnvJFQF+T5m8KYLdH
 WtZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728233735;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=D+v09vhJc2aIoMXqLg8wpMwt7Qus1YXmDT5+MGSWapE=;
 b=N3Sr6l4kHZkvwa3Mp86jYooYR/F2lid5xvG7kXzepXhUQ9TbO2k+o5XWTz9f2eX8rQ
 jgJfioExNA60rqzKngTSXkgB6/67yDe7Iyr39+mGqFAYwOSK1MF7Tz4G9dSV9g9x7BDq
 Dk5tLsGKGHhWKTEBWaupmlKMBKtKSCIryO5aWyGB50OBGV5Vq4laccmyn17jknn8M5vC
 EdTrXy5S9gzWq+JN1nyWuwwyrVVvCW9xmGRWzKlWf/wGLGLmJwyUYPGtNFgm33PL6tgX
 B1VBQJ+59hjxzomyXNe/2bcHmqjG44mHc3w1onDTvfCC5wudgwtAuY0CoUnr3a1MxJPf
 YXZA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728233735;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=D+v09vhJc2aIoMXqLg8wpMwt7Qus1YXmDT5+MGSWapE=;
 b=EXuIxqOhbMEWdxNjNmTXWHdzZsNuC8xmOh+ArHXMAQzCB4mkVm028GMtQ41M+EhNyv
 PnAZt30gB1PHpKpDTemGds6Qi9wqMAAR8AQpI2FsKR/R59qBDSIBNlWyIsmW1Vat/VQY
 QVG04AJmVNqHSfQlAboFPgFXM7fkOtrnmXmjcOS7+re/Hl01S2IQMiqwy+NNpMIZSaRW
 M2JA2G6lazMnc0LE4mdT5uTdrh912MlhmNKMa9O9BAcVIho3Nh9w8XXykf7cooH7VmNu
 sKVmcLWD/qNXq3u9fF9Ovqgv8LB5AAb8aJw0bouduBMjT7joxrNQAkYRtqO/8mrZa1WZ
 zycw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728233735;
 s=strato-dkim-0003; d=xenosoft.de;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=D+v09vhJc2aIoMXqLg8wpMwt7Qus1YXmDT5+MGSWapE=;
 b=XCqLBfu/wW2qi+9wjSzN4eAG6m7egbFQA1ynzj7oyt9V5BvMbIXdAU9BeWcUMS2vVI
 nePYlJVjfx95xgXbmRDA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5iwsy7MCXy6PSqCrq1ZtS8x3p03w8T3myCd9iA="
Received: from [IPV6:2a01:599:804:e810:d191:ddf7:881a:6810]
 by smtp.strato.de (RZmta 51.2.8 AUTH) with ESMTPSA id e0da1a096GtXgzf
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 6 Oct 2024 18:55:33 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------tY0VRno1MNlN7GzKInVNVfoW"
Message-ID: <d2704a2b-ceb2-4919-81d3-f6ff58a734fe@xenosoft.de>
Date: Sun, 6 Oct 2024 18:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] drm/radeon: add late_register for connector
To: Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson"
 <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 hypexed@yahoo.com.au, Christian Zigotzky <info@xenosoft.de>,
 Darren Stevens <darren@stevens-zone.net>
References: <20241003060650.18454-1-wuhoipok@gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <20241003060650.18454-1-wuhoipok@gmail.com>
Content-Transfer-Encoding: 8bit
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

This is a multi-part message in MIME format.
--------------tY0VRno1MNlN7GzKInVNVfoW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03 October 2024 at 08:06 am, Wu Hoi Pok wrote:
> This is a fix patch not tested yet,
> for a bug I introduce in previous rework of radeon driver.
> The bug is a null dereference in 'aux.dev', which is the
> 'device' not registered, resulting in kernel panic. By having
> 'late_register', the connector should be registered after
> 'drm_dev_register' automatically.
>
> Please help testing thank you.
Hello Wu Hoi Pok,

Thanks a lot for your patch. Unfortunately there is a new issue after 
patching the RC1. Could you please fix the following issue?

Thanks,
Christian

---

Linux fienix 6.12.0-rc1-2-powerpc64-smp #1 SMP Fri Oct  4 08:55:45 CEST 
2024 ppc64 GNU/Linux

[   29.167145] systemd[1]: Sent message type=signal sender=n/a 
destination=n/a 
path=/org/freedesktop/systemd1/unit/NetworkManager_2eservice 
interface=org.freedesktop.DBus.Properties member=PropertiesChanged 
cookie=103 reply_cookie=0 signature=sa{sv}as error-name=n/a 
error-message=n/a
[   29.542140] systemd-journald[1301]: Successfully sent stream file 
descriptor to service manager.
[   29.561863] BUG: Kernel NULL pointer dereference on read at 0x00000000
[   29.567156] Faulting instruction address: 0xc000000000c973c0
[   29.571574] cpu 0x1: Vector: 300 (Data Access) at [c000000006f97640]
[   29.576637]     pc: c000000000c973c0: .drm_gem_object_free+0x20/0x70
[   29.581708]     lr: c000000000d28dd8: .radeon_bo_unref+0x58/0x90
[   29.586428]     sp: c000000006f978e0
[   29.588695]    msr: 9000000000009032
[   29.590962]    dar: 0
[   29.591925]  dsisr: 40000000
[   29.593496]   current = 0xc0000000085b1f00
[   29.596286]   paca    = 0xc00000003ffff680     irqmask: 0x03 
irq_happened: 0x01
[   29.602119]     pid   = 1524, comm = Xorg.wrap
[   29.605257] Linux version 6.12.0-rc1-2-powerpc64-smp 
(geeko@buildhost) (powerpc64-suse-linux-gcc (SUSE Linux) 7.5.0, GNU ld 
(GNU Binutils; devel:gcc / SLE-15) 2.43.1.20240828-150300.536) #1 SMP 
Fri Oct  4 08:55:45 CEST 2024
[   29.623892] enter ? for help
[   29.625487] [c000000006f97960] c000000000d28dd8 
.radeon_bo_unref+0x58/0x90
[   29.631083] [c000000006f979e0] c000000000e287b0 
.radeon_vm_fini+0x260/0x330
[   29.636765] [c000000006f97aa0] c000000000d07c94 
.radeon_driver_postclose_kms+0x1a4/0x1f0
[   29.643579] [c000000006f97b30] c000000000c9374c 
.drm_file_free+0x28c/0x300
[   29.649174] [c000000006f97be0] c000000000c93900 .drm_release+0x90/0x170
[   29.654508] [c000000006f97c70] c000000000304790 .__fput+0x120/0x3b0
[   29.659495] [c000000006f97d10] c0000000002fe0fc .__se_sys_close+0x4c/0xc0
[   29.665004] [c000000006f97d90] c000000000025bac 
.system_call_exception+0x22c/0x260
[   29.671295] [c000000006f97e10] c00000000000b554 
system_call_common+0xf4/0x258
[   29.677164] --- Exception: c00 (System Call) at 00000000006b2b48
[   29.681876] SP (fff4b3d0) is in userspace
[   29.684577] 1:mon>  <no input ...>
[   31.666727] Oops: Kernel access of bad area, sig: 11 [#1]
[   31.670829] BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 A-EON Amigaone X1000
[   31.676144] Modules linked in: snd_hda_codec_idt 
snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg 
snd_hda_codec snd_hda_core dm_mod
[   31.688703] CPU: 1 UID: 0 PID: 1524 Comm: Xorg.wrap Not tainted 
6.12.0-rc1-2-powerpc64-smp #1
[   31.695932] Hardware name: pasemi,nemo PA6T 0x900102 A-EON Amigaone X1000
[   31.701417] NIP:  c000000000c973c0 LR: c000000000d28dd8 CTR: 
c000000000d07af0
[   31.707250] REGS: c000000006f97640 TRAP: 0300   Not tainted 
(6.12.0-rc1-2-powerpc64-smp)
[   31.714128] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI> CR: 
28002222  XER: 20000000
[   31.720773] DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0
                GPR00: c000000000d28dd8 c000000006f978e0 
c00000000207a800 c0000000085f5468
                GPR04: 0000000000000b9b 0000000000000b9a 
0000000179779000 c0000000086a4b00
                GPR08: 0000000000000000 0000000000000000 
0000000000000001 0000000000000000
                GPR12: 0000000048002202 c00000003ffff680 
0000000000000000 0000000000000000
                GPR16: 00000000006e3318 0000000000000001 
00000000006e289c 0000000000000063
                GPR20: 00000000c04064a0 00000000007f0088 
00000000fff4c734 00000000007d165c
                GPR24: 00000000007d1668 c000000024b6a220 
c000000003588000 c000000024b6a200
                GPR28: c000000003b3cc00 c000000024b6a248 
c000000002d48820 c0000000085f5468
[   31.778903] NIP [c000000000c973c0] .drm_gem_object_free+0x20/0x70
[   31.783701] LR [c000000000d28dd8] .radeon_bo_unref+0x58/0x90
[   31.788062] Call Trace:
[   31.789199] [c000000006f978e0] [c000000006f97990] 0xc000000006f97990 
(unreliable)
[   31.795388] [c000000006f97960] [c000000000d28dd8] 
.radeon_bo_unref+0x58/0x90
[   31.801142] [c000000006f979e0] [c000000000e287b0] 
.radeon_vm_fini+0x260/0x330
[   31.806982] [c000000006f97aa0] [c000000000d07c94] 
.radeon_driver_postclose_kms+0x1a4/0x1f0
[   31.813954] [c000000006f97b30] [c000000000c9374c] 
.drm_file_free+0x28c/0x300
[   31.819707] [c000000006f97be0] [c000000000c93900] .drm_release+0x90/0x170
[   31.825197] [c000000006f97c70] [c000000000304790] .__fput+0x120/0x3b0
[   31.830342] [c000000006f97d10] [c0000000002fe0fc] 
.__se_sys_close+0x4c/0xc0
[   31.836010] [c000000006f97d90] [c000000000025bac] 
.system_call_exception+0x22c/0x260
[   31.842460] [c000000006f97e10] [c00000000000b554] 
system_call_common+0xf4/0x258
[   31.848476] --- interrupt: c00 at 0x6b2b48
[   31.851267] NIP:  00000000006b2b48 LR: 00000000006b2b20 CTR: 
0000000000000000
[   31.857101] REGS: c000000006f97e80 TRAP: 0c00   Not tainted 
(6.12.0-rc1-2-powerpc64-smp)
[   31.863978] MSR:  100000000200f032 <HV,VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 
28002400  XER: 00000000
[   31.871235] IRQMASK: 0
                GPR00: 0000000000000006 00000000fff4b3d0 
00000000f7b7f3a0 0000000000000003
                GPR04: 0000000000000000 0000000000000000 
0000000000000000 0000000000000000
                GPR08: 0000000000000000 0000000000000000 
0000000000000000 0000000000000000
                GPR12: 0000000000000000 00000000007efff4 
0000000000000000 0000000000000000
                GPR16: 00000000006e3318 0000000000000001 
00000000006e289c 0000000000000063
                GPR20: 00000000c04064a0 00000000007f0088 
00000000fff4c734 00000000007d165c
                GPR24: 00000000007d1668 00000000fff4b400 
0000000000000001 0000000000000001
                GPR28: 00000000fff4b46c 0000000000000000 
00000000007bfff4 0000000000000003
[   31.926053] NIP [00000000006b2b48] 0x6b2b48
[   31.928930] LR [00000000006b2b20] 0x6b2b20
[   31.931720] --- interrupt: c00
[   31.933466] Code: ebe1fff8 7c0803a6 4e800020 60000000 7c0802a6 
fbe1fff8 7c7f1b78 f8010010 f821ff81 60000000 60000000 e93f0140 
<e9290000> 7d2a0074 794ad182 0b0a0000
[   31.946913] ---[ end trace 0000000000000000 ]---


--------------tY0VRno1MNlN7GzKInVNVfoW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 03 October 2024 at 08:06 am, Wu Hoi
      Pok wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241003060650.18454-1-wuhoipok@gmail.com">
      <pre wrap="" class="moz-quote-pre">This is a fix patch not tested yet,
for a bug I introduce in previous rework of radeon driver.
The bug is a null dereference in 'aux.dev', which is the
'device' not registered, resulting in kernel panic. By having
'late_register', the connector should be registered after
'drm_dev_register' automatically.

Please help testing thank you.
</pre>
    </blockquote>
    Hello Wu Hoi Pok,<br>
    <br>
    Thanks a lot for your patch. Unfortunately there is a new issue
    after patching the RC1. Could you please fix the following issue?<br>
    <br>
    Thanks,<br>
    Christian<br>
    <br>
    ---<br>
    <br>
    Linux fienix 6.12.0-rc1-2-powerpc64-smp #1 SMP Fri Oct  4 08:55:45
    CEST 2024 ppc64 GNU/Linux<br>
    <br>
    [   29.167145] systemd[1]: Sent message type=signal sender=n/a
    destination=n/a
    path=/org/freedesktop/systemd1/unit/NetworkManager_2eservice
    interface=org.freedesktop.DBus.Properties member=PropertiesChanged
    cookie=103 reply_cookie=0 signature=sa{sv}as error-name=n/a
    error-message=n/a<br>
    [   29.542140] systemd-journald[1301]: Successfully sent stream file
    descriptor to service manager.<br>
    [   29.561863] BUG: Kernel NULL pointer dereference on read at
    0x00000000<br>
    [   29.567156] Faulting instruction address: 0xc000000000c973c0<br>
    [   29.571574] cpu 0x1: Vector: 300 (Data Access) at
    [c000000006f97640]<br>
    [   29.576637]     pc: c000000000c973c0:
    .drm_gem_object_free+0x20/0x70<br>
    [   29.581708]     lr: c000000000d28dd8: .radeon_bo_unref+0x58/0x90<br>
    [   29.586428]     sp: c000000006f978e0<br>
    [   29.588695]    msr: 9000000000009032<br>
    [   29.590962]    dar: 0<br>
    [   29.591925]  dsisr: 40000000<br>
    [   29.593496]   current = 0xc0000000085b1f00<br>
    [   29.596286]   paca    = 0xc00000003ffff680     irqmask: 0x03    
    irq_happened: 0x01<br>
    [   29.602119]     pid   = 1524, comm = Xorg.wrap<br>
    [   29.605257] Linux version 6.12.0-rc1-2-powerpc64-smp
    (geeko@buildhost) (powerpc64-suse-linux-gcc (SUSE Linux) 7.5.0, GNU
    ld (GNU Binutils; devel:gcc / SLE-15) 2.43.1.20240828-150300.536) #1
    SMP Fri Oct  4 08:55:45 CEST 2024<br>
    [   29.623892] enter ? for help<br>
    [   29.625487] [c000000006f97960] c000000000d28dd8
    .radeon_bo_unref+0x58/0x90<br>
    [   29.631083] [c000000006f979e0] c000000000e287b0
    .radeon_vm_fini+0x260/0x330<br>
    [   29.636765] [c000000006f97aa0] c000000000d07c94
    .radeon_driver_postclose_kms+0x1a4/0x1f0<br>
    [   29.643579] [c000000006f97b30] c000000000c9374c
    .drm_file_free+0x28c/0x300<br>
    [   29.649174] [c000000006f97be0] c000000000c93900
    .drm_release+0x90/0x170<br>
    [   29.654508] [c000000006f97c70] c000000000304790
    .__fput+0x120/0x3b0<br>
    [   29.659495] [c000000006f97d10] c0000000002fe0fc
    .__se_sys_close+0x4c/0xc0<br>
    [   29.665004] [c000000006f97d90] c000000000025bac
    .system_call_exception+0x22c/0x260<br>
    [   29.671295] [c000000006f97e10] c00000000000b554
    system_call_common+0xf4/0x258<br>
    [   29.677164] --- Exception: c00 (System Call) at 00000000006b2b48<br>
    [   29.681876] SP (fff4b3d0) is in userspace<br>
    [   29.684577] 1:mon&gt;  &lt;no input ...&gt;<br>
    [   31.666727] Oops: Kernel access of bad area, sig: 11 [#1]<br>
    [   31.670829] BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 A-EON Amigaone
    X1000<br>
    [   31.676144] Modules linked in: snd_hda_codec_idt
    snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel
    snd_intel_dspcfg snd_hda_codec snd_hda_core dm_mod<br>
    [   31.688703] CPU: 1 UID: 0 PID: 1524 Comm: Xorg.wrap Not tainted
    6.12.0-rc1-2-powerpc64-smp #1<br>
    [   31.695932] Hardware name: pasemi,nemo PA6T 0x900102 A-EON
    Amigaone X1000<br>
    [   31.701417] NIP:  c000000000c973c0 LR: c000000000d28dd8 CTR:
    c000000000d07af0<br>
    [   31.707250] REGS: c000000006f97640 TRAP: 0300   Not tainted 
    (6.12.0-rc1-2-powerpc64-smp)<br>
    [   31.714128] MSR:  9000000000009032 &lt;SF,HV,EE,ME,IR,DR,RI&gt; 
    CR: 28002222  XER: 20000000<br>
    [   31.720773] DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0<br>
                   GPR00: c000000000d28dd8 c000000006f978e0
    c00000000207a800 c0000000085f5468<br>
                   GPR04: 0000000000000b9b 0000000000000b9a
    0000000179779000 c0000000086a4b00<br>
                   GPR08: 0000000000000000 0000000000000000
    0000000000000001 0000000000000000<br>
                   GPR12: 0000000048002202 c00000003ffff680
    0000000000000000 0000000000000000<br>
                   GPR16: 00000000006e3318 0000000000000001
    00000000006e289c 0000000000000063<br>
                   GPR20: 00000000c04064a0 00000000007f0088
    00000000fff4c734 00000000007d165c<br>
                   GPR24: 00000000007d1668 c000000024b6a220
    c000000003588000 c000000024b6a200<br>
                   GPR28: c000000003b3cc00 c000000024b6a248
    c000000002d48820 c0000000085f5468<br>
    [   31.778903] NIP [c000000000c973c0] .drm_gem_object_free+0x20/0x70<br>
    [   31.783701] LR [c000000000d28dd8] .radeon_bo_unref+0x58/0x90<br>
    [   31.788062] Call Trace:<br>
    [   31.789199] [c000000006f978e0] [c000000006f97990]
    0xc000000006f97990 (unreliable)<br>
    [   31.795388] [c000000006f97960] [c000000000d28dd8]
    .radeon_bo_unref+0x58/0x90<br>
    [   31.801142] [c000000006f979e0] [c000000000e287b0]
    .radeon_vm_fini+0x260/0x330<br>
    [   31.806982] [c000000006f97aa0] [c000000000d07c94]
    .radeon_driver_postclose_kms+0x1a4/0x1f0<br>
    [   31.813954] [c000000006f97b30] [c000000000c9374c]
    .drm_file_free+0x28c/0x300<br>
    [   31.819707] [c000000006f97be0] [c000000000c93900]
    .drm_release+0x90/0x170<br>
    [   31.825197] [c000000006f97c70] [c000000000304790]
    .__fput+0x120/0x3b0<br>
    [   31.830342] [c000000006f97d10] [c0000000002fe0fc]
    .__se_sys_close+0x4c/0xc0<br>
    [   31.836010] [c000000006f97d90] [c000000000025bac]
    .system_call_exception+0x22c/0x260<br>
    [   31.842460] [c000000006f97e10] [c00000000000b554]
    system_call_common+0xf4/0x258<br>
    [   31.848476] --- interrupt: c00 at 0x6b2b48<br>
    [   31.851267] NIP:  00000000006b2b48 LR: 00000000006b2b20 CTR:
    0000000000000000<br>
    [   31.857101] REGS: c000000006f97e80 TRAP: 0c00   Not tainted 
    (6.12.0-rc1-2-powerpc64-smp)<br>
    [   31.863978] MSR:  100000000200f032
    &lt;HV,VEC,EE,PR,FP,ME,IR,DR,RI&gt;  CR: 28002400  XER: 00000000<br>
    [   31.871235] IRQMASK: 0<br>
                   GPR00: 0000000000000006 00000000fff4b3d0
    00000000f7b7f3a0 0000000000000003<br>
                   GPR04: 0000000000000000 0000000000000000
    0000000000000000 0000000000000000<br>
                   GPR08: 0000000000000000 0000000000000000
    0000000000000000 0000000000000000<br>
                   GPR12: 0000000000000000 00000000007efff4
    0000000000000000 0000000000000000<br>
                   GPR16: 00000000006e3318 0000000000000001
    00000000006e289c 0000000000000063<br>
                   GPR20: 00000000c04064a0 00000000007f0088
    00000000fff4c734 00000000007d165c<br>
                   GPR24: 00000000007d1668 00000000fff4b400
    0000000000000001 0000000000000001<br>
                   GPR28: 00000000fff4b46c 0000000000000000
    00000000007bfff4 0000000000000003<br>
    [   31.926053] NIP [00000000006b2b48] 0x6b2b48<br>
    [   31.928930] LR [00000000006b2b20] 0x6b2b20<br>
    [   31.931720] --- interrupt: c00<br>
    [   31.933466] Code: ebe1fff8 7c0803a6 4e800020 60000000 7c0802a6
    fbe1fff8 7c7f1b78 f8010010 f821ff81 60000000 60000000 e93f0140
    &lt;e9290000&gt; 7d2a0074 794ad182 0b0a0000<br>
    [   31.946913] ---[ end trace 0000000000000000 ]---<br>
    <br>
    <br>
  </body>
</html>

--------------tY0VRno1MNlN7GzKInVNVfoW--
