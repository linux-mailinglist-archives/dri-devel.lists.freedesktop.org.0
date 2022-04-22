Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F4350C49D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 01:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7838910E0A4;
	Fri, 22 Apr 2022 23:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71CE10E0A4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 23:41:53 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e5c42b6e31so10188397fac.12
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 16:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vXMx7OeCBZiIeZrs0uT2oDD68NpfAYuJIOJDA5UqsVw=;
 b=OE+X+9KI+J3rDIF1JCA5QGO/m7/xfFwF2sxGgwIVvBiiJHzRiywUg/fAcqzx0YWiJI
 eh8IapCSFTaVXeWf+ZvDrR2+BrHHjFGTAfKIdJh2sb0tIGaCJgQyR9/pN5/yEtx010Yl
 4OYNQeWUC/ZrIOHPVnMz7XJjKJqjuvA05ydXM6CXgYlWOskKHs4B7XuiIrFGYXXhbOb/
 BG5emwoOMdYDm95oQ5PHJbcZQjKJCGdgulxHS59A2rkRJQtlgLmpBIlWDLRGtKc1APUl
 IDdSv6jkJKINjLMsVNTPOVLI5j/vmC/UyfxOhE1zqnXY+nEXUgliUWLv7mvcIM0rld3T
 wIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=vXMx7OeCBZiIeZrs0uT2oDD68NpfAYuJIOJDA5UqsVw=;
 b=mrYiM5yqVTvOTHrw5gOQSBuoALnjBncDqfaSQAJYPRXHa8bNXU99l6rdFenatNc2UI
 oBQNxTnyr8Jd93zkRDynSh/q4JL0qTjZMxKu8ZUcaB+7P+mNfBtKw1hI8Yop8gVT4PmB
 4OTvte6zDxg8/M9RPR/DqqJx2YQErfHHcG42MiuO4mIJh8lRhjvDG8Z+tpQUW1xZrcVh
 mPm0UcsQ6iVdGab/n5Bm2HzsYRD00yqLu0ww01K3uOs/oRHtKm/eZvlGSgPFr/4bZS6V
 kGvoPNsAI8/69O9E3yx02WBhneJOGtCLFvUqNBTTPwxeTlaYglK+8wxPhkez1PocGtcA
 BqmQ==
X-Gm-Message-State: AOAM531dj6appjbbv4BLfrDdf1+AnPJCAN9Di9BJJgG3Q2vqIIpY8NB0
 32YMCx9ZYicMjZjQRWLfz0g=
X-Google-Smtp-Source: ABdhPJyscCRuk9Ea7h4lpY7o125V/lHv8txlEhwT9ckOWkPAGsKVkDIX2wFpL7GtQIz+VTOwStMu1g==
X-Received: by 2002:a05:6870:2404:b0:e2:8913:98d7 with SMTP id
 n4-20020a056870240400b000e2891398d7mr6986276oap.16.1650670913075; 
 Fri, 22 Apr 2022 16:41:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a4a9250000000b0033a7783dda8sm1373161ooh.48.2022.04.22.16.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 16:41:51 -0700 (PDT)
Date: Fri, 22 Apr 2022 16:41:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Message-ID: <20220422234150.GA3442771@roeck-us.net>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Sergey Lapin <slapin@ossfans.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
> On Fri, Apr 22, 2022 at 10:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 4/22/22 12:16, Arnd Bergmann wrote:
> > > On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > Which machine did you hit this on? Is this on hardware or in qemu?
> > >
> > qemu, as always. borzoi, spitz, terrier, tosa, z2, and sx1 fail.
> > Also, I just noticed that the failure is not always the same.
> > z2 fails to boot from initrd, and sx1 fails to boot completely.
> 
> That's a lot of machines failing, I hope at least we got the same bugs more
> than once here.
> 
> For the I/O space, I found now that PXA was not using the standard
> virtual I/O address yet, but instead used a NULL-based offset.
> 
> I'm not entirely happy with this patch, but this is an outline of what
> I think we need to fix that: https://pastebin.com/3nVgQsEw
> This one is probably incomplete, at least it breaks sa1100 for now,
> and it adds a bogus CONFIG_PCI dependency. I'm also not sure
> in what way the last patch in the series triggers it, rather than the
> one that removed mach/io.h.
> 
> I had sx1 booting in qemu at least, with the omap1 multiplatform series only.
> If you have a custom config for this one, make sure you get the right
> DEBUG_LL address.
> 
> > I'll do another round of bisects.
> 

