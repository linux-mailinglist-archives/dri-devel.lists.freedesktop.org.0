Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C37AE6BF0D0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 19:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C12010E05A;
	Fri, 17 Mar 2023 18:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448E310E02D;
 Fri, 17 Mar 2023 18:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679078308; x=1710614308;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bTBqbf/F+ZG1EDxZyycJWJ5R0Cxs4xvMsFsadYENcAQ=;
 b=QqKoKKMJaQ69ljprnePJ6HkOB9Fwulyd0FKdiqNlQ4dgzgi3SR9mzDX3
 Wtoqkn5r0CzVl2r5kwK6vXQIbBme3H0sCYsLU/Up90KxrXm93SgCzMkdV
 rdsAknXzvCxprEY7TrVOcfciP7V014GBu+suyWWVr65WdkfPvm8k/TNuM
 qs1IKNzVMQmouUehYpudECZKka6YAYcizqtbzZxNSHRsfMgBWA+35S/NG
 auKsq83OPRsPK1RaVex1MT1EYgLw77kLgVRJevuG0nC4usZmfxcMQC53k
 vur0xmyX2betK0+nIQLoN6wcH00bx82YvCrwnsdb90tLS5wq/2upJA4Pl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338357418"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="338357418"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 11:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="769455396"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="769455396"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by FMSMGA003.fm.intel.com with SMTP; 17 Mar 2023 11:38:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Mar 2023 20:38:23 +0200
