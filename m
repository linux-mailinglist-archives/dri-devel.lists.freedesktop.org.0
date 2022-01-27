Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000AD49E095
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AC010EA7F;
	Thu, 27 Jan 2022 11:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E5C10ECC9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:20:14 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nD2p2-0004SH-WD; Thu, 27 Jan 2022 12:20:13 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nD2p1-00082z-2I; Thu, 27 Jan 2022 12:20:11 +0100
Date: Thu, 27 Jan 2022 12:20:11 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 07/27] drm/rockchip: dw_hdmi: Use auto-generated tables
Message-ID: <20220127112011.GM23490@pengutronix.de>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-8-s.hauer@pengutronix.de>
 <CAD=FV=U7W_oWjS_gCurAkNdkcuHQGn-XH=-VwP2MSG9zO92ySg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U7W_oWjS_gCurAkNdkcuHQGn-XH=-VwP2MSG9zO92ySg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:06:15 up 47 days, 19:51, 83 users,  load average: 0.13, 0.26, 0.26
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>,
 =?iso-8859-15?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <kernel@pengutronix.de>, Yakir Yang <ykk@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 07:54:53AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jan 26, 2022 at 6:58 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >
> > From: Douglas Anderson <dianders at chromium.org>
> >
> > The previous tables for mpll_cfg and curr_ctrl were created using the
> > 20-pages of example settings provided by the PHY vendor.  Those
> > example settings weren't particularly dense, so there were places
> > where we were guessing what the settings would be for 10-bit and
> > 12-bit (not that we use those anyway).  It was also always a lot of
> > extra work every time we wanted to add a new clock rate since we had
> > to cross-reference several tables.
> >
> > In <http://crosreview.com/285855> I've gone through the work to figure
> 
> The `crosreview.com` syntax doesn't seem to work anymore. Could maybe
> update to https://crrev.com/c/285855 ?

did that, thanks.

> 
> > out how to generate this table automatically.  Let's now use the
> > automatically generated table and then we'll never need to look at it
> > again.
> >
> > We only support 8-bit mode right now and only support a small number
> > of clock rates and and I've verified that the only 8-bit rate that was
> > affected was 148.5.  That mode appears to have been wrong in the old
> > table.
> >
> > Changes since v3:
> > - new patch
> >
> > Signed-off-by: Douglas Anderson <dianders at chromium.org>
> > Signed-off-by: Yakir Yang <ykk at rock-chips.com>
> 
> Should probably change the "at" to "@" ?

yes.

> 
> > Reviewed-by: Stéphane Marchesin <marcheu at chromium.org>
> 
> In general shouldn't carry downstream reviews when posting upstream
> unless you're certain that the person intended it...
> 
> 
> It's been a long time, but in general I think I was fairly confident
> in the numbers that my script pumped out, at least given the caveat of
> no pixel repetition and 8-bit only. That being said, I didn't have any
> inside knowledge of the hardware and just figured out formulas that
> seemed to match the table that I had. YMMV.

Rockchip adopted this patch for their downstream Kernel, so they haven't
been able to come up with better values. Given that you created this
patch for a fairly old SoC and the values are still usable on rk3568 I
think that's the way to go.

> 
> I'll also say that when I did a rebase of veyron (rk3288-based
> Chromebook) to 4.19 about 2.5 years ago, I ended up squashing several
> of these patches into 1. That can be found at
> <https://crrev.com/c/1661056>. That also has details about why some of
> these patches never made it upstream. The main reason, at least in the
> case of rk3288, was the PLL sharing problem that nobody ever solved.
> rk3288 didn't have quite enough PLLs and thus, if you were using both
> VOPs, one of the VOPs was going to be severely limited in what pixel
> clocks it could make. There was no framework deciding which VOP should
> be limited and how the system should react to this...
> 
> 
> In any case, I'm pretty far disconnected from all this stuff now, but
> I wish you the best of luck in trying to get it all solved!

Nah, sorry, I won't get that all solved ;)

I am not that interested in rk3288, my main concern is the rk3568. That
one has two spare PLLs for three heads instead of one PLL for two heads,
so the problem is less pressing.

I'll stick to this version of the patch instead of the combined one
because this patch seems to be correct regardless of the PLL problem.

Thanks for the link though, it gives me some insights why things are the
way they are currently.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
