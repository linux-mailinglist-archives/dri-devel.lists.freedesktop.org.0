Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF02D206D7A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 09:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048B06EA57;
	Wed, 24 Jun 2020 07:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56846EA57
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 07:23:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a6so1193035wrm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 00:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EifhZnIbVxUxBgKfWD+MbByMzzVgxUGQ9dcLOhjditI=;
 b=kw3kvZtr3+vn9sEiTThiMHOdBMg3e1izqRTYdBM2BGHXWNMLWW1TyYnZSfKCh2XcQ8
 JAlX5IvySC6i5shOF9sSwYUKHmFvOKcnpvFhs2kquX++1fg4+R98S6G0uoDtukPzYWs7
 nfu0te6p1iG5wbqxTR4Wo4kTU/qij8WizFNPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EifhZnIbVxUxBgKfWD+MbByMzzVgxUGQ9dcLOhjditI=;
 b=G5rjBjXjgTIOCDnZuzGhP8mZ6sRr96rdj7Dl/yZuCm1Skh9sv/KItU67Xtit2opwMK
 2WwIFl3AF/hvyi2ui3MT0ga2YHkYsnpbiBS32nJEaDJV6lAVo8DRl/BnN5rD3xwLvMoY
 wfXKd+cwPRJCJHqQduQLcHHLqDgKydbxZywO6jinf22dKSGKtlCd/1/kvisXg4qcmnE2
 qVyK0wDgO2rni5ALKRGSXBocJu7p/bY8gXpvmx/T8jaPwi4+lnJXPGOpNt90E371Vjrk
 zZBRRjHVQi1JVFBXR1mQ1bOLh5gukpVavXsm/xxzm4ODq9uhaXQ540G/OC4WIpfxG04X
 Soig==
X-Gm-Message-State: AOAM5331H3rry51Ro9ZlGidffqQyIwk9+PG/bJw+Q9peBQrHVVfO5sHg
 Z/Sl0aMRC32GBgCdg9PqDTJOWg==
X-Google-Smtp-Source: ABdhPJyfrqUTeIvtGQ3Xpv4GtDMtsLxGD+dT0TgrVnBF3swSrmxRF9c9YzUd9J4CQrbLeIW6WXdswA==
X-Received: by 2002:adf:f14e:: with SMTP id y14mr29417639wro.151.1592983387402; 
 Wed, 24 Jun 2020 00:23:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b10sm6675011wmj.30.2020.06.24.00.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 00:23:06 -0700 (PDT)
Date: Wed, 24 Jun 2020 09:23:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown
 state
Message-ID: <20200624072304.GT20149@phenom.ffwll.local>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org>
 <20200624011209.GU5870@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624011209.GU5870@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 04:12:09AM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> On Sun, Jun 21, 2020 at 10:40:00AM +0200, Sam Ravnborg wrote:
> > On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchart wrote:
> > > The DRM CRTC helpers add default modes to connectors in the connected
> > > state if no mode can be retrieved from the connector. This behaviour is
> > > useful for VGA or DVI outputs that have no connected DDC bus. However,
> > > in such cases, the status of the output usually can't be retrieved and
> > > is reported as connector_status_unknown.
> > > 
> > > Extend the addition of default modes to connectors in an unknown state
> > > to support outputs that can retrieve neither the modes nor the
> > > connection status.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > From your description sounds like an OK approach.
> > But this is not something I feel too familiar with.
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Thanks for the ack. I'd like to have Daniel's (CC'ed) feedback on this
> too.

Makes sense, and at least pre-coffee me can't immediately think of a
scenario where we're going to regret this. _unknown status is pretty much
limited to old VGA and similar things where load detect somehow isn't well
supported by the hw.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> > > ---
> > >  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
> > >  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
> > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > > index f5d141e0400f..9055d9573c90 100644
> > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > @@ -491,7 +491,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> > >  	if (count == 0 && connector->status == connector_status_connected)
> > >  		count = drm_add_override_edid_modes(connector);
> > >  
> > > -	if (count == 0 && connector->status == connector_status_connected)
> > > +	if (count == 0 && (connector->status == connector_status_connected ||
> > > +			   connector->status == connector_status_unknown))
> > >  		count = drm_add_modes_noedid(connector, 1024, 768);
> > >  	count += drm_helper_probe_add_cmdline_mode(connector);
> > >  	if (count == 0)
> > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > > index 421a30f08463..afe55e2e93d2 100644
> > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
> > >  	 * The usual way to implement this is to cache the EDID retrieved in the
> > >  	 * probe callback somewhere in the driver-private connector structure.
> > >  	 * In this function drivers then parse the modes in the EDID and add
> > > -	 * them by calling drm_add_edid_modes(). But connectors that driver a
> > > +	 * them by calling drm_add_edid_modes(). But connectors that drive a
> > >  	 * fixed panel can also manually add specific modes using
> > >  	 * drm_mode_probed_add(). Drivers which manually add modes should also
> > >  	 * make sure that the &drm_connector.display_info,
> > >  	 * &drm_connector.width_mm and &drm_connector.height_mm fields are
> > >  	 * filled in.
> > >  	 *
> > > +	 * Note that the caller function will automatically add standard VESA
> > > +	 * DMT modes up to 1024x768 if the .get_modes() helper operation returns
> > > +	 * no mode and if the connector status is connector_status_connected or
> > > +	 * connector_status_unknown. There is no need to call
> > > +	 * drm_add_edid_modes() manually in that case.

Hm calling drm_add_edid_modes if you have no edid is a bit a funny idea
... Personally I'd just leave out the last sentence, I think that only
confuses readers. Or I'm not grasphing what you're trying to tell here.

r-b with or without this change since imo super tiny nit.

Cheers, Daniel

> > > +	 *
> > >  	 * Virtual drivers that just want some standard VESA mode with a given
> > >  	 * resolution can call drm_add_modes_noedid(), and mark the preferred
> > >  	 * one using drm_set_preferred_mode().
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
