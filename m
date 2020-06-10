Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038661F62FB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264B86E89E;
	Thu, 11 Jun 2020 07:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 894496E866
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 22:41:23 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id AE4F18081;
 Wed, 10 Jun 2020 22:42:11 +0000 (UTC)
Date: Wed, 10 Jun 2020 15:41:17 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
Message-ID: <20200610224117.GE43721@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
 <20200603140639.GG37466@atomide.com>
 <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
 <20200609151943.GL37466@atomide.com>
 <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
 <20200609165234.GM37466@atomide.com>
 <20200609171043.GN37466@atomide.com>
 <7c4809d0-5262-a739-354a-61e617fe6c6e@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c4809d0-5262-a739-354a-61e617fe6c6e@ti.com>
X-Mailman-Approved-At: Thu, 11 Jun 2020 07:54:02 +0000
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
 Grygorii Strashko <grygorii.strashko@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200610 11:48]:
> On 09/06/2020 20:10, Tony Lindgren wrote:
> 
> > > On beagle-x15 I see these errors after modprobe:
> > > 
> > > DSS: OMAP DSS rev 6.1
> > > omapdss_dss 58000000.dss: bound 58001000.dispc (ops dispc_component_ops [omapdss])
> > > omapdss_dss 58000000.dss: bound 58040000.encoder (ops hdmi5_component_ops [omapdss])
> > > [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> > > omapdrm omapdrm.0: [drm] Cannot find any crtc or sizes
> > > [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on minor 0
> > > omapdrm omapdrm.0: [drm] Cannot find any crtc or sizes
> > > aic_dvdd_fixed: disabling
> > > ldousb: disabling
> > > 
> > > Maybe I'm missing some related module on x15?
> > 
> > Still did not figure what I might be missing on x15 :)
> 
> The log above shows that nothing is missing, omapdrm has probed fine. But it
> cannot see anything connected to the hdmi port. Are you booting with correct
> dtb for your x15 revision? And you have a monitor connected? =)

Oh you're right, I forgot to connect the HDMI cable back to X15 :)
No wonder it's no longer working for me..

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
