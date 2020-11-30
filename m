Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB52C818B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A689C6E43F;
	Mon, 30 Nov 2020 10:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B686E43F;
 Mon, 30 Nov 2020 10:00:38 +0000 (UTC)
IronPort-SDR: U2iyBLPZrC8VOcCywRu2j36qK/V2TLibdQwgaZGDXgG0DRFS6THIIJ4e33sp5m7PkMKSlxhArZ
 sXRza+pCTXiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="151861741"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="151861741"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 02:00:37 -0800
IronPort-SDR: 6oMN2U2q8HAKiZhpR1uGs0j7UETALvgwCU/iQFbt1vyOEl0QAu9T9M71gJPTV0mJMxUS+MilSm
 QBec2+Rub7bw==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="549036835"
Received: from cshanno1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.44])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 02:00:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Imre Deak <imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/framebuffer: Format modifier for
 Intel Gen 12 render compression with Clear Color
In-Reply-To: <20201127151920.GI401619@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201123182631.1740781-1-imre.deak@intel.com>
 <20201127143100.GB2144692@ideak-desk.fi.intel.com>
 <20201127151920.GI401619@phenom.ffwll.local>
Date: Mon, 30 Nov 2020 12:00:29 +0200
Message-ID: <877dq3kvuq.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Nanley Chery <nanley.g.chery@intel.com>,
 Rafael Antognolli <rafael.antognolli@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Kalyan Kondapally <kalyan.kondapally@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Nov 2020, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Nov 27, 2020 at 04:31:00PM +0200, Imre Deak wrote:
>> Hi Daniel, Jani,
>> 
>> is it ok to merge this patch along with 2/2 via the i915 tree?
>
> Ack from mesa (userspace in general, but mesa is kinda mandatory) is
> missing I think. With that
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

With the same conditions,

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
>> 
>> --Imre
>> 
>> On Mon, Nov 23, 2020 at 08:26:30PM +0200, Imre Deak wrote:
>> > From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> > 
>> > Gen12 display can decompress surfaces compressed by render engine with
>> > Clear Color, add a new modifier as the driver needs to know the surface
>> > was compressed by render engine.
>> > 
>> > V2: Description changes as suggested by Rafael.
>> > V3: Mention the Clear Color size of 64 bits in the comments(DK)
>> > v4: Fix trailing whitespaces
>> > v5: Explain Clear Color in the documentation.
>> > v6: Documentation Nitpicks(Nanley)
>> > 
>> > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
>> > Cc: Kalyan Kondapally <kalyan.kondapally@intel.com>
>> > Cc: Rafael Antognolli <rafael.antognolli@intel.com>
>> > Cc: Nanley Chery <nanley.g.chery@intel.com>
>> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> > Signed-off-by: Imre Deak <imre.deak@intel.com>
>> > ---
>> >  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
>> >  1 file changed, 19 insertions(+)
>> > 
>> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> > index ca48ed0e6bc1..0a1b2c4c4bee 100644
>> > --- a/include/uapi/drm/drm_fourcc.h
>> > +++ b/include/uapi/drm/drm_fourcc.h
>> > @@ -527,6 +527,25 @@ extern "C" {
>> >   */
>> >  #define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
>> >  
>> > +/*
>> > + * Intel Color Control Surface with Clear Color (CCS) for Gen-12 render
>> > + * compression.
>> > + *
>> > + * The main surface is Y-tiled and is at plane index 0 whereas CCS is linear
>> > + * and at index 1. The clear color is stored at index 2, and the pitch should
>> > + * be ignored. The clear color structure is 256 bits. The first 128 bits
>> > + * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
>> > + * by 32 bits. The raw clear color is consumed by the 3d engine and generates
>> > + * the converted clear color of size 64 bits. The first 32 bits store the Lower
>> > + * Converted Clear Color value and the next 32 bits store the Higher Converted
>> > + * Clear Color value when applicable. The Converted Clear Color values are
>> > + * consumed by the DE. The last 64 bits are used to store Color Discard Enable
>> > + * and Depth Clear Value Valid which are ignored by the DE. A CCS cache line
>> > + * corresponds to an area of 4x1 tiles in the main surface. The main surface
>> > + * pitch is required to be a multiple of 4 tile widths.
>> > + */
>> > +#define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
>> > +
>> >  /*
>> >   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>> >   *
>> > -- 
>> > 2.25.1
>> > 
>> > _______________________________________________
>> > Intel-gfx mailing list
>> > Intel-gfx@lists.freedesktop.org
>> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
