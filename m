Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2FA43B5E2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD3A6E454;
	Tue, 26 Oct 2021 15:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3A66E439;
 Tue, 26 Oct 2021 15:41:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="316146611"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="316146611"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:41:27 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="446800889"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:41:23 -0700
Date: Tue, 26 Oct 2021 21:14:13 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, CQ Tang <cq.tang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 14/17] uapi/drm/dg2: Format modifier for
 DG2 unified compression and clear color
Message-ID: <20211026154413.GB31457@intel.com>
References: <20211021142627.31058-1-ramalingam.c@intel.com>
 <20211021142627.31058-15-ramalingam.c@intel.com>
 <YXF6tItZLX4Cn6Aw@intel.com>
 <4b263070-a30e-85fb-d3d7-6983b05ec323@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b263070-a30e-85fb-d3d7-6983b05ec323@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On 2021-10-25 at 14:20:02 +0300, Juha-Pekka Heikkila wrote:
> On 21.10.2021 17.35, Ville Syrjälä wrote:
> > On Thu, Oct 21, 2021 at 07:56:24PM +0530, Ramalingam C wrote:
> > > From: Matt Roper <matthew.d.roper@intel.com>
> > > 
> > > DG2 unifies render compression and media compression into a single
> > > format for the first time.  The programming and buffer layout is
> > > supposed to match compression on older gen12 platforms, but the
> > > actual compression algorithm is different from any previous platform; as
> > > such, we need a new framebuffer modifier to represent buffers in this
> > > format, but otherwise we can re-use the existing gen12 compression driver
> > > logic.
> > > 
> > > DG2 clear color render compression uses Tile4 layout. Therefore, we need
> > > to define a new format modifier for uAPI to support clear color rendering.
> > > 
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Mika Kahola <mika.kahola@intel.com> (v2)
> > > Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
> > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > cc: Simon Ser <contact@emersion.fr>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > ---
> > >   drivers/gpu/drm/i915/display/intel_display.c  |  3 ++
> > >   .../drm/i915/display/intel_display_types.h    | 10 +++-
> > >   drivers/gpu/drm/i915/display/intel_fb.c       |  7 +++
> > >   .../drm/i915/display/skl_universal_plane.c    | 49 +++++++++++++++++--
> > >   include/uapi/drm/drm_fourcc.h                 | 30 ++++++++++++
> > >   5 files changed, 94 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > > index 9b678839bf2b..2949fe9f5b9f 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > @@ -1013,6 +1013,9 @@ intel_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
> > >   					  cmd->pixel_format);
> > >   	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
> > >   	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
> > > +	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS:
> > > +	case I915_FORMAT_MOD_F_TILED_DG2_MC_CCS:
> > > +	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC:
> > >   		return lookup_format_info(gen12_ccs_formats,
> > >   					  ARRAY_SIZE(gen12_ccs_formats),
> > >   					  cmd->pixel_format);
> > 
> > That seems not right. Flat CCS is invisible to the user so the format
> > info should not include a CCS plane.
> > 
> 
> I had cleaned out those rc and mc ccs from here long time ago, I wonder
> where did they come back from? On my development tree they're not there.
> Also I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC is here in totally wrong place,
> it should have its own gen12_flat_ccs_cc_formats table.

Oops, there was another piece missed from this upstreaming effort. I
will push that too...

Ram
> 
> /Juha-Pekka
