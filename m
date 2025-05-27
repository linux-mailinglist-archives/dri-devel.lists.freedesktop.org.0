Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C34AC643B
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 10:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2C010E5A5;
	Wed, 28 May 2025 08:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.dnamail.fi (unknown [83.102.40.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F096410E0F0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 22:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp.dnamail.fi (Postfix) with ESMTP id 324B72113FDF;
 Wed, 28 May 2025 01:47:23 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id hXHhf-1--5fB; Wed, 28 May 2025 01:47:22 +0300 (EEST)
Received: from [192.168.101.100] (87-92-243-15.rev.dnainternet.fi
 [87.92.243.15])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: oak@dnamail.internal)
 by smtp.dnamail.fi (Postfix) with ESMTPSA id 682012113E17;
 Wed, 28 May 2025 01:47:21 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi 682012113E17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
 s=2025-03; t=1748386042;
 bh=oD9KBFwxMpJ1EycNEuX8OdyUkAEKmBMy0j5QQHSSNyk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DguqUK3UtWLkLxO+jiNPt2jnyk1sBcbUjLDB3mxHjDUbXFZLr8xP2G0y+pnh9Z9uG
 mFCo02oNhv9gRR2/YGGeO/zwadFePni1SHJ1ALnhuP9DF9OUTxg+kdgZiE2D438aVE
 8WHpSgwgl3OdLdD+EqUvKGa3rubsEtCxqdeVobq6AmNovsVfchgu+/gFcxn5IiaOPF
 rz3MFGZaqcOfI9WchgsAz5EpUHGay4GgCKtaJG9vrh5EWoWyTZYYha3JjulK/kwEdo
 jjj6hwfDJ7lJzULtoYwRutopqYkB10BLCryNT/rqHsGtpiqIleWtdJSaRuyPiHK/mL
 St/PKP8huA4SQ==
Content-Type: multipart/mixed; boundary="------------kw801OFaAB23Yin0ZBzNbdZv"
Message-ID: <72078ec9-25a0-42d5-b7da-b0a974033f86@helsinkinet.fi>
Date: Wed, 28 May 2025 01:47:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC 0/3] Atari DRM driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Michael Schmitz <schmitzmic@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-m68k@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <cover.1669406380.git.geert@linux-m68k.org>
 <a9883a81-d909-09c5-708b-d598e030380e@physik.fu-berlin.de>
 <CAMuHMdWHUnWBN7ddBow+fqmt8W--9wFe5x_YMeRg7GQ=BNAL2Q@mail.gmail.com>
 <74946b31-6166-44b0-b2a7-b0633f014b60@helsinkinet.fi>
 <CAMuHMdXSWiM_xofyfgpoc0Jj8a_PwRR_tFe79t8=-X85-7WZug@mail.gmail.com>
 <beed53f4-b0d6-4d1d-b5ec-2694d2b5d47a@helsinkinet.fi>
 <CAMuHMdUSADF51tBbGV=_nsxqyXgfNZcgDNGxuZ4F+tvYs9Q2aw@mail.gmail.com>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <CAMuHMdUSADF51tBbGV=_nsxqyXgfNZcgDNGxuZ4F+tvYs9Q2aw@mail.gmail.com>
X-Mailman-Approved-At: Wed, 28 May 2025 08:22:32 +0000
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
--------------kw801OFaAB23Yin0ZBzNbdZv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 25.5.2025 15.05, Geert Uytterhoeven wrote:
> On Thu, 22 May 2025 at 00:56, Eero Tamminen <oak@helsinkinet.fi> wrote:
>> On 21.5.2025 10.06, Geert Uytterhoeven wrote:
>>> I do keep it up-to-date locally, so I could provide these changes,
>>> if you are interested.
>>
>> Yes, please!   (see below)
> 
> Sorry for taking so long:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=atari-drm-wip-rebasing

Thanks!

I did boot testing on Hatari emulator with a minimal kernel config 
having atari_drm enabled, atafb disabled, FB & boot logo enabled.

Under Falcon emulation:
- RGB/VGA => works fine
- Mono monitor => panic
   "Kernel panic - not syncing: can't set default video mode"

Under TT emulation:
- RGB/VGA => boots, but console is black[1] (palette issue?)
- Mono monitor => looks OKish[2], but has constant warnings:
-----------------------------------
WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_atomic_helper.c:1720 
drm_atomic_helper_wait_for_vblanks+0x1a0/0x1ee
[CRTC:35:crtc-0] vblank wait timed out
-----------------------------------

