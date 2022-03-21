Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE32F4E2764
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF9010E031;
	Mon, 21 Mar 2022 13:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E081310E031;
 Mon, 21 Mar 2022 13:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647868815; x=1679404815;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GRTmvHe33sEXipvOJ3ZXsH3q8f3IUJx4O39PlJh6kp4=;
 b=GsnRzl2kEa19e0K4JpnsQM26x0cuTJOhl8pI4uK8GIqcuForsapXbju+
 tBZzlIeSXwGkJSgpwTrj1a2SoCVjXOzHFhCCvCnptGGjq4WKQ0Yz5Zb1n
 Ux8fO575iqXmKK+zXGNOmX4dohqHeTnF6ntl1OeheCWB8vpvHDAKX2Pis
 0zCk+n2a93tv5GAZsGHSdfUOrZ8Inngjb6G3yhFfRdrU7BJPKTCioWyDp
 raITFeX39fh90NGKVguHhWnoKt7LTFHup1SmLShNMi3JsMawG8fhxVHHI
 kPYIdV/EbmZEGO0BYUb3YhmoZo8bmwB3gZ1F5OJYjVc6v0I2aenKfZz+I w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257499152"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="257499152"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:20:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="543220778"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:20:13 -0700
Date: Mon, 21 Mar 2022 15:20:09 +0200
From: Imre Deak <imre.deak@intel.com>
To: Nanley G Chery <nanley.g.chery@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 16/19] uapi/drm/dg2: Introduce format
 modifier for DG2 clear color
Message-ID: <20220321132009.GB5666@ideak-desk.fi.intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-17-ramalingam.c@intel.com>
 <CAJDL4u+hX2Dbu7q5P48t44XLSOr7vA9mf_jiC607oA1Y6+2k6Q@mail.gmail.com>
 <a95a1168-5419-0688-0700-c9e81e50727b@gmail.com>
 <dc66535e7a5d4a9dae25a9548f333385@intel.com>
 <3e514431-ab0d-a455-871d-b7c9b183a98b@gmail.com>
 <3ff28a866f494a7ebec5b09eddd894c4@intel.com>
 <07650a50-6de5-7508-5602-4eaeba9d6cbb@gmail.com>
 <0d24d1ba37644f0fbd587dda983e5e00@intel.com>
 <1c7ebd63-aef0-accf-16ce-857b8352c3ba@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c7ebd63-aef0-accf-16ce-857b8352c3ba@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, Nanley Chery <nanleychery@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nanley, JP,

