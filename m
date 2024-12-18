Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940539F6387
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C6410EB31;
	Wed, 18 Dec 2024 10:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KqVZ7pHK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8211110EB31
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:41:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so423912f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734518464; x=1735123264; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pe9+U77JJVuAGwYLkBxO9LE5lh/GQGdagTjj9pPlr70=;
 b=KqVZ7pHKmVjCBaYLurHKe9kiKrV9zOklt8C7nl6UtvIgglb8zT4KDMc/7OamPAFZbm
 ZlgYYueRVSHaU4+MTFT0eu8KIw5cqfQa4Cymsg7iBmzwuqvUvt+rIbQKdEhGTJobX8K6
 2gZP0/4fIsyuuHJrJxw9MrFQBiWBFgFJK0S3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734518464; x=1735123264;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pe9+U77JJVuAGwYLkBxO9LE5lh/GQGdagTjj9pPlr70=;
 b=odWGcK8KtmEh174bx7eK40W9pauJry9XS+/Cr6FT8VB1kVorwBQ/ies59lIZZcKPo5
 Ll+n4vc1VdXyMfHZMtigxT9E1VGFMmZL9VM+A9b1gsa8GGQRe02oqiyIFsouIaLZfBCv
 CJs9Gq1KAfBC9GXtmuXem57tBKxbFyBHkXVlfTkm7bjFA3273FjzzFJnCRcefJKlQXkx
 wU6eayHuKIMnPT4tRJS6coDW8rxo3QPlJDLW8tjj2RMwDlOsL4GFsnICWmEVxc8lXnst
 aTyKOGyL8xn3Ke/PGZAcxb+bEpswP+9W7dNs/gUQq067gm0FtkCMsmGCzFXAC7vunG8e
 AJSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6Yv8qnGAD0l6CULqOm9/E2nXipGFb+6YqlaiHRjdJWqc9Xd3e9NFRKJVJp4tZ1joI8W93Lx/s1SY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCw73CGQ5SNBKqFeunTSJmHsaYGE9UB80crKawe/edf8hbQJT9
 EFM9rUaDXptvSZIZ+9RkoADvWg5vx337Pg5HuJvtg1i8XMSPrc4rq4nqAGoxB9g=
X-Gm-Gg: ASbGncusOcGkC/CPYreeKu/RRBHn2QeFIVyBiON9VIz1b5/ONlOguBnsHp/uO5b5tZ1
 mjhc1T9gWyj+qo9uagVcGmI1tfkY0s6aJP4U/92AjBoq3nXxHMeEop5kQTrY1OM5Ml0FvDtv3NA
 EZKmvAVQmhA/XnH+VX+KaxJHUjb+N0dVNI4PAVR1QFDut5CUVlt/Iy1Oy4kzTJ4IBySGHVEsKEO
 JiXAJN+SgJA/Frn7UFuszsLVHsh5jFlaUx/X9zxFNWlaU2paSzuuncP480pNm+EhoGv
X-Google-Smtp-Source: AGHT+IEZvOsUYQjrwrE/oe95wj9YAPCDQ6F+SW4IHrOmGwe0jyn20QjwfCIG9upTPLksGjPgHIQPjA==
X-Received: by 2002:adf:a113:0:b0:386:42b1:d7e4 with SMTP id
 ffacd0b85a97d-388db275325mr5072145f8f.19.1734518463730; 
 Wed, 18 Dec 2024 02:41:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c7fac5bbsm14134216f8f.0.2024.12.18.02.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 02:41:03 -0800 (PST)
Date: Wed, 18 Dec 2024 11:41:01 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>,
 Hans de Goede <hdegoede@redhat.com>, kraxel@redhat.com,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: a bochs-drm (?) oops on head
Message-ID: <Z2KmvZFRWT10fzhr@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Hans de Goede <hdegoede@redhat.com>, kraxel@redhat.com,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <Z18dbfDAiFadsSdg@gallifrey>
 <b2e2a217-dced-472f-9084-9822f7e6803c@suse.de>
 <Z2AvS_8xgBhnF4CW@gallifrey>
 <51a183c7-de10-4419-b540-b7c2ab23520a@suse.de>
 <Z2Bk6-fxzw2dj5Eq@gallifrey>
 <30beb4da-50be-4e28-a19e-5d7f9680c7ea@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30beb4da-50be-4e28-a19e-5d7f9680c7ea@suse.de>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Tue, Dec 17, 2024 at 12:43:11PM +0100, Thomas Zimmermann wrote:
