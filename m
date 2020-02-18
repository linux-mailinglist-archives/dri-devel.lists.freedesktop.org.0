Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64025163EE3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286606EB24;
	Wed, 19 Feb 2020 08:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id D38426EA16
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 14:14:57 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 0EB0C8043;
 Tue, 18 Feb 2020 14:15:39 +0000 (UTC)
Date: Tue, 18 Feb 2020 06:14:52 -0800
From: Tony Lindgren <tony@atomide.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: LED backlight on Droid 4 and others
Message-ID: <20200218141452.GF35972@atomide.com>
References: <20200105183202.GA17784@duo.ucw.cz> <20200106084549.GA14821@dell>
 <20200211172900.GH64767@atomide.com> <20200212201638.GB20085@amd>
 <20200218135219.GC3494@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218135219.GC3494@dell>
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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

* Lee Jones <lee.jones@linaro.org> [200218 13:52]:
> On Wed, 12 Feb 2020, Pavel Machek wrote:
> 
> > Hi!
> > 
> > > > > It would be good to get LED backlight to work in clean way for 5.6
> > > > > kernel.
> > > ...
> > > > > [If you have an idea what else is needed, it would be welcome; it
> > > > > works for me in development tree but not in tree I'd like to
> > > > > upstream.]
> > > > > 
> > > > > Lee, would you be willing to take "backlight: add led-backlight
> > > > > driver"? Would it help if I got "leds: Add managed API to get a LED
> > > > > from a device driver" and "leds: Add of_led_get() and led_put()" into
> > > > > for_next tree of the LED subsystem?
> > > > 
> > > > It looks like you have an open question from Tony on v10.
> > > > 
> > > > Is that patch orthogonal, or are there depend{ants,encies}?
> > > 
> > > Uhh looks like we messed up a bit with integration. Now droid4
> > > LCD backlight can no longer be enabled at all manually in v5.6-rc1
> > > without the "add led-backlight driver" patch.. Should we just
> > > merge it to fix it rather than start scrambling with other
> > > temporary hacks?
> > 
> > We should just merge the "add led-backlight driver". Everything should
> > be ready for it. I'm sorry if I broke something working, I was not
> > aware it worked at all.
> > 
> > Unfortunately, this is backlight code, not LED, so I can't just merge it.
> 
> Please go ahead.  Apply my Acked-by and merge away ASAP.
> 
> Acked-by: Lee Jones <lee.jones@linaro.org>

OK best to merge the driver via the LED tree:

Acked-by: Tony Lindgren <tony@atomide.com>
Tested-by: Tony Lindgren <tony@atomide.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