On Tue, Feb 15, 2022 at 09:34:22PM +0200, Juha-Pekka Heikkila wrote:
> [...]
> > > > > > > > > diff --git a/include/uapi/drm/drm_fourcc.h
> > > > > > > > > b/include/uapi/drm/drm_fourcc.h index b8fb7b44c03c..697614ea4b84 100644
> > > > > > > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > > > > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > > > > @@ -605,6 +605,16 @@ extern "C" {
> > > > > > > > >       */
> > > > > > > > >      #define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
> > > > > > > > > 
> > > > > > > > > +/*
> > > > > > > > > + * Intel color control surfaces (CCS) for DG2 clear color render compression.
> > > > > > > > > + *
> > > > > > > > > + * DG2 uses a unified compression format for clear color render compression.
> > > > > > > > 
> > > > > > > > What's unified about DG2's compression format? If this doesn't
> > > > > > > > affect the layout, maybe we should drop this sentence.

Unified here probably refers to the fact the DG2 render engine is
capable of generating both a render and a media compressed surface as
opposed to earlier platforms. The display engine still needs to know
which compression format the FB uses, hence we need both an RC and MC
modifier. Based on this I also think we can drop the mention of unified
compression.

> > > > > > > > > + * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 layout.
> > > > > > > > > + *
> > > > > > > > 
> > > > > > > > This also needs a pitch aligned to four tiles, right? I think we
> > > > > > > > can save some effort by referencing the DG2_RC_CCS modifier here.
> > > > > > > > 
> > > > > > > > > + * Fast clear color value expected by HW is located in fb at offset 0 of plane#1
> > > > > > > > 
> > > > > > > > Why is the expected offset hardcoded to 0 instead of relying on
> > > > > > > > the offset provided by the modifier API? This looks like a bug.
> > > > > > > 
> > > > > > > Hi Nanley,
> > > > > > > 
> > > > > > > can you elaborate a bit, which offset from modifier API that
> > > > > > > applies to cc surface?
> > > > > > 
> > > > > > Hi Juha-Pekka,
> > > > > > 
> > > > > > On the kernel-side of things, I'm thinking of drm_mode_fb_cmd2::offsets[1].
> > > > > 
> > > > > Hi Nanley,
> > > > > 
> > > > > this offset is coming from userspace on creation of framebuffer, at
> > > > > that moment from userspace caller can point to offset of desire.
> > > > > Normally offset[0] is set at 0 and then offset[n] at plane n start
> > > > > which is not stated to have to be exactly after plane n-1 end. Or did I
> > > > > misunderstand what you meant?
> > > > 
> > > > Perhaps, at least, I'm not sure what you're meaning to say. This
> > > > modifier description seems to say that the drm_mode_fb_cmd2::offsets
> > > > value for the clear color plane must be zero. Are you saying that it's
> > > > correct? This doesn't match the GEN12_RC_CCS_CC behavior and doesn't
> > > > match mesa's expectations.
> > > 
> > > It doesn't say "drm_mode_fb_cmd2::offsets value for the clear color plane must
> > > be zero", it says "Fast clear color value expected by HW is located in fb at offset 0
> > > of plane#1".
> > 
> > Yes, it doesn't say that exactly, but that's what it seems to say. With every other
> > modifier, it's implied that the data for the plane begins at the offset specified
> > through the modifier API. So, explicitly mentioning it here (and with that wording)
> > conveys a new requirement.
> 
> I don't have objections on changing this description but for reference gen12
> version of the same says "The main surface is Y-tiled and is at plane index
> 0 whereas CCS is linear and at index 1. The clear color is stored at index
> 2, and the pitch should be ignored.", only plane indexes are mentioned. I
> anyway wrote neither of these descriptions.
> 
> > > Plane#1 location is pointed by drm_mode_fb_cmd2::offsets[1] and there's
> > > nothing stated about that offset.
> > 
> > Technically, plane #1's location is specified to be the combination of ::handles[1]
> > and ::offsets[1]. In practice though, I can imagine that there are areas of the stack
> > that are implicitly requiring that all ::handles[] entries match.

The FB modifier API requires all ::handles[] to match, that is all
planes must be contained in one GEM object.

> I didn't think we needed to go deeper as you started to just talk about how
> drm_mode_fb_cmd2::offsets[1] not being used. Let's not waste time.
> 
> > > These offsets are just offsets to bo which contain the framebuffer information
> > > hence drm_mode_fb_cmd2::offsets[1] can be changed as one wish and cc
> > > information is found starting at drm_mode_fb_cmd2::offsets[1][0]
> > 
> > If the clear color handling is the same as GEN12_RC_CCS_CC (apart for the plane
> > index), I propose that we drop this sentence due to avoid any confusion.
> 
> But it need to defined as part of the modifier. It's the modifier features
> which are being described here.
> 
> > This offset discussion raises another question. The description says that the value
> > expected by HW is at offset 0. I'm assuming "HW" is referring to the render engine?
> > The kernel is still giving the display engine the packed values at ::offsets[1] + 16B right?
> 
> Generally answer is yes but these parts you can see in patch "[PATCH v5
> 17/19] drm/i915/dg2: Flat CCS Support" and should be discussed there. Here
> "HW" should probably be changed something meaningful though.

The 256 bit clear color format starting at plane index 1 matches the one
described at I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC . So yes, "HW" refers
to the render engine and display consumes the 64 bit data at
::offset[1] + 16 bytes (and DE ignores the 64 bit data starting at
::offset[1] + 24 bytes.

The following captures all the above, would it be ok?:

Intel Color Control Surface with Clear Color (CCS) for DG2 render compression.

The main surface is Tile 4 and at plane index 0. The CCS data is stored
outside of the GEM object in a reserved memory area dedicated for the
storage of the CCS data from all GEM objects. The main surface pitch is
required to be a multiple of four Tile 4 widths. The clear color is stored
at plane index 1 and the pitch should be ignored. The format of the 256
bits clear color data matches the one used for the
I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
for details.

--Imre