Date: Fri, 17 Mar 2023 20:38:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <ZBSznxjbnREwLj9E@intel.com>
References: <ZBMNEdYWsyfVq46p@intel.com>
 <CA+hFU4zWvm3-SSjtF17zjRnshEDw27gkQDLGZRk2AbnWN8+1Vg@mail.gmail.com>
 <ZBOf0m6W3ZWPy7nc@intel.com> <20230317105335.45d6a629@eldfell>
 <ZBRiIG+TEft19Kum@intel.com> <20230317153553.5b8eb460@eldfell>
 <ZBR1zs4/L+9thOEe@intel.com> <20230317173751.49c45929@eldfell>
 <ZBSWU5MK3rO6C4si@intel.com>
 <CA+hFU4yqUg6md+RByd6T+teyYqdkkNXS5Hm8uNtdpUw834aXkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+hFU4yqUg6md+RByd6T+teyYqdkkNXS5Hm8uNtdpUw834aXkg@mail.gmail.com>
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
Cc: amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 06:40:53PM +0100, Sebastian Wick wrote:
> On Fri, Mar 17, 2023 at 5:34 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Fri, Mar 17, 2023 at 05:37:51PM +0200, Pekka Paalanen wrote:
> > > On Fri, 17 Mar 2023 16:14:38 +0200
> > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > >
> > > > On Fri, Mar 17, 2023 at 03:35:53PM +0200, Pekka Paalanen wrote:
> > > > > On Fri, 17 Mar 2023 14:50:40 +0200
> > > > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > > On Fri, Mar 17, 2023 at 10:53:35AM +0200, Pekka Paalanen wrote:
> > > > > > > On Fri, 17 Mar 2023 01:01:38 +0200
> > > > > > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > > > > >
> > > > > > > > On Thu, Mar 16, 2023 at 10:13:54PM +0100, Sebastian Wick wrote:
> > > > > > > > > On Thu, Mar 16, 2023 at 1:35 PM Ville Syrjälä
> > > > > > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Thu, Mar 16, 2023 at 01:34:49PM +0200, Pekka Paalanen wrote:
> > > > > > > > > > > On Thu, 16 Mar 2023 12:47:51 +0200
> > > > > > > > > > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > > On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka Paalanen wrote:
> > > > > > > > > > > > > On Thu, 16 Mar 2023 11:50:27 +0200
> > > > > > > > > > > > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > > On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebastian Wick wrote:
> > > > > > > > > > > > > > > On Tue, Mar 7, 2023 at 4:12 PM Harry Wentland <harry.wentland@amd.com> wrote:
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > We want compositors to be able to set the output
> > > > > > > > > > > > > > > > colorspace on DP and HDMI outputs, based on the
> > > > > > > > > > > > > > > > caps reported from the receiver via EDID.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > About that... The documentation says that user space has to check the
> > > > > > > > > > > > > > > EDID for what the sink actually supports. So whatever is in
> > > > > > > > > > > > > > > supported_colorspaces is just what the driver/hardware is able to set
> > > > > > > > > > > > > > > but doesn't actually indicate that the sink supports it.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > So the only way to enable bt2020 is by checking if the sink supports
> > > > > > > > > > > > > > > both RGB and YUV variants because both could be used by the driver.
> > > > > > > > > > > > > > > Not great at all. Something to remember for the new property.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Hmm. I wonder if that's even legal... Looks like maybe it
> > > > > > > > > > > > > > is since I can't immediately spot anything in CTA-861 to
> > > > > > > > > > > > > > forbid it :/
> > > > > > > > > > > > >
> > > > > > > > > > > > > Wouldn't the driver do the same EDID check before choosing whether it
> > > > > > > > > > > > > uses RGB or YCbCr signalling?
> > > > > > > > > > > >
> > > > > > > > > > > > I suppose it could. The modeset would then fail, which is perhaps
> > > > > > > > > > >
> > > > > > > > > > > Could? What are they missing?
> > > > > > > > > >
> > > > > > > > > > The fact that the new property that also affects the rgb->ycbcr matrix
> > > > > > > > > > doesn't even exist?
> > > > > > > > >
> > > > > > > > > I think the question was about the current Colorspace property.
> > > > > > >
> > > > > > > Yes.
> > > > > > >
> > > > > > > We need to be able to set ColourPrimaries infoframe field for the sink.
> > > > > > > Only userspace knows what ColourPrimaries it uses, and the driver has
> > > > > > > no need to care at all, other than tell the sink what we have.
> > > > > > >
> > > > > > > When a driver chooses to use YCbCr, it needs to use the
> > > > > > > MatrixCoefficients the sink expects.
> > > > > > >
> > > > > > > If we send the infoframe to the sink telling the signal uses BT.2020
> > > > > > > ColourPrimaries, does that same bit pattern also tell the sink we are
> > > > > > > using the BT.2020 NCL MatrixCoefficients if the driver chooses YCbCr?
> > > > > > >
> > > > > > > Do drivers actually use BT.2020 NCL MatrixCoefficients in that case?
> > > > > >
> > > > > > No. I think I've repeated this same line a thousand times already:
> > > > > > The current colorspace property *only* affects the infoframe/msa/sdp,
> > > > > > nothing else.
> > > > >
> > > > > That's the problem. I don't know what that means.
> > > > >
> > > > > Does it mean that the sink expects BT.2020 NCL MatrixCoefficients to
> > > > > have been used?
> > > >
> > > > Yes, assuming that is the colorspace property value you picked.
> > > >
> > > > >
> > > > > And the driver will never use BT.2020 NCL MatrixCoefficients in any
> > > > > circumstances?
> > > >
> > > > Correct.
> > > >
> > > > >
> > > > > See the conflict? The sink will be decoding the signal incorrectly,
> > > > > because we are encoding it with the wrong MatrixCoefficients if the
> > > > > driver happens to silently choose YCbCr and userspace wants to send
> > > > > BT2020 ColourPrimaries indicated in the infoframe.
> > > >
> > > > Yes. And hence I thought pretty much everyone already
> > > > agreed that a new property is needed.
> > >
> > > I think I was confused as well with the re-posting of this series,
> > > thinking it could be salvageable somehow and tried to understand how.
> > > Up to Harry, I think I've left enough annoying questions by now. :-)
> > >
> > > > To make sure we actually understand what we're implementing
> > > > I think it should start out very minimal. Eg just three values:
> > > > - unspecified RGB + BT.601 YCbCr
> > > > - unspecified RGB + BT.709 YCbCr
> > > > - BT.2020 RGB + BT.2020 YCbCr NCL
> 
> It would be best to describe for every case both what the display and
> what the driver expects as input.

I don't want the uapi to make any claims about the display. Half the 
real world displays are going to interpret it some other way anyway.

So all I think we can promise is:
- exactly what colorimetry we will indicate to the display in the metadata
- exactly what MatrixCoefficients we will use for RGB->YCbCr conversion

After that it's between you and your god^W display vendor what happens.