Under 030 ST/STe emulation:
- RGB/VGA => boots, but console is black (palette issue?)
- Mono monitor => looks OK, but has constant slowpath warnings with:
   "[CRTC:35:crtc-0] vblank wait timed out"

=> Any advice on the issues?

[1] Black when booted with (Hatari) LILO, all white when booted with 
"bootstra.prg", meaning from TOS.

[2] Mono colors are black on white instead of vice verse, e.g. boot logo 
colors are obviously inversed.

Note: the functional differences between ST, STE, TT and Falcon are all 
accurately emulated in Hatari.


	- Eero

PS. I also profiled where most of time goes from "atari-drm" probing, 
until boot reaches user space.  On a minimal -Os built kernel, running 
on (emulated) 32Mhz 030 Falcon, in the default 640x480@4 resolution:
----------------------------------------------------------------
Time spent in profile = 15.29712s.
...
Used cycles:
   22.37%  22.42%  25.35%   _transp
   19.15%  19.19%  46.82%   atari_drm_fb_blit_rect.isra.0
    8.09%   8.09%  13.80%   sys_copyarea
    3.94%   3.95%   6.23%   sys_imageblit
    3.69%   3.69%   3.69%   fb_copy_offset.isra.0
    2.12%   2.13%   2.41%   atari_scsi_falcon_reg_read
    2.03%   2.03%   2.03%   fb_address_forward
    1.85%   1.85%  17.98%   fbcon_redraw_blit.constprop.0
    1.81%   1.81%   2.04%   atari_keyb_init
    1.78%   1.78%   1.98%   fb_reverse_long
    1.58%   1.58%   1.90%   arch_cpu_idle
    1.05%                   memcpy
    0.95%                   memset
...
----------------------------------------------------------------

=> atari-drm blitting takes half the time during boot.

Building kernel with -O2, changes above rather radically, both 
time-wise, and where that time goes:
----------------------------------------------------------------
Time spent in profile = 6.54049s.
...
Used cycles:
   17.61%  17.61%  17.61%   sys_copyarea
   11.18%  11.18%  13.11%   arch_cpu_idle
    7.53%   7.55%   8.45%   atari_drm_fb_blit_rect.isra.0
    4.26%   4.27%   4.76%   atari_keyb_init
    2.70%   2.70%   2.93%   atari_scsi_falcon_reg_read
    2.45%   2.45%  23.81%   fbcon_redraw_blit.constprop.0
    2.35%   2.35%   2.48%   sys_imageblit
    2.12%   2.12%   5.89%   atari_floppy_init
    1.97%                   memset
    1.31%                   memcpy
...
Instruction cache misses:
   27.14%  27.14%  27.14%   sys_copyarea
    3.77%   3.77%   4.05%   atari_scsi_falcon_reg_read
...
Data cache hits:
   63.55%  63.55%  63.67%   atari_keyb_init
    7.61%   7.62%   7.84%   atari_drm_fb_blit_rect.isra.0
    3.86%   3.86%   3.86%   sys_copyarea <= not much hits for copying
...
----------------------------------------------------------------

However, -O2 build has the downside that the resulting kernel Oopses 
once it reaches user-space, if 030 data cache emulation is enabled:
----------------------------------------------------------------
Run /init as init process
...
Instruction fault at 0x0041a256
BAD KERNEL BUSERR
Oops: 00000000
PC: [<0041a256>] __generic_copy_from_user+0x1e/0x46
SR: 2200  SP: (ptrval)  a2: 011fe590
d0: 00000005    d1: 00000000    d2: 00000003    d3: 00000003
d4: 00000008    d5: 00000000    a0: eff70720    a1: 01225f9c
Process init (pid: 32, task=(ptrval))
Frame format=B ssw=5066 isc=5380 isb=66f6 daddr=eff7071c dobuf=00000000
baddr=eff7071c dibuf=eff7071c ver=0
Stack from 01225f78:
         ...
Call Trace: [<000409b0>] sys_rt_sigaction+0x32/0xc8
  [<00005062>] req_need_defer+0x2a/0x3a
  [<0000a4ca>] syscall+0x8/0xc

