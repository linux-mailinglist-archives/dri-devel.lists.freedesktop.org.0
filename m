Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E911F23C
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529346E3C4;
	Sat, 14 Dec 2019 14:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 537746E8CD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 14:57:38 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 935CC80BF;
 Fri, 13 Dec 2019 14:58:14 +0000 (UTC)
Date: Fri, 13 Dec 2019 06:57:32 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/4] ARM: dts: am437x-gp-evm: add HDMI support
Message-ID: <20191213145732.GH35479@atomide.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
 <20191212172104.GY35479@atomide.com>
 <20191212173110.GA35479@atomide.com>
 <d09526b2-8435-bef2-0489-0c3c8173d451@ti.com>
 <20191213104204.GB4860@pendragon.ideasonboard.com>
 <2f5cfca4-d36d-da2d-59ba-b76669daeded@ti.com>
 <20191213114207.GC4860@pendragon.ideasonboard.com>
 <36d8dde1-1a76-5a5f-2a41-8bc52dfcf2fa@ti.com>
 <20191213122845.GD4860@pendragon.ideasonboard.com>
 <3900f4b3-4604-cb64-ebdd-ae168ef1d2fb@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3900f4b3-4604-cb64-ebdd-ae168ef1d2fb@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191213 12:34]:
> On 13/12/2019 14:28, Laurent Pinchart wrote:
> 
> > > So... In the DT file, we would have multiple endpoints in the same output port in DSS, one going to
> > > the panel, one to the SiI9022? omapdrm could then create two encoders, one abstracting the DPI
> > > output and the connection to the panel, one abstracting the DPI output and SiI9022?
> > 
> > That's the idea, yes.
> > 
> > > And then someone would need to handle the GPIO, and set it based on the output used. These kind of
> > > gpios are always difficult, as they don't belong anywhere =).
> > 
> > https://lore.kernel.org/lkml/20191211061911.238393-5-hsinyi@chromium.org/
> > 
> > Still, the infrastructure in omapdrm would need quite a bit of work.
> > We're just about to get a helper layer for linear pipelines merged, and
> > we already need to go one step further :-)
> 
> Alright, sounds like this will be doable in the future. So let's drop this
> and the epos HDMI patches for now.

Oh OK. Sounds like no other solution is usable right now short of
separate dts files like you've done.

> This does sound like quite a bit of work, as you say, so I have no idea when
> we can get there (on the omapdrm side). In the minimum we should first get
> the big omapdrm rework done, in order to avoid nasty conflicts.
> 
> Thanks for educating me =).

Sounds a nice plan though :)

Thanks,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
