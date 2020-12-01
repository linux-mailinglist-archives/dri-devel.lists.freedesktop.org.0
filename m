Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71422CA025
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB1F89D56;
	Tue,  1 Dec 2020 10:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A1889993
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606819480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ih62wEjG7uGs1wPOPcFS8Znygpdg31DCXtp5f2jBL0g=;
 b=R/Fq/btcJEhMIL3Vv1LClqT3rbcY1lwYZwQ7JNOp6USzTBknMUZafbWb2yuzmbYB4a5KIe
 KVikm7CMEK3bpPbCOSqpkHsj3rnZJ41tYRM7MOoXV50LfLFdQ4IJcIBFLuhKs7EA4Bw0sz
 ZrJWIi7XzUQ50yiLK/gaaNEHG52x5ig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-5nwtMuJAPaurPokI9y_Xwg-1; Tue, 01 Dec 2020 05:44:36 -0500
X-MC-Unique: 5nwtMuJAPaurPokI9y_Xwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E89E18030BA;
 Tue,  1 Dec 2020 10:44:34 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDE4110013C1;
 Tue,  1 Dec 2020 10:44:33 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 0B1AiXQM032273; Tue, 1 Dec 2020 05:44:33 -0500
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 0B1AiVRw032261; Tue, 1 Dec 2020 05:44:31 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 1 Dec 2020 05:44:31 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
In-Reply-To: <336a41ef-1e49-6799-1bfd-06fb42419fb8@suse.de>
Message-ID: <alpine.LRH.2.02.2012010500310.27495@file01.intranet.prod.int.rdu2.redhat.com>
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <336a41ef-1e49-6799-1bfd-06fb42419fb8@suse.de>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be, corbet@lwn.net,
 daniel.vetter@ffwll.ch, linux-doc@vger.kernel.org, bernie@plugable.com,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Tue, 1 Dec 2020, Thomas Zimmermann wrote:

> Hi
> 
> Am 30.11.20 um 15:31 schrieb Mikulas Patocka:
> > 
> > 
> > On Mon, 30 Nov 2020, Thomas Zimmermann wrote:
> > 
> > > Udlfb has been superseded by DRM's udl. The DRM driver is better by
> > > any means and actively maintained. Remove udlfb.
> > 
> > Hi
> > 
> > I am using udlfb and it's definitely better than the DRM driver. The DRM
> > driver will crash the kernel if you unplug the device while Xorg is
> > running. The framebuffer driver doesn't crash in this case. (I have a cat
> > and the cat sometimes unplugs cables and I don't want to reboot the system
> > because of it :-)
> 
> What's the exact STR here? Just open the /dev/fb* and pull the cable.
> 
> Do I need a cat? :)

When I run links -g on the DRM driver, it works at first, but after some 
unplug/plug I got this:

[  282.174963] general protection fault, probably for non-canonical address 0xdead0000000000f8: 0000 [#1] PREEMPT SMP
[  282.177439] CPU: 9 PID: 3377 Comm: links Not tainted 5.10.0-rc6 #1
[  282.178843] Hardware name: empty empty/S3992-E, BIOS 'V1.06   ' 06/09/2009
[  282.180325] RIP: 0010:fb_deferred_io_mkwrite+0x7c/0x100 [fb]
[  282.181865] Code: ff 83 e2 01 48 0f 44 c3 f0 48 0f ba 28 00 0f 82 83 00 00 00 49 8b 45 28 49 39 c4 48 8d 50 f8 74 5d 48 39 d3 74 1c 48 8b 4b 20 <48> 39 4a 20 77 4e 48 8b 42 08 4c 39 e0 48 8d 50 f8 74 41 48 39 d3
[  282.185341] RSP: 0000:ffff888348293de8 EFLAGS: 00010216
[  282.187166] RAX: dead000000000100 RBX: ffffea0004182980 RCX: 0000000000000000
[  282.189071] RDX: dead0000000000f8 RSI: 0000000000000801 RDI: ffffffffa045c048
[  282.191021] RBP: ffff888106af1c00 R08: 000000005fc6128b R09: 000000003626d41e
[  282.193006] R10: 0000000000000008 R11: ffff88a04fffc000 R12: ffffffffa045c068
[  282.195015] R13: ffffffffa045c040 R14: ffffffffa045c048 R15: fff000003fffffff
[  282.197077] FS:  00007fa64cbf4a00(0000) GS:ffff88a00fcc0000(0000) knlGS:0000000000000000
[  282.199293] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  282.201484] CR2: 00007fa63f272008 CR3: 000000105b2e0000 CR4: 00000000000006e0
[  282.203728] Call Trace:
[  282.205927]  do_page_mkwrite+0x56/0xc0
[  282.208125]  ? __do_fault+0x2d/0xe0
[  282.210257]  handle_mm_fault+0xafc/0x15e0
[  282.212350]  exc_page_fault+0x1ac/0x4a0
[  282.214408]  ? asm_exc_page_fault+0x8/0x30
[  282.216473]  asm_exc_page_fault+0x1e/0x30
[  282.218462] RIP: 0033:0x7fa64641f3a8
[  282.220469] Code: c3 48 81 fa 00 08 00 00 77 a8 48 83 fa 40 77 16 f3 0f 7f 07 f3 0f 7f 47 10 f3 0f 7f 44 17 f0 f3 0f 7f 44 17 e0 c3 48 8d 4f 40 <f3> 0f 7f 07 48 83 e1 c0 f3 0f 7f 44 17 f0 f3 0f 7f 47 10 f3 0f 7f
[  282.224730] RSP: 002b:00007ffe6da66ba8 EFLAGS: 00010206
[  282.226881] RAX: 00007fa63f272000 RBX: 00007fa64cbf4990 RCX: 00007fa63f272040
[  282.229094] RDX: 00000000003f4800 RSI: 0000000000000000 RDI: 00007fa63f272000
[  282.231339] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffffffffffff
[  282.233614] R10: 0000000000000008 R11: 0000000000000246 R12: 0000000000000f00
[  282.235927] R13: 00000000003f4800 R14: 00000000003f4800 R15: 0000000000000005
[  282.238262] Modules linked in: mousedev hid_generic usbhid hid iptable_mangle ipt_REJECT nf_reject_ipv4 tun xt_MASQUERADE iptable_nat xt_tcpudp iscsi_target_mod target_core_pscsi target_core_file ip6table_filter ip6_tables iptable_filter ip_tables x_tables af_packet target_core_mod cpufreq_powersave cpufreq_ondemand cpufreq_userspace configfs
cpufreq_conservative autofs4 binfmt_misc bridge stp llc snd_usb_audio snd_hwdep snd_usbmidi_lib snd_rawmidi snd_pcm snd_timer snd soundcore dmi_sysfs nf_nat_ftp nf_conntrack_ftp nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 lm85 hwmon_vid udl drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt fb_sys_fops cfbcopyarea fb font fbdev drm drm_panel_orientation_quirks backlight ipv6 ohci_pci amd64_edac_mod edac_mce_amd kvm_amd kvm irqbypass tg3 pcspkr ptp pps_core ehci_pci ohci_hcd ehci_hcd libphy usbcore k10temp hwmon e100 usb_common mii i2c_piix4 pata_serverworks rtc_cmos floppy acpi_cpufreq button processor spadfs evdev
[  282.257235] ---[ end trace d7968a41c1fbf717 ]---
[  282.267115] RIP: 0010:fb_deferred_io_mkwrite+0x7c/0x100 [fb]
[  282.270350] Code: ff 83 e2 01 48 0f 44 c3 f0 48 0f ba 28 00 0f 82 83 00 00 00 49 8b 45 28 49 39 c4 48 8d 50 f8 74 5d 48 39 d3 74 1c 48 8b 4b 20 <48> 39 4a 20 77 4e 48 8b 42 08 4c 39 e0 48 8d 50 f8 74 41 48 39 d3
[  282.276893] RSP: 0000:ffff888348293de8 EFLAGS: 00010216
[  282.280202] RAX: dead000000000100 RBX: ffffea0004182980 RCX: 0000000000000000
[  282.283564] RDX: dead0000000000f8 RSI: 0000000000000801 RDI: ffffffffa045c048
[  282.286965] RBP: ffff888106af1c00 R08: 000000005fc6128b R09: 000000003626d41e
[  282.290628] R10: 0000000000000008 R11: ffff88a04fffc000 R12: ffffffffa045c068
[  282.294039] R13: ffffffffa045c040 R14: ffffffffa045c048 R15: fff000003fffffff
[  282.297430] FS:  00007fa64cbf4a00(0000) GS:ffff88900fd00000(0000) knlGS:0000000000000000