Code: 7403 c282 206e 000c 226e 0008 4a80 670a <0e98> 2000 22c2 5380 66f6 
0801 0001 6706 0e58 2000 32c2 0801 0000 6706 0e18 2000
Disabling lock debugging due to kernel taint
Instruction fault at 0x00088ada
BAD KERNEL BUSERR
Oops: 00000000
PC: [<00088ada>] exit_robust_list+0x12/0xee
SR: 2200  SP: (ptrval)  a2: 011fe590
d0: 00000000    d1: 00000000    d2: 011fe94e    d3: 000000ff
d4: 00000000    d5: 00000000    a0: 011fe590    a1: 011e2b90
Process init (pid: 32, task=(ptrval))
Frame format=B ssw=5066 isc=660a isb=0eab daddr=801a206c dobuf=011fe94e
baddr=801a206c dibuf=801a206c ver=0
Stack from 01225dc8:
         ....
Call Trace: [<00003730>] _printk+0x0/0x16
  [<000896ce>] futex_exit_release+0x9e/0xb8
  [<00030186>] exit_mm_release+0x12/0x28
  [<00034612>] do_exit+0x178/0x96e
  [<00002200>] show_stack+0xce/0xf4
  [<000691da>] vprintk+0x12/0x16
  [<00034e84>] make_task_dead+0x7c/0x172
  [<00005066>] req_need_defer+0x2e/0x3a
  [<00003730>] _printk+0x0/0x16
  [<0000d514>] die_if_kernel+0x0/0x22
  [<0000d536>] trap_c+0x0/0x24c
  [<0000ddaa>] buserr_c+0x628/0x756
  [<0000a3f0>] buserr+0x20/0x28
  [<00005066>] req_need_defer+0x2e/0x3a
  [<0004097e>] sys_rt_sigaction+0x0/0xc8
  [<00020007>] _FP_CALL_TOP+0x48e5/0xd512
  [<00002000>] _start+0x0/0x6
  [<000409b0>] sys_rt_sigaction+0x32/0xc8
  [<00005062>] req_need_defer+0x2a/0x3a
  [<0000a4ca>] syscall+0x8/0xc
----------------------------------------------------------------

My GCC is 12.2 in Debian bookworm, and "/init" is shell script run with 
static Debian Busybox, to mount virtual file systems:
https://github.com/hatari/hatari/blob/main/tools/linux/init.sh

On an small system image built and used as documented here:
https://github.com/hatari/hatari/blob/main/doc/m68k-linux.txt

--------------kw801OFaAB23Yin0ZBzNbdZv
Content-Type: image/png; name="atari-drm-callgraph.png"
Content-Disposition: attachment; filename="atari-drm-callgraph.png"
Content-Transfer-Encoding: base64

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
af2sahcbLrnRbOF1R7Pbf3anKStk+6rnhYe3ncm8c0PsORhskM9Dd2b2sPXWVwg+AsQ97Ezm
Z/fZa99XrOdrTmTXT6f2USBKux275z3QGvCwpdnf+wrBxwFK0kkUBH/tmTdqHHSWobfv9XqI
+mCFvX+Sl6XYgcUWVNvP9tNyfFQgn+ZT7StlC/NGBgZFoIO+QvCRgZSClj0aR4y4RpoS668P
ej00fTAGmVw8JVhwRYaBT4mUg/5qlY8QBI4mpjnaBkj2aOn7oj5KuO5M5nG/djsQ7Af03VCv
B4UC/38tOmp4aif0IQAAABl0RVh0Q29tbWVudABDcmVhdGVkIHdpdGggR0lNUFeBDhcAAAAl
dEVYdGRhdGU6Y3JlYXRlADIwMjUtMDUtMjdUMjE6Mjg6MDcrMDA6MDDivq6pAAAAJXRFWHRk
YXRlOm1vZGlmeQAyMDI1LTA1LTI3VDIxOjI4OjA3KzAwOjAwk+MWFQAAABt0RVh0aWNjOmNv
cHlyaWdodABQdWJsaWMgRG9tYWlutpExWwAAACJ0RVh0aWNjOmRlc2NyaXB0aW9uAEdJTVAg
YnVpbHQtaW4gc1JHQkxnQRMAAAAVdEVYdGljYzptYW51ZmFjdHVyZXIAR0lNUEyekMoAAAAO
dEVYdGljYzptb2RlbABzUkdCW2BJQwAAAABJRU5ErkJggg==

--------------kw801OFaAB23Yin0ZBzNbdZv--
