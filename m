Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3C6BE9A0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A746510E11F;
	Fri, 17 Mar 2023 12:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6DB10E11F;
 Fri, 17 Mar 2023 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679057446; x=1710593446;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BSs3NINySBx41sY+kBj4ehGr0r7ext+7LAXR0BKkEwI=;
 b=Dbiy6ANAVFiyxRjohw0oVXafzIy0U6v3pe4Lj3mzy7dWmB1lLjBOZl/V
 EbUfFG/zR5CJaDQiMrEvgjFF6Mm8+HDss1t+FUf4pBmX6x+U1AjsePRL3
 pPrMTS49wjocL02sRSCClsrXPnnPSqhw4jRIOeeVzI/fGqUIYw5h9mkRY
 dPYtl225fxiFwzAfs8fSdxWps4Nsid2q5so7vU//opmBBU6RqB6i/Cwwi
 0IgYpMnM31f8LtEQELLTaiGTZeybew5fX+iDT5s161eyGEtN0mupYiKtO
 PlC/QbD9jUsrMF9z9L57ypjMqr49XtgVwOsUVq5fuMyN20yTOGZ0eenUx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317906638"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="317906638"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 05:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="790701118"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="790701118"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga002.fm.intel.com with SMTP; 17 Mar 2023 05:50:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Mar 2023 14:50:40 +0200
Date: Fri, 17 Mar 2023 14:50:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <ZBRiIG+TEft19Kum@intel.com>
References: <20230307151107.49649-10-harry.wentland@amd.com>
 <CA+hFU4yiniJdxWOxDKnD7bTGw3QA8uSLyG5sbeiQ5oWqitTZcQ@mail.gmail.com>
 <ZBLmYzVcnBgU6uo5@intel.com> <20230316120701.523bcb37@eldfell>
 <ZBLz17f8YFmNEJlY@intel.com> <20230316133449.26b62760@eldfell>
 <ZBMNEdYWsyfVq46p@intel.com>
 <CA+hFU4zWvm3-SSjtF17zjRnshEDw27gkQDLGZRk2AbnWN8+1Vg@mail.gmail.com>
 <ZBOf0m6W3ZWPy7nc@intel.com> <20230317105335.45d6a629@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317105335.45d6a629@eldfell>
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

On Fri, Mar 17, 2023 at 10:53:35AM +0200, Pekka Paalanen wrote:
> On Fri, 17 Mar 2023 01:01:38 +0200
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Thu, Mar 16, 2023 at 10:13:54PM +0100, Sebastian Wick wrote:
> > > On Thu, Mar 16, 2023 at 1:35 PM Ville Syrjälä
> > > <ville.syrjala@linux.intel.com> wrote:  
> > > >
> > > > On Thu, Mar 16, 2023 at 01:34:49PM +0200, Pekka Paalanen wrote:  
> > > > > On Thu, 16 Mar 2023 12:47:51 +0200
> > > > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > > >  
> > > > > > On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka Paalanen wrote:  
> > > > > > > On Thu, 16 Mar 2023 11:50:27 +0200
> > > > > > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > > > > >  
> > > > > > > > On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebastian Wick wrote:  
> > > > > > > > > On Tue, Mar 7, 2023 at 4:12 PM Harry Wentland <harry.wentland@amd.com> wrote:  
> > > > > > > > > >
> > > > > > > > > > We want compositors to be able to set the output
> > > > > > > > > > colorspace on DP and HDMI outputs, based on the
> > > > > > > > > > caps reported from the receiver via EDID.  
> > > > > > > > >
> > > > > > > > > About that... The documentation says that user space has to check the
> > > > > > > > > EDID for what the sink actually supports. So whatever is in
> > > > > > > > > supported_colorspaces is just what the driver/hardware is able to set
> > > > > > > > > but doesn't actually indicate that the sink supports it.
> > > > > > > > >
> > > > > > > > > So the only way to enable bt2020 is by checking if the sink supports
> > > > > > > > > both RGB and YUV variants because both could be used by the driver.
> > > > > > > > > Not great at all. Something to remember for the new property.  
> > > > > > > >
> > > > > > > > Hmm. I wonder if that's even legal... Looks like maybe it
> > > > > > > > is since I can't immediately spot anything in CTA-861 to
> > > > > > > > forbid it :/  
> > > > > > >
> > > > > > > Wouldn't the driver do the same EDID check before choosing whether it
> > > > > > > uses RGB or YCbCr signalling?  
> > > > > >
> > > > > > I suppose it could. The modeset would then fail, which is perhaps  
> > > > >
> > > > > Could? What are they missing?  
> > > >
> > > > The fact that the new property that also affects the rgb->ycbcr matrix
> > > > doesn't even exist?  
> > > 
> > > I think the question was about the current Colorspace property.
> 
> Yes.
> 
> We need to be able to set ColourPrimaries infoframe field for the sink.
> Only userspace knows what ColourPrimaries it uses, and the driver has
> no need to care at all, other than tell the sink what we have.
> 
> When a driver chooses to use YCbCr, it needs to use the
> MatrixCoefficients the sink expects.
> 
> If we send the infoframe to the sink telling the signal uses BT.2020
> ColourPrimaries, does that same bit pattern also tell the sink we are
> using the BT.2020 NCL MatrixCoefficients if the driver chooses YCbCr?
> 
> Do drivers actually use BT.2020 NCL MatrixCoefficients in that case?

