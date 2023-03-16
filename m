Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0949F6BCD2E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 11:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F9C10EC9E;
	Thu, 16 Mar 2023 10:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD73210EC9D;
 Thu, 16 Mar 2023 10:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678963676; x=1710499676;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZB0FfkksgESmf6Y547mV7iLlkwreB6GNY6mHJEzYzmM=;
 b=bzn44qaSMHJg0cCS4CEmL+3ZOvM1ltBKeYw40z8Id9uqrF3ExIAvFb1T
 1zFQteBLDQcB3UEB3eynHP04Tp5PCpjokAZ3uVOyC1KGSKA6z7CpnVrr7
 dKjOwo/qU3o295N+hVtigPNNxiqMp7JPb/uJPIZI5aEJ2Cc21L4mjWxOT
 /expzUt/t75gJtt9sz/nv3KA8hvC2QDdquO4xFVZM0+nfvFCrg6oAVCFe
 7jAocbeJCBpKkbYFKw30HHftAoBmHPWZF61dBchOeNtSHj20qEo6QnhQT
 hbuz8CiVRmV/HGy/5uyXcZj5UH8FnLzB3+3EhQHMyh8ka7xuZGo4C18J9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321789859"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="321789859"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 03:47:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="768879966"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="768879966"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by FMSMGA003.fm.intel.com with SMTP; 16 Mar 2023 03:47:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 16 Mar 2023 12:47:51 +0200
Date: Thu, 16 Mar 2023 12:47:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <ZBLz17f8YFmNEJlY@intel.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-10-harry.wentland@amd.com>
 <CA+hFU4yiniJdxWOxDKnD7bTGw3QA8uSLyG5sbeiQ5oWqitTZcQ@mail.gmail.com>
 <ZBLmYzVcnBgU6uo5@intel.com> <20230316120701.523bcb37@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316120701.523bcb37@eldfell>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka Paalanen wrote:
> On Thu, 16 Mar 2023 11:50:27 +0200
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebastian Wick wrote:
> > > On Tue, Mar 7, 2023 at 4:12 PM Harry Wentland <harry.wentland@amd.com> wrote:  
> > > >
> > > > We want compositors to be able to set the output
> > > > colorspace on DP and HDMI outputs, based on the
> > > > caps reported from the receiver via EDID.  
> > > 
> > > About that... The documentation says that user space has to check the
> > > EDID for what the sink actually supports. So whatever is in
> > > supported_colorspaces is just what the driver/hardware is able to set
> > > but doesn't actually indicate that the sink supports it.
> > > 
> > > So the only way to enable bt2020 is by checking if the sink supports
> > > both RGB and YUV variants because both could be used by the driver.
> > > Not great at all. Something to remember for the new property.  
> > 
> > Hmm. I wonder if that's even legal... Looks like maybe it
> > is since I can't immediately spot anything in CTA-861 to
> > forbid it :/
> 
> Wouldn't the driver do the same EDID check before choosing whether it
> uses RGB or YCbCr signalling?

I suppose it could. The modeset would then fail, which is perhaps
not a huge issue, except maybe for suspend+resume if we fail in
the resume path. Although I guess the EDID/etc. should not yet
be refreshed at that point so if the modeset worked before suspend
resume should be able to restore it without failures.

> 
> So if EDID says only one of them is supported, userspace should be
> confident that that is the BT2020 mode the driver will match?
> 
> 
> Thanks,
> pq
> 
> > 
> > >   
> > > > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > > > Cc: Vitaly.Prosyak@amd.com
> > > > Cc: Joshua Ashton <joshua@froggi.es>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: amd-gfx@lists.freedesktop.org
> > > > Reviewed-By: Joshua Ashton <joshua@froggi.es>
> > > > ---
> > > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > index f91b2ea13d96..2d883c6dae90 100644
> > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > @@ -7184,6 +7184,12 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
> > > >         return amdgpu_dm_connector->num_modes;
> > > >  }
> > > >
> > > > +static const u32 supported_colorspaces =
> > > > +       BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> > > > +       BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> > > > +       BIT(DRM_MODE_COLORIMETRY_BT2020) |
> > > > +       BIT(DRM_MODE_COLORIMETRY_BT2020_DEPRECATED);
> > > > +
> > > >  void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
> > > >                                      struct amdgpu_dm_connector *aconnector,
> > > >                                      int connector_type,
> > > > @@ -7264,6 +7270,15 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
> > > >                                 adev->mode_info.abm_level_property, 0);
> > > >         }
> > > >
> > > > +       if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
> > > > +               if (!drm_mode_create_hdmi_colorspace_property(&aconnector->base, supported_colorspaces))
> > > > +                       drm_connector_attach_colorspace_property(&aconnector->base);
> > > > +       } else if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
> > > > +                  connector_type == DRM_MODE_CONNECTOR_eDP) {
> > > > +               if (!drm_mode_create_dp_colorspace_property(&aconnector->base, supported_colorspaces))
> > > > +                       drm_connector_attach_colorspace_property(&aconnector->base);
> > > > +       }
> > > > +
> > > >         if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> > > >             connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
> > > >             connector_type == DRM_MODE_CONNECTOR_eDP) {
> > > > --
> > > > 2.39.2
> > > >  
> > 
> 



-- 
Ville Syrjälä
Intel
