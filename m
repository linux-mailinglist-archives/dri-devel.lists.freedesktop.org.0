Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002AC173256
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 09:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570406EE38;
	Fri, 28 Feb 2020 08:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 184F289F61
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 17:44:30 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 3677B80C0;
 Thu, 27 Feb 2020 17:45:12 +0000 (UTC)
Date: Thu, 27 Feb 2020 09:44:24 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/3] drm/omap: Prepare DSS for probing without legacy
 platform data
Message-ID: <20200227174424.GI37466@atomide.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-2-tony@atomide.com>
 <20200224233111.gkctx27usfxj2wgz@earth.universe>
 <20200224234333.GD37466@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224234333.GD37466@atomide.com>
X-Mailman-Approved-At: Fri, 28 Feb 2020 07:59:27 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Suman Anna <s-anna@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Jyri Sarha <jsarha@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tomi,

* Tony Lindgren <tony@atomide.com> [200224 23:44]:
> * Sebastian Reichel <sre@kernel.org> [200224 23:32]:
> > Hi,
> > 
> > On Mon, Feb 24, 2020 at 11:12:28AM -0800, Tony Lindgren wrote:
> > > In order to probe display subsystem (DSS) components with ti-sysc
> > > interconnect target module without legacy platform data and using
> > > devicetree, we need to update dss probing a bit.
> > > 
> > > In the device tree, we will be defining the data also for the interconnect
> > > target modules as DSS really is a private interconnect. There is some
> > > information about that in 4460 TRM in "Figure 10-3. DSS Integration" for
> > > example where it mentions "32-bit interconnect (SLX)".
> > > 
> > > The changes we need to make are:
> > > 
> > > 1. Parse also device tree subnodes for the compatible property fixup
> > > 
> > > 2. Update the component code to consider device tree subnodes
> > > 
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: Jyri Sarha <jsarha@ti.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > ---
> > > 
> > > This is needed for dropping DSS platform data that I'll be posting
> > > seprately. If this looks OK, can you guys please test and ack?
> > > 
> > > ---
> > 
> > Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > 
> > FWIW, I dropped omapdss-boot-init.c in my patch series updating DSI
> > code to use common panel infrastructure, so this will conflict.
> 
> Hey that's great :) Sounds like we can set up an immutable branch
> for just this $subject patch against v5.6-rc1 to resolve the
> conflict. I can set it up for Tomi or Tomi can set it up for me,
> whichever Tomi prefers.

Do you want me to send you a pull request for just this one patch
against v5.6-rc1?

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
