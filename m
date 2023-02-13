Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BC6694678
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 14:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1177B10E5B8;
	Mon, 13 Feb 2023 13:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AF810E5B4;
 Mon, 13 Feb 2023 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676293403; x=1707829403;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tomZVBcGFbB8PY4x6HMeJhW+m8E8XUDsLS84469H2SY=;
 b=Iko5iNJyDKD+PEeEfiOcpVW6D7x6MR/5S7jvah+2vGnHiyVJeOV4io1W
 kvu3rwewdmPs/SQbNrgDmhViuIShu2njf7ed31KhNFg8EUCYZmlFcwCYW
 4rM+6fGMpG59vARFttnhFsJc7EIE9IDD8tZ8kzf7PkfKFNanr3nFzXGbP
 ILKxgkCxloCZTzT+EM26Wv+p0bcabhZICRwHMe63dJb603WwBxkzx3R9W
 VuwE4nc0wxwy79tLyqWVsuBaemLRjqBcxFQaiyboma3/MMmDyb2Vg+XKF
 0GgsLeOqt/wn3OBZP71cywn6N/fV4j4sObfvH0jKsUhbdllvFjiyN9/gH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="333020339"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="333020339"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 05:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="701254149"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="701254149"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga001.jf.intel.com with SMTP; 13 Feb 2023 05:02:52 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Feb 2023 15:02:51 +0200
Date: Mon, 13 Feb 2023 15:02:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <Y+o0++waAb83mXbU@intel.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
 <20230131110735.60f8ff04@eldfell>
 <20230209142702.7w4mqed6zqtk5m6g@mail.igalia.com>
 <20230210112846.2103eb00@eldfell>
 <7878175f-b81d-5ad3-bc84-3a95b3add301@amd.com>
 <20230213110131.43434089@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230213110131.43434089@eldfell>
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
Cc: dri-devel@lists.freedesktop.org, laurent.pinchart+renesas@ideasonboard.com,
 Shashank Sharma <shashank.sharma@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com, tzimmermann@suse.de,
 sunpeng.li@amd.com, Melissa Wen <mwen@igalia.com>, seanpaul@chromium.org,
 bhawanpreet.lakha@amd.com, sungjoon.kim@amd.com, Xinhui.Pan@amd.com,
 christian.koenig@amd.com, kernel-dev@igalia.com, alexander.deucher@amd.com,
 nicholas.kazlauskas@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 11:01:31AM +0200, Pekka Paalanen wrote:
