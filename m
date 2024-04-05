Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E99189A582
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 22:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B642A10E90A;
	Fri,  5 Apr 2024 20:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqtzmBDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934AC10E7EB;
 Fri,  5 Apr 2024 20:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712347951; x=1743883951;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=svu5A4FKc5wbAa0d4e5CECdHCy0+UhgJuJJaJWoLk88=;
 b=YqtzmBDxLrEVH14cydNSw5AIRoAffUoTo2eCeJ80DBHXzz8m9VFIo59x
 W3m6fAw6zPHldbarU8vb1kzfG0+ID9J2P050g9PDU3mdKMV3eAkak2fiQ
 Ge9Otl1qWv1M9luAMEJwDwEyqO0vis8e2MnWlvnD8XAOA1PCmglAxtQS7
 BHAUxvGdFuF9RqDj3V1Qov1fN3IP2k5q5uj+9oOvd3w/cFpvIcnmZs4SY
 Bi/23a09mNrGy6t5bH8NYQsLjaGyQxuAXaVXHAp/6bpbw9wqI3sTpe+1Y
 KAZfMeiRigXVuRDOkjaQRcRks8CDkIIMwEl6leCjD7qGeGPhqxYouLpsu A==;
X-CSE-ConnectionGUID: PqtzsdKJSn6hYwPPRTzS0Q==
X-CSE-MsgGUID: vkd4Xu9OTZCo7V3XmNMv6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7544790"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7544790"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 13:12:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="827791009"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="827791009"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 05 Apr 2024 13:12:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Apr 2024 23:12:27 +0300
Date: Fri, 5 Apr 2024 23:12:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 10/12] drm/client: Use [CONNECTOR:%d:%s] formatting
Message-ID: <ZhBbK9_yfar6hk_J@intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-11-ville.syrjala@linux.intel.com>
 <87a5m8cj6i.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a5m8cj6i.fsf@intel.com>
X-Patchwork-Hint: comment
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

On Fri, Apr 05, 2024 at 11:23:01AM +0300, Jani Nikula wrote:
> On Thu, 04 Apr 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Switch to the canonical [CONNECTOR:%d:%s] etc. format for
> > printing out kms objects.
> 
> I've been pinging for reviews on [1] for a while now. :/
> 
> I'm just doing what you do in patches 9-10 in one go, and I very much
> prefer having the [CONNECTOR:%d:%s] bit as the first thing in the
> debug. For an individual line your style might read better, but for
> reading a log with a bunch of consecutive lines, I think having it as a
> prefix reads better.
> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/f580f7a20bdea45178cef3940b636d491ae3dd92.1709843865.git.jani.nikula@intel.com
> 

