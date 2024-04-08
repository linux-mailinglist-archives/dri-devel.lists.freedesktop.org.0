Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701E489CAB9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDC11128FB;
	Mon,  8 Apr 2024 17:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VB/Q30IA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DCE1128FA;
 Mon,  8 Apr 2024 17:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712597176; x=1744133176;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iE5SxEOcIDrXPM1wB9J8/QClBe1NcQE7JAThZZbyKCM=;
 b=VB/Q30IAAZFZinaANPvQdxZUrRTJ2O+SesMtru5ScCK7ZVIwD86N4sRB
 1uNH1IuAC85mGKIr9IXI0PAFwzcTHsCznCleEnpRZ73K1+JKRVCulYnwP
 Mt6XwC50hmHGL3LHMqwL6lMxYbYJFH+jhrWqzNg7YrRm4O+vEOQTap7fl
 cbBGrR73bpFvqyEJ7qjNILjcuEPn/1ixItInt8zLbEUkjpdxZGcIVXG+V
 KkBMQTMVHVKiZbbrwKB2qpR/BLeG9lyD23Cz901dAqiY/0gXIsg2IDgTb
 i4rfWYs9EtdfjxoOswfIto51+NMQfRsSXtw0zRrJQ0mm01yYP4MRyPwhs A==;
X-CSE-ConnectionGUID: vlMrwuL/SvGEk7evSsyM8Q==
X-CSE-MsgGUID: S2wYZxLBRSWTV9pGceW0TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7795152"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7795152"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792350"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792350"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:26:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:26:12 +0300
Date: Mon, 8 Apr 2024 20:26:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 11/12] drm/client: Streamline mode selection debugs
Message-ID: <ZhQotN--J99J1Ayk@intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-12-ville.syrjala@linux.intel.com>
 <9f689077-529f-431b-9506-e92f8a1d8003@suse.de>
 <ZhBX-2FDEJH98IrR@intel.com>
 <752f5073-20b3-4671-bf12-1cf0756313a6@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <752f5073-20b3-4671-bf12-1cf0756313a6@suse.de>
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

On Mon, Apr 08, 2024 at 09:46:44AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.04.24 um 21:58 schrieb Ville Syrjälä:
> > On Fri, Apr 05, 2024 at 09:57:07AM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 04.04.24 um 22:33 schrieb Ville Syrjala:
> >>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>>
> >>> Get rid of all the redundant debugs and just wait until the end
> >>> to print which mode (and of which type) we picked.
> >>>
> >>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>> ---
> >>>    drivers/gpu/drm/drm_client_modeset.c | 65 +++++++++++++---------------
> >>>    1 file changed, 31 insertions(+), 34 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> >>> index 415d1799337b..ad88c11037d8 100644
> >>> --- a/drivers/gpu/drm/drm_client_modeset.c
> >>> +++ b/drivers/gpu/drm/drm_client_modeset.c
> >>> @@ -408,6 +408,8 @@ static bool drm_client_target_preferred(struct drm_device *dev,
> >>>    
> >>>    retry:
> >>>    	for (i = 0; i < connector_count; i++) {
> >>> +		const char *mode_type;
> >>> +
> >>>    		connector = connectors[i];
> >>>    
> >>>    		if (conn_configured & BIT_ULL(i))
> >>> @@ -440,20 +442,20 @@ static bool drm_client_target_preferred(struct drm_device *dev,
> >>>    			drm_client_get_tile_offsets(dev, connectors, connector_count, modes, offsets, i,
> >>>    						    connector->tile_h_loc, connector->tile_v_loc);
> >>>    		}
> >>> -		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
> >>> -			    connector->base.id, connector->name);
> >>>    
> >>> -		/* got for command line mode first */
> >>> +		mode_type = "cmdline";
> >>>    		modes[i] = drm_connector_pick_cmdline_mode(connector);
> >>> +
> >>>    		if (!modes[i]) {
> >>> -			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (tile group: %d)\n",
> >>> -				    connector->base.id, connector->name,
> >>> -				    connector->tile_group ? connector->tile_group->id : 0);
> >>> +			mode_type = "preferred";
> >>>    			modes[i] = drm_connector_preferred_mode(connector, width, height);
> >>>    		}
> >>> -		/* No preferred modes, pick one off the list */
> >>> -		if (!modes[i])
> >>> +
> >>> +		if (!modes[i]) {
> >>> +			mode_type = "first";
> >>>    			modes[i] = drm_connector_first_mode(connector);
> >>> +		}
> >>> +
> >>>    		/*
> >>>    		 * In case of tiled mode if all tiles not present fallback to
> >>>    		 * first available non tiled mode.
> >>> @@ -468,16 +470,20 @@ static bool drm_client_target_preferred(struct drm_device *dev,
> >>>    			    (connector->tile_h_loc == 0 &&
> >>>    			     connector->tile_v_loc == 0 &&
> >>>    			     !drm_connector_get_tiled_mode(connector))) {
> >>> -				drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
> >>> -					    connector->base.id, connector->name);
> >>> +				mode_type = "non tiled";
> >>>    				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
> >>>    			} else {
> >>> +				mode_type = "tiled";
> >>>    				modes[i] = drm_connector_get_tiled_mode(connector);
> >>>    			}
> >>>    		}
> >>>    
> >>> -		drm_dbg_kms(dev, "found mode %s\n",
> >>> -			    modes[i] ? modes[i]->name : "none");
> >>> +		if (!modes[i])
> >>> +			mode_type = "no";
> >>> +
> >>> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] found %s mode: %s\n",
> >>> +			    connector->base.id, connector->name,
> >>> +			    mode_type, modes[i] ? modes[i]->name : "none");
> >> Instead of tracking the whole mode_type thing, maybe just do
> >>
> >> if (!modes[i])
> >>       drm_dbg_kms(dev, "[CONNECTOR:%d:%s] found mode: " DRM_MODE_FMT,
> >> DRM_MODE_ARG(modes[i]) );
> >>
> >> to print the full mode.
> > The point of the mode_type is to indicate how we derived
> > that mode. Printing the full modeline doesn't help with that.
> 
> But do we care where the mode comes from? At least from my experience, 
> it's much more important to know which modes had been available.

The tiled vs. not-tiled at least could be quite interesting.
We know there are actual bugs in this code where some tiled 
connectors seem to incorrectly think they aren't tiled
while others correctly think they are tiled. Seeing that
spelled out more clearly in the logs might help with triage.

> 
> If the source of the mode is really important, the old messages seem 
> preferable to me.

The old debugs were somewhat crap. They basically just said
"looking for mode via <method X>", and then the last one of those
you saw in the log you assumed was the method used in the end.
But not all methods even had that debug print. So basically you
could never be sure what method was used in the end.

> Debugging code should be trivial and not add logic or 
> flow control to a function IMHO.

It doesn't add anything of the sort. The control flow
is 100% based on mode==NULL.

-- 
Ville Syrjälä
Intel