When I try to run Xorg (from Debian 9) with the kernel 5.10-rc6, it 
doesn't work at all, I get this crash:

[   451.002] (EE) FBDEV(0): FBIOPUTCMAP: Device or resource busy
[   451.002] (==) FBDEV(0): DPMS enabled
[   451.002] (--) RandR disabled
[   451.008] (II) SELinux: Disabled on system
[   451.008] (II) AIGLX: Screen 0 is not DRI2 capable
[   451.008] (EE) AIGLX: reverting to software rendering
[   451.011] (II) IGLX: enabled GLX_MESA_copy_sub_buffer
[   451.011] (II) IGLX: Loaded and initialized swrast
[   451.011] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[   451.012] (II) modeset(G0): Damage tracking initialized
[   451.012] (EE)
[   451.012] (EE) Backtrace:
[   451.013] (EE) 0: /usr/lib/xorg/Xorg (xorg_backtrace+0x4a) [0x5611eb3b973a]
[   451.013] (EE) 1: /usr/lib/xorg/Xorg (0x5611eb200000+0x1bd4c9) [0x5611eb3bd4c9]
[   451.013] (EE) 2: /lib/x86_64-linux-gnu/libpthread.so.0 (0x7fd7dbb16000+0x110e0) [0x7fd7dbb270e0]
[   451.013] (EE) 3: /usr/lib/xorg/Xorg (RRSetChanged+0x92) [0x5611eb3175f2]
[   451.013] (EE) 4: /usr/lib/xorg/Xorg (RRScreenSetSizeRange+0x54) [0x5611eb31c1b4]
[   451.013] (EE) 5: /usr/lib/xorg/Xorg (xf86RandR12CreateScreenResources+0x310) [0x5611eb2d59d0]
[   451.013] (EE) 6: /usr/lib/xorg/Xorg (0x5611eb200000+0xc8b60) [0x5611eb2c8b60]
[   451.013] (EE) 7: /usr/lib/xorg/Xorg (0x5611eb200000+0x590c1) [0x5611eb2590c1]
[   451.013] (EE) 8: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xf1) [0x7fd7db7972e1]
[   451.013] (EE) 9: /usr/lib/xorg/Xorg (_start+0x2a) [0x5611eb242f0a]
[   451.013] (EE)
[   451.013] (EE) Segmentation fault at address 0xb8
[   451.013] (EE)
Fatal server error:
[   451.013] (EE) Caught signal 11 (Segmentation fault). Server aborting
[   451.013] (EE)
[   451.013] (EE)
Please consult the The X.Org Foundation support
         at http://wiki.x.org
 for help.
[   451.013] (EE) Please also check the log file at "/var/log/Xorg.0.log" for additional information.
[   451.013] (EE)
[   451.063] (EE) Server terminated with error (1). Closing log file.


Mikulas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
