Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431404A9962
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 13:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA23710F8EF;
	Fri,  4 Feb 2022 12:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798B810F8EF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mzxF9rMeHdGHwkTPDimCxRmilWqf6MiwMi9qg5Sr64g=; b=vl3i11hF8iQy1h0Ag1YRBLQAG7
 dAUWYNtSwGnV/h/3SZGvDI79vCb1IEbbtu1UQ3FfZta2TTQ2uI3cfSWVhx6A7bIW/Wj5SVNcGD6XY
 418/0rcrILwiuHAWq2bEWrG3CtJrTzBtQ1S0fQbDDKu7PuyDjJWcpusaTPiE+f8BhmPgO0W9dxqG4
 ANF4a80aclwToWxEzEbz1ZbszC59Wpan34MN2z1REh6gVUGqTNlsaxyfNT/K03UeG6PDgF8dQPSMY
 lB6C1Kf71mwm4Og/bizKfCFlky7D1xuMSKf6R6BoJmtueaOi3urC0I9J+3NpAOum1WYjEIoCK3VOg
 bTdYh5bg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57040)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nFxk9-0004Zj-N4; Fri, 04 Feb 2022 12:31:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nFxk2-0004yb-7L; Fri, 04 Feb 2022 12:31:06 +0000
Date: Fri, 4 Feb 2022 12:31:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
Message-ID: <Yf0cihUQ1byjnh3d@shell.armlinux.org.uk>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <Yf0Wm1kOV1Pss9HJ@shell.armlinux.org.uk>
 <ad56e88206a8d66b715035362abe16ece0bde7d3.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad56e88206a8d66b715035362abe16ece0bde7d3.camel@perches.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Wang Kefeng <wangkefeng.wang@huawei.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 verdun@hpe.com, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, netdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, Hao Fang <fanghao11@huawei.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Corey Minyard <minyard@acm.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-gpio@vger.kernel.org,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, nick.hawkins@hpe.com,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 04, 2022 at 04:18:24AM -0800, Joe Perches wrote:
> On Fri, 2022-02-04 at 12:05 +0000, Russell King (Oracle) wrote:
> > On Wed, Feb 02, 2022 at 10:52:50AM -0600, nick.hawkins@hpe.com wrote:
> > > +	if (readb_relaxed(timer->control) & MASK_TCS_TC) {
> > > +		writeb_relaxed(MASK_TCS_TC, timer->control);
> > > +
> > > +		event_handler = READ_ONCE(timer->evt.event_handler);
> > > +		if (event_handler)
> > > +			event_handler(&timer->evt);
> > > +		return IRQ_HANDLED;
> > > +	} else {
> > > +		return IRQ_NONE;
> > > +	}
> > > +}
> 
> It's also less indented code and perhaps clearer to reverse the test
> 
> 	if (!readb_relaxed(timer->control) & MASK_TCS_TC)

This will need to be:

 	if (!(readb_relaxed(timer->control) & MASK_TCS_TC))

> 		return IRQ_NONE;
> 
> 	writeb_relaxed(MASK_TCS_TC, timer->control);
> 
> 	event_handler = READ_ONCE(timer->evt.event_handler);
> 	if (event_handler)
> 		event_handler(&timer->evt);
> 
> 	return IRQ_HANDLED;
> 
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
