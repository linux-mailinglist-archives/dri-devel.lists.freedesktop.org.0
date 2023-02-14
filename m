Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D823E69619E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE0C10E86F;
	Tue, 14 Feb 2023 11:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985BE10E86F;
 Tue, 14 Feb 2023 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676372475; x=1707908475;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QFZ6gIYKdFwXXjwICtVN3RKyd1hBaRSh3g4HBLsNyz0=;
 b=ZkiEZaAI7qKjIVTikfniJY4ktkv8JE28KbFhOlJ3I0N1aPf3OEDl/LhO
 Two2gBl/Ew5Ts4s8sUe1Nl+rluyUQthYlQsZNlL4Ok6iwIO5ggaG+vObu
 qA5gGAPBM7Q30P44SHMVYDlr8z8/g6sAHyZcFUiC/aBTVcmA5lH4VCwI/
 YoM17GoW96eAkuCybjfrNsp0AGex7n8lvlmXJrOIfadJkcFYsa2qH16Cb
 gcdmyPA25L/V2hVmXrpgTOnk+4PcMg+gix07buI6u6K5HMAsrfnIcyef4
 GVi/LYtpxvqWHHzOiJRHx5wEdwY52BKyWdCAetw0KcXH/5sxSFEnjZv3e w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328843901"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="328843901"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:00:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="843123531"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="843123531"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:00:25 -0800
Date: Tue, 14 Feb 2023 13:00:22 +0200
From: Imre Deak <imre.deak@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Cc: drm-misc folks] Re: [Intel-gfx] [CI 1/4] drm/i915/dp_mst:
 Add the MST topology state for modesetted CRTCs
Message-ID: <Y+tpxqEoyaAYehPQ@ideak-desk.fi.intel.com>
References: <20230206114856.2665066-1-imre.deak@intel.com>
 <Y+JLQfuSAS6xLPIS@ideak-desk.fi.intel.com>
 <0b5a4e81dc98f9c28d77f0f53741712d1c7c3c09.camel@redhat.com>
 <87bkm1x0dk.fsf@intel.com>
 <CO6PR12MB548949E961F9FE5627BA5064FCDD9@CO6PR12MB5489.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CO6PR12MB548949E961F9FE5627BA5064FCDD9@CO6PR12MB5489.namprd12.prod.outlook.com>
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
Reply-To: imre.deak@intel.com
Cc: Mario Limonciello <Mario.Limonciello@amd.com>,
 Karol Herbst <kherbst@redhat.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 10:41:32AM +0000, Lin, Wayne wrote:
