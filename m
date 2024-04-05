Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5485689A54F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 21:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91BF10FC7F;
	Fri,  5 Apr 2024 19:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZSDJ6g3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA6510EEDD;
 Fri,  5 Apr 2024 19:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712347136; x=1743883136;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XY4RJy/2ZwbHoIKNRxA+0RLw9JjMriizQ5W5+WL/w8o=;
 b=aZSDJ6g32lQ8+9M1miKg4rpNg7tH3fsjUsxiviCLNyyGUQDCv8h1SwA3
 4tX+59EXk8xPpkQvbFj6O51yRuDeQNBseQzX4svYrpKEE52Rf6qrngdEd
 O77KlLDkAicgcGdXnpEIDhliYynW7dvkQlJ2qGx+OXmYk9Y7fSn/dPDZu
 efyqZaueACJtK5TGzbuz9pdD5emkmy7Ia02QmjYj7wqfTL8ZkY0yUDj+W
 00fhjGMqBdwnS6yLxtJrLs5IsMCUIybvTFXD6AKDCgpSDhNlrycR1pPMe
 ThV/URCQw41i9YJMTr2mpYnXamA016QiC3yZmXsnaAYlQzHY9biycsL/M Q==;
X-CSE-ConnectionGUID: 9UmB/NlsSaObfj8+gVGQJQ==
X-CSE-MsgGUID: VZk6DaLKSJepXX+7kDF1+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7543361"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7543361"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 12:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="827791004"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="827791004"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 05 Apr 2024 12:58:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Apr 2024 22:58:51 +0300
Date: Fri, 5 Apr 2024 22:58:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 11/12] drm/client: Streamline mode selection debugs
Message-ID: <ZhBX-2FDEJH98IrR@intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-12-ville.syrjala@linux.intel.com>
 <9f689077-529f-431b-9506-e92f8a1d8003@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f689077-529f-431b-9506-e92f8a1d8003@suse.de>
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

On Fri, Apr 05, 2024 at 09:57:07AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 04.04.24 um 22:33 schrieb Ville Syrjala:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Get rid of all the redundant debugs and just wait until the end
> > to print which mode (and of which type) we picked.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   drivers/gpu/drm/drm_client_modeset.c | 65 +++++++++++++---------------
> >   1 file changed, 31 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> > index 415d1799337b..ad88c11037d8 100644
> > --- a/drivers/gpu/drm/drm_client_modeset.c
> > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > @@ -408,6 +408,8 @@ static bool drm_client_target_preferred(struct drm_device *dev,
> >   
> >   retry:
> >   	for (i = 0; i < connector_count; i++) {
> > +		const char *mode_type;
> > +
> >   		connector = connectors[i];
> >   
> >   		if (conn_configured & BIT_ULL(i))
> > @@ -440,20 +442,20 @@ static bool drm_client_target_preferred(struct drm_device *dev,
> >   			drm_client_get_tile_offsets(dev, connectors, connector_count, modes, offsets, i,
> >   						    connector->tile_h_loc, connector->tile_v_loc);
> >   		}
> > -		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
> > -			    connector->base.id, connector->name);
> >   
> > -		/* got for command line mode first */
> > +		mode_type = "cmdline";
> >   		modes[i] = drm_connector_pick_cmdline_mode(connector);
> > +
> >   		if (!modes[i]) {
> > -			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (tile group: %d)\n",
> > -				    connector->base.id, connector->name,
> > -				    connector->tile_group ? connector->tile_group->id : 0);
> > +			mode_type = "preferred";
> >   			modes[i] = drm_connector_preferred_mode(connector, width, height);
> >   		}
> > -		/* No preferred modes, pick one off the list */
> > -		if (!modes[i])
> > +
> > +		if (!modes[i]) {
> > +			mode_type = "first";
> >   			modes[i] = drm_connector_first_mode(connector);
> > +		}
> > +
> >   		/*
> >   		 * In case of tiled mode if all tiles not present fallback to
> >   		 * first available non tiled mode.
> > @@ -468,16 +470,20 @@ static bool drm_client_target_preferred(struct drm_device *dev,
> >   			    (connector->tile_h_loc == 0 &&
> >   			     connector->tile_v_loc == 0 &&
> >   			     !drm_connector_get_tiled_mode(connector))) {
> > -				drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
> > -					    connector->base.id, connector->name);
> > +				mode_type = "non tiled";
> >   				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
> >   			} else {
> > +				mode_type = "tiled";
> >   				modes[i] = drm_connector_get_tiled_mode(connector);
> >   			}
> >   		}
> >   
> > -		drm_dbg_kms(dev, "found mode %s\n",
> > -			    modes[i] ? modes[i]->name : "none");
> > +		if (!modes[i])
> > +			mode_type = "no";
> > +
> > +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] found %s mode: %s\n",
> > +			    connector->base.id, connector->name,
> > +			    mode_type, modes[i] ? modes[i]->name : "none");
> 
> Instead of tracking the whole mode_type thing, maybe just do
> 
> if (!modes[i])
>      drm_dbg_kms(dev, "[CONNECTOR:%d:%s] found mode: " DRM_MODE_FMT, 
> DRM_MODE_ARG(modes[i]) );
> 
> to print the full mode.

The point of the mode_type is to indicate how we derived 
that mode. Printing the full modeline doesn't help with that.

-- 
Ville Syrjälä
Intel
