Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D20C2141D8
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 00:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D880E6E388;
	Fri,  3 Jul 2020 22:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.default.ilande.uk0.bigv.io (mail.ilande.co.uk
 [IPv6:2001:41c9:1:41f::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A8C6E388
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 22:55:07 +0000 (UTC)
Received: from host86-182-221-233.range86-182.btcentralplus.com
 ([86.182.221.233] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jrUaG-0006jL-Vg; Fri, 03 Jul 2020 23:55:11 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: dri-devel@lists.freedesktop.org
References: <671ea432-7e2b-ab37-225e-fd32aef9a3e3@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 mQENBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAG0ME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPokB
 OAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63LkBDQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABiQEfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Message-ID: <5989d360-619b-6b96-8ce0-e6bd01579c30@ilande.co.uk>
Date: Fri, 3 Jul 2020 23:54:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <671ea432-7e2b-ab37-225e-fd32aef9a3e3@ilande.co.uk>
Content-Language: en-US
X-SA-Exim-Connect-IP: 86.182.221.233
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 mail.default.ilande.uk0.bigv.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=ham autolearn_force=no
 version=3.4.2
Subject: Re: Panic booting qemu-system-sparc64 with bochs_drm
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/07/2020 22:57, Mark Cave-Ayland wrote:

> Hi all,
> 
> I've been receiving reports that newer sparc64 kernels have started to panic on boot
> under qemu-system-sparc64 with bochs_drm enabled which I was able to confirm locally
> building git master:
> 
> 
> [    9.007161] [drm] Found bochs VGA, ID 0xb0c5.
> [    9.007840] [drm] Framebuffer size 16384 kB @ 0x1ff22000000, mmio @ 0x1ff23000000.
> [    9.012567] [TTM] Zone  kernel: Available graphics memory: 51496 KiB
> [    9.013551] [TTM] Initializing pool allocator
> [    9.032757] [drm] Found EDID data blob.
> [    9.061904] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:01:02.0 on minor 0
> [    9.336819] Unable to handle kernel paging request at virtual address 000001ff221d0000
> [    9.337177] tsk->{mm,active_mm}->context = 0000000000000000
> [    9.337283] tsk->{mm,active_mm}->pgd = fffff80000402000
> [    9.337372]               \|/ ____ \|/
> [    9.337372]               "@'/ .. \`@"
> [    9.337372]               /_| \__/ |_\
> [    9.337372]                  \__U_/
> [    9.337468] kworker/0:0(5): Oops [#1]
> [    9.339359] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.8.0-rc3+ #55
> [    9.341360] Workqueue: events drm_fb_helper_dirty_work
> [    9.341775] TSTATE: 0000000080001605 TPC: 000000000077441c TNPC: 0000000000774420
> Y: 00000000    Not tainted
> [    9.341894] TPC: <memcpy+0x121c/0x13c0>
> [    9.342015] g0: 0000000000000000 g1: 0000000000000000 g2: 0000000000000000 g3:
> fffff800043d2c00
> [    9.342094] g4: fffff8000410eac0 g5: fffff800064cc000 g6: fffff80004124000 g7:
> 0000000000000010
> [    9.342173] o0: 000001ff221d0000 o1: 0000000100220000 o2: 0000000000000000 o3:
> 000001fe21fb0000
> [    9.342254] o4: 000001ff221d0000 o5: 0000000000000000 sp: fffff800041273d1 ret_pc:
> 0000000000805b18
> [    9.342325] RPC: <drm_fb_helper_dirty_work+0xf8/0x180>
> [    9.342591] l0: fffff80007819cc0 l1: fffff800043df8cc l2: 0000000001356200 l3:
> fffff800064cc000
> [    9.342670] l4: fffff80004004200 l5: 0000000000000000 l6: 0000000000000025 l7:
> fffff80004002500
> [    9.342750] i0: fffff800043df8d0 i1: fffff800040106b0 i2: 0000000000000020 i3:
> fffff800043e5500
> [    9.342829] i4: 00000000000001d1 i5: 0000000100220000 i6: fffff80004127491 i7:
> 0000000000481fec
> [    9.342960] I7: <process_one_work+0x18c/0x540>
> [    9.343308] Call Trace:
> [    9.344077] [<0000000000481fec>] process_one_work+0x18c/0x540
> [    9.344267] [<00000000004824c4>] worker_thread+0x124/0x580
> [    9.344310] [<0000000000489758>] kthread+0xf8/0x120
> [    9.344357] [<00000000004060a4>] ret_from_fork+0x1c/0x2c
> [    9.344714] [<0000000000000000>] 0x0
> 
> 
> The error "Unable to handle kernel paging request at virtual address
> 000001ff221d0000" is caused by trying to access the framebuffer using a virtual
> address, rather than using IO accessors which access the framebuffer correctly using
> SPARC ASI_PHYS (physical) loads and stores. In some ways this is similar to the bug I
> reported a couple of years back at
> https://lists.freedesktop.org/archives/dri-devel/2017-June/145793.html which was
> fixed with https://lists.freedesktop.org/archives/dri-devel/2017-July/145935.html.
> 
> According to git bisect the regression is introduced by the following commit:
> 
> $ git bisect bad
> 7a0483ac4ffca4998945c159b28afdde8353cc84 is the first bad commit
> commit 7a0483ac4ffca4998945c159b28afdde8353cc84
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Fri Jan 11 06:37:50 2019 +0100
> 
>     drm/bochs: switch to generic drm fbdev emulation
> 
>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>     Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>     Link:
> http://patchwork.freedesktop.org/patch/msgid/20190111053752.4004-15-kraxel@redhat.com
> 
> :040000 040000 1917943277034f620af03ac1a2fa5db48b7b224c
> 6d7a3c316a68efbffd398d6c2b7eebefb47bc92d M      drivers
> 
> 
> The commit following this one at
> https://patchwork.freedesktop.org/patch/276488/?series=54269&rev=4 removes
> bochsfb_ops and the cfb helpers which was the original fix introduced by my second
> patch above, so I'm unsure how to approach fixing this with the switch to
> drm_fbdev_generic_setup().
> 
> Can anyone point me in the right direction?

Just following up from the original thread on debian-sparc, Sam asked about providing
some instructions to allow others to reproduce the error which are included below:


1) Building QEMU

I'm currently using QEMU git master configured just to build qemu-system-sparc64 as
follows:

./configure --target-list=sparc64-softmmu
make && make install

(Note: the latest release QEMU 5.0 has a regression in OpenBIOS which prevents
-kernel from working correctly. If you install QEMU 5.0 from a package then you can
grab the updated openbios-sparc64 directly from git at
https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios;h=a835f94751ef7d2e2648ce7c79eac1d6fea9b83c;hb=5f42c3375d45108cf14f50ac8ba57c2865e75e9c
to replace the installed one)


2) Build the kernel

This was done using Debian Buster on amd64 and its pre-packaged sparc64
cross-compilers. With those installed via "aptitude install gcc-sparc64-linux-gnu" I
did the following on a clone of Linux git master:

make ARCH=sparc64 CROSS_COMPILE=sparc64-linux-gnu- O=../rel-sparc64/ sparc64_defconfig
make ARCH=sparc64 CROSS_COMPILE=sparc64-linux-gnu- O=../rel-sparc64/ menuconfig

(Here go to Device Drivers -> Graphics support and enable both "Direct Rendering
Manager" and "DRM Support for bochs dispi vga interface (qemu stdvga)")

Then build the kernel itself:

make ARCH=sparc64 CROSS_COMPILE=sparc64-linux-gnu- O=../rel-sparc64/


3) Boot the kernel in qemu-system-sparc64

This can be done with the following command line:

qemu-system-sparc64 -kernel /path/to/rel-sparc64/vmlinuz

The problem is visible as the screen going black after the bootconsole has finished.
If you want to see the actual panic from my original email then add -nographic onto
the command line above which redirects the console onto a serial port on stdio.


ATB,

Mark.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
