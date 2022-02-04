Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D967F4A9929
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 13:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A4910F454;
	Fri,  4 Feb 2022 12:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3.hostedemail.com (relay3.hostedemail.com [64.99.140.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D0A10E922
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 12:18:52 +0000 (UTC)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id CDA3723327;
 Fri,  4 Feb 2022 12:18:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf14.hostedemail.com (Postfix) with ESMTPA id 90F8A2D; 
 Fri,  4 Feb 2022 12:18:11 +0000 (UTC)
Message-ID: <ad56e88206a8d66b715035362abe16ece0bde7d3.camel@perches.com>
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
From: Joe Perches <joe@perches.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, nick.hawkins@hpe.com
Date: Fri, 04 Feb 2022 04:18:24 -0800
In-Reply-To: <Yf0Wm1kOV1Pss9HJ@shell.armlinux.org.uk>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <Yf0Wm1kOV1Pss9HJ@shell.armlinux.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=2.74
X-Stat-Signature: sr19sijeo6q79z8ey9jcj9w15gn7bijc
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 90F8A2D
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/fXooa1LZuZOlkfFu/TpMmSAbR8ShcuZI=
X-HE-Tag: 1643977091-269336
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
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Corey Minyard <minyard@acm.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-gpio@vger.kernel.org,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
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

On Fri, 2022-02-04 at 12:05 +0000, Russell King (Oracle) wrote:
> On Wed, Feb 02, 2022 at 10:52:50AM -0600, nick.hawkins@hpe.com wrote:
[]
> > diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
[]
> > +static irqreturn_t gxp_time_interrupt(int irq, void *dev_id)
> > +{
> > +	struct gxp_timer *timer = dev_id;
> > +	void (*event_handler)(struct clock_event_device *timer);
> > +
> > +
> 
> One too many blank lines.
> 
> > +	if (readb_relaxed(timer->control) & MASK_TCS_TC) {
> > +		writeb_relaxed(MASK_TCS_TC, timer->control);
> > +
> > +		event_handler = READ_ONCE(timer->evt.event_handler);
> > +		if (event_handler)
> > +			event_handler(&timer->evt);
> > +		return IRQ_HANDLED;
> > +	} else {
> > +		return IRQ_NONE;
> > +	}
> > +}

It's also less indented code and perhaps clearer to reverse the test

	if (!readb_relaxed(timer->control) & MASK_TCS_TC)
		return IRQ_NONE;

	writeb_relaxed(MASK_TCS_TC, timer->control);

	event_handler = READ_ONCE(timer->evt.event_handler);
	if (event_handler)
		event_handler(&timer->evt);

	return IRQ_HANDLED;


