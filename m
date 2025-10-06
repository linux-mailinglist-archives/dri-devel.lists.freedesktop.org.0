Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7EBBE861
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 17:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B342310E243;
	Mon,  6 Oct 2025 15:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6bDI3ih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D064A10E243
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759765434; x=1791301434;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Aky7ehjBq6ESk0uMdohrza+Xa8WF0tw2YRpmVWUg8fk=;
 b=Q6bDI3ihsiuVweP2bXfCiQccBGiqmVxIHtcqVC2O7aeTR9LoZxgRWu8A
 E0G01kkxsPbH2pzJKPaZWC4qI3KFnw1VssT/ohWLJxMsIin9XjpnbgHRF
 TrggmR509jOjhcme0RUC4GVKmRMa3b8oydDsZ34uSlaGHfYac9WmDSxXn
 RzGxnmBHP06FWyookzUuVuZynmfGz5dliYV1IBf51C9bIP/lLkCi3sASF
 7tNxhVr/F9+ztO36VhupKN/qUxpWCs8gCAXjTmAB5BZds1fYRD8o+q4Ka
 cRdnJCvDSPaIDUwEfF/s1XqtSs88BxPYATHz5tl+UB4v60lEoZi5nq418 A==;
X-CSE-ConnectionGUID: WTi2qLGFQaOt6R8T3OdFJg==
X-CSE-MsgGUID: KJ7Dn+4NTESm6FHGDCmBVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="72616071"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="72616071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:43:53 -0700
X-CSE-ConnectionGUID: wPPdN03rRYef07TkPLFugQ==
X-CSE-MsgGUID: c6yWhAdvRyyndxKQXKoxwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="183938001"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.80])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:43:50 -0700
Date: Mon, 6 Oct 2025 18:43:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, derek.foreman@collabora.com,
 daniel.stone@collabora.com, mripard@redhat.com,
 pekka.paalanen@collabora.com
Subject: Re: [PATCH v2] drm/connector: hdmi: Add a 'link bpc' property
Message-ID: <aOPjs6cuci3P9JrX@intel.com>
References: <20251006083043.3115-1-marius.vlad@collabora.com>
 <aOOKk6j_rHB18hR1@intel.com> <aOPaOHrfVhjORWVD@xpredator>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOPaOHrfVhjORWVD@xpredator>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Oct 06, 2025 at 06:03:20PM +0300, Marius Vlad wrote:
> Hi Ville,
> On Mon, Oct 06, 2025 at 12:23:31PM +0300, Ville Syrjälä wrote:
> > On Mon, Oct 06, 2025 at 11:30:43AM +0300, Marius Vlad wrote:
> > > From: Derek Foreman <derek.foreman@collabora.com>
> > > 
> > > Add a way to know the actual bpc of a running link.
> > > 
> > > Drivers might change the current bpc link value due to changes in mode
> > > line or refresh rates. For example when enabling VRR the underlying
> > > hardware might not be able sustain the same bandwidth for a particular
> > > mode line, and it might attempt to lower the bpc.
> > 
> > Not sure what this VRR stuff is trying to say. Enabling VRR doesn't
> > itself change anything about the link bandwidth.
> > 
> Any time a modeset happens which involves setting up 'max bpc' might
> result in downgrading bpc in an attempt find an optimal output.
> 
> VRR by itself won't do that, neither other possible components or
> blocks, but it might have an affect on it, like a modeset that requires
> a higher refresh rate which can not be done with the currently set bpc.
> 
> Does this feel like it is more to your liking in terms of explaining the
> VRR implication or should I just drop VRR entirely?

I think mentioning VRR is just confusing. The point is simply that link
bandwidth limits (or in fact other internal hardware limits) may require
the link color depth to be reduced.

And BTW this reported bpc value may not even tell you anything about
the effective color depth achieved by the entire pipeline. There maybe
be parts of the pipeline prior to the output link that have a lower
color depth. On Intel hardware I think we could technically keep the
output link running at eg. 12bpc even if there's a 6bpc restriction
upstream of it. And at that point the discussion would probably turn
to dithering, but I won't open that can of worms here, other than
saying that we it very poorly.

