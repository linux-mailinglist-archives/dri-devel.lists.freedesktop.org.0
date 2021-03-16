Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ECA33E0D2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 22:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37633899B5;
	Tue, 16 Mar 2021 21:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D83D899B5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 21:51:29 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id d5so14162909iln.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 14:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6sggz0cW6S5oWFTZs2rV+TqaEbdoBcz8RBGBjA8S3b8=;
 b=SHkS8KAUZy8RrgXcg6clA3XB5I/I5eivqErQFoa4lUAheHnTfNBeMo3Y1WDKVQTFhZ
 GQ8ba2k05PgdIkQQF7bgUYZbAtI/lRAoKRYSdn9rx/eWvdMHC1abpWIADvqm131F7iQn
 dEqNVf1d6NP26THtEyW76PDwdg2jVaghbqaZGEfQN0YZuk6jO2F5Zb/iXfDPnOBz1tBx
 i3R1mAB5VZfG1xaiWu1kASZy1F3Xh+bI6x8TIGwOuW2pQ3qs6GEZluRqeYHU2SDAe7+Q
 BTq/4mekwxWesy9vwHU5fwkWDSjYkAmKGtb5WLqdOIRNYhyJTvi8l5PTqz1NNLzbJw/v
 yjJQ==
X-Gm-Message-State: AOAM531aUUZW+YICb9vK2ZwmRYe5cTkuXdaxVQkiZVcDicveurC857Os
 Zml87TrQ8J5vANyiP3tpcg==
X-Google-Smtp-Source: ABdhPJwsSv9g0C0LxRsIhgTNLhkUz3c9irY8ZHBA/9wlz76whYv3hXMw4HFmiG/1sHtqi21CBxGXRw==
X-Received: by 2002:a05:6e02:dce:: with SMTP id
 l14mr5298695ilj.102.1615931488394; 
 Tue, 16 Mar 2021 14:51:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b12sm10054845ilr.55.2021.03.16.14.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 14:51:27 -0700 (PDT)
Received: (nullmailer pid 3739030 invoked by uid 1000);
 Tue, 16 Mar 2021 21:51:23 -0000
Date: Tue, 16 Mar 2021 15:51:23 -0600
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Message-ID: <20210316215123.GA3712408@robh.at.kernel.org>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-2-sebastian.reichel@collabora.com>
 <YDQgLTPE0E+/1Cwv@piout.net> <YDQhgkftoW4J9AtY@piout.net>
 <20210223012657.bbp5u65nw4tpcjgd@earth.universe>
 <20210306195645.GA1112592@robh.at.kernel.org>
 <20210308140358.diolcpbaq7gow3y4@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308140358.diolcpbaq7gow3y4@earth.universe>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 08, 2021 at 03:03:58PM +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Sat, Mar 06, 2021 at 11:56:45AM -0800, Rob Herring wrote:
> > On Tue, Feb 23, 2021 at 02:26:57AM +0100, Sebastian Reichel wrote:
> > > On Mon, Feb 22, 2021 at 10:26:26PM +0100, Alexandre Belloni wrote:
> > > > On 22/02/2021 22:20:47+0100, Alexandre Belloni wrote:
> > > > > On 22/02/2021 18:12:42+0100, Sebastian Reichel wrote:
> > > > > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > > > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > > > > used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> > > > > > the clock is disabled and all i.MX6 functionality depending on
> > > > > > the 32 KHz clock has undefined behaviour. On systems using hardware
> > > > > > watchdog it seems to likely trigger a lot earlier than configured.
> > > > > > 
> > > > > > The proper solution would be to describe this dependency in DT,
> > > > > > but that will result in a deadlock. The kernel will see, that
> > > > > > i.MX6 system clock needs the RTC clock and do probe deferral.
> > > > > > But the i.MX6 I2C module never becomes usable without the i.MX6
> > > > > > CKIL clock and thus the RTC's clock will not be probed. So from
> > > > > > the kernel's perspective this is a chicken-and-egg problem.
> > > > > > 
> > > > > 
> > > > > Reading the previous paragraph, I was going to suggest describing the
> > > > > dependency and wondering whether this would cause a circular dependency.
> > > > > I guess this will keep being an issue for clocks on an I2C or SPI bus...
> > > 
> > > Yes, it is a circular dependency on this particular system on
> > > module. It only works because the RTC enables the clock by
> > > default. The i.MX6 CKIL is expected to be always enabled.
> > 
> > I think you should describe the circular clocking and then provide a way 
> > to break the dependency.
> 
> This is very much not trivial. The clock is required during early
> initialization of the i.MX. At this point we are far from probing
> I2C drivers and without the I2C driver the clock is not registered.
> The current i.MX code expects the system clocks to be fixed clocks,
> since they must be enabled before any code is executed (incl.
> bootloader) and must never be disabled. From a HW design point of
> view it does not make sense to have a SW controllable clock for it,
> since it just adds extra cost. I believe for QMX6 it is only SW
> controllable, because that avoids the need for an extra crystal.
> 
> So how is the clock framework supposed to know, that it can ignore
> the clock during registration? I see the following options:
> 
> 1. My solution is the simplest one. Keep i.MX clock code the same
>    (it assumes a fixed-clock being used for CKIL) and avoid
>    registering RTC clock. This basically means the RTC is considered
>    to be a fixed-clock on this system, which is what the HW designers
>    seemed to have in mind (vendor kernel for the QMX6 is old enough
>    (4.9.x) to not to have CLK feature in the RTC driver. Vendor
>    U-Boot also does not touch the RTC. Booting mainline kernel once
>    bricks QMX6 boards until RTC battery is removed, so one could
>    actually argue addition of the CLK feature in 1373e77b4f10 (4.13)
>    is a regression). Currently Qualcomm device uses "protected-clocks"
>    for FW controlled clocks where Linux would crash the system by
>    trying to access them. IMHO the RTC is similar, since disabling
>    or modifying its frequency on QMX6 results in undefined behaviour
>    and possibly system crash.
> 
> 2. Make i.MX clock code use the RTC as CKIL clock provider, but
>    ignore it somehow. I see three sub-options:
> 
> 2.1. Add a property 'boot-enabled' to the RTC node, so that the
>      clock framework is aware of clock being enabled. This can
>      be used to satisfy clock dependencies somehow.
> 
> 2.2. The RTC device is not probed without I2C bus, but the driver
>      could also register a fake clock purely based on DT
>      information by adding some early init hook and take over
>      the clock once the I2C part is being probed. I think this
>      is a bad idea regarding maintainability of the driver.
>      Also for systems not using the RTC clock, the early clock
>      registration is basically wrong: If the kernel disables
>      the RTC it will stay disabled across boots if the RTC has
>      a backup battery. Basically we cannot imply anything from
>      the RTC compatible value alone.
> 
> 2.3 The i.MX core code could request CKIL with some flag, that
>     it's fine to have an unresolvable clock and just expect it
>     to be boot-enabled. The rationale would be, that CKIL must
>     be always-enabled.

I think 2.1 or 2.3 is fine. It boils down to detecting a cycle and then 
either you have a property or implicitly know to ignore a dependency.

> > It's a somewhat common issue.
> 
> It is? This only works, because one can treat the RTC's clock
> output like a fixed clock by not messing around with it.

Well, it's not the first time I've heard of the issue. Audio clocks are 
another example, but a bit different in that the clocks aren't needed 
until later. It's also come up in context of fw_devlinks which I 
think has some cycle breaking logic already.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