> [Public]
> 
> Add Mario for awareness.
> 
> > -----Original Message-----
> > From: Jani Nikula <jani.nikula@intel.com>
> > Sent: Friday, February 10, 2023 6:48 PM
> > To: Lyude Paul <lyude@redhat.com>; imre.deak@intel.com; Wentland,
> > Harry <Harry.Wentland@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: stable@vger.kernel.org; intel-gfx@lists.freedesktop.org; dri-
> > devel@lists.freedesktop.org; Ville Syrjälä <ville.syrjala@linux.intel.com>; Ben
> > Skeggs <bskeggs@redhat.com>; Lin, Wayne <Wayne.Lin@amd.com>; Karol
> > Herbst <kherbst@redhat.com>; Thomas Zimmermann
> > <tzimmermann@suse.de>
> > Subject: Re: [Cc: drm-misc folks] Re: [Intel-gfx] [CI 1/4] drm/i915/dp_mst:
> > Add the MST topology state for modesetted CRTCs
> > 
> > On Thu, 09 Feb 2023, Lyude Paul <lyude@redhat.com> wrote:
> > > On Tue, 2023-02-07 at 14:59 +0200, Imre Deak wrote:
> > >> Hi all,
> > >>
> > >> On Mon, Feb 06, 2023 at 01:48:53PM +0200, Imre Deak wrote:
> > >> > Add the MST topology for a CRTC to the atomic state if the driver
> > >> > needs to force a modeset on the CRTC after the encoder compute
> > >> > config functions are called.
> > >> >
> > >> > Later the MST encoder's disable hook also adds the state, but that
> > >> > isn't guaranteed to work (since in that hook getting the state may
> > >> > fail, which can't be handled there). This should fix that, while a
> > >> > later patch fixes the use of the MST state in the disable hook.
> > >> >
> > >> > v2: Add missing forward struct declartions, caught by hdrtest.
> > >> > v3: Factor out intel_dp_mst_add_topology_state_for_connector() used
> > >> >     later in the patchset.
> > >> >
> > >> > Cc: Lyude Paul <lyude@redhat.com>
> > >> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > >> > Cc: stable@vger.kernel.org # 6.1
> > >> > Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com> # v2
> > >> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > >> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > >>
> > >> Is it ok to merge these 4 patches (also at [1]), via the i915 tree?
> > >>
> > >> If so could it be also acked from the AMD and Nouveau side?
> > >
> > > Whichever branch works best for y'all is fine by me, if it's via
> > > i915's tree I guess we might need to back-merge drm-misc at some point
> > > so I can write up equivalent fixes for nouveau as well.
> > >
> > > (Added Thomas Zimmermann to Cc)
> > 
> > I suggest merging the series via drm-misc-next-fixes branch, to get them to
> > Linus' tree in the upcoming merge window. They all apply cleanly there. The
> > drivers can backmerge them from drm-next in the mean time, or wait for
> > v6.3-rc1.
> > 
> > Daniel acked this (well, any -next-fixes branch) on IRC yesterday, obviously
> > ack from me too.
> > 
> > I take the above as Lyude's ack for nouveau.
> > 
> > Harry, Wayne, do you agree with this, ack for merging the AMD part via drm-
> > misc-next-fixes? (Alex suggested to get your input.)
> 
> Thank you Imre, Lyude and Jani.
> That looks good to me and I agree with that.

Ok, thanks all, pushed the patchset to drm-misc-next-fixes.

