Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A672860AFD1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B436610E8C6;
	Mon, 24 Oct 2022 15:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A637010E8AB;
 Mon, 24 Oct 2022 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666627102; x=1698163102;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=a87um/jPYpvuCY1yoODVcl4PujAsM9oGBHFvV8Met0A=;
 b=l9QEhxt7r1BlKTzpOO2tdqg8QVN3exxOqhaEMsPXsNQTXv0q32RtU4uT
 q/A6/Yf+cOpAUZtPSFQLlnHTxeyAteq9WfyC0NbQ4lDf7ApOkUaOrfdE0
 BFVcAjogDhaYkbI9+4G+Eqwt3b3waL8/ogEWn+PeqUa+S3HpBTg4hdA8Y
 Z+Z2W5MpzETB86PhjkzxQAYrn1O0QgjWJSIcpal2rNDacbbKNhBoA7W1f
 r7d+mZChwYktxJB0XJ4402swy5c+D90p0kgGvxzUB/ttQcPeVxyjaG8Og
 2F/XHE0PsOzPex+TQ559acKIsR3PPOuWte7ipSei+Ff6ui0UT9YvxCDWY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287174459"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287174459"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 08:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="876482767"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="876482767"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga006.fm.intel.com with SMTP; 24 Oct 2022 08:58:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Oct 2022 18:58:09 +0300
Date: Mon, 24 Oct 2022 18:58:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [igt-dev] Must-Pass Test Suite for KMS drivers
Message-ID: <Y1a2Eb1rwMyk35v+@intel.com>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
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
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, maxime@cerno.tech,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 08:48:15AM -0700, Rob Clark wrote:
> On Mon, Oct 24, 2022 at 5:43 AM <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > I've discussing the idea for the past year to add an IGT test suite that
> > all well-behaved KMS drivers must pass.
> >
> > The main idea behind it comes from v4l2-compliance and cec-compliance,
> > that are being used to validate that the drivers are sane.
> >
> > We should probably start building up the test list, and eventually
> > mandate that all tests pass for all the new KMS drivers we would merge
> > in the kernel, and be run by KCi or similar.
> 
> Let's get https://patchwork.freedesktop.org/patch/502641/ merged
> first, that already gives us a mechanism similar to what we use in
> mesa to track pass/fail/flake
> 
> Beyond that, I think some of the igt tests need to get more stable
> before we could consider a "mustpass" list.  The kms_lease tests seem
> to fail on msm due to bad assumptions in the test about which CRTCs
> primary planes can attach to.  The legacy-cursor crc tests seem a bit
> racy (there was a patch posted for that, not sure if it landed yet),
> etc.

I think the safest set to start with would be pure uapi validation
stuff. Anything that interactics with real world hardware is a much
tougher cookie.

> 
> The best thing to do is actually start running CI and tracking xfails
> and flakes ;-)
> 
> BR,
> -R
> 
> > I did a first pass to create a draft of such a test-suite, which would
> > contain:
> >
> > igt@core_auth@basic-auth
> > igt@core_auth@getclient-master-drop
> > igt@core_auth@getclient-simple
> > igt@core_auth@many-magics
> > igt@core_getclient
> > igt@core_getstats
> > igt@core_getversion
> > igt@core_hotunplug@hotrebind-lateclose
> > igt@core_hotunplug@hotunbind-rebind
> > igt@core_hotunplug@unbind-rebind
> > igt@core_setmaster
> > igt@core_setmaster_vs_auth
> > igt@device_reset@unbind-reset-rebind
> > igt@drm_read
> > igt@dumb_buffer
> > igt@fbdev
> > igt@feature_discovery@display
> > igt@kms_3d
> > igt@kms_addfb_basic
> > igt@kms_async_flips
> > igt@kms_color
> > igt@kms_concurrent
> > igt@kms_cursor_crc
> > igt@kms_cursor_edge_walk
> > igt@kms_cursor_legacy@basic-busy-flip-before-cursor
> > igt@kms_cursor_legacy@basic-flip-after-cursor
> > igt@kms_cursor_legacy@basic-flip-after-cursor
> > igt@kms_display_modes
> > igt@kms_dither
> > igt@kms_dp_aux_dev
> > igt@kms_flip@basic-flip-vs-dpms
> > igt@kms_flip@basic-flip-vs-modeset
> > igt@kms_flip@basic-flip-vs-wf_vblank
> > igt@kms_flip@basic-plain-flip
> > igt@kms_flip_event_leak@basic
> > igt@kms_force_connector_basic@force-connector-state
> > igt@kms_force_connector_basic@force-edid
> > igt@kms_force_connector_basic@force-load-detect
> > igt@kms_force_connector_basic@prune-stale-modes
> > igt@kms_getfb
> > igt@kms_hdmi_inject
> > igt@kms_hdr
> > igt@kms_invalid_mode
> > igt@kms_lease
> > igt@kms_panel_fitting
> > igt@kms_pipe_crc_basic
> > igt@kms_plane_alpha_blend
> > igt@kms_plane
> > igt@kms_plane_cursor
> > igt@kms_plane_lowres
> > igt@kms_plane_multiple
> > igt@kms_plane_scaling
> > igt@kms_prop_blob
> > igt@kms_properties
> > igt@kms_rmfb
> > igt@kms_scaling_modes
> > igt@kms_sequence
> > igt@kms_setmode
> > igt@kms_sysfs_edid_timing
> > igt@kms_tv_load_detect
> > igt@kms_universal_plane
> > igt@kms_vblank
> > igt@kms_vrr
> > igt@kms_writeback
> >
> > Most of them are skipped on vc4 right now, but I could see that some of
> > them fail already (kms_rmfb, core_hotunplug), so it proves to be useful
> > already.
> >
> > What do you think? Is there some more tests needed, or did I include
> > some tests that shouldn't have been there?
> >
> > Thanks!
> > Maxime

-- 
Ville Syrjälä
Intel
