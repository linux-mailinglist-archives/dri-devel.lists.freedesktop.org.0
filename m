Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2F47B1E7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 18:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01575112334;
	Mon, 20 Dec 2021 17:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF123112334
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 17:11:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s1so16080464wra.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 09:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=orQKzw/rIFyU2i9qhJC15lEG6dnafgAQONkmIMH+/0g=;
 b=VKDQD1GNQ3pyjeVnNux3ttr/G2JeM+ZQwGii5FIGGzSV7twBVAETJ57OLYIy2hq4S2
 uhvXSqDD02I4NO22Ug4v9qVuOilgiVd0LaIFaiB3XY4+upOFM2tX4LOjwVp/ymQCwUm2
 /yyd0rcR/MAQHzDuQrH75kNq5MBG9EK8UVwzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=orQKzw/rIFyU2i9qhJC15lEG6dnafgAQONkmIMH+/0g=;
 b=k/M5WHfrGkQjHyr10rDAR0MRh5V/jlZaZQuYUPL3VDm+rmWEkapp5kyjLa/SdS0R8D
 aKyvI3HO0g1c3s82Pk72hEKx7QxV/rgKTvyVS7Fg7WWPbwx+nqoGI6j5g5uMYXLprgVM
 muKjH3AvbQ9hcqnBeFsdJF2pLjhrzjsIoSCkZF0LZxy7XohblU4p7k+ZUZFTMqIsV+HO
 Ei2iSYuPRlBIEdKisDjVYDHK1Co7PTkxK7uB8Hol4zVPPZfeQsGle9TQihvAJ0aWBQ6T
 gLenAdwJo610ASz+cU9NRy93Ud0sylJCSdjpSNFr8RXQG/66R97elC+ACx5vzhr5G3hi
 1Vbw==
X-Gm-Message-State: AOAM533e3NSvi7rhWAcOLtLFRPwN+9nKu4aYhuV709cc96mYjmQ9E6DT
 HxpzvmxCDt583nCl0e16JxSN5Q==
X-Google-Smtp-Source: ABdhPJzWvClYYKmbqkQeNOh1Eh5QiBVjHn3DsSK2NbR0Vcu5w9gSZkyxdlgFDJZTWLzL/VergC1rjw==
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr14299950wri.113.1640020294365; 
 Mon, 20 Dec 2021 09:11:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m17sm446927wmq.31.2021.12.20.09.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 09:11:33 -0800 (PST)
Date: Mon, 20 Dec 2021 18:11:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Claudio Suarez <cssk@net-c.es>, dri-devel@lists.freedesktop.org,
 0day robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v2] drm: fix error found in some cases after the patch
 d1af5cd86997
Message-ID: <YcC5Qxnj8PvqnS6f@phenom.ffwll.local>
Mail-Followup-To: Claudio Suarez <cssk@net-c.es>,
 dri-devel@lists.freedesktop.org, 0day robot <lkp@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>
References: <YaC7zXW119tlzfVh@gineta.localdomain>
 <20211128142015.GB5295@xsang-OptiPlex-9020>
 <YaUpsaP7hng6zpFh@gineta.localdomain>
 <YaXi803g7iv9MxWR@phenom.ffwll.local>
 <YaiVfZWNyMkG8uED@gineta.localdomain>
 <YaiXEARd8z2C463h@gineta.localdomain>
 <YcBKbn/9oqD2taCk@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcBKbn/9oqD2taCk@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 10:18:38AM +0100, Daniel Vetter wrote:
> On Thu, Dec 02, 2021 at 10:51:12AM +0100, Claudio Suarez wrote:
> > The patch d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log
> > calls in drm core, files drm_a*.c") fails when the drm_device
> > cannot be found in the parameter plane_state->crtc.
> > Fix it using plane_state->plane.
> > 
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Fixes: d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log calls in drm core, files drm_a*.c")

My scrip complained about the fixes line, so I fixed it. I guess you've
used the sha1 from your tree, not from upstream? Please always use
upstream sha1 when referencing commits.

Anyway patches are now pushed.

Cheers, Daniel

> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> 
> Sorry I missed these two patches, but both applied now, thanks.
> -Daniel
> 
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index aef2fbd676e5..a7a05e1e26bb 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -828,8 +828,8 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> >  	}
> >  
> >  	if (!crtc_state->enable && !can_update_disabled) {
> > -		drm_dbg_kms(plane_state->crtc->dev,
> > -			       "Cannot update plane of a disabled CRTC.\n");
> > +		drm_dbg_kms(plane_state->plane->dev,
> > +			    "Cannot update plane of a disabled CRTC.\n");
> >  		return -EINVAL;
> >  	}
> >  
> > @@ -839,8 +839,8 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> >  	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
> >  	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
> >  	if (hscale < 0 || vscale < 0) {
> > -		drm_dbg_kms(plane_state->crtc->dev,
> > -			       "Invalid scaling of plane\n");
> > +		drm_dbg_kms(plane_state->plane->dev,
> > +			    "Invalid scaling of plane\n");
> >  		drm_rect_debug_print("src: ", &plane_state->src, true);
> >  		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> >  		return -ERANGE;
> > @@ -864,8 +864,8 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> >  		return 0;
> >  
> >  	if (!can_position && !drm_rect_equals(dst, &clip)) {
> > -		drm_dbg_kms(plane_state->crtc->dev,
> > -			       "Plane must cover entire CRTC\n");
> > +		drm_dbg_kms(plane_state->plane->dev,
> > +			    "Plane must cover entire CRTC\n");
> >  		drm_rect_debug_print("dst: ", dst, false);
> >  		drm_rect_debug_print("clip: ", &clip, false);
> >  		return -EINVAL;
> > -- 
> > 2.33.0
> > 
> > 
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
