Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C115445680
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 16:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EC46EE4A;
	Thu,  4 Nov 2021 15:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56FB6EDFA;
 Thu,  4 Nov 2021 15:41:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="295175449"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="295175449"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 08:41:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="450250513"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 04 Nov 2021 08:41:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Nov 2021 17:41:13 +0200
Date: Thu, 4 Nov 2021 17:41:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 01/13] drm/connector: Add define for HDMI 1.4 Maximum
 Pixel Rate
Message-ID: <YYP/GWqbcvVFIrAj@intel.com>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-2-maxime@cerno.tech>
 <YYJsM6/hZ43b1tm9@intel.com> <YYLPXJoC7TZcwejb@intel.com>
 <20211104084841.mjnennxgelacleaj@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211104084841.mjnennxgelacleaj@gilmour>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, amd-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <dom@raspberrypi.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 09:48:41AM +0100, Maxime Ripard wrote:
> Hi Ville,
> 
> On Wed, Nov 03, 2021 at 08:05:16PM +0200, Ville Syrjälä wrote:
> > On Wed, Nov 03, 2021 at 01:02:11PM +0200, Ville Syrjälä wrote:
> > > On Tue, Nov 02, 2021 at 03:59:32PM +0100, Maxime Ripard wrote:
> > > > --- a/drivers/gpu/drm/drm_edid.c
> > > > +++ b/drivers/gpu/drm/drm_edid.c
> > > > @@ -4966,7 +4966,7 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
> > > >  		u32 max_tmds_clock = hf_vsdb[5] * 5000;
> > > >  		struct drm_scdc *scdc = &hdmi->scdc;
> > > >  
> > > > -		if (max_tmds_clock > 340000) {
> > > > +		if (max_tmds_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
> > > >  			display->max_tmds_clock = max_tmds_clock;
> > > >  			DRM_DEBUG_KMS("HF-VSDB: max TMDS clock %d kHz\n",
> > > >  				display->max_tmds_clock);
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > > > index d2e61f6c6e08..0666203d52b7 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > > > @@ -2226,7 +2226,7 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
> > > >  		if (scdc->scrambling.low_rates)
> > > >  			pipe_config->hdmi_scrambling = true;
> > > >  
> > > > -		if (pipe_config->port_clock > 340000) {
> > > > +		if (pipe_config->port_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
> > > >  			pipe_config->hdmi_scrambling = true;
> > > >  			pipe_config->hdmi_high_tmds_clock_ratio = true;
> > > >  		}
> > > 
> > > All of that is HDMI 2.0 stuff. So this just makes it all super
> > > confusing IMO. Nak.
> > 
> > So reading throgh HDMI 1.4 again it does specify 340 MHz as some kind
> > of upper limit for the physical cable. But nowhere else is that number
> > really mentioned AFAICS. HDMI 2.0 does talk quite a bit about the 340
> > Mcsc limit in various places.
> > 
> > I wonder what people would think of a couple of helpers like:
> > - drm_hdmi_{can,must}_use_scrambling()
> > - drm_hdmi_is_high_tmds_clock_ratio()
> > or something along those lines? At least with those the code would
> > read decently and I wouldn't have to wonder what this HDMI 1.4 TMDS
> > clock limit really is.
> 
> Patch 2 introduces something along those lines.
> 
> It doesn't cover everything though, we're using this define in vc4 to
> limit the available modes in mode_valid on HDMI controllers not
> 4k-capable

I wouldn't want to use this kind of define for those kinds of checks
anyway. If the hardware has specific limits in what kind of clocks it
can generate (or what it was validated for) IMO you should spell
those out explicitly instead of assuming they happen to match
some standard defined max value.

-- 
Ville Syrjälä
Intel
