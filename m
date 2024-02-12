Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BEA851868
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 16:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E3210E1B1;
	Mon, 12 Feb 2024 15:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RL/orzrv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B0710E1B1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707752981; x=1739288981;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RaXsYzelOZvoa5TGyCbteu+6xy/YY/Aun1Nfajjsacg=;
 b=RL/orzrvXlqP8EY6ifNpMwHX3cEJNtJuK/rutdRdI4jrO8VHkR7EQEZf
 Mvzn3G16FLqHQ8jaBCJXBWFWonJ9LR/gNdJIPR14Bax0VgEsCj9b7XYnM
 DTFsseEYqzQu7JYygZC0eDfkAE36OLXd5XgJ3Wm093Z7rtqdxNXLMPLYQ
 fA+pNtGSm+EEuTwNT9KV1QSr3lCcr9bgJEnvoCca+bxJaELpSIhs+Sala
 V+IeKWeLEGi98hP1pwONlh/12H3yMjjkmbR7g4jXmjQJAEaKOEOS/2a+u
 ++UyyZtU7oWJ3KtKUeM/yjZq6kvfWuXvCP3DaXqEVT6YVpaFRPU/9rXdq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="24202750"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="24202750"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:49:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="825840546"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="825840546"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 12 Feb 2024 07:49:34 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 12 Feb 2024 17:49:33 +0200
Date: Mon, 12 Feb 2024 17:49:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: Re: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add
 Broadcast RGB property
Message-ID: <Zco-DQaXqae7B1jt@intel.com>
References: <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox> <20240115143720.GA160656@toolbox>
 <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
 <Zb0M_2093UwPXK8y@intel.com>
 <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
 <Zb0aYAapkxQ2kopt@intel.com>
 <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
> On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wrote:
> > On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
> > > On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrjälä wrote:
> > > > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
> > > > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrjälä wrote:
> > > > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > > > > > > > > >  /**
> > > > > > > > > >   * DOC: HDMI connector properties
> > > > > > > > > >   *
> > > > > > > > > > + * Broadcast RGB
> > > > > > > > > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > > > > > > > > + *      Infoframes will be generated according to that value.
> > > > > > > > > > + *
> > > > > > > > > > + *      The value of this property can be one of the following:
> > > > > > > > > > + *
> > > > > > > > > > + *      Automatic:
> > > > > > > > > > + *              RGB Range is selected automatically based on the mode
> > > > > > > > > > + *              according to the HDMI specifications.
> > > > > > > > > > + *
> > > > > > > > > > + *      Full:
> > > > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > > > + *
> > > > > > > > > > + *      Limited 16:235:
> > > > > > > > > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > > > > > > > > + *              this works for any number of bits-per-component.
> > > > > > > > > > + *
> > > > > > > > > > + *      Drivers can set up this property by calling
> > > > > > > > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > > > > > > > + *
> > > > > > > > > 
> > > > > > > > > This is a good time to document this in more detail. There might be two
> > > > > > > > > different things being affected:
> > > > > > > > > 
> > > > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > > > 2. The color pipeline processing
> > > > > > > > > 
> > > > > > > > > All values of Broadcast RGB always affect the color pipeline processing
> > > > > > > > > such that a full-range input to the CRTC is converted to either full- or
> > > > > > > > > limited-range, depending on what the monitor is supposed to accept.
> > > > > > > > > 
> > > > > > > > > When automatic is selected, does that mean that there is no signalling,
> > > > > > > > > or that the signalling matches what the monitor is supposed to accept
> > > > > > > > > according to the spec? Also, is this really HDMI specific?
> > > > > > > > > 
> > > > > > > > > When full or limited is selected and the monitor doesn't support the
> > > > > > > > > signalling, what happens?
> > > > > > > > 
> > > > > > > > Forgot to mention: user-space still has no control over RGB vs YCbCr on
> > > > > > > > the cable, so is this only affecting RGB? If not, how does it affect
> > > > > > > > YCbCr?
> > > > > > > 
> > > > > > > So I dug a bit into both the i915 and vc4 drivers, and it looks like if
> > > > > > > we're using a YCbCr format, i915 will always use a limited range while
> > > > > > > vc4 will follow the value of the property.
> > > > > > 
> > > > > > The property is literally called "Broadcast *RGB*".
> > > > > > That should explain why it's only affecting RGB.
> > > > > 
> > > > > Right. And the limited range option is called "Limited 16:235" despite
> > > > > being usable on bpc > 8 bits. Naming errors occurs, and history happens
> > > > > to make names inconsistent too, that's fine and not an argument in
> > > > > itself.
> > > > > 
> > > > > > Full range YCbCr is a much rarer beast so we've never bothered
> > > > > > to enable it.
> > > > > 
> > > > > vc4 supports it.
> > > > 
> > > > Someone implemented it incorrectly then.
> > > 
> > > Incorrectly according to what documentation / specification? I'm sorry,
> > > but I find it super ironic that i915 gets to do its own thing, not
> > > document any of it, and when people try to clean things up they get told
> > > that we got it all wrong.
> > 
> > FWIW, this was an i915 property and if another driver uses the same
> > property name it must have the same behavior. Yes, it isn't standardized
> > and yes, it's not documented (hence this effort here) but it's still on
> > vc4 to make the property compatible.
> 
> How is it not compatible? It's a superset of what i915 provides, but
> it's strictly compatible with it.

No it is not. Eg. what happens if you set the thing to full range for
RGB (which you must on many broken monitors), and then the kernel
automagically switches to YCbCr (for whatever reason) but the monitor
doesn't support full range YCbCr? Answer: you get crap output.

> 
> I would argue that i915 is the broken one since userspace could force a
> full range output, but since the driver takes the YUV vs RGB decision
> itself and only supports limited range for YUV, the driver would
> effectively ignore that user-space property, without the user-space
> being able to tell it was ignored in the first place.
> 
> > Trying to make the property handle YCbCr is very much in the "let's try
> > to fix the property" territory that I want to avoid, so I'm in favor of
> > adjusting vc4.
> 
> Breaking the ABI in the process. For something that is explicitly
> supported by the spec, the driver, and the hardware. On a property that
> never said it wasn't meant to be used that way, and with semantics based
> on a driver that never provided a way to check those restrictions in the
> first place.
> 
> And it's not like i915 is going to use that code anyway.
> 
> Maxime



-- 
Ville Syrjälä
Intel
