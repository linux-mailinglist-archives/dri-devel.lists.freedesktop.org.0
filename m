Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB90BAB58CA
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 17:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED2510E1D9;
	Tue, 13 May 2025 15:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CKc2lG+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E23810E1D9;
 Tue, 13 May 2025 15:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8VLfqWGZva5vbjazqXd8l1ztwlFRbsW1JyPV97W6SZk=; b=CKc2lG+e1pCKBr7VYXIooeSYMh
 azCPHOq3UddswYSAHOH5buTzmmuUxqxEEOM4oP8uMJwlctkyHcM4VaAnaA6D0/AwTBtMjq78TUoer
 AfurJ2vt24Db0VxXF2J0nGCK/POSOjTqZYb0Ashklcf8LJ6cP86eXATMjFHnEKERPZS/3PMcm56ZN
 +BneY1Z6xrNN7av2bE3syO/A/vPbbPsWUHLz9tc+Gu7AjzBDTkmyxrQBDoTu4WtfOb5PVbAgs+NXh
 nkEJHdJICmPbYYQoZ5OzDkku8nGk+VkAWK/Fb8Ef4lNbDIy5d8hKzraooWD4pCoNGiQopIXeD3i+1
 EGSp8Twg==;
Received: from [189.6.16.79] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uErbd-007g8G-1C; Tue, 13 May 2025 17:37:21 +0200
Date: Tue, 13 May 2025 12:36:57 -0300
From: Melissa Wen <mwen@igalia.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, 
 leo.liu@amd.com, ville.syrjala@linux.intel.com, contact@emersion.fr, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V9 26/43] drm/amd/display: Add support for sRGB EOTF in
 DEGAM block
Message-ID: <sb544qlewpslcvcgofer762puac5bjd5w67ldisi6pkcpkuboj@33lwudjvd6xr>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-27-alex.hung@amd.com>
 <twwndnvjm6rmxdt4cs747fixvplpeuy3yh3ho6d4yq3y3prhub@fag4kafh2xct>
 <20250513104213.1c5d905a@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513104213.1c5d905a@eldfell>
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