Here is the bisect for the sx1 boot failure.

Guenter

---
# bad: [e7d6987e09a328d4a949701db40ef63fbb970670] Add linux-next specific files for 20220422
# good: [b2d229d4ddb17db541098b83524d901257e93845] Linux 5.18-rc3
git bisect start 'HEAD' 'v5.18-rc3'
# bad: [479506a21bd2df998017a00f4fe0ea893039d9d0] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
git bisect bad 479506a21bd2df998017a00f4fe0ea893039d9d0
# bad: [84fdc506ff63f3f8eb7feaac87821c39bf1dbdfd] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
git bisect bad 84fdc506ff63f3f8eb7feaac87821c39bf1dbdfd
# bad: [0318e72d28be01b99056a7e66572423682eae2bb] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
git bisect bad 0318e72d28be01b99056a7e66572423682eae2bb
# good: [813d98e2e26d3f418d925263a82d72d1454b326e] Merge branch 'zstd-linus' of https://github.com/terrelln/linux.git
git bisect good 813d98e2e26d3f418d925263a82d72d1454b326e
# bad: [5e87f91cfe6e938eccb88a992687e2ac52eec2a7] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
git bisect bad 5e87f91cfe6e938eccb88a992687e2ac52eec2a7
# bad: [ac4b03d5ad6b887558eb94943f0f2834661dee45] Merge branch 'pxa-multiplatform-5.18' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc into arm/multiplatform-late
git bisect bad ac4b03d5ad6b887558eb94943f0f2834661dee45
# good: [6eab9bfd712f63c0977f2d38a45f321816030707] Merge branch 'omap1/multiplatform-prep' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc into arm/multiplatform
git bisect good 6eab9bfd712f63c0977f2d38a45f321816030707
# good: [ac571609a9fab9b94bbd8e634ba20e2ab672e32d] input: touchscreen: mainstone: sync with zylonite driver
git bisect good ac571609a9fab9b94bbd8e634ba20e2ab672e32d
# good: [77b9aeb6e3cd4de6b320d3a9be5d692594159f9e] ARM: pxa: remove unused mach/bitfield.h
git bisect good 77b9aeb6e3cd4de6b320d3a9be5d692594159f9e
# good: [7643a9ca9f8e08f71e15f89dd74863635e981e03] ARM: pxa: convert to multiplatform
git bisect good 7643a9ca9f8e08f71e15f89dd74863635e981e03
# good: [bdfb692acfa98c3e8135ab44bc8366636443590a] [MERGED] ASoC: ti: osk5912: Make it CCF clk API compatible
git bisect good bdfb692acfa98c3e8135ab44bc8366636443590a
# bad: [b59e8a5fd321fe44bdabd38908b4f899f933cf0f] [TO BE REBASED] ARM: omap1: enable multiplatform
git bisect bad b59e8a5fd321fe44bdabd38908b4f899f933cf0f
# good: [4c4467ac74299b14b8cf74406722af8090aa7766] [TO BE REBASED] ARM: OMAP1: clock: Convert to CCF
git bisect good 4c4467ac74299b14b8cf74406722af8090aa7766
# first bad commit: [b59e8a5fd321fe44bdabd38908b4f899f933cf0f] [TO BE REBASED] ARM: omap1: enable multiplatform
