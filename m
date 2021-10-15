Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EDD42FADD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 20:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261E66E328;
	Fri, 15 Oct 2021 18:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9076E328;
 Fri, 15 Oct 2021 18:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634321905; bh=1VndzjUeawRA8d8RwzAyEZowufMDZOYQqLWy+ltAJEU=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 b=UKeg2GVdCI0w1dPlYBaHkcK/e2KIR4CeneWS0wjvFYc1l3pEU/djYcsZhVXv9ai2R
 2n9qDoCzCUMy2hShz/S9eDd5CiJ0hzZNLZqPjsM+3EAYa9/mbwkwOtCgyMcDAR1qLk
 iYvlJM/wNwMJNp9qeInmBVQ6Sme2uC9PK/uIXi8o=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 15 Oct 2021 20:18:25 +0200 (CEST)
X-EA-Auth: Ke3j40edxa5zyRppT8zm7efebU7rog2QZGoFU5BfjFjkb+vfDP6LQWWLPeK+cJslY6G60w+Npxo1AjT46xfcZOjuVGexvZ1g
Date: Fri, 15 Oct 2021 20:18:22 +0200
From: Claudio Suarez <cssk@net-c.es>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 15/15] drm/i915: replace
 drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Message-ID: <YWnF7qqTh+6uFIHS@gineta.localdomain>
References: <20211015113713.630119-1-cssk@net-c.es>
 <20211015113713.630119-16-cssk@net-c.es>
 <YWl0ebn23tVXL6jP@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWl0ebn23tVXL6jP@intel.com>
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

On Fri, Oct 15, 2021 at 03:30:49PM +0300, Ville Syrjälä wrote:
> On Fri, Oct 15, 2021 at 01:37:13PM +0200, Claudio Suarez wrote:
> > Once EDID is parsed, the monitor HDMI support information is available
> > through drm_display_info.is_hdmi. Retriving the same information with
> > drm_detect_hdmi_monitor() is less efficient. Change to
> > drm_display_info.is_hdmi where possible.
> > 
> > This is a TODO task in Documentation/gpu/todo.rst
> > 
> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> > ---
> >  drivers/gpu/drm/i915/display/intel_connector.c | 5 +++++
> >  drivers/gpu/drm/i915/display/intel_connector.h | 1 +
> >  drivers/gpu/drm/i915/display/intel_hdmi.c      | 2 +-
> >  drivers/gpu/drm/i915/display/intel_sdvo.c      | 3 ++-
> >  4 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
> > index 9bed1ccecea0..3346b55df6e1 100644
> > --- a/drivers/gpu/drm/i915/display/intel_connector.c
> > +++ b/drivers/gpu/drm/i915/display/intel_connector.c
> > @@ -213,6 +213,11 @@ int intel_ddc_get_modes(struct drm_connector *connector,
> >  	return ret;
> >  }
> >  
> > +bool intel_connector_is_hdmi_monitor(struct drm_connector *connector)
> > +{
> > +	return connector->display_info.is_hdmi;
> > +}
> > +
> >  static const struct drm_prop_enum_list force_audio_names[] = {
> >  	{ HDMI_AUDIO_OFF_DVI, "force-dvi" },
> >  	{ HDMI_AUDIO_OFF, "off" },
> > diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu/drm/i915/display/intel_connector.h
> > index 661a37a3c6d8..ceda6e72ece6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_connector.h
> > +++ b/drivers/gpu/drm/i915/display/intel_connector.h
> > @@ -27,6 +27,7 @@ enum pipe intel_connector_get_pipe(struct intel_connector *connector);
> >  int intel_connector_update_modes(struct drm_connector *connector,
> >  				 struct edid *edid);
> >  int intel_ddc_get_modes(struct drm_connector *c, struct i2c_adapter *adapter);
> > +bool intel_connector_is_hdmi_monitor(struct drm_connector *connector);
> >  void intel_attach_force_audio_property(struct drm_connector *connector);
> >  void intel_attach_broadcast_rgb_property(struct drm_connector *connector);
> >  void intel_attach_aspect_ratio_property(struct drm_connector *connector);
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > index b04685bb6439..2b1d7c5bebdd 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > @@ -2355,7 +2355,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
> >  	to_intel_connector(connector)->detect_edid = edid;
> >  	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
> >  		intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
> > -		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
> > +		intel_hdmi->has_hdmi_sink = intel_connector_is_hdmi_monitor(connector);
> 
> Hmm. Have we parse the EDID by this point actually? I don't think that
> was the case in the past but maybe it changed at some point.

Yes, I think so. The complete code is:

----
        edid = drm_get_edid(connector, i2c);

        if (!edid && !intel_gmbus_is_forced_bit(i2c)) {
                drm_dbg_kms(&dev_priv->drm,
                            "HDMI GMBUS EDID read failed, retry using GPIO bit-banging\n");
                intel_gmbus_force_bit(i2c, true);
                edid = drm_get_edid(connector, i2c);
                intel_gmbus_force_bit(i2c, false);
        }

        intel_hdmi_dp_dual_mode_detect(connector, edid != NULL);

        intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);

        to_intel_connector(connector)->detect_edid = edid;
        if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
                intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
                intel_hdmi->has_hdmi_sink = intel_connector_is_hdmi_monitor(connector);
----
The edid value comes from drm_get_edid(), first or second.
drm_get_edid() internally calls drm_connector_update_edid_property()
drm_connector_update_edid_property() calls drm_add_display_info() and parses the edid.
So, the edid is parsed.
I checked this and I read the docs many times because at the first time I felt something
was wrong. But that is the sequence of calls.

> 
> >  
> >  		connected = true;
> >  	}
> > diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> > index 6cb27599ea03..a32279e4fee8 100644
> > --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> > +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> > @@ -2060,8 +2060,9 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
> >  		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
> >  			status = connector_status_connected;
> >  			if (intel_sdvo_connector->is_hdmi) {
> > -				intel_sdvo->has_hdmi_monitor = drm_detect_hdmi_monitor(edid);
> >  				intel_sdvo->has_hdmi_audio = drm_detect_monitor_audio(edid);
> > +				intel_sdvo->has_hdmi_monitor =
> > +					intel_connector_is_hdmi_monitor(connector);
> 
> FYI there's a third copy of this in intel_dp.c

Yes. But in this case the edid comes from intel_dp_get_edid().
In intel_dp_get_edid(), there is a if. One of the branches calls drm_get_edid(),
so no problem here. But the other branch gets the edid from drm_edid_duplicate().
I haven't seen any guarantee that display_info is updated in this case.

I didn't change this file for that reason.

Thank you for your comments :)

BR
Claudio Suarez.