On 05/13, Pekka Paalanen wrote:
> On Mon, 12 May 2025 15:50:17 -0300
> Melissa Wen <mwen@igalia.com> wrote:
> 
> > On 04/29, Alex Hung wrote:
> > > Expose one 1D curve colorop with support for
> > > DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
> > > the sRGB transform when the colorop is not in bypass.
> > > 
> > > With this change the following IGT test passes:
> > > kms_colorop --run plane-XR30-XR30-srgb_eotf
> > > 
> > > The color pipeline now consists of a single colorop:
> > > 1. 1D curve colorop w/ sRGB EOTF
> > > 
> > > Signed-off-by: Alex Hung <alex.hung@amd.com>
> > > Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> > > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > > Reviewed-by: Daniel Stone <daniels@collabora.com>
> > > ---
> > > V9:
> > >  - Update function names by _plane_ (Chaitanya Kumar Borah)
> > >  - Update replace cleanup code by drm_colorop_pipeline_destroy (Simon Ser)
> > > 
> > > v8:
> > >  - Fix incorrect && by || in __set_colorop_in_tf_1d_curve (Leo Li)
> > > 
> > > v7:
> > >  - Fix checkpatch warnings
> > >   - Change switch "{ }" position
> > >   - Delete double ";"
> > >   - Delete "{ }" for single-line if-statement
> > >   - Add a new line at EOF
> > >   - Change SPDX-License-Identifier: GPL-2.0+ from // to /* */
> > > 
> > > v6:
> > >  - cleanup if colorop alloc or init fails
> > > 
> > >  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 +++++++++++++++++++
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 69 +++++++++++++++
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 ++++++++
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 +++
> > >  5 files changed, 201 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> > >  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
> > > 
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> > > index ab2a97e354da..46158d67ab12 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> > > @@ -38,7 +38,8 @@ AMDGPUDM = \
> > >  	amdgpu_dm_pp_smu.o \
> > >  	amdgpu_dm_psr.o \
> > >  	amdgpu_dm_replay.o \
> > > -	amdgpu_dm_wb.o
> > > +	amdgpu_dm_wb.o \
> > > +	amdgpu_dm_colorop.o
> > >  
> > >  ifdef CONFIG_DRM_AMD_DC_FP
> > >  AMDGPUDM += dc_fpu.o
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > > index ebabfe3a512f..0b513ab5050f 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > > @@ -668,6 +668,18 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
> > >  	}
> > >  }
> > >  
> > > +static enum dc_transfer_func_predefined
> > > +amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
> > > +{
> > > +	switch (tf) {
> > > +	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> > > +	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
> > > +		return TRANSFER_FUNCTION_SRGB;
> > > +	default:
> > > +		return TRANSFER_FUNCTION_LINEAR;
> > > +	}
> > > +}
> > > +
> > >  static void __to_dc_lut3d_color(struct dc_rgb *rgb,
> > >  				const struct drm_color_lut lut,
> > >  				int bit_precision)
> > > @@ -1137,6 +1149,59 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
> > >  	return 0;
> > >  }
> > >  
> > > +static int
> > > +__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
> > > +		       struct drm_colorop_state *colorop_state)
> > > +{
> > > +	struct dc_transfer_func *tf = &dc_plane_state->in_transfer_func;
> > > +	struct drm_colorop *colorop = colorop_state->colorop;
> > > +	struct drm_device *drm = colorop->dev;
> > > +
> > > +	if (colorop->type != DRM_COLOROP_1D_CURVE ||
> > > +	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
> > > +		return -EINVAL;
> > > +
> > > +	if (colorop_state->bypass) {
> > > +		tf->type = TF_TYPE_BYPASS;
> > > +		tf->tf = TRANSFER_FUNCTION_LINEAR;
> > > +		return 0;
> > > +	}
> > > +
> > > +	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
> > > +
> > > +	tf->type = TF_TYPE_PREDEFINED;
> > > +	tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int
> > > +__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
> > > +			       struct dc_plane_state *dc_plane_state,
> > > +			       struct drm_colorop *colorop)
> > > +{
> > > +	struct drm_colorop *old_colorop;
> > > +	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
> > > +	struct drm_atomic_state *state = plane_state->state;
> > > +	int i = 0;
> > > +
> > > +	old_colorop = colorop;
> > > +
> > > +	/* 1st op: 1d curve - degamma */
> > > +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> > > +		if (new_colorop_state->colorop == old_colorop &&
> > > +		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
> > > +			colorop_state = new_colorop_state;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	if (!colorop_state)
> > > +		return -EINVAL;
> > > +
> > > +	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);  
> > 
> > I wonder what will happen if plane degamma isn't set, but CRTC degamma
> > LUT or legacy CRTC regamma LUT (with its implicity sRGB degamma) is used
> > together with other plane color ops.
> > 
> > I can imagine the mess, so I think CRTC degamma LUT and legacy CRTC
> > regamma LUT should be somehow entirely disabled (or rejected) if plane
> > color pipeline is in use.
> 
> Hi Melissa,
> 
> if using a plane color pipeline means that a CRTC LUT cannot be used, it
> will severely limit the usefulness of the whole KMS color processing. In
> Weston's case it would prohibit *all* KMS off-loading when color
> management is in use.
> 
> Weston chooses to do composition and blending in an optical space. This
> means that plane color pipelines are required to convert incoming
> pixels into the optical space, and a CRTC LUT (a CRTC color pipeline in
> the future) is required to convert from the optical space to the
> monitor signalling (electrical space).

Hi Pekka,

IIRC, Weston needs one post-blending 1D LUT and with my suggestion the
atomic CRTC regamma LUT works fine and can be this 1D LUT.
So, instead of an atomic post-blending/CRTC color pipeline with:

[blending] -> CRTC 1D LUT -> CRTC CTM -> CRTC 1D LUT

when plane color pipeline is in use, the driver accepts only:

[blending] -> CRTC CTM -> CRTC 1D LUT

If AMD driver continues accepting/exposing CRTC degamma LUT plus plane
color pipeline, and userpace wants something like:

Plane shaper LUT -> Plane 3D LUT -> Plane Blnd LUT -> [blending] -> **CRTC** degamma LUT

I understand that this weird sequence is what will actually happen:

**CRTC** degamma LUT -> Plane shaper LUT -> Plane 3D LUT -> Plane Blnd LUT -> [blending]

Because userspace doesn't care if this is a "degamma" or "regamma" LUT
and they will probably pick the first 1D LUT in the post-blending color
pipeline, which currently means CRTC degamma LUT. So, better if it takes
the CRTC regamma LUT that is actually a post-blending 1D LUT. Where I
expected this result:

Plane shaper LUT -> PLane 3D LUT -> PLane Blnd LUT -> [blending] -> CRTC regamma LUT

You can vizualize better this degamma issue in this diagram:
https://raw.githubusercontent.com/melissawen/melissawen.github.io/master/img/xdc-2023-colors-talk/rainbow-treasure-xdc-2023-17.png

In the current driver-specific implementation, driver rejects atomic commits
in case of collision, i.e., Plane degamma LUT + CRTC degamma LUT, but
IIRC, the driver doesn't handle it if it doesn't clash.

> 
> I don't know what "with its implicity sRGB degamma" means, but there
> cannot be any implicit curves at all. The driver has no knowledge of
> how the framebuffer pixels are encoded, nor about what the blending
> space should be.

It targets the legacy CRTC regamma LUT (256 size), not the atomic CRTC
color pipeline.

Melissa

> 
> 
> Thanks,
> pq


