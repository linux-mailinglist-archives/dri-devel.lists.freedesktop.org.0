Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A3C6BDC8A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 00:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A1910E260;
	Thu, 16 Mar 2023 23:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A9E10E260;
 Thu, 16 Mar 2023 23:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679007703; x=1710543703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P/pZk6BCzDc2PW8q4pzRcxpSSF+DINCS1gbVzgLeImw=;
 b=dDU6ZD56GfQ4uQ0VHC6f0fqnt4cjhoFTjEMoQIZV8i8vSPVrVZJiN8hU
 CQAHjGUsmrMYDb8VqCqVV/w7BQFfDSGQGKKiE53GtYuNZzENbsucOFElu
 oALZqjQQiG3+VuKhg1CSAgzlfqwgNbQ0VKgJ5w5VEI73zxTTVJ3wfC7Vi
 x3x6PDkNpK5aILZjhwSHmlpETLvu8WAmVHcoSrRB3daZOgoBGr9zTn5dk
 Rf1otzWPrDTCLyXBlA/w9PgDvw4spIRLoYU6uhhXhgvahSvtjrDw4RtYY
 ybKAZb7D03opxZZAgCiXUYcmTJROWYnotw+UY/ZV28VI81k09R9uyFu6+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="424404490"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="424404490"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 16:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="682480746"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="682480746"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 16 Mar 2023 16:01:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Mar 2023 01:01:38 +0200
Date: Fri, 17 Mar 2023 01:01:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <ZBOf0m6W3ZWPy7nc@intel.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-10-harry.wentland@amd.com>
 <CA+hFU4yiniJdxWOxDKnD7bTGw3QA8uSLyG5sbeiQ5oWqitTZcQ@mail.gmail.com>
 <ZBLmYzVcnBgU6uo5@intel.com> <20230316120701.523bcb37@eldfell>
 <ZBLz17f8YFmNEJlY@intel.com> <20230316133449.26b62760@eldfell>
 <ZBMNEdYWsyfVq46p@intel.com>
 <CA+hFU4zWvm3-SSjtF17zjRnshEDw27gkQDLGZRk2AbnWN8+1Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+hFU4zWvm3-SSjtF17zjRnshEDw27gkQDLGZRk2AbnWN8+1Vg@mail.gmail.com>
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

On Thu, Mar 16, 2023 at 10:13:54PM +0100, Sebastian Wick wrote:
> On Thu, Mar 16, 2023 at 1:35 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Thu, Mar 16, 2023 at 01:34:49PM +0200, Pekka Paalanen wrote:
> > > On Thu, 16 Mar 2023 12:47:51 +0200
> > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > >
> > > > On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka Paalanen wrote:
> > > > > On Thu, 16 Mar 2023 11:50:27 +0200
> > > > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > > On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebastian Wick wrote:
> > > > > > > On Tue, Mar 7, 2023 at 4:12 PM Harry Wentland <harry.wentland@amd.com> wrote:
> > > > > > > >
> > > > > > > > We want compositors to be able to set the output
> > > > > > > > colorspace on DP and HDMI outputs, based on the
> > > > > > > > caps reported from the receiver via EDID.
> > > > > > >
> > > > > > > About that... The documentation says that user space has to check the
> > > > > > > EDID for what the sink actually supports. So whatever is in
> > > > > > > supported_colorspaces is just what the driver/hardware is able to set
> > > > > > > but doesn't actually indicate that the sink supports it.
> > > > > > >
> > > > > > > So the only way to enable bt2020 is by checking if the sink supports
> > > > > > > both RGB and YUV variants because both could be used by the driver.
> > > > > > > Not great at all. Something to remember for the new property.
> > > > > >
> > > > > > Hmm. I wonder if that's even legal... Looks like maybe it
> > > > > > is since I can't immediately spot anything in CTA-861 to
> > > > > > forbid it :/
> > > > >
> > > > > Wouldn't the driver do the same EDID check before choosing whether it
> > > > > uses RGB or YCbCr signalling?
> > > >
> > > > I suppose it could. The modeset would then fail, which is perhaps
> > >
> > > Could? What are they missing?
> >
> > The fact that the new property that also affects the rgb->ycbcr matrix
> > doesn't even exist?
> 
> I think the question was about the current Colorspace property.
> 
> > >
> > > I mean, drivers are already automatically choosing between RGB and YCbCr
> > > signalling based on e.g. available bandwidth. Surely they already will
> > > not attempt to send a signal format to a monitor that does not say it
> > > supports that?
> 
> That's exactly what they do. The drivers don't check the EDID for the
> colorimetry the sink supports and the responsibility is punted off to
> user space.
> 
> >
> > We just signal default/bt.709 colorimetry. There is nothing to
> > check for those IIRC.
> 
> You do support bt.2020, no?

Not for rgb->ycbcr conversion.

> 
> > >
> > > > not a huge issue, except maybe for suspend+resume if we fail in
> > > > the resume path. Although I guess the EDID/etc. should not yet
> > > > be refreshed at that point so if the modeset worked before suspend
> > > > resume should be able to restore it without failures.
> > >
> > > I assumed that if a monitor can be driven, and it supports any BT2020
> > > format, then it always supports the BT2020 format it is being driven
> > > in (RGB vs. YCbCr flavors). Bad assumption?
> >
> > I didn't spot any rule that both must be there. But didn't look
> > too hard either.
> 
> Didn't see anything like that either and I looked a bit harder as well.
> 
> >
> > --
> > Ville Syrjälä
> > Intel
> >

-- 
Ville Syrjälä
Intel
