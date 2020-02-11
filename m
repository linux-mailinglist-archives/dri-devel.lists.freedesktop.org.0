Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95F158D31
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 12:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FEB6EE18;
	Tue, 11 Feb 2020 11:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C435B6EE18
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 11:07:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7ECE52A;
 Tue, 11 Feb 2020 12:07:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581419247;
 bh=pBTt/u7T3z2+TO23AZgfk6mLR2REE3Psxm7jHS2oWcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HsqMyuSsu9+ikDDmWp1U+jfXsGr4562qnPs5W9HoPv9TbJB3kxOWl0cr4TFB9bV37
 +O5Fzr7CsRL2YLhwH1Wz0bYHnM5BfRrI5/OiGon4UWZKdJp2rrHCars+lEnMK42ct4
 dZRZRDKzw3MwOC5PQKA8hI3TzMJ4qkaIo1jTR45s=
Date: Tue, 11 Feb 2020 13:07:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
Message-ID: <20200211110712.GB28355@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
 <20191212203550.GB4892@pendragon.ideasonboard.com>
 <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
 <b39e52f1-3e73-5f26-6206-0956cf482631@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b39e52f1-3e73-5f26-6206-0956cf482631@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Tue, Feb 11, 2020 at 12:01:31PM +0200, Tomi Valkeinen wrote:
> On 13/01/2020 14:01, Tomi Valkeinen wrote:
> > On 12/12/2019 22:35, Laurent Pinchart wrote:
> >> On Thu, Dec 12, 2019 at 11:37:51AM +0200, Tomi Valkeinen wrote:
> >>> On 11/12/2019 18:53, Tony Lindgren wrote:
> >>>> * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [191202 13:05]:
> >>>>> Hi Tomi,
> >>>>>
> >>>>> Thank you for the patch.
> >>>>>
> >>>>> On Thu, Nov 14, 2019 at 11:39:49AM +0200, Tomi Valkeinen wrote:
> >>>>>> panel-simple now handled panel osd070t1718-19ts, and we no longer need
> >>>>>> the panel timings in the DT file. So remove them.
> >>>>>
> >>>>> Should you in that case drop the panel-dpi compatible string too, as the
> >>>>> panel-dpi bindings require panel timings in DT ?
> >>>>
> >>>> Yeah sounds like if panel-dpi is no longer usable for this device it
> >>>> should be dropped from the compatible list.
> >>>
> >>> Ok, I agree.
> >>>
> >>> Looking at the dts files, panel-dpi is used in a bunch of boards. But
> >>> we even have 3 dts files with panel-dpi, without the detailed panel
> >>> model in compatible...
> >>>
> >>> Fixing those will break the compatibility with old dtbs and new
> >>> kernel, unless we add timings-from-dt to a panel driver that handles
> >>> panel-dpi.
> >>
> >> I know, and I don't have a perfect answer for this :-( I don't see a
> >> third option, it's either breaking DT backward compatibility or adding
> >> timings parsing to a panel driver (either a new panel-dpi driver or to
> >> panel-simple). What's your preferred option ?
> > 
> > Hmm, I just realized that changing these will break omapfb. It
> > relies on panel-dpi and timings from DT...
> 
> If no one objects, I think we should just drop the timings from the
> .dts, and say that these boards are no longer supported with omapfb. I
> don't think there's much point in trying to keep omapfb working fine
> for boards that are fully supported by omapdrm.

No objection from me.

> Hopefully soon (in five years? =) we can say that omapdrm supports all
> the boards, and we can deprecate omapfb.

I'd love to send a patch to remove omapfb, but I'll let you do the
honours :-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