> On Fri, 10 Feb 2023 14:47:50 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
> > On 2/10/23 04:28, Pekka Paalanen wrote:
> > > On Thu, 9 Feb 2023 13:27:02 -0100
> > > Melissa Wen <mwen@igalia.com> wrote:
> > >   
> > >> On 01/31, Pekka Paalanen wrote:  
> > >>> On Mon, 9 Jan 2023 14:38:09 -0100
> > >>> Melissa Wen <mwen@igalia.com> wrote:
> > >>>     
> > >>>> On 01/09, Melissa Wen wrote:    
> > >>>>> Hi,
> > >>>>>
> > >>>>> After collecting comments in different places, here is a second version
> > >>>>> of the work on adding DRM CRTC 3D LUT support to the current DRM color
> > >>>>> mgmt interface. In comparison to previous proposals [1][2][3], here we
> > >>>>> add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before 3D LUT,
> > >>>>> that means the following DRM CRTC color correction pipeline:
> > >>>>>
> > >>>>> Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Gamma 1D LUT    
> 
> ...
> 
> > >>> +/*
> > >>> + * struct drm_mode_lut3d_mode - 3D LUT mode information.
> > >>> + * @lut_size: number of valid points on every dimension of 3D LUT.
> > >>> + * @lut_stride: number of points on every dimension of 3D LUT.
> > >>> + * @bit_depth: number of bits of RGB. If color_mode defines entries with higher
> > >>> + *             bit_depth the least significant bits will be truncated.
> > >>> + * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or DRM_FORMAT_XBGR16161616.
> > >>> + * @flags: flags for hardware-sepcific features
> > >>> + */
> > >>> +struct drm_mode_lut3d_mode {
> > >>> +	__u16 lut_size;
> > >>> +	__u16 lut_stride[3];
> > >>> +	__u16 bit_depth;
> > >>> +	__u32 color_format;
> > >>> +	__u32 flags;
> > >>> +};
> 
> ...
> 
> > >>> What is "number of bits of RGB"? Input precision? Output precision?
> > >>> Integer or floating point?    
> > >>
> > >> It's the bit depth of the 3D LUT values, the same for every channels. In
> > >> the AMD case, it's supports 10-bit and 12-bit, for example.  
> > > 
> > > Ok. So e.g. r5g6b5 is not a possible 3D LUT element type on any
> > > hardware ever?
> > >   
> > 
> > I haven't had a chance to go through all patches yet but if this is
> > modeled after Alex Hung's work this should be covered by color_format.
> > The idea is that color_format takes a FOURCC value and defines the
> > format of the entries in the 3DLUT blob.
> > 
> > The bit_depth describes the actual bit depth that the HW supports.
> > E.g., color_format could be DRM_FORMAT_XRGB16161616 but HW might only
> > support 12-bit precision. In that case the least significant bits get
> > truncated.
> > 
> > One could define the bit_depth per color, but I'm not sure that'll be
> > necessary.
> 
> Exactly. I just have no idea how sure we should be about that.
> 
> > > What exactly is the truncation the comment refers to?
> > > 
> > > It sounds like if input has higher precision than the LUT elements,
> > > then "truncation" occurs. I can kind of see that, but I also think it
> > > is a false characterisation. The LUT input precision affects the
> > > precision of LUT indexing and the precision of interpolation between
> > > the LUT elements. I would not expect those two precisions to be
> > > truncated to the LUT element precision (but they could be truncated to
> > > something else hardware specific). Instead, I do expect the
> > > interpolation result to be truncated to the LUT output precision, which
> > > probably is the same as the LUT element precision, but not necessarily.
> > > 
> > > Maybe the comment about truncation should simply be removed? The result
> > > is obvious if we know the LUT input, element, and output precision, and
> > > what exactly happens with the indexing and interpolation is probably
> > > good enough to be left hardware-specific if it is difficult to describe
> > > in generic terms across different hardware.
> > >   
> > 
> > Maybe it makes sense to just drop the bit_depth field.
> 
> Well, it's really interesting information for userspace, but maybe it
> should have a more holistic design. Precision is a factor, when
> userspace considers whether it can use KMS hardware for a conversion or
> not. Unfortunately, none of the existing KMS color pipeline elements
> have any information on precision IIRC, so there is more to be fixed.
> 
> The interesting thing is the minimum guaranteed precision of each
> element and the connections between them. It might be different for
> pass-through vs. not. Another interesting thing is the usable value
> range.
> 
> This is probably a complex problem, so there should be no need to solve
> it before a 3D LUT interface can land, given old elements already have
> the issue.

Yeah, I think all the precision stuff is all better handled by
eg. the proposed GAMMA_MODE property or something similar.
It's going to be needed for 1D LUTs as well. 1D LUTs would
also need it to expose diffrent LUT sizes with different
precision tradeoffs.

As for the 3D LUT blob, I don't think the blob needs any 
strides/etc. either. I had none of that for my i915 version:
https://github.com/vsyrjala/linux/commits/3dlut
Just the LUT entries + blob size is sufficient. At least
for cube shaped LUTs. Dunno if anyone would have a need
for something else?

The two things the are absolutely needed:
- Position of the LUT in the pipeline. We've already
  seen at least two variants of this IIRC, so we'll
  likely need to define a unique property for each tap
  point.
- The order the elements are stored in the blob. I didn't
  check if all the already known hw (amdgpu, i915, rcar-du,
  were there also others?) would agree on this or not.
  If yes, maybe just follow the hw order for all those,
  and if not, then I guess flip a few coins.

-- 
Ville Syrjälä
Intel
