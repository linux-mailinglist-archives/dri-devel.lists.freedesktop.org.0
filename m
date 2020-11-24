Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E6E2C2D13
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5AA6E455;
	Tue, 24 Nov 2020 16:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544436E455
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 16:38:52 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B3D0020020;
 Tue, 24 Nov 2020 17:38:49 +0100 (CET)
Date: Tue, 24 Nov 2020 17:38:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 55/80] drm/panel: panel-dsi-cm: use
 MIPI_DCS_GET_ERROR_COUNT_ON_DSI
Message-ID: <20201124163848.GA51881@ravnborg.org>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-56-tomi.valkeinen@ti.com>
 <20201124161836.GA50534@ravnborg.org>
 <d8453eda-6d8b-23be-103e-6f4f07e1346e@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8453eda-6d8b-23be-103e-6f4f07e1346e@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8 a=7gkXJVJtAAAA:8
 a=YxeggU3nrjKIOG3EjS0A:9 a=CjuIK1q_8ugA:10 a=aeg5Gbbo78KNqacMgKqU:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi

On Tue, Nov 24, 2020 at 06:26:47PM +0200, Tomi Valkeinen wrote:
> Hi Sam,
> 
> On 24/11/2020 18:18, Sam Ravnborg wrote:
> > Hi Tomi,
> > 
> > On Tue, Nov 24, 2020 at 02:45:13PM +0200, Tomi Valkeinen wrote:
> >> Use the common MIPI_DCS_GET_ERROR_COUNT_ON_DSI define instead of
> >> driver's own.
> >>
> > They are both 5 - OK
> > 
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > IMO you should get all the patches at least up including this patch applied.
> > They are all reviewed/acked. And then you have a much smaller stack of
> > patches to spam us with.
> 
> Yes, I think that makes sense. I did not want to merge them earlier, as with the v3, I could not get
> videomode panels work at all (while cmd mode panels did work). So I was not sure if something is
> totally silly and broken in the series.
> 
> Now that I can get video mode panels work with some hacks on top, I'm fine with merging these.
> 
> But it's too late for 5.11, as we need testing and work on the video mode panels. So targeting 5.12.
Obviously your call, but I see no reason to wait for working videomode
panles if what you have now do not introduce any (known) regressions.

ofc I assume videomode panels is something new and not something that worked
before.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