No. I think I've repeated this same line a thousand times already:
The current colorspace property *only* affects the infoframe/msa/sdp,
nothing else.

> 
> If they don't, then YCbCr BT.2020 has never worked, which is another
> nail in the coffin for "Colorspace" property.

That is the same nail we've been talking about all along I thought.

> But it still means that
> RGB BT.2020 may have worked correctly, and then drivers would regress
> if they started picking YCbCr for any reason where they previously used
> RGB.

The policy has been to use RGB if at all possible. Only falling back
to YCbCr 4:2:0 if absolutely necessary (eg. EDID says 4:2:0 must
be used, or there's not enough bandwidth for 4:4:4, etc.). If the
behaviour suddenly changes then it probably means the driver was
doing something illegal before by using RGB 4:4:4.

> 
> > > > >
> > > > > I mean, drivers are already automatically choosing between RGB and YCbCr
> > > > > signalling based on e.g. available bandwidth. Surely they already will
> > > > > not attempt to send a signal format to a monitor that does not say it
> > > > > supports that?  
> > > 
> > > That's exactly what they do. The drivers don't check the EDID for the
> > > colorimetry the sink supports and the responsibility is punted off to
> > > user space.
> 
> I suspect there are two different things:
> 
> - which of RGB, YCbCr 4:4:4, YCbCr 4:2:0 can the sink take
> - the supported MatrixCoefficients for each of the YCbCr
> 
> Surely drivers are already checking the former point?

Yes.

> 
> I'm not surprised if they are not checking the latter point, but they
> do need to, because it is the driver making the choice between RGB and
> some YCbCr.

This point has been irrelevant since we always select BT.709
and there is no optional feature bit in EDID to check for that.
Presumaly it is mandatory for sinks to support both BT.601 and
BT.709 whenever they support YCbCr in general.

> 
> > > >
> > > > We just signal default/bt.709 colorimetry. There is nothing to
> > > > check for those IIRC.  
> > > 
> > > You do support bt.2020, no?  
> > 
> > Not for rgb->ycbcr conversion.
> 
> I see there is confusion about what "colorimetry" is.
> 
> Please, let's use the H.273 terminology to make the difference clear
> between ColourPrimaries and MatrixCoefficients.
> 
> 
> Thanks,
> pq



-- 
Ville Syrjälä
Intel
