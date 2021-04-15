Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6293C36084F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 13:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247616E176;
	Thu, 15 Apr 2021 11:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2608D6E169
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 11:33:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so14405568wma.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 04:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=13k+njGV2uKvtcoZVwTEnL8TyFMpsUTPjBtwvKMVIn0=;
 b=FA7sBqmNPXF8L1IJzMBiC1C+03+99yGRO7xmwzxSHEiQO8dF+RyiqtUv473TRBl9DJ
 ofy6vPj3WsLHCTJkVa/VA3GEbj+z04eJQju/RlhR1oPO7IJ+o65MGBUxf1pKuQFxfVJw
 KoqsWiC/bAs3ilsn2Nalfni+TyiMXOfAvpvqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=13k+njGV2uKvtcoZVwTEnL8TyFMpsUTPjBtwvKMVIn0=;
 b=a9Li+ZtppFX026k6G/4G1IScOe7FSe9vYCL7SwTO1gf2hexcXHWxPC9CESsxha8s/Q
 9auk8cTuUiF52gYdwN6mpDfgWvGvTaYIYF38X/SaYYKTuY876i+A3vcSI9uAh2CFPdc/
 ADT5MscbAafCSqchBWHyGJ5XYsLlLHMJPAvM5uUUtIvimkHWWMmIcA33PSlS7ChEY6AH
 xHLf+G3EUgv2J9DEAP9doWZ7nnA60F4GXgBQ0bVQYdtZqmjcK2GNTn40NFFPeaagFhF8
 atlwtFZwwID081RQ4Z//+5LhLbOBVRj2yZM6IHiKYiVvxfja6uAA2/UP4sxT4WEg5RQ7
 lzdg==
X-Gm-Message-State: AOAM530fUnUSFOPPEN2QgyHgw5jEwFOI/9mbzbBfPChF+IdvQU3xGpz1
 g0l+AbebnPH0dghpZMTvOxnq6g==
X-Google-Smtp-Source: ABdhPJwTws/OP8YfTa+zhDBcdtMyEgxr2rTeY9T3TS8womfbkDSVJm6xM69NBHRm4ORd7JehhSwcVQ==
X-Received: by 2002:a1c:2985:: with SMTP id p127mr2679848wmp.165.1618486429812; 
 Thu, 15 Apr 2021 04:33:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a22sm2431649wrc.59.2021.04.15.04.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 04:33:48 -0700 (PDT)
Date: Thu, 15 Apr 2021 13:33:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 10/12] drm/tegra: Don't set allow_fb_modifiers explicitly
Message-ID: <YHgkmgsvBmMXiHTr@phenom.ffwll.local>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-10-daniel.vetter@ffwll.ch>
 <YHWCgpq5fVpSGdSN@orome.fritz.box>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHWCgpq5fVpSGdSN@orome.fritz.box>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 13, 2021 at 01:37:38PM +0200, Thierry Reding wrote:
> On Tue, Apr 13, 2021 at 11:49:01AM +0200, Daniel Vetter wrote:
> > Since
> > 
> > commit 890880ddfdbe256083170866e49c87618b706ac7
> > Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Date:   Fri Jan 4 09:56:10 2019 +0100
> > 
> >     drm: Auto-set allow_fb_modifiers when given modifiers at plane init
> > 
> > this is done automatically as part of plane init, if drivers set the
> > modifier list correctly. Which is the case here.
> > 
> > It was slightly inconsistently though, since planes with only linear
> > modifier support haven't listed that explicitly. Fix that, and cc:
> > stable to allow userspace to rely on this. Again don't backport
> > further than where Paul's patch got added.
> > 
> > Cc: stable@vger.kernel.org # v5.1 +
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: linux-tegra@vger.kernel.org
> > ---
> >  drivers/gpu/drm/tegra/dc.c  | 10 ++++++++--
> >  drivers/gpu/drm/tegra/drm.c |  2 --
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index c9385cfd0fc1..f9845a50f866 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -959,6 +959,11 @@ static const struct drm_plane_helper_funcs tegra_cursor_plane_helper_funcs = {
> >  	.atomic_disable = tegra_cursor_atomic_disable,
> >  };
> >  
> > +static const uint64_t linear_modifiers[] = {
> > +	DRM_FORMAT_MOD_LINEAR,
> > +	DRM_FORMAT_MOD_INVALID
> > +};
> > +
> >  static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
> >  						      struct tegra_dc *dc)
> >  {
> > @@ -987,7 +992,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
> >  
> >  	err = drm_universal_plane_init(drm, &plane->base, possible_crtcs,
> >  				       &tegra_plane_funcs, formats,
> > -				       num_formats, NULL,
> > +				       num_formats, linear_modifiers,
> >  				       DRM_PLANE_TYPE_CURSOR, NULL);
> >  	if (err < 0) {
> >  		kfree(plane);
> > @@ -1106,7 +1111,8 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
> >  
> >  	err = drm_universal_plane_init(drm, &plane->base, possible_crtcs,
> >  				       &tegra_plane_funcs, formats,
> > -				       num_formats, NULL, type, NULL);
> > +				       num_formats, linear_modifiers,
> > +				       type, NULL);
> 
> I think we can do better than linear_modifiers for overlay planes, but
> given that this doesn't change existing behaviour, I'll do that in a
> separate patch.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to drm-misc-next, thanks for taking a look.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
