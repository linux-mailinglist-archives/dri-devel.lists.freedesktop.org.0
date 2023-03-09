Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB7A6B1888
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 02:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967EA10E775;
	Thu,  9 Mar 2023 01:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE4F10E770;
 Thu,  9 Mar 2023 01:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678324257; x=1709860257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IN+nQS5w/BhTn/SQ8ZSvaCI09kEsj4qQdLSwwPnRGd0=;
 b=Y2uzRXOl/U2RqsvKPJIBGzcXCEMycNYrcMY99yULzra78Nn2MOLwiqwb
 l3eqYsWYvi0re5EJAxMPSXLuGJKWxzL1BK3SArDxAGB09IyNOa3lXd0xI
 5QkoJVlZ5wPCLNdj+3lKBxn9Df3ojcdsDucbVyKLg3uh4NrJGMLC/VeQn
 H9A+2zVkEV0urr4YbAElxbakEpZjKimkuAGqkKmPJdo1BPzbzvc1bYvYC
 3qspyX0CC+GtzfsiUEelB1wa2afaR8fkIpnoFrtAB8YxnzSthxDCDQJJH
 vZKS2Cas7hBwg0fvb2k0Bh/xG0rEkpBUCdMmtIeZL7mCFr5PzwuQKnQ+4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337848225"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="337848225"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 17:10:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709654345"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="709654345"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga001.jf.intel.com with SMTP; 08 Mar 2023 17:10:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 09 Mar 2023 03:10:07 +0200
Date: Thu, 9 Mar 2023 03:10:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH v3 03/17] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <ZAkx76OhkmtY+6Ob@intel.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-4-harry.wentland@amd.com>
 <20230308110943.4dbb6afc@eldfell>
 <CA+hFU4y3ekw3wAP2CJaKGF3A-a5hk+rSGZFOsUeZgErvzyf4iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+hFU4y3ekw3wAP2CJaKGF3A-a5hk+rSGZFOsUeZgErvzyf4iQ@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 09, 2023 at 02:05:55AM +0100, Sebastian Wick wrote:
> On Wed, Mar 8, 2023 at 10:09 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Tue, 7 Mar 2023 10:10:53 -0500
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >
> > > From: Joshua Ashton <joshua@froggi.es>
> > >
> > > Userspace has no way of controlling or knowing the pixel encoding
> > > currently, so there is no way for it to ever get the right values here.
> > >
> > > When we do add pixel_encoding control from userspace,we can pick the
> > > right value for the colorimetry packet based on the
> > > pixel_encoding + the colorspace.
> > >
> > > Let's deprecate these values, and have one BT.2020 colorspace entry
> > > that userspace can use.
> > >
> > > v2:
> > >  - leave CYCC alone for now; it serves a purpose
> > >  - leave BT2020_RGB the new default BT2020
> > >
> > > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> > >
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > > Cc: Vitaly.Prosyak@amd.com
> > > Cc: Uma Shankar <uma.shankar@intel.com>
> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Cc: Joshua Ashton <joshua@froggi.es>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: amd-gfx@lists.freedesktop.org
> > > ---
> > >  drivers/gpu/drm/display/drm_hdmi_helper.c |  7 +++----
> > >  drivers/gpu/drm/drm_connector.c           |  8 ++++----
> > >  drivers/gpu/drm/i915/display/intel_dp.c   | 14 +++++++-------
> > >  include/drm/drm_connector.h               | 15 +++++++++------
> > >  4 files changed, 23 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > > index faf5e9efa7d3..05a0d03ffcda 100644
> > > --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > > @@ -97,8 +97,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
> > >  #define HDMI_COLORIMETRY_OPYCC_601           (C(3) | EC(3) | ACE(0))
> > >  #define HDMI_COLORIMETRY_OPRGB                       (C(3) | EC(4) | ACE(0))
> > >  #define HDMI_COLORIMETRY_BT2020_CYCC         (C(3) | EC(5) | ACE(0))
> > > -#define HDMI_COLORIMETRY_BT2020_RGB          (C(3) | EC(6) | ACE(0))
> > > -#define HDMI_COLORIMETRY_BT2020_YCC          (C(3) | EC(6) | ACE(0))
> > > +#define HDMI_COLORIMETRY_BT2020                      (C(3) | EC(6) | ACE(0))
> > >  #define HDMI_COLORIMETRY_DCI_P3_RGB_D65              (C(3) | EC(7) | ACE(0))
> > >  #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER  (C(3) | EC(7) | ACE(1))
> > >
> > > @@ -112,8 +111,8 @@ static const u32 hdmi_colorimetry_val[] = {
> > >       [DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
> > >       [DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
> > >       [DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
> > > -     [DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
> > > -     [DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
> > > +     [DRM_MODE_COLORIMETRY_BT2020_DEPRECATED] = HDMI_COLORIMETRY_BT2020,
> > > +     [DRM_MODE_COLORIMETRY_BT2020] = HDMI_COLORIMETRY_BT2020,
> > >  };
> > >
> > >  #undef C
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > index 61c29ce74b03..fe7eab15f727 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -1031,9 +1031,9 @@ static const struct drm_prop_enum_list hdmi_colorspaces[] = {
> > >       /* Colorimetry based on ITU-R BT.2020 */
> > >       { DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> > >       /* Colorimetry based on ITU-R BT.2020 */
> > > -     { DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> > > +     { DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
> > >       /* Colorimetry based on ITU-R BT.2020 */
> > > -     { DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> > > +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },
> > >       /* Added as part of Additional Colorimetry Extension in 861.G */
> > >       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> > >       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
> > > @@ -1054,7 +1054,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
> > >       /* Colorimetry based on SMPTE RP 431-2 */
> > >       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> > >       /* Colorimetry based on ITU-R BT.2020 */
> > > -     { DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> > > +     { DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
> > >       { DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
> > >       { DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
> > >       /* Standard Definition Colorimetry based on IEC 61966-2-4 */
> > > @@ -1068,7 +1068,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
> > >       /* Colorimetry based on ITU-R BT.2020 */
> > >       { DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> > >       /* Colorimetry based on ITU-R BT.2020 */
> > > -     { DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> > > +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },
> >
> > Let's hope no-one complains about missing the old string names in UABI. :-)
> >
> > Actually, you should write in the commit message why removing old names
> > is fine.
> 
> Uhm, yeah, I'm just going to do that. This breaks my code! Mutter
> actually uses the strings and not the values.
> 
> It's still not clear to me if we want to break backwards compatibility
> or not. This patch definitely does break backwards compatibility but
> it also doesn't get rid of all the other crap, so it's the worst of
> both worlds.

Yeah, why are people still massaging this same turd? Wasn't the
earlier conclusion just to define a new property that controls
both the infoframes/msa/sdp stuff and RGB->YCbCr conversion
(if necessary)?

-- 
Ville Syrjälä
Intel
