Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A46167BB2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C896F3F4;
	Fri, 21 Feb 2020 11:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 215F889B18
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 15:09:06 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id DE1ED8080;
 Thu, 20 Feb 2020 15:09:48 +0000 (UTC)
Date: Thu, 20 Feb 2020 07:09:01 -0800
From: Tony Lindgren <tony@atomide.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] backlight: add led-backlight driver
Message-ID: <20200220150901.GG37466@atomide.com>
References: <20200219191412.GA15905@amd> <20200219194540.GD37466@atomide.com>
 <20200220074849.GF3494@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220074849.GF3494@dell>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
Cc: daniel.thompson@linaro.org, mpartap@gmx.net, jingoohan1@gmail.com,
 merlijn@wizzup.org, martin_rysavy@centrum.cz,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 sre@kernel.org, nekit1000@gmail.com, tomi.valkeinen@ti.com,
 Pavel Machek <pavel@ucw.cz>, jjhiblot@ti.com, linux-omap@vger.kernel.org,
 agx@sigxcpu.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Lee Jones <lee.jones@linaro.org> [200220 07:49]:
> On Wed, 19 Feb 2020, Tony Lindgren wrote:
> 
> > * Pavel Machek <pavel@ucw.cz> [200219 19:15]:
> > > From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > 
> > > This patch adds a led-backlight driver (led_bl), which is similar to
> > > pwm_bl except the driver uses a LED class driver to adjust the
> > > brightness in the HW. Multiple LEDs can be used for a single backlight.
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > > Acked-by: Pavel Machek <pavel@ucw.cz>
> > > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > Acked-by: Lee Jones <lee.jones@linaro.org>
> > > Acked-by: Tony Lindgren <tony@atomide.com>
> > > Tested-by: Tony Lindgren <tony@atomide.com>
> > > Signed-off-by: Pavel Machek <pavel@ucw.cz>
> > > ---
> > >  drivers/video/backlight/Kconfig  |   7 ++
> > >  drivers/video/backlight/Makefile |   1 +
> > >  drivers/video/backlight/led_bl.c | 260 +++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 268 insertions(+)
> > >  create mode 100644 drivers/video/backlight/led_bl.c
> > > 
> > > Hi!
> > > 
> > > Here's the version of the driver I have. AFAICT
> > > default-brightness-level handling is ok, so does not need to be
> > > changed.
> > > 
> > > Lee, it would be easiest for me if you could apply it to your tree and
> > > push, but given enough time I can push it to Linus, too.
> > 
> > Oh you're using quoted-printable for patches.. Got it applied now,
> > and it still works. Below is also the related dts change that
> > I tested with.
> > 
> > Feel free to pick the dts change too, naturally that should
> > not be applied before the driver.
> > 
> > If you guys instead want me to pick these both into my fixes
> > branch, just let me know and I'll do the explaining why these
> > are needed as fixes. Basically we no longer have a way to enable
> > the LCD backlight for droid4 manually starting with v5.6-rc1
> > unlike earlier.
> 
> Please do.  You already have my Ack.

OK pushed out these two patches in omap-for-v5.6/droid4-lcd-fix.

Thanks,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
