Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 044DA24AFB3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5726E8D6;
	Thu, 20 Aug 2020 07:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 713 seconds by postgrey-1.36 at gabe;
 Wed, 19 Aug 2020 19:01:56 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825BA6E7D0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 19:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597863714;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=C5Ocf5cf2r9DFqDayZ8Rj28GvUk3OaCfegnRlwSIHaw=;
 b=mOh13l7v2h50sUUcn9D4yQVdbpnM+FknZpyVX2TnTGL1jAAc90+UvYSH++ljjLAtPn
 Au3aeLLRcBTL0wrqfy2a+vVabvmZcGM0NpPmFp2KLBNn1nYQUudX3XcUteip3wEbot92
 rS/e7KNB8NvSCRXGcXg2/GvMHi+OXTeVSIBDTL3KpWC6xDQdf+kwwrdjNbWvmCOfM5MP
 csfmLr9z+CV55BH+95xJIgI5IGzy7FzfXN5U3DRaTVfwyO1VzjTC3wvMqtpJGQ6P1C5b
 TQHe8Y49bTkiC1wyb2sBXDtibrw5gCCGhsiA7QrS/HGOXjVbCIGoEhwVgMFc04O9L2CD
 WSBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMgw42A"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id n03b0dw7JInn6UR
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 19 Aug 2020 20:49:49 +0200 (CEST)
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAAEAJfBHBqT9Lv5zMaizJLnz=L5+Z3RvYoDf=Ex09_PDSUGe5g@mail.gmail.com>
Date: Wed, 19 Aug 2020 20:49:49 +0200
Message-Id: <4362AD3D-B072-480E-B424-28A7C9F8061B@goldelico.com>
References: <1940005.XIBaf5lNV5@jeremy> <7086465.UhkgK7rEtT@jason>
 <32cb6f50-1fe1-1484-0512-04590882d35a@baylibre.com>
 <3158508.CFMi0AOM4G@jason>
 <CAAEAJfBHBqT9Lv5zMaizJLnz=L5+Z3RvYoDf=Ex09_PDSUGe5g@mail.gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Paul Boddie <paul@boddie.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ezequiel,

> Am 19.08.2020 um 12:21 schrieb Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>:
> 
> Hello,
> 
> First of all, I'd like to thank everyone for the great work
> on ingenic-drm. The driver is in very good shape
> and a pleasure to work with.
> 
> Yesterday, I checked out branch "paulb-jz4780-ci20-hdmi-5.8-rc5",
> from git.goldelico.com/letux-kernel.git, rebased it on v5.9-rc1,
> and then run weston over HDMI (how often
> weston runs on mips, uh? :)

Wow!

> The edid of my monitor is properly read
> and modetest reports all modes.
> 
> I've only tested the primary plane, for some reason
> the overlay is not working as expected, but it must
> be probably some minor thing.
> 
> As for the bus format, I have just added a skip
> for CONNECTOR_HDMIA types in the encoder
> atomic check. And then MEDIA_BUS_FMT_RGB888_1X24
> is hardcoded if there are no bus formats negotiated

Cool!

> Paul et al, if you guys can rebase your work on v5.9-rc1
> and Cc I will be happy to review and test the patches.

I have tried our latest letux-5.9-rc1 tree (with Pauls fixes)
on my setup but screen remains black and the kernel was stuck
after showing "login:" and reported

[  490.680469] rcu: INFO: rcu_preempt self-detected stall on CPU

Maybe, can you share your rebased tree to clearly identify the
subtle differences? Maybe I have broken something by the rebase.

> Cheers & thanks again,
> Eze

Thanks and best regards,
Nikolaus


> 
> 
> 
> 
> On Tue, 7 Jul 2020 at 04:27, Paul Boddie <paul@boddie.org.uk> wrote:
>> 
>> On Monday, 6 July 2020 14:12:24 CEST Neil Armstrong wrote:
>>> 
>>> On 06/07/2020 01:57, Paul Boddie wrote:
>>>> 
>>>> It also seems to be appropriate to set the input_bus_format on the
>>>> platform- specific HDMI driver; otherwise, I doubt that appropriate bus
>>>> encodings will be chosen in the Synopsys driver.
>>> 
>>> It does but when not provided, it doesn't use it.
>>> 
>>> It's handled in drm_atomic_bridge_chain_select_bus_fmts() :
>>>      if (conn->display_info.num_bus_formats &&
>>>                  conn->display_info.bus_formats)
>>>              out_bus_fmts[0] = conn->display_info.bus_formats[0];
>>>      else
>>>              out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
>> 
>> OK. I thought I'd seen this somewhere, but I had started to think that
>> input_bus_format would remain initialised (presumably to zero) and this would
>> then cause the Synopsys driver to not change the bus format to the actual
>> default.
>> 
>> [...]
>> 
>>>> Testing against 5.8-rc3 with the above changes seems to have moved the
>>>> needle slightly. Although I still get "Input not supported" from my
>>>> monitor, running modetest now gives a different error:
>>>> 
>>>> modetest -D /dev/dri/card0 -M ingenic-drm -s 34@32:1280x1024-60.02
>>>> 
>>>> ...now yields this:
>>>> 
>>>> setting mode 1280x1024-60.02Hz@XR24 on connectors 34, crtc 32
>>>> failed to set gamma: Invalid argument
>>> 
>>> This is because you don't provide the gamma setup ioctl, it's not a fatal
>>> error at all. It should be warning since it's optional.
>>> 
>>> Did you check all modes ?
>> 
>> I have checked a few more. Currently, testing them is awkward because it
>> involves switching my monitor to DVI input, getting "Input Not Supported",
>> unplugging the cable, and then the hotplug event has most likely caused a bad
>> pointer dereference in ingenic_drm_crtc_atomic_flush and thus a kernel panic.
>> 
>> So, I'll try and fix this panic, which appears to be due to the DRM driver
>> accessing a null framebuffer pointer (presumably having been invalidated
>> elsewhere upon unplugging), and see if I can't get some more information about
>> the state of the peripherals.
>> 
>> Paul
>> 
>> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