> Thanks!
> 
> Regards,
> Wayne
> > 
> > BR,
> > Jani.
> > 
> > 
> > >
> > >>
> > >> [1] https://patchwork.freedesktop.org/series/113703/
> > >>
> > >> > ---
> > >> >  drivers/gpu/drm/i915/display/intel_display.c |  4 ++
> > >> > drivers/gpu/drm/i915/display/intel_dp_mst.c  | 61
> > >> > ++++++++++++++++++++
> > drivers/gpu/drm/i915/display/intel_dp_mst.h
> > >> > |  4 ++
> > >> >  3 files changed, 69 insertions(+)
> > >> >
> > >> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > >> > b/drivers/gpu/drm/i915/display/intel_display.c
> > >> > index 166662ade593c..38106cf63b3b9 100644
> > >> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > >> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > >> > @@ -5936,6 +5936,10 @@ int intel_modeset_all_pipes(struct
> > intel_atomic_state *state,
> > >> >  		if (ret)
> > >> >  			return ret;
> > >> >
> > >> > +		ret = intel_dp_mst_add_topology_state_for_crtc(state, crtc);
> > >> > +		if (ret)
> > >> > +			return ret;
> > >> > +
> > >> >  		ret = intel_atomic_add_affected_planes(state, crtc);
> > >> >  		if (ret)
> > >> >  			return ret;
> > >> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > >> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > >> > index 8b0e4defa3f10..f3cb12dcfe0a7 100644
> > >> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > >> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > >> > @@ -1223,3 +1223,64 @@ bool intel_dp_mst_is_slave_trans(const
> > struct intel_crtc_state *crtc_state)
> > >> >  	return crtc_state->mst_master_transcoder !=
> > INVALID_TRANSCODER &&
> > >> >  	       crtc_state->mst_master_transcoder !=
> > >> > crtc_state->cpu_transcoder;  }
> > >> > +
> > >> > +/**
> > >> > + * intel_dp_mst_add_topology_state_for_connector - add MST
> > >> > +topology state for a connector
> > >> > + * @state: atomic state
> > >> > + * @connector: connector to add the state for
> > >> > + * @crtc: the CRTC @connector is attached to
> > >> > + *
> > >> > + * Add the MST topology state for @connector to @state.
> > >> > + *
> > >> > + * Returns 0 on success, negative error code on failure.
> > >> > + */
> > >> > +static int
> > >> > +intel_dp_mst_add_topology_state_for_connector(struct
> > intel_atomic_state *state,
> > >> > +					      struct intel_connector *connector,
> > >> > +					      struct intel_crtc *crtc) {
> > >> > +	struct drm_dp_mst_topology_state *mst_state;
> > >> > +
> > >> > +	if (!connector->mst_port)
> > >> > +		return 0;
> > >> > +
> > >> > +	mst_state = drm_atomic_get_mst_topology_state(&state->base,
> > >> > +						      &connector->mst_port-
> > >mst_mgr);
> > >> > +	if (IS_ERR(mst_state))
> > >> > +		return PTR_ERR(mst_state);
> > >> > +
> > >> > +	mst_state->pending_crtc_mask |= drm_crtc_mask(&crtc->base);
> > >> > +
> > >> > +	return 0;
> > >> > +}
> > >> > +
> > >> > +/**
> > >> > + * intel_dp_mst_add_topology_state_for_crtc - add MST topology
> > >> > +state for a CRTC
> > >> > + * @state: atomic state
> > >> > + * @crtc: CRTC to add the state for
> > >> > + *
> > >> > + * Add the MST topology state for @crtc to @state.
> > >> > + *
> > >> > + * Returns 0 on success, negative error code on failure.
> > >> > + */
> > >> > +int intel_dp_mst_add_topology_state_for_crtc(struct
> > intel_atomic_state *state,
> > >> > +					     struct intel_crtc *crtc) {
> > >> > +	struct drm_connector *_connector;
> > >> > +	struct drm_connector_state *conn_state;
> > >> > +	int i;
> > >> > +
> > >> > +	for_each_new_connector_in_state(&state->base, _connector,
> > conn_state, i) {
> > >> > +		struct intel_connector *connector =
> > to_intel_connector(_connector);
> > >> > +		int ret;
> > >> > +
> > >> > +		if (conn_state->crtc != &crtc->base)
> > >> > +			continue;
> > >> > +
> > >> > +		ret =
> > intel_dp_mst_add_topology_state_for_connector(state, connector, crtc);
> > >> > +		if (ret)
> > >> > +			return ret;
> > >> > +	}
> > >> > +
> > >> > +	return 0;
> > >> > +}
> > >> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.h
> > >> > b/drivers/gpu/drm/i915/display/intel_dp_mst.h
> > >> > index f7301de6cdfb3..f1815bb722672 100644
> > >> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.h
> > >> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.h
> > >> > @@ -8,6 +8,8 @@
> > >> >
> > >> >  #include <linux/types.h>
> > >> >
> > >> > +struct intel_atomic_state;
> > >> > +struct intel_crtc;
> > >> >  struct intel_crtc_state;
> > >> >  struct intel_digital_port;
> > >> >  struct intel_dp;
> > >> > @@ -18,5 +20,7 @@ int intel_dp_mst_encoder_active_links(struct
> > >> > intel_digital_port *dig_port);  bool
> > >> > intel_dp_mst_is_master_trans(const struct intel_crtc_state
> > >> > *crtc_state);  bool intel_dp_mst_is_slave_trans(const struct
> > >> > intel_crtc_state *crtc_state);  bool
> > >> > intel_dp_mst_source_support(struct intel_dp *intel_dp);
> > >> > +int intel_dp_mst_add_topology_state_for_crtc(struct
> > intel_atomic_state *state,
> > >> > +					     struct intel_crtc *crtc);
> > >> >
> > >> >  #endif /* __INTEL_DP_MST_H__ */
> > >> > --
> > >> > 2.37.1
> > >> >
> > >>
> > 
> > --
> > Jani Nikula, Intel Open Source Graphics Center
