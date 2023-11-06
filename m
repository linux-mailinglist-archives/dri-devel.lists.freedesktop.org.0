Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F77E2E3B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 21:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D90410E101;
	Mon,  6 Nov 2023 20:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from purple.birch.relay.mailchannels.net
 (purple.birch.relay.mailchannels.net [23.83.209.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F037510E101
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 20:32:51 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|x.reply@epreston.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 4157480D94;
 Mon,  6 Nov 2023 20:32:51 +0000 (UTC)
Received: from s147.servername.online (unknown [127.0.0.6])
 (Authenticated sender: hostpapa)
 by relay.mailchannels.net (Postfix) with ESMTPA id 7131280C5C;
 Mon,  6 Nov 2023 20:32:49 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1699302769; a=rsa-sha256;
 cv=none;
 b=xgdjf5WyOUL4O41fOWEZhmZzBKqHW1ccbfY1pdce9cw4Ghn1jPPG00DRITaaHHg72poFLv
 o52vtDPdCw2aQQ5kEuVjmZq2BmjecDYer49IaR06MTORO5AH67aL2e50VekJMbfFqpjjAX
 9Nhf/Gal8TFptqK8rlVMmn8GMwNM/Bu4dqTF1EIvO4TlpC6fRx350Ip5qiylYSmNJjMUK1
 ASZOzsf3KuWv5lfgVTd9pu25VvvHU0T2u0juAYhAJ6aQ1OGHp2q0WBXn4jfFTk9WkhP6LK
 RO+R4R/lJX0B/2ZJdjU8hktNwS67jxqE3ctRwZCcuNt4RrXGnahozU0Pw5IEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1699302769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=x7NhMcJqIMKSqBFn72JnZ5pp1vHSwAmRkIlqvrgvPD0=;
 b=hv2zUN9aB5mQfZvJv9v5wUqyLug6ZoqiAccrSB6/SmmDaPjFoKDiKvsV5tABubTHWRCHuV
 TtmiDo51qVavV41ymydeYVIZzvd022AHAzu5yDL8uNSZvcHqUhe5hqj1T/6X62GvwLSUeT
 ZJVpsvo4P8NpH6inmSqmaLDRU//tJQ7ICyUebTPUShhWsKUvSC6ulcdmjXz3OYtJs3uhti
 o4WxqJVBm0RG3buGF+t+pEdJFQv4z7O20Oc1GrTj8YJG9WsJ2+JpJzmhq/iA8kz9ZYJXLw
 JrnL9gDU9pjv5dSJeDbueMkIHabZRvMP35rN76TGRddiQVvyOt/8B9Vu8/L+kQ==
ARC-Authentication-Results: i=1; rspamd-76878f7dcc-g6tgg;
 auth=pass smtp.auth=hostpapa smtp.mailfrom=x.arch@epreston.net
X-Sender-Id: hostpapa|x-authuser|x.reply@epreston.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|x.reply@epreston.net
X-MailChannels-Auth-Id: hostpapa
X-Society-Squirrel: 0680b70a2ff2afb9_1699302771059_1124573024
X-MC-Loop-Signature: 1699302771059:3293636326
X-MC-Ingress-Time: 1699302771058
Received: from s147.servername.online (s147.servername.online [204.44.192.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.124.29.22 (trex/6.9.2); Mon, 06 Nov 2023 20:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=epreston.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x7NhMcJqIMKSqBFn72JnZ5pp1vHSwAmRkIlqvrgvPD0=; b=L96NZwAy06/l8Vghs+TmtlrfNV
 sLD7XhcpxbpS71WzS/WtEmNdqOiuw2IRxkGTvCrHK6sE2h/OV88wsXlgITiF+L84cJc2eepT7dgYo
 oT3qtxBAraLkrpmDC1+yQG+qZCR/7GQjMAW0V7R7YA9ekXMMYB25I9HD2/bFW+0QMc3FbzzHZw0i+
 339RnyE2osF7dE+hupc6lCQMYidQ8u43rlR8yQisxVMlWA58Jel03VOLGfLmYYov3HSajkN1RcMLV
 ePWWYFoFvQyBhB02alF3vO115TjeCAmzFXyyQ5tGNdeEDlZfVVGahaIdC6p0kPm6CM5Nql/OZR022
 ucStcQoQ==;
Received: from [50.35.115.28] (port=54758 helo=P70.localdomain)
 by s147.servername.online with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <x.arch@epreston.net>) id 1r06H9-006qmZ-10;
 Mon, 06 Nov 2023 12:32:49 -0800
Date: Mon, 6 Nov 2023 12:32:46 -0800
From: Evan Preston <x.arch@epreston.net>
To: Huacai Chen <chenhuacai@kernel.org>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
Message-ID: <ZUlNbpo_l8JYDdlu@P70.localdomain>
References: <31ed0db1-9398-4c46-a391-fc644ec49268@ristioja.ee>
 <CAAhV-H4MekBgYZ1nJ-M7bnpo3bczOMcTanij18ACCALz2svjQQ@mail.gmail.com>
 <ZUSJDG82vzbuyFEY@P70.localdomain>
 <CAAhV-H6GyOnTOm6b8Xp=ySctyE-T905WKDUS2AZuqnEyzM7ZEg@mail.gmail.com>
 <ZUWtTuIcMwwCWg7z@P70.localdomain>
 <CAAhV-H7wnjac1Znr2yh8S2bGwuxF1RRGp=cn9oracrWm6y5VVQ@mail.gmail.com>
 <51add74a-1d1a-493d-bb50-fccdad11b22c@ristioja.ee>
 <CAAhV-H7nhkvLoDMwQDwNEhykZANGMq-Qrzip48qYzgQs1fNUgA@mail.gmail.com>
 <be82874b-d41b-4547-9ab5-dac9a5ddfeaf@ristioja.ee>
 <CAAhV-H6zjW3XzDWP1_Hu-owBPLyJVB-_V3z9bMtOgubp1p5kZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H6zjW3XzDWP1_Hu-owBPLyJVB-_V3z9bMtOgubp1p5kZA@mail.gmail.com>
X-AuthUser: x.reply@epreston.net
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jaak Ristioja <jaak@ristioja.ee>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Evan Preston <x.arch@epreston.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Huacai,

On 2023-11-06 Mon 10:22pm, Huacai Chen wrote:
> On Mon, Nov 6, 2023 at 9:49 PM Jaak Ristioja <jaak@ristioja.ee> wrote:
> >
> > On 06.11.23 04:15, Huacai Chen wrote:
> > > Hi, Jaak and Evan,
> > >
> > > On Mon, Nov 6, 2023 at 12:28 AM Jaak Ristioja <jaak@ristioja.ee> wrote:
> > >>
> > >> On 05.11.23 14:40, Huacai Chen wrote:
> > >>> Hi, Evan,
> > >>>
> > >>> On Sat, Nov 4, 2023 at 10:50 AM Evan Preston <x.arch@epreston.net> wrote:
> > >>>>
> > >>>> Hi Huacai,
> > >>>>
> > >>>> On 2023-11-03 Fri 02:36pm, Huacai Chen wrote:
> > >>>>> Hi, Evan,
> > >>>>>
> > >>>>> On Fri, Nov 3, 2023 at 1:54 PM Evan Preston <x.arch@epreston.net> wrote:
> > >>>>>>
> > >>>>>> Hi Huacai,
> > >>>>>>
> > >>>>>> On 2023-11-02 Thu 08:38pm, Huacai Chen wrote:
> > >>>>>>> Hi, Jaak,
> > >>>>>>>
> > >>>>>>> On Wed, Nov 1, 2023 at 7:52 PM Jaak Ristioja <jaak@ristioja.ee> wrote:
> > >>>>>>>>
> > >>>>>>>> On 31.10.23 14:17, Huacai Chen wrote:
> > >>>>>>>>> Hi, Jaak and Evan,
> > >>>>>>>>>
> > >>>>>>>>> On Sun, Oct 29, 2023 at 9:42 AM Huacai Chen <chenhuacai@kernel.org> wrote:
> > >>>>>>>>>>
> > >>>>>>>>>> On Sat, Oct 28, 2023 at 7:06 PM Jaak Ristioja <jaak@ristioja.ee> wrote:
> > >>>>>>>>>>>
> > >>>>>>>>>>> On 26.10.23 03:58, Huacai Chen wrote:
> > >>>>>>>>>>>> Hi, Jaak,
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> On Thu, Oct 26, 2023 at 2:49 AM Jaak Ristioja <jaak@ristioja.ee> wrote:
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> On 25.10.23 16:23, Huacai Chen wrote:
> > >>>>>>>>>>>>>> On Wed, Oct 25, 2023 at 6:08 PM Thorsten Leemhuis
> > >>>>>>>>>>>>>> <regressions@leemhuis.info> wrote:
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Javier, Dave, Sima,
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> On 23.10.23 00:54, Evan Preston wrote:
> > >>>>>>>>>>>>>>>> On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
> > >>>>>>>>>>>>>>>>> On Fri, Oct 20, 2023 at 5:35 PM Linux regression tracking (Thorsten
> > >>>>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > >>>>>>>>>>>>>>>>>> On 09.10.23 10:54, Huacai Chen wrote:
> > >>>>>>>>>>>>>>>>>>> On Mon, Oct 9, 2023 at 4:45 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> > >>>>>>>>>>>>>>>>>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
> > >>>>>>>>>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 10:31 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > >>>>>>>>>>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 7:15 PM Linux regression tracking (Thorsten
> > >>>>>>>>>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > >>>>>>>>>>>>>>>>>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
> > >>>>>>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD
> > >>>>>>>>>>>>>>>>>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank
> > >>>>>>>>>>>>>>>>>>>>>>>> screen after boot until the display manager starts... if it does start
> > >>>>>>>>>>>>>>>>>>>>>>>> at all. Using the nomodeset kernel parameter seems to be a workaround.
> > >>>>>>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>>>>>> I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4
> > >>>>>>>>>>>>>>>>>>>>>>>> ("drivers/firmware: Move sysfb_init() from device_initcall to
> > >>>>>>>>>>>>>>>>>>>>>>>> subsys_initcall_sync").
> > >>>>>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things work fine
> > >>>>>>>>>>>>>>>>>>>>> again. So I guess the reason:
> > >>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>> Well, this to me still looks a lot (please correct me if I'm wrong) like
> > >>>>>>>>>>>>>>>>>> regression that should be fixed, as DRM_SIMPLEDRM was enabled beforehand
> > >>>>>>>>>>>>>>>>>> if I understood things correctly. Or is there a proper fix for this
> > >>>>>>>>>>>>>>>>>> already in the works and I just missed this? Or is there some good
> > >>>>>>>>>>>>>>>>>> reason why this won't/can't be fixed?
> > >>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>> DRM_SIMPLEDRM was enabled but it didn't work at all because there was
> > >>>>>>>>>>>>>>>>> no corresponding platform device. Now DRM_SIMPLEDRM works but it has a
> > >>>>>>>>>>>>>>>>> blank screen. Of course it is valuable to investigate further about
> > >>>>>>>>>>>>>>>>> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's effort because
> > >>>>>>>>>>>>>>>>> I don't have a same machine.
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Side note: Huacai, have you tried working with Jaak to get down to the
> > >>>>>>>>>>>>>>> real problem? Evan, might you be able to help out here?
> > >>>>>>>>>>>>>> No, Jaak has no response after he 'fixed' his problem by disabling SIMPLEDRM.
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> I'm sorry, what was it exactly you want me to do? Please be mindful that
> > >>>>>>>>>>>>> I'm not familiar with the internals of the Linux kernel and DRI, and it
> > >>>>>>>>>>>>> might sometimes take weeks before I have time to work and respond on this.
> > >>>>>>>>>>>> It doesn't matter. I hope you can do some experiments to investigate
> > >>>>>>>>>>>> deeper. The first experiment you can do is enabling SIMPLEFB (i.e.
> > >>>>>>>>>>>> CONFIG_FB_SIMPLE) instead of SIMPLEDRM (CONFIG_DRM_SIMPLEDRM) to see
> > >>>>>>>>>>>> whether there is also a blank screen. If no blank screen, that
> > >>>>>>>>>>>> probably means SIMPLEDRM has a bug, if still blank screen, that means
> > >>>>>>>>>>>> the firmware may pass wrong screen information.
> > >>>>>>>>>>>
> > >>>>>>>>>>> Testing with 6.5.9 I get a blank screen with CONFIG_DRM_SIMPLEDRM=y and
> > >>>>>>>>>>> get no blank screen with CONFIG_FB_SIMPLE=y and CONFIG_DRM_SIMPLEDRM unset.
> > >>>>>>>>>> CONFIG_FB_SIMPLE and  CONFIG_DRM_SIMPLEDRM use the same device created
> > >>>>>>>>>> by sysfb_init(). Since FB_SIMPLE works fine, I think the real problem
> > >>>>>>>>>> is that DRM_SIMPLEDRM has a bug. The next step is to enable
> > >>>>>>>>>> CONFIG_DRM_SIMPLEDRM and trace its initialization. In detail, adding
> > >>>>>>>>>> some printk() in simpledrm_probe() and its sub-routines to see where
> > >>>>>>>>>> the driver fails. The output of these printk() can be seen by the
> > >>>>>>>>>> 'dmesg' command after boot.
> > >>>>>>>>> I need your help. I tried with my laptop (ThinkPad E490, Intel Core
> > >>>>>>>>> i3-8145U, UHD Graphics 620) but I can't reproduce your problem. So
> > >>>>>>>>> please patch your 6.5.x kernel with this temporary patch [1], then
> > >>>>>>>>> build a "bad kernel" with SIMPLEDRM enabled. And after booting your
> > >>>>>>>>> machine with this "bad kernel", please give me the dmesg output. Thank
> > >>>>>>>>> you very much.
> > >>>>>>>>>
> > >>>>>>>>> [1] http://ddns.miaomiaomiao.top:9000/download/kernel/patch-6.5.9
> > >>>>>>>>
> > >>>>>>>> I'm unable to download it. Can you please send it by e-mail?
> > >>>>>>> I'm sorry, please download from attachment.
> > >>>>>>
> > >>>>>> When applying this patch the first hunk (drivers/firmware/sysfb.c) fails for
> > >>>>>> me with 6.5.9.  Attempting to load the 6.5.9 kernel without this patch
> > >>>>>> produces no dmesg output on my machine.
> > >>>>> You copy-paste the patch? If you download it directly it can be
> > >>>>> applied successfully, I think.
> > >>>>
> > >>>> The patch downloaded from your URL applies successfully.  However, I still
> > >>>> see no dmesg output using the patched 6.5.9 kernel.  'journalctl -k -b all'
> > >>>> shows no dmesg output from any 6.5.x boots, only from 6.4.12 boots.
> > >>> Thank you for your testing. Since you cannot boot to GUI successfully
> > >>> as Jaak, you may have some troubles with getting the dmesg output. But
> > >>> you can try to use "systemd.unit=multi-user.target" boot parameters.
> > >>> In this way you may boot to the login: prompt and then you can get
> > >>> dmesg output. Or if you still fail, you may use 'jornalctl -k -b -1'
> > >>> to get the previous dmesg output with 6.4.12.
> > >>>
> > >>> Hi, Jaak,
> > >>>
> > >>> Have you tested? I think you can successfully get a dmesg output with my patch.
> > >>
> > >> Yes, just tested it, here I think are the relevant parts from a dmesg
> > >> produced with CONFIG_DRM_SIMPLEDRM and the patch provided by Huacai:
> > >>
> > >> ...
> > >> [    2.909625] sysfb 1
> > >> [    2.909627] sysfb 2
> > >> ...
> > >> [    2.951477] ACPI: bus type drm_connector registered
> > >> [    2.952096] i915 0000:00:02.0: [drm] VT-d active for gfx access
> > >> [    2.952105] resource: resource sanity check: requesting [mem
> > >> 0x00000000e0000000-0x00000000efffffff], which spans more than BOOTFB
> > >> [mem 0xe0000000-0xe012bfff]
> > >> [    2.952111] caller i915_ggtt_init_hw+0x88/0x120 mapping multiple BARs
> > >> [    2.952138] i915 0000:00:02.0: [drm] Using Transparent Hugepages
> > >> [    2.953204] Loading firmware: i915/kbl_dmc_ver1_04.bin
> > >> [    2.953485] i915 0000:00:02.0: [drm] Finished loading DMC firmware
> > >> i915/kbl_dmc_ver1_04.bin (v1.4)
> > >> ...
> > >> [    4.142075] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on
> > >> minor 0
> > >> [    4.144269] ACPI: video: Video Device [GFX0] (multi-head: yes  rom:
> > >> no  post: no)
> > >> [    4.144414] input: Video Bus as
> > >> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input4
> > >> [    4.144580] [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 1
> > >> [    4.144590] usbcore: registered new interface driver udl
> > >> [    4.144603] T: probe 1
> > >> [    4.144605] T: create 1
> > >> [    4.144610] T: create 2
> > >> [    4.144611] T: create 3a-1
> > >> [    4.144613] T: create 3a-2
> > >> [    4.144614] T: create 3a-3
> > >> [    4.144616] T: create 3a-4
> > >> [    4.144618] T: create 4
> > >> [    4.144619] T: create 5
> > >> [    4.144621] simple-framebuffer simple-framebuffer.0: [drm] display
> > >> mode={"": 60 18432 640 640 640 640 480 480 480 480 0x40 0x0}
> > >> [    4.144628] simple-framebuffer simple-framebuffer.0: [drm]
> > >> framebuffer format=XR24 little-endian (0x34325258), size=640x480,
> > >> stride=2560 byte
> > >> [    4.144633] T: create 6b-1
> > >> [    4.144635] T: create 6b-2
> > >> [    4.144637] simple-framebuffer simple-framebuffer.0: [drm] using I/O
> > >> memory framebuffer at [mem 0xe0000000-0xe012bfff flags 0x200]
> > >> [    4.144643] T: create 6b-3
> > >> [    4.144660] T: create 6b-4
> > >> [    4.144662] T: create 7
> > >> [    4.144673] T: create 8
> > >> [    4.144676] T: create 9
> > >> [    4.144678] T: create 10
> > >> [    4.144681] T: create 11
> > >> [    4.144685] T: create 12
> > >> [    4.144689] T: probe 2
> > >> [    4.144728] [drm] Initialized simpledrm 1.0.0 20200625 for
> > >> simple-framebuffer.0 on minor 2
> > >> [    4.144732] T: probe 3
> > >> [    4.145905] Console: switching to colour frame buffer device 80x30
> > >> [    4.150437] simple-framebuffer simple-framebuffer.0: [drm] fb0:
> > >> simpledrmdrmfb frame buffer device
> > >> [    4.150766] T: probe 4
> > >> [    4.151218] loop: module loaded
> > >> [    4.154434] i915 0000:00:02.0: [drm] fb1: i915drmfb frame buffer device
> > >> ...
> > >> [   44.630789] simple-framebuffer simple-framebuffer.0: swiotlb buffer
> > >> is full (sz: 1310720 bytes), total 32768 (slots), used 0 (slots)
> > >> ...
> > >>
> > >> The last message might be due to the display manager starting up.
> > >>
> > >> Hope it helps.
> > > Thank you for your testing. Jaak's problem seems related to the
> > > initialization order, you can try to modify drivers/gpu/drm/Makefile,
> > > move
> > >
> > > obj-y                  += tiny/
> > >
> > > to between these two lines
> > >
> > > obj-$(CONFIG_DRM_SCHED) += scheduler/
> > > obj-$(CONFIG_DRM_RADEON)+= radeon/
> > >
> > > then build a new 6.5.x kernel to see whether your problem is resolved.
> >
> > Yes, this seems to have resolved it.
> Hi, Jaak,
> 
> Thank you very much, and I hope this also solves Evan's problem.

I still get a blank screen if I modify drivers/gpu/drm/Makefile to move the 
order of 'tiny'.

> 
> Hi, Javier,
> 
> I think I have mostly found the root cause. DRM_SIMPLEDRM has no bugs,
> Jaak's problem is due to the initialization order of drivers, and this
> order depends on the Makefile.
> 
> FB_SIMPLE is before native DRM drivers (e.g. i915, radeon, amdgpu, and
> so on), but DRM_SIMPLEDRM is after them. Thus, if Jaak uses FB_SIMPLE,
> I915 will takeover FB_SIMPLE, then no problem; and if Jaak uses
> DRM_SIMPLEDRM, DRM_SIMPLEDRM will try to takeover I915, but fails to
> work.
> 
> So, when I move the "tiny" directory before i915, the problem is
> solved. But the new problem is: is it acceptable to solve this problem
> by adjusting Makefile?
> 
> Huacai
> 
> >
> > Jaak
> >
> > >
> > > Evan's problem seems a little strange, could you please give me your
> > > config files of both 6.4.12 and 6.5.x? And you can also try the above
> > > method to see if anything changes.

I'll send you my config files.

> > >
> > > Huacai
> > >
> > >>
> > >> J
> > >>
> > >>>
> > >>>>
> > >>>> Evan
> > >>>>
> > >>>>>
> > >>>>> Huacai
> > >>>>>
> > >>>>>>
> > >>>>>> Evan
> > >>>>>>
> > >>>>>>>
> > >>>>>>> Huacai
> > >>>>>>>
> > >>>>>>>>
> > >>>>>>>> Jaak
> > >>>>>>>>
> > >>>>>>>>>
> > >>>>>>>>>
> > >>>>>>>>> Huacai
> > >>>>>>>>>
> > >>>>>>>>>>
> > >>>>>>>>>> Huacai
> > >>>>>>>>>>
> > >>>>>>>>>>>
> > >>>>>>>>>>> Jaak
> > >>>>>>>>>>>
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> Huacai
> > >>>>>>>>>>>>
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> Jaak
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> But I write this mail for a different reason:
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>> I am having the same issue on a Lenovo Thinkpad P70 (Intel
> > >>>>>>>>>>>>>>>> Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) i7-6700HQ).
> > >>>>>>>>>>>>>>>> Upgrading from Linux 6.4.12 to 6.5 and later results in only a blank
> > >>>>>>>>>>>>>>>> screen after boot and a rapidly flashing device-access-status
> > >>>>>>>>>>>>>>>> indicator.
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> This additional report makes me wonder if we should revert the culprit
> > >>>>>>>>>>>>>>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() from
> > >>>>>>>>>>>>>>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). But I guess that
> > >>>>>>>>>>>>>>> might lead to regressions for some users? But the patch description says
> > >>>>>>>>>>>>>>> that this is not a common configuration, so can we maybe get away with that?
> > >>>>>>>>>>>>>>      From my point of view, this is not a regression, 60aebc9559492c
> > >>>>>>>>>>>>>> doesn't cause a problem, but exposes a problem. So we need to fix the
> > >>>>>>>>>>>>>> real problem (SIMPLEDRM has a blank screen on some conditions). This
> > >>>>>>>>>>>>>> needs Jaak or Evan's help.
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>> Huacai
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > >>>>>>>>>>>>>>> --
> > >>>>>>>>>>>>>>> Everything you wanna know about Linux kernel regression tracking:
> > >>>>>>>>>>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
> > >>>>>>>>>>>>>>> If I did something stupid, please tell me, as explained on that page.
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>>> When SIMPLEDRM takes over the framebuffer, the screen is blank (don't
> > >>>>>>>>>>>>>>>>>>>>> know why). And before 60aebc9559492cea6a9625f ("drivers/firmware: Move
> > >>>>>>>>>>>>>>>>>>>>> sysfb_init() from device_initcall to subsys_initcall_sync") there is
> > >>>>>>>>>>>>>>>>>>>>> no platform device created for SIMPLEDRM at early stage, so it seems
> > >>>>>>>>>>>>>>>>>>>>> also "no problem".
> > >>>>>>>>>>>>>>>>>>>> I don't understand above. You mean that after that commit the platform
> > >>>>>>>>>>>>>>>>>>>> device is also none, right?
> > >>>>>>>>>>>>>>>>>>> No. The SIMPLEDRM driver needs a platform device to work, and that
> > >>>>>>>>>>>>>>>>>>> commit makes the platform device created earlier. So, before that
> > >>>>>>>>>>>>>>>>>>> commit, SIMPLEDRM doesn't work, but the screen isn't blank; after that
> > >>>>>>>>>>>>>>>>>>> commit, SIMPLEDRM works, but the screen is blank.
> > >>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>> Huacai
> > >>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>> Confused...
> > >>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>> --
> > >>>>>>>>>>>>>>>>>>>> An old man doll... just what I always wanted! - Clara
> > >>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>
> > >>>>>>>>
> > >>>>>>
> > >>>>>>
> > >>
> >
