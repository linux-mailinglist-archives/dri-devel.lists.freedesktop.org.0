Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61916BC0F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188F66EA16;
	Tue, 25 Feb 2020 08:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8786EA16;
 Tue, 25 Feb 2020 08:45:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3EC32293DCC;
 Tue, 25 Feb 2020 08:45:22 +0000 (GMT)
Date: Tue, 25 Feb 2020 09:45:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v10 10/12] drm/bridge: panel: Propage bus format/flags
Message-ID: <20200225094518.4f57ca5a@collabora.com>
In-Reply-To: <20200224223400.GB29578@pendragon.ideasonboard.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200128135514.108171-11-boris.brezillon@collabora.com>
 <20200131182505.51366470@collabora.com>
 <20200224223400.GB29578@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Feb 2020 00:34:00 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Boris,
> 
> Thank you for the patch.
> 
> On Fri, Jan 31, 2020 at 06:25:05PM +0100, Boris Brezillon wrote:
> > And the typo (Propage -> Propagate) is still there :-(. Fixing it right
> > now so I don't forget.
> > 
> > On Tue, 28 Jan 2020 14:55:12 +0100 Boris Brezillon wrote:  
> > > So that the previous bridge element in the chain knows which input
> > > format the panel bridge expects.  
> 
> I've been told multiple times by Tomi that the commit message should be
> readable by itself, not just as a continuation of the subject line. I
> was annoyed in the beginning, as I had to change my habits, but I think
> it's an actual improvement. You may want to pay attention to that too in
> the future.
> 
> > > v10:
> > > * Add changelog to the commit message
> > > 
> > > v8 -> v9:
> > > * No changes
> > > 
> > > v7:
> > > * Set atomic state hooks explicitly
> > > 
> > > v4 -> v6:
> > > * Not part of the series
> > > 
> > > v3:
> > > * Adjust things to match the new bus-format negotiation approach
> > > * Use drm_atomic_helper_bridge_propagate_bus_fmt
> > > * Don't implement ->atomic_check() (the core now takes care of bus
> > >   flags propagation)
> > > 
> > > v2:
> > > * Adjust things to match the new bus-format negotiation approach
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> With the typo fixed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Will fix the typo, update the commit message and push this patch
directly.

Thanks,

Boris

> 
> > > ---
> > >  drivers/gpu/drm/bridge/panel.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > > index f66777e24968..dcc72bd7df30 100644
> > > --- a/drivers/gpu/drm/bridge/panel.c
> > > +++ b/drivers/gpu/drm/bridge/panel.c
> > > @@ -127,6 +127,10 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
> > >  	.enable = panel_bridge_enable,
> > >  	.disable = panel_bridge_disable,
> > >  	.post_disable = panel_bridge_post_disable,
> > > +	.atomic_reset = drm_atomic_helper_bridge_reset,
> > > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > > +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > > +	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
> > >  };
> > >  
> > >  /**  
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
