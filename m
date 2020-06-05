Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545021F003E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 21:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D366E96D;
	Fri,  5 Jun 2020 19:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6286E96D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 19:05:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9205927C;
 Fri,  5 Jun 2020 21:05:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591383921;
 bh=Uzq4fcW39ABPFOQO4o+qhxBJ2pJzSG4B/pAr6FXFPkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H/zb4+n67JnWlsgLjx5l8FnINkkWzFXGGEyXbiCbFjBK5MQH4Rk4doeYRREqfb4ad
 Wwtx+vyPSDACXjDyIlPZD7gwk5w0zeVhTEaqVq9B2fOYOuGltJ1XmvMZ84oDrC9W0F
 +TDMOTSHwW/S1rhZCrONlkTlx2daE+DJ30qn1uN0=
Date: Fri, 5 Jun 2020 22:05:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200605190500.GG26752@pendragon.ideasonboard.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605132900.on527xcggg6f6pil@uno.localdomain>
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

On Fri, Jun 05, 2020 at 03:29:00PM +0200, Jacopo Mondi wrote:
> Hello Eugeniu,
>    sorry for the late reply
> 
> On Wed, May 27, 2020 at 09:15:55AM +0200, Eugeniu Rosca wrote:
> > Hi Jacopo,
> >
> > On Tue, Oct 15, 2019 at 12:46:13PM +0200, Jacopo Mondi wrote:
> >  ----8<---
> >
> > > * Testing
> > > I have tested by injecting a color inversion LUT table and enabling/disabling it
> > > every 50 displayed frames:
> > > https://jmondi.org/cgit/kmsxx/log/?h=gamma_lut
> >
> > Could you kindly share the cross compilation steps for your kmsxx fork?
> 
> I usually build it on the target :)

Otherwise, cross-compilation instructions are available in README.md.

$ mkdir build
$ cd build
$ cmake -DCMAKE_TOOLCHAIN_FILE=<buildrootpath>/output/host/usr/share/buildroot/toolchainfile.cmake ..
$ make -j4

I assume you may use yocto instead of buildroot, you would have to
locate the toolchainfile.cmake file accordingly.

> > Just out of curiosity, have you ever tried to pull the display's HDMI
> > cable while reading from CM2_LUT_TBL?
> 
> Ahem, not really :) Did I get you right, you mean disconnecting the
> HDMI cable from the board ?
> 
> > At least with the out-of-tree CMM implementation [*], this sends the
> > R-Car3 reference targets into an unrecoverable freeze, with no lockup
> > reported by the kernel (i.e. looks like an serious HW issue).
> >
> > >
> > > CMM functionalities are retained between suspend/resume cycles (tested with
> > > suspend-to-idle) without requiring a re-programming of the LUT tables.
> >
> > Hmm. Is this backed up by any statement in the HW User's manual?
> > This comes in contrast with the original Renesas CMM implementation [**]
> > which does make use of suspend (where the freeze actually happens).
> >
> > Can we infer, based on your statement, that we could also get rid of
> > the suspend callback in [**]?
> 
> As Geert (thanks) explained what I've tested with is suspend-to-idle,
> which retains the state of the LUT tables (and I assume other
> not-yet-implemented CMM features, like CLU). I recall the out-of-tree
> driver has suspend/resume routines but I never really tested that.
> 
> > [*] https://github.com/renesas-rcar/du_cmm
> > [**] https://github.com/renesas-rcar/du_cmm/blob/c393ed49834bdbc/meta-rcar-gen3/recipes-kernel/linux/linux-renesas/0001-drm-rcar-du-Add-DU-CMM-support.patch#L1912

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