Looks like you have rbs now. I can rebase this
(and see what's left) after your stuff lands.

> 
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_client_modeset.c | 65 +++++++++++++++-------------
> >  1 file changed, 35 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> > index 1751162b7d5c..415d1799337b 100644
> > --- a/drivers/gpu/drm/drm_client_modeset.c
> > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > @@ -251,8 +251,10 @@ static void drm_client_connectors_enabled(struct drm_device *dev,
> >  	for (i = 0; i < connector_count; i++) {
> >  		connector = connectors[i];
> >  		enabled[i] = drm_connector_enabled(connector, true);
> > -		drm_dbg_kms(dev, "connector %d enabled? %s\n", connector->base.id,
> > -			    connector->display_info.non_desktop ? "non desktop" : str_yes_no(enabled[i]));
> > +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] enabled? %s\n",
> > +			    connector->base.id, connector->name,
> > +			    connector->display_info.non_desktop ?
> > +			    "non desktop" : str_yes_no(enabled[i]));
> >  
> >  		any_enabled |= enabled[i];
> >  	}
> > @@ -368,8 +370,8 @@ static int drm_client_get_tile_offsets(struct drm_device *dev,
> >  			continue;
> >  
> >  		if (!modes[i] && (h_idx || v_idx)) {
> > -			drm_dbg_kms(dev, "no modes for connector tiled %d %d\n",
> > -				    i, connector->base.id);
> > +			drm_dbg_kms(dev, "no modes for tiled [CONNECTOR:%d:%s]\n",
> > +				    connector->base.id, connector->name);
> >  			continue;
> >  		}
> >  		if (connector->tile_h_loc < h_idx)
> > @@ -438,14 +440,15 @@ static bool drm_client_target_preferred(struct drm_device *dev,
> >  			drm_client_get_tile_offsets(dev, connectors, connector_count, modes, offsets, i,
> >  						    connector->tile_h_loc, connector->tile_v_loc);
> >  		}
> > -		drm_dbg_kms(dev, "looking for cmdline mode on connector %d\n",
> > -			    connector->base.id);
> > +		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
> > +			    connector->base.id, connector->name);
> >  
> >  		/* got for command line mode first */
> >  		modes[i] = drm_connector_pick_cmdline_mode(connector);
> >  		if (!modes[i]) {
> > -			drm_dbg_kms(dev, "looking for preferred mode on connector %d %d\n",
> > -				    connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
> > +			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (tile group: %d)\n",
> > +				    connector->base.id, connector->name,
> > +				    connector->tile_group ? connector->tile_group->id : 0);
> >  			modes[i] = drm_connector_preferred_mode(connector, width, height);
> >  		}
> >  		/* No preferred modes, pick one off the list */
> > @@ -465,8 +468,8 @@ static bool drm_client_target_preferred(struct drm_device *dev,
> >  			    (connector->tile_h_loc == 0 &&
> >  			     connector->tile_v_loc == 0 &&
> >  			     !drm_connector_get_tiled_mode(connector))) {
> > -				drm_dbg_kms(dev, "Falling back to non tiled mode on Connector %d\n",
> > -					    connector->base.id);
> > +				drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
> > +					    connector->base.id, connector->name);
> >  				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
> >  			} else {
> >  				modes[i] = drm_connector_get_tiled_mode(connector);
> > @@ -634,15 +637,15 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
> >  			num_connectors_detected++;
> >  
> >  		if (!enabled[i]) {
> > -			drm_dbg_kms(dev, "connector %s not enabled, skipping\n",
> > -				    connector->name);
> > +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] not enabled, skipping\n",
> > +				    connector->base.id, connector->name);
> >  			conn_configured |= BIT(i);
> >  			continue;
> >  		}
> >  
> >  		if (connector->force == DRM_FORCE_OFF) {
> > -			drm_dbg_kms(dev, "connector %s is disabled by user, skipping\n",
> > -				    connector->name);
> > +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] is disabled by user, skipping\n",
> > +				    connector->base.id, connector->name);
> >  			enabled[i] = false;
> >  			continue;
> >  		}
> > @@ -652,8 +655,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
> >  			if (connector->force > DRM_FORCE_OFF)
> >  				goto bail;
> >  
> > -			drm_dbg_kms(dev, "connector %s has no encoder or crtc, skipping\n",
> > -				    connector->name);
> > +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] has no encoder or crtc, skipping\n",
> > +				    connector->base.id, connector->name);
> >  			enabled[i] = false;
> >  			conn_configured |= BIT(i);
> >  			continue;
> > @@ -675,23 +678,24 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
> >  			}
> >  		}
> >  
> > -		drm_dbg_kms(dev, "looking for cmdline mode on connector %s\n",
> > -			    connector->name);
> > +		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
> > +			    connector->base.id, connector->name);
> >  
> >  		/* go for command line mode first */
> >  		modes[i] = drm_connector_pick_cmdline_mode(connector);
> >  
> >  		/* try for preferred next */
> >  		if (!modes[i]) {
> > -			drm_dbg_kms(dev, "looking for preferred mode on connector %s %d\n",
> > -				    connector->name, connector->has_tile);
> > +			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (tiled? %s)\n",
> > +				    connector->base.id, connector->name,
> > +				    str_yes_no(connector->has_tile));
> >  			modes[i] = drm_connector_preferred_mode(connector, width, height);
> >  		}
> >  
> >  		/* No preferred mode marked by the EDID? Are there any modes? */
> >  		if (!modes[i] && !list_empty(&connector->modes)) {
> > -			drm_dbg_kms(dev, "using first mode listed on connector %s\n",
> > -				    connector->name);
> > +			drm_dbg_kms(dev, "using first mode listed on [CONNECTOR:%d:%s]\n",
> > +				    connector->base.id, connector->name);
> >  			modes[i] = drm_connector_first_mode(connector);
> >  		}
> >  
> > @@ -702,8 +706,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
> >  			 * is dodgy. Switch to crtc->state->mode, after taking
> >  			 * care of the resulting locking/lifetime issues.
> >  			 */
> > -			drm_dbg_kms(dev, "looking for current mode on connector %s\n",
> > -				    connector->name);
> > +			drm_dbg_kms(dev, "looking for current mode on [CONNECTOR:%d:%s]\n",
> > +				    connector->base.id, connector->name);
> >  			modes[i] = &connector->state->crtc->mode;
> >  		}
> >  		/*
> > @@ -712,14 +716,14 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
> >  		 */
> >  		if (connector->has_tile &&
> >  		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
> > -			drm_dbg_kms(dev, "Falling back to non tiled mode on Connector %d\n",
> > -				    connector->base.id);
> > +			drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
> > +				    connector->base.id, connector->name);
> >  			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
> >  		}
> >  		crtcs[i] = new_crtc;
> >  
> > -		drm_dbg_kms(dev, "connector %s on [CRTC:%d:%s]: %dx%d%s\n",
> > -			    connector->name,
> > +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] on [CRTC:%d:%s]: %dx%d%s\n",
> > +			    connector->base.id, connector->name,
> >  			    connector->state->crtc->base.id,
> >  			    connector->state->crtc->name,
> >  			    modes[i]->hdisplay, modes[i]->vdisplay,
> > @@ -860,8 +864,9 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
> >  			struct drm_mode_set *modeset = drm_client_find_modeset(client, crtc);
> >  			struct drm_connector *connector = connectors[i];
> >  
> > -			drm_dbg_kms(dev, "desired mode %s set on crtc %d (%d,%d)\n",
> > -				    mode->name, crtc->base.id, offset->x, offset->y);
> > +			drm_dbg_kms(dev, "desired mode %s set on [CRTC:%d:%s] (%d,%d)\n",
> > +				    mode->name, crtc->base.id, crtc->name,
> > +				    offset->x, offset->y);
> >  
> >  			if (WARN_ON_ONCE(modeset->num_connectors == DRM_CLIENT_MAX_CLONED_CONNECTORS ||
> >  					 (dev->mode_config.num_crtc > 1 && modeset->num_connectors == 1))) {
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
