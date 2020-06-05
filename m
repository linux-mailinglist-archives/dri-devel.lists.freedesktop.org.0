Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0E1F0EEC
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4776E393;
	Sun,  7 Jun 2020 19:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCED36E8E9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:41:36 +0000 (UTC)
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id BC5403C0579;
 Fri,  5 Jun 2020 15:41:34 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VzfMKGndY1M; Fri,  5 Jun 2020 15:41:29 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id BBD053C00B5;
 Fri,  5 Jun 2020 15:41:29 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.47) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 5 Jun 2020
 15:41:29 +0200
Date: Fri, 5 Jun 2020 15:41:24 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200605134124.GA28734@lxhi-065.adit-jv.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605132900.on527xcggg6f6pil@uno.localdomain>
X-Originating-IP: [10.72.94.47]
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
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

Hi Jacopo,

On Fri, Jun 05, 2020 at 03:29:00PM +0200, Jacopo Mondi wrote:
> On Wed, May 27, 2020 at 09:15:55AM +0200, Eugeniu Rosca wrote:
> > Could you kindly share the cross compilation steps for your kmsxx fork?
> 
> I usually build it on the target :)

Interesting approach. With ARM getting more and more potent, why not? :)

> 
> > Just out of curiosity, have you ever tried to pull the display's HDMI
> > cable while reading from CM2_LUT_TBL?
> 
> Ahem, not really :) Did I get you right, you mean disconnecting the
> HDMI cable from the board ?

Right.

> >
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

I see. JFYI, there is a flaw in the suspend handling in the out-of-tree
CMM patch [*], which renders the SoC unresponsive on HDMI hotplug. The
fix is currently under review. Hopefully it will make its way to [*]
in the nearest future. Just to keep in mind for the moment when CMM
s2ram will become a mainline feature.

> >
> > [*] https://github.com/renesas-rcar/du_cmm
> > [**] https://github.com/renesas-rcar/du_cmm/blob/c393ed49834bdbc/meta-rcar-gen3/recipes-kernel/linux/linux-renesas/0001-drm-rcar-du-Add-DU-CMM-support.patch#L1912

-- 
Best regards,
Eugeniu Rosca
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