> 
> > > Another example can be
> > > found when switching the color output format, part of YUV420 fallback.
> > > 
> > > This means we might be displaying a stale bpc value although it was
> > > modified for different reasons -- like a refresh rate or an output
> > > color format.
> > > 
> > > Introduces a new property 'link bpc' that user-space can use to get the
> > > current bpc value of a running link while in the same time allow
> > > user-space to set-up bpc using 'max bpc' property.
> > > 
> > > An implementation for Weston [1] and a simple test for i-g-t [2] have been added.
> > > 
> > > Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > 
> > > [1] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1850
> > > [2] https://lists.freedesktop.org/archives/igt-dev/2025-October/097061.html
> > > 
> > > ---
> > > 
> > > v1: 
> > > - https://lore.kernel.org/dri-devel/20250801101750.1726-1-marius.vlad@collabora.com/T/#u
> > > 
> > > v2: 
> > > - replace return with EBUSY if connector already exists (Dmitry)
> > > - add i-g-t test and an implementation for Weston (Dmitry)
> > > - re-wording patch description (Jani)
> > >     
> > > 
> > >  drivers/gpu/drm/drm_atomic_uapi.c |  5 +++++
> > >  drivers/gpu/drm/drm_connector.c   | 25 +++++++++++++++++++++++++
> > >  include/drm/drm_connector.h       |  8 ++++++++
> > >  3 files changed, 38 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > > index 85dbdaa4a2e2..15c5ad7ddfb5 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -776,6 +776,9 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
> > >  						   fence_ptr);
> > >  	} else if (property == connector->max_bpc_property) {
> > >  		state->max_requested_bpc = val;
> > > +	} else if (property == connector->link_bpc_property) {
> > > +		drm_dbg_kms(dev, "only drivers can set link bpc property. Use max bpc instead\n");
> > > +		return -EINVAL;
> > 
> > Is there a particular reason this isn't just an immutable prop?
> Did tried passing DRM_MODE_PROP_IMMUTABLE here, but DRM UAPI will not go through 
> drm_atomic_connector_get_property() hence dropping the flag (it goes
> through __drm_object_property_get_prop_value() from what I can tell) and
> with that I don't see the value being updated.

It will have to be updated by calling the appropriate function.

> > 
> > >  	} else if (property == connector->privacy_screen_sw_state_property) {
> > >  		state->privacy_screen_sw_state = val;
> > >  	} else if (property == connector->broadcast_rgb_property) {
> > > @@ -861,6 +864,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
> > >  		*val = 0;
> > >  	} else if (property == connector->max_bpc_property) {
> > >  		*val = state->max_requested_bpc;
> > > +	} else if (property == connector->link_bpc_property) {
> > > +		*val = state->hdmi.output_bpc;
> > 
> > Assuming hdmi here doesn't seem good. What about all the other
> > connector types?
> Right, Jani raised this as well. I don't have a good answer here really.
> I'm using what I have in the tree at the moment.
> 
> On one side this would only be for HDMI type of connectors, and on
> another side only drivers that actually use the helpers would gain
> access to the property.
> 
> When adding support for this Maxime even mentioned that i915/vc4 was using a
> similar algorithm (https://patchwork.freedesktop.org/patch/595684/).
> Itself this patch doesn't even touch that but I gather it does raises a
> few eyebrows as this is strictly for HDMI. I imagined there might be
> reason for just doing this for HDMI but tbh I haven't really followed up
> on that.

The link bpc is much more fluid on DP than on HDMI. So I'd say
DP is more important than HDMI.

Though as mentioned the link bpc doesn't actually tell you anything
about the effecive bpc of the whole pipeline, so whether it's
actually useful for anything real is debatable.

> 
> Do I get that you'd like see this happening for other types of connectors? How
> would that go?
> 
> Would following a similar path we have now in the tree for to the
> broadcast_rgb be something you'd see as reasonable? I see that i915
> hooks its own get_property (intel_digital_connector_atomic_get_property()) 
> which I wasn't aware until now.

I think it should just be an immutable property since you can't
set it anyway. The "immutable" name is pretty bad in fact. What
that flag actually means is the value can't be set by userspace,
but can still change dynamically.

> 
> > 
> > >  	} else if (property == connector->privacy_screen_sw_state_property) {
> > >  		*val = state->privacy_screen_sw_state;
> > >  	} else if (property == connector->broadcast_rgb_property) {
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > index 272d6254ea47..7cc99cd16e20 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -542,6 +542,27 @@ int drmm_connector_init(struct drm_device *dev,
> > >  }
> > >  EXPORT_SYMBOL(drmm_connector_init);
> > >  
> > > +static int
> > > +drm_connector_attach_link_bpc_property(struct drm_connector *connector,
> > > +				       int max)
> > > +{
> > > +	struct drm_device *dev = connector->dev;
> > > +	struct drm_property *prop;
> > > +
> > > +	if (connector->link_bpc_property)
> > > +		return -EBUSY;
> > > +
> > > +	prop = drm_property_create_range(dev, 0, "link bpc", 8, max);
> > > +	if (!prop)
> > > +		return -ENOMEM;
> > > +
> > > +	connector->link_bpc_property = prop;
> > > +
> > > +	drm_object_attach_property(&connector->base, prop, max);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /**
> > >   * drmm_connector_hdmi_init - Init a preallocated HDMI connector
> > >   * @dev: DRM device
> > > @@ -618,6 +639,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> > >  	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
> > >  	connector->max_bpc = max_bpc;
> > >  
> > > +	ret = drm_connector_attach_link_bpc_property(connector, max_bpc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  	if (max_bpc > 8)
> > >  		drm_connector_attach_hdr_output_metadata_property(connector);
> > >  
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index 8f34f4b8183d..4a50198aa7c0 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -2079,6 +2079,14 @@ struct drm_connector {
> > >  	 */
> > >  	struct drm_property *max_bpc_property;
> > >  
> > > +	/**
> > > +	 * @link_bpc_property: Current connector link bpc set by the driver
> > > +	 *
> > > +	 * This property can be used to retrieve the current link bpc from
> > > +	 * connector_state::hdmi:output_bpc
> > > +	 */
> > > +	struct drm_property *link_bpc_property;
> > > +
> > >  	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. */
> > >  	struct drm_privacy_screen *privacy_screen;
> > >  
> > > -- 
> > > 2.47.2
> > 
> > -- 
> > Ville Syrjälä
> > Intel



-- 
Ville Syrjälä
Intel
