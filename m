Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0025D760B7E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151ED10E3A3;
	Tue, 25 Jul 2023 07:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 566 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jul 2023 21:07:20 UTC
Received: from mta01.prd.rdg.aluminati.org (mta01.prd.rdg.aluminati.org
 [94.76.243.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C93910E356
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 21:07:20 +0000 (UTC)
Received: from mta01.prd.rdg.aluminati.org (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id ACD0120688;
 Mon, 24 Jul 2023 21:57:52 +0100 (BST)
Authentication-Results: mta01.prd.rdg.aluminati.org; dkim=pass (2048-bit key;
 unprotected) header.d=cantab.net header.i=@cantab.net header.a=rsa-sha256
 header.s=dkim header.b=vXxsfLFD; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id 99D1F20560;
 Mon, 24 Jul 2023 21:57:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cantab.net; h=
 user-agent:message-id:date:date:x-mailer:references:in-reply-to
 :subject:subject:from:from:received:received:received; s=dkim;
 t=1690232271; bh=FODVMINyGuqfbO16NcKUTgCRlEZOxDSkZONruhtMCMI=; b=
 vXxsfLFDMvO/tvVvVo5JMVlIJHOoNGlb4K7gZYJExSxAj8buGA9QxAVLhU25in9m
 lSHM+XTGpsPOX16BWV/NJAXvSgLlQPeAST1ZoOthTEa6Jw/tkJHi3+1lA6EwSY/E
 MtcQIX5143y59TJNYaTXCOuWow29eiE+LN/baXL4GcrxP1GOGmZhWDC8LX131OrU
 oChKiLLVJorHjf4jYkOrLN8oFYrl5ic36Mcy+ZXNkaN9Dj6+fnDwjXvTj5m3EWSv
 3P0JQIuJ4HB1GMI0AjnnCLyVP1dwFR+aVbFBGBegpUugfVpmgx1GHACeRP4UcbLY
 z3atA9R/sxuCa6c8xqPe2Q==
X-Quarantine-ID: <jidS6taqrfZx>
X-Virus-Scanned: Debian amavisd-new at mta01.prd.rdg.aluminati.org
Received: from mta.aluminati.local ([127.0.0.1])
 by localhost (mta01.prd.rdg.aluminati.org [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id jidS6taqrfZx; Mon, 24 Jul 2023 21:57:51 +0100 (BST)
Received: from revelation.localdomain (static-87-75-118-217.vodafonexdsl.co.uk
 [87.75.118.217])
 by svc01-2.prd.rdg.aluminati.org (Postfix) with ESMTPSA id 0863E780004;
 Mon, 24 Jul 2023 21:57:46 +0100 (BST)
Received: by revelation.localdomain (Postfix, from userid 1000)
 id 49CAB120348; Mon, 24 Jul 2023 21:57:46 +0100 (BST)
From: Roger Sewell <roger.sewell@cantab.net>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
In-reply-to: Your message of Mon, 24 Jul 2023 20:57:31 +0200
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
X-Mailer: MH-E 8.6+git; GNU Mailutils 3.13; GNU Emacs 27.2
Date: Mon, 24 Jul 2023 21:57:46 +0100
Message-ID: <20230724215746.10928@revelation.broadband>
User-Agent: MH (GNU Mailutils 3.13)
X-Mailman-Approved-At: Tue, 25 Jul 2023 07:19:08 +0000
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
Cc: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Thomas,

Hello, I'm the user who reported the issue. Definitely happy to help you
sort this out if I can, though my response speed will decrease when term
restarts in October.

> I'd be interested in the exact model and the unique_rev_id
> (you said A, rev1 ?) 

The machine is an Intel SR1625URR server including an S5520UR
motherboard. 

Table 10 in the following document says that  1440x900@60Hz is supported:
https://www.intel.com/content/dam/support/us/en/documents/motherboards/server/s5520ur/sb/e44031012_s5520ur_s5520urt_tps_r1_9.pdf

lspci -v returns:

07:00.0 VGA compatible controller: Matrox Electronics Systems Ltd. MGA G200e [Pilot] ServerEngines (SEP1) (rev 02) (prog-if 00 [VGA controller])
	Subsystem: Intel Corporation Device 0101
	Physical Slot: 5
	Flags: bus master, fast devsel, latency 0, IRQ 16
	Memory at b0000000 (32-bit, prefetchable) [size=16M]
	Memory at b1800000 (32-bit, non-prefetchable) [size=16K]
	Memory at b1000000 (32-bit, non-prefetchable) [size=8M]
	Expansion ROM at 000c0000 [disabled] [size=128K]
	Capabilities: <access denied>
	Kernel driver in use: mgag200
	Kernel modules: mgag200

so in particular the chip is said to be a G200e, not the G200SE-A that
the kernel module seems to be interpreting it as. In the lspci return it
calls itself "rev 02", but the unique_rev_id returned is 0x01, not 02,
and not 00. (My originally suggested solution was that "rev 02" might
correspond to unique_rev_id=0x01 and that one should add 1 to the
unique_rev_id, but Jocelyn indicated that isn't right.)

I instrumented a version of the new code by adding printk statements to
a version of the module embodied in a kmod-mgag200 package and observing
messages in the /var/log/messages file. These tell me that:

> and if the early-out branches in mga_vga_calculate_mode_bandwidth()
> are being taken. 

In the "old" code the options to return 0 are NOT being taken, and the
bandwidth returned is the expected value of 30318019. 

In the *new* code the options to return 0 are NOT being taken, and the
bandwidth returned is the expected value of 30318019. 

> Can you figure out how exactly the CPU moves through
> mga_vga_mode_valid().

In the "old" code we enter the true part of the if (IS_G200_SE(mdev)),
then the true part of the if (unique_rev_id == 0x01), then return
MODE_BANDWIDTH (i.e. MODE_BAD) at the third if statement in that block.

In the *new* code the nearest-named function I could see is
mgag200_mode_config_mode_valid, which returns MODE_OK at the end of the
function if the bandwidth limit is increased to 30100, and returns
MODE_BAD three lines higher up if it is left at 24400.

Moreover if when using the old code we switch to Wayland instead of
Xorg, it doesn't let me pick the 1440x900@60Hz mode at all, but it does
with Xorg (one of the reasons I hadn't used Wayland).

Therefore I think the reason that the old code allowed use of
1440x900@60Hz was that Xorg somehow didn't properly check the return
value from mga_vga_mode_valid, but Wayland did. Moreover I think that
the latest version of the Xorg stuff does PARTIALLY check that return
value, to the extent that it won't let you actually use that mode, but
does nonetheless present it as a choice when you go to Settings->Display
- and then saves the values it didn't allow you to take in
~/.config/monitors.xml, and on relogin refuses to give you any graphics
at all because it doesn't like those values. But that, of course, is
nothing to do with the mgag200 driver (if it is indeed true - I haven't
looked at the Xorg source code at all).

The issue from the point of view of my usage case is that the chip works
just fine in the 1440x900@60Hz mode, even though 30318019 > 1024*24400. 

If I haven't made anything sufficiently clear, or if you need more info,
please ask.

Best wishes,
Roger.
