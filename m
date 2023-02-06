Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3D68B8E8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EE010E352;
	Mon,  6 Feb 2023 09:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985E710E34A;
 Mon,  6 Feb 2023 09:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675676869; x=1707212869;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PLpTmQKz7FwE7Jo1cFuNVsyIBXxXdNCCxyQKsDeWLlw=;
 b=abGXL7jkafSaFXTAJFF3XqIYAnhGMVBqY7SkHP4QqytFhIn/NV9ny+2V
 sOpgZEtExL22x5BVPaPUk/rgtTFt61MZCUju7jLG8k9Xhvv6DipFU68tA
 eCMnv85OHF/idU644cWG4mJUKlIwKP3KurOlBtIMKv7LQK9m0qo2DsphN
 AXPteLfn1XqPkJbLNkwlaIqqDm29QQhicKOl5R0igT0Z3bwnYLp0JdXlw
 cioLNtQh/N9Vd9G6mTMQ/Clq5Lkd/Ji87p8PoB/bEFfC3/j/WEZLjRjt8
 8duQNlMArF0tBM/ezOGkUIz65urEXXEkDzJUgfpAxmygvX0vU3waFxlwo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="308811077"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="308811077"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 01:47:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="729954951"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="729954951"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga008.fm.intel.com with SMTP; 06 Feb 2023 01:47:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 06 Feb 2023 11:47:44 +0200
Date: Mon, 6 Feb 2023 11:47:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Joshua Ashton <joshua@froggi.es>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <Y+DMwPu6IMVHsmpD@intel.com>
References: <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
 <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com>
 <Y90vrEa3/1RbaGOV@intel.com>
 <f9633729-2db0-3bf1-311d-f03bd04d47a6@amd.com>
 <Y91Y98jyOimabC3O@intel.com> <Y91fsmgAx65koWI5@intel.com>
 <Y91hyNAplv4nuW5Y@intel.com>
 <a3d46b3a-ebd5-e02c-3db4-783f2a34b36c@froggi.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3d46b3a-ebd5-e02c-3db4-783f2a34b36c@froggi.es>
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
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 04, 2023 at 06:09:45AM +0000, Joshua Ashton wrote:
> 
> 
> On 2/3/23 19:34, Ville Syrjälä wrote:
> > On Fri, Feb 03, 2023 at 09:25:38PM +0200, Ville Syrjälä wrote:
> >> On Fri, Feb 03, 2023 at 08:56:55PM +0200, Ville Syrjälä wrote:
> >>> On Fri, Feb 03, 2023 at 01:28:20PM -0500, Harry Wentland wrote:
> >>>>
> >>>>
> >>>> On 2/3/23 11:00, Ville Syrjälä wrote:
> >>>>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 2/3/23 10:19, Ville Syrjälä wrote:
> >>>>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 2/3/23 07:59, Sebastian Wick wrote:
> >>>>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
> >>>>>>>>> <ville.syrjala@linux.intel.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
> >>>>>>>>>>> Userspace has no way of controlling or knowing the pixel encoding
> >>>>>>>>>>> currently, so there is no way for it to ever get the right values here.
> >>>>>>>>>>
> >>>>>>>>>> That applies to a lot of the other values as well (they are
> >>>>>>>>>> explicitly RGB or YCC). The idea was that this property sets the
> >>>>>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
> >>>>>>>>>> added to for use userspace to control the pixel encoding/colorspace
> >>>>>>>>>> conversion(if desired, or userspace just makes sure to
> >>>>>>>>>> directly feed in correct kind of data).
> >>>>>>>>>
> >>>>>>>>> I'm all for getting userspace control over pixel encoding but even
> >>>>>>>>> then the kernel always knows which pixel encoding is selected and
> >>>>>>>>> which InfoFrame has to be sent. Is there a reason why userspace would
> >>>>>>>>> want to control the variant explicitly to the wrong value?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> I've asked this before but haven't seen an answer: Is there an existing
> >>>>>>>> upstream userspace project that makes use of this property (other than
> >>>>>>>> what Joshua is working on in gamescope right now)? That would help us
> >>>>>>>> understand the intent better.
> >>>>>>>
> >>>>>>> The intent was to control the infoframe colorimetry bits,
> >>>>>>> nothing more. No idea what real userspace there was, if any.
> 
> Controlling the infoframe alone isn't useful at all unless you can 
> guarantee the wire encoding, which we cannot do.
> 
> >>>>>>>
> >>>>>>>>
> >>>>>>>> I don't think giving userspace explicit control over the exact infoframe
> >>>>>>>> values is the right thing to do.
> 
> +1
> 
> >>>>>>>
> >>>>>>> Only userspace knows what kind of data it's stuffing into
> >>>>>>> the pixels (and/or how it configures the csc units/etc.) to
> >>>>>>> generate them.
> >>>>>>>
> >>>>>>
> >>>>>> Yes, but userspace doesn't control or know whether we drive
> >>>>>> RGB or YCbCr on the wire. In fact, in some cases our driver
> >>>>>> needs to fallback to YCbCr420 for bandwidth reasons. There
> >>>>>> is currently no way for userspace to know that and I don't
> >>>>>> think it makes sense.
> >>>>>
> >>>>> People want that control as well for whatever reason. We've
> >>>>> been asked to allow YCbCr 4:4:4 output many times.
> >>>>>
> >>>>> The automagic 4:2:0 fallback I think is rather fundementally
> >>>>> incompatible with fancy color management. How would we even
> >>>>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
> >>>>> that stuff is just always BT.709 limited range, no questions
> >>>>> asked.
> 
> That's what the Colorspace property *should* be determining here.
> That's what we have it set up to do in SteamOS/my tree right now.
> 
> >>>>>
> >>>>
> >>>> We use what we're telling the display, i.e., the value in the
> >>>> colorspace property. That way we know whether to use a BT.2020
> >>>> or BT.709 matrix.
> >>>
> >>> And given how these things have gone in the past I think
> >>> that is likey to bite someone at in the future. Also not
> >>> what this property was meant to do nor does on any other
> >>> driver AFAIK.
> >>>
> >>>> I don't see how it's fundamentally incompatible with fancy
> >>>> color management stuff.
> >>>>
> >>>> If we start forbidding drivers from falling back to YCbCr
> >>>> (whether 4:4:4 or 4:2:0) we will break existing behavior on
> >>>> amdgpu and will see bug reports.
> >>>
> >>> The compositors could deal with that if/when they start doing
> >>> the full color management stuff. The current stuff only really
> >>> works when the kernel is allowed to do whatever it wants.
> >>>
> >>>>
> >>>>> So I think if userspace wants real color management it's
> >>>>> going to have to set up the whole pipeline. And for that
> >>>>> we need at least one new property to control the RGB->YCbCr
> >>>>> conversion (or to explicitly avoid it).
> 
> I mentioned this in my commit description, we absolutely should offer 
> fine control here eventually.
> 
> I don't think we need to solve that problem here though.
> 
> >>>>>
> >>>>> And given that the proposed patch just swept all the
> >>>>> non-BT.2020 issues under the rug makes me think no
> >>>>> one has actually come up with any kind of consistent
> >>>>> plan for anything else really.
> >>>>>
> >>>>
> >>>> Does anyone actually use the non-BT.2020 colorspace stuff?
> >>>
> >>> No idea if anyone is using any of it. It's a bit hard to do
> >>> right now outside the full passthrough case since we have no
> >>> properties to control how the hardware will convert stuff.
> 
> No, every userspace knows that encoding of the output buffer before 
> going to the wire format is RGB.
> 
> It's the only way you can have planes alpha-blend, or mix and match RGB 
> and NV12, etc.
> 
> >>>
> >>> Anyways, sounds like what you're basically proposing is
> >>> getting rid of this property and starting from scratch.
> >>
> >> Hmm. I guess one option would be to add that property to
> >> control the output encoding, but include a few extra
> >> "automagic" values to it which would retain the kernel's
> >> freedom to select whether to do the RGB->YCbCr conversion
> >> or not.
> >>
> >> enum output_encoding {
> >> 	auto rgb=default/nodata,ycbcr=bt601
> >> 	auto rgb=default/nodata,ycbcr=bt709
> >> 	auto rgb=bt2020,ycbcr=bt2020
> >> 	passthrough,
> >> 	rgb->ycbcr bt601,
> >> 	rgb->ycbcr bt709,
> >> 	rgb->ycbcr bt2020,
> >> }
> > 
> > In fact there should perhaps be a lot more of the explicit
> > options to get all subsamlings and quantizations ranges
> > coverted. That might actually be really nice for an igt
> > to get more full test coverage.
> > 
> The choice of encoding of the pixel on the wire should be unrelated to 
> the overall output colorspace from the userspace side -- but how the 
> display engine converts the output to that wire format *is* dependent on 
> the colorspace.
> eg. picking a rec.709 ctc vs a rec.2020 ctc matrix.
> 
> I see you are proposing a "passthrough" but that wouldn't work at all as 
> you still need to at know if you are RGB or YCbCr for the infoframe and 
> to perform chroma subsampling in the display engine.

