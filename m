Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE47689DF2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 16:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9B610E062;
	Fri,  3 Feb 2023 15:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00A010E062;
 Fri,  3 Feb 2023 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675437565; x=1706973565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tAOMbRZmmJ3rMMMObzZAoRtgrqrK26ke7m1XtXA3K1g=;
 b=lN+1jD6CU7MaGWdMC6TVU6B+keezNlmwfnasyeik9hOoAQnN7jttgTe1
 TJy1J2qnsrp5pA9Itv1fwh92yelEXbOCt2bRDyurFrdV2vnICkZI3wGrG
 XL+nxw7otzzbSeUbup9W5EsFhznXevrJlr38m3QEHGal9fVtuuAiFEob6
 Q9xgHE8RF+CgtDxCF9yRCfOyh1LyhRBPPTUZJo0whV7o4AZmNGmG/x7OR
 au5CBigTxEDSPz7kNyqC3rn0gfoPscd6yRGGL12fbvlB06vAQqB9+6f7g
 +z6mcFRNgjKP23/UKWsQKoRjxsT4mTqXfFJqcYFVWm5GdCXjCFc1x3UiD Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330899562"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="330899562"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:19:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="696185509"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="696185509"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 03 Feb 2023 07:19:21 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Feb 2023 17:19:20 +0200
Date: Fri, 3 Feb 2023 17:19:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <Y90l+DY0rSaMvN1U@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
> 
> 
> On 2/3/23 07:59, Sebastian Wick wrote:
> > On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
> > <ville.syrjala@linux.intel.com> wrote:
> >>
> >> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
> >>> Userspace has no way of controlling or knowing the pixel encoding
> >>> currently, so there is no way for it to ever get the right values here.
> >>
> >> That applies to a lot of the other values as well (they are
> >> explicitly RGB or YCC). The idea was that this property sets the
> >> infoframe/MSA/SDP value exactly, and other properties should be
> >> added to for use userspace to control the pixel encoding/colorspace
> >> conversion(if desired, or userspace just makes sure to
> >> directly feed in correct kind of data).
> > 
> > I'm all for getting userspace control over pixel encoding but even
> > then the kernel always knows which pixel encoding is selected and
> > which InfoFrame has to be sent. Is there a reason why userspace would
> > want to control the variant explicitly to the wrong value?
> > 
> 
> I've asked this before but haven't seen an answer: Is there an existing
> upstream userspace project that makes use of this property (other than
> what Joshua is working on in gamescope right now)? That would help us
> understand the intent better.

The intent was to control the infoframe colorimetry bits,
nothing more. No idea what real userspace there was, if any.

> 
> I don't think giving userspace explicit control over the exact infoframe
> values is the right thing to do.

Only userspace knows what kind of data it's stuffing into
the pixels (and/or how it configures the csc units/etc.) to
generate them.

I really don't want a repeat of the disaster of the
'Broadcast RGB' which has coupled together the infoframe 
and automagic conversion stuff. And I think this one would
be about 100x worse given this property has something
to do with actual colorspaces as well.
 
-- 
Ville Syrjälä
Intel
