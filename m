Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF9A847501
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D2E10ECA9;
	Fri,  2 Feb 2024 16:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rlf8nuL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADA910ECA9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 16:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706891881; x=1738427881;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DI+vowAp6HxEMoicKFi0dBorFyKWjCm9wzepkmTNs34=;
 b=Rlf8nuL2/pUUc1ynX6L/dm+ULfXUoVcOqJYE3v5mCcJxIH4TIb1bm1Pk
 vieyyh8ZQQLBZMT3Et41GR12sMib36KphAMkvrjHFyQ4hNgg1dcsmIFvC
 Oxq/gO/LpGfk/mTXmA6o91pIFswKpA1xdN00tcfmmSwEgx362/+m3Bf80
 JYcaMyB7EM88bT6Vk5KjcxzhZ8LzTGPRQPbiLirua5tofERGlzPHxEfo5
 T5j3aoHO1XTM8yCf0fwBUoR8T4f+5aGB244iGXhCCiJm9jldCR4aGuYOd
 T32hHfuD4Tvo3fhCK7nUHOq9tO+BeSak5KrMH0igiq+1WfDvzciTYcjfI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="355000"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="355000"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 08:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823251802"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823251802"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 08:37:53 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 02 Feb 2024 18:37:52 +0200
Date: Fri, 2 Feb 2024 18:37:52 +0200
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
Subject: Re: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB
 property
Message-ID: <Zb0aYAapkxQ2kopt@intel.com>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox> <20240115143720.GA160656@toolbox>
 <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
 <Zb0M_2093UwPXK8y@intel.com>
 <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
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

On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
> On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrjälä wrote:
> > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > > > > >  /**
> > > > > >   * DOC: HDMI connector properties
> > > > > >   *
> > > > > > + * Broadcast RGB
> > > > > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > > > > + *      Infoframes will be generated according to that value.
> > > > > > + *
> > > > > > + *      The value of this property can be one of the following:
> > > > > > + *
> > > > > > + *      Automatic:
> > > > > > + *              RGB Range is selected automatically based on the mode
> > > > > > + *              according to the HDMI specifications.
> > > > > > + *
> > > > > > + *      Full:
> > > > > > + *              Full RGB Range is forced.
> > > > > > + *
> > > > > > + *      Limited 16:235:
> > > > > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > > > > + *              this works for any number of bits-per-component.
> > > > > > + *
> > > > > > + *      Drivers can set up this property by calling
> > > > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > > > + *
> > > > > 
> > > > > This is a good time to document this in more detail. There might be two
> > > > > different things being affected:
> > > > > 
> > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > 2. The color pipeline processing
> > > > > 
> > > > > All values of Broadcast RGB always affect the color pipeline processing
> > > > > such that a full-range input to the CRTC is converted to either full- or
> > > > > limited-range, depending on what the monitor is supposed to accept.
> > > > > 
> > > > > When automatic is selected, does that mean that there is no signalling,
> > > > > or that the signalling matches what the monitor is supposed to accept
> > > > > according to the spec? Also, is this really HDMI specific?
> > > > > 
> > > > > When full or limited is selected and the monitor doesn't support the
> > > > > signalling, what happens?
> > > > 
> > > > Forgot to mention: user-space still has no control over RGB vs YCbCr on
> > > > the cable, so is this only affecting RGB? If not, how does it affect
> > > > YCbCr?
> > > 
> > > So I dug a bit into both the i915 and vc4 drivers, and it looks like if
> > > we're using a YCbCr format, i915 will always use a limited range while
> > > vc4 will follow the value of the property.
> > 
> > The property is literally called "Broadcast *RGB*".
> > That should explain why it's only affecting RGB.
> 
> Right. And the limited range option is called "Limited 16:235" despite
> being usable on bpc > 8 bits. Naming errors occurs, and history happens
> to make names inconsistent too, that's fine and not an argument in
> itself.
> 
> > Full range YCbCr is a much rarer beast so we've never bothered
> > to enable it.
> 
> vc4 supports it.

Someone implemented it incorrectly then.

> 
> > Eg. with DP it only became possible with the introduction of the VSC
> > SDP (and I don't recall if there's additional capability checks that
> > are also required). With DP MSA signalling full range YCbCr is not
> > possible at all.
> 
> This is for HDMI only.
> 
> > I don't recall right now what the HDMI requirements are.
> 
> HDMI has supported it for a while, and it's defined (for example) in the
> HDMI 1.4 spec in Section 6.6 - Video Quantization Ranges. It supports
> limited and full range on both RGB and YCbCr, as long as the EDIDs state
> so and the Infoframes signal it.

I think a good reason for not using a simple boolean like this 
YCbCr is that it doesn't cover the color encoding part at all,
which is probably more important than the quantization range.
So we need a new property anyway.

-- 
Ville Syrjälä
Intel
