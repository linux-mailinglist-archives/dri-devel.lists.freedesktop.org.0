Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB21983C9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 20:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53B289D77;
	Mon, 30 Mar 2020 18:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793D789D83
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 18:56:41 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 77EE1804A4;
 Mon, 30 Mar 2020 20:56:35 +0200 (CEST)
Date: Mon, 30 Mar 2020 20:56:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/6] drm/vblank: Add intro to documentation
Message-ID: <20200330185633.GA7594@ravnborg.org>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-2-sam@ravnborg.org>
 <b1347cb6-0116-16de-1602-d57c6069b7ea@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1347cb6-0116-16de-1602-d57c6069b7ea@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8 a=osm6AvedCCIVciXaNO4A:9
 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Mon, Mar 30, 2020 at 01:29:16PM +0200, Thomas Zimmermann wrote:
> Hi Sam and Lyude,
> 
> thanks for improving the documentation. Below are a few points that I'd
> found more understandable. I'm no native speaker, though.
> 
> Am 28.03.20 um 14:20 schrieb Sam Ravnborg:
> > Lyude Paul wrote a very good intro to vblank here:
> > https://lore.kernel.org/dri-devel/faf63d8a9ed23c16af69762f59d0dca6b2bf085f.camel@redhat.com/T/#mce6480be738160e9d07c5d023e88fd78d7a06d27
> > 
> > Add this to the intro chapter in drm_vblank.c so others
> > can benefit from it too.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Co-developed-by: Lyude Paul <lyude@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > ---
> >  drivers/gpu/drm/drm_vblank.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index bcf346b3e486..95cac22d59d1 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -41,6 +41,21 @@
> >  /**
> >   * DOC: vblank handling
> >   *
> > + * From the perspective of a computer, every time a computer monitor displays
> 
> Possibly change from dative case to genitive:
> 
> "From the computer's perspective," ...
> 
> > + * a new frame it's done by "scanning out" the display image from top to
> > + * bottom, one row of pixels at a time. which row of pixels we're on is
> 
> s/which/Which
> 
> The text changes from third person (the computer) to first person
> (we're). Makes it harder to read. I'd remove both, "we" and "computer",
> and speak of display hardware or scanout engine.
> 
> > + * referred to as the scanline.
> 
> I'd say a scanline is any of them. Maybe say "current scanline"?
> 
> > + * Additionally, there's usually a couple of extra scanlines which we
> 
> "In addition to the display's visible area, there's usually a couple of
> extra scanlines that" ...
> 
> > + * scan out, but aren't actually displayed on the screen (these sometimes
> > + * get used by HDMI audio and friends, but that's another story).
> > + * The period where we're on these scanlines is referred to as the vblank.
> 
> I'd replace vblank with "vertical blanking period." That term is
> required in the next paragraph.
> 
> The time when the hardware operates on these invisible scanlines is
> referred to as vertical blanking period, or simply vblank.
> 
> > + *
> > + * On a lot of display hardware, programming needs to take effect during the
> > + * vertical blanking period so that settings like gamma, what frame we're
> 
> "we" again
> 
> > + * scanning out, etc. can be safely changed without showing visual tearing
> > + * on the screen. In some unforgiving hardware, some of this programming has
> > + * to both start and end in the same vblank - vertical blanking.
> > + *
> >   * Vertical blanking plays a major role in graphics rendering. To achieve
> >   * tear-free display, users must synchronize page flips and/or rendering to
> >   * vertical blanking. The DRM API offers ioctls to perform page flips
> > 
> 
> In any case
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the detailed feedabck - I have tried to reword it so it
better fits the context and have taking into account your suggetions.
See other mail for the updated patch.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
