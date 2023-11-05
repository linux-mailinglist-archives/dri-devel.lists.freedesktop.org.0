Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A825A7E16C9
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 22:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670C010E241;
	Sun,  5 Nov 2023 21:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from purple.birch.relay.mailchannels.net
 (purple.birch.relay.mailchannels.net [23.83.209.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CD510E241
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 21:19:55 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|x.reply@epreston.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 25147901076;
 Sun,  5 Nov 2023 21:10:51 +0000 (UTC)
Received: from s147.servername.online (unknown [127.0.0.6])
 (Authenticated sender: hostpapa)
 by relay.mailchannels.net (Postfix) with ESMTPA id 4FCD090113E;
 Sun,  5 Nov 2023 21:10:50 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1699218650; a=rsa-sha256;
 cv=none;
 b=w1gnGLGV/AHJZo02c9A+hkQRkG8xfGhJB6NvNoYrr2leHTLmyzyhVWcHFWkpCLxMcMuueg
 2akDIwwKUXOTQ7yP+Yls/odjpxsdM3z1LWzdnKdnS7vBshPw3upgmRvefwIHocOpJmY1Qd
 Ty0TyCiy6+qVKQaInZgEM16gb1dCUrIWi0+iYwGCTqJcxNVmVog4OHFUTlBfFOLQDb8REb
 1NtftVvonHjL9c0MiAZoq8o+1c74FVO3FPTnVbNQAAZeiZeLiNXwvPulF53PVlfYwvRkRQ
 BLoaxeF9CUA6+IGSAPAgNzNpK6K9dRUMX9lx7gg3IOtzRD/yTOnGQRwXsE0tSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1699218650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=ylVjOxAdSOmmLfdvsrGVUtgWEHNc9VbZNNbA/AfvLCc=;
 b=IGH8RKutg5kMxuM5uQwbzwNmcL9fB858T0THNdEHVyRmSSe3C2A+kGevhYB/SbF+5xeisk
 iWOkVX4tSwTfZ38/4LbMZFKSHBe+xEP7JZsLC8ytU1Dv3nyafjj1Wghu0IUxZ2a20GYIe2
 xtGEQWBUAZYKhHX+PjYg3v7toCrbhHnnB8oP9GBlPSo4CQDGGPMpaJdZC7pNRdCbD++up2
 XtPZ286ZrHZTMYQLZ42Jlx285629+e9payKf7UgWwekwDMNGEx9YUQgD50H3XN5nVziVHR
 gq+bUtJoQgA30jUGCKqVkBt5NRGBQLhEUOETZIksADEMhC3pOU/lVk3G07NxtQ==
ARC-Authentication-Results: i=1; rspamd-76878f7dcc-5q8tz;
 auth=pass smtp.auth=hostpapa smtp.mailfrom=x.arch@epreston.net
X-Sender-Id: hostpapa|x-authuser|x.reply@epreston.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|x.reply@epreston.net
X-MailChannels-Auth-Id: hostpapa
X-Wiry-Fearful: 4e1578f57dd908f4_1699218650936_2058881400
X-MC-Loop-Signature: 1699218650936:1617503382
X-MC-Ingress-Time: 1699218650936
Received: from s147.servername.online (s147.servername.online [204.44.192.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.124.29.22 (trex/6.9.2); Sun, 05 Nov 2023 21:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=epreston.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ylVjOxAdSOmmLfdvsrGVUtgWEHNc9VbZNNbA/AfvLCc=; b=NGRgEcuQj/ou+Y1HALVksfuB8z
 vbRPtijhCKXYJC5JDx/Uus2fkN/w7qOtkPS93D7C5LSldyNo0Cn4z9+DlFq2Ski7Wgv3Nak3BAuDa
 5aJRSlXFNJ5pny6k89YjLSE6aYU5ToogOtZ2qZuL6R5WOyxdtlg88d2wbEyKJauMnwlf++JFV+5el
 5xjcAUr4bQIXdHG9ocoOZbamcQNq0YdCqiVdcKX3XgrVvuL/1D331gO/g67gT4mDH8I1LzYhdXcIp
 mrHqsOjjgJKLQHnSUkamquTt6oF+rZKFGKS01PeJ1NkSNVEslb/CTnxAUQOGbC3VgsU6QlOPzHTCp
 ePRnGvSQ==;
Received: from [50.35.115.28] (port=33364 helo=P70.localdomain)
 by s147.servername.online with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <x.arch@epreston.net>) id 1qzkOO-00AFwT-0M;
 Sun, 05 Nov 2023 13:10:49 -0800
Date: Sun, 5 Nov 2023 13:10:47 -0800
From: Evan Preston <x.arch@epreston.net>
To: Huacai Chen <chenhuacai@kernel.org>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
Message-ID: <ZUgE1_lfux8o7iCp@P70.localdomain>
References: <CAAhV-H64AKdGoHnVLLOYXznpr_aq1jC_TUYXFQRdOjoBxanxkw@mail.gmail.com>
 <c3bb7983-86e4-424e-aadd-e82a0cb6ef37@ristioja.ee>
 <CAAhV-H7UTnTWQeT_qo7VgBczaZo37zjosREr16H8DsLi21XPqQ@mail.gmail.com>
 <CAAhV-H7fJS3-3_hqA4BUdH+q5EG6wSmEoPpO-fUZn5h35O=6OA@mail.gmail.com>
 <31ed0db1-9398-4c46-a391-fc644ec49268@ristioja.ee>
 <CAAhV-H4MekBgYZ1nJ-M7bnpo3bczOMcTanij18ACCALz2svjQQ@mail.gmail.com>
 <ZUSJDG82vzbuyFEY@P70.localdomain>
 <CAAhV-H6GyOnTOm6b8Xp=ySctyE-T905WKDUS2AZuqnEyzM7ZEg@mail.gmail.com>
 <ZUWtTuIcMwwCWg7z@P70.localdomain>
 <CAAhV-H7wnjac1Znr2yh8S2bGwuxF1RRGp=cn9oracrWm6y5VVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7wnjac1Znr2yh8S2bGwuxF1RRGp=cn9oracrWm6y5VVQ@mail.gmail.com>
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

On 2023-11-05 Sun 08:40pm, Huacai Chen wrote:
> Hi, Evan,
> 
> On Sat, Nov 4, 2023 at 10:50 AM Evan Preston <x.arch@epreston.net> wrote:
> >
> > Hi Huacai,
> >
> > On 2023-11-03 Fri 02:36pm, Huacai Chen wrote:
> > > Hi, Evan,
> > >
> > > On Fri, Nov 3, 2023 at 1:54 PM Evan Preston <x.arch@epreston.net> wrote:
> > > >
> > > > Hi Huacai,
> > > >
> > > > On 2023-11-02 Thu 08:38pm, Huacai Chen wrote:
> > > > > Hi, Jaak,
> > > > >
> > > > > On Wed, Nov 1, 2023 at 7:52 PM Jaak Ristioja <jaak@ristioja.ee> wrote:
> > > > > >
> > > > > > On 31.10.23 14:17, Huacai Chen wrote:
> > > > > > > Hi, Jaak and Evan,
> > > > > > >
> > > > > > > On Sun, Oct 29, 2023 at 9:42 AM Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > > > >>
> > > > > > >> On Sat, Oct 28, 2023 at 7:06 PM Jaak Ristioja <jaak@ristioja.ee> wrote:
> > > > > > >>>
> > > > > > >>> On 26.10.23 03:58, Huacai Chen wrote:
> > > > > > >>>> Hi, Jaak,
> > > > > > >>>>
> > > > > > >>>> On Thu, Oct 26, 2023 at 2:49 AM Jaak Ristioja <jaak@ristioja.ee> wrote:
> > > > > > >>>>>
> > > > > > >>>>> On 25.10.23 16:23, Huacai Chen wrote:
> > > > > > >>>>>> On Wed, Oct 25, 2023 at 6:08 PM Thorsten Leemhuis
> > > > > > >>>>>> <regressions@leemhuis.info> wrote:
> > > > > > >>>>>>>
> > > > > > >>>>>>> Javier, Dave, Sima,
> > > > > > >>>>>>>
> > > > > > >>>>>>> On 23.10.23 00:54, Evan Preston wrote:
> > > > > > >>>>>>>> On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
> > > > > > >>>>>>>>> On Fri, Oct 20, 2023 at 5:35 PM Linux regression tracking (Thorsten
> > > > > > >>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > > > > > >>>>>>>>>> On 09.10.23 10:54, Huacai Chen wrote:
> > > > > > >>>>>>>>>>> On Mon, Oct 9, 2023 at 4:45 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> > > > > > >>>>>>>>>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
> > > > > > >>>>>>>>>>>>> On Tue, Sep 26, 2023 at 10:31 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > > > >>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 7:15 PM Linux regression tracking (Thorsten
> > > > > > >>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> > > > > > >>>>>>>>>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
> > > > > > >>>>>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD
> > > > > > >>>>>>>>>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank
> > > > > > >>>>>>>>>>>>>>>> screen after boot until the display manager starts... if it does start
> > > > > > >>>>>>>>>>>>>>>> at all. Using the nomodeset kernel parameter seems to be a workaround.
> > > > > > >>>>>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>>>>> I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4
> > > > > > >>>>>>>>>>>>>>>> ("drivers/firmware: Move sysfb_init() from device_initcall to
> > > > > > >>>>>>>>>>>>>>>> subsys_initcall_sync").
> > > > > > >>>>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things work fine
> > > > > > >>>>>>>>>>>>> again. So I guess the reason:
> > > > > > >>>>>>>>>>
> > > > > > >>>>>>>>>> Well, this to me still looks a lot (please correct me if I'm wrong) like
> > > > > > >>>>>>>>>> regression that should be fixed, as DRM_SIMPLEDRM was enabled beforehand
> > > > > > >>>>>>>>>> if I understood things correctly. Or is there a proper fix for this
> > > > > > >>>>>>>>>> already in the works and I just missed this? Or is there some good
> > > > > > >>>>>>>>>> reason why this won't/can't be fixed?
> > > > > > >>>>>>>>>
> > > > > > >>>>>>>>> DRM_SIMPLEDRM was enabled but it didn't work at all because there was
> > > > > > >>>>>>>>> no corresponding platform device. Now DRM_SIMPLEDRM works but it has a
> > > > > > >>>>>>>>> blank screen. Of course it is valuable to investigate further about
> > > > > > >>>>>>>>> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's effort because
> > > > > > >>>>>>>>> I don't have a same machine.
> > > > > > >>>>>>>
> > > > > > >>>>>>> Side note: Huacai, have you tried working with Jaak to get down to the
> > > > > > >>>>>>> real problem? Evan, might you be able to help out here?
> > > > > > >>>>>> No, Jaak has no response after he 'fixed' his problem by disabling SIMPLEDRM.
> > > > > > >>>>>>
> > > > > > >>>>>
> > > > > > >>>>> I'm sorry, what was it exactly you want me to do? Please be mindful that
> > > > > > >>>>> I'm not familiar with the internals of the Linux kernel and DRI, and it
> > > > > > >>>>> might sometimes take weeks before I have time to work and respond on this.
> > > > > > >>>> It doesn't matter. I hope you can do some experiments to investigate
> > > > > > >>>> deeper. The first experiment you can do is enabling SIMPLEFB (i.e.
> > > > > > >>>> CONFIG_FB_SIMPLE) instead of SIMPLEDRM (CONFIG_DRM_SIMPLEDRM) to see
> > > > > > >>>> whether there is also a blank screen. If no blank screen, that
> > > > > > >>>> probably means SIMPLEDRM has a bug, if still blank screen, that means
> > > > > > >>>> the firmware may pass wrong screen information.
> > > > > > >>>
> > > > > > >>> Testing with 6.5.9 I get a blank screen with CONFIG_DRM_SIMPLEDRM=y and
> > > > > > >>> get no blank screen with CONFIG_FB_SIMPLE=y and CONFIG_DRM_SIMPLEDRM unset.
> > > > > > >> CONFIG_FB_SIMPLE and  CONFIG_DRM_SIMPLEDRM use the same device created
> > > > > > >> by sysfb_init(). Since FB_SIMPLE works fine, I think the real problem
> > > > > > >> is that DRM_SIMPLEDRM has a bug. The next step is to enable
> > > > > > >> CONFIG_DRM_SIMPLEDRM and trace its initialization. In detail, adding
> > > > > > >> some printk() in simpledrm_probe() and its sub-routines to see where
> > > > > > >> the driver fails. The output of these printk() can be seen by the
> > > > > > >> 'dmesg' command after boot.
> > > > > > > I need your help. I tried with my laptop (ThinkPad E490, Intel Core
> > > > > > > i3-8145U, UHD Graphics 620) but I can't reproduce your problem. So
> > > > > > > please patch your 6.5.x kernel with this temporary patch [1], then
> > > > > > > build a "bad kernel" with SIMPLEDRM enabled. And after booting your
> > > > > > > machine with this "bad kernel", please give me the dmesg output. Thank
> > > > > > > you very much.
> > > > > > >
> > > > > > > [1] http://ddns.miaomiaomiao.top:9000/download/kernel/patch-6.5.9
> > > > > >
> > > > > > I'm unable to download it. Can you please send it by e-mail?
> > > > > I'm sorry, please download from attachment.
> > > >
> > > > When applying this patch the first hunk (drivers/firmware/sysfb.c) fails for
> > > > me with 6.5.9.  Attempting to load the 6.5.9 kernel without this patch
> > > > produces no dmesg output on my machine.
> > > You copy-paste the patch? If you download it directly it can be
> > > applied successfully, I think.
> >
> > The patch downloaded from your URL applies successfully.  However, I still
> > see no dmesg output using the patched 6.5.9 kernel.  'journalctl -k -b all'
> > shows no dmesg output from any 6.5.x boots, only from 6.4.12 boots.
> Thank you for your testing. Since you cannot boot to GUI successfully
> as Jaak, you may have some troubles with getting the dmesg output. But
> you can try to use "systemd.unit=multi-user.target" boot parameters.
> In this way you may boot to the login: prompt and then you can get
> dmesg output. Or if you still fail, you may use 'jornalctl -k -b -1'
> to get the previous dmesg output with 6.4.12.

I get a blank screen immediately after selecting a 6.5.x boot loader entry 
even using the 'systemd.unit=multi-user.target' boot parameter.  'jornalctl 
-k -b -1' from a successful 6.4.12 boot after a failed 6.5.x boot shows only 
the previous successful 6.4.12 boot's dmesg from two boots ago and nothing 
from the failed 6.5.x boot.  In case it's of any use my 6.4.12 dmesg is 
here: http://epreston.net/dmesg-6.4.12

Evan

> 
> Hi, Jaak,
> 
> Have you tested? I think you can successfully get a dmesg output with my patch.
> 
> >
> > Evan
> >
> > >
> > > Huacai
> > >
> > > >
> > > > Evan
> > > >
> > > > >
> > > > > Huacai
> > > > >
> > > > > >
> > > > > > Jaak
> > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Huacai
> > > > > > >
> > > > > > >>
> > > > > > >> Huacai
> > > > > > >>
> > > > > > >>>
> > > > > > >>> Jaak
> > > > > > >>>
> > > > > > >>>>
> > > > > > >>>> Huacai
> > > > > > >>>>
> > > > > > >>>>>
> > > > > > >>>>> Jaak
> > > > > > >>>>>
> > > > > > >>>>>>>
> > > > > > >>>>>>> But I write this mail for a different reason:
> > > > > > >>>>>>>
> > > > > > >>>>>>>> I am having the same issue on a Lenovo Thinkpad P70 (Intel
> > > > > > >>>>>>>> Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) i7-6700HQ).
> > > > > > >>>>>>>> Upgrading from Linux 6.4.12 to 6.5 and later results in only a blank
> > > > > > >>>>>>>> screen after boot and a rapidly flashing device-access-status
> > > > > > >>>>>>>> indicator.
> > > > > > >>>>>>>
> > > > > > >>>>>>> This additional report makes me wonder if we should revert the culprit
> > > > > > >>>>>>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() from
> > > > > > >>>>>>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). But I guess that
> > > > > > >>>>>>> might lead to regressions for some users? But the patch description says
> > > > > > >>>>>>> that this is not a common configuration, so can we maybe get away with that?
> > > > > > >>>>>>    From my point of view, this is not a regression, 60aebc9559492c
> > > > > > >>>>>> doesn't cause a problem, but exposes a problem. So we need to fix the
> > > > > > >>>>>> real problem (SIMPLEDRM has a blank screen on some conditions). This
> > > > > > >>>>>> needs Jaak or Evan's help.
> > > > > > >>>>>>
> > > > > > >>>>>> Huacai
> > > > > > >>>>>>>
> > > > > > >>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > > > > > >>>>>>> --
> > > > > > >>>>>>> Everything you wanna know about Linux kernel regression tracking:
> > > > > > >>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
> > > > > > >>>>>>> If I did something stupid, please tell me, as explained on that page.
> > > > > > >>>>>>>
> > > > > > >>>>>>>>>>>>> When SIMPLEDRM takes over the framebuffer, the screen is blank (don't
> > > > > > >>>>>>>>>>>>> know why). And before 60aebc9559492cea6a9625f ("drivers/firmware: Move
> > > > > > >>>>>>>>>>>>> sysfb_init() from device_initcall to subsys_initcall_sync") there is
> > > > > > >>>>>>>>>>>>> no platform device created for SIMPLEDRM at early stage, so it seems
> > > > > > >>>>>>>>>>>>> also "no problem".
> > > > > > >>>>>>>>>>>> I don't understand above. You mean that after that commit the platform
> > > > > > >>>>>>>>>>>> device is also none, right?
> > > > > > >>>>>>>>>>> No. The SIMPLEDRM driver needs a platform device to work, and that
> > > > > > >>>>>>>>>>> commit makes the platform device created earlier. So, before that
> > > > > > >>>>>>>>>>> commit, SIMPLEDRM doesn't work, but the screen isn't blank; after that
> > > > > > >>>>>>>>>>> commit, SIMPLEDRM works, but the screen is blank.
> > > > > > >>>>>>>>>>>
> > > > > > >>>>>>>>>>> Huacai
> > > > > > >>>>>>>>>>>>
> > > > > > >>>>>>>>>>>> Confused...
> > > > > > >>>>>>>>>>>>
> > > > > > >>>>>>>>>>>> --
> > > > > > >>>>>>>>>>>> An old man doll... just what I always wanted! - Clara
> > > > > > >>>>>>>>>>>
> > > > > > >>>>>>>>>>>
> > > > > > >>>>>>>>
> > > > > > >>>>>>>>
> > > > > > >>>>>
> > > > > > >>>
> > > > > >
> > > >
> > > >
