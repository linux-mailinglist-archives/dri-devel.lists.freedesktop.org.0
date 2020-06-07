Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF11F0962
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 04:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD316E107;
	Sun,  7 Jun 2020 02:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9D16E107
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 02:42:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B80D52C9;
 Sun,  7 Jun 2020 04:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591497736;
 bh=oTn7cqfZc4UogV7TuRHH/rTKoy5a8jctSncWTCB7xDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vYWK7GgWo21C9DD4MiGtHQOn3ZSxvM+hN8+JXW2ca6Ok0/eh2IvNOgKnhhaKPvjj6
 mZxQuKqKnrnSMAYj/L191r19vez4xKl+zkSWryve60qz2shocpeKbzP4MmIjhE4Or9
 EvIkB9iRI9st3dY7RX4Qz3y2JKHtEvWdiGv4NwoY=
Date: Sun, 7 Jun 2020 05:41:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200607024158.GD7339@pendragon.ideasonboard.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
 <20200605134124.GA28734@lxhi-065.adit-jv.com>
 <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
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
Cc: muroya@ksk.co.jp, airlied@linux.ie, mrodin@de.adit-jv.com,
 dri-devel@lists.freedesktop.org, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 gotthard.voellmeke@renesas.com, koji.matsuoka.xm@renesas.com,
 horms@verge.net.au, seanpaul@chromium.org, michael.dege@renesas.com,
 Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com,
 efriedrich@de.adit-jv.com, ChaitanyaKumar.Borah@in.bosch.com,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, uli+renesas@fpond.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Jun 05, 2020 at 03:53:15PM +0200, Jacopo Mondi wrote:
> On Fri, Jun 05, 2020 at 03:41:24PM +0200, Eugeniu Rosca wrote:
> > On Fri, Jun 05, 2020 at 03:29:00PM +0200, Jacopo Mondi wrote:
> >> On Wed, May 27, 2020 at 09:15:55AM +0200, Eugeniu Rosca wrote:
> >>> Could you kindly share the cross compilation steps for your kmsxx fork?
> >>
> >> I usually build it on the target :)
> >
> > Interesting approach. With ARM getting more and more potent, why not? :)
> 
> For 'small' utilities like kmsxx it's doable
> 
> >>> Just out of curiosity, have you ever tried to pull the display's HDMI
> >>> cable while reading from CM2_LUT_TBL?
> >>
> >> Ahem, not really :) Did I get you right, you mean disconnecting the
> >> HDMI cable from the board ?
> >
> > Right.
> 
> So, no, I have not tried. Do you see any intersting failure with the
> mainline version ?

Jacopo, would you be able to give this a try ?

> >>> At least with the out-of-tree CMM implementation [*], this sends the
> >>> R-Car3 reference targets into an unrecoverable freeze, with no lockup
> >>> reported by the kernel (i.e. looks like an serious HW issue).
> >>>
> >>>> CMM functionalities are retained between suspend/resume cycles (tested with
> >>>> suspend-to-idle) without requiring a re-programming of the LUT tables.
> >>>
> >>> Hmm. Is this backed up by any statement in the HW User's manual?
> >>> This comes in contrast with the original Renesas CMM implementation [**]
> >>> which does make use of suspend (where the freeze actually happens).
> >>>
> >>> Can we infer, based on your statement, that we could also get rid of
> >>> the suspend callback in [**]?
> >>
> >> As Geert (thanks) explained what I've tested with is suspend-to-idle,
> >> which retains the state of the LUT tables (and I assume other
> >> not-yet-implemented CMM features, like CLU). I recall the out-of-tree
> >> driver has suspend/resume routines but I never really tested that.
> >
> > I see. JFYI, there is a flaw in the suspend handling in the out-of-tree
> > CMM patch [*], which renders the SoC unresponsive on HDMI hotplug. The
> > fix is currently under review. Hopefully it will make its way to [*]
> > in the nearest future. Just to keep in mind for the moment when CMM
> > s2ram will become a mainline feature.
> 
> Thanks, let's keep this in mind. Next week I'll run a few tests again
> with s2ram and will get back to you.

Note that the CMM driver is controlled by the DU driver. As the DU
driver will reenable the display during resume, it will call
rcar_du_cmm_setup() at resume time, which will reprogram the CMM. There
should thus be no need for manual suspend/resume handling in the CMM as
far as I can tell, but we need to ensure that the CMM is suspended
before and resumed after the DU. I believe this could be implemented
using device links.

> >>> [*] https://github.com/renesas-rcar/du_cmm
> >>> [**] https://github.com/renesas-rcar/du_cmm/blob/c393ed49834bdbc/meta-rcar-gen3/recipes-kernel/linux/linux-renesas/0001-drm-rcar-du-Add-DU-CMM-support.patch#L1912

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