> 
> > >
> > > ColourPrimaries + MatrixCoefficients, respectively. Sounds fine.
> > >
> > > I recall hearing that DP spec actually has something like "unspecified"
> > > while HDMI has only "default colorimetry" which is specified, but I'm
> > > guessing that many monitors and TVs just don't implement it like they
> > > should, so it's effectively unspecified.
> >
> > DP in theory might have default RGB (whatever that might mean) vs.
> > sRGB, although at some point I think it was just vague RGB vs. CEA RGB,
> > which I think in i915 we might be using to indicate limited vs. full
> > quantization range instead. I think that somehow fixed some monitors
> > (while many others still get the quantization range horrible wrong of
> > course).
> >
> > HDMI/CTA-861-? IIRC didn't have anything but just "RGB", and in some
> > footnote CTA-861-? then goes on to talk about the sRGB bit in the EDID.
> > In the end it didn't seem to say anything definitive what the RGB
> > colorimetry really means.
> 
> DP has "RGB unspecified color space (Legacy RGB mode)" without more explanation.
> 
> CTA-861 has, as I said in a previous mail on this series:
> 
> "If bits C0 and C1 are zero, the colorimetry shall correspond to the
> default colorimetry defined in Section 5.1"
> 
> and in Section 5.1
> 
> "In all cases described above, the RGB color space used should be the
> RGB color space the Sink declares in the Basic Display Parameters and
> Feature Block of its EDID."
> 
> > >
> > > "unspecified" in UAPI is ok as long as there will be another distinct
> > > value for "HDMI default colorimetry" or such.
> > >
> > > I'm not sure why anyone would want to use "unspecified" but I guess
> > > it's necessary for UAPI backward compatibility.
> >
> > Just because the specs don't really seem to specify anything
> > sensible. We could just call it "RGB" and leave it at that of
> > course.
> 
> I think unspecified and default RGB are both good enough. The spec
> doesn't give us much better guarantees anyway. Unspecified might even
> be better because we could then add a default RGB case if we ever get
> a mode which guarantees us that the colorimetry of the EDID is in
> effect.
> 
> > >
> > > >
> > > > And that would control:
> > > > - basic colorimetry metadata transmitted to the sink
> > > > - MatrixCoefficients used for the potential RGB->YCbCr conversion
> > > >
> > > > Transfer funcs, primaries, etc. would be left out (apart from
> > > > the potential metadata aspect).
> > >
> > > Primaries left out? What are your "unspecified RGB" and "BT.2020 RGB"
> > > above then?
> >
> > It all seems too open to interpretation to make it anything
> > but "undefined".
> >
> > >
> > > Asking from another angle, using infoframes, is it possible to tell the
> > > sink to use BT.2020 YCbCr NCL without *also* implying BT.2020
> > > ColourPrimaries? Joshua seemed to be saying "no".
> >
> > I don't think so. The BT.2020 cases seems to be more strictrly
> > defined.
> 
> The Colorimetry gives us the primaries, white point, transfer
> characteristics and conversion matrix if it is for YCC. The HDR
> metadata can override the transfer characteristics.
> 
> Anyways, CTA-861 is still confusing me a lot.
> 
> It has "No Data" Colorimetry but is that the same as not sending the
> InfoFrame at all? Either way, the colorimetry should be the one from
> the EDID.
> 
> But the transfer characteristics change with the selected Colorimetry.
> In the table is "RGB" the same as "No Data" and the same as sending no
> InfoFrame? But then when is the transfer characteristics of the EDID
> in effect and when bt.709 from the table?
> 
> There doesn't appear to be a default colorimetry for YCC. So how would
> you even automatically fall back from RGB to YCC with the same
> colorimetry?
> 
> I only see the colorimetry BT.709 and not BT.601. Some other
> colorimetry uses the BT.601 conversion matrix so how would
> "unspecified RGB + BT.709 YCbCr" even work?

It just means:
- if we output RGB we the colorimetry signalled will be "no data"
  value (or whatever the "i don't know what anything means" value)
- if we output YCbCr the colorimetry signalled will be the BT.709
  value, and the YCbCr data will be produced using the BT.709
  MatrixCoefficients

Beyond that absolutely no promises about anything.

-- 
Ville Syrjälä
Intel