> (cc'ing Hans, who implemented deferred console takeover)
> 
> Hi
> 
> Am 16.12.24 um 18:35 schrieb Dr. David Alan Gilbert:
> > * Thomas Zimmermann (tzimmermann@suse.de) wrote:
> > > Hi
> > > 
> > > 
> > > Am 16.12.24 um 14:46 schrieb Dr. David Alan Gilbert:
> > > [...]
> > > > > The attached patch fixes the problem for me. Could you please test and
> > > > > report back the results.
> > > > That gets me a different oops; this was run with:
> > > > qemu-system-x86_64  -M pc -cpu host --enable-kvm -smp 4 -m 2G -kernel /discs/fast/kernel/arch/x86/boot/bzImage -append "console=tty0 console=ttyS0 root=/dev/vdb1 single" -drive if=virtio,file=/discs/more/images/debian12-64scan.qcow2
> > > > 
> > > > It looks to me if it made the mistake of trying to print something in the middle of being removed:
> > >  From the stack trace below, I'd say it is the one at [1]. But I fail to
> > > reproduce the problem.
> > > 
> > > Could you please send me the complete output of dmesg after the system
> > > finished booting?
> > Sure; this is as far as it gets until it hits the vga oops that stops it:
> 
> I was able to reproduce it a single time. My setup is
> 
> - CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
> - CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y
> - startup with vgacon
> - 'quiet' on kernel command line (important!)
> 
> and then I got the segfault you report.
> 
> With the provided stack trace and log, I think I got some idea what is
> happened
> 
> > 
> > [    0.000000][    T0] Linux version 6.13.0-rc2+ (dg@dalek) (gcc (GCC) 14.2.1 20240912 (Red Hat 14.2.1-3), GNU ld version 2.43.1-4.fc41) #373 SMP PREEMPT_DYNAMIC Mon Dec 16 13:25:32 GMT 2024
> > [    0.000000][    T0] Command line: console=tty0 console=ttyS0 root=/dev/vdb1 single
> [...]
> > [   74.077481][    T1] SPI driver abt-y030xx067a has no spi_device_id for abt,y030xx067a
> > [   74.088805][    T1] SPI driver panel-ilitek-ili9322 has no spi_device_id for dlink,dir-685-panel
> > [   74.090492][    T1] SPI driver panel-ilitek-ili9322 has no spi_device_id for ilitek,ili9322
> > [   74.094556][    T1] SPI driver panel-innolux-ej030na has no spi_device_id for innolux,ej030na
> > [   74.106367][    T1] SPI driver nt39016 has no spi_device_id for kingdisplay,kd035g6-54nt
> > [   74.116623][    T1] SPI driver s6d27a1-panel has no spi_device_id for samsung,s6d27a1
> > [   74.120701][    T1] SPI driver panel-samsung-s6e63m0 has no spi_device_id for samsung,s6e63m0
> 
> > [   74.177273][    T1] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
> 
> This comes from the first iteration in really_probe() [1]. This is the bochs
> instance that will be removed. It should install fbcon, but that gets
> deferred.

I don't think that's correct, because ...

> [1] https://elixir.bootlin.com/linux/v6.12.5/source/drivers/base/dd.c#L631
> 
> > [   74.179388][    T1] [drm] Found bochs VGA, ID 0xb0c5.
> > [   74.180931][    T1] [drm] Framebuffer size 16384 kB @ 0xfd000000, mmio @ 0xfebf0000.
> > [   74.199314][    T1] [drm] Initialized bochs-drm 1.0.0 for 0000:00:02.0 on minor 2
> > [   74.265834][    T1] fbcon: bochs-drmdrmfb (fb1) is primary device
> > [   74.265882][    T1] fbcon: Remapping primary device, fb1, to tty 1-63

... the above line I think is only ever printed if we're not deferred
anymore:
- One such printk is in fbcon_remap_all(), but after checking for
  deferred_takeover and bailing out if that's set.
- The other is in do_fb_registered -> fbcon_select_primary (but only if
  CONFIG_FRAMEBUFFER_DETECT_PRIMARY is set), which is before we check for
  deferred_takeover. But if deferred_takeover is set that path should
  print

  		pr_info("fbcon: Deferring console take-over\n");

  which does not seem to be the case.

But then I have no idea why deferred fbcon could have any impact at all.
Really puzzling.
-Sima

> > [   79.736367][    T1] bochs-drm 0000:00:02.0: [drm] fb1: bochs-drmdrmfb frame buffer device
> 
> End of first bochs instance here..
> 
> > [   79.800872][    T1] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
> 
> The second instance of bochs starts here and tries to deactivate the console
> a second time. Notice that we didn't have any "Console is " or "Taking over
> console" messages.
> 
> > [   79.802400][    T1] BUG: kernel NULL pointer dereference, address: 000000000000020c
> 
> I've not been able to figure out what is a offset 0x20c (524 decimal). None
> of the structs involved appears to have any fields starting at this offset.
> The nearest case is vc_hi_font_mask, [2] which is at +520. Could be related
> to aligned memory access. get_color() would read that field. [3] vc_num at
> +512 is another candidate.
> 
> [2] https://elixir.bootlin.com/linux/v6.13-rc2/source/include/linux/console_struct.h#L124
> [3] https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/video/fbdev/core/fbcon.c#L302
> 
> > [   79.802448][    T1] #PF: supervisor write access in kernel mode
> > [   79.802498][    T1] #PF: error_code(0x0002) - not-present page
> > [   79.802545][    T1] PGD 0 P4D 0
> > [   79.802622][    T1] Oops: Oops: 0002 [#1] PREEMPT SMP DEBUG_PAGEALLOC NOPTI
> > [   79.802669][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W        N 6.13.0-rc2+ #373 5a5c0ce8f09b0b72067981f01985e201a0118bb6
> > [   79.802669][    T1] Tainted: [W]=WARN, [N]=TEST
> > [   79.802669][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> > [   79.802669][    T1] RIP: 0010:fbcon_cursor+0xa9/0x3c0
> > [   79.802669][    T1] Code: c0 05 00 00 66 89 44 24 06 e8 f3 35 2a fd 0f b7 bb c0 05 00 00 e8 27 b8 e9 fc 49 8d bc 24 0c 02 00 00 49 89 c7 e8 d7 3d 2a fd <45> 89 bc 24 0c 02 00 00 48 8d bd e0 05 00 00 e8 c3 3b 2a fd 44 8b
> > [   79.802669][    T1] RSP: 0018:ffffb70f800136c0 EFLAGS: 00010046
> > [   79.802669][    T1] RAX: 0000000000000000 RBX: ffff9d4fc10a8800 RCX: 0000000000000000
> > [   79.802669][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > [   79.802669][    T1] RBP: ffff9d4fc54ba800 R08: 0000000000000000 R09: 0000000000000000
> > [   79.802669][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> > [   79.802669][    T1] R13: 0000000000000000 R14: ffff9d4fc54bade8 R15: 0000000000000032
> > [   79.802669][    T1] FS:  0000000000000000(0000) GS:ffff9d503d200000(0000) knlGS:0000000000000000
> > [   79.802669][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   79.802669][    T1] CR2: 000000000000020c CR3: 0000000056520000 CR4: 0000000000350ef0
> > [   79.802669][    T1] Call Trace:
> > [   79.802669][    T1]  <TASK>
> > [   79.802669][    T1]  ? __die+0x23/0x80
> > [   79.802669][    T1]  ? page_fault_oops+0x21c/0x240
> > [   79.802669][    T1]  ? do_user_addr_fault+0x893/0x1180
> > [   79.802669][    T1]  ? srso_return_thunk+0x5/0x7f
> > [   79.802669][    T1]  ? exc_page_fault+0x3f/0x180
> > [   79.802669][    T1]  ? exc_page_fault+0x87/0x180
> > [   79.802669][    T1]  ? asm_exc_page_fault+0x26/0x40
> 
> > [   79.802669][    T1]  ? fbcon_cursor+0xa9/0x3c0
> > [   79.802669][    T1]  hide_cursor+0x66/0x1c0
> > [   79.802669][    T1]  vt_console_print+0x9b1/0xa40
> 
> I think we get here via steps [4] to [8].
> 
> [4]
> https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/pci/vgaarb.c#L173
> [5]
> https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/tty/vt/vt.c#L3287
> [6]
> https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/tty/vt/vt.c#L861
> [7]
> https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/tty/vt/vt.c#L846
> [8] https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/video/fbdev/core/fbcon.c#L1322
> 
> When vt_console_print() invokes the call at [9], it apparently replaces the
> deferred console implementation (maybe ?) and
> then the next line [5] operates on a NULL pointer somewhere.
> 
> [9]
> https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/tty/vt/vt.c#L3286
> 
> Best regards
> Thomas
> 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