The passthrough (and other knobs after it) were meant for 
explicit control, which means they wouldn't affect infoframes.

But probably we should have seprate properties for explicit
control of each knob vs. some kind of easier to use property.
And I suppose we can still leave the explicit control stuff
for later (apart from the one property we already have).

> 
> I perused the initial patches that added this property, and it seems 
> there were no IGT tests or userspace implementation, so I am not 
> entirely sure why it was committed in the first place.

I presume at least the kodi HDR stuff uses ths. There may
have also been some chromeos stuff going on. Can't recall
anymore.

As for IGT, there's nothing we can really test since we 
have no way to get the inforframes/etc. back from the sink.
Hence nothing beyond the normal kms_property sanity checks
really makes sense.

> 
> Nobody can safely use Colorspace because of this problem right now.
> 
> If nobody is using this property, perhaps we could just get a fresh 
> start, and either re-purpose it with new enum values, or obsolete it and 
> make a new property.
> If we do this, let's start with the absolute bare minimum, such as:
> "Default/Rec.709 (sRGB), BT.2020"
> and then grow as we need, making sure we have the full circle from 
> userspace->output complete and working for each new value we add.

Yeah, I think a fresh property is what we want.

> 
> Please don't take this as me saying we shouldn't add all these other 
> options like opRGB, etc, I just want us to progress to a solid base for 
> expanding further here, which we really don't have right now.
> 
> - Joshie 🐸✨

-- 
Ville Syrjälä
Intel
