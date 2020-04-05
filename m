Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD4819EE74
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 00:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7B489AAE;
	Sun,  5 Apr 2020 22:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8798F89ACC
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 22:56:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECBB4312;
 Mon,  6 Apr 2020 00:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586127389;
 bh=tTMxIRWuB4sJFl1jywtKuTGHGWSmHAxKw8LMwRvMDP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwgkC4IN0b5xqZIj8gyPyO6OqVc9eTQ24Zy6qClDdhSpAKJKc53dBKh/nJrhBIC4B
 6S2dEXbC8/XiuP+A1AB7tl2zxAbzFs/FA7njMKvZLvFnkxvFE/HQnK6tnBV2A6PFCp
 8LApTdgvcpAdrTveDTV8Zlb+dIytVT32/pbV3xts=
Date: Mon, 6 Apr 2020 01:56:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 4/6] drm: writeback: document callbacks
Message-ID: <20200405225620.GS5846@pendragon.ideasonboard.com>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-5-sam@ravnborg.org>
 <20200331075318.GF2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331075318.GF2363188@phenom.ffwll.local>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Tue, Mar 31, 2020 at 09:53:18AM +0200, Daniel Vetter wrote:
> On Sat, Mar 28, 2020 at 02:20:23PM +0100, Sam Ravnborg wrote:
> > Document the callbacks:
> >     drm_connector_helper_funcs.prepare_writeback_job
> >     drm_connector_helper_funcs.cleanup_writeback_job
> > 
> > The documentation was pulled from the changelong introducing the
> > callbacks, originally written by Laurent.
> > 
> > Addign the missing documentation fixes the following warnings:
> > drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'prepare_writeback_job' not described in 'drm_connector_helper_funcs'
> > drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'cleanup_writeback_job' not described in 'drm_connector_helper_funcs'
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > ---
> >  include/drm/drm_modeset_helper_vtables.h | 31 ++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > index 7c20b1c8b6a7..c51bca1ffec7 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -1075,8 +1075,39 @@ struct drm_connector_helper_funcs {
> >  	void (*atomic_commit)(struct drm_connector *connector,
> >  			      struct drm_connector_state *state);
> >  
> > +	/**
> > +	 * @prepare_writeback_job:
> 
> Formatting looks funny, your linebreaks here won't go into the generated
> html and are a bit unusual. I'd remove them and just flow this as a full
> paragraph.
> 
> > +	 *
> > +	 * As writeback jobs contain a framebuffer, drivers may need to
> > +	 * prepare and cleanup them the same way they can prepare and

"cleanup them" or "clean them up" ?

> > +	 * cleanup framebuffers for planes.

This would be "clean up" too.

> > +	 * This optional connector operation is used to support the
> > +	 * preparation of writeback jobs.
> > +	 * The job prepare operation is called from
> > +	 * drm_atomic_helper_prepare_planes() to avoid a new atomic commit
> > +	 * helper that would need to be called by all drivers not using
> > +	 * drm_atomic_helper_commit().
> 
> I'd delete "to avoid a new ..." until the end of the sentence. That feels
> more like stuff in the commit message/review than kernel docs for driver
> writers.
> 
> Instead maybe add "... for struct &drm_writeback_connector connectors
> only." This gives us a nice link to the writeback docs, and makes it clear
> that this isn't some general prep/cleanup thing. Similar addition below.
> 
> > +	 *
> > +	 * This hook is optional.
> > +	 *
> > +	 * This callback is used by the atomic modeset helpers.

"hook" or "callback", you decide, but let's be consistent :-) I'd go for
"operation" personally as that's what is used above. Same for the
cleanup_writeback_job operation below.

> > +	 */
> >  	int (*prepare_writeback_job)(struct drm_writeback_connector *connector,
> >  				     struct drm_writeback_job *job);
> > +	/**
> > +	 * @cleanup_writeback_job:
> > +	 *
> > +	 * This optional connector operation is used to support the
> > +	 * cleanup of writeback jobs.
> > +	 * The job cleanup operation is called from the existing
> > +	 * drm_writeback_cleanup_job() function, invoked both when
> > +	 * destroying the job as part of a aborted commit, or when

s/a aborted/an aborted/

> > +	 * the job completes.
> > +	 *
> > +	 * This hook is optional.
> > +	 *
> > +	 * This callback is used by the atomic modeset helpers.
> > +	 */
> >  	void (*cleanup_writeback_job)(struct drm_writeback_connector *connector,
> >  				      struct drm_writeback_job *job);
> 
> With the bikesheds addressed as you see fit:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Also Laurent owes you one, I've been pestering to fill this gap in his
> docs since forever ...

I do. Sorry for letting you fix it.

> >  };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
